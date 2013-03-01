---
title: Capture traffic from another machine
slug: MonitorRemoteMachine
tags: Configuration, Capture, Remote, Unix
publish: true
---

Capture Traffic from Another Machine (Any OS)
=============================================

Set Remote Machine Proxy Settings
---------------------------------

1. Start Fiddler on Fiddler server (the machine that will capture the traffic).

2. Click **Tools > Fiddler Options**. Ensure **Allow remote clients to connect** is checked. 

 ![Allow remote clients to connect][1]

3. On the other machine, set the proxy settings to the machine name of the Fiddler server at port 8888.

 ![Set proxy address][2]

Decrypt HTTPS traffic from the Remote Machine
---------------------------------------------

Configure the remote machine to [trust the FiddlerRoot certificate][3].

 
[1]: ../../images/MonitorRemoteMachine/AllowRemoteComputersToConnect.png
[2]: ../../images/MonitorRemoteMachine/SetProxyAddress.jpg
[3]: ./TrustFiddlerRootCert.md
