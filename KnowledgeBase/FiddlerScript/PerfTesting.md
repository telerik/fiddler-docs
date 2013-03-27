---
title: Performance Testing
slug: PerfTesting
tags: Knowledge Base, FiddlerScript, OnBeforeRequest, OnBeforeResponse, modem, cache, time to last byte, time to first byte, CopyTimers
publish: true
ordinal: 2
---

Performance Testing
===================

To test application performance, [add rules][1] using FiddlerScript to the **OnBeforeResponse** function (except where noted). For example:

* * *

**Simulate modem uploads** 
(add to **OnBeforeRequest** function)

		// Delay sends by 300ms per KB uploaded.
		oSession["request-trickle-delay"] = "300";

* * *

**Simulate modem downloads**

		// Delay receives by 150ms per KB downloaded.
		oSession["response-trickle-delay"] = "150";

* * *

**Flag content which isn't set to cache on the client.**

		if (!(oSession.oResponse.headers.Exists("Expires") 
		|| (oSession.oResponse.headers.ExistsAndContains("Cache-Control", "age")))
		|| (oSession.oResponse.headers.Exists("Vary"))){
		{
		oSession["ui-color"]="brown"; // Use C# color strings here.
		oSession["ui-italic"]="true"; 
		}

* * *

**Display in the "Custom Column" the number of milliseconds from the moment of the request until the last byte was received.**

		oSession["ui-customcolumn"] = oSession["X-TTLB"];

* * *

**Display the # of milliseconds until the First Byte was received from the server, followed by the # of ms until the Last Byte.**

		oSession["ui-customcolumn"] = "FB: " + oSession["X-TTFB"] + "; LB: " + oSession["X-TTLB"];

* * *

**Add a CopyTimers context menu item to the Session List**
(Scope is **Global**)

		public static ContextAction("CopyTimers")
		function CopyTimers(oSessions: Fiddler.Session[]){
		  if (null == oSessions){
			MessageBox.Show("Please select sessions to copy timers for.", "Nothing to Do");
			return;
		  }

		  var s: System.Text.StringBuilder = new System.Text.StringBuilder();

		  for (var x = 0; x < oSessions.Length; x++)  {
			s.AppendFormat("{0}, {1}, {2}, {3}, {4}, {5}, {6}, {7}\r\n",
			oSessions[x].Timers.ClientConnected,
			oSessions[x].Timers.ClientDoneRequest,
			oSessions[x].Timers.ServerConnected,
			oSessions[x].Timers.ServerGotRequest,
			oSessions[x].Timers.ServerBeginResponse,
			oSessions[x].Timers.ServerDoneResponse,
			oSessions[x].Timers.ClientBeginResponse,
			oSessions[x].Timers.ClientDoneResponse
			);
		  }
		  Utilities.CopyToClipboard(s.ToString());
		  MessageBox.Show("Done.");
		}

* * *

[1]: ../../Extend-Fiddler/AddRules
