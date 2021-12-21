---
title: Import and Export Formats
description: "Learn how to import and export sessions in different formats through the Fiddler Classic UI."
slug: ImportExportFormats
publish: true
position: 18
res_type: kb
---

Fiddler Classic Import and Export Formats
=================================

Fiddler Classic supports the following formats by default:

Import
------

+ **HTTP Archive JSON**

+ **HTTP Archive XML**
  
   These files are exported from the [IE9 Developer Tools Network Tab][1].

Export
------

+ **[HTTP Archive JSON v1.1][2]** (*.har)

   This format does not support storage of non-textual response bodies.

+ **[HTTP Archive JSON v1.2][3]** (*.har)

   This format supports storage of non-textual response bodies. Because these .har files are not compressed, Fiddler Classic will only store non-textual content smaller than 32kb by default. This limit can be increased by setting a [Fiddler Classic Preference][5]: 
   
        fiddler.importexport.HTTPArchiveJSON.MaxBinaryBodyLength

+ **Visual Studio Web Test XML**

+ **WCAT Load Test Script**

+ **Raw Files**

   The Raw Files export format allows you to easily dump captured response files to a folder on disk. This allows you to easily collect (for example) audio, video, or image files.

+ **[Meddler Scripts][4]**

+ **HTML5 AppCache Manifests**

Custom Import and Export Classes
--------------------------------

Beyond these default formats, developers can create their own Import and Export classes by implementing the [ISessionImporter and ISessionExporter][6] interfaces using any .NET language. There is no particular requirement that the classes store data in a file. You could build a class that saves or loads traffic from a local database or a data store in the cloud.

[1]: https://blogs.msdn.com/b/ie/archive/2010/04/22/ie9-developer-tools-network-tab.aspx
[2]: https://groups.google.com/forum/?fromgroups=#!forum/http-archive-specification
[3]: https://groups.google.com/forum/?fromgroups=#!forum/http-archive-specification
[4]: http://www.fiddler2.com/meddler/
[5]: ./FiddlerScript/FiddlerPrefs
[6]: ../Extend-Fiddler/ImporterExporterInterfaces
