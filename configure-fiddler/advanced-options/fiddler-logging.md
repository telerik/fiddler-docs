---
title: Logging in Fiddler Application
description: Configure Fiddler Classic to log specific data with FiddlerScript
slug: fiddler-logging-fiddlerscript
publish: true
position: 35
previous_url: /tasks/fiddler-logging
---

# Logging in Fiddler Classic

Fiddler Classic provides a lightweight Logging mechanism.

From FiddlerScript, you can do this:

```c#
FiddlerObject.log("Your message here");
```

From a Fiddler extension, do this:
```c#
FiddlerApplication.Log.LogString("Your message here");
```

If you want to get copies of log messages, write the following code in your extension:
```c#
   FiddlerApplication.Log.OnLogString += new EventHandler<LogEventArgs>(YourEventHandler);
```

and implement an event handler to capture log events. Because logging may occur from background threads, you should use Invoke or BeginInvoke to marshal any UI updates to the UI thread:
```c#
public delegate void LogAString(string Str);
 
void YourEventHandler(object sender, LogEventArgs e)
{
    FiddlerApplication.UI.BeginInvoke(new LogAString(LogOnMainThread), new object[] { e.LogString });
}
 
void LogOnMainThread(string sMsg]
{
    oLogUI.txtLog.AppendText(String.Format("{0} {1} \r\n", DateTime.Now.ToString("HH:mm:ss:ffff"), sMsg));
}
```