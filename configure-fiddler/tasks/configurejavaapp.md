---
title: Configure a Java application
description: Configure a Java Application alongside Fiddler Classic proxy
slug: ConfigureJavaApp
publish: true
position: 8
---

Configure a Java Application to Use Fiddler
===========================================

To configure a Java application to send web traffic to Fiddler, set the proxy using **jre**:

		jre -DproxySet=true -Dhttp.proxyHost=127.0.0.1 -Dhttp.proxyPort=8888

Or:

		jre -DproxySet=true -DproxyHost=127.0.0.1 -DproxyPort=8888 MyApp

Or, change the Java Virtual Machine's proxy settings programmatically:

		System.setProperty("http.proxyHost", "127.0.0.1");
		System.setProperty("https.proxyHost", "127.0.0.1");
		System.setProperty("http.proxyPort", "8888");
		System.setProperty("https.proxyPort", "8888");
		
For the seamless experience in Windows you may consider adding
        	
		System.setProperty("javax.net.ssl.trustStoreType","Windows-ROOT");

[Learn more about Java proxy settings.][1]

[1]: http://java.sun.com/j2se/1.5.0/docs/guide/net/proxies.html 
