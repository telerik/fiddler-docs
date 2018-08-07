---
title: Vary Response Header
slug: VaryResponseHeader
tags: KnowledgeBase, Vary, WinINET
publish: true
position: 7
res_type: kb
---

About the Vary Response Header
==============================

As described in the HTTP/1.1 specification (RFC2616), the Vary response header allows a cache to determine if a cached (still fresh) response may be returned for a subsequent request, based on whether or not the new request's headers match those that were sent when the the previously response was originally cached.

  The Vary field value indicates the set of request-header fields that
  fully determines, while the response is fresh, whether a cache is
  permitted to use the response to reply to a subsequent request
  without revalidation. For uncacheable or stale responses, the Vary
  field value advises the user agent about the criteria that were used
  to select the representation.

The Problem
-----------

Unfortunately, the WinINET caching engine (below Internet Explorer and other applications) does not cache outbound request headers.  This limitation makes it impossible for WinINET to perform the request-header matching algorithm. 

Hence, Internet Explorer is conservative and generally will refuse to return a cached Vary response for a new request, except under special circumstances, as detailed below.

Internet Explorer 6
-------------------

Internet Explorer 6 will treat a response with a Vary header as completely uncacheable, unless the Vary header contains only the token User-Agent.  Hence, a subsequent request will be made unconditionally, resulting in a full re-delivery of the unchanged response. This results in a significant performance problem when Internet Explorer 6 encounters Vary headers.

Note: IE6 will ignore the Vary header entirely if the response was delivered with HTTP Compression; the header is dropped when URLMon decompresses the cache file on WinINET's behalf.

Internet Explorer 7
-------------------

For Internet Explorer 7, the problem was not eliminated, but its impact was mitigated in some common cases. 

When evaluating a cached response that has a Vary, IE7 can make a conditional request (e.g. If-Modified-Since) rather than an unconditional request.

In order to take advantage of this improvement, the original response must contain an ETag.

Even though revalidation of cache response will require one round trip to server, it is still a significant improvement if server responds with a HTTP/304, because the response body is not transmitted.

Note, WinINET will remove the Vary: Accept-Encoding header if it decompressed the response.  Therefore, you should only send a Vary: Accept-Encoding header when you have compressed the content (e.g. Content-Encoding: gzip).

Best Practices
--------------

Never send Vary: Host.  All responses implicitly vary by hostname, because the hostname is a part of the URI, and all requests vary by URI.
Only send a Vary: Accept-Encoding header when you have compressed the content (e.g. Content-Encoding: gzip).
 