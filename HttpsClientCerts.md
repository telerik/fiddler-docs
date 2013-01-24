---
title: Attaching client certificates
slug: attaching-client-certificates
tags: certificates
publish: true
---

<!-- http://fiddler2.com/Fiddler/help/httpsclientcerts.asp -->

#Attaching client certificates

##Introduction
Fiddler2 includes the ability to decrypt, view, and modify HTTPS-secured traffic for debugging purposes.  This feature is disabled by default, but can be enabled in Fiddler's Tools > Fiddler Options dialog.

See [Decrypting HTTPS traffic with Fiddler2](http://fiddler2.com/Fiddler/help/httpsdecryption.asp) for more information on HTTPS decryption support in Fiddler.

Fiddler's HTTPS decryption feature also offers basic support for intercepting requests that require client certificates and responding with a client certificate from the machine running Fiddler.

##Selection of Client Certificate
If a .CER file has been specified for a given session as follows:

	oSession["https-Client-Certificate"] = "C:\\test\\someCert.cer";

...then Fiddler will simply use that certificate for the current session.

Otherwise, Fiddler will look for the file  

	%USERPROFILE%\My Documents\Fiddler2\ClientCertificate.cer
	
and attach that certificate.

##CER files and Private Keys
A .CER file does not actually contain the private key for the certificate. The local CER merely acts as a pointer to a certificate in your Personal Certificates store-- that certificate, installed the Windows Personal Certificate store (certmgr.msc) contains the private key.

##Where do I get the .CER File?
After your certificate is installed in the Current User's Personal Certificates store (see certmgr.msc), simply right-click the certificate, choose All Tasks > Export....

If the certificate isn't yet in the Current User's Personal Certificates store (e.g. you only have a .pfx file) then first import it into the certificate store, then export a .CER file.

##Using the certificate from a SmartCard
If you export a .CER from the SmartCard certificate, Fiddler will use the matching certificate from the smartcard to authenticate to the server.