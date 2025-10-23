---
title: Find why IE9 made a web request
slug: IE9RequestHeader
publish: true
position: 8
previous_url: /tasks/ie9requestheader
---

# Find why IE9 made a web request

## Add Accept header and Download Initiator columns to **Web Sessions List**

1. Enable the Feature Control Key. 
	```txt
	FEATURE_DOWNLOAD_INITIATOR_HTTP_HEADER
	```
2. Enter these commands in the QuickExec box:
	```
	cols add @request.Accept
	cols add @request.X-Download-Initiator
	```
3. Click **Rules > Customize Rules**.
4. Scroll to the static function Main() block , and add the following line within:
	``txt
	FiddlerObject.UI.lvSessions.AddBoundColumn("Accept", 50, "@request.Accept");
	FiddlerObject.UI.lvSessions.AddBoundColumn("Reason", 50, "@request.X-Download-Initiator");
	```
