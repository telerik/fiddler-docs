---
title: Site on local machine rejects credentials
slug: NoAuthToLocalMachine
publish: true
position: 7
---

Problem: Website running on local machine with Fiddler running rejects credentials
----------------------------------------------------------------------------------

Solution 1:
-----------

[Configure Fiddler to Authenticate to Server][1]

Solution 2: 
-----------

[Create the Local Security Authority host name that can be referenced in an NTLM authentication request][2]

Solution 3:
-----------

[Disable the authentication loopback check][2]

[1]: ../Tasks/AuthenticateWithCBT
[2]: http://support.microsoft.com/kb/926642
