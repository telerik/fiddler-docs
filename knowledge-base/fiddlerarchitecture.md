---
title: Fiddler Classic Architecture Info
slug: fiddler-architecture-info
publish: true
res_type: kb
position: 12
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

## Fiddler Classic Architecture Info

This page describes Fiddler's internal architecture for advanced users. All information here is subject to change; plan to maintain your code accordingly if you rely on any of the functionality described.

## Session State

The `Session.state` property exposes information about the current request:

```c#
public enum SessionStates
{
	Created,                   // Object created but nothing's happening yet
	ReadingRequest,            // Thread is reading the HTTP Request
	AutoTamperRequestBefore,   // AutoTamperRequest pass 1 (Only used by IAutoTamper)
	HandTamperRequest,         // User can tamper using Fiddler Classic Inspectors
	AutoTamperRequestAfter,    // AutoTamperRequest pass 2 (Only used by IAutoTamper)
	SendingRequest,            // Thread is sending the Request to the server
	ReadingResponse,           // Thread is reading the HTTP Response
	AutoTamperResponseBefore,  // AutoTamperResponse pass 1 (Only used by IAutoTamper)
	HandTamperResponse,        // User can tamper using Fiddler Classic Inspectors
	AutoTamperResponseAfter,   // AutoTamperResponse pass 2 (Only used by IAutoTamper)
	SendingResponse,           // Sending response to client application
	Done,                      // Session is for archival purposes only
	Aborted                    // Session was aborted (client didn't want response, fatal error, etc)
};
```

## FiddlerApplication

The static **FiddlerApplication** object exposes key objects and event handlers useful for building extensions.

```c#
public delegate void SimpleEventHandler();
public delegate void CalculateReportHandler(Session[] _arrSessions);

public class FiddlerApplication
{
	[CodeDescription("Fiddler's main form.")]
	public static frmViewer UI;

	public static Proxy oProxy;
	public static AutoResponder oAutoResponder;
	public static FiddlerExtensions oExtensions;
	public static FiddlerScript scriptRules;

	[CodeDescription("Fiddler's core proxy engine.")]
	public static Proxy oProxy;

	[CodeDescription("Fiddler's AutoResponder object.")]  // REMOVED in v2.1.8
	public static AutoResponder oAutoResponder;

	[CodeDescription("Fiddler's loaded extensions.")]
	public static FiddlerExtensions oExtensions;

	[CodeDescription("FiddlerScript scripting engine.")]   // Likely to be removed
	public static FiddlerScript scriptRules;

	[CodeDescription("Sync this event to be notified when Fiddler Classic has completed startup.")]
	public static event SimpleEventHandler FiddlerBoot;

	[CodeDescription("Sync this event to be notified when Fiddler Classic has attached as the system proxy.")]
	public static event SimpleEventHandler FiddlerAttach;

	[CodeDescription("Sync this event to be notified when Fiddler Classic has detached as the system proxy.")]
	public static event SimpleEventHandler FiddlerDetach;

	[CodeDescription("Sync this event to be notified when Fiddler Classic shuts down.")]
	public static event SimpleEventHandler FiddlerShutdown;

	[CodeDescription("Sync this event to capture the CalculateReport event, summarizing the selected sessions.")]
	public static event CalculateReportHandler CalculateReport;
}
```

## Fiddler SessionFlags

Each Session object in Fiddler Classic contains a collection of string flags in the `Session.oFlags[]` collection. The flags control how the session is processed and displayed in the Session List. See [Fiddler Classic Session Flags](http://fiddler2.com/Fiddler/dev/SessionFlags.asp) for more information.

## SessionTimers

As it processes each session, Fiddler Classic tracks key events using the `.Timers` object on each session. See [what each SessionTimer means](http://fiddler.wikidot.com/Timers) for more information.

## About Fiddler's sources

According to [this line count tool](http://www.codeproject.com/useritems/LineCountUtility.asp), the main Fiddler Classic project consists of approximately 23,000 lines of C# code.

The default Inspector objects contain approximately 6,000 lines of code, and the FiddlerExtensions (RulesTab, RulesTab2, GalleryView, TimelineView) contain approximately 2,000 lines of code.

This reflects how much functionality the .NET Framework provides per line of code.

## HTTPS Protocol Support

By default, Fiddler Classic accepts SSLv3, TLSv1.0, TLSv1.1, and TLSv1.2 from the client, and offers the same protocol versions to the server. The response for the CONNECT tunnel shows the cipher chosen by the remote server and information about the server's certificate.

The supported protocols are configurable through **Options > HTTPS > Protocols**. The default values vary depending on the Windows version.

**Windows 10** — TLS 1.3 is not fully supported, so it is excluded from the defaults:

```txt
<client>;ssl3;tls1.0;tls1.1;tls1.2
```

**Windows 11** — TLS 1.3 is fully supported and included by default:

```txt
<client>;ssl3;tls1.0;tls1.1;tls1.2;tls1.3
```

> **Note:** The negotiated cipher may differ from what would be chosen without Fiddler Classic intercepting the connection. To see the unintercepted behavior, disable **Decrypt HTTPS Traffic** in **Tools > Fiddler Classic Options**.

Learn more about [HTTPS Decryption](slug://DecryptHTTPS).

## Silent Installation

To perform a silent (unattended) install, use the following command line:

```
FiddlerSetup.exe /S
```