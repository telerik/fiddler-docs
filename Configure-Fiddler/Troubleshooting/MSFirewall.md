---
title: Fiddler and Microsoft Firewall Client
slug: MSFirewall
tags: Getting Started, Configuration, Troubleshooting, .NET, TLS Encrypted Alert
publish: true
ordinal: 9
---

Configuration Conflict
----------------------

Microsoft Firewall client for Microsoft ISA 2004 has an option to automatically reconfigure Internet Explorer settings. Unfortunately, this setting will cause Internet Explorer to detach from Fiddler at random times. To prevent this problem, disable browser automatic configuration in the Microsoft Firewall client.

+ If there's a Firewall Client icon ![Firewall Client][1]  in your system tray, right click it and choose Configure... from the popup menu
+ If not, type 'firewall' in the Start Menu search box and choose the ![Firewall Client Management icon][2]

On the Web Browser tab, uncheck the checkbox.

[1]: ../../images/FirewallIcon.png
[2]: ../../images/FirewallClient.png