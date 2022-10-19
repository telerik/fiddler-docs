---
title: HTTPS Connections Timeout with Decryption Enabled
description: Customize Fiddler Rules to force SSLv3 handshake
slug: HTTPSTimeout
publish: true
position: 8
---

HTTPS Connections Timeout with Decryption Enabled
=================================================

Problem: Client Application Cannot Reach HTTPS Site when Fiddler Classic is configured to decrypt HTTPS traffic.
--------------------------------------------------------------------------------------------------------

This issue occurs on Windows Vista or later.

Solution 1: Customize Fiddler Classic Rules to force SSLv3 handshake
------------------------------------------------------------

1. Click **Rules > Customize Rules**.

2. Add this code to the **OnBeforeRequest** method (where "HTTPSsite.com" is the hostname of the destination server):

		if (oSession.HTTPMethodIs("CONNECT") && oSession.HostnameIs("HTTPSSite.com")) 
		{ 
		  oSession["x-OverrideSslProtocols"] = "ssl3"; 
		  FiddlerApplication.Log.LogString("Legacy compat applied for inbound request to HTTPSSite.com"); 
		}

Solution 2: Modify .NET application to force SSLv3 handshake
------------------------------------------------------------

Use this code in your .NET application:

		ServicePointManager.SecurityProtocol = SecurityProtocolType.Ssl3;

See Also
--------

["How do you get a System.Web.HttpWebRequest object to use SSL 2.0?" at stackoverflow.com][1]

[1]: https://stackoverflow.com/questions/169222/how-do-you-get-a-system-web-httpwebrequest-object-to-use-ssl-2-0/169396#169396
