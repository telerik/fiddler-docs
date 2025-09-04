---
title: Monitor RAS, VPN, or Dialup Connections
description: "Instructions for monitoring traffic via dial-up and VPN in Fiddler Classic - set up proxy capture for varying network scenarios."
slug: MonitorDialupAndVPN
publish: true
position: 10
---

Monitor RAS, VPN or Dialup Connections
======================================

To monitor a dialup or VPN connection, open **Tools -> Options...** and click **Monitor all connections**.

![Monitor all connections][1]

Or, set [the "Use automatic configuration script" option][2] in your browser.

To monitor a VPN or dialup connection that is always active (instead of a LAN connection), set the **HookConnectionNamed** registry value to the name of the connection from **Internet Options**. 

![Connection Name][3]

Note: IE will always use the proxy settings from any active VPN connection, whether or not that VPN connects to the Internet.

[1]: ../../images/MonitorDialupAndVPN/MonitorAllConnections.png
[2]: ./ConfigureBrowsers
[3]: ../../images/MonitorDialupAndVPN/ConnectionName.png
