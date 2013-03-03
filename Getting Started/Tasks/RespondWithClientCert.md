---
title: Respond to requests requiring client certificate
slug: RespondWithClientCert
tags: Configuration, HTTPS, Certificate
publish: true
ordinal: 5
---

Respond to Requests Requiring a Client Certificate
==================================================

To specify the .CER file for Fiddler to return for a given session, add this FiddlerScript*:

		oSession["https-Client-Certificate"] = "C:\\test\\someCert.cer";

To specify a .CER file for Fiddler to return otherwise, place that .CER file in:

		%USERPROFILE%\My Documents\Fiddler2\ClientCertificate.cer

To generate a .CER file:

1. [Install the certificate in the Current User's Personal Certificate Store][1].

2. Right-click the certificate in **Personal Certificates Store**.

3. Click **All Tasks > Export...**.


[1]: http://msdn.microsoft.com/en-us/library/windows/hardware/ff546307(v=vs.85).aspx
