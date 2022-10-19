---
title: Decrypt HTTPS traffic
description: Configure Fiddler Classic to decrypt HTTPS traffic
slug: DecryptHTTPS
publish: true
position: 3
---

Configure Fiddler Classic to Decrypt HTTPS Traffic
==========================================

By default, Fiddler Classic does not capture and decrypt secure HTTPS traffic. To capture data sent through HTTPS, enable HTTPS traffic decryption.

Enable HTTPS traffic decryption
--------------------------------

1. Click **Tools > Options > HTTPS**.

2. Click the **Decrypt HTTPS Traffic** box.

 ![Fiddler Options -- Decrypt HTTPS Traffic][1]

Skip traffic decryption for a specific host
-------------------------------------------

1. Click **Tools > Options > HTTPS**.

2. Type the hostname in the **Skip Decryption**.

 ![Skip Decryption][2]

Skip traffic decryption for an application
------------------------------------------

To skip traffic decryption for a specific application or to decrypt HTTPS traffic only from a single host, you must modify the OnBeforeRequest function in the [FiddlerScript](https://www.telerik.com/blogs/understanding-fiddlerscript).

Add a rule like this inside the [OnBeforeRequest function](https://docs.telerik.com/fiddler/knowledge-base/fiddlerscript/modifyrequestorresponse):

		if (oSession.HTTPMethodIs("CONNECT") && oSession["X-PROCESSINFO"] && oSession["X-PROCESSINFO"].StartsWith("outlook")) 
		{ 
			oSession["x-no-decrypt"] = "boring process";
		}      

Decrypt traffic from one hostname only
---------------------------------------

Add a rule like this inside the [OnBeforeRequest function](https://docs.telerik.com/fiddler/knowledge-base/fiddlerscript/modifyrequestorresponse):

		if (oSession.HTTPMethodIs("CONNECT") && 
			!oSession.HostnameIs("SiteICareAbout.com"))
		{ 
			oSession["x-no-decrypt"] = "do not care."; 
		}

See also
--------
[Responding to requests with client certificates][3]

[1]: ../../images/DecryptHTTPS/DecryptHTTPSTrafficOption.png
[2]: ../../images/DecryptHTTPS/SkipDecryption.png
[3]: ./RespondWithClientCert
