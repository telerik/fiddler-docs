---
title: "Unable to bind to port [Localhost: 8888]"
slug: BindToPortLocalhost8888
tags: Troubleshooting, ISA Firewall
publish: true
position: 8
---

Microsoft ISA Firewall client may cause Fiddler to detach.
When starting Fiddler under nonadmin account (ordinary User) you may see an error message:

	Unable to bind to port [Localhost: 8888]. This is usually due to another running copy of Fiddler.
	(An attempt was made to access a socket in a way forbidden by its access permissions)

**Fix:**
Close Fiddler.
Using REGEDIT, add a new STRING under **HKCU\Software\Microsoft\Fiddler2** named **ExclusivePort** with value **False**
