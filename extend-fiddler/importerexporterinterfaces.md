---
title: Importer and Exporter Interfaces
slug: ImporterExporterInterfaces
publish: true
position: 7
---

# Importer and Exporter Interfaces

## Thread Safety and FiddlerCore

+ Currently, the **ISessionImporter** and **ISessionExporter** interfaces are called on the **MAIN** UI thread. This is almost certain to change in the future, so you should ensure that your classes are thread safe and that they do not attempt to directly manipulate the Fiddler Classic UI. 

+ Manipulation of the Fiddler Classic UI is further ill-advised because Fiddler Classic itself may not be loaded; FiddlerCore may be hosting your Importer/Exporter directly. In order to support FiddlerCore, it's advised that you support the Filename key (with string value of a fully-qualified path) in the dictOptions parameter, and consider supporting a Silent key (value as boolean) as well.

## The ISessionImporter Interface

Extensions that implement the **ISessionImporter** interface (which implements the **IDisposable** interface) are called when the user uses the **File > Import** menu option.

	```c#
	public interface ISessionImporter : IDisposable
	{
		Session[] ImportSessions(string sImportFormat, Dictionary<string, object> dictOptions,
				EventHandler<ProgressCallbackEventArgs> evtProgressNotifications);
	}

	```

The method returns an array of **Session** objects created from the Import of the data.

The **dictOptions** dictionary may be null, or may contain a set of string-keyed objects. Most importers support specification of a filename. For example:

	```c#
	dictOptions["Filename"] = "C:\\test.file"
	```

## The ISessionExporter Interface

This class is defined by Fiddler Classic and allows you to report on the progress of an import or export operation.

If the completion ratio cannot be determined, simply pass 0 or a "guess" between 0 and 1.0.

If the Cancel flag is set on the **ProgressCallbackEventArgs** object after being passed to the **evtProgressNotifications** callback, import or export should gracefully terminate as soon as possible.

	```c#
	public class ProgressCallbackEventArgs: EventArgs
	{
		public ProgressCallbackEventArgs(float flCompletionRatio, string sProgressText)
		public string ProgressText { get; }
		public string PercentComplete { get; }
		public bool Cancel { get; set; }
	}
	```

## See Also

+ [Build a Custom Importer or Exporter](slug://BuildImporterExporter)