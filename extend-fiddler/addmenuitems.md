---
title: Add Menu Items
page_title: Adding Custom Menu Items - Fiddler Classic
description: Add custom menu items to the Fiddler Classic Tools menu, context menus, or Rules menu through .NET extensions.
slug: AddMenuItems
publish: true
position: 14
---

# Add Menu Items

To add menu actions to the **Tools** menu or context menus or add options to the **Rules** menu:

1. Create and execute a `.reg` file as follows:

	```txt
	[HKEY_CURRENT_USER\Software\Microsoft\Fiddler2\MenuExt\&YourMenuItemName]
	"Command"="YourExeName.exe"
	"Parameters"="Your Parameters To Pass To The EXE"
	```

2. Restart Fiddler.

