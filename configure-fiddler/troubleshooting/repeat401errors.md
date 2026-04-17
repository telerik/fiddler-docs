---
title: Repeat 401 Errors
page_title: Resolving Repeat 401 Errors - Fiddler Classic
description: Resolve repeated 401 errors and Windows Security prompts caused by channel-binding token authentication.
slug: Repeat401Errors
publish: true
position: 3
---

# Problem: Repeat 401 Errors and Windows Security Prompts

When connecting to a server protected with channel-binding tokens (CBT), the server returns a series of 401 errors, and the browser continuously prompts for credentials.

## Solution: 

[Configure Fiddler Classic to authenticate to a CBT-protected server](slug://AuthenticateWithCBT)