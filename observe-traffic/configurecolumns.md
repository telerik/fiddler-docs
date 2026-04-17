---
title: Configure Columns
page_title: Configuring Session List Columns - Fiddler Classic
description: Rearrange, add, and customize columns in the Fiddler Classic Web Sessions list.
slug: ConfigureColumns
publish: true
position: 9
previous_url: /observe-traffic/tasks/configurecolumns
---

# Configure Columns

## Rearrange Columns

* To reorder the columns, drag a column header to the left or the right. 
 ![Reorder Columns](./images/ReorderColumns.png)
* To resize a column, drag the edge of a column header.
 ![Resize Columns](./images/ResizeColumns.png)

## Add Custom Columns

Use on of these methods:

* Use the **Customize Columns** menu.
    1. Right-click the top of a column and select **Customize Columns...**.
    ![Column Header Context Menu](./images/ColumnsContextMenu.png)
    2. Click the **Collection** drop-down menu and select the collection that populates the column.
    ![Customize Columns Window](./images/CollectionDropDown.png)
    3. Enter the name of the collection member that populates the column and the title of the column.
* **Use QuickExec to add a temporary column**
    ```txt
    cols add [Title] FlagName 
    ```
  ![QuickExec Command](./images/QuickExecCommand.png)
Columns added using QuickExec are removed the next time Fiddler Classic starts. For more QuickExec column commands, see the [QuickExec Reference](slug://QuickExec).
* [Customize rules with FiddlerScript](slug://AddColumns)
* **Call the `AddBoundColumn` method from an `IFiddlerExtension`**
    Call the `AddBoundColumn` method from an [`IFiddlerExtension`], passing a `getColumnStringDelegate` as the third parameter.