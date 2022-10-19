---
title: Configure Fiddler
description: Basic configuration instructions for Fiddler Classic.
slug: ConfigureFiddler
publish: true
position: 0
---

Getting Started with Fiddler Classic
===================================

First, Install Fiddler Classic.
----------------------------

You can check more detailed information on how to install Fiddler Classic [here]({%slug UsingFiddler%}).

Next, Configure the Fiddler Classic Server.
-----------------------------------

The **Fiddler Server** is the machine on which Fiddler Classic is installed. Some scenarios may require specific steps for Fiddler Classic to receive and send web traffic. This includes:

+ **Types of traffic**, like [decrypting HTTPS]({%slug DecryptHTTPS%}) and [authenticating with channel-binding tokens]({%slug AuthenticateWithCBT%})
+ **Operating systems**, like [Windows 8]({%slug Windows8Config%}) and [Mac OSX]({%slug ConfigureForMac%})
+ **Network configurations**, like [monitoring a remote machine]({%slug MonitorRemoteMachine%}), [chaining to an upstream proxy]({%slug ChainToUpstreamProxy%}), [using Fiddler Classic as a Reverse Proxy]({%slug UseFiddlerAsReverseProxy%}), [monitoring local traffic]({%slug MonitorLocalTraffic%}) or [monitoring dial-up and VPN connections]({%slug MonitorDialupAndVPN%})

Last, Configure the Client.
---------------------------

The **client** is the source of the web traffic that Fiddler Classic monitors. Some client applications, operating systems, and devices may require specific steps to send and receive traffic to and from Fiddler. This includes:

+ **Browsers**, like [Firefox, Opera, or IE (when sending traffic to localhost)]({%slug ConfigureBrowsers%})
+ **Applications**, like [.NET apps]({%slug DotNETConfig%}), [WinHTTP Apps]({%slug ConfigureWinHTTPApp%}), [Java Apps]({%slug ConfigureJavaApp%}), and [PHP/cURL apps]({%slug PHPcURL%})
+ **Devices**, like [Android]({%slug ConfigureForAndroid%}), [iOS]({%slug ConfigureForiOS%}), [Windows Phone 7]({%slug MonitorWindowsPhone7%}), and [PocketPC]({%slug MonitorPocketPC%}) devices
