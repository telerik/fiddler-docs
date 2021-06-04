---
title: Filters
description: Using Fiddler Classic filters and applying Regex.
slug: Filters
publish: true
position: 5
res_type: kb
---

Filters Reference
=================

Fiddler's Filters tab allows you to easily filter and flag traffic displayed in the Fiddler UI, as well as perform some lightweight modifications.

This article describes the available filtering options and their usage.

Hosts
-----

The **Zone Filter** dropdown at the top of the dialog allows you to show traffic only to your Intranet (e.g. dotless hostnames) or only to the Internet (e.g. dotted hostnames). This is a useful option when debugging a site in one zone while referencing web-based documentation from the other zone.

The **Host Filter** dropdown enables you to flag or exclude displaying of traffic to specified domain names. Use the wildcard symbol to adjust your filter, for example:

* To display traffic from subdomains of *fiddler2.com*:
    1. Select **Show only the following Hosts**.
    1. Add the _*.fiddler2.com_ filter in the text box.

    These filter settings allow you to see only traffic from the fiddler2.com domain and its subdomains like www.fiddler2.com and test.fiddler2.com.

* To display traffic only from *fiddler2.com* and exclude its subdomains:

    1. Select **Show only the following Hosts**.
    1. Add the _fiddler2.com_ filter in the text box.

* To display traffic from all subdomains of *fiddler2.com* and also from _fiddler2.com_:

    1. Select **Show only the following Hosts**.
    1. Add the _*fiddler2.com_ filter in the text box.

    If you remove the wildcard and set the filter to _fiddler2.com_, you will see no traffic from these subdomains.

The following table summarizes the filters that we used to demonstrate how to display traffic from the _fiddler2.com_, _www.fiddler2.com_, and _test.fiddler2.com_ domains:

| Filter | Displayed traffic | Excluded traffic |
| -------| ----------------- | ---------------- |
| fiddler2.com | fiddler2.com | www.fiddler2.com, test.fiddler2.com |
| *.fiddler2.com | www.fiddler2.com, test.fiddler2.com | fiddler2.com |
| *fiddler2.com | fiddler2.com, www.fiddler2.com, test.fiddler2.com |

>When the text box is yellow, your changes have not yet been applied. Click anywhere outside the box to save your changes to the list.

When configured to hide traffic to certain hosts, Fiddler will still proxy traffic to those hosts, but that traffic will be hidden from the Fiddler Session List. List multiple hosts using a semi-colon.

![Filter to Hosts][1]

Client Process
--------------

The process filter allows you to control which processes' traffic is shown within Fiddler. 

The **Hide traffic from Service Host** option will hide traffic from svchost.exe, a system process that synchronizes RSS Feeds and performs other background network activity.

>Fiddler can only determine the process name/PID owner of a request when the client application is running on the same computer as Fiddler itself.
>When configured to hide traffic from certain processes, Fiddler will still proxy their traffic, but that traffic will be hidden from the Fiddler Session List.

Breakpoints
-----------

The breakpoints enable you to break requests or responses that contain the specified attributes.

Request Headers
---------------

Using these options, you can add or remove HTTP request headers, and flag responses that contain certain headers.

You can also filter displayed traffic down to specific URLs with the **Show only if url contains** box. You can demand case-sensitivity with the **EXACT** directive

    EXACT://example.com/q=Case+Sensitive+String 

or you can use regular expressions, so you can use:

     REGEX:(?insx).*\.(gif|png|jpg)$ #only show requests for img types

Response Status Code
--------------------

Using these options, you can filter display of responses based on the Response Status Code.

You can set the boxes to hide sessions whose responses code match target values [HTTP errors, redirects, authentication challenges and cache-reuse].

Response Type and Size
----------------------

Using these options, you can control what types of responses appear within the session list.

The list of "Block" checkboxes enables blocking responses of the specified types, returning a HTTP/404 error to the client instead of the target resource.

Response Headers
----------------

Using these options, you can add or remove HTTP response headers, and flag responses that contain certain headers.

[1]: ../images/Filters/FilterToHosts.png
