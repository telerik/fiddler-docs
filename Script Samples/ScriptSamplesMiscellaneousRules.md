<!-- http://www.fiddler2.com/Fiddler/dev/ScriptSamples.asp -->

#Miscellaneous rules

##Display in the "Custom Column" the time of the original request
Updated in the **onBeforeRequest** function.

	 oSession["ui-customcolumn"] += DateTime.Now.ToString("h:mm:ss.ffff ");	
	
##Show any Set-Cookie headers in Custom column in Session list.
Updated in the **OnBeforeResponse** function.

	oSession["ui-customcolumn"] = oSession.oResponse["Set-Cookie"];	 
	
##Mark any requests which send cookies in red, and show the value in the Custom column.  Otherwise, mark request in green.
Updated in the **OnBeforeRequest** function.

	if (oSession.oRequest.headers.Exists("Cookie")) {
		oSession["ui-color"]="red";
		oSession["ui-customcolumn"] = oSession.oRequest["Cookie"];
	}
	else
		oSession["ui-color"]="green";
		
##Hide requests for .GIFs from the session list	
Updated in the **OnBeforeRequest** function.

	if (oSession.url.EndsWith(".gif")){
		oSession["ui-hide"]="hiding image requests";  //String value not important
	}

##Hide completed responses which returned images
Updated in the **OnBeforeResponse** function.

	if (oSession.oResponse.headers.ExistsAndContains("Content-Type", "image/")) {
		oSession["ui-hide"] = "hiding images"; // String value not important
	}

##Hide requests to domains except those I care about	
Updated in the **OnBeforeRequest** function.

	if (!oSession.HostnameIs("domainIcareabout.com")){
		oSession["ui-hide"] = "hiding boring domains"; // String value not important
	}

##Unhide any response which returned a 404
Updated in the **OnBeforeResponse** function.

	if (oSession.responseCode == 404){
		oSession.oFlags.Remove("ui-hide");
	}
	
##Play a sound when a file is missing.  Note the name "Notify" is a standard Windows system sound entry.	
Updated in the **OnBeforeResponse** function.

	if (oSession.responseCode == 404){
		FiddlerObject.playSound("Notify");
		oSession["ui-strikeout"]="true"; 
	}

##Show HTTP POST bodies in a messagebox	
Updated in the **OnBeforeRequest** function.

	var oBodyString = System.Text.Encoding.UTF8.GetString(oSession.requestBodyBytes);
	if (oBodyString.Length > 0) FiddlerObject.alert(oBodyString);

##Flag all pages in which the server sends a cookie	
Updated in the **OnBeforeResponse** function.

	if (oSession.oResponse.headers.Exists("Set-Cookie") ||
	  oSession.utilDecodeResponse();
	  oSession.utilFindInResponse("document.cookie", false)>-1 ||
	  oSession.utilFindInResponse('HTTP-EQUIV="Set-Cookie"', false)>-1){
	  oSession["ui-color"]="purple"; 
	}

##Pause all HTTP POSTs to allow hand-editing (the POST verb is often used for submitting forms)
Updated in the **OnBeforeRequest** function.

	if (oSession.HTTPMethodIs("POST")){
	  oSession["x-breakrequest"]="breaking for POST";
	}
	
##Pause all HTTP POSTs that contain the keyword	
Updated in the **OnBeforeRequest** function.

	if (oSession.HTTPMethodIs("POST") && (oSession.utilFindInRequest("thekeyword", true) > -1)){
		oSession["x-breakrequest"] = "keyword";
	}

##Pause a request for an XML file to allow hand-editing
Updated in the **OnBeforeRequest** function

	if (oSession.url.toLowerCase().indexOf(".xml")>-1){
		oSession["x-breakrequest"]="reason_XML"; 
	}	
	
##Pause a response containing JavaScript to allow hand-editing
Updated in the **OnBeforeResponse** function.

	if (oSession.oResponse.headers.ExistsAndContains("Content-Type", "javascript")){
		oSession["x-breakresponse"]="reason is JScript"; 
	}
	
##Crawl Sequential URLs	
Updated in **Global scope**.

	public static ToolsAction("Crawl Sequential URLs") 
	
	function doCrawl(){ 
		  var sBase: String;
		  var sInt: String;

		  sBase = FiddlerObject.prompt("Enter base URL with ## in place of the start integer", "http://www.example.com/img##.jpg");
		  sInt = FiddlerObject.prompt("Start At", "1");
		  var iFirst = int.Parse(sInt);
		  sInt = FiddlerObject.prompt("End At", "12");
		  var iLast = int.Parse(sInt);

		  for (var x=iFirst; x<=iLast; x++)
		  {
			//Replace 's' with your HTTP Request. Note: \ is a special character in JScript
			// If you want to represent a backslash in a string constant, double it like \\ 
			var s = "GET " + sBase.Replace("##", x.ToString()) + " HTTP/1.0\r\n\r\n"; 
			var b=false;
			while(!b){
			try{
			  FiddlerObject.utilIssueRequest(s);
			  b=true;
			}
			catch(e){
			  var iT = Environment.TickCount + 10000;
			  FiddlerObject.StatusText = "Waiting 10 sec because we have too many requests outstanding...";
			  while (iT > Environment.TickCount){ Application.DoEvents(); }
			  } 
			}
		  }
		}

##Log sessions to a local database	
Updated in **Global scope**.

Note: The following example relies upon OLEDB 4.0 which is not available for 64bit processes. You can either select another data provider (e.g. SQLServer) or you can force Fiddler to run in 32bit mode.

Add the following to the Rules file to create a new menu item.

	// Log the currently selected sessions in the list to a database.
	// Note: The DB must already exist and you must have permissions to write to it.
	public static ToolsAction("Log Selected Sessions") 
	function DoLogSessions(oSessions: Fiddler.Session[]){
		if (null == oSessions || oSessions.Length < 1){
		  MessageBox.Show("Please select some sessions first!");
		  return;
		}
		var strMDB = "C:\\log.mdb";
		var cnn = null;
		var sdr = null;
		var cmd = null;
		try
		{
		  cnn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + strMDB);
		  cnn.Open();
		  cmd = new OleDbCommand();
		  cmd.Connection = cnn;

		  for (var x = 0; x < oSessions.Length; x++){
			var strSQL = "INSERT into tblSessions ([ResponseCode],[URL]) Values (" + 
			oSessions[x].responseCode + ", '" + oSessions[x].url + "')";
			cmd.CommandText = strSQL;
			cmd.ExecuteNonQuery();
		  }
		}
		catch (ex){
		  MessageBox.Show(ex);
		}
		finally
		{
		  if (cnn != null ){
			cnn.Close();
		  }
		}
	}

Note: To use the Database Objects in Fiddler 2.3.9 and below, you'll need to add system.data to the References list inside **Tools | Fiddler Options | Extensions | Scripting**. In 2.3.9.1 and later, this reference will occur automatically.

Then, list the new import at the top of your rules script:

	import System.Data.OleDb;

##Search for a target string on a series of successively named HTML pages (e.g. find first page containing "TargetString" from 1.htm, 2.htm, 3.htm, 4.htm, etc).	
Updated in **Global scope** and the **onBeforeResponse** function.

Add the following to the Rules file to create a new menu item.
	
	public static ToolsAction("Find page containing search string") 
	function doGrab(){ 
	  var s = "GET /gallery/image1.htm HTTP/1.1\r\nHost: www.example.com\r\nX-My-Num: 1\r\n\r\n"; 
	  try{ 
		FiddlerObject.utilIssueRequest(s); 
	  } 
	  catch(e){ 
		MessageBox.Show("send failed" + e.ToString()); 
	  } 
	}

Now, this will make the first request. The trick is that you really want to look at the **result** of that request. This is sorta tricky because the **utilIssueRequest** call is asynchronous, and so you don't get the response directly.
But, remember that Fiddler rules run on each response, so you can then put code in the **OnBeforeResponse** handler that looks like...

	if (oSession.oRequest.headers.Exists("X-My-Num")){ 
	  // This is a response to my Grab code... 
	  if (oSession.utilFindInResponse("targetstring", false) > -1){ 
	   // If the index of the target string is >-1, we found the search string...  
	   MessageBox.Show("Found target string!");
	  } 
	  else 
	  { 
	  //didn't find the target string.  increment the number. 
	  var n = int.parse(oSession.oRequest["X-My-Num"]); 
	  n++; 
	  var s = "GET /gallery/image" + n.ToString() + ".htm HTTP/1.1\r\nHost: http://www.example.com\r\nX-My-Num: "+ n.ToString() + "\r\n\r\n"; 
	  try { 
		// Make a recursive HTTP request for the next item.
		FiddlerObject.utilIssueRequest(s); 
	  } 
	  catch(e){ 
			 MessageBox.Show("send failed" + e.ToString()); 
		  } 
	  } 
	}

##Save selected response files to disk in the Fiddler Captures folder (useful for copying online photo albums).
Updated in the **Global scope**.
	
	public static ContextAction("Dump Files")
	function DoDumpFiles(oSessions: Fiddler.Session[]){
	  if (null == oSessions){
		MessageBox.Show("Please select sessions to dump.", "Nothing to Do");
		return;
	  }

	  for (var x = 0; x < oSessions.Length; x++){
		oSessions[x].SaveResponseBody();
	  }
	  MessageBox.Show("Done.");
	}	
	
##Search all text responses for a list of strings.	
Updated in the **OnBeforeRequest** function.

	oSession.utilDecodeResponse();

	// Create a array of strings we're looking for.
	var oFindStrings = new Array( "XMLHttp", "onreadystatechange", "readyState", "responseBody", "responseText", "responseXML", "statusText", "abort", "getAllResponseHeaders", "getResponseHeader", "setRequestHeader");

	// For each target string, check the response to see if it's present.
	var iEach=0;

	oSession["ui-customcolumn"]=String.Empty;

	for (iEach; iEach<oFindStrings.length; iEach++){
		if (oSession.utilFindInResponse(oFindStrings[iEach], false)>0) { 
		  oSession["ui-color"]="purple"; 
		  oSession["ui-customcolumn"] += oFindStrings[iEach]+"; "; 
		}
	}

##Bypass the upstream proxy for all requests to a certain domain (E.g. Emulate the IE Proxy bypass list)
Updated in the **OnBeforeRequest** function.

	if (oSession.HostnameIs("www.example.com")){
		oSession.bypassGateway = true;
	}	
		
##Show redirection target Location in Session List	
Updated in teh **OnBeforeResponse** function.	
	
	if ((oSession.responseCode > 299) && (oSession.responseCode < 308)){ 
			oSession["ui-customcolumn"] = oSession.oResponse["Location"];
	}

##Add image size information in a column.
Updated in the **Global scope**.

Note: you must add System.drawing.dll inside **Tools > Fiddler Options > Extensions > References**	
       
	public static BindUIColumn("ImageSize", 60)
	function FillImageSizeColumn(oS: Session){
	 if ((oS.oResponse != null) && (oS.oResponse.headers != null))
	 {
	   try{
		  if (!oS.oResponse.headers.ExistsAndContains("Content-Type", "image/")) return "NotAnImage";

		  var oMS: System.IO.MemoryStream = new System.IO.MemoryStream(oS.responseBodyBytes);
		  var i:System.Drawing.Bitmap = new System.Drawing.Bitmap(oMS);
		  return (i.Width + " x " + i.Height);
		  }
		  catch(e) { return "err"; }
	   }
	 return String.Empty;
	}