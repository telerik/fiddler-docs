---
title: Configure Visual Studio
decription: "Guide to extending Fiddler Classic with .NET - create custom inspectors, menu items, and automation using .NET assemblies."
slug: ConfigureVS
publish: true
position: 1
---

Extend Fiddler Classic with .NET Code
=============================

Use Fiddler's extensibility mechanisms to add to Fiddler's UI, automatically modify requests or responses, and create custom Inspectors that enable scenario-specific display and manual-modification of requests and responses.

Requirements
------------

+ **Visual Studio .NET 2005+** or the **free .NET Framework v2 command-line compilers**
+ The most recent version of **Fiddler**
+ For **Visual Studio 2010 or later**: Change the project to target the **.NET2.0/3.5 framework**.
+ If targeting **.NET Framework 3.5**: Ensure user has **.NET Framework 3.5** installed.
+ If extending **64bit Fiddler**: Target **AnyCPU**.

See [Build extension assemblies to run in both Fiddler Classic versions 2 and 4][1].

Debugging
---------

+ To ensure that exceptions and other extension-related errors are not silently caught: [set][1] the `fiddler.debug.extensions.showerrors` preference to **True**. 
+ To output logging information to the **Log** tab: [set][1] the `fiddler.debug.extensions.verbose`

[1]: http://fiddler.wikidot.com/prefsaction

Direct Fiddler Classic to load extension assemblies
-------------------------------------------

+ To make the extensions available to the current user, install extension assembly DLLs to:
		%localappdata%\Programs\Fiddler\Scripts
		OR
		%userprofile%\Documents\Fiddler2\Scripts

+ Set the **Fiddler.RequiredVersion** attribute in your **AssemblyInfo.cs** file (or elsewhere in your code) as follows:

		using Fiddler;

		// Extension requires Fiddler Classic 2.2.8.6+ because it uses types introduced in v2.2.8...
		[assembly: Fiddler.RequiredVersion("2.2.8.6")]



Sample Extension: Step by Step
------------------------------

1. Start **Visual Studio 2005** or later.

2. Create a new Project of type **Visual C# Class Library**.

3. Right-click the project's **References** folder in the **Solution Explorer**.

4. Click the **Browse** tab and select **Fiddler.exe** in the **%localappdata%\Programs\Fiddler** folder. 

5. Click **Ok** to add the reference.

6. If your extension modifies Fiddler's UI:

 + Right-click the project's References folder in the Solution Explorer again
 + On the .NET tab, choose System.Windows.Forms.
 + Click Ok to add the reference.
 + In the Solution Explorer, right click the project.  Choose Properties.
 + On the Build Events tab, add the following to the Post-build event command line:

    copy "$(TargetPath)" "%userprofile%\Documents\Fiddler2\Scripts\$(TargetFilename)"

Modify the default class1.cs (or create a new class) in your project as follows:

	using System;
	using System.Windows.Forms;
	using Fiddler;
	
	[assembly: Fiddler.RequiredVersion("2.3.5.0")]
	
	public class Violin : IAutoTamper    // Ensure class is public, or Fiddler won't see it!
	{
	  string sUserAgent = "";
	
	  public Violin(){
	  /* NOTE: It's possible that Fiddler Classic UI isn't fully loaded yet, so don't add any UI in the constructor.
	
	     But it's also possible that AutoTamper* methods are called before OnLoad (below), so be
	     sure any needed data structures are initialized to safe values here in this constructor */
	    
	     sUserAgent = "Violin";
	  }
	
	  public void OnLoad(){ /* Load your UI here */ }
	  public void OnBeforeUnload() { }
	
	  public void AutoTamperRequestBefore(Session oSession){
	    oSession.oRequest["User-Agent"] = sUserAgent;
	  }
	  public void AutoTamperRequestAfter(Session oSession){}
	  public void AutoTamperResponseBefore(Session oSession){}
	  public void AutoTamperResponseAfter(Session oSession){}
	  public void OnBeforeReturningError(Session oSession){}
	}

[1]: ./ExtensionsForv2Andv4
