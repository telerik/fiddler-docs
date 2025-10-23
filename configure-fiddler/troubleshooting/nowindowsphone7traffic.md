---
title: No Windows Phone Traffic
description: Creating an IPSEC Boundary Computer Exception
slug: NoWindowsPhone7Traffic
publish: true
position: 5
---

# Problem: Windows Phone does not exchange web traffic with Fiddler

After configuring a Windows Phone to use Fiddler Classic as a proxy, requests from the Windows Phone device do not return resources or appear in the Fiddler Classic session list.

## Solution: Create an IPSEC Boundary Computer Exception

If the Fiddler server (the machine running Fiddler) is on a network with IPSEC enabled, create an IPSEC Boundary Computer exception. Contact a network administrator to create this exception.
