---
title: Configure Fiddler for Mac
slug: ConfigureForMac
tags: Configuration, Mac, Certificate, Metro, Loopback
publish: true
position: 16
---

Configure Fiddler for Mac
=========================

Virtualization products like VMWare Fusion or Parallels Desktop permit Fiddler to run in a virtual machine on your Mac.

Configure the Virtual Machine
-----------------------------

1. Install Parallels.

2. Set the Windows Virtual Machine **Hardware > Network 1 Type** to **Bridged Network** mode.

3. Restart the Virtual Machine.

Configure Fiddler
-----------------

1. Install Fiddler on the Virtual Machine.

2. Open Fiddler.

3. Click **Tools > Fiddler Options > Connections**.

4. Click the checkbox by **Allow remote computers to connect**. 

 ![Allow remote computers to connect][1]

5. Restart Fiddler.

6. Ensure your firewall allows incoming connections to the Fiddler process. 

Configure Mac 
-------------

1. Hover over the **Online indicator** at the far right of the Fiddler toolbar to display the IP addresses assigned to the virtual machine.

 ![Online Tooltip][2]

2. Click the **Apple Menu**.

3. Click **System Preferences**. 

4. Click the **Network** icon.

5. Click the **Advanced** button. 

6. Click the **Proxies** tab. 

7. Enable the **Web Proxy** (HTTP) and **Secure Web Proxy** (HTTPS) options to point to the IPv4 address of the virtual machine using port 8888.

Disable After Use
-----------------

After using Fiddler, return to the **OSX System Preferences** and disable the proxy settings.

[1]: ../../images/ConfigureForMac/AllowRemoteComputersToConnect.png
[2]: ../../images/ConfigureForMac/OnlineTooltip.png
