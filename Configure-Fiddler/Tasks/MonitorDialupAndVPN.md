---
title: Monitor RAS, VPN, or Dialup Connections
slug: MonitorDialupAndVPN
tags: Configuration, VPN, RAS, Dialup
publish: true
position: 10
---

Monitor RAS, VPN or Dialup Connections
======================================

To monitor a dialup or VPN connection, open **Tools -> Fiddler Options...** and click **Monitor all connections**.

![Monitor all connections][1]

Or, set [the "Use automatic configuration script" option][2] in your browser.

To monitor a VPN or dialup connection that is always active (instead of a LAN connection), set the **HookConnectionNamed** registry value to the name of the connection from **Internet Options**. 

![Connection Name][3]

Note: IE will always use the proxy settings from any active VPN connection, whether or not that VPN connects to the Internet.

[1]: ../../images/MonitorDialupAndVPN/MonitorAllConnections.png
[2]: ./ConfigureBrowsers
[3]: ../../images/MonitorDialupAndVPN/ConnectionName.png
