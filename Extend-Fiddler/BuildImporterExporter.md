---
title: Build a Custom Importer or Exporter
slug: BuildImporterExporter
tags: Extend Fiddler, .NET, Extension, Importer, Exporter, ISessionImporter, ISessionExporter, ProgressCallbackEventArgs
publish: true
ordinal: 8
---

Build a Custom Importer or Exporter
===================================

1. Create a [Fiddler extension project].

2. Change the code to derive from the **Inspector2** class and implement either **IResponseInspector2** or **IRequestInspector2**.

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

3. Inside the class, create a new method. By typing **public override**, you'll get an autocomplete list of the methods you need to write.

4. In **Solution Explorer**, right-click on the project and click **Add > User Control**.

5. Use the **Toolbox** to add controls to your user control. These will show the data about the HTTP message under inspection.

6. In the **body{ set }** and **headers{ set }** properties, you should update your control's visual representation of the request or response. 

7. [Compile and load your extension in Fiddler][2].

[1]: ./CreateExtension.md
[2]: ./LoadExtension.md