---
title: Rename Invalid P3P Headers
description: "lern how to modify invalid P3P headers through the privacy scanner add-on"
slug: RenameInvalidP3P
publish: true
position: 4
previous_url: /tasks/renameinvalidp3p
---

# Rename Invalid P3P Headers

1. Install the [Privacy Scanner Fiddler Classic add-on](https://www.telerik.com/fiddler/add-ons).

 Fiddler Classic will gain a new top-level menu named **Privacy**.

 ![Privacy menu](../../images/CookieScanning/PrivacyMenu.png)

2. Ensure **Privacy > Enabled** and **Privacy > Rename P3P header if invalid** are checked.

Now, if a session presents a P3P statement that is malformed, that P3P header will be renamed to **Malformed-P3P** to prevent the browser from interpreting it as the P3P 1.0 specification suggested (for example, ignoring the unknown tokens).

## See Also

+ [Cookie Test Page](http://www.enhanceie.com/test/cookie/)
+ [View Cookie Information](slug://CookieScanning)

