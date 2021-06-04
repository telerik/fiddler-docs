---
title: Fiddler Architecture Info
slug: fiddler-architecture-info
publish: true
res_type: kb
position: 12
---

<!-- http://fiddler2.com/Fiddler/dev/FiddlerArchitecture.asp -->

# Fiddler Architecture Info

This page contains information about Fiddler's internal architecture which may be of interest for advanced users of Fiddler. Note that all information presented here is subject to change; expect that you will need to maintain your code if you use the functionality on this page.

## Session State
The Session.state property exposes information about the current request

		public enum SessionStates
		{
		  Created,                   // Object created but nothing's happening yet
		  ReadingRequest,            // Thread is reading the HTTP Request
		  AutoTamperRequestBefore,   // AutoTamperRequest pass 1 (Only used by IAutoTamper)
		  HandTamperRequest,         // User can tamper using Fiddler Inspectors
		  AutoTamperRequestAfter,    // AutoTamperRequest pass 2 (Only used by IAutoTamper)
		  SendingRequest,            // Thread is sending the Request to the server
		  ReadingResponse,           // Thread is reading the HTTP Response
		  AutoTamperResponseBefore,  // AutoTamperResponse pass 1 (Only used by IAutoTamper)
		  HandTamperResponse,        // User can tamper using Fiddler Inspectors
		  AutoTamperResponseAfter,   // AutoTamperResponse pass 2 (Only used by IAutoTamper)
		  SendingResponse,           // Sending response to client application
		  Done,                      // Session is for archival purposes only
		  Aborted                    // Session was aborted (client didn't want response, fatal error, etc)
		};

## FiddlerApplication
The static **FiddlerApplication** object collects interesting objects and event handlers useful for building extensions.

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

		  [CodeDescription("Fiddler's AutoResponder object.")]  REMOVED in v2.1.8
		  public static AutoResponder oAutoResponder;

		  [CodeDescription("Fiddler's loaded extensions.")]
		  public static FiddlerExtensions oExtensions;

		  [CodeDescription("FiddlerScript scripting engine.")]   Likely to be removed
		  public static FiddlerScript scriptRules;

		  [CodeDescription("Sync this event to be notified when Fiddler has completed startup.")]
		  public static event SimpleEventHandler FiddlerBoot;

		  [CodeDescription("Sync this event to be notified when Fiddler has attached as the system proxy.")]
		  public static event SimpleEventHandler FiddlerAttach;

		  [CodeDescription("Sync this event to be notified when Fiddler has detached as the system proxy.")]
		  public static event SimpleEventHandler FiddlerDetach;

		  [CodeDescription("Sync this event to be notified when Fiddler shuts down.")]
		  public static event SimpleEventHandler FiddlerShutdown;

		  [CodeDescription("Sync this event to capture the CalculateReport event, summarizing the selected sessions.")]
		  public static event CalculateReportHandler CalculateReport;
		}

## Fiddler SessionFlags
Each Session object in Fiddler contains a collection of string flags, in the Session.oFlags[] collection.  The flags control how the session is processed and displayed in Session List. See [Fiddler Session Flags](http://fiddler2.com/Fiddler/dev/SessionFlags.asp) for more information.

## SessionTimers
As it processes each Session, Fiddler keeps track of key events using the .Timers object on each session. You can learn more about [what each SessionTimer means](http://fiddler.wikidot.com/Timers).

## About Fiddler's sources
According to [this line count tool](http://www.codeproject.com/useritems/LineCountUtility.asp), the main Fiddler project consists of ~23k lines of C# code, after many recent refactorings to simplify the code.

The default Inspector objects contain ~6k lines of code, and the FiddlerExtensions (RulesTab, RulesTab2, GalleryView, TimelineView) contain ~2k lines of code.

As you can see, coding against the .NET Framework offers a lot of power per line of code.

## HTTPS Protocol Support
By default, Fiddler2 accepts SSLv2 SSLv3 and TLSv1 from the client, and offers SSLv3 and TLSv1 to the server. The text in the response for the CONNECT tunnel shows what cipher the remote server chose, and shows information about the server's certificate.

Note that this may be different than if Fiddler were not intercepting the connection.  If you want to see what algorithms would have been chosen had Fiddler not been involved, disable the Decrypt HTTPS Traffic feature using the Tools | Fiddler Options menu.

Learn more about [HTTPS Decryption](../Configure-Fiddler/Tasks/DecryptHTTPS).

## Silent Installation
Want a silent / unattended install?  Use the setup command line: **FiddlerSetup.exe /S**
