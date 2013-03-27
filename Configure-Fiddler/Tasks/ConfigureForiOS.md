---
title: Configure Fiddler for iOS
slug: ConfigureForiOS
tags: Configuration, iOS
publish: true
ordinal: 17
---

Capture Traffic from iOS Device
===============================

Configure Fiddler
-----------------

1. Click **Tools > Fiddler Options > Connections**.

2. Click the checkbox by **Allow remote computers to connect**.

 ![Allow remote computers to connect][1]

3. Restart Fiddler.

4. Ensure your firewall allows incoming connections to the Fiddler process.

4. Hover over the **Online indicator** at the far right of the Fiddler toolbar to display the IP addresses assigned to Fiddler's machine.

 ![Online Tooltip][2]

5. Verify client iOS device can reach Fiddler by navigating in the browser to **http://FiddlerMachineIP:8888**. This address should return the **Fiddler Echo Service** page.

6. For iPhone: Disable the 3g/4g connection.

Set the iOS Device Proxy
------------------------

1. Tap **Settings > General > Network > Wi-Fi**.

2. Tap the settings for the Wi-Fi network.

3. Tap the **Manual** option in the **HTTP Proxy** section. 

4. In the **Server** box, type the IP address or hostname of your Fiddler instance. 

5. In the **Port** box, type the port Fiddler is listening on (usually 8888). 

6. Ensure the Authentication slider is set to **Off**.

 ![iOS Proxy Settings][3]

Decrypt HTTPS Traffic from iOS Devices
--------------------------------------

1. Download the **Certificate Maker** plugin for Fiddler* from http://fiddler2.com/r/?FiddlerCertMaker.

2. Install the **Certificate Maker** plugin.

3. Restart Fiddler.

4. Configure the device where Fiddler is installed to [trust Fiddler�s root certificate][4].

5. On the iOS device, go to http://ipv4.fiddler:8888/ in a browser.

6. From the bottom of the **Fiddler Echo Service** webpage, download the **FiddlerRoot certificate.**

 ![Download FiddlerRoot Certificate][5]

7. Open the **FiddlerRoot.cer** file.

8. Tap the **Install** button.

 ![Install Profile][6]

9. Tap the **Install** button again.

 ![Warning][7]

Uninstall FiddlerRoot Certificate
---------------------------------

If you decide to uninstall the root certificate:

1. Tap the **Settings** app.

2. Tap **General**.

3. Scroll to **Profiles**.

4. Tap the **DO_NOT_TRUST_FiddlerRoot*** profile.

5. Tap **Remove**.

[1]: ../../images/ConfigureForiOS/AllowRemoteComputersToConnect.png
[2]: ../../images/ConfigureForiOS/OnlineTooltip.png
[3]: ../../images/ConfigureForiOS/iOSProxySettings.png
[4]: ./TrustFiddlerRootCert
[5]: ../../images/ConfigureForiOS/DownloadFiddlerRootCert.png
[6]: ../../images/ConfigureForiOS/InstallProfile.png
[7]: ../../images/ConfigureForiOS/Warning.png
