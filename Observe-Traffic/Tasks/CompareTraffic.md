---
title: Compare Traffic
slug: CompareTraffic
tags: Observe Traffic, Compare, Diff, WinDiff, WinMerge
publish: true
ordinal: 11
---

Compare Web Traffic
===================

Compare two web sessions
------------------------

1. Select two sessions in the **Web Sessions List**.
2. Right-click one of the sessions.
3. Click **Compare** from the context menu. 

By default, this will attempt to launch **WinDiff** or **WinMerge** to compare the traffic.

**Tips:**

+ If you're using WinDiff, you can cause it to break each line on punctuation by holding ALT or SHIFT while clicking on the **Compare** menu item.
+ You can set the **fiddler.differ.ultradiff**  [preference][5] to **False** if you don't want Fiddler to attempt to reorganize the headers and URL for simpler diffing when saving the files.

Change default text comparison tool
-----------------------------------

1. Click **Tools > Fiddler Options > Tools**
2. Enter the location for the tool executable.

Set custom command-line arguments
---------------------------------

In the [QuickExec box][3]:

1. Provide the path to the tool:

        PREFS SET fiddler.config.path.differ "C:\Program Files (x86)\Microsoft Visual Studio 11.0\Common7\IDE\devenv.exe"

2. Configure the command line to match what the tool expects:

        PREFS SET fiddler.differ.Params "/diff \"{0}\" \"{1}\""

3. (Optional) Set an alternate command line that will be invoked if you hold ALT or SHIFT while invoking the comparison:

        PREFS SET fiddler.differ.ParamsAlt "/diff /binary \"{0}\" \"{1}\""

Compare multiple sessions at once
---------------------------------

The [Traffic Differ Extension][4] allows you to compare multiple sessions at a time.


See Also
--------

+ [Download WinMerge][1]
+ [Install Windiff][2]

[1]: http://winmerge.org/
[2]: http://support.microsoft.com/kb/159214
[3]: ../../KnowledgeBase/QuickExec
[4]: http://fiddler2.com/add-ons
[5]: ../../KnowledgeBase/FiddlerScript/FiddlerPrefs
