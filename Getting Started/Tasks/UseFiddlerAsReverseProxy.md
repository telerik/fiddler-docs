---
title: Use Fiddler as a Reverse Proxy
slug: UseFiddlerAsReverseProxy
tags: Configuration, reverse proxy, proxy
publish: true
ordinal: 13
---

Use Fiddler as a Reverse Proxy
==============================

Configure Fiddler as Reverse Proxy
----------------------------------

To use this method, the hostname for the request to reroute must be  **127.0.0.1:8888**, **localhost:8888**, **[::1]:8888**, or the machine's NETBIOS hostname on port **8888**.

1. Click **Tools > Fiddler Options**. Ensure **Allow remote clients to connect** is checked. 

 ![Allow remote clients to connect][1]

2. Close Fiddler.

3. Start **REGEDIT**.

4. Create a new DWORD named ReverseProxyForPort inside HKEY_CURRENT_USER\SOFTWARE\Microsoft\Fiddler2.

5. Set the DWORD to the local port where Fiddler will re-route inbound traffic (generally port 80 for a standard HTTP server).

6. Restart Fiddler.

7. In a browser, go to http://127.0.0.1:8888.

Write a FiddlerScript Rule
--------------------------

1. Click **Tools > Fiddler Options**. Ensure **Allow remote clients to connect** is checked. 

 ![Allow remote clients to connect][1]

2. Click **Tools > Fiddler Options**, and ensure the "Allow remote clients to connect" checkbox is checked. 

3. Restart Fiddler if prompted.

3. Click **Rules > Customize Rules**.

4. Inside the OnBeforeRequest handler*, add a new line of code:

		if (oSession.host.toLowerCase() == "webserver:8888") oSession.host = "webserver:80";

5. Using a browser on the client machine, go to http://webserver:8888.

Configure Fiddler to Listen to Client Application Target Port
-------------------------------------------------------------

1. Reconfigure your target server to listen on a different port. For example, if a web server runs on port 80, reconfigure it to run on port 81.  

2. Click **Tools > Fiddler Options...**.

3. Click **Connections**.

4. Type the client's target port number next to **Fiddler listens to port:**

 ![Fiddler listens to port][2]

5. Configure Fiddler as a reverse proxy or write a FiddlerScript Rule to re-route traffic to the target server's new port (described above).

[1]: ../../images/UseFiddlerAsReverseProxy/AllowRemoteComputersToConnect.png
[2]: ../../images/UseFiddlerAsReverseProxy/FiddlerListensOnPort.png
