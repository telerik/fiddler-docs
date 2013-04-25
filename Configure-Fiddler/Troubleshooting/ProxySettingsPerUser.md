---
title: ProxySettingsPerUser=0
slug: ProxySettingsPerUser
tags: Getting Started, Configuration, Troubleshooting
publish: true
ordinal: 10
---



Problem: No Traffic is captured with ProxySettingsPerUser=0 Group Policy Setting
--------------------------------------------------------------------------------

Your system or domain Administrator has set the Group Policy setting **ProxySettingsPerUser** to **0**. This means that instead of the default Windows behavior (each user has their own proxy settings), instead all user accounts share one set of proxy settings. In this case, a value named ProxySettingsPerUser exists inside: 

		HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\ 

Solution: Run Fiddler as Administrator
--------------------------------------

This machine-wide proxy setting can only be changed by code running as an Adminstrator, so Fiddler must be started **Elevated**:

1. Right-click the **Fiddler** icon in the Start menu.
2. Choose **Run as Administrator**.

This will adjust the proxy setting.

If you cannot run Fiddler as Admin (because, for example, you're not an Administrator) you will need to request that your system or domain administrator disable this policy:

		HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\ProxySettingsPerUser is 0.

This policy setting does not impact clients that are not configured to use the system proxy settings (For example, Firefox with a manual proxy configuration).
