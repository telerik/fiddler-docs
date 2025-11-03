---
title: Bypass Upstream Proxy
description: Configuration code to bypass the upstream proxy for all requests to a specific domain
slug: BypassUpstreamProxy
publish: true
position: 23
previous_url: /configure-fiddler/tasks/bypassupstreamproxy
---

# Bypass the Upstream Proxy

To bypass the upstream proxy for all requests to a specific domain (for example, to emulate the IE Proxy bypass list), [add a rule to Fiddler](slug://AddRules) to the **OnBeforeRequest** function as follows:

```c#
if (oSession.HostnameIs("www.example.com")){
oSession.bypassGateway = true;
}
```

