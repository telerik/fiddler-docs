---
title: QuickExec Reference
slug: QuickExec
tags: Knowledge Base, Search and filter sessions, find session, session list, HTTP session, https session, ftp session, requests, responses, QuickExec, FiddlerScript, breakpoint, highlight
publish: true
ordinal: 1
---

Using QuickExec
===============

Fiddler's QuickExec box allows you to launch script-commands quickly.

 ![QuickExec Box][1]
Keyboard Shortcuts
------------------

+ Hit ALT+Q to quickly set focus to the QuickExec box.  If Fiddler isn't active, hit CTRL+ALT+F first to activate Fiddler.
+ In the QuickExec box, hit CTRL+I to insert the URL of the currently selected session in the session list.







Default commands
----------------

* * *
		
**?sometext**	

As you type sometext, Fiddler will highlight sessions where the URL contains sometext.  Hit Enter to set focus to the selected matches.	

	?searchtext

* * *

**>size**	

Select sessions where response size is greater than size bytes.	

	>40000 <-- Select responses over 40kb

* * *

	<size	

Select sessions where response size is less than size bytes.	

	<5k <-- Select responses under 5kb

* * *

**=status**

**=method**	

Select sessions where response status = status or request method = method.	

	=301 <-- Select 301 redirect responses
	=POST <-- Select POST requests

* * *

**@host**

Select sessions where the request host contains host.  Hit Enter to set focus to the selected matches.	

	@msn.com <-- Select www.msn.com, login.msn.com, etc

* * *

**bold**	

Mark any future sessions in bold if the url contains the target string	

	bold /bar.aspx
	bold        <-- Call with no parameter to clear

* * *

**bpafter**	

Break any response where the RequestURI contains the specified string	

	bpafter /favicon.ico 
	bpafter        <-- Call with no parameter to clear

* * *

**bps**	

Break any response where the status code matches	

	bps 404
	bps        <-- Call with no parameter to clear

* * *

**bpv** or **bpm**

Create a request breakpoint for the specified HTTP method.  Setting this command will clear any previous value for the command; calling it with no parameter will disable the breakpoint.	

	bpv POST
	bpv        <-- Call with no parameter to clear

* * *

**bpu**	

Create a request breakpoint for URIs containing the specified string.  Setting this command will clear any previous value for the command; calling it with no parameter will disable the breakpoint.	

	bpu /myservice.asmx
	bpu        <-- Call with no parameter to clear

* * *

**cls** or **clear**	

clear the session list	

	cls

* * *

**dump**	

dump all sessions to a zip archive in C:\	

	dump

* * *

**g** or **go**	

Resume all breakpointed sessions	

	g

* * *

**help**	

Show this page	

	help

* * *

**hide**	Hide Fiddler in System tray	

	hide

* * *

**urlreplace**	

Replace any string in URLs with a different string.  Setting this command will clear any previous value for the command; calling it with no parameter will cancel the replacement.	

	urlreplace SeekStr ReplaceWithStr
	urlreplace        <-- Call with no parameters to clear

* * *

**start**	

Register as the system proxy	

	start

* * *

**stop**	

Unregister as the system proxy	

	stop

* * *

**show**	

Restore Fiddler from system tray -- more useful when triggering rules from ExecAction.exe (see below)	

	show

* * *

**select *MIME***	

Select any session where the response Content-Type header contains the specified string.	

	select image
	select css
	select htm

* * *

**select *HeaderOrFlag PartialValue***

Select any session where the named Header or SessionFlag contains the specified string.	

	select ui-comments slow
	select ui-bold *     <-- unless preceded by a slash, * means any value
	select ui-comments \*     <-- Find comments with a *
	select @Request.Accept html     <-- Find requests with Accept: html
	select @Response.Set-Cookie domain <- Find responses that Set-Cookie on a domain

* * *

**allbut** or **keeponly**	

Hide all sessions except those where Content-Type header contains the specified string.	

	allbut xml
	allbut java

* * *

**quit**	

Shutdown Fiddler.	

	quit

* * *

**!dns hostname**

Perform a DNS lookup of the target host and show the results on the LOG tab	

	!dns www.example.com
	!nslookup www.example.com

* * *

**!listen *PORT [CERTHOSTNAME]***	

Set up an additional listener on another port, optionally secured by a HTTPS certificate	

	!listen 8889
	!listen 4443 localhost
	!listen 444 secure.example.com

* * *

[1]: ../images/QuickExecReference/QuickExecBox.png
