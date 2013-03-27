---
title: Office clients don't authenticate
slug: NoOfficeWinHTTPAuth
tags: Configuration, Troubleshooting, Office, WinHTTP, Auth, Authentication
publish: true
ordinal: 6
---

Problem: Office clients using WinHTTP do not properly authenticate while running Fiddler
----------------------------------------------------------------------------------------

Solution 1: 
-----------

[Configure Fiddler to Authenticate to the Server][1]

Solution 2: 
-----------

[Change **AuthFowardServerList** with REGEDIT][2]

[1]: ../AuthenticateWithCBT 
[2]: http://support.microsoft.com/kb/956943
