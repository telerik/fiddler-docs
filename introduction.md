---
title: Introduction
description: Learn how to install, configure and capture traffic Fiddler Classic.
slug: ConfigureFiddler
publish: true
position: 0
previous_url: /tasks/configurefiddler, /configure-fiddler/tasks/configurefiddler
---

# Introduction

Progress® Telerik® Fiddler Classic is a web-debugging tool that monitors, inspects, edits, and logs all HTTPS traffic on Windows. Fiddler Classic is the original product that laid the fondations for the modern-day Fiddler Everywhere application.

>important Please be aware that Fiddler Classic is not in active development and offers no commitments for releases, patches or tech support. By using this product, you assume all associated risks. We recommend upgrading to [Fiddler Everywhere](https://telerik.com/fiddler/fiddler-everywhere).

## Get Started with Fiddler Classic

1. Install Fiddler Classic. You can check more detailed information on how to install Fiddler Classic [here](slug://UsingFiddler).

2. Configure the Fiddler Classic Server. The **Fiddler Server** is the machine on which Fiddler Classic is installed. Some scenarios may require specific steps for Fiddler Classic to receive and send web traffic. This includes:

    - **Types of traffic**, like [decrypting HTTPS](slug://DecryptHTTPS) and [authenticating with channel-binding tokens](slug://AuthenticateWithCBT)
    - **Operating systems**, like [Windows 8, Windows 10, Windows 11](slug://Windows8Config) and [Mac OSX](slug://ConfigureForMac)
    - **Network configurations**, like [monitoring a remote machine](slug://MonitorRemoteMachine), [chaining to an upstream proxy](slug://ChainToUpstreamProxy), [using Fiddler Classic as a Reverse Proxy](slug://UseFiddlerAsReverseProxy), [monitoring local traffic](slug://MonitorLocalTraffic) or [monitoring dial-up and VPN connections](slug://MonitorDialupAndVPN)

3. Configure the Client. The **client** is the source of the web traffic that Fiddler Classic monitors. Some client applications, operating systems, and devices may require specific steps to send and receive traffic to and from Fiddler. This includes:

    - **Browsers**, like [Firefox, Opera, or IE (when sending traffic to localhost)](slug://ConfigureBrowsers)
    - **Applications**, like [.NET apps](slug://DotNETConfig), [WinHTTP Apps](slug://ConfigureWinHTTPApp), [Java Apps](slug://ConfigureJavaApp), and [PHP/cURL apps](slug://PHPcURL)
    - **Devices**, like [Android](slug://ConfigureForAndroid), [iOS](slug://ConfigureForiOS), [Windows Phone 7](slug://MonitorWindowsPhone7), and [PocketPC](slug://MonitorPocketPC) devices.

## Additional Resources

- [Capture traffic with Fiddler Classic](slug://ViewWebTraffic)
- [Capture traffic on macOS, Linux and Windows with **Fiddler Everywhere**](https://telerik.com/fiddler/fiddler-everywhere)
- [Capture and analyze HTTP/2 and TLS1.3 traffic with **Fiddler Everywhere**](https://telerik.com/fiddler/fiddler-everywhere/documentation)
- [Capture and analyze HTTPS traffic alongside MCP with **Fiddler Everywhere**](https://telerik.com/fiddler/fiddler-everywhere/documentation/mcp-server/fiddler-mcp-server)
* [Fiddler Homepage](https://www.telerik.com/fiddler)
