---
title: Fiddler Classic SessionFlags
description: "Learn more about the FiddlerScript's sessioon flags in Fiddler Classic"
slug: SessionFlags
publish: true
position: 4
res_type: kb
---

Fiddler Classic SessionFlags
====================

Each Session object in Fiddler Classic contains a collection of string flags, in the **Session.oFlags[]** collection.  The flags control how the session is processed and displayed in the Fiddler Classic [Web Session List][4].  Flags can be set by [FiddlerScript][1] or an [IFiddlerExtension][2].

Using SessionFlags
------------------

+ Flag names are not case-sensitive.  

+ Flag values are always strings.

+ If you examine **oFlags["non-existent-flag"]**, the result will be **null**.

+ The **oFlags** collection is the "indexer" for the **Session** object, so **oSession.oFlags["flagname"]** can be written as:
  + **oSession["flagname"]** or 
  + **oSession["SESSION", "flagname"]**

+ You can remove a flag from the list by:
  + Calling: **oFlags.Remove("flagname")** or 
  + Setting **oSession["flagname"] = null**

+ The value of most flags is not important; simply adding the flag is enough.  So **oSession["ui-hide"]="no"** does the same thing as **oSession["ui-hide"] = "true"** (hides the session).

+ While you can call **oFlags.Add("flagname")**, this will throw an exception if the flag already exists.  It's better to just set the value: **oFlags["flagname"] = "value";**

+ You can create new flags that attach metadata to a given session. To avoid naming conflicts, it's recommended that you choose distinctive flagnames. For example: **addon.acme.loggingFlag**.

UI Flags
--------

**ui-hide**

Hide the session from the Session List.   

+ The session will continue to run.  
+ Breakpoints on hidden sessions are ignored.
+ Note: hiding a session will free up the memory that would otherwise be used to hold the session data in memory.



**ui-color**

The value of this flag determines the font color used to render this session in the Session List.



**ui-backcolor**

The value of this flag determines the background color used behind this session's entry in the Session List.



**ui-bold**

If present, this session's entry will be bolded in the Session List.



**ui-italic**

If present, this session's entry will be italicized in the Session List.



**ui-strikeout**

If present, this session's entry will be struck out in the Session List.



**ui-customcolumn**

The value of this flag is shown in the Fiddler Classic Session List's "User-defined" column.



**ui-comments**

The Comment, if any, which the user set on this session.



Breakpoint Flags
----------------

**x-breakrequest**

If present, execution of this session will pause before the request is issued.



**x-breakresponse**

If present, execution of this session will pause after the response is received.



Host Flags
---------

**x-overrideHost**

Provide the Host:Port combination which should be used for DNS resolution purposes. Note that this mechanism does not change the HOST header on the request, and thus is not useful if there's an upstream gateway.



**x-hostIP**

Read-only.  Indicates the IP address of the server used for this request.



**x-overrideGateway**

Provide the Host:Port combination of a gateway that should be used to proxy this request, or DIRECT to send the request directly to the origin server.


Client Flags
------------

**x-ProcessInfo**

Information (module name and ProcessID) on source of local requests.  Requires Fiddler Classic v2.1.4.1 or later.



**x-clientIP**

Read-only.  Indicates the client IP that sent this request.  Mostly useful when multiple computers on a network are pointed to a single Fiddler Classic instance.



**x-clientport**

Read-only.  Indicates the port on the client that sent this request.



Socket Reuse Flags
------------------

**x-serversocket**

Read-only.  String containing data about the reuse status of the server socket.



**x-securepipe**

Read-only. String containing data about the reuse status of a secure server socket.



Decryption and Authentication Flags
-----------------------------------

**x-no-decrypt**

If set on a CONNECT tunnel, the traffic in the tunnel will not be decrypted.  Requires Fiddler Classic v2.0.8.9 or later.



**https-Client-Certificate**

Filename of client certificate (e.g. .CER) that should be attached to this secure request.  Requires Fiddler Classic v2.1.0.3 or later.



**x-OverrideCertCN**

String specifying the hostname that should appear in the CN field of this CONNECT tunnel's Fiddler-generated certificate.



**x-SuppressProxySupportHeader**

Prevent Fiddler Classic from adding a "Proxy-Support: Session-Based-Authentication" header to HTTP/401 or HTTP/407 responses that request Negotiate or NTLM authentication. Requires Fiddler Classic v2.1.4.2 or later.



Performance Flags
-----------------

**x-TTFB**

Deprecated.  Use oSession.Timer instead.  Time to the first byte of the response, in milliseconds.



**x-TTLB**

Deprecated.  Use oSession.Timer instead.  Time to the last byte of the response, in milliseconds.



**request-trickle delay**

Milliseconds to delay each outbound kilobyte of request data.



**response-trickle-delay**

Milliseconds to delay each inbound kilobyte of response data.



AutoResponder Flags
-------------------

**x-replywithfile**

The value of this flag is the name of a file in the Captures/Responses folder (or a fully-qualified filename) containing a HTTP response to return to the client rather than sending the request to the server.



**x-repliedwithfile**

Read-only.  Contains the name of the file specified in x-replywithfile, after the automatic response was loaded.



Drop Sessions Flags
-------------------

**log-drop-request-body**

Drop the request body from the session list after request is sent to the server.  Useful for minimizing memory usage.



**log-drop-response-body**

Drop the request body from the session list after response is sent to the client.  Useful for minimizing memory usage.




[1]: ../Extend-Fiddler/AddRules
[2]: ../Extend-Fiddler/Interfaces
[3]: ../Observe-Traffic/Tasks/ExamineWebTraffic
