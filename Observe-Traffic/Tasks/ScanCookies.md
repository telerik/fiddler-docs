---
title: View Cookie Information
slug: CookieScanning
tags: Observe Traffic, Cookies, add-ons, Privacy, P3P
publish: true
position: 10
---

View Cookie Information
=======================

1. Install the [Privacy Scanner Fiddler add-on][1].

 Fiddler will gain a new top-level menu named **Privacy**.

 ![Privacy menu][2]

2. Ensure **Privacy > Enabled** is checked.

 The add-on will add a **Privacy Info** column to the session list and will flag HTTP/HTTPS responses which set cookies. 

Evaluation of any P3P statements that come along with those cookies will change the session's background color:

 ![Privacy Info Column][3]

+ **Green** sessions send a satisfactory P3P policy.
+ **Yellow** sessions set a cookie without a P3P policy.
+ **Orange** sessions send a P3P policy that [does not permit use of the cookie in a 3rd party context][4].
+ **Red** sessions send invalid P3P policies. 

See Also
--------

+ [Rename Invalid P3P Headers][5]
[1]: http://fiddler2.com/add-ons
[2]: ../../images/CookieScanning/PrivacyMenu.png
[3]: ../../images/CookieScanning/PrivacyInfo.png
[4]: http://msdn.microsoft.com/en-us/library/ie/ms537343(v=vs.85).aspx#unsatisfactory_cookies
[5]: ../../Modify-Traffic/Tasks/RenameInvalidP3P
