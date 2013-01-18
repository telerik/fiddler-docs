<!-- http://fiddler2.com/Fiddler/dev/UsingCSharp.asp -->

Note: Prefer to write all of your code in .NET?  Use the [IAutoTamper interface](http://fiddler2.com/Fiddler/dev/IFiddlerExtension.asp) instead!

 

###Extending FiddlerScript using .NET

##Using .NET Assemblies in FiddlerScript, step-by-step
For instance, here's an example of a managed C# addon that tweaks the user-agent string.

1. Close Fiddler.

2. Save the following as UASimulator.cs :

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

    
    
3. Go to a VS command prompt in the folder where the .CS file is found.

		csc /target:library /out:c:\UASim.dll UASimulator.cs /reference:"C:\program files\fiddler2\fiddler.exe"

4. Inside Fiddler, add C:\UASim.dll to the ScriptReferences list in Tools | Fiddler Options.

5. Boot Fiddler.

6. Use Rules | Custom Rules to update your script. :

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

    

Learn more about [Building assemblies to run in both Fiddler v2 and v4](http://fiddler2.com/Fiddler/dev/FrameworkTarget.asp)