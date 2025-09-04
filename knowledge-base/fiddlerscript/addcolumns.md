---
title: Add Columns to Web Sessions List
description: "Learn how to add custom columns in Fiddler Classic sessions grid via FiddlerScript - enhance session analysis with tailored metadata."
slug: AddColumns
publish: true
res_type: kb
position: 7
---

Add Columns to the Web Sessions List
====================================

To add custom columns to the **Web Sessions List**, [add rules][1] using FiddlerScript. 

The BindUIColumn Attribute
--------------------------

To fill a custom column, add a method labeled with the **BindUIColumn** attribute. Fiddler Classic will run the method on each session to fill the custom column.  (To avoid exceptions, be sure that your method is robust and checks to ensure that objects exist before use!) For example:



**Fill custom column with session HTTP Method**

		public static BindUIColumn("HTTPMethod")
			   function CalcMethodCol(oS: Session){
					  if (null != oS.oRequest) return oS.oRequest.headers.HTTPMethod; else return String.Empty; 
			   }


**Fill custom column with time taken for session**

		public static BindUIColumn("Time Taken")
			   function CalcTimingCol(oS: Session){
				 var sResult = String.Empty;
				 if ((oS.Timers.ServerDoneResponse > oS.Timers.ClientDoneRequest))
				 {
				   sResult = (oS.Timers.ServerDoneResponse - oS.Timers.ClientDoneRequest).ToString();
				 }
				 return sResult;
			   }



There are four overloads for BindUIColumn that allow you to set the width, display order, and whether the column should be sorted numerically.

	BindUIColumn(string colName)

	BindUIColumn(string colName, bool bSortColumnNumerically)

	public BindUIColumn(string colName, int iColWidth)

	public BindUIColumn(string colName, int iColWidth, int iDisplayOrder)

The AddBoundColumn method
-------------------------

Alternatively, you can call the **AddBoundColumn()** method.  The first parameter is the name with which the column should be named, and the second parameter is the default width of the column. The third parameter is either a Fiddler Classic Session Flag string, an @-prefixed-header name, or a JavaScript function that returns a string. 

		static function Main()
		{
				FiddlerObject.UI.lvSessions.AddBoundColumn("ClientPort", 50, "X-ClientPort");
				FiddlerObject.UI.lvSessions.AddBoundColumn("SentCookie1", 60, getSentCookie);
				FiddlerObject.UI.lvSessions.AddBoundColumn("SentCookie2", 60, "@request.Cookie");
				FiddlerObject.UI.lvSessions.AddBoundColumn("ReturnedCookie", 60, "@response.Set-Cookie");
		}

		static function getSentCookie(oS: Session){ if (null != oS.oRequest) return oS.oRequest["Cookie"]; }
		
[1]: ../../Extend-Fiddler/AddRules
