---
title: Customize Menus
slug: CustomizeMenus
tags: Knowledge Base, FiddlerScript, context menu, rules menu, submenu, clear cookies, clear cache
publish: true
ordinal: 3
---

Customize Menus
===============

To customize menus in Fiddler, [add rules][1] using FiddlerScript with Global scope. For example:

* * *

**Add context-menu item to open currently selected URLs using Firefox**

		public static ContextAction("Open in Firefox")
		function DoOpenInIE(oSessions: Fiddler.Session[]){ 
		  if (null == oSessions){
			MessageBox.Show("Please choose at least 1 session."); return;
		  }

		  for (var x = 0; x < oSessions.Length; x++){
			System.Diagnostics.Process.Start("firefox.exe", oSessions[x].url);
		  }
		}

* * *

**Add a submenu to the Rules menu and create an option in it**

		public static RulesOption("Non-Exclusive-Test", "User-Agent") 
		var m_UANONRad: boolean = true; 

* * *

**To build submenus with mutually exclusive radio options**

		public static RulesOption("Spoof Netscape &3.0", "User-Agent", true) 
		var m_NS3: boolean = false; 

		public static RulesOption("Spoof IE &6.0", "User-Agent", true) 
		var m_IE6: boolean = false; 

		public static RulesOption("Spoof nothing", "User-Agent", true) 
		var m_UANONE: boolean = true;

* * *

**To build a submenu with mutually exclusive radio options, that control a single string variable**
(Offers a more compact syntax than the previous alternative)

		RulesString("&SubMenuName", true) 
		RulesStringValue(0,"Option1Name", "Option1Value")
		RulesStringValue(1,"Option2Name", "Option2Value")
		RulesStringValue(2,"&Custom...", "%CUSTOM%")
		public static var sTheOptionValue: String = null;

* * *

**Same as previous, but with a default option pre-selected.**

		RulesString("&SubMenuName", true) 
		RulesStringValue(0,"Option1Name", "Option1Value")
		RulesStringValue(1,"Option2NameDEFAULT", "DefaultVal", true)
		RulesStringValue(2,"&Custom...", "%CUSTOM%")
		public static var sTheOptionValue: String = null;

* * *

**Add a Tools menu option that resets the script**

		// Force a manual reload of the script file. Resets all
		// RulesOption variables to their defaults.
		public static ToolsAction("Reset Script")
		function DoManualReload(){ 
			FiddlerObject.ReloadScript();
		}

* * *

**Add a Tools menu option that clears all WinINET/IE cookies and cache files**

		public static ToolsAction("Reset IE"){
		  FiddlerObject.UI.actClearWinINETCache();
		  FiddlerObject.UI.actClearWinINETCookies(); 
		}

* * *
[1]: ../../Extend-Fiddler/AddRules.md