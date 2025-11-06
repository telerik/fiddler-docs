---
title: Capture traffic from another machine
description: "Configure Fiddler Classic to capture traffic from a remote machine - set up reverse proxy or network settings for remote session debugging."
slug: MonitorRemoteMachine
publish: true
position: 11
previous_url: /configure-fiddler/tasks/monitorremotemachine
---

# Capture Traffic from Another Machine (Any OS)

## Set Remote Machine Proxy Settings

1. Start Fiddler Classic on the Fiddler server (the machine that will capture the traffic).

2. Click **Tools > Options**. Ensure **Allow remote clients to connect** is checked. 

 ![Allow remote clients to connect](./images/AllowRemoteComputersToConnect.png)

3. On the other machine, set the proxy settings to the machine name of the Fiddler server at port 8888.

 ![Set proxy address](./images/SetProxyAddress.jpg)

## Decrypt HTTPS traffic from the Remote Machine

Configure the remote machine to [trust the FiddlerRoot certificate](slug://TrustFiddlerRootCert)