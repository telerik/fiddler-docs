---
title: Reduce delays from Expect header
description: Reduce delays from 'Expect 100-continue headers'
slug: ContinueRequestHeaders
publish: true
position: 3
previous_url: /tasks/continuerequestheaders
---

# Reduce Delays from Expect: 100-continue headers

To have Fiddler Classic return the 100-Continue header for a request:

1. Click **Rules > Customize Rules...**.
2. Add the following function inside the **Handlers** class:
```c#
static function OnPeekAtRequestHeaders(oSession: Session) {
	if (oSession.HTTPMethodIs("POST") && oSession.oRequest.headers.ExistsAndContains("Expect", "continue"))
	{
		if (null != oSession.oRequest.pipeClient)
		{
		oSession["ui-backcolor"] = "lightyellow";
		oSession.oRequest.headers.Remove("Expect");
		oSession.oRequest.pipeClient.Send(System.Text.Encoding.ASCII.GetBytes("HTTP/1.1 100 Continue\r\nServer: Fiddler\r\n\r\n"));
		}
	}
}
```
