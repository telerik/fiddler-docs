---
title: Find why IE9 made a web request
slug: IE9RequestHeader
tags: Observe traffic, IE9, Request header, downloa-initiator
publish: true
ordinal: 8
---

Find why IE9 made a web request
===============================

Add Accept header and Download Initiator columns to **Web Sessions List**.
--------------------------------------------------------------------------

1. Enable the 

	FEATURE_DOWNLOAD_INITIATOR_HTTP_HEADER 

Feature Control Key. 

2. Enter these commands in the QuickExec box:

	cols add @request.Accept
	cols add @request.X-Download-Initiator

 ![QuickExec Command][1]

3. Click **Rules > Customize Rules**

4. Scroll to the static function Main() block , and add the following line within:

	FiddlerObject.UI.lvSessions.AddBoundColumn("Accept", 50, "@request.Accept");
	FiddlerObject.UI.lvSessions.AddBoundColumn("Reason", 50, “@request.X-Download-Initiator");

See also
--------

[Introduction to Feature Controls][9]

[1]: ../../images/IE9RequestHeader/QuickExecCommand.png
[9]: http://msdn.microsoft.com/en-us/library/ms537184(v=vs.85).aspx