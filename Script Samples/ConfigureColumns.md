---
title: Configuring Columns
slug: configuring-columns
tags: Configuration, scripting
publish: true
---

<!-- http://fiddler2.com/Fiddler/help/configurecolumns.asp -->

#Configuring Columns

##Column Reordering, Resizing, and Sorting
You can **reorder** the columns by dragging a column header to the left or the right. You can **resize** a given column by dragging the edge of a column header. You can **sort** the Session List based on the values in a particular column by clicking on that column's header.

Fiddler will remember the columns display order and width across sessions. The sort order is always reset to sort on *ID (Ascending)* when Fiddler is restarted.

##Adding Custom Columns
You can bind columns in three distinct ways.

**#1. Use QuickExec to add a column for just this debugging instance**

In Fiddler 2.2.8.5 and later, you can add columns manually using the [QuickExec](http://fiddler2.com/Fiddler/help/quickexec.asp) box. The syntax is

    cols add [Title] FlagName 

Type commands like:

      cols add @Request.Accept
or

     cols add "Client IP Address" X-CLIENTIP

See Method **#3** below for help on **valid flagnames.**

Note, columns added using QuickExec will be removed on every restart of Fiddler. To add persistent columns, keep reading...

**#2: FiddlerScript BindUIColumn Attribute**

From [FiddlerScript](http://fiddler2.com/Fiddler/Dev/ScriptSamples.asp), you can simply add a method labeled with the **BindUIColumn** attribute:

       public static BindUIColumn("HTTPMethod")
       function CalcMethodCol(oS: Session){
              if (null != oS.oRequest) return oS.oRequest.headers.HTTPMethod; else return String.Empty; 
       }

or...

       public static BindUIColumn("Time Taken")
       function CalcTimingCol(oS: Session){
         var sResult = String.Empty;
         if ((oS.Timers.ServerDoneResponse > oS.Timers.ClientDoneRequest))
         {
           sResult = String.Format("{0:h:mm:ssss.ffff}", 
           (oS.Timers.ServerDoneResponse - oS.Timers.ClientDoneRequest));
         }
         return sResult;
       }

Fiddler will run the method on each session to fill the custom column. *(To avoid exceptions, be sure that your method is robust and checks to ensure that objects exist before use!)*

**#3 FiddlerScript AddBoundColumn**

Alternatively, from FiddlerScript you can call the **AddBoundColumn()** method.  The first parameter is the name with which the column should be named, and the second parameter is the default width of the column.  The third parameter is either a [Fiddler Session Flag](http://fiddler2.com/Fiddler/Dev/SessionFlags.asp) string, an @-prefixed-header name, or a JavaScript function that returns a string. 

       static function Main()
       {
              FiddlerObject.UI.lvSessions.AddBoundColumn("ClientPort", 50, "X-ClientPort");
              FiddlerObject.UI.lvSessions.AddBoundColumn("SentCookie1", 60, getSentCookie);
              FiddlerObject.UI.lvSessions.AddBoundColumn("SentCookie2", 60, "@request.Cookie");
              FiddlerObject.UI.lvSessions.AddBoundColumn("ReturnedCookie", 60, "@response.Set-Cookie");
       }

       static function getSentCookie(oS: Session){ if (null != oS.oRequest) return oS.oRequest["Cookie"]; }
   

From an [IFiddlerExtension](http://fiddler2.com/Fiddler/Dev/IFiddlerExtension.asp), you can use the **AddBoundColumn** method, passing a **getColumnStringDelegate** as the third parameter.