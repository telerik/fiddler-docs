---
title: Chain to Upstream Proxy
description: Configure Fiddler Classic to send and receive web traffic to and from another proxy between Fiddler Classic and the destination serve
slug: ChainToUpstreamProxy
publish: true
position: 12
previous_url: /tasks/chaintoupstreamproxy
---

# Chain Fiddler Classic to an Upstream Proxy

To configure Fiddler Classic to send and receive web traffic to and from another proxy between Fiddler Classic and the destination server:

1. Close Fiddler Classic application.
2. Open **Internet Explorer** > **Options** > **Internet Options** > **Connections** > **LAN Settings**.
3. Click the check box by **Use a proxy server for your LAN**.
 ![Set proxy address](./images/SetProxyAddress.jpg)
4. Type the address and port number for the upstream proxy.
5. Restart Fiddler Classic application.

You should now see the upstream proxy listed in the Fiddler Classic **About** dialog.
