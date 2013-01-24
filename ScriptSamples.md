---
title: FiddlerScript CookBook
slug: fiddlerscriptcookbook
tags: Script
publish: true
---

<!-- http://www.fiddler2.com/Fiddler/dev/ScriptSamples.asp -->

#FiddlerScript CookBook

You can add a lot of power to Fiddler by updating its JScript.NET CustomRules.js file.  To add rules to Fiddler, choose **Customize Rules** on Fiddler's **Rules** menu.  Enter code inside the suggested function and save the file.  Fiddler will automatically reload the rules.

* Check the list of [Fiddler Session Flags](http://www.fiddler2.com/Fiddler/dev/SessionFlags.asp) to see how you can easily change Fiddler's behavior for a given session.
* The [MSDN JScript.NET Reference](http://www.fiddler2.com/redir/?id=msdnjsnet) may be helpful
* A syntax-aware script editing environment is available for Fiddler.  [Learn more...](http://www.fiddler2.com/fiddler/fse.asp)

##Script Resources

* [UI Column Configuration](http://www.fiddler2.com/Fiddler/help/configurecolumns.asp)
* [Modify Request or Response](http://ModifyRequestOrResponse)
* [Performance-Testing](http://ScenarioPerformanceTesting)
* [Working with menus](http://ScenarioWorkingMithMenus)
* [Miscellaneous rules](http://MiscellaneousRules)

##Tips and Tricks

* If you "break" your CustomRules.js file: *delete the CustomRules.js file in your \Documents\Fiddler2\Scripts\ folder. The next time Fiddler starts, the default rules will be used to recreate your CustomRules.js file. Fiddler's default rules are stored in \Program Files\Fiddler2\Scripts\SampleRules.js.*
* You can change the JScript editor launched from the Rules menu.  **Click Tools | Fiddler Options** and edit the **Editor** string.  The Fiddler Script editor is a good choice.  Learn more...
* You can use additional .NET assemblies in your script.  **Click Tools | Fiddler Options** and edit the **References** list on the **Extensions** tab.  You will also need to either register the assembly in the GAC or drop it in the Fiddler.exe folder.  Update the #import clause at the top of the JScript with the correct namespaces in order to use the new assembly's functions without fully-qualifying them.


