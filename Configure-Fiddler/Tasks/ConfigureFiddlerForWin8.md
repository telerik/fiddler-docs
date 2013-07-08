---
title: Configure Fiddler for Windows 8 Metro-style applications
slug: Windows8Config
tags: Configuration, Windows 8, Certificate, Metro, Loopback
publish: true
ordinal: 15
---

<!-- http://fiddler2.com/Fiddler/help/AndroidNexus7.asp -->

Configure Fiddler for Windows 8 Metro-style applications
========================================================

Follow two steps to configure Fiddler for Windows 8:

+ Create a Loopback Exemption
+ Place Fiddler Root Certificate in the Machine's Trusted Root Store

Create a Loopback Exemption
---------------------------

1.	(Fiddler2 Only:) Install the [EnableLoopback Utility][1] by clicking the **Win8 Config** button.

      ![Win8 Config Button][10]

2.	Open the Fiddler Tools menu and click Win8 Loopback Exemptions. 

      ![Fiddler Tools menu][2]



3.    Check the box next to each application that will send traffic to Fiddler.  This requires Administrator privileges.

      ![AppContainer Loopback Exemption Utility][3].

Now these applications can send traffic to Fiddler.

* To allow Unit Tests in Visual Studio 2012 to send traffic to Fiddler, click the AppContainer Loopback Exemption Utility Refresh button while the Unit Test is running. An AppContainer for the Unit Test will appear. Check the box for this AppContainer. [Learn more][4].  

* An alternative to using the AppContainer Loopback Exemption Utility is to [declare the privateNetworkClientServer permission][5].

Place Fiddler Root Certificate in the machine's Trusted Root store
--------------------------------------------------------------------

1.	Enable Fiddler HTTPS-decryption feature. A **Warning** dialog appears. Click **Yes** to trust the Fiddler Root certificate.

 ![Warning dialog][6]

2.	A Security Warning dialog appears. Click **Yes** to install the Fiddler Root certificate.

 ![Security warning][7]

3.	The User Account Control dialog appears. Click **Yes** to place the Fiddler Root Certificate into the machine-wide Trusted Root Certification Authorities store.

 ![User Account Control dialog][8]

4.	The TrustCert Confirmation dialog appears. Click **Yes**.

 ![TrustCert Confirmation][9]


[1]: http://fiddler2.com/add-ons
[2]: ../../images/ModelDoc/ToolsMenuLoopbackExemptions.png "Fiddler Tools menu"
[3]: ../../images/ModelDoc/AppContainerLoopbackExemptionUtility.png "AppContainer Loopback Exemption Utility"
[4]: http://stackoverflow.com/questions/13360309/using-fiddler-with-windows-store-unit-test
[5]: http://msdn.microsoft.com/en-us/library/windows/apps/br211380
[6]: ../../images/ModelDoc/WarningDialogTrustFiddlerRootCert.png "Trust Fiddler Root certificate warning dialog" 
[7]: ../../images/ModelDoc/SecurityWarningInstallFiddlerRootCert.png "Install Fiddler Root certificate security warning dialog"
[8]: ../../images/ModelDoc/UACDialog.png "User Account Control dialog"
[9]: ../../images/ModelDoc/TrustCertConfirmDialog.png "TrustCert Confirmation dialog"
[10]: ../../images/ConfigureForWin8/Win8Config.png "Win8 Config Button"
