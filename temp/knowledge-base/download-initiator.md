---
title: Understanding Download-Initiator
slug: Download-Initiator
publish: true
position: 13
res_type: kb
---

Understanding Download-Initiator
================================

Proxy-based debuggers have a few key strengths -- chief among them is the ability to debug traffic from any application that supports a proxy (which is prettdy much all of them). One downside of debugging at the proxy layer, however, is the loss of context -- it can be very difficult to trace back to determine *why* a given HTTP request was issued.

Having said that, Fiddler Classic includes a number of features to help you understand context. First, Fiddler Classic attempts to map inbound requests back to the process that issued them. For browsers like Internet Explorer 8, with its loosely-coupled process architecture, this often means that each browser tab sends traffic from an individual process. The process information is shown in the Process column in the [Web Sessions List][1], and FiddlerScript and extensions may access the Process Name and instance ID (PID) using the Session object flag named **X-PROCESSINFO**.

Fiddler Classic also uses the HTTP **Referer** header to help you [associate traffic][2]. Fiddler Classic assumes that the parent session is the session is the most recent request to the URL specified in the selected session's Referer header. "Child requests" are those requests after the current request that have a Referer of the currently selected session's URL. 

Internet Explorer 9 includes two new features that help add more context.

First, the Web Browser now sends a meaningful Accept header for most types of downloads. Previously, IE sent a long, registry-generated string for document downloads and Accept: */* for everything else. This limitation made it impossible to reliably distinguish between a request initiated by a **LINK REL=STYLESHEET** element and one initiated by **SCRIPT** element. IE9 RC will send the following Accept headers, depending on context:


+ **Frame/markup** 

		text/html, application/xhtml+xml, */*

+ **CSS** 

		text/css

+ **Script** 

		application/javascript, */*;q=0.8

+ **Image**	

		image/png, image/svg+xml, image/*;q=0.8, */*;q=0.5

+ **Generic context**

		*/*

For compatibility with legacy sites, the legacy **Accept** headers are sent when a site is configured to run in [Compatibility View][3].

Within Fiddler, you can display the Accept header in the Session list as a column. To do so just for the current session, enter the following command in the [QuickExec box][4]:

		cols add @request.Accept

This will add a column labelled **@request.Accept** and as each session is logged, the request's Accept header, if any, will be listed. To add this column every time Fiddler Classic starts, click Rules > Customize Rules. Scroll to the static function Main() block , and add the following line within:

		FiddlerObject.UI.lvSessions.AddBoundColumn("Accept", 50, "@request.Accept");

Second, while understanding what class of Element initiated a request is useful, IE9 includes an even more valuable feature that conveys contextual information about why a request was made. You can see this feature at work in the Internet Explorer F12 Developer Tools, which you can open by pressing (you guessed it) the F12 key. On the Network tab, you'll see the **Initiator** column that provides more information about the context in which a request was made:



This information, by default, is not sent to the network, but you may set a Feature Control Key to emit the information as a custom HTTP request header that Fiddler Classic will see. Most Feature Control Keys, including this one, are simple flags stored in the registry that change the behavior of the Web Browser when set.

+ [Enable FEATURE_DOWNLOAD_INITIATOR_HTTP_HEADER][7]
+ [Disable FEATURE_DOWNLOAD_INITIATOR_HTTP_HEADER][8]

You can display this information in Fiddler Classic using the same technique described previously:

		cols add @request.X-Download-Initiator

This will add a column labelled **@request.Accept** and as each session is logged, the request's Accept header, if any, will be listed. To add this column every time Fiddler Classic starts, click Rules > Customize Rules. Scroll to the static function Main() block , and add the following line within:

		FiddlerObject.UI.lvSessions.AddBoundColumn("Reason", 50, "@request.X-Download-Initiator");

Then, when you load a page, you will see the initiator information:

![Reason Column][5]

Interpretation of these tokens is as follows. First, there's a token (e.g. image, script, html) indicating what type of content is being downloaded. Next, an indicator of which document object "owns" the download. Information about what element made the request is present, and in some cases, information about what the exact download trigger was. For instance "html tokenizer" means that the download request occurred during the parsing of HTML. "html lookahead" indicates that the [Lookahead parser] is making the request. On the other hand, "src property change" means that the download occurred because script changed the SRC property of an **img** tag.

[1]: ../Observe-Traffic/Tasks/ViewSessionSummary
[2]: ../Observe-Traffic/Tasks/ParentChild
[3]: https://blogs.msdn.com/b/patricka/archive/2010/09/16/if-i-m-using-internet-explorer-9-beta-what-should-i-do-if-a-site-is-broken-or-hangs-or-crashes-etc.aspx
[4]: ./QuickExec
[5]: ../images/Download-Initiator/Download-Initiator.png
[6]: https://blogs.msdn.com/b/ieinternals/archive/2010/04/01/ie8-lookahead-downloader-fixed.aspx
[7]: https://www.fiddler2.com/dl/EnableDownloadInitiator.reg
[8]: http://www.fiddlerbook.com/dl/DisableDownloadInitiator.reg
