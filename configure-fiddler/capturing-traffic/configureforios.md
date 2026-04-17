---
title: Capture Traffic from iOS Device
page_title: Capturing iOS Device Traffic - Fiddler Classic
description: Configure Fiddler Classic to capture and inspect HTTP traffic from iOS devices.
slug: ConfigureForiOS
publish: true
position: 17
previous_url: /configure-fiddler/tasks/configureforios
---

# Capture Traffic from iOS Device

## Configure Fiddler Classic

1. Open Fiddler Classic and stop capturing.

1. Open **Tools** > **Options** > **HTTPS** and disable **Capturing HTTPS Connects**.

1. Close Fiddler Classic and install BouncyCastle (`CertMaker.dll`) from the [Fiddler add-ons page](https://telerik-fiddler.s3.amazonaws.com/fiddler/addons/fiddlercertmaker.exe). This adds `CertMaker.dll` to your Fiddler installation and changes the way certificates are generated. With this option, Fiddler Classic uses only one root certificate and does not generate intermediate certificates for each option.

1. After installation is complete, open Fiddler, open **Tools** > **Options** > **HTTPS** and use **Actions** > **Reset all certificates**. This removes all previously used certificates and trusts the new one.

1. After agreeing with all system dialogs, enable Capturing (**Tools** > **Options** > **HTTPS** and check **Capturing HTTPS Connects**) and decryption of HTTPS traffic (**Tools** > **Options** > **HTTPS** and check **Decrypt HTTPS traffic**).

1. Open **Tools** > **Options** > **Connections**.

1. Click the checkbox for **Allow remote computers to connect**.

1. Restart Fiddler.

1. Ensure your firewall allows incoming connections to the Fiddler Classic process and that it is not blocking all incoming connections, including those in the list of allowed apps.

1. Hover over the **Online indicator** at the Fiddler Classic toolbar's far-right to display the IP addresses assigned to Fiddler's machine. Use this address on your iOS device (see the 5th step in the iOS device setup steps below).

1. Verify client iOS device can reach Fiddler Classic by navigating in the browser to `http://FiddlerMachineIP:8888`. This address returns the **Fiddler Echo Service** page.

1. For iPhone: Disable the 3g/4g connection.

## Set the iOS Device Proxy

1. On the iOS device open **Settings** > **General** > **VPN & Device Management** and remove all **DO_NOT_TRUST_FiddlerRoot** profiles. You must remove them (not disable them).

1. Go to **Settings** > **WiFi** on your iOS device.

1. Find your current network and click the **i** icon.

1. Scroll to the bottom and choose **Manual** in the **Configure Proxy** option.

1. Type your Fiddler Classic machine IP address in the **Server** field.

1. Type the Fiddler Classic listening port (8888 by default) in the **Port** field and tap **Save**.

    >tip With the current setup, you can capture non-secure HTTP traffic. However, if you try to open any HTTPS website, you get a _This site's security certificate is not trusted_ error. To fix this error, proceed with the steps that follow below.

1. Open a browser on the iOS device and type the Fiddler Classic echo service address: `http://ipv4.fiddler:8888`

1. Click the Fiddler Classic root certificate link to download it.

 >important Ensure that the Fiddler Classic certificate is generated through the BouncyCastle certificate generator. [Learn more about certificate generators and how to install and enable BouncyCastle...](https://www.telerik.com/blogs/understanding-fiddler-certificate-generators).

1. On your iOS device, open **General** > **VPN & Device Management** and install the certificate via the **Profile Downloaded** option. Note that this option appears after the certificate is downloaded.

1. (iOS 10.3+) Go to **General** > **About** > **Certificate Trust Settings** and **enable full trust** for the **DO_NOT_TRUST_FiddlerRoot** certificate. Note that you see the **DO_NOT_TRUST_FiddlerRoot** certificate only after completing the previous step. 

## Uninstall FiddlerRoot Certificate

If you decide to uninstall the root certificate:

1. Tap the **Settings** app.

1. Tap **General**.

1. Scroll to **VPN & Device Management**.

1. Tap the **DO_NOT_TRUST_FiddlerRoot*** profile.

1. Tap **Remove**.
