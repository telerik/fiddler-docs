---
title: Importers and Exporters
slug: importersandexporters
tags: Import-Export
publish: true
---

#Importers and Exporters

###Introduction
Fiddler 2.2.9.5 introduced the ISessionImport and ISessionExport interfaces, allowing you to import traffic to Fiddler and export it to other file formats. Fiddler ships with a number of these "transcoders" by default, but you can also write your own using any .NET language.

###Prerequisites
Fiddler v2.x loads only **.NET CLR v2.0** assemblies; use Visual Studio 2005+ to compile your extension. If you use Visual Studio 2010 or later, you **must** change your project to target the .NET2.0/3.5 framework or Fiddler will not load your extension.

Fiddler itself requires only that the user have **.NET Framework 2.0 SP1** installed. You *may* have your extensions target the .NET Framework 3.5 (which includes Linq) since that framework also (confusingly) runs on the v2.0 CLR but you MUST yourself ensure that the user has the required Framework version installed BEFORE you install your extension, or a user with only the older Framework will crash on boot.

You should also ensure your project targets **AnyCPU** to ensure that it works properly with [64bit Fiddler](http://fiddler.wikidot.com/bitness).

Learn more about [Building assemblies to run in both Fiddler v2 and v4](http://fiddler2.com/Fiddler/dev/FrameworkTarget.asp)

###Debugging your Extensions
* Extension developers should set the **fiddler.debug.extensions.showerrors** preference to **True** ensure that exceptions and other extension-related errors are not silently caught.

* Extension developers should set the **fiddler.debug.extensions.verbose** preference to **True** to spew logging information to the Log tab.

*If you write to me complaining that your extension doesn't work and you have not first set these preferences before testing, I will tease you mercilessly.*

###Direct Fiddler to load your Transcoder assemblies
Fiddler loads extension assembly DLLs from the **%ProgramFiles%\Fiddler2\ImportExport\** and **%USERPROFILE%\Documents\Fiddler2\ImportExport\** folders.  Install to the %ProgramFiles% location to make your extensions available to all users on the machine, or the %UserProfile% folder to make the extension available only to the current user.

In addition to placing your Transcoder DLLs in the appropriate folder, you must also mark your assembly to indicate the minimum version of Fiddler required for your Assembly to load correctly. 

Set the **Fiddler.RequiredVersion** attribute in your **AssemblyInfo.cs** file (or elsewhere in your code), as follows:

	using Fiddler;

	// This Transcoder requires Fiddler 2.2.9.7+ because that is when the 
	// ISessionImport and ISessionExport interfaces were finalized.
	[assembly: Fiddler.RequiredVersion("2.2.9.7")]

If Fiddler finds a RequiredVersion attribute that indicates a later version of Fiddler is required, the user will be notified that a later version of Fiddler is required to use your extension.  Assemblies which do not contain a RequiredVersion attribute are silently ignored.

###Threading, FiddlerCore, and other notes
Currently, the ISessionImporter and ISessionExporter interfaces are called on the MAIN UI thread. This is almost certain to change in the future, so you should ensure that your classes are thread safe and that they do not attempt to directly manipulate the Fiddler UI. 

Manipulation of the Fiddler UI is further ill-advised because Fiddler itself may not be loaded; [FiddlerCore](http://fiddler2.com/fiddler/core/) may be hosting your Importer/Exporter directly. In order to support FiddlerCore, it's advised that you support the **Filename** key (with string value of a fully-qualified path) in the **dictOptions** parameter, and consider supporting a **Silent key** (value as boolean) as well.

###The ISessionImporter Interface
Extensions that implement the ISessionImporter interface (which implements the IDisposable interface) are called when the user uses the File > Import menu option.

	public interface ISessionImporter : IDisposable
	{
	   Session[] ImportSessions(string sImportFormat, Dictionary<string, object> dictOptions,
			 EventHandler<ProgressCallbackEventArgs> evtProgressNotifications);
	}

The method should return an array of Session objects created from the Import of the data.

The dictOptions dictionary may be null, or may contain a set of string-keyed objects. Most importers support specification of a filename like so dictOptions["Filename"] = "C:\\test.file"

###The ISessionExporter Interface
Extensions that implement the ISessionExporter interface (which implements the IDisposable interface) are called when the user uses the File > Export menu option.

	public interface ISessionExporter : IDisposable
	{
		bool ExportSessions(string sExportFormat, Session[] oSessions, 
			Dictionary<string, object> dictOptions, EventHandler<ProgressCallbackEventArgs> evtProgressNotifications);
	}

The method should return True if the export of the sessions passed via the oSessions parameter is successful.

The dictOptions dictionary may be null, or may contain a set of string-keyed objects. Most importers support specification of a filename like so dictOptions["Filename"] = "C:\\test.file"

###The ProgressCallbackEventArgs class
This class is defined by Fiddler and allows you to report on the progress of an import or export operation.

If the completion ratio cannot be determined, simply pass 0 or a "guess" between 0 and 1.0.

If the Cancel flag is set on the ProgressCallbackEventArgs object after being passed to the evtProgressNotifications callback, import or export should gracefully terminate as soon as possible.

	public class ProgressCallbackEventArgs: EventArgs
	{
	  public ProgressCallbackEventArgs(float flCompletionRatio, string sProgressText)
	  public string ProgressText { get; }
	  public string PercentComplete { get; }
	  public bool Cancel { get; set; }
	}


#Step-by-step Sample Extension

Here's a trivial extension which modifies the User-Agent string of all outbound requests.

1. Start Visual Studio 2005.
2. Create a new Project of type **Visual C# Class Library**
3. Right-click the project's **References** folder in the **Solution Explorer**
4. Choose the *Browse* tab and find **Fiddler.exe** in the **C:\Program Files\Fiddler2** folder. 
5. Click **Ok** to add the reference.
6. If you're planning to add to Fiddler's UI
* Right-click the project's **References** folder in the **Solution Explorer** again
* On the **.NET** tab, choose **System.Windows.Forms**.
* Click **Ok** to add the reference.
7. In the **Solution Explorer**, right click the project.  Choose **Properties**.
8. On the **Build Events** tab, add the following to the **Post-build event command line**:

		copy "$(TargetPath)" "%userprofile%\Documents\Fiddler2\ImportExport\$(TargetFilename)"
9. Modify the default class1.cs (or create a new class) in your project as follows:

		using System;
		using System.IO;
		using System.Text;
		using System.Windows.Forms;
		using Fiddler;
		using System.Diagnostics;
		using System.Reflection;
		[assembly: AssemblyVersion("1.0.0.0")]
		[assembly: Fiddler.RequiredVersion("2.4.0.0")]


		[ProfferFormat("TAB-Separated Values", "Session List in Tab-Delimited Format")]
		[ProfferFormat("Comma-Separated Values", 
			"Session List in Comma-Delimited Format; import into Excel or other tools")]

		public class CSVTranscoder: ISessionExporter  // Ensure class is public, or Fiddler won't see it!
		{
		  public bool ExportSessions(string sFormat, Session[] oSessions, Dictionary<string, object> dictOptions,
			  EventHandler<ProgressCallbackEventArgs> evtProgressNotifications)
		  {
			bool bResult = false; 
			string chSplit;

			// Determine if we already have a filename from the dictOptions collection
			string sFilename = null;
			if (null != dictOptions && dictOptions.ContainsKey("Filename"))
			{
			  sFilename = dictOptions["Filename"] as string;
			}

			if (sFormat == "Comma-Separated Values")
			{
			  chSplit = ",";
			  if (string.IsNullOrEmpty(sFilename)) sFilename = Fiddler.Utilities.ObtainSaveFilename("Export As " + sFormat, "CSV Files (*.csv)|*.csv");
			}
			else
			{
			  chSplit = "\t";
			  if (string.IsNullOrEmpty(sFilename)) sFilename = Fiddler.Utilities.ObtainSaveFilename("Export As " + sFormat, "TSV Files (*.tsv)|*.tsv");
			}

			if (String.IsNullOrEmpty(sFilename)) return false;

			try
			{
			  StreamWriter swOutput = new StreamWriter(sFilename, false, Encoding.UTF8);
			  int iCount = 0;
			  int iMax = oSessions.Length;

			  #region WriteColHeaders
			  bool bFirstCol = true;
			  foreach (ColumnHeader oLVCol in FiddlerApplication.UI.lvSessions.Columns)
			  {
				if (!bFirstCol)
				{
				swOutput.Write(chSplit);
				}
				else
				{
				bFirstCol = false;
				}
				swOutput.Write(oLVCol.Text.Replace(chSplit, ""));
				}
				swOutput.WriteLine();
				#endregion WriteColHeaders

				#region WriteEachSession
				foreach (Session oS in oSessions)
				{
				iCount++;
				if (null != oS.ViewItem)
				{
				bFirstCol = true;
				ListViewItem oLVI = (oS.ViewItem as ListViewItem);
				if (null == oLVI) continue;
				foreach (ListViewItem.ListViewSubItem oLVC in oLVI.SubItems)
				{
				  if (!bFirstCol)
				{
				  swOutput.Write(chSplit);
				}
				else
				{
				  bFirstCol = false;
				} 

				  swOutput.Write(oLVC.Text.Replace(chSplit, ""));
				}

				swOutput.WriteLine();
			  }

			  if (null != evtProgressNotifications)
			  {
				evtProgressNotifications(null, new ProgressCallbackEventArgs(, ));
				ProgressCallbackEventArgs PCEA = new ProgressCallbackEventArgs((iCount/(float)iMax), "wrote " + iCount.ToString() + " records.");
				evtProgressNotifications(null, PCEA);
				if (PCEA.Cancel) { swOutput.Close(); return false; }
			  }
			}
			#endregion WriteEachSession

			swOutput.Close();
			bResult = true;
			}
			catch (Exception eX)
			{
			  MessageBox.Show(eX.Message, "Failed to export");
			  bResult = false;
			 }
		  }
		  return bResult;
		  }

		  public void Dispose()
		  {
		  }
		}

###Other Examples and Information
**Passing arguments to the Transcoder**

Transcoders may be passed arguments in a dictionary object.  For instance, FiddlerScript can invoke the HTTPArchive transcoder, passing in the filename string and maximum response size integers thusly:

	var oSessions = FiddlerApplication.UI.GetAllSessions();
	var oExportOptions = FiddlerObject.createDictionary();
	oExportOptions.Add("Filename", "C:\\users\\ericlaw\\desktop\\out1.har");
	oExportOptions.Add("MaxTextBodyLength", 1024);
	oExportOptions.Add("MaxBinaryBodyLength", 16384);
	FiddlerApplication.DoExport("HTTPArchive v1.2", oSessions, oExportOptions, null);

Your Transcoder extension may collect these options like so:

	 public bool ExportSessions(string sFormat, Session[] oSessions, 
		  Dictionary<string, object> dictOptions, EventHandler<ProgressCallbackEventArgs> evtProgressNotifications)
	{

	//...

	  if (null != dictOptions)
	  { 
		if (dictOptions.ContainsKey("Filename"))
		{
		sFilename = dictOptions["Filename"] as string;
		}

		if (dictOptions.ContainsKey("MaxTextBodyLength"))
		{
		  iMaxTextBodyLength = (int)dictOptions["MaxTextBodyLength"];
		}

		if (dictOptions.ContainsKey("MaxBinaryBodyLength"))
		{
		   iMaxBinaryBodyLength = (int)dictOptions["MaxBinaryBodyLength"];
		}
	  }

**Almost done...**

* Compile your project.

* Drop your assembly .DLL in your **\Documents\Fiddler2\ImportExport\** folder (or use **\Program Files\Fiddler2\ImportExport\**to make available to all users on the machine)

* Restart Fiddler2.

* Click File > Import or File > Export

If you need help or have questions, please email me using the **Contact** link above.