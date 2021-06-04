---
title: Implement Interfaces
slug: Interfaces
publish: true
position: 2
---

Implement Fiddler Classic Interfaces
============================

Implement Fiddler Classic interfaces to load your assembly during Fiddler execution.

Load Extension During Startup
-----------------------------

Public classes in your assembly that implement the **IFiddlerExtension** interface will be loaded by Fiddler during startup.

		public interface IFiddlerExtension
		{
		  // Called when Fiddler User Interface is fully available
		  void OnLoad();

		  // Called when Fiddler is shutting down
		  void OnBeforeUnload();
		}

+ The **OnLoad** function will be called when Fiddler has finished loading and its UI is fully available.  At this point, you can safely add menu items, tabbed pages, or other elements to the Fiddler UI. 

+ The **OnBeforeUnload** function will be called when Fiddler is shutting down and unloading all extensions.

Call Extension for Each Web Request
-----------------------------------

+ Extensions that implement the **IAutoTamper** interface (which extends **IFiddlerExtension**) are called for each HTTP/HTTPS request and response, enabling modifications, logging, or other operations. 

 ***Warning***:  Functions in this interface are called on background, non-UI threads. To update UI, use **Invoke** or **BeginInvoke** to update the UI. Also, note that the IAutoTamper::* functions may be called before the **OnLoad** event is called-- Fiddler allows traffic to flow before the UI is fully available.

		public interface IAutoTamper : IFiddlerExtension
		{
		  // Called before the user can edit a request using the Fiddler Inspectors
		  void AutoTamperRequestBefore(Session oSession);

		  // Called after the user has had the chance to edit the request using the Fiddler Inspectors, but before the request is sent
		  void AutoTamperRequestAfter(Session oSession);

		  // Called before the user can edit a response using the Fiddler Inspectors, unless streaming.
		  void AutoTamperResponseBefore(Session oSession);

		  // Called after the user edited a response using the Fiddler Inspectors.  Not called when streaming.
		  void AutoTamperResponseAfter(Session oSession);

		  // Called Fiddler returns a self-generated HTTP error (for instance DNS lookup failed, etc)
		  void OnBeforeReturningError(Session oSession);
		}

+ Extensions that implement the **IAutoTamper2** interface (which extends **IAutoTamper**) are called when the response headers become available.

		/// <summary>
		/// Interface for AutoTamper extensions that want to "peek" at response headers
		/// </summary>
		public interface IAutoTamper2 : IAutoTamper
		{
		/// <summary>
		/// Called when the response headers become available
		/// </summary>
		/// <param name="oSession">The Session object for which the response headers are available</param>
		void OnPeekAtResponseHeaders(Session oSession);
		}

+ Extensions that implement the **IAutoTamper3** interface (which extends **IAutoTamper2**) are called when the request headers become available.

		/// <summary>
		/// Interface for AutoTamper extensions that want to "peek" at request headers
		/// </summary>
		public interface IAutoTamper3 : IAutoTamper2
		{
		/// <summary>
		/// Called when the request headers become available
		/// </summary>
		/// <param name="oSession">The Session object for which the request headers are available</param>
		void OnPeekAtRequestHeaders(Session oSession);
		}

Call Extension When User Enters a QuickExec Command
---------------------------------------------------

+ Extensions that implement the **IHandleExecAction** interface are called when the user has entered a command into the [QuickExec box][1]. To react to the command (and prevent further processing by other extensions and Fiddler itself) return true from this method.

		public interface IHandleExecAction
		{
		  // return TRUE if handled. 
		  bool OnExecAction(string sCommand); 
		}

+ The Fiddler.Utilities class includes a helper function **Parameterize()** which helps to interpret the sCommand parameter.

		[CodeDescription("Tokenize a string into tokens. Delimits on whitespace; Quotation marks are dropped unless preceded by a \ character.")] 
		public static string[] Parameterize(string sCommand)


[1]: ../KnowledgeBase/QuickExec
