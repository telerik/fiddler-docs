---
title: Fiddler exits unexpectedly on startup
slug: CrashOnStartup
tags: Troubleshooting, Fiddler has encountered a problem, crash, startup, .NET Framework
publish: true
position: 5
---

#### Fiddler Crashes on Startup with an unhelpful message box

If you see this message box when starting Fiddler:

![fiddlercrash](../images/fiddlercrash.png)  


...it generally means that your .NET Framework installation is corrupt.  If you uninstall and reinstall the .NET 2.0 Framework, the problem is usually resolved.