---
title: The Fiddler Proxy
slug: Proxy
tags: KnowledgeBase, WinINET, proxy settings
publish: true
ordinal: 8
---

Running Fiddler
---------------

After you start Fiddler, the program registers itself as the system proxy for Microsoft Windows Internet Services (WinInet), the HTTP layer used by Internet Explorer, Microsoft Office, and many other products. You can verify that Fiddler is correctly intercepting requests by checking the Proxy Settings dialog. From the Internet Explorer main menu, click **Tools > Internet Options > Connections > LAN Setting > Advanced**.

![IE Proxy Settings][1]

As the system proxy, all HTTP requests from WinInet flow through Fiddler before reaching the target Web servers. Similarly, all HTTP responses flow through Fiddler before being returned to the client application.

![HTTP Traffic Flow][2]

When you close Fiddler, it unregisters itself as the system proxy before shutting down.

[1]: ../images/Proxy/IEProxySettings.png
[2]: ../images/Proxy/TrafficFlow.png