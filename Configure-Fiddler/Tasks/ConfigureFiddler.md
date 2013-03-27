---
title: Configure Fiddler
slug: ConfigureFiddler
tags: Getting Started, configure fiddler, common configuration tasks
publish: true
ordinal: -1
---

Getting Started with Fiddler
============================

First, [Install Fiddler][1].
----------------------------

Next, Configure the Fiddler Server.
-----------------------------------

The **Fiddler Server** is the machine on which Fiddler is installed. Some scenarios may require specific steps for Fiddler to receive and send web traffic. This includes:

+ **Types of traffic**, like [decrypting HTTPS][3] and [authenticating with channel-binding tokens][19]
+ **Operating systems**, like [Windows 8][2] and [Mac OSX][4]
+ **Network configurations**, like [monitoring a remote machine][14], [chaining to an upstream proxy][5], [using Fiddler as a Reverse Proxy][6], [monitoring local traffic][10] or [monitoring dial-up and VPN connections][7]

Last, Configure the Client.
---------------------------

The **client** is the source of the web traffic that Fiddler monitors. Some client applications, operating systems, and devices may require specific steps to send and receive traffic to and from Fiddler. This includes:

+ **Browsers**, like [Firefox, Opera, or IE (when sending traffic to localhost)][8]
+ **Applications**, like [.NET apps][9], [WinHTTP Apps][11], [Java Apps][12], and [PHP/cURL apps][13]
+ **Devices**, like [Android][15], [iOS][16], [Windows Phone 7][17], and [PocketPC][18] devices

[1]: ./InstallFiddler
[2]: ./ConfigureFiddlerForWin8.md
[3]: ./DecryptHTTPS.md
[4]: ./ConfigureForMac.md
[5]: ./ChainToUpstreamProxy.md
[6]: ./UseFiddlerAsReverseProxy.md
[7]: ./MonitorDialupAndVPN.md
[8]: ./ConfigureBrowsers.md
[9]: ./ConfigureDotNETApp.md
[10]: ./MonitorLocalTraffic.md
[11]: ./ConfigureWinHTTPApp.md
[12]: ./ConfigureJavaApp.md
[13]: ./ConfigurePHPcURL.md
[14]: ./MonitorRemoteMachine.md
[15]: ./ConfigureForAndroid.md
[16]: ./ConfigureForiOS.md
[17]: ./MonitorWindowsPhone7.md
[18]: ./MonitorPocketPC.md
[19]: ./AuthenticateWithCBT.md
