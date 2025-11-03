---
title: Headers Reference
slug: Headers
publish: true
position: 8
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>5.0.20253</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Fiddler Classic </td>
		</tr>
	</tbody>
</table>

## Headers References

This article lists several popular references for HTTP headers. We also explain some of the [frequently misinterpreted HTTP headers](#additional-Information).

References for HTTP Response Status codes: 
+ [RFC 2616 List][1] or [Expanded Wikipedia List][2]
+ [HTTP RFC Header Definitions][3]
+ [IANA Header Registrations][4]
+ [Jukka Korpela's list of HTTP Headers][5]

## Additional Information

Following are some remarks on a few of the HTTP headers that are often misunderstood.

**Expires**

Date the response expires and should no longer be used by a cache.  See [http://www.mnot.net/cache_docs/][6] or pg 183.  Note that this header should be overruled by the Cache-Control header in a HTTP1.1 client.

**Cache-Control: must-revalidate**	

Note that the O'Reilly book (and many other places, including IE) implement this incorrectly! See [http://www.mnot.net/cache_docs/][6] or [RFC2616][7].

**P3P**	

Compact P3P Privacy statement.  For more information refer to [IE6's Privacy features and impact on HTTP Cookies][8].

**Set-Cookie**	 

Info on IE's Privacy features and impact on HTTP Cookies

[1]: https://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html
[2]: https://en.wikipedia.org/wiki/List_of_HTTP_status_codes
[3]: https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html
[4]: https://www.iana.org/assignments/message-headers/message-header-index.html
[5]: http://www.cs.tut.fi/~jkorpela/http.html
[6]: http://www.mnot.net/cache_docs/
[7]: http://www.faqs.org/rfcs/rfc2616.html
[8]: https://msdn.microsoft.com/en-us/library/ms537343.aspx

