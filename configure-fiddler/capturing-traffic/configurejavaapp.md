---
title: Configure a Java Application to Use Fiddler
page_title: Configuring a Java Application - Fiddler Classic
description: Configure a Java application to route HTTP traffic through the Fiddler Classic proxy.
slug: ConfigureJavaApp
publish: true
position: 8
previous_url: /configure-fiddler/tasks/configurejavaapp
---

# Configure a Java Application to Use Fiddler

To configure a Java application to send web traffic to Fiddler, set the proxy using `jre`:

```bash
jre -DproxySet=true -Dhttp.proxyHost=127.0.0.1 -Dhttp.proxyPort=8888
```

Or:
```bash
jre -DproxySet=true -DproxyHost=127.0.0.1 -DproxyPort=8888 MyApp
```

Or, change the Java Virtual Machine's proxy settings programmatically:

```java
System.setProperty("http.proxyHost", "127.0.0.1");
System.setProperty("https.proxyHost", "127.0.0.1");
System.setProperty("http.proxyPort", "8888");
System.setProperty("https.proxyPort", "8888");
```
		
For the seamless experience in Windows you may consider adding
        	
```java
System.setProperty("javax.net.ssl.trustStoreType","Windows-ROOT");
```

[Learn more about Java proxy settings.](https://java.sun.com/j2se/1.5.0/docs/guide/net/proxies.html)