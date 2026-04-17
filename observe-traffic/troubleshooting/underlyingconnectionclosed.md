---
title: "Exception: The underlying connection was closed"
meta_title: Underlying Connection Closed - Fiddler Classic Documentation
description: Learn how to troubleshoot underlying connection closed errors in Fiddler Classic by checking keep-alive, TLS, and proxy settings.
slug: UnderlyingConnectionClosed
publish: true
position: 5
---

# Problem

I get a System.NET.WebException "The underlying connection was closed" when calling into WebServices.

## Solution

When debugging a .Net application through Fiddler, you may see a System.Net.WebException, with message *"The underlying connection was closed: A connection that was expected to be kept alive was closed by the server."*

This is a bug in your application (it should handle this type of exception).

>tip This problem is very unlikely in Fiddler Classic 2.2.8.5 and later, due to enhanced client connection reuse support.
