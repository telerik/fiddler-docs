---
title: Chain to Upstream Proxy
slug: ChainToUpstreamProxy
tags: Configuration, upstream proxy, proxy, upstream, chain
publish: true
ordinal: 12
---

Chain Fiddler to an Upstream Proxy
==================================

To configure Fiddler to send and receive web traffic to and from another proxy between Fiddler and the destination server:

1. Close Fiddler.

2. Open **Internet Explorer** > **Options** > **Internet Options** > **Connections** > **LAN Settings**.

3. Click the check box by **Use a proxy server for your LAN**.

 ![Set proxy address][1]

4. Type the address and port number for the upstream proxy.

5. Restart Fiddler.

You should now see the upstream proxy listed in the Fiddler **About** dialog.

See Also
--------

+ [Understanding the Fiddler Proxy][2]

[1]: ../../images/ChainToUpstreamProxy/SetProxyAddress.jpg
[2]: ../../KnowledgeBase/Proxy
