---
title: FiddlerHook Help
slug: fiddlerhook-help
publish: true
position: 6
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>5.0.20253</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Fiddler Classic </td>
		</tr>
	</tbody>
</table>


## Configure Firefox with FiddlerHook

The **FiddlerHook** Firefox add-on points Firefox at Fiddler, avoiding the need for manual configuration or restarting Firefox.

## Enable FiddlerHook

In most cases, the **FiddlerHook** Firefox add-on should be enabled by default. If not, enable it manually:

1. In Firefox, click **Tools > Add-ons > Extensions**.
2. Next to **FiddlerHook**, click **Enable**.

 ![Enable FiddlerHook](./images/Enable.png)
 
Click **Monitor with Fiddler** on Firefox's **Tools** menu (or in the status bar).  Choose an option to control how Firefox should use Fiddler.  

![FiddlerHookOptions](./images/FiddlerHookOptions.png)  

The option "Force Traffic to Fiddler" will attempt to send traffic to Fiddler Classic regardless of whether or not it's even running. The Use Fiddler Classic Automatically option will emulate IE's behavior: traffic will be sent to Fiddler Classic only when Fiddler Classic is running and is in "capturing" mode.

To add the **Launch Fiddler** button to your toolbar, right-click the Firefox toolbar and choose **Customize.**  

![fiddlerhook-step1](./images/fiddlerhook-step1.png)

In the dialog that appears, drag the Fiddler Classic icon to the toolbar location of your choice.  

![fiddlerhook2](./images/fiddlerhook2.png)

FiddlerHook also introduces a simple way to clear your Firefox cache (memory and disk) and all cookies (persistent and session).  Simply click on the FiddlerHook status bar item and use the menu:  

![FiddlerHookMenu](./images/fhmenu.png)

Removal Instructions
You can use Firefox's Add-on Manager (on the tools menu) to disable the FiddlerHook addon.  If you would like to remove the FiddlerHook add-on altogether, you can simply delete the `%localappdata%\Programs\Fiddler\FiddlerHook` folder.