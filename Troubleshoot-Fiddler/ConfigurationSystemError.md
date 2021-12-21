---
title: Configuration system failed to initialize
slug: ConfigurationSystemError
publish: true
position: 4
---

#### Fiddler Classic crashes on startup complaining about the "Configuration System":


		Sorry, you may have found a bug...

		Fiddler has encountered an unexpected problem. If you believe this is a bug in Fiddler, please copy this message by hitting CTRL+C, and submit a bug report using the Help | Send Feedback menu.
		Configuration system failed to initialize
		Source: System.Configuration
		at System.Configuration.ConfigurationManager.PrepareConfigSystem()
		at System.Configuration.ConfigurationManager.GetSection(String sectionName)

		System.Configuration.ConfigurationErrorsException: Unrecognized configuration section system.serviceModel. (c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Config\machine.config line 134)
		or

		System.Configuration.ConfigurationErrorsException: Unrecognized configuration section runtime. (C:\Program Files (x86)\Fiddler2\Fiddler.exe.Config line 2)

This error message indicates that one of the .NET Framework's configuration files is corrupt. The most common fix for this is to visit WindowsUpdate and install all available .NET Framework updates. If that doesn't work, try re-installing the .NET Framework. If that doesn't work, try editing the file specified in the error message to correct whatever the error message is complaining about.
