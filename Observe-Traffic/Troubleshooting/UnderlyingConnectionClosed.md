---
title: Exception: The underlying connection was closed
slug: UnderlyingConnectionClosed
tags: Observe Traffic, Troubleshooting, System.NET.WebException, WebServices
publish: true
ordinal: 5
---

Problem
-------

I get a System.NET.WebException "The underlying connection was closed" when calling into WebServices.

Solution
--------

When debugging a .Net application through Fiddler, you may see a System.Net.WebException, with message *"The underlying connection was closed: A connection that was expected to be kept alive was closed by the server."*

This is a bug in your application (it should handle this type of exception).

Note: This problem is very unlikely in Fiddler 2.2.8.5 and later, due to enhanced client connection reuse support.
