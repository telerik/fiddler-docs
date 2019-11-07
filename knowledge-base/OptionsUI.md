---
title: Options UI
slug: options-ui
tags: help, configuration, menu
publish: true
position: 6
res_type: kb
---

<!-- http://fiddler2.com/Fiddler/help/OptionsUI.asp -->

# Fiddler Options

## General
* **Check for updates on startup** controls whether Fiddler will contact the version-checking web service on startup.
* **Show a message when HTTP protocol violations encountered** controls whether Fiddler notifies you if it observes HTTP protocol violations.
* **Enable IPv6** controls whether or not Fiddler will connect to HTTP servers using IPv6, if available.
* **Map socket to originating process** controls whether Fiddler's session list will show which process generated each HTTP request.
* **Encrypt using AES256** controls whether SAZ files use strong encryption when saved using password protection.
* **Automatically stream audio & video** controls whether Fiddler will use [streaming mode](http://fiddler2.com/Fiddler/help/streaming.asp) when downloading audio and video content-types.
* The **Systemwide Hotkey** checkbox permits you to pick a hotkey which will restore and activate Fiddler when it is inactive or minimized.

## HTTPS
* **Capture HTTPS CONNECTs** controls whether Fiddler will attempt to create tunnels through which secure traffic will flow.
* **Decrypt HTTPS traffic** controls whether Fiddler will [decrypt](http://www.fiddler2.com/redir/?id=HTTPSDECRYPTION) the requests and responses within those secure tunnels.
* **Ignore server certificate errors** controls whether Fiddler will warn you if an HTTPS server has presented a certificate that did not validate.  You should not check this box when surfing the Internet due to the spoofing security threat.
* *Show data from RPASpy controls whether or not Fiddler will show HTTPS headers reported by the deprecated [RPASpy addon.](http://www.fiddler2.com/redir/?id=RPASPY)*

## Extensions
* **Automatically reload script when changed** controls whether or not Fiddler will automatically reload the FiddlerScript rules file when it detects that the file has been changed.
* The **Editor** text box allows you to control which text editor is used to edit the FiddlerScript.  The "..." button will launch a dialog to allow selection of the editor. The [FiddlerScriptEditor](http://fiddler2.com/fiddler/fse.asp) is a popular choice.
* The References text box allows you to specify any additional assemblies that your FiddlerScript depends upon.
* The **Find more extensions** link opens the [Fiddler Add-ons page.](http://www.fiddler2.com/redir/?id=FIDDLEREXTENSIONS)

## Connections
* The **Fiddler listens on port** textbox controls which port Fiddler uses to listen for web traffic.
* The **Copy Browser Proxy Config URL** link copies a proxy-configuration-script link that you can paste into a client's proxy configuration screen. This option is rarely useful, but learn more [here.](../Configure-Fiddler/Tasks/ConfigureBrowsers)
* **Allow remote computers to connect** controls whether or not Fiddler will accept HTTP requests from other computers.
* **Reuse client connections** controls whether Fiddler will reuse HTTP client connections (keep-alive).
* **Reuse connections to servers** controls whether Fiddler will reuse HTTP server connections (keep-alive).
* The **Chain to upstream gateway proxy** controls whether or not Fiddler will use the system proxy as an upstream gateway proxy.

By unchecking this checkbox, you're telling Fiddler *"ignore my browser's normal proxy settings, and just send requests directly to web servers."*

* The **Show Gateway Info** link shows information about any known upstream gateway proxy.
* The **Act as System Proxy on startup** controls whether or not Fiddler registers as the System proxy on startup.  Internet Explorer and many other applications use the system proxy by default and are notified when it changes.  [Learn more...](http://www.fiddler2.com/redir/?id=HOOKUP)
* The **Monitor all connections** checkbox controls whether Fiddler will register as the proxy for all WinINET Connections.
* The **Use PAC Script** checkbox controls how Fiddler registers as the system proxy; specifically, when this box is ticked, Fiddler will tell the browser to use the proxy configuration script (which can be found by clicking the **Copy Browser Proxy Configuration URL** link) instead of using the default proxy configuration of *127.0.0.1:8888.*
* The **WinINET Connections** list shows what network connections are configured for this machine.  This may be useful if you are connected to the Internet via dialup or VPN and want Fiddler to automatically hook a connection other than your LAN connection. [Learn more...](../Configure-Fidder/Tasks/MonitorDialupAndVPN)
* The **IE should bypass Fiddler** list controls which requests should not be sent through Fiddler at all when it is registered as the system proxy.  Note that this list is generally only respected by WinINET clients like Internet Explorer.

## Appearance
* The **Font Size** box allows you to select the font-size Fiddler will use.  A restart is required to fully complete the change.
* The **Set Readonly Color** button allows you to select the background color for text boxes which are in a readonly state. This setting primarily exists because gray is the default for Windows and gray is kinda ugly. A restart is required to complete this change.
* The **Hide Fiddler when minimized** checkbox will show the Fiddler icon in your system tray rather than the task bar when Fiddler is minimized.
* The **Use SmartScroll** option controls whether or not Fiddler will auto-scroll to the bottom of the session list when new sessions are added but you've manually scrolled the list to an earlier session.
* **Reset Session ID counter on CTRL+X** will cause the session id numbering to restart from 0 when the Session list is cleared via Remove > All Sessions, or when you use the CTRL+X hotkey.
