---
title: Customize Menus
slug: CustomizeMenus
publish: true
position: 3
res_type: kb
---


To customize menus in Fiddler, [add rules](slug://AddRules) using FiddlerScript with Global scope. For example:

**Add context-menu item to open currently selected URLs using Firefox**

```c#
public static ContextAction("Open in Firefox")
function DoOpenInIE(oSessions: Fiddler.Session[]){ 
	if (null == oSessions){
	MessageBox.Show("Please choose at least 1 session."); return;
	}

	for (var x = 0; x < oSessions.Length; x++){
	System.Diagnostics.Process.Start("firefox.exe", oSessions[x].url);
	}
}

```

**Add a submenu to the Rules menu and create an option in it**

```c#
public static RulesOption("Non-Exclusive-Test", "User-Agent") 
var m_UANONRad: boolean = true; 
```

**To build submenus with mutually exclusive radio options**

```c#
public static RulesOption("Spoof Netscape &3.0", "User-Agent", true) 
var m_NS3: boolean = false; 

public static RulesOption("Spoof IE &6.0", "User-Agent", true) 
var m_IE6: boolean = false; 

public static RulesOption("Spoof nothing", "User-Agent", true) 
var m_UANONE: boolean = true;
```

**To build a submenu with mutually exclusive radio options, that control a single string variable**
(Offers a more compact syntax than the previous alternative)

```c#
RulesString("&SubMenuName", true) 
RulesStringValue(0,"Option1Name", "Option1Value")
RulesStringValue(1,"Option2Name", "Option2Value")
RulesStringValue(2,"&Custom...", "%CUSTOM%")
public static var sTheOptionValue: String = null;
```

**Same as previous, but with a default option pre-selected**

```c#
RulesString("&SubMenuName", true) 
RulesStringValue(0,"Option1Name", "Option1Value")
RulesStringValue(1,"Option2NameDEFAULT", "DefaultVal", true)
RulesStringValue(2,"&Custom...", "%CUSTOM%")
public static var sTheOptionValue: String = null;
```

**Add a Tools menu option that resets the script**

```c#
// Force a manual reload of the script file. Resets all
// RulesOption variables to their defaults.
public static ToolsAction("Reset Script")
function DoManualReload(){ 
	FiddlerObject.ReloadScript();
}

```

**Add a Tools menu option that clears all WinINET/IE cookies and cache files**

```c#
public static ToolsAction("Reset IE"){
	FiddlerObject.UI.actClearWinINETCache();
	FiddlerObject.UI.actClearWinINETCookies(); 
}
```