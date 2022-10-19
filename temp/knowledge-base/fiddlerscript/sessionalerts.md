---
title: Session Alerts
slug: SessionAlerts
publish: true
position: 6
res_type: kb
---

Session Alerts
==============

To create alerts for specific sessions, [add rules][1] using FiddlerScript. For example:



**Play a sound when a file is missing.**
(in **OnBeforeResponse**)

        if (oSession.responseCode == 404){
            FiddlerObject.playSound("C:\\windows\\media\\ding.wav");
            oSession["ui-strikeout"]="true"; 
        }

**Show HTTP POST bodies in a messagebox**
(in **OnBeforeRequest**)

        var oBodyString = oSession.GetRequestBodyAsString();

        if (oBodyString.Length > 0) FiddlerObject.alert(oBodyString);

[1]: ../../Extend-Fiddler/AddRules
