---
title: Configure a WinHTTP Application
description: Configure a WinHTTP application alongside the Fiddler proxy
slug: ConfigureWinHTTPApp
publish: true
position: 9
---

Configure a WinHTTP Application to Use Fiddler Classic
=====================================================

To configure a WinHTTP application to send web traffic to Fiddler Classic, enter this command from the command line:

**Windows Vista or above** (Requires an Elevated/Admin command prompt):

		netsh winhttp set proxy 127.0.0.1:8888

On Windows 7 or earlier, run the above command in 32bit NETSH to configure 32bit WinHTTP hosts, and run the command in 64bit NETSH to configure 64bit WinHTTP hosts.

**Windows XP or below**: 

		proxycfg -p http=127.0.0.1:8888;https=127.0.0.1:8888

Or: (Forces WinHTTP to use WinINET's proxy settings)

		proxycfg -u

