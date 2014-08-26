---
title: Add Menu Items
slug: AddMenuItems
tags: Extend Fiddler, FiddlerScript, Extension, menu items
publish: true
position: 14
---

Add Menu Items
==============

To add menu actions to the **Tools** menu or context menus or add options to the **Rules** menu:

1. Create and execute a .REG file as follows:

		[HKEY_CURRENT_USER\Software\Microsoft\Fiddler2\MenuExt\&YourMenuItemName]
		"Command"="YourExeName.exe"
		"Parameters"="Your Parameters To Pass To The EXE"

2. Restart Fiddler.

