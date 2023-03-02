---
title: Customize Web Sessions List
slug: CustomizeSessionsList
publish: true
position: 4
res_type: kb
---

Customize Web Sessions List
===========================

To customize Fiddler's **Web Sessions List**, [add rules][1] using FiddlerScript to the **OnBeforeRequest** function (except where noted). For example:



**Display in the "Custom Column" the time of the original request**

		oSession["ui-customcolumn"] += DateTime.Now.ToString("h:mm:ss.ffff ");



**Show any Set-Cookie headers in Custom column in Session list.**
(in **OnBeforeResponse**)

		oSession["ui-customcolumn"] = oSession.oResponse["Set-Cookie"];



**Mark any requests which send cookies in red, and show the value in the Custom column. Otherwise, mark request in green.**

		if (oSession.oRequest.headers.Exists("Cookie")) 
		{
		oSession["ui-color"]="red";
		oSession["ui-customcolumn"] = oSession.oRequest["Cookie"];
		}
		else
		oSession["ui-color"]="green";



**Hide requests for .GIFs from the session list**

		if (oSession.url.EndsWith(".gif")){
			oSession["ui-hide"]="hiding image requests";  //String value not important
		}



**Hide completed responses which returned images**
(in **OnBeforeResponse**)

		if (oSession.oResponse.headers.ExistsAndContains("Content-Type", "image/")) {
			oSession["ui-hide"] = "hiding images"; // String value not important
		}



**Hide requests to domains except those I care about**

		if (!oSession.HostnameIs("domainIcareabout.com")){
			oSession["ui-hide"] = "hiding boring domains"; // String value not important
		}



**Unhide any response which returned a 404**
(in **OnBeforeResponse**)

		if (oSession.responseCode == 404){
			oSession.oFlags.Remove("ui-hide");
		}



**Flag all pages in which the server sends a cookie**
(in **OnBeforeResponse**)

		if (oSession.oResponse.headers.Exists("Set-Cookie") {
			oSession.utilDecodeResponse();
			if (oSession.utilFindInResponse("document.cookie", false)>-1 ||
				oSession.utilFindInResponse('HTTP-EQUIV="Set-Cookie"', false)>-1) {
				oSession["ui-color"]="purple"; 
		}



**Show redirection target Location in Session List**
(In **OnBeforeResponse**)

		if ((oSession.responseCode > 299) && (oSession.responseCode < 308)){ 
			oSession["ui-customcolumn"] = oSession.oResponse["Location"];
		}



**Add image size information in a column.**
(**Global** scope)
Note: you must add System.drawing.dll inside **Tools > Options > Extensions > References**.

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



**Search all text responses for a list of strings and flag sessions**
(in **OnBeforeRequest**)

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

[1]: ../../Extend-Fiddler/AddRules