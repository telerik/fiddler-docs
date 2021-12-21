---
title: Font 'Tahoma' does not support style 'Regular'
slug: TahomaError
publish: true
position: 6
---

#### Fiddler Classic crashes on startup complaining about the Tahoma font
	
	Sorry, you may have found a bug...
	
	Fiddler has encountered an unexpected problem. 

	Font 'Tahoma' does not support style 'Regular'.
	Source: System.Drawing
	at System.Drawing.Font.CreateNativeFont()

	This can happen if you have the Microsoft Word 97 viewer installed. That tool sets the registry key HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts\Tahoma (TrueType) to tahoma.FOT. 
	To fix the issue, change the following registry key from:

	HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts
	"Tahoma (TrueType)"="tahoma.FOT"

*to*

	HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts
	"Tahoma (TrueType)"="TAHOMA.TTF"

If that does not help, you may be missing the **Tahoma** font on your computer (it should be in **c:\windows\fonts**), or the .NET Framework installation is corrupt. If you see the Font file, then try reinstalling the .NET Framework and all updates from WindowsUpdate.
