---
title: Search Sequential Pages for Target String 
slug: SearchSequentialPages
tags: Generate Traffic, FiddlerScript, Simulate traffic, sequential pages, utilIssueRequest, utilFindInResponse
publish: true
position: 8
---

Search Sequential Pages for Target String
=========================================

To search for a target string on a series of successively named HTML pages (for example, to find the first page containing "TargetString" from 1.htm, 2.htm, 3.htm, 4.htm, etc.), [add rules to Fiddler][1] as follows:

1. Add a rule to Fiddler with Global scope to create a new menu item as follows:

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

  This will generate the first request. Note: Because the **utilIssueRequest** call is asynchronous, you don't get the response directly.

2. Add a rule to Fiddler in the **OnBeforeResponse** function as follows:

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
		  try{ 
			// Make a recursive HTTP request for the next item.
			FiddlerObject.utilIssueRequest(s); 
		  } 
		  catch(e){ 
			 MessageBox.Show("send failed" + e.ToString()); 
		  } 
		  } 
		}


[1]: ../../Extend-Fiddler/AddRules