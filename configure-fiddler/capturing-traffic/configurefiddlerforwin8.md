---
title: Capture traffic from Windows Metro-style applications
description: Configure Fiddler Classic for Windows 8 Metro-style applications
slug: Windows8Config
publish: true
position: 15
---

<!-- http://fiddler2.com/Fiddler/help/AndroidNexus7.asp -->

Configure Fiddler Classic for Windows 8 Metro-style applications
========================================================

Follow two steps to configure Fiddler Classic for Windows 8:

+ Create a Loopback Exemption
+ Place Fiddler Root Certificate in the Machine's Trusted Root Store

Create a Loopback Exemption
---------------------------

1.	(Fiddler2 Only:) Install and launch the [EnableLoopback Utility][1] by clicking the **Win8 Config** button.

      ![Win8 Config Button][10]


2.    Check the box next to each application that will send traffic to Fiddler Classic.  This requires Administrator privileges.

      ![AppContainer Loopback Exemption Utility][3].

Now these applications can send traffic to Fiddler Classic.

* To allow Unit Tests in Visual Studio 2012 to send traffic to Fiddler Classic, click the AppContainer Loopback Exemption Utility Refresh button while the Unit Test is running. An AppContainer for the Unit Test will appear. Check the box for this AppContainer. [Learn more][4].

* An alternative to using the AppContainer Loopback Exemption Utility is to [declare the privateNetworkClientServer permission][5].

Place Fiddler Root Certificate in the machine's Trusted Root store
--------------------------------------------------------------------

1.	Enable Fiddler Classic HTTPS-decryption feature. A **Warning** dialog appears. Click **Yes** to trust the Fiddler Root certificate.

 ![Warning dialog][6]

2.	A Security Warning dialog appears. Click **Yes** to install the Fiddler Root certificate.

 ![Security warning][7]

3.	The User Account Control dialog appears. Click **Yes** to place the Fiddler Root Certificate into the machine-wide Trusted Root Certification Authorities store.

 ![User Account Control dialog][8]

4.	The TrustCert Confirmation dialog appears. Click **Yes**.

 ![TrustCert Confirmation][9]


[1]: https://www.telerik.com/fiddler/add-ons
[2]: ../../images/ModelDoc/ToolsMenuLoopbackExemptions.png "Fiddler Classic Tools menu"
[3]: ../../images/ModelDoc/AppContainerLoopbackExemptionUtility.png "AppContainer Loopback Exemption Utility"
[4]: https://stackoverflow.com/questions/13360309/using-fiddler-with-windows-store-unit-test
[5]: https://msdn.microsoft.com/en-us/library/windows/apps/br211380
[6]: ../../images/ModelDoc/WarningDialogTrustFiddlerRootCert.png "Trust Fiddler Root certificate warning dialog"
[7]: ../../images/ModelDoc/SecurityWarningInstallFiddlerRootCert.png "Install Fiddler Root certificate security warning dialog"
[8]: ../../images/ModelDoc/UACDialog.png "User Account Control dialog"
[9]: ../../images/ModelDoc/TrustCertConfirmDialog.png "TrustCert Confirmation dialog"
[10]: ../../images/ConfigureForWin8/Win8Config.png "Win8 Config Button"
