---
title: Office clients don't authenticate
slug: NoOfficeWinHTTPAuth
publish: true
position: 6
---

Problem: Office clients using WinHTTP do not properly authenticate while running Fiddler Classic
----------------------------------------------------------------------------------------

Solution 1: 
-----------

[Configure Fiddler Classic to Authenticate to the Server][1]

Solution 2: 
-----------

[Change **AuthFowardServerList** with REGEDIT][2]

[1]: ../Tasks/AuthenticateWithCBT 
[2]: http://support.microsoft.com/kb/956943
