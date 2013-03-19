---
title: Configure Visual Studio
slug: ConfigureVS
tags: Extend Fiddler, .NET, Extension, Configuration, IFiddlerExtension, assembly
publish: true
ordinal: 1
---

Configure Visual Studio
=======================

Configure Visual Studio to develop a Fiddler extension. Use Fiddler's extensibility mechanisms to add to Fiddler's UI, automatically modify requests or responses, and create custom Inspectors that enable scenario-specific display and manual-modification of requests and responses.

Requirements
------------

+ **Visual Studio .NET 2005+** or the **free .NET Framework v2 command-line compilers**
+ The most recent version of **Fiddler**
+ For **Visual Studio 2010 or later**: Change the project to target the **.NET2.0/3.5 framework**.
+ If targeting **.NET Framework 3.5**: Ensure user has **.NET Framework 3.5** installed.
+ If extending **64bit Fiddler**: Target **AnyCPU**.

Debugging
---------

+ To ensure that exceptions and other extension-related errors are not silently caught: [set][1] the [fiddler.debug.extensions.showerrors][2] preference to **True**. 
+ To output logging information to the **Log** tab: [set][1] the [fiddler.debug.extensions.verbose][2]

[1]: http://fiddler.wikidot.com/prefsaction
[2]: http://fiddler.wikidot.com/prefslist

Direct Fiddler to load extension assemblies
-------------------------------------------

+ To make the extensions available to all users on the machine, install extension assembly DLLs to:

		%Program Files%\Fiddler2\Scripts

+ To make the extensions available to only the current user, install extension assembly DLLs to:

		%USERPROFILE%\My Documents\Fiddler2\Scripts

+ Set the **Fiddler.RequiredVersion** attribute in your **AssemblyInfo.cs** file (or elsewhere in your code) as follows:

		using Fiddler;

		// Extension requires Fiddler 2.2.8.6+ because it uses types introduced in v2.2.8...
		[assembly: Fiddler.RequiredVersion("2.2.8.6")]

Load Extension During Startup
-----------------------------

Public classes in your assembly that implement the **IFiddlerExtension** interface will be loaded by Fiddler during startup.

		public interface IFiddlerExtension
		{
		  // Called when Fiddler User Interface is fully available
		  void OnLoad();

		  // Called when Fiddler is shutting down
		  void OnBeforeUnload();
		}

+ The **OnLoad** function will be called when Fiddler has finished loading and its UI is fully available.  At this point, you can safely add menu items, tabbed pages, or other elements to the Fiddler UI. 

+ The **OnBeforeUnload** function will be called when Fiddler is shutting down and unloading all extensions.

Call Extension for Each Web Request
-----------------------------------

+ Extensions that implement the **IAutoTamper** interface (which extends **IFiddlerExtension**) are called for each HTTP/HTTPS request and response, enabling modifications, logging, or other operations. 

 ***Warning***:  Functions in this interface are called on background, non-UI threads. To update UI, use **Invoke** or **BeginInvoke** to update the UI. Also, note that the IAutoTamper::* functions may be called before the **OnLoad** event is called-- Fiddler allows traffic to flow before the UI is fully available.

		public interface IAutoTamper : IFiddlerExtension
		{
		  // Called before the user can edit a request using the Fiddler Inspectors
		  void AutoTamperRequestBefore(Session oSession);

		  // Called after the user has had the chance to edit the request using the Fiddler Inspectors, but before the request is sent
		  void AutoTamperRequestAfter(Session oSession);

		  // Called before the user can edit a response using the Fiddler Inspectors, unless streaming.
		  void AutoTamperResponseBefore(Session oSession);

		  // Called after the user edited a response using the Fiddler Inspectors.  Not called when streaming.
		  void AutoTamperResponseAfter(Session oSession);

		  // Called Fiddler returns a self-generated HTTP error (for instance DNS lookup failed, etc)
		  void OnBeforeReturningError(Session oSession);
		}

+ Extensions that implement the **IAutoTamper2** interface (which extends **IAutoTamper**) are called when the response headers become available.

		/// <summary>
		/// Interface for AutoTamper extensions that want to "peek" at response headers
		/// </summary>
		public interface IAutoTamper2 : IAutoTamper
		{
		/// <summary>
		/// Called when the response headers become available
		/// </summary>
		/// <param name="oSession">The Session object for which the response headers are available</param>
		void OnPeekAtResponseHeaders(Session oSession);
		}

+ Extensions that implement the **IAutoTamper3** interface (which extends **IAutoTamper2**) are called when the request headers become available.

		/// <summary>
		/// Interface for AutoTamper extensions that want to "peek" at request headers
		/// </summary>
		public interface IAutoTamper3 : IAutoTamper2
		{
		/// <summary>
		/// Called when the request headers become available
		/// </summary>
		/// <param name="oSession">The Session object for which the request headers are available</param>
		void OnPeekAtRequestHeaders(Session oSession);
		}

Call Extension When User Enters a QuickExec Command
---------------------------------------------------

+ Extensions that implement the **IHandleExecAction** interface are called when the user has entered a command into the [QuickExec box][1]. To react to the command (and prevent further processing by other extensions and Fiddler itself) return true from this method.

		public interface IHandleExecAction
		{
		  // return TRUE if handled. 
		  bool OnExecAction(string sCommand); 
		}

+ The Fiddler.Utilities class includes a helper function **Parameterize()** which helps to interpret the sCommand parameter.

		[CodeDescription("Tokenize a string into tokens. Delimits on whitespace; Quotation marks are dropped unless preceded by a \ character.")] 
		public static string[] Parameterize(string sCommand)


Sample Extension: Step by Step
------------------------------

1. Start **Visual Studio 2005** or later.

2. Create a new Project of type **Visual C# Class Library**.

3. Right-click the project's **References** folder in the **Solution Explorer**.

4. Click the **Browse** tab and select **Fiddler.exe** in the **C:\Program Files\Fiddler2** folder. 

5. Click **Ok** to add the reference.

6. If your extension modifies Fiddler's UI:

Right-click the project's References folder in the Solution Explorer again
On the .NET tab, choose System.Windows.Forms.
Click Ok to add the reference.
In the Solution Explorer, right click the project.  Choose Properties.
On the Build Events tab, add the following to the Post-build event command line:

    copy "$(TargetPath)" "%userprofile%\My Documents\Fiddler2\Scripts\$(TargetFilename)"
Modify the default class1.cs (or create a new class) in your project as follows:
using System;
using System.Windows.Forms;
using Fiddler;

[assembly: Fiddler.RequiredVersion("2.3.5.0")]

public class Violin : IAutoTamper    // Ensure class is public, or Fiddler won't see it!
{
  string sUserAgent = "";

  public Violin(){
  /* NOTE: It's possible that Fiddler UI isn't fully loaded yet, so don't add any UI in the constructor.

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
[1]: ../Observe-Traffic/SearchSessions.md
