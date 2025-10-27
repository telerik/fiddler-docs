---
title: Configure a PHP/cURL application
description: Configure a PHP/cURL application alongside the Fiddler Classic proxy
slug: PHPcURL
publish: true
position: 7
previous_url: /configure-fiddler/tasks/configurephpcurl
---

# Configure a PHP/cURL Application to Use Fiddler

To configure a PHP/cURL application to send web traffic to Fiddler Classic, add this line of code before the application sends requests, where $ch is the handle returned by curl_init():

```bash
curl_setopt($ch, CURLOPT_PROXY, '127.0.0.1:8888');
```

Or, enter this command from the command line:

```bash
curl --proxy 127.0.0.1:8888
```

