---
title: Rename Invalid P3P Headers
slug: RenameInvalidP3P
tags: Modify Traffic, Cookies, add-ons, Privacy, P3P
publish: true
ordinal: 10
---

Rename Invalid P3P Headers
==========================

1. Install the [Privacy Scanner Fiddler add-on][1].

 Fiddler will gain a new top-level menu named **Privacy**.

 ![Privacy menu][2]

2. Ensure **Privacy > Enabled** and **Privacy > Rename P3P header if invalid** are checked.

Now, if a session presents a P3P statement that is malformed, that P3P header will be renamed to **Malformed-P3P** to prevent the browser from interpreting it as the P3P 1.0 specification suggested (for example, ignoring the unknown tokens).

See Also
--------

+ [Cookie Test Page][5]
+ [View Cookie Information][6]

[1]: http://fiddler2.com/add-ons
[2]: ../../images/CookieScanning/PrivacyMenu.png
[3]: ../../images/CookieScanning/PrivacyInfo.png
[4]: http://msdn.microsoft.com/en-us/library/ie/ms537343(v=vs.85).aspx#unsatisfactory_cookies
[5]: http://www.enhanceie.com/test/cookie/
[6]: ../../Observe-Traffic/Tasks/ScanCookies
