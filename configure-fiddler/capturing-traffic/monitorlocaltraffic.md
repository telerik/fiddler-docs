---
title: Monitor traffic to localhost from IE or .NET
description: "Configure Fiddler Classic to capture local machine traffic - manage local proxy rules and network interfaces for loopback debugging."
slug: MonitorLocalTraffic
publish: true
position: 22
---

Monitor traffic to localhost from IE or .NET
============================================

To monitor traffic sent to **http://localhost** or **http://127.0.0.1** from IE8 or below or the .NET Framework:

+ Use your machine name as the hostname instead of **Localhost** or **127.0.0.1**

 For example, instead of 
	
		http://localhost:8081/mytestpage.aspx
 
 Go to: 
 
		http://machinename:8081/mytestpage.aspx

+ Use one of these addresses:

  -To use the IPv4 adapter (recommended for the Visual Studio test webserver, codename: Cassini): 

		http://ipv4.fiddler

  -To use the IPv6 adapter:

		http://ipv6.fiddler

  -To use localhost in the Host header:

		http://localhost.fiddler

+ Click **Rules > Customize Rules...** and add this code to the Rules file:

		static function OnBeforeRequest(oSession:Fiddler.Session){
		if (oSession.HostnameIs("MYAPP")) { oSession.host = "127.0.0.1:8081"; }
		}

  Now, **http://myapp** will act as an alias for **127.0.0.1:8081**

