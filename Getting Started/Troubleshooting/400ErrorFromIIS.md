---
title: 400 Bad Request Error from IIS Express
slug: 400ErrorFromIIS
tags: Configuration, Troubleshooting, 400 Bad Request error, IIS Express, localhost.fiddler, request hostname is invalid
publish: true
ordinal: 4
---

Problem: Unexpected 400 Bad Request Error from IIS Express
----------------------------------------------------------

When requesting **http://ipv4.fiddler:2468** from an IIS Express instance, the server returns the following unexpected error message:

		HTTP/1.1 400 Bad Request
		Content-Type: text/html;charset=us-ascii
		Server: Microsoft-HTTPAPI/2.0
		Date: Wed, 22 Aug 2012 19:59:52 GMT
		Connection: close
		Content-Length: 334

		<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN""http://www.w3.org/TR/html4/strict.dtd">
		<HTML><HEAD><TITLE>Bad Request</TITLE>
		<META HTTP-EQUIV="Content-Type" Content="text/html; charset=us-ascii"></HEAD>
		<BODY><h2>Bad Request - Invalid Hostname</h2>
		<hr><p>HTTP Error 400. The request hostname is invalid.</p></BODY></HTML>

Solution: Replace **http://ipv.fiddler:2468** with **http://localhost.fiddler:2468**
------------------------------------------------------------------------------------

See also
--------

ipv4.fiddler:2468 vs. ipv.fiddler:2468*
Capture traffic from localhost*
