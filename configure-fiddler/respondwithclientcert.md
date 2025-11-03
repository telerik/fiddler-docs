---
title: Using Client Certificates
description: Respond to a HTTP requests that require the usage of specific client certificates.
slug: RespondWithClientCert
publish: true
position: 35
---

# Using Client Certificates

To specify the .CER file for Fiddler Classic to return for a given session, add this FiddlerScript*:

```c#
oSession["https-Client-Certificate"] = "C:\\test\\someCert.cer";
```

To specify a .CER file for Fiddler Classic to return otherwise, place that .CER file in:

```bash
%USERPROFILE%\My Documents\Fiddler2\ClientCertificate.cer
```		

To generate a .CER file:

1. [Install the certificate in the Current User's Personal Certificate Store](https://msdn.microsoft.com/en-us/library/windows/hardware/ff546307(v=vs.85).aspx).
1. Right-click the certificate in **Personal Certificates Store**.
1. Click **All Tasks > Export...**.
