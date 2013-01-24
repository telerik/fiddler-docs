---
title: Using Fiddler as a Reverse Proxy
slug: usingfiddlerasareverseproxy
tags: Proxy
publish: true
---

<!-- http://www.fiddler2.com/Fiddler/help/reverseproxy.asp -->

#Using Fiddler as a Reverse Proxy

##Introduction
Sometimes, you may want to use Fiddler to trap traffic but for some reason you cannot configure the client to use a proxy server. 

Fiddler can operate as a "[reverse proxy](http://en.wikipedia.org/wiki/Reverse_proxy)" which means that it can run on the server and forward inbound requests to a different port or web server.

##Step #0
Before either of the following options will work, you must enable other computers to connect to Fiddler. To do so, click Tools > Fiddler Options > Connections and tick the "Allow remote computers to connect" checkbox. Then close Fiddler.

##Option #1: Configure Fiddler as a Reverse-Proxy
Fiddler can be configured so that any traffic sent to [http://127.0.0.1:8888](http://127.0.0.1:8888/) is automatically sent to a different port on the same machine.  To set this configuration:

1. Start REGEDIT
2. Create a new DWORD named **ReverseProxyForPort** inside **HKCU\SOFTWARE\Microsoft\Fiddler2**.
3. Set the DWORD to the local port you'd like to re-route inbound traffic to (generally port **80** for a standard HTTP server)
4. Restart Fiddler
5. Navigate your browser to [http://127.0.0.1:8888](http://127.0.0.1:8888/)

Note: This method only works if the request's hostname is 127.0.0.1:8888, localhost:8888, [::1]:8888, or the machine's NETBIOS hostname on port 8888. If you need to use a different hostname (e.g. a fully-qualified domain name) use option #2 below.

##Option #2: Write a FiddlerScript rule
Alternatively, you can write a rule that does the same thing.  

Say you're running a website on port 80 of a machine named WEBSERVER.  You're connecting to the website using Internet Explorer Mobile Edition on a Windows SmartPhone device for which you cannot configure the web proxy.  You want to capture the traffic from the phone and the server's response.

1. Start Fiddler on the WEBSERVER machine, running on the default port of 8888.
2. Click Tools | Fiddler Options, and ensure the "Allow remote clients to connect" checkbox is checked.  Restart if needed.
3. Choose Rules | Customize Rules.
4. Inside the **OnBeforeRequest** handler, add a new line of code:

	if (oSession.host.toLowerCase() == "webserver:8888") oSession.host = "webserver:80";
	
5. On the SmartPhone, navigate to [http://webserver:8888](http://webserver:8888)

Requests from the SmartPhone will appear in Fiddler.  The requests are forwarded from port 8888 to port 80 where the webserver is running.  The responses are sent back through Fiddler to the SmartPhone, which has no idea that the content originally came from port 80.

##Question: Can I use Fiddler as a reverse proxy without changing the port that the client application targets?
Yes, although you must reconfigure both your web server software and Fiddler.  First, you must reconfigure your web server to listen on a different port.  For instance, if your web server runs on port 80, you must reconfigure it to run on port 81.  Then, you must reconfigure Fiddler to listen on port 80.  Then, you must select either of the two options described above so Fiddler properly forwards the traffic to the web server which is now running on a different port.