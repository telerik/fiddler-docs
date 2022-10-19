---
title: Fiddler Classic and Microsoft Firewall Client
description: Disabling Web browser automatic configuration in the Microsoft Firewall client
slug: MSFirewall
publish: true
position: 9
---

Problem: Fiddler Classic Detaches Randomly with MS Firewall for ISA 2004
----------------------------------------------------------------

Microsoft Firewall client for Microsoft ISA 2004 has an option to automatically reconfigure Internet Explorer settings. Unfortunately, this setting will cause Internet Explorer to detach from Fiddler Classic at random times. 

Solution: Disable Web browser automatic configuration in the Microsoft Firewall client
--------------------------------------------------------------------------------------

+ If there's a Firewall Client icon ![Firewall Client][1]  in your system tray:
	1. Right click the Firewall Client icon in the system tray.
	2. Click **Configure...** from the context menu.

+ If there is no Firewall Client icon in your system tray:
	1. Open the **Start Menu**.
	2. Type 'firewall' in the Start Menu search box.
	3. Click the ![Firewall Client Management icon][2].

On the Web Browser tab, uncheck the **Enable Web browser automatic configuration** checkbox.

[1]: ../../images/MSFirewall/FirewallIcon.png
[2]: ../../images/MSFirewall/FirewallClient.png
