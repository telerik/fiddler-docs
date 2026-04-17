---
title: No authentication when capturing traffic to local IIS server
meta_title: No Local Auth with IIS - Fiddler Classic Documentation
description: Learn how to fix authentication issues in Fiddler Classic when capturing traffic to a local IIS server by adjusting proxy settings.
slug: NoLocalAuth
publish: true
position: 30
---

# Fiddler's "Automatic Authentication" feature doesn't work when server and client are on the same machine?

If IIS and the client are on the same machine, then a feature called "Loopback protection" is causing the authentication request to fail because your computer recognizes that it is authenticating to itself, and it is unexpected (due to the proxy).

You'll need to set **DisableLoopbackCheck=1** as described here: [http://support.microsoft.com/kb/926642](http://support.microsoft.com/kb/926642)