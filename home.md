<!-- http://www.fiddler2.com/Fiddler/dev/ -->

# Downloadable Developer Documentation

Documentation for FiddlerCore, which maps closely to Fiddler's API, can be [downloaded here](http://www.fiddler2.com/dl/FiddlerCoreDocsSetup.exe).

# Using FiddlerScript

Fiddler includes scripting support for automatic flagging and editing of HTTP requests and responses. 

You can edit your script using the **Rules | Custom Rules...** menu.  When you save the script, it will automatically be recompiled and loaded into Fiddler.  Scripts are written in JScript.NET and include limited access to the Fiddler Object Model.

   [FiddlerScript Cookbook (Sample Code)](http://www.fiddler2.com/Fiddler/dev/ScriptSamples.asp)

Hint: A **syntax-aware script editing environment** is available for Fiddler.  [Learn more...](http://www.fiddler2.com/fiddler/fse.asp)

Hint: You can call .NET assemblies from script too.  See [Extending FiddlerScript using .NET.](http://www.fiddler2.com/Fiddler/dev/UsingCSharp.asp) 

Note: Fiddler's default rules are stored in \Program Files\Fiddler2\Scripts\SampleRules.js. If you delete your CustomRules.js file in your \Documents\Fiddler2\Scripts folder, the next time Fiddler starts, the SampleRules.js file will be used to recreate your CustomRules.js file.

#Building Importers and Exporters

See [ISessionImport & ISessionExport.](http://www.fiddler2.com/Fiddler/dev/ISessionExport.asp)

#Building Extensions with C#, VB.NET, Managed C++, etc

[See Extending Fiddler with .NET Code.](http://www.fiddler2.com/Fiddler/dev/IFiddlerExtension.asp)

#Building Custom Inspectors

In addition to the default set of HTTP Request and Response inspectors, you may load your own Inspector objects, written in any .NET Language.

   [Learn more...](http://www.fiddler2.com/Fiddler/dev/Inspectors.asp)

#Building on FiddlerCore

Now Available The FiddlerCore class library allows you to integrate Fiddler-like functionality into standalone .NET applications.

   [Learn more...](http://www.fiddler2.com/Fiddler/Core/)

#Controlling Fiddler with Test Automation

ExecAction.exe is a command line executable which is suitable for calling from batch files or unit tests.  It passes its command line into FiddlerScript's **OnExecAction** function for processing, just like Fiddler's [QuickExec box](http://www.fiddler2.com/fiddler/help/quickexec.asp#ExecAction).  The ExecAction commands can be handled by [FiddlerScript](http://www.fiddler2.com/Fiddler/dev/ScriptSamples.asp) or [FiddlerExtensions](http://www.fiddler2.com/Fiddler/dev/IFiddlerExtension.asp).

ExecAction.exe is installed into the Fiddler directory inside your Program Files folder.

**Usage:**

	ExecAction SCRIPTPARAMETER
	ExecAction "PARAM1 PARAM2"

ExecAction sets %ERRORLEVEL% to

* 0 if successful
* 1 if an incorrect (!= 1) number of arguments used
* 2 if the Fiddler window could not be found.

#Adding Menu Items

[FiddlerScript](http://www.fiddler2.com/Fiddler/dev/ScriptSamples.asp) allows you to add menu actions to the Tools and Context menus, and options to the Rules menu. 

If you want to add menu actions to the Tools menu without code, just create and execute a .REG file:

	Windows Registry Editor Version 5.00

	[HKEY_CURRENT_USER\Software\Microsoft\Fiddler2\MenuExt\&YourMenuItemName]
	"Command"="YourExeName.exe"
	"Parameters"="Your Parameters To Pass To The EXE"

Your menu command will appear the next time Fiddler starts. 

#Other resources

* [Fiddler Session Flags](http://www.fiddler2.com/Fiddler/dev/SessionFlags.asp)
* [Fiddler Architecture Information](http://www.fiddler2.com/Fiddler/dev/FiddlerArchitecture.asp)
