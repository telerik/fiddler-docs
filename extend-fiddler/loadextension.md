---
title: Load Extensions
meta_title: Load Extensions - Fiddler Classic Documentation
description: Learn how to load custom extension assemblies in Fiddler Classic by placing them in the correct directory for automatic discovery.
slug: LoadExtension
publish: true
position: 4
---

# Load Extension in Fiddler

1. Compile your project.

2. For Extensions projects, copy the assembly .DLL to the correct **Scripts** folder:

 + Use **%userprofile%\Documents\Fiddler2\Scripts** to make the extension available to the current user.

 2. For Custom Inspector projects, copy the assembly .DLL to the correct **Inspectors** folder:

 + Use **%userprofile%\Documents\Fiddler2\Inspectors** to make the inspector extension available to the current user.

3. Restart Fiddler.
