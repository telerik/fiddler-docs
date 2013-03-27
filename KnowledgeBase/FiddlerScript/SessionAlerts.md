---
title: Session Alerts
slug: SessionAlerts
tags: Knowledge Base, FiddlerScript, sound, message box
publish: true
ordinal: 6
---

Session Alerts
==============

To create alerts for specific sessions, [add rules][1] using FiddlerScript. For example:

* * *

**Play a sound when a file is missing.**
(in **OnBeforeResponse**)

Note: the name "Notify" is a standard Windows system sound entry.

		if (oSession.responseCode == 404){
			FiddlerObject.playSound("Notify");
			oSession["ui-strikeout"]="true"; 
		}

* * *

**Show HTTP POST bodies in a messagebox**
(in **OnBeforeRequest**)

		var oBodyString = System.Text.Encoding.UTF8.GetString(oSession.requestBodyBytes);

		if (oBodyString.Length > 0) FiddlerObject.alert(oBodyString);

* * *
[1]: ../../Extend-Fiddler/AddRules
