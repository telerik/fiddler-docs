---
title: Build Extension Assemblies for Fiddler Classic v2 and v4.
slug: ExtensionsForv2Andv4
publish: true
position: 11
---

Build Extension Assemblies for Fiddler Classic v2 and v4
================================================

+ If you want your extension Assembly to run in both Fiddler2 and Fiddler4, build it for .NET Framework v2 and avoid taking any dependencies on any classes that were removed or moved in the later version of the Framework. (The only instance I'm aware of is the Microsoft JScript.NET code compiler, whose classes were moved around a bit).

 You'll also need to ensure that if you use any methods that are deprecated (for example, calling **Assembly.LoadFrom** with the overload that takes an **Evidence** parameter) you do so only conditionally. For example:

		  if (CONFIG.bRunningOnCLRv4)
		  {
			a = Assembly.LoadFrom(oFile.FullName);
		  }
		  else
		  {
			a = Assembly.LoadFrom(oFile.FullName, evidenceFiddler);
		  }

 All of the extensions from the Fiddler Classic website are compiled against Fiddler Classic v2.

+ Alternatively, you can simply build two versions of your DLL, one version targeting .NET Framework v4 and one targeting .NET Framework v2.

 This is how Fiddler Classic itself is built. Basically, just add a "clone" version of your v2-targeted Project to the same Solution. Use the **Add > Existing Item** context menu to add the .CS files from the v2-targeted project to the v4-targeted project, but when selecting the files, be very sure to use the split button on the file picker dialog and choose **Add as Link**. On the v4 Project's **Properties > Build** tab, add a **Conditional Compilation** symbol like DOTNET4. You can then put any .NETv4-specific code behind conditional compilation:

		  #if DOTNET4

			// ... code targeting .NETv4

		  #else

			// ... code targeting .NETv2

		  #endif

 Your extension may install the appropriately-targeted version based on the content of the **InstalledVersion** registry key found inside:

		HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Fiddler2 

 The .NET2 version of Fiddler Classic is much more popular than the .NETv4 version at this time. When the .NET Framework v4.5 is released, I may move the v4 project over to v4.5. Among other things, that would allow me to take advantage of the new built-in .ZIP classes in that later framework.

+ What about the RequiredVersion attribute?

 Fiddler Classic v4 is "smart"-- if your extension specifies

		[assembly: Fiddler.RequiredVersion("2.1.0.1")]

 When Fiddler Classic v4 loads it, it will require version 4.3.9.9 or later.