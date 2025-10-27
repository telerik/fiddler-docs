---
title: Capturing iOS Traffic
description: The configuration steps needed to setup the classic Fiddler Classic to capture traffic from iOS devices.
slug: ConfigureForiOS
publish: true
position: 17
previous_url: /configure-fiddler/tasks/configureforios
---

# Capture Traffic from iOS Device

## Configure Fiddler Classic

1. Open Fiddler Classic and stop capturing.

1. Open **_Tools > Options > HTTPS_** and disable **_Capturing HTTPS Connects_**.

1. Close Fiddler Classic and install BouncyCastle (CertMaker.dll) from [here](https://telerik-fiddler.s3.amazonaws.com/fiddler/addons/fiddlercertmaker.exe). – this will add CertMaker.dll in your Fiddler installation, changing the way certificates are generated. With this option, Fiddler Classic will use only one root certificate and will not generate intermediate certificates for each option.

1. After installation is complete, open Fiddler, open **_Tools > Options > HTTPS_** menu use **_Actions > Reset all certificates_** option. This will remove all previously used certificates and will trust the new one.

1. After agreeing with all system dialogs, enable Capturing (**_Tools > Options > HTTPS_** and check **_Capturing HTTPS Connects_**) and decryption of HTTPS traffic ((**_Tools > Options > HTTPS_** and check **_Decrypt HTTPS traffic_**)).

1. Open **_Tools > Options > Connections_**.

1. Click the checkbox for **_Allow remote computers to connect_**.

1. Restart Fiddler.

1. Ensure your firewall allows incoming connections to the Fiddler Classic process and that it's not blocking all incoming connections, including those in the list of allowed apps.

1. Hover over the **Online indicator** at the Fiddler Classic toolbar's far-right to display the IP addresses assigned to Fiddler's machine. Use this address on your iOS device (see the 5th step in the iOS device setup steps below).

 ![Online Tooltip][2]

1. Verify client iOS device can reach Fiddler Classic by navigating in the browser to **http://FiddlerMachineIP:8888**. This address should return the **Fiddler Echo Service** page.

1. For iPhone: Disable the 3g/4g connection.

## Set the iOS Device Proxy

1. On the iOS device open **_Settings > General > VPN & Device Management_** and remove all **DO_NOT_TRUST_FiddlerRoot** profiles. You must remove them (not disabling them).

1. Go to **_Settings > WiFi_** on your iOS device.

1. Find your current network and click the **i** icon.

1. Scroll to the bottom and choose **Manual** in the **_Configure Proxy_** option.

1. Type your Fiddler Classic machine IP address in the **Server** field.

1. Type the Fiddler Classic listening port (8888 by default) in the **Port** field and finally tap on **Save**.

    >tip With the current setup, you should be able to capture non-secure HTTP traffic. However, if you try to open any **HTTPS** website, you'll get the _This site's security certificate is not trusted!_ error. To fix this, proceed with the steps that follow below.

1. Open a browser on the iOS device and type the Fiddler Classic echo service address: **http://ipv4.fiddler:8888**

1. Click on the Fiddler Classic root certificate link to download it.

 >important Ensure that the Fiddler Classic certificate is generated through the BouncyCastle certificate generator.[Learn more about certificate generators and how to install and enable BouncyCastle here...](https://www.telerik.com/blogs/understanding-fiddler-certificate-generators).

1. On your iOS device, open **_General_** > **_VPN & Device Management_** and install the certificate via the **_Profile Downloaded_**. Note that this option will appear after the certificate is downloaded.

1. (iOS 10.3+) Go to **_General > About > Certificate Trust Settings_** and **enable full trust** for the **DO_NOT_TRUST_FiddlerRoot** certificate. Note that you will see the **DO_NOT_TRUST_FiddlerRoot** certificate only after completing the previous step. 

## Uninstall FiddlerRoot Certificate

If you decide to uninstall the root certificate:

1. Tap the **Settings** app.

1. Tap **General**.

1. Scroll to **VPN & Device Management**.

1. Tap the **DO_NOT_TRUST_FiddlerRoot*** profile.

1. Tap **Remove**.
