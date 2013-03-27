---
title: Capture HTTPS traffic from Firefox
slug: FirefoxHTTPS
tags: Getting Started, Configuration, Firefox, HTTPS, Fiddler Root Certificate
publish: true
ordinal: 24
---

Capture HTTPS traffic from Firefox
==================================

Configure Fiddler 
-----------------

 1. Click **Tools > Fiddler Options**. 

 2. Click the **HTTPS** tab. Ensure the **Decrypt HTTPS traffic** checkbox is checked. 

 3. Click the **Export Fiddler Root Certificate to Desktop** button.
 
   ![Export Root Certificate to Desktop][3]

Configure Firefox
-----------------

+ Use [FiddlerHook][1] to walk through importing the Fiddler Root certificate.

![FiddlerHook Import][2]

+ Or, import the certificate manually:

 1. Click **Tools > Options... > Advanced > Encryption > View Certificates > Authorities > Import**. 

   ![Import Certificate][4]

 2. Select the **.CER** file from your desktop.

 3. Click the checkbox next to **Trust this CA to identify web sites.**

  ![Trust this CA to identify web sites][3]

[1]: ../../KnowledgeBase/FiddlerHook
[2]: ../../images/FirefoxHTTPS/FiddlerHookImport.png
[3]: ../../images/ConfigureBrowsers/ExportRootCertificateToDesktop.png
[4]: ../../images/ConfigureBrowsers/ImportCertificate.png
