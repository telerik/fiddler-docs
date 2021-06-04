---
title: Bypass Upstream Proxy
description: Configuration code to bypass the upstream proxy for all requests to a specific domain
slug: BypassUpstreamProxy
publish: true
position: 23
---

Bypass the Upstream Proxy
=========================

To bypass the upstream proxy for all requests to a specific domain (for example, to emulate the IE Proxy bypass list), [add a rule to Fiddler][1] to the **OnBeforeRequest** function as follows:

		if (oSession.HostnameIs("www.example.com")){
		oSession.bypassGateway = true;
		}

[1]: ../../Extend-Fiddler/AddRules

