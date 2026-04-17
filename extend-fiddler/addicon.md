---
title: Add an Icon to Your Extension's Tab
meta_title: Add Extension Tab Icon - Fiddler Classic Documentation
description: Learn how to add a custom icon to your Fiddler Classic extension tab by using an existing icon or creating a new one.
slug: AddIcon
publish: true
position: 4
---

# Add an Icon to Your Extension's Tab

## Use an Existing Icon

Set the **.ImageIndex** property as follows:

```c#
public void OnLoad()
{
	oPage = new TabPage("Timeline");
	oPage.ImageIndex = (int)Fiddler.SessionIcons.Timeline;
	oView = new TimelineView();
	oPage.Controls.Add(oView);
	oView.Dock = DockStyle.Fill;
	FiddlerApplication.UI.tabsViews.TabPages.Add(oPage);
}
```

## Add a Custom Image

1. Add the image to **imglSessionIcons**.

2. Set the **.ImageIndex** property as follows:

```c#
public void OnLoad()
{
	oPage = new TabPage("Timeline");
	oPage.ImageIndex = (int)Fiddler.SessionIcons.Timeline;
	oView = new TimelineView();
	oPage.Controls.Add(oView);
	oView.Dock = DockStyle.Fill;
	FiddlerApplication.UI.tabsViews.TabPages.Add(oPage);
}

```