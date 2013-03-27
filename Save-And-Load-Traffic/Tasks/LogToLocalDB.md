---
title: Log Sessions to Local Database
slug: LogToLocalDB
tags: Save and Load Traffic, Log, SQL, OLEDB
publish: true
ordinal: 4
---

Log Sessions to Local Database
==============================

1. [Add Rules to Fiddler][1] to create a new menu item as follows:

		// Log the currently selected sessions in the list to a database.
		// Note: The DB must already exist and you must have permissions to write to it.
		public static ToolsAction("Log Selected Sessions") 
		function DoLogSessions(oSessions: Fiddler.Session[]){
		if (null == oSessions || oSessions.Length < 1){
		  MessageBox.Show("Please select some sessions first!");
		  return;
		}
		var strMDB = "C:\\log.mdb";
		var cnn = null;
		var sdr = null;
		var cmd = null;
		try
		{
		  cnn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + strMDB);
		  cnn.Open();
		  cmd = new OleDbCommand();
		  cmd.Connection = cnn;

		  for (var x = 0; x < oSessions.Length; x++){
			var strSQL = "INSERT into tblSessions ([ResponseCode],[URL]) Values (" + 
			oSessions[x].responseCode + ", '" + oSessions[x].url + "')";
			cmd.CommandText = strSQL;
			cmd.ExecuteNonQuery();
		  }
		}
		catch (ex){
		  MessageBox.Show(ex);
		}
		finally
		{
		  if (cnn != null ){
			cnn.Close();
		  }
		}
		}

2. List the new import at the top of your rules script as follows:

		import System.Data.OleDb;

* * *

+ **Note**: This example relies upon OLEDB 4.0 which is not available for 64bit processes. Either:

  + Select another data provider (for example, SQLServer); or 
  + [Force Fiddler to run in 32bit mode][2]


+ **Note**: To use the Database Objects in Fiddler 2.3.9 and below:
  1. Click **Tools > Fiddler Options > Extensions > Scripting**.
  2. Add **system.data** to the **References** list.

 In 2.3.9.1 and later, this reference will occur automatically.

[1]: ../../Extend-Fiddler/AddRules
[2]: http://fiddler.wikidot.com/bitness
