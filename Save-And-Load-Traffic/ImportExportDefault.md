---
title: Import and Export Traffic
slug: ImportExport
tags: Save and Load Traffic, Import, Export, Importer, Exporter, Save
publish: true
ordinal: 3
---

Export to Default Formats
-------------------------

To export traffic to **WCAT Script**, **VS Web Test Script**, [**Meddler Script**][1], **HTML5 AppCache Manifest**, [**HTTP Archive Format 1.1**][2], [**HTTP Archive Format 1.2**][3], or a **Raw File Dump**:

1. Click **File > Export Sessions**.

2. Click either **All Sessions** or **Selected Sessions**.

3. Select the export format from the drop-down menu.

 ![Select Export Format][4]

4. Click **Next** to select the export file location.
 
5. If exporting to **HTML5 AppCache Manifest**: Check any resources you wish to exclude from the CACHE section of the Manifest. These will be added to the NETWORK section of the Manifest.

 ![Adjust AppCache Manifest][7]

6. To specify a **Base URL** and convert the URLs to be relative to this URL, type this URL in the **Base URL:** field.

 ![Base URL][8]

7. Click **Save**. The AppCache Manifest appears in a text editor.

Import to Default Formats
-------------------------

To import traffic from **HTTP Archive JSON**, **HTTP Archive XML** (exported from [IE9 Developer Tools Network Tab][12]), or **Test Studio Load Test**:

1. Click **File > Import Sessions...**.

2. Select the import format from the drop-down menu.

 ![Select Import Format][6]

3. Click **Next**.




[1]: http://www.webdbg.com/meddler/
[2]: http://groups.google.com/group/http-archive-specification/web/har-1-1-spec
[3]: http://groups.google.com/group/http-archive-specification/web/har-1-2-spec
[4]: ../images/ImportExport/SelectExportFormat.png
[5]: http://blogs.msdn.com/b/ie/archive/2010/04/22/ie9-developer-tools-network-tab.aspx
[6]: ../images/ImportExport/SelectImportFormat.png
[7]: ../images/ImportExport/AdjustAppCacheManifest.png
[8]: ../images/ImportExport/BaseURL.png
