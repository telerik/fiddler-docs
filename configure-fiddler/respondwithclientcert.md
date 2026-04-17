---
title: Using Client Certificates
page_title: Using Client Certificates - Fiddler Classic
description: Respond to HTTP requests that require specific client certificates by configuring FiddlerScript.
slug: RespondWithClientCert
publish: true
position: 35
previous_url: /configure-fiddler/tasks/respondwithclientcert
---

# Using Client Certificates

To specify the `.cer` file for Fiddler Classic to return for a given session, add the following FiddlerScript:

```c#
oSession["https-Client-Certificate"] = "C:\\test\\someCert.cer";
```

To specify a `.cer` file for Fiddler Classic to return otherwise, place that `.cer` file in:

```bash
%USERPROFILE%\My Documents\Fiddler2\ClientCertificate.cer
```		

To generate a `.cer` file:

1. [Install the certificate in the Current User's Personal Certificate Store](https://msdn.microsoft.com/en-us/library/windows/hardware/ff546307(v=vs.85).aspx).
1. Right-click the certificate in **Personal Certificates Store**.
1. Click **All Tasks** > **Export...**.
