---
title: Configure Columns
slug: ConfigureColumns
tags: Observe Traffic, Configuration, Columns, Web Sessions List
publish: true
ordinal: 9
---

Configure Columns
=================

Rearrange Columns
-----------------

+ To reorder the columns, drag a column header to the left or the right. 

 ![Reorder Columns][1]

+ To resize a column, drag the edge of a column header.

 ![Resize Columns][2]

Add Custom Columns
------------------

Use on of these methods:

Use QuickExec to add a temporary column
---------------------------------------

Type this command in the QuickExec box:

	cols add [Title] FlagName 

 ![QuickExec Command][3]

Columns added using QuickExec will be removed the next time Fiddler starts. For more QuickExec column commands, see the [QuickExec Reference][4].

Customize rules with FiddlerScript
----------------------------------

 1. Click **Rules > Customize Rules...** 

 2. Add a method labeled with the **BindUIColumn** attribute:

			public static BindUIColumn("HTTPMethod")
					function CalcMethodCol(oS: Session){
							if (null != oS.oRequest) return oS.oRequest.headers.HTTPMethod; else return String.Empty; 
					}

 or:

			public static BindUIColumn("Time Taken")
				   function CalcTimingCol(oS: Session){
					 var sResult = String.Empty;
					 if ((oS.Timers.ServerDoneResponse > oS.Timers.ClientDoneRequest))
					 {
					   sResult = (oS.Timers.ServerDoneResponse - oS.Timers.ClientDoneRequest).ToString();
					 }
					 return sResult;
				   }
 There are four overloads for BindUIColumn that allow you to set the width, display order, and whether the column should be sorted numerically:

		BindUIColumn(string colName)
		BindUIColumn(string colName, bool bSortColumnNumerically)
		public BindUIColumn(string colName, int iColWidth)
		public BindUIColumn(string colName, int iColWidth, int iDisplayOrder)

  
 Note: To avoid exceptions, be sure that your method is robust and checks to ensure that objects exist before use.

Call the AddBoundColumn() method in FiddlerScript
-------------------------------------------------

1. Click **Rules > Customize Rules...** 

2. Inside **Main**, call the **AddBoundColumn** method:

		 static function Main()
			   {
					  FiddlerObject.UI.lvSessions.AddBoundColumn("ClientPort", 50, "X-ClientPort");
					  FiddlerObject.UI.lvSessions.AddBoundColumn("SentCookie1", 60, getSentCookie);
					  FiddlerObject.UI.lvSessions.AddBoundColumn("SentCookie2", 60, "@request.Cookie");
					  FiddlerObject.UI.lvSessions.AddBoundColumn("ReturnedCookie", 60, "@response.Set-Cookie");
			   }

			   static function getSentCookie(oS: Session){ if (null != oS.oRequest) return oS.oRequest["Cookie"]; }

 The first parameter is the column name. The second parameter is the default width of the column. The third parameter is either a Fiddler Session Flag string, an @-prefixed-header name, or a JavaScript function that returns a string. 
 
Call the AddBoundColumn method from an IFiddlerExtension
--------------------------------------------------------

Call the **AddBoundColumn** method from an [IFiddlerExtension], passing a **getColumnStringDelegate** as the third parameter.

[1]: ../../images/ConfigureColumns/ReorderColumns.png
[2]: ../../images/ConfigureColumns/ResizeColumns.png
[3]: ../../images/ConfigureColumns/QuickExecCommand.png
[4]: ../../KnowledgeBase/QuickExec.md
