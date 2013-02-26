---
title: Configuring Clients
slug: configuring-clients
tags: Configuration, help
publish: true
---

<!-- http://fiddler2.com/Fiddler/help/hookup.asp -->

#Configuring clients

[Monitor RAS, VPN, or dialup connections?](http://fiddler2.com/Fiddler/help/hookup.asp#Q-VPN)

[Configure an application to use Fiddler?](http://fiddler2.com/Fiddler/help/hookup.asp#Q-ConfigureApp)
[Debug traffic from another machine or device, like a Unix box?](http://fiddler2.com/Fiddler/help/hookup.asp#Q-NonWindows)
[Configure other browsers to use Fiddler?](http://fiddler2.com/Fiddler/help/hookup.asp#Q-NonIE)
[Configure IEMobile on PocketPC to use Fiddler?](http://fiddler2.com/Fiddler/help/hookup.asp#Q-IEMobile)
[Configure Android Emulator to use Fiddler?](http://fiddler2.com/Fiddler/help/hookup.asp#Q-Android)
[Configure Google Nexus 7 (Android) to use Fiddler?](http://fiddler2.com/Fiddler/help/hookup.asp#Q-Nexus7)
[Configure Windows Phone 7 to use Fiddler?](http://fiddler2.com/Fiddler/help/hookup.asp#Q-WinPhone)
[Configure a WinHTTP application to use Fiddler?](http://fiddler2.com/Fiddler/help/hookup.asp#Q-WinHTTP)

[Capture traffic from a different account, like ASP.NET on IIS or from a Windows Service?](http://fiddler2.com/Fiddler/help/hookup.asp#Q-IIS)

[Configure a .NET application to use Fiddler?](http://fiddler2.com/Fiddler/help/hookup.asp#Q-DOTNET)
[Configure a PHP/CURL application to use Fiddler?](http://fiddler2.com/Fiddler/help/hookup.asp#Q-PHP)
[Configure a Java application to use Fiddler?](http://fiddler2.com/Fiddler/help/hookup.asp#Q-JavaTraffic)

[Why don't I see traffic sent to http://localhost or http://127.0.0.1?](http://fiddler2.com/Fiddler/help/hookup.asp#Q-LocalTraffic)

[Can Fiddler "chain" to an upstream proxy?](http://fiddler2.com/Fiddler/help/hookup.asp#Q-AutoChain)

##Configure an application to use Fiddler
Fiddler is an HTTP Proxy running on port 8888 on your local PC.  You can configure any application which accepts a HTTP Proxy to run through Fiddler so you can debug its traffic.

WinINET-based applications (E.g. Microsoft Office, Internet Explorer, etc) should automatically use Fiddler while it's running and the "Capture Traffic" box is checked on the Fiddler File menu.

If they do not, they can be configured to use Fiddler by setting the appropriate option in the Internet Explorer **Tools | Internet Options | Connections | LAN Settings** dialog.  (You can also get to this dialog in the **Tools | Internet Options** menu inside Fiddler). 

###Monitor RAS, VPN, or dialup connections
Fiddler 2.2.0.3 and later introduces a new option which enables automatic monitoring of dialup or VPN connections:

![MonitorAllConns](images/monitorAllConns.png)

Otherwise, you'll need to set the Proxy Configuration manually. Set the proxy for your VPN/dialup connection as follows: 



Alternatively, you can set the "Use automatic configuration script" option as described in the "Other browsers" tip below.

Note: If you *always* have an active VPN or dialup connection, set the **HookConnectionNamed** registry value to the name of the Connection (e.g. "Dial-up Connection" in the above screenshot).  When you do this, Fiddler will hook this connection instead of the LAN connection.

![hookconn](images/hookconn.png)

Note: IE will always use the proxy settings from any active VPN connection, without regard to whether or not that VPN connects to the Internet. 

###Configure a .NET application to use Fiddler?
If you're coding a .NET application, [K Scott Allen's blog](http://odetocode.com/Blogs/scott/archive/2004/06/29/290.aspx?Pending=true) shows a simple way to hook Fiddler temporarily for debugging purposes:

	GlobalProxySelection.Select = new WebProxy("127.0.0.1", 8888);

Note that you might not even need to do this-- The Framework should autodetect the WinINET proxy when the .NET application starts.  Note that this means that Fiddler must be started BEFORE your application if your application is to autodetect Fiddler.

You may specify a proxy inside the yourappname.exe.config file. If the .NET application is running in your current user account, you can simply add the following content inside the configuration section:

	<configuration>
	  <system.net>
		<defaultProxy>
		  <proxy bypassonlocal="false" usesystemdefault="true" />
		</defaultProxy>
	  </system.net>
	</configuration>

See [http://msdn.microsoft.com/en-us/magazine/cc300743.aspx](http://msdn.microsoft.com/en-us/magazine/cc300743.aspx) for more on this topic.

If you need to get code running in a different user-account (e.g. a Windows Service) to send traffic to Fiddler, you will need to edit the configuration inside the machine.config.

	<!-- The following section is to force use of Fiddler for all applications, including those running in service accounts -->  <system.net>
	  <defaultProxy>
		<proxy autoDetect="false" bypassonlocal="false" proxyaddress="http://127.0.0.1:8888" usesystemdefault="false" />
	  </defaultProxy>
	</system.net>

If all else fails, you can manually specify the proxy on an individual WebRequest object, like so:

	objRequest = (HttpWebRequest)WebRequest.Create(url);
	objRequest.Proxy= new WebProxy("127.0.0.1", 8888);

**Important:** Regardless of other settings, .NET will always bypass the Fiddler proxy for URLs containing *localhost*.  So, rather than using localhost, change your code to refer to the machine name.  For instance:

	Does not show in Fiddler: http://localhost/X509SignCodeService/X509SigningService.asmx
	Shows in Fiddler: http://mymachine/X509SignCodeService/X509SigningService.asmx

###Configure a PHP/CURL application to use Fiddler?
Add the following line of code before you send your requests, where $ch is the handle returned by curl_init():

	curl_setopt($ch, CURLOPT_PROXY, '127.0.0.1:8888');

From the command line:

	curl --proxy 127.0.0.1:8888

###Configure a Java application to use Fiddler?
Per [http://www.davidreilly.com/java/java_network_programming/#2.4](http://www.davidreilly.com/java/java_network_programming/#2.4) you should be able to do something like:

	jre -DproxySet=true -DproxyHost=127.0.0.1 -DproxyPort=8888 MyApp

But, per [http://stackoverflow.com/questions/120797/how-do-i-set-the-proxy-to-be-used-by-the-jvm](http://stackoverflow.com/questions/120797/how-do-i-set-the-proxy-to-be-used-by-the-jvm), you instead need to use:

	jre -DproxySet=true -Dhttp.proxyHost=127.0.0.1 -Dhttp.proxyPort=8888

You can also change the VM's proxy settings programmatically:

	System.setProperty("http.proxyHost", "127.0.0.1");
	System.setProperty("https.proxyHost", "127.0.0.1");
	System.setProperty("http.proxyPort", "8888");
	System.setProperty("https.proxyPort", "8888");

You can learn more here: [http://java.sun.com/j2se/1.5.0/docs/guide/net/proxies.html](http://java.sun.com/j2se/1.5.0/docs/guide/net/proxies.html). 

###Why don't I see traffic sent to http://localhost or http://127.0.0.1?
Internet Explorer and the .NET Framework are hardcoded not to send requests for Localhost through any proxies, and as a proxy, Fiddler will not receive such traffic.

**Note:** This behavior was [changed for Internet Explorer 9](http://blogs.msdn.com/b/fiddler/archive/2011/02/10/fiddler-is-better-with-internet-explorer-9.aspx) in the Release Candidate build. IE9 RC allows Fiddler to proxy traffic sent to localhost or 127.0.0.1 without additional steps on your part.

The simplest workaround is to use your machine name as the hostname instead of Localhost or 127.0.0.1. So, for instance, rather than hitting http://**localhost**:8081/mytestpage.aspx, instead visit http://**machinename**:8081/mytestpage.aspx. 

...Or, just use **http://ipv4.fiddler** to hit localhost on the IPv4 adapter. This works especially well with the Visual Studio test webserver (codename: Cassini) because the test server only listens on the IPv4 loopback adapter. Use **http://ipv6.fiddler** to hit localhost on the IPv6 adapter, or use **http://localhost.fiddler** to hit localhost using "localhost" in the Host header. This last option should work best with IIS Express.

Lastly, you could update your Rules file like so:

	static function OnBeforeRequest(oSession:Fiddler.Session){
		if (oSession.HostnameIs("MYAPP")) { oSession.host = "127.0.0.1:8081"; }
	}

...and then just hit http://myapp, which will act as an alias for 127.0.0.1:8081.

**Note:** You shouldn't ever encounter the "Localhost traffic not captured" problem with Firefox. The FiddlerHook add-on for Firefox removes "localhost" from the "bypass proxy" list when Fiddler is in "Capturing" mode.

###Configure a WinHTTP application to use Fiddler?
You can either directly configure the WinHTTP application to point to Fiddler, in code, or you can use the following command at the command prompt to tell WinHTTP to use Fiddler:

**On XP or below:**

	proxycfg -p http=127.0.0.1:8888;https=127.0.0.1:8888

...or this one to force WinHTTP to use WinINET's proxy settings:

	proxycfg -u

**On Vista or above, use an Elevated (admin) command prompt:**

	netsh winhttp set proxy 127.0.0.1:8888

**Note:** On Windows 7 and earlier, netsh is bitness specific, so you may want to run the above command twice: first using the 32bit NETSH and then using the 64bit NETSH. This blog has more information. This issue was fixed in Windows 8; you can call either NetSh just once to set the proxy for both 32bit and 64bit WinHTTP hosts.

###Capture traffic from a different account, like ASP.NET on IIS or from a Windows Service?
Trying to capture SOAP calls coming from ASP.NET or some background service process?

 By default, Fiddler registers as the proxy only for the current user account (ASP.NET runs in a different user account). To get a background process (like the ASP.NET or IIS process) to use Fiddler, you must configure that process to use Fiddler.

Typically, this is done by editing web.config or machine.config for the ASP.NET installation, or the configuration for the code running within the Windows Service.

Please see [http://msdn.microsoft.com/en-us/magazine/cc300743.aspx#S4](http://msdn.microsoft.com/en-us/magazine/cc300743.aspx#S4) or the section on [.NET](http://fiddler2.com/Fiddler/help/hookup.asp#Q-DOTNET) or [WinHTTP](http://fiddler2.com/Fiddler/help/hookup.asp#Q-WinHTTP), depending on which network stack the service is using.


###Configure Windows Phone 7 to use Fiddler?
Please see [this](http://blogs.msdn.com/b/fiddler/archive/2011/01/09/debugging-windows-phone-7-device-traffic-with-fiddler.aspx) for actual device hardware, or [this](http://blogs.msdn.com/b/fiddler/archive/2010/10/15/fiddler-and-the-windows-phone-emulator.aspx) for the emulator.

###Configure Google Nexus 7 (Andoid 4.1 Jellybean) to use Fiddler?
Please see [this page](http://fiddler2.com/Fiddler/help/AndroidNexus7.asp).

###Configure Android Emulator to use Fiddler?
Please see [this](http://aurirahimzadeh.spaces.live.com/blog/cns!F5CF78DEA3328162!3717.entry). I've heard rumors that the Android emulator was broken at some point, I'm afraid I don't have details and you'll need to talk to Google about it.

###Configure IEMobile on PocketPC to use Fiddler
Yes.  This works over desktop-passthrough (ActiveSync connection).

1. On the device, set the HTTP proxy to be **ppp_peer:8888**
2. On your desktop, open port 8888 in Windows Firewall (Control Panel) 
3. ActiveSync->Connection Settings... This Computer is connected to: **Work Network** (Automatic will clobber the setting you did from #1) 
4. Start Fiddler as you normally would 
5. Tools->Fiddler Options... check "Allow remote clients to connect" (Restart Fiddler)
6. Connect your device to ActiveSync, fire up IEMobile and browse away...

###Debug traffic on a Mac
This topic, including screenshots, is covered in the [Fiddler Book](http://fiddler2.com/Fiddler/help/AndroidNexus7.asp).

As a Windows Application, Fiddler cannot run on Mac OSX natively.

However, virtualization products like VMWare Fusion or Parallels Desktop permit you to run Windows applications like Fiddler in a virtual machine on your Mac.

To run Fiddler under **Parallels**, only minor configuration changes are needed. Install **Parallels** and reconfigure the Windows Virtual Machine's **Hardware > Network** 1 Type setting to use **Bridged Network** mode.

This configuration will enable your Mac to send network traffic into the Virtual Machine. Restart the Virtual Machine and install Fiddler. To configure Fiddler, click ***Tools > Fiddler Options > Connections** and check the box labeled **Allow remote computers to connect**. You will need to restart Fiddler for the change to take effect, and you may need to reconfigure your firewall to allow incoming connections to the Fiddler process. These steps allow Fiddler to accept connections from the Mac environment. Now, you must manually configure your Mac to direct its web traffic through Fiddler running in your Virtual Machine.

First, you must learn the IP address of the virtual machine. To do so, hover over the Online indicator at the far right of the Fiddler toolbar. A tooltip will show you the IP addresses assigned to the virtual machine.

Next, click the **Apple Menu** and click **System Preferences**. Click the **Network** icon and click the **Advanced** button. Click the Proxies tab. Enable the **Web Proxy (HTTP)** and **Secure Web Proxy (HTTPS)** options to point to the IPv4 address of the virtual machine; also specify that the proxy runs on port **8888**.

After configuring the Mac's proxy, Fiddler will begin capturing traffic from Safari and other applications. When you're done using Fiddler, return to the **OSX System Preferences** and disable the proxy settings.

###Debug traffic from another machine (even a device or Unix box)
You can capture traffic from any machine that supports a proxy, even if that machine isn't running Windows.  

1. Start Fiddler on a Windows machine named, for example, **WINBOX1**.
2. In Fiddler, click to make sure Tools / Fiddler Options / Allow remote clients to connect is checked. 
(Restart Fiddler if this box wasn't already checked.)
3. On the other machine (Mac/Unix/Windows) set the proxy settings to **WINBOX1:8888**.

![remdbg](images/remdbg.jpg)


The second machine will now send its traffic through Fiddler running on WINBOX1. 

If you want to decrypt HTTPS traffic, you may need to [configure that second machine to trust the FiddlerRoot certificate](http://fiddler2.com/Fiddler/help/httpsdecryption.asp#crossmachine).

###Configure other browsers to use Fiddler
Fiddler is compatible with **all** known web browsers.

Current versions of Internet Explorer, Google Chrome, Apple Safari, and Opera all automatically use Fiddler when Fiddler is configured to Capture Traffic.  (Opera requires that you start Fiddler **before** starting Opera).

Firefox is the only browser which does not use the System Proxy settings by default, and requires a little bit of extra configuration. Firefox 4+ can be configured to use the system proxy. In Firefox, click **Tools > Options > Advanced > Network > Settings > Use System Proxy Settings** (alternatively, see [FiddlerHook Help](http://fiddler2.com/Fiddler2/addons/fiddlerhook/).) Firefox is also one of only a handful of browsers that does not respect the Windows Certificate list. See this page for help on getting Firefox to trust Fiddler's HTTPS certificate.

###Manual Configuration

Every browser allows you to connect a proxy server; usually this is the Options (or Preferences) menu.  You can either point directly at Fiddler (address: 127.0.0.1, port: 8888), or you can use Proxy Auto-configuration. The advantage of auto-configuration is that Fiddler rewrites the configuration script when it is attached and detached, meaning you shouldn't need to manually enable or disable the proxy in your client depending on whether or not Fiddler is loaded.  Simply restart the browser and the new setting is detected.

For instance, if you don't want to let [FiddlerHook](http://fiddler2.com/Fiddler2/addons/fiddlerhook/) do the job for you, you can manually configure Firefox to point at Fiddler. In Firefox, click **Tools > Options > Advanced > Network > Settings**, and adjust the settings like so:

![ffAutoconfig](images/ffAutoconfig.jpg)

You can get the correct auto-configuration URL from Fiddler by clicking Tools / Fiddler Options / Connections, and clicking the "Copy Browser Proxy Configuration URL" link.


![fidoptscopyurl](images/fidoptscopyurl.jpg)
 

###Can Fiddler "chain" to an upstream proxy?
Yes, all current versions of Fiddler support chaining to upstream proxies (either autodetected or manually specified).

So, you end up with an architecture like so: 

![fiddlerplusproxy](images/fiddlerplusproxy.gif)

Note that Fiddler does not support upstream proxy configuration scripts that are accessed using the FILE:// protocol, only those accessed using the HTTP or HTTPS protocols (so far, no one seems to have hit this limitation in the last 6 years).

To see what proxy Fiddler will chain to by default:

####1. Close Fiddler.
####2. Inside IE, choose Tools | Internet Options | Connections.
####3. Click the "LAN Settings" button.
####4. On the dialog, examine the options: 
![ieupstreamproxy](images/ieupstreamproxy.jpg)
####5. After you restart Fiddler, choose Help | About Fiddler. 
####6. You should see the upstream proxy listed in the About box.