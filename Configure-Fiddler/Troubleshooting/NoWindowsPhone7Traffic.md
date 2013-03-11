---
title: No Windows Phone 7 Traffic
slug: NoWindowsPhone7Traffic
tags: Configuration, Troubleshooting, Windows Phone 7, Connection, Fiddler Echo Service, Wi-Fi
publish: true
ordinal: 5
---

Problem: Windows Phone 7 does not exchange web traffic with Fiddler
-------------------------------------------------------------------

After configuring a Windows Phone 7 to use Fiddler as a proxy, requests from the Windows Phone 7 device do not return resources or appear in the Fiddler session list.

Solution: Create an IPSEC Boundary Computer Exception
-----------------------------------------------------

If the Fiddler server (the machine running Fiddler) is on a network with IPSEC enabled, create an IPSEC Boundary Computer exception. Contact a network administrator to create this exception.