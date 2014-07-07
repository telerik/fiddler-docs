---
title: Configure Fiddler to Authenticate to CBT-Protected Server
slug: AuthenticateWithCBT
tags: Configuration, CBT, Channel-binding token, authenticate
publish: true
position: 21
---

Configure Fiddler to Authenticate to CBT-Protected Server
=========================================================

1. Click **Rules > Customize Rules**.

2. Scroll to the **OnPeekAtResponseHeaders** function.

3. Add the following code:

		static function OnPeekAtResponseHeaders(oSession: Session) 
		{         
			// To avoid problems with Channel-Binding-Tokens, this block allows Fiddler 
			// itself to respond to Authentication challenges from HTTPS Intranet sites. 
			if (oSession.isHTTPS && 
				(oSession.responseCode == 401) && 
				// Only permit auto-auth for local apps (e.g. not devices or remote PCs) 
				(oSession.LocalProcessID > 0) && 
				// Only permit auth to sites we trust 
				(Utilities.isPlainHostName(oSession.hostname) 
              // Replace telerik.com with whatever servers Fiddler should release credentials to.
				|| oSession.host.EndsWith("telerik.com"))  
				) 
			{ 
				// To use creds other than your Windows login credentials, 
				// set X-AutoAuth to "domain\\username:password" 
				// Replace default with specific credentials in this format:
              // domain\\username:password. 
				oSession["X-AutoAuth"] = "(default)";    
				oSession["ui-backcolor"] = "pink"; 
			} 

		//... function continues

 + Replace "telerik.com" with whatever servers Fiddler should release credentials to. By default, Fiddler will release credentials to any intranet sites (sites without a dot in the hostname).
 
 + Replace "default" with specific credentials in this format:

		 domain\\username:password

 + If you specify "(default)", Fiddler will attempt to use the login credentials of whatever user-account that it is running under.
