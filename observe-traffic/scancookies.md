---
title: View Cookie Information
slug: CookieScanning
publish: true
position: 10
previous_url: /observe-traffic/tasks/scancookies
---

# View Cookie Information

1. Install the [Privacy Scanner Fiddler Classic add-on](https://www.telerik.com/fiddler/add-ons). Fiddler Classic will gain a new top-level menu named **Privacy**.
    ![Privacy menu](./images/PrivacyMenu.png)
2. Ensure **Privacy > Enabled** is checked. The add-on will add a **Privacy Info** column to the session list and will flag HTTP/HTTPS responses which set cookies. Evaluation of any P3P statements that come along with those cookies will change the session's background color:
    ![Privacy Info Column](./images/PrivacyInfo.png)

    + **Green** sessions send a satisfactory P3P policy.
    + **Yellow** sessions set a cookie without a P3P policy.
    + **Orange** sessions send a P3P policy that [does not permit use of the cookie in a 3rd party context](https://msdn.microsoft.com/en-us/library/ie/ms537343(v=vs.85).aspx#unsatisfactory_cookies).
    + **Red** sessions send invalid P3P policies. 

## See Also

+ [Rename Invalid P3P Headers](slug://RenameInvalidP3P)

