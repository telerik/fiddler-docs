---
title: Configure Columns
slug: ConfigureColumns
publish: true
position: 9
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

+ Use the **Customize Columns** menu.

 1. Right-click the top of a column and select **Customize Columns...**.

 ![Column Header Context Menu][6]
 
 2. Click the **Collection** drop-down menu and select the collection that will populate the column.
 
 ![Customize Columns Window][7]

 3. Enter the name of the collection member that will populate the column and the title of the column.

+ **Use QuickExec to add a temporary column**


 Type this command in the QuickExec box:

		cols add [Title] FlagName 

  ![QuickExec Command][3]

 Columns added using QuickExec will be removed the next time Fiddler starts. For more QuickExec column commands, see the [QuickExec Reference][4].

+ [Customize rules with FiddlerScript][5]


+ **Call the AddBoundColumn method from an IFiddlerExtension**


 Call the **AddBoundColumn** method from an [IFiddlerExtension], passing a **getColumnStringDelegate** as the third parameter.

[1]: ../../images/ConfigureColumns/ReorderColumns.png
[2]: ../../images/ConfigureColumns/ResizeColumns.png
[3]: ../../images/ConfigureColumns/QuickExecCommand.png
[4]: ../../KnowledgeBase/QuickExec
[5]: ../../KnowledgeBase/FiddlerScript/AddColumns
[6]: ../../images/ConfigureColumns/ColumnsContextMenu.png
[7]: ../../images/ConfigureColumns/CollectionDropDown.png
