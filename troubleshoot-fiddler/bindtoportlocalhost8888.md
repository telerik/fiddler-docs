---
title: "Unable to bind to port [Localhost: 8888]"
slug: BindToPortLocalhost8888
publish: true
position: 80
---

# Unable to bind to port Localhost:8888

Microsoft ISA Firewall client may cause Fiddler Classic to detach. When starting Fiddler Classic under nonadmin account (ordinary User) you may see an error message:

```
Unable to bind to port [Localhost: 8888]. This is usually due to another running copy of Fiddler Classic.
(An attempt was made to access a socket in a way forbidden by its access permissions)
```

**Fix:**
- Close the Fiddler Classic application.
- Open **REGEDIT**
- Add a new STRING under **HKCU\Software\Microsoft\Fiddler2** named **ExclusivePort** with value `False`.
