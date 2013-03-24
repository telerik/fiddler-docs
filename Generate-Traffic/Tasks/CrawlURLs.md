---
title: Crawl Sequential URLs
slug: CrawlURLs
tags: Generate Traffic, FiddlerScript, Simulate traffic, utilIssueRequest
publish: true
ordinal: 7
---

Crawl Sequential URLs
=====================

[Add a rule to Fiddler][1] with Global scope as follows:

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

[1]: ../../ExtendFiddler/AddRules.md