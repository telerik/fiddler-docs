---
title: Configure Fiddler
slug: ConfigureFiddler
tags: Getting Started, configure fiddler, common configuration tasks
publish: true
position: 0
---

Getting Started with Fiddler
============================

First, Install Fiddler.
----------------------------

You can check more detailed information on how to install Fiddler [here][1].

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
[2]: ./ConfigureFiddlerForWin8
[3]: ./DecryptHTTPS
[4]: ./ConfigureForMac
[5]: ./ChainToUpstreamProxy
[6]: ./UseFiddlerAsReverseProxy
[7]: ./MonitorDialupAndVPN
[8]: ./ConfigureBrowsers
[9]: ./ConfigureDotNETApp
[10]: ./MonitorLocalTraffic
[11]: ./ConfigureWinHTTPApp
[12]: ./ConfigureJavaApp
[13]: ./ConfigurePHPcURL
[14]: ./MonitorRemoteMachine
[15]: ./ConfigureForAndroid
[16]: ./ConfigureForiOS
[17]: ./MonitorWindowsPhone7
[18]: ./MonitorPocketPC
[19]: ./AuthenticateWithCBT
