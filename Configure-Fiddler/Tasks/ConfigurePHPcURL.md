---
title: Configure a PHP/cURL application to use Fiddler
slug: PHPcURL
tags: Configuration, PHP, cURL
publish: true
position: 7
---

Configure a PHP/cURL Application to Use Fiddler
===============================================

To configure a PHP/cURL application to send web traffic to Fiddler, add this line of code before the application sends requests, where $ch is the handle returned by curl_init():

		curl_setopt($ch, CURLOPT_PROXY, '127.0.0.1:8888');

Or, enter this command from the command line:

		curl --proxy 127.0.0.1:8888

