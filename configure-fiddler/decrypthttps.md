---
title: Decrypt HTTPS traffic
description: Configure Fiddler Classic to decrypt HTTPS traffic
slug: DecryptHTTPS
publish: true
position: 20
previous_url: /configure-fiddler/tasks/decrypthttps
---

# Configure Fiddler Classic to Decrypt HTTPS Traffic

>tip Update: If you're looking for cross-platform HTTPS capturing and decrypting tool, check out the new [Fiddler Everywhere](https://www.telerik.com/fiddler/fiddler-everywhere)! Check this [blog post](https://www.telerik.com/blogs/new-release-fiddler-everywhere-3) to learn more about it or directly see how easy is to [capture](https://docs.telerik.com/fiddler-everywhere/traffic/capture-traffic) and [inspect](https://docs.telerik.com/fiddler-everywhere/traffic/inspect-traffic) HTTPS traffic with Fiddler Everywhere.

By default, Fiddler Classic does not capture and decrypt secure HTTPS traffic. To capture data sent through HTTPS, enable HTTPS traffic decryption.

## Enable HTTPS traffic decryption

1. Click **Tools > Options > HTTPS**.
2. Click the **Decrypt HTTPS Traffic** box.
 ![Fiddler Options -- Decrypt HTTPS Traffic](./images/DecryptHTTPSTrafficOption.png)

## Skip traffic decryption for a specific host

1. Click **Tools > Options > HTTPS**.
2. Type the hostname in the **Skip Decryption**.
 ![Skip Decryption](./images/SkipDecryption.png)

## Skip traffic decryption for an application

To skip traffic decryption for a specific application or to decrypt HTTPS traffic only from a single host, you must modify the OnBeforeRequest function in the [FiddlerScript](https://www.telerik.com/blogs/understanding-fiddlerscript).

Add a rule like this inside the [OnBeforeRequest function](https://docs.telerik.com/fiddler/knowledge-base/fiddlerscript/modifyrequestorresponse):

```C#
if (oSession.HTTPMethodIs("CONNECT") && oSession["X-PROCESSINFO"] && oSession["X-PROCESSINFO"].StartsWith("outlook")) 
{ 
	oSession["x-no-decrypt"] = "boring process";
}    
```  

## Decrypt traffic from one hostname only

Add a rule like this inside the [OnBeforeRequest function](https://docs.telerik.com/fiddler/knowledge-base/fiddlerscript/modifyrequestorresponse):

```c#
if (oSession.HTTPMethodIs("CONNECT") && 
	!oSession.HostnameIs("SiteICareAbout.com"))
{ 
	oSession["x-no-decrypt"] = "do not care."; 
}
```

## See Also

[Responding to requests with client certificates](slug://RespondWithClientCert)

