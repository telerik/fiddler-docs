---
title: No Traffic to Localhost
slug: NoTrafficToLocalhost
tags: Observe Traffic, Troubleshooting, localhost, 127.0.0.1, Web Sessions List
publish: true
position: 2
---

# Problem: Traffic sent to localhost or 127.0.0.1 is not captured

Internet Explorer and the .NET Framework are hardcoded not to send requests for Localhost through any proxies, and as a proxy, Fiddler Classic will not receive such traffic.

+ This behavior was [changed for Internet Explorer 9](https://blogs.msdn.com/b/fiddler/archive/2011/02/10/fiddler-is-better-with-internet-explorer-9.aspx) in the Release Candidate build. IE9 RC allows Fiddler Classic to proxy traffic sent to localhost or 127.0.0.1 without additional steps on your part.

+ You should never encounter the "Localhost traffic not captured" problem with Firefox. The FiddlerHook add-on for Firefox removes "localhost" from the "bypass proxy" list when Fiddler Classic is in "Capturing" mode.

## Solution 1: Use Machine Name or Hostname

The simplest workaround is to use your machine name as the hostname instead of **Localhost** or **127.0.0.1**. For example, rather than hitting:

```sh
http://localhost:8081/mytestpage.aspx
```
	
Instead visit:

```sh
http://machinename:8081/mytestpage.aspx
```

## Solution 2: Use http://ipv4.fiddler

Use `http://ipv4.fiddler` to hit localhost on the IPv4 adapter. This works especially well with the Visual Studio test webserver (codename: Cassini) because the test server only listens on the IPv4 loopback adapter. Use `http://ipv6.fiddler` to hit localhost on the IPv6 adapter, or use `http://localhost.fiddler` to hit localhost using `localhost` in the Host header. This last option should work best with IIS Express.

## Solution 3: Updated Rules File

1. Update your Rules file as follows:

```c#
static function OnBeforeRequest(oSession:Fiddler.Session){
	if (oSession.HostnameIs("MYAPP")) { oSession.host = "127.0.0.1:8081"; }
}
```

2. Make requests for `http://myapp`, which will act as an alias for `127.0.0.1:8081`.

## See Also

+ [Monitor Traffic to Localhost](slug://MonitorLocalTraffic)