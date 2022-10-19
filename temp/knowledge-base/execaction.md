---
title: Run from Command Line with ExecAction
slug: ExecAction
publish: true
position: 10
res_type: kb
---

Controlling Fiddler Classic with Test Automation
========================================

ExecAction.exe is a command line executable which is suitable for calling from batch files or unit tests.  It passes its command line into FiddlerScript's **OnExecAction** function for processing, just like Fiddler's [QuickExec box][1].  The ExecAction commands can be handled by FiddlerScript or FiddlerExtensions.

ExecAction.exe is installed into the Fiddler Classic directory inside your Program Files folder.

**Usage:**
               ExecAction SCRIPTPARAMETER
               ExecAction "PARAM1 PARAM2"

ExecAction sets **%ERRORLEVEL%** to

+ 0 if successful
+ 1 if an incorrect (!= 1) number of arguments used
+ 2 if the Fiddler Classic window could not be found.

[1]: ./QuickExec