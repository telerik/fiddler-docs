---
title: Configure Browsers
slug: ConfigureBrowsers
tags: Configuration, Configure, Browser, Firefox, https, manual
publish: true
---

Configure Browsers
==================

IE, Chrome, Safari, and Opera
-----------------------------
+ To capture traffic from most browsers, enable **File > Capture Traffic**. 

+ To capture traffic from **Opera**, start Fiddler before starting Opera.

Firefox
-------

+ To capture HTTP traffic from **Firefox 4+**, click **Tools > Options > Advanced > Network > Settings > Use System Proxy Settings**. Or, install the FiddlerHook Help Firefox addon.

+ To capture HTTPS traffic from Firefox:

1. In Fiddler, 

 a. Click **Tools > Fiddler Options**. 

 b. Click the **HTTPS** tab. Ensure the **Decrypt HTTPS traffic** checkbox is checked. 

 c. Click the **Export Fiddler Root Certificate to Desktop** button.
 
   ![Export Root Certificate to Desktop][1]

2. In Firefox, 

 a. Click **Tools > Options...**. 

 b. Click the **Advanced** button. 

 c. Click the **Encryption** tab. 

 d. Click **View Certificates**. 

 e. Click the **Authorities** tab. 

 f. Click **Import**.

   ![Import Certificate][2]

 g. Select the .CER file from your desktop.

 h. Click the checkbox next to **Trust this CA to identify web sites.**

  ![Trust this CA to identify web sites][3]

Manual Configuration
--------------------

To manually configure any browser to send traffic to Fiddler, set the browser to connect to a proxy server. This setting is usually in the **Options** or **Preferences** menu. Use these settings:

Address: **127.0.0.1**
Port: **8888**

To instead allow Fiddler to automatically enable and disable the proxy, use **Proxy Auto-configuration** with a URL pointing to Documents/Fiddler2/Scripts/BrowserPAC.js.

For example, in Firefox, click **Tools > Options > Advanced > Network > Settings**, and input the URL of the BrowserPAC.js.

![Automatic proxy configuration URL][4]

To find the correct auto-configuration URL from Fiddler:

1. Click **Tools > Fiddler Options > Connections**
2. Clicking the **Copy Browser Proxy Configuration URL** link.

![Copy Auto-Correct URL][5]


[1]: ../../images/ConfigureBrowsers/ExportRootCertificateToDesktop.png
[2]: ../../images/ConfigureBrowsers/ImportCertificate.png
[3]: ../../images/ConfigureBrowsers/TrustThisCAToIdentifyWebsites.png
[4]: ../../images/ConfigureBrowsers/BrowserPAC.png
[5]: ../../images/ConfigureBrowsers/CopyAutoCorrectURL.jpg
