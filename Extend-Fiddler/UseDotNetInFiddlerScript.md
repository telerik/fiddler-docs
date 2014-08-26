---
title: Use .NET Assemblies in FiddlerScript
slug: UseDotNetInFiddlerScript
tags: Extend Fiddler, FiddlerScript, .NET, C#, 
publish: true
position: 15
---

Use .NET Assemblies in FiddlerScript
====================================

To use a .NET addon (for this example, a C# addon that modifies the user-agent string):

Add References
--------------

1. Close Fiddler.

2. Save the .NET file (for example, this file called UASimulator.cs):

		using System;
		using System.Windows.Forms;
		using Fiddler;

		namespace FiddlerUtility{

			  public class UASimulator {
					string m_sUAString;
					public UASimulator(string s_UAString){
						  m_sUAString = s_UAString;
					}

					public bool OverwriteUA(Session oSession){
						  oSession.oRequest["User-Agent"] = m_sUAString;
						  return true;
					}
			  }
		}

3. In a VS command prompt, go to the folder where the .CS file is found.

4. Enter the command to create a DLL in the VS command prompt. For example:

		csc /target:library /out:c:\UASim.dll UASimulator.cs /reference:"C:\program files\fiddler2\fiddler.exe"

5. In Fiddler, click **Tools > Fiddler Options**.

6. Click the **Extensions** tab.

7. In the **References** field, enter the location of the DLL. For example:

		C:\UASim.dll

Update Fiddler Rules
--------------------

[Add a rule to Fiddler][1] to update your script. For example:

		import System;
		import System.Windows.Forms;
		import Fiddler;
		import FiddlerUtility;

		class Handlers{

			  static var UASim = new UASimulator("Mozilla/12.0");

			  static function OnBeforeRequest(oSession:Fiddler.Session){

					UASim.OverwriteUA(oSession);

			  }

		   static function Main(){

			   var today: Date = new Date();      

			   FiddlerObject.StatusText = " CustomRules.js was loaded at: " + today;

		   }

		}

See Also
--------

+ [Write code in .NET with the IAutoTamper interface][2]

+ [Build assemblies to run in both Fiddler v2 and v4][3]

[1]: ./AddRules
[2]: http://fiddler2.com/add-ons
[3]: ./ExtensionsForv2Andv4