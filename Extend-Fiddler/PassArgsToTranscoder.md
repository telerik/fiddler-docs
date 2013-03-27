---
title: Pass Arguments to Exporter Extension
slug: PassArgsToTranscoder
tags: Extend Fiddler, .NET, Extension, Importer, Exporter, ISessionImporter, ISessionExporter, ProgressCallbackEventArgs
publish: true
ordinal: 9
---

Passing arguments to the Importer or Exporter Extension
=======================================================

+ Transcoders (objects that implement an [importer or exporter interface][1]) may be passed arguments in a dictionary object.  For instance, FiddlerScript can invoke the **HTTPArchive** transcoder, passing in the filename string and maximum response size integers as follows:

		var oSessions = FiddlerApplication.UI.GetAllSessions();
		var oExportOptions = FiddlerObject.createDictionary();
		oExportOptions.Add("Filename", "C:\\users\\ericlaw\\desktop\\out1.har");
		oExportOptions.Add("MaxTextBodyLength", 1024);
		oExportOptions.Add("MaxBinaryBodyLength", 16384);
		FiddlerApplication.DoExport("HTTPArchive v1.2", oSessions, oExportOptions, null);

+ A transcoder extension may collect these options as follows:

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

[1]: ./ImporterExporterInterfaces