---
title: Keyboard Reference
page_title: Keyboard Shortcuts Reference - Fiddler Classic
description: Explore the full list of keyboard shortcuts available in Fiddler Classic for faster navigation and actions.
slug: Keyboard
publish: true
position: 2
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>5.0.20253</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Fiddler Classic </td>
		</tr>
	</tbody>
</table>

## Keyboard Reference

### System-wide

+ `Ctrl+Alt+F` - Bring Fiddler Classic to the foreground.  Hotkey may be adjusted using **Tools** > **Options**.

### App-wide

+ `Alt+S` - Focus the Web Sessions List
+ `Alt+Q` - Activate the [QuickExec command line][1], allowing access to many more functions from the keyboard.
+ `Ctrl+F` - Find sessions
+ `Ctrl+H` - View Header Inspector
+ `Ctrl+T` - View TextView Inspector
+ `Ctrl+Up` - Select prior session
+ `Ctrl+Down` - Select next session

### Session List

+ `Ctrl+A` - Select all sessions
+ `Ctrl+I` - Invert selection of sessions
+ `Ctrl+X` - Clear Session List
+ `R` - Reissue request (Hold `Shift+R` to reissue multiple times)
+ `U` - Reissue request unconditionally (Hold `Shift+U` to reissue multiple times)
+ `P` - Find parent of session (using referer)
+ `C` - Find children of session (using referer)
+ `D` - Find duplicates of session (based on URL)
+ `Ctrl+1` or `Ins` - Mark/tag session in red
+ `Ctrl+2` - Mark/tag session in blue
+ `Ctrl+3` - Mark/tag session in yellow
+ `Ctrl+4` - Mark/tag session in green
+ `Ctrl+5` - Mark/tag session in orange
+ `Ctrl+6` - Mark/tag session in purple
+ `Ctrl+0` - Unmark session
+ `Backspace` - Go to previously selected session
+ `Delete` - Delete selected sessions
+ `Shift+Delete` - Delete unselected sessions
+ `Spacebar` - Scroll selected session into view

### Header Inspector

+ `Ctrl+C` - Copy the active header to the clipboard
+ `Enter` - Edit the active header.  (When the a session is paused, the headers are editable (note the white background)
+ `Delete` - Remove the active header
+ `Ins` - Add a new header.  Note that it does not matter what grouping you put the header under; the groupings are for reading convenience only.

### TextView Inspector

+ `Ctrl+G` - Go to line number. (Disables word wrap)
+ `F3` - Find next

### HexView Inspector

+ `Ctrl+G` - Go to byte

[1]: ./QuickExec
