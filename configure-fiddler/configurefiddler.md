---
title: Configure Fiddler
description: Learn how to install and configure Fiddler Classic.
slug: ConfigureFiddler
publish: true
position: 0
previous_url: /tasks/configurefiddler
---

# Getting Started with Fiddler Classic

1. Install Fiddler Classic. You can check more detailed information on how to install Fiddler Classic [here](slug://slug UsingFiddler).

2. Configure the Fiddler Classic Server. The **Fiddler Server** is the machine on which Fiddler Classic is installed. Some scenarios may require specific steps for Fiddler Classic to receive and send web traffic. This includes:

    - **Types of traffic**, like [decrypting HTTPS](slug://slug DecryptHTTPS) and [authenticating with channel-binding tokens](slug://slug AuthenticateWithCBT)
    - **Operating systems**, like [Windows 8, Windows 10, Windows 11](slug://slug Windows8Config) and [Mac OSX](slug://slug ConfigureForMac)
    - **Network configurations**, like [monitoring a remote machine](slug://slug MonitorRemoteMachine), [chaining to an upstream proxy](slug://slug ChainToUpstreamProxy), [using Fiddler Classic as a Reverse Proxy](slug://slug UseFiddlerAsReverseProxy), [monitoring local traffic](slug://slug MonitorLocalTraffic) or [monitoring dial-up and VPN connections](slug://slug MonitorDialupAndVPN)

3. Configure the Client. The **client** is the source of the web traffic that Fiddler Classic monitors. Some client applications, operating systems, and devices may require specific steps to send and receive traffic to and from Fiddler. This includes:

    - **Browsers**, like [Firefox, Opera, or IE (when sending traffic to localhost)](slug://slug ConfigureBrowsers)
    - **Applications**, like [.NET apps](slug://slug DotNETConfig), [WinHTTP Apps](slug://slug ConfigureWinHTTPApp), [Java Apps](slug://slug ConfigureJavaApp), and [PHP/cURL apps](slug://slug PHPcURL)
    - **Devices**, like [Android](slug://slug ConfigureForAndroid), [iOS](slug://slug ConfigureForiOS), [Windows Phone 7](slug://slug MonitorWindowsPhone7), and [PocketPC](slug://slug MonitorPocketPC) devices.

## Additional Resources

- [Capture traffic with Fiddler Classic](slug://slug ViewWebTraffic)
- [Capture traffic on macOS, Linux and Windows with the new **Fiddler Everywhere**](https://telerik.com/fiddler/fiddler-everywhere)
* [Fiddler Homepage](https://www.telerik.com/fiddler)
