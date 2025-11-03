---
title: Compare Traffic
description: "Use Fiddler Classic to compare traffic sessions - steps for side-by-side analysis of requests/responses to diagnose behavior changes."
slug: CompareTraffic
publish: true
position: 11
previous_url: /observe-traffic/tasks/comparetraffic
---

# Compare Web Traffic

## Compare two web sessions

1. Select two sessions in the **Web Sessions List**.
2. Right-click one of the sessions.
3. Click **Compare** from the context menu. 
By default, this will attempt to launch **WinDiff** or **WinMerge** to compare the traffic.

**Tips:**

* If you're using WinDiff, you can cause it to break each line on punctuation by holding ALT or SHIFT while clicking on the **Compare** menu item.
*You can set the **fiddler.differ.ultradiff**  [preference][5] to **False** if you don't want Fiddler Classic to attempt to reorganize the headers and URL for simpler diffing when saving the files.

## Change default text comparison tool

1. Click **Tools > Options > Tools**.
2. Enter the location for the tool executable.

## Set custom command-line arguments

In the [QuickExec box](slug://QuickExec):
1. Provide the path to the tool:
        ```
        PREFS SET fiddler.config.path.differ "C:\Program Files (x86)\Microsoft Visual Studio 11.0\Common7\IDE\devenv.exe"
        ```
2. Configure the command line to match what the tool expects:
        ```
        PREFS SET fiddler.differ.Params "/diff \"{0}\" \"{1}\""
        ```
3. (Optional) Set an alternate command line that will be invoked if you hold ALT or SHIFT while invoking the comparison:
        ```
        PREFS SET fiddler.differ.ParamsAlt "/diff /binary \"{0}\" \"{1}\""
        ```

## Compare multiple sessions at once

The [Traffic Differ Extension](https://www.telerik.com/fiddler/add-ons) allows you to compare multiple sessions at a time.
