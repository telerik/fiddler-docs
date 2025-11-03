---
title: Log Sessions to Local Database
slug: LogToLocalDB
publish: true
position: 4
previous_url: /save-and-load-traffic/tasks/logtolocaldb
---

# Log Sessions to Local Database


1. [Add Rules to Fiddler](slug://AddRules) to create a new menu item as follows:
```c#

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
```

2. List the new import at the top of your rules script as follows:

```c#
import System.Data.OleDb;
```