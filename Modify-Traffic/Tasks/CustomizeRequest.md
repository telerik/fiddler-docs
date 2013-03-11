---
title: Customize a Request
slug: CustomizeRequest
tags: Modify Traffic, Composer
publish: true
ordinal: 1
---

The Composer allows you to craft custom requests to send to a server. You can either create a new request manually, or you can drag and drop a session from the Web Sessions list to create a new request based on the existing request.

Modes
-----

There are two modes for the Composer. In Parsed mode, you can use the boxes to build up a HTTP(S) request. In Raw mode, you must type in a properly formatted HTTP request yourself. Generally, using Parsed Mode is what you want.

Options
-------

The Options tab exposes options that allow you to customize the behavior of the Composer.

+ ##Inspect Session## selects the new session and activates the Inspectors tab when the request is issued.
+ ##Fix Content-Length Header## adjusts the value of the Content-Length request header (if present) to match the size of the request body.
+ ##Follow Redirects## causes a HTTP/3xx redirect to trigger a new request, if possible. The Composer will follow up to fiddler.composer.followredirects.max default redirections.
+ ##Automatically Authenticate## causes Fiddler to automatically respond to HTTP/401 and HTTP/407 challenges that use NTLM or Negotiate protocols using the current user's Windows credentials.

Tips and Tricks
---------------

1. Use drag-and-drop from the Session List to create a new request based on a previously-captured request.

2. Use a # character in the RequestURL to be prompted for a series of sequentially-numbered URLs to download. If you enter a leading 0 (zero) before the "Start At" value, then all numbers will be padded with leading zeros (if necessary) to get to that width.

For instance, if you have the URL http://www.example.com/#/?a=#, and enter the Start At value as 08 and the End At value as 11, the Composer will request the following URLs:

		http://www.example.com/08/?a=08
		http://www.example.com/09/?a=09
		http://www.example.com/10/?a=10
		http://www.example.com/11/?a=11

3. **Shift+Click** the Execute button to immediately break the new request for further editing using Fiddler's Inspectors

4. Add a dummy header **Fiddler-Encoding: base64** and encode your body using base64 if it contains any binary data. Fiddler will decode the data before transmitting it to the server.

5. Add a dummy header **Fiddler-Host: targettesthost** if you would like Fiddler to send your request to the specified server (http://targettesthost, in this case) while retaining the URL and host header specified elsewhere in the request. This is a convenience method that setS the X-OverrideHost, X-IgnoreCertCNMismatch and X-OverrideGateway flags on the new Session, removing the dummy header before contacting the specified server.

6. Click the **Upload File** link to have the composer inject one or more local files into the request body as it is sent to the server. 

If you would like the uploaded file to be sent as base64 (as you might in an XML post body) insert the token base64 into the string. For instance:

		<xml><mybody type=binary><@INCLUDE base64 *C:\Users\lawrence\Desktop\test.bin*@></mybody></xml>
 