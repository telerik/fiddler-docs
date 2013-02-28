---
title: Configure Fiddler to decrypt HTTPS traffic
slug: DecryptHTTPS
tags: Configuration, HTTPS, Decrypt, Decrypt HTTPS
publish: true
---

Configure Fiddler to Decrypt HTTPS Traffic
==========================================

Enable HTTPS traffic decryption:
--------------------------------

1. Click **Tools > Fiddler Options > HTTPS**

2. Click the **Decrypt HTTPS Traffic** box.

 ![Fiddler Options -- Decrypt HTTPS Traffic][1]

Skip traffic decryption for a specific host
-------------------------------------------

1. Click **Tools > Fiddler Options > HTTPS**

2. Type the hostname in the **Skip Decryption**

 ![Skip Decryption][2]

Skip traffic decryption for an application
------------------------------------------

Add a rule like this inside the OnBeforeRequest function*:

		if (oSession.HTTPMethodIs("CONNECT") && oSession["X-PROCESSINFO"] && oSession["X-PROCESSINFO"].StartsWith("outlook")) 
		{ 
			oSession["x-no-decrypt"] = "boring process";
		}      

Decrypt traffic from one hostname only
---------------------------------------

Add a rule like this inside the OnBeforeRequest function*:

		if (oSession.HTTPMethodIs("CONNECT") && 
			!oSession.HostnameIs("SiteICareAbout.com"))
		{ 
			oSession["x-no-decrypt"] = "do not care."; 
		}

[1]: ../../images/DecryptHTTPS/DecryptHTTPSTrafficOption.png
[2]: ../../images/DecryptHTTPS/SkipDecryption.png
