<!-- http://www.fiddler2.com/Fiddler/dev/ScriptSamples.asp -->

#Goal: Modify Request or Response

##Add a request header
Update the **OnBeforeRequest** function.

	oSession.oRequest["NewHeaderName"] = "New header value";
	
##Delete a response header
Update the **OnBeforeRequest** function.

	oSession.oResponse.headers.Remove("Set-Cookie");

##Change a request for one page to a different page on the same server
Update the **OnBeforeRequest** function.

	if (oSession.PathAndQuery=="/version1.css") {
		oSession.PathAndQuery="/version2.css";
	}	
	
##Point all requests for one server to the same port on a different server
Update the **OnBeforeRequest** function.

	if (oSession.HostnameIs("www.bayden.com")) {
		oSession.hostname="test.bayden.com";
	}

##Point all requests for one port to a different port on a different server
Update the **OnBeforeRequest** function.

	if (oSession.host=="www.bayden.com:8080") {
		oSession.host="test.bayden.com:9090";
	}	

##Point all requests for one server to a different server, including HTTPS tunnels
Update the **OnBeforeRequest** function.

	// Redirect traffic, including HTTPS tunnels
	if (oSession.HTTPMethodIs("CONNECT") && (oSession.PathAndQuery == "www.example.com:443")) { 
		oSession.PathAndQuery = "beta.example.com:443"; 
	}

	if (oSession.HostnameIs("www.example.com")) oSession.hostname = "beta.example.com";
	
##Simulate the Windows HOSTS file, by pointing one Hostname to a different IP address. (Retargets without changing the request's Host header)	
Update the **OnBeforeRequest** function.
	
	// All requests for subdomain.example.com should be directed to the development server at 128.123.133.123
	if (oSession.HostnameIs("subdomain.example.com")){
		oSession.bypassGateway = true;                   // Prevent this request from going through an upstream proxy
		oSession["x-overrideHost"] = "128.123.133.123";  // DNS name or IP address of target server
	}

##Retarget requests for a single page to a different page, potentially on  a different server. 
Update the **OnBeforeRequest** function.

	(Retargets by changing the request's Host header)	if (oSession.url=="www.example.com/live.js") {
	oSession.url = "dev.example.com/workinprogress.js";
	}	

##Prevent upload of HTTP Cookies
Update the **OnBeforeRequest** function.

	oSession.oRequest.headers.Remove("Cookie");	

##Decompress and unchunk a HTTP response, updating headers if needed
Update the **OnBeforeResponse** function.

	// Remove any compression or chunking from the response in order to make it easier to manipulate
	oSession.utilDecodeResponse();

##Search and replace in HTML.
Update the **OnBeforeResponse** function.

	if (oSession.HostnameIs("www.bayden.com") && oSession.oResponse.headers.ExistsAndContains("Content-Type","text/html")){
		oSession.utilDecodeResponse();
		oSession.utilReplaceInResponse('<b>','<u>');
	}
	
##Case insensitive Search of response HTML.
Update the **OnBeforeResponse** function.

	if (oSession.oResponse.headers.ExistsAndContains("Content-Type", "text/html") && oSession.utilFindInResponse("searchfor", false)>-1){
		oSession["ui-color"] = "red";
	}
	
##Remove all DIV tags (and content inside the DIV tag)
Update the **OnBeforeResponse** function.

	// If content-type is HTML, then remove all DIV tags
	if (oSession.oResponse.headers.ExistsAndContains("Content-Type", "html")){
		// Remove any compression or chunking
		oSession.utilDecodeResponse();
		var oBody = System.Text.Encoding.UTF8.GetString(oSession.responseBodyBytes);

		// Replace all instances of the DIV tag with an empty string
		var oRegEx = /<div[^>]*>(.*?)<\/div>/gi;
		oBody = oBody.replace(oRegEx, "");

		// Set the response body to the div-less string
		oSession.utilSetResponseBody(oBody); 
	}

##Pretend your browser is the GoogleBot webcrawler	
Update the **OnBeforeRequest** function.

	oSession.oRequest["User-Agent"]="Googlebot/2.X (+http://www.googlebot.com/bot.html)";

##Request Hebrew content	
Update the **OnBeforeRequest** function.

	oSession.oRequest["Accept-Language"]="he";	

##Deny .CSS requests	
Update the **OnBeforeRequest** function.

	if (oSession.uriContains(".css")){
		oSession["ui-color"]="orange"; 
		oSession["ui-bold"]="true";
		oSession.oRequest.FailSession(404, "Blocked", "Fiddler blocked CSS file");
	}	

##Simulate HTTP Basic authentication  (Requires user to enter a password before displaying web content.)
Update the **OnBeforeResponse** function.

	if ((oSession.HostnameIs("www.example.com")) && !oSession.oRequest.headers.Exists("Authorization")) {
		// Prevent IE's "Friendly Errors Messages" from hiding the error message by making response body longer than 512 chars.
		var oBody = "<html><body>[Fiddler] Authentication Required.<BR>".PadRight(512, ' ') + "</body></html>";
		oSession.utilSetResponseBody(oBody); 
		// Build up the headers
		oSession.oResponse.headers.HTTPResponseCode = 401;
		oSession.oResponse.headers.HTTPResponseStatus = "401 Auth Required";
		oSession.oResponse["WWW-Authenticate"] = "Basic realm=\"Fiddler (just hit Ok)\"";
		oResponse.headers.Add("Content-Type", "text/html");
	}	

##Respond to a request with a file loaded from the \Captures\Responses folder
Update the **OnBeforeRequest** function or the **OnBeforeResponse** function.

	if (oSession.PathAndQuery=="/version1.css") {
		oSession["x-replywithfile"] ="version2.css";
	}