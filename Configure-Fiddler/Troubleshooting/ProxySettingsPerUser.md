---
title: ProxySettingsPerUser=0
slug: ProxySettingsPerUser
tags: Getting Started, Configuration, Troubleshooting
publish: true
ordinal: 10
---

Fiddler and ProxySettingsPerUser=0
==================================


Your system's or domain's Administrator has set the Group Policy setting **ProxySettingsPerUser** to **0**. This means that instead of the default Windows behavior (each user has their own proxy settings), instead all user accounts share one set of proxy settings.

This machine-wide proxy setting can only be changed by code running as an Adminstrator, which means that Fiddler must be started Elevated (right-click its icon in the Start menu and choose **Run as Administrator**) to adjust the proxy setting. If you cannot run Fiddler as Admin (because, say, you're not an Administrator) you will need to request that your system or domain administrator disable this policy.

		HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\ProxySettingsPerUser is 0.

This policy setting does not impact clients that are not configured to use the system proxy settings (e.g. Firefox with a manual proxy configuration).
