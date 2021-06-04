---
title: Capturing Android Traffic
description: Configure Fiddler Classic for Android Mobile Operating System
slug: ConfigureForAndroid
publish: true
position: 18
---

Configure Fiddler for Android / Google Nexus 7
================================================

Configure Fiddler Classic
-----------------

1. Click **Tools > Fiddler Options > Connections**.

2. Ensure that the checkbox by **Allow remote computers to connect** is checked. 

3. If you check the box, restart Fiddler.

4. Hover over the **Online indicator** at the far right of the Fiddler toolbar to display the IP address of the Fiddler server.

 ![Online Tooltip][1]


Configure Nexus Device
----------------------

1. Swipe down from the top of the screen and tap the **Settings** icon.

2. Tap **Wi-Fi**.

3. Tap and hold your current Wi-Fi network. Select **Modify Network**.

 ![Modify Network][2]

4. Tap the **Show advanced options** box.

 ![Show advanced options][3]

5. Tap the **Proxy settings** dropdown and select **Manual**.

 ![Proxy settings][4]

6. Type the IP address and port (usually 8888) of the Fiddler server.

 ![IP Address][5]

7. Tap **Save**.

To verify this configuration, go to **http://ipv4.fiddler:8888/**. Chrome should display the **Fiddler Echo Service** webpage, and the traffic should appear in Fiddler.

Disable the proxy
-----------------

After using Fiddler, return to the **Proxy Settings** screen above and remove the proxy.


Decrypt HTTPS
-------------

1. On the **Fiddler Echo Service Webpage**, click the **FiddlerRoot Certificate** link.

 ![Download FiddlerRoot Certificate][6]

2. If the download doesn't open automatically, swipe down from the top and tap the **Settings** icon.

3. Tap **Personal > Security.** 

4. Under **Credential Storage**, tap **Install from storage**. 

 ![Install from storage][7]

5. Tap the **FiddlerRoot.cer** file. 

6. (Optional) Type a name for the certificate.

To verify this configuration, tap **Trusted credentials > User**. This should display the Fiddler certificate.

Disable HTTPS Decryption
------------------------

To delete the FiddlerRoot certificate, tap **Trusted credentials > User** and delete the certificate.

[1]: ../../images/ConfigureForAndroid/OnlineTooltip.png
[2]: ../../images/ConfigureForAndroid/ModifyNetwork.png
[3]: ../../images/ConfigureForAndroid/ShowAdvancedOptions.png
[4]: ../../images/ConfigureForAndroid/ProxySettings.png
[5]: ../../images/ConfigureForAndroid/IPAddress.png
[6]: ../../images/ConfigureForAndroid/DownloadFiddlerRootCert.png
[7]: ../../images/ConfigureForAndroid/InstallFromStorage.png
