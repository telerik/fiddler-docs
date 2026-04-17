---
title: Capture WCF Service with localhost Filter 
meta_title: Capture WCF on Localhost - Fiddler Classic Documentation
description: Learn how to capture WCF service traffic on localhost by configuring Fiddler Classic with proper proxy and filter settings.
slug: capture-wcf-services-with-localhost-filter
ticketid: 1445633
res_type: kb
type: how-to
## Environment
<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>5.0.20194</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Fiddler Classic </td>
		</tr>
	</tbody>
</table>


## Description
The .NET Framework bypasses all proxies on localhost. This means WCF Services will not be captured. In order to capture WCF Services using Fiddler. Disable the bypassonlocal and point the application to the Fiddler Classic Proxy address.

## Solution
In the web.config or app.config add the following proxy settings.

````XML
<system.net>
  <defaultProxy>
    <proxy  bypassonlocal="False" usesystemdefault="True" proxyaddress="http://127.0.0.1:8888" />
  </defaultProxy>
</system.net>
````

## See Also
* [Capture .NET Applications with Fiddler](https://docs.telerik.com/fiddler/configure-fiddler/tasks/ConfigureDotNETApp)
* [Capturing Traffic from .NET Services with Fiddler](https://www.telerik.com/blogs/capturing-traffic-from-.net-services-with-fiddler)