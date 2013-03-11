---
title: No Traffic to Localhost
slug: NoTrafficToLocalhost
tags: Observe Traffic, Troubleshooting, localhost, 127.0.0.1, Web Sessions List
publish: true
ordinal: 2
---

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
