---
title: SAZ Clipboard
description: "Learn more about the Fiddler Classic's SAZClipboard extension"
slug: SAZClipboard
publish: true
position: 1
res_type: kb
---

SAZClipboard
============

Introduction
------------

The SAZClipboard is a simple extension that allows you to open a .SAZ file outside of the main Fiddler Classic UI.  You can then drag sessions between this clipboard from the Fiddler Classic UI.

Why would I want to do this?
----------------------------

This may be useful if you're using the Fiddler Classic Request Builder or AutoResponder features, both of which accept drops of Fiddler Classic sessions for reuse.

Download
--------

Install SAZClipboard from here (43 kb). Last update 4/16/2010

Usage Instructions
------------------

Open the SAZClipboard Window from the **Tools Menu**.

![Tools Menu Item][1]

You can drag and drop from the Fiddler Classic session list to the SAZ clipboard form, or load a SAZ directly into it using the button at the bottom. Launch it from the Tools menu. Just drop SazClipboard.dll into your %localappdata%\Programs\Fiddler\Scripts folder and restart Fiddler. Source is provided, so you can update as desired.

![Clipboard Window][2]

[1]: ../../images/SAZClipboard/ToolsMenuItem.png
[2]: ../../images/SAZClipboard/ClipboardWindow.png