---
title: No authentication when capturing traffic to local IIS server
page_title: Local IIS Authentication Failure - Fiddler Classic
description: Fix authentication failures when capturing local IIS traffic caused by Windows loopback protection.
slug: NoLocalAuth
publish: true
position: 30
---

# Fiddler's "Automatic Authentication" Feature Does Not Work When Server and Client Are on the Same Machine

If IIS and the client are on the same machine, then a feature called "Loopback protection" is causing the authentication request to fail because your computer recognizes that it is authenticating to itself, and it is unexpected (due to the proxy).

You need to set `DisableLoopbackCheck=1` as described here: [http://support.microsoft.com/kb/926642](http://support.microsoft.com/kb/926642)