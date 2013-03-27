---
title: Headers Reference
slug: Headers
tags: KnowledgeBase, HTTP, Expires, Cache-Control must-revalidate, set-cookie
publish: true
ordinal: 8
---

Key References
--------------

HTTP Response Status codes: [RFC 2616 List][1] or [Expanded Wikipedia List][2]
[HTTP RFC Header Definitions][3]
[IANA Header Registrations][4]
[Jukka Korpela's list of HTTP Headers][5]

Additional Information
----------------------

Following are some remarks on a few of the HTTP headers that are often misunderstood.



**Expires**

Date the response expires and should no longer be used by a cache.  See [http://www.mnot.net/cache_docs/][6] or pg 183.  Note that this header should be overruled by the Cache-Control header in a HTTP1.1 client.



**Cache-Control: must-revalidate**	

Note that the O'Reilly book (and many other places, including IE) implement this incorrectly! See [http://www.mnot.net/cache_docs/][6] or [RFC2616][7].



**P3P**	

Compact P3P Privacy statement.  See [http://www.p3pwriter.com/LRN_111.asp][8] for a description of the token meanings.  See also [Info on IE6's Privacy features and impact on HTTP Cookies][9].



**Set-Cookie**	 

Info on IE's Privacy features and impact on HTTP Cookies



[1]: http://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html
[2]: http://en.wikipedia.org/wiki/List_of_HTTP_status_codes
[3]: http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html
[4]: http://www.iana.org/assignments/message-headers/message-header-index.html
[5]: http://www.cs.tut.fi/~jkorpela/http.html
[6]: http://www.mnot.net/cache_docs/
[7]: http://www.faqs.org/rfcs/rfc2616.html
[8]: http://www.p3pwriter.com/LRN_111.asp
[9]: http://msdn.microsoft.com/en-us/library/ms537343.aspx

