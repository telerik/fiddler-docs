---
title: Monitor Windows Phone
slug: MonitorWindowsPhone7
tags: Configuration, Windows Phone, Windows Phone 
publish: true
ordinal: 19
---

Monitor Windows Phone
=====================

Configure Fiddler
-----------------

1. Start Fiddler on Fiddler server (the machine that will capture the traffic).

2. Click **Tools > Fiddler Options**. Click **Allow remote clients to connect**. 

 ![Allow remote clients to connect][1]

3. Restart Fiddler.

4. In the Windows Security Alert dialog, check all three checkboxes and click the **Allow Access** button.

 ![Windows Security Alert][2]

To verify this configuration, enable your Windows Phone WiFi connection and visit **http://FIDDLERSERVER:8888**, where FIDDLERSERVER is the machine name for the machine running Fiddler. This should display the **Fiddler Echo Service** web site.

Configure Windows Phone
-----------------------

1. Tap **Settings > WiFi**.

 ![Settings][3]

2. Tap the active WiFi connection.
 
 ![WiFi][4]

3. Slide the **Proxy Slider** to **On**.

4. In the **Server/URL** field, type the machine name for the Fiddler server.

5. In the **Port** field, type **8888**.

 ![EditNetwork.png][5]

6. Tap the checkmark icon.

Decrypt HTTPS Traffic
---------------------
1. [Configure Fiddler to decrypt HTTPS traffic][6].

2. On the Windows Phone, use Mobile IE to request an HTTPS protocol URL.

3. Under the security warning page, click **Continue to website (not recommended)**.

 ![Certificate Warning][7]

4. Go to **http://FIDDLERSERVER:8888/FiddlerRoot.cer**.

5. Tap the icon labeled **Tap to open the file fiddlerroot.cer**.

 ![Open Certificate][8]

6. Tap **install**.

 ![Install Certificate][9]

Note: There is no known resource containing steps to remove security certificates from a Windows Phone. This may prevent connecting to a different Fiddler proxy, which will use a different security certificate.

Disable Monitoring
------------------
After Fiddler monitoring is complete:

1. Tap **Settings > WiFi**.

2. Tap the active WiFi connection.

3. Slide the **Proxy Slider** to **Off**.



See Also
--------
[No Windows Phone 7 traffic][10]

[1]: ../../images/MonitorWindowsPhone7/AllowRemoteComputersToConnect.png
[2]: ../../images/MonitorWindowsPhone7/WindowsSecurityAlert.png
[3]: ../../images/MonitorWindowsPhone7/Settings.png
[4]: ../../images/MonitorWindowsPhone7/Wifi.png
[5]: ../../images/MonitorWindowsPhone7/EditNetwork.png
[6]: ./DecryptHTTPS
[7]: ../../images/MonitorWindowsPhone7/CertificateWarning.png
[8]: ../../images/MonitorWindowsPhone7/OpenCertificate.png
[9]: ../../images/MonitorWindowsPhone7/InstallCertificate.png
[10]: ../Troubleshooting/NoWindowsPhone7Traffic
