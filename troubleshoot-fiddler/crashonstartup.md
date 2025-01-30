---
title: Fiddler exits unexpectedly on startup
slug: CrashOnStartup
publish: true
position: 50
---

# Fiddler Classic Crashes on Startup with an unhelpful message box

If you see this message box when starting Fiddler:

![fiddlercrash](../images/fiddlercrash.png)  

...it generally means that your .NET Framework installation is corrupt.  If you uninstall and reinstall the .NET 2.0 Framework, the problem is usually resolved.