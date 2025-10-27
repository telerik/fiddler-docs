---
title: Run from Command Line with ExecAction
description: "Fiddler Classic execAction guide - automate tasks like clearing traffic, saving sessions, or running external tools with custom actions."
slug: ExecAction
publish: true
position: 10
res_type: kb
---


## Environment

<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>5.0.20253</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Fiddler Classic </td>
		</tr>
	</tbody>
</table>

## Controlling Fiddler Classic with Test Automation

ExecAction.exe is a command line executable which is suitable for calling from batch files or unit tests.  It passes its command line into FiddlerScript's **OnExecAction** function for processing, just like Fiddler's [QuickExec box][1].  The ExecAction commands can be handled by FiddlerScript or FiddlerExtensions.

ExecAction.exe is installed into the Fiddler Classic directory inside your AppData\Local\Programs folder.

**Usage:**
               ExecAction SCRIPTPARAMETER
               ExecAction "PARAM1 PARAM2"

ExecAction sets **%ERRORLEVEL%** to

+ 0 if successful
+ 1 if an incorrect (!= 1) number of arguments used
+ 2 if the Fiddler Classic window could not be found.

[1]: ./QuickExec