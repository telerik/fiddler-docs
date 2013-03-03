---
title: Monitor PocketPC
slug: MonitorPocketPC
tags: Configuration, PocketPC, IEMobile
publish: true
ordinal: 20
---

Monitor PocketPC
================

Configure Fiddler
-----------------

1. On the Fiddler server (the machine where Fiddler is installed), [open port 8888 in Windows Firewall][1].

2. Open **ActiveSync > Connection Settings...**. 

3. Under **This Computer is connected to:**, click **Work Network**.

4. Start Fiddler.

5. Click **Tools > Fiddler Options...**.

6. Ensure "Allow remote clients to connect" is checked. 

7. If you need to click the checkbox, restart Fiddler.

Configure PocketPC
------------------

1. On the PocketPC, set the HTTP proxy to be **FIDDLERSERVER:8888**, where FIDDLERSERVER is the machine name for the machine with Fiddler installed.

2. Connect the PocketPC to ActiveSync.

[1]: http://windows.microsoft.com/en-us/windows7/open-a-port-in-windows-firewall
