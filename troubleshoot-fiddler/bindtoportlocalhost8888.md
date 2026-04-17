---
title: "Unable to bind to port [Localhost: 8888]"
meta_title: Unable to Bind to Port 8888 - Fiddler Classic Documentation
description: Learn how to resolve the unable to bind to port Localhost 8888 error in Fiddler Classic caused by Microsoft ISA Firewall client.
slug: BindToPortLocalhost8888
publish: true
position: 80
---

# Unable to bind to port Localhost:8888

Microsoft ISA Firewall client may cause Fiddler Classic to detach. When starting Fiddler Classic under nonadmin account (ordinary User) you may see an error message:

```txt
Unable to bind to port [Localhost: 8888]. This is usually due to another running copy of Fiddler Classic.
(An attempt was made to access a socket in a way forbidden by its access permissions)
```

**Fix:**
- Close the Fiddler Classic application.
- Open **REGEDIT**
- Add a new STRING under **HKCU\Software\Microsoft\Fiddler2** named **ExclusivePort** with value `False`.
