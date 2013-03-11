---
title: Repeat 401 Errors
slug: Repeat401Errors
tags: Configuration, Troubleshooting, 401 errors, CBT Authentication
publish: true
ordinal: 3
---

Problem: Repeat 401 Errors and Windows Security Prompts
-------------------------------------------------------

When connecting to a server protected with channel-binding tokens (CBT), the server returns a series of 401 errors, and the browser continuously prompts for credentials.

Solution: [Configure Fiddler to authenticate to a CBT-protected server][1]
--------------------------------------------------------------------------

[1]: ../Tasks/AuthenticateWithCBT.md