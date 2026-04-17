---
title: Configure a PHP/cURL application
meta_title: Configure PHP and cURL Application - Fiddler Classic Documentation
description: Learn how to configure a PHP or cURL application to route its traffic through the Fiddler Classic web debugging proxy.
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

