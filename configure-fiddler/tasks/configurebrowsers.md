---
title: Capture Configuration for Browsers
description: Specific configuration steps for enabling capture on Opera, Firefox, and other non-Chromium browsers.
slug: ConfigureBrowsers
publish: true
position: 2
---

Configure Browsers
==================

Clear Cache
-----------

To ensure all requests are sent and captured, [clear your browser's cache][7] before beginning a capture.

IE, Chrome, Safari, and Opera
-----------------------------
+ To capture traffic from most browsers, enable **File > Capture Traffic**. 

+ [Record traffic sent to **http://localhost** or **htp://127.0.0.1** from IE][6].

+ To capture traffic from **Opera**, start Fiddler before starting Opera.

Firefox
-------

+ To capture HTTP traffic from **Firefox 4+**, either:

  + Click **Tools > Monitor with Fiddler > Use Fiddler automatically** to configure with [FiddlerHook][8], or

  + Click **Tools > Options > Advanced > Network > Settings > Use System Proxy Settings**. 

 ![Use System Proxy Settings][10]

+ [Capture HTTPS traffic from Firefox][9]

Manual Configuration
--------------------

To manually configure any browser to send traffic to Fiddler, set the browser to connect to a proxy server. This setting is usually in the **Options** or **Preferences** menu. Use these settings:

Address: **127.0.0.1**
Port: **8888**

Note: If a browser uses these settings, revert these settings after you close Fiddler, or the browser will not load pages. For example, Firefox will show the following error message:

![Firefox Proxy Error][11]

To instead allow Fiddler Classic to automatically enable and disable the proxy, use **Proxy Auto-configuration** with a URL pointing to %userprofile%\Documents\Fiddler2\Scripts\BrowserPAC.js.

For example, in Firefox, click **Tools > Options > Advanced > Network > Settings**, and input the URL of the BrowserPAC.js.

![Automatic proxy configuration URL][4]

To find the correct auto-configuration URL from Fiddler:

1. Click **Tools > Options > Connections**.
2. Clicking the **Copy Browser Proxy Configuration URL** link.

![Copy Auto-Correct URL][5]


[1]: ../../images/ConfigureBrowsers/ExportRootCertificateToDesktop.png
[2]: ../../images/ConfigureBrowsers/ImportCertificate.png
[3]: ../../images/ConfigureBrowsers/TrustThisCAToIdentifyWebsites.png
[4]: ../../images/ConfigureBrowsers/BrowserPAC.png
[5]: ../../images/ConfigureBrowsers/CopyAutoCorrectURL.jpg
[6]: ./MonitorLocalTraffic
[7]: http://www.wikihow.com/Clear-Your-Browser's-Cache
[8]: ../../KnowledgeBase/FiddlerHook
[9]: ./FirefoxHTTPS
[10]: ../../images/ConfigureBrowsers/UseSystemProxySettings.png
[11]: ../../images/ConfigureBrowsers/FirefoxProxyError.png