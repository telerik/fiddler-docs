---
title: AutoResponder Reference
slug: autoresponder-reference
tags: AutoResponder, reference
publish: true
position: 9
---

<!-- http://fiddler2.com/Fiddler2/help/AutoResponder.asp -->

#AutoResponder Reference

Fiddler's AutoResponder tab allows you to return files from your local disk instead of transmitting the request to the server.

##Creating AutoResponder Rules

On the AutoResponder tab, you enter a **match rule** and an **action string**, and Fiddler will undertake the action if the request URI matches the match rule.

###Tips

* Rules are applied in the order that they appear. Hit the **Plus key** to promote a rule to earlier in the list. Hit the **Minus key** to demote a rule to later in the list.
* From the context menu, you can **Export a .FARX** file which contains a list of rules and actions.
* You can also **Import a .SAZ** or **Import a .FARX** file to create rules based on previously captured traffic.
* You can or drag-drop sessions from the **Web Sessions** list to replay previous responses. You can edit a rule's stored response by selecting the rule and hitting Enter.
* You can also drag & drop files from **Windows Explorer** to automatically generate AutoResponder Rules for those files.

##Matching Rules

###String Literals

Fiddler will match string literals (case insensitively)

#### **\*** matches
* **http://www.example.com/Path1/query=example**
* **http://www.example.com/SomethingCompletelyDifferent**

####**EXAMPLE** matches
* http://www.**example**.com/Path1/
* http://www.something.com/Path1/query=**Example**

####**path1/** matches
* http://www.example.com/**Path1/**query=example
* http://www.example.com/returnUrl=**Path1/**OtherPlace

####**query** matches

* http://www.example.com/Path1/q=**Query**
* http://www.example.com/Path1/**query**=hello

###NOT: rules for String Literals

Introduced in version 2.3.2.5 similar to the previous, but the rule is applied only if the string does not match

#### **NOT:EXAMPLE** matches 
* http://www.test.com/Path1/query=test

#### **NOT:path1/** matches
* http://www.example.com/Path2/query=example

#### **NOT:query** matches
* http://www.example.com/Path1/q

###Exact Match

Fiddler supports an exact, case-sensitive match syntax for expressions which begin with exact

####**EXACT:http://www.example.com/path** matches
* http://www.example.com/path

####**EXACT:http://www.example.com/path** matches
* http://www.example.com/Path (No Match - mismatched case)

####**EXACT:http://www.example.com/path** matches
* http://www.example.com/path/q=Query** (No Match - substring different)

###Regular Expressions

Fiddler supports regular expression syntax for expressions which begin with **regex**. The regular expression will be used to replace the inbound URL with the string in the Actions column. Use .+ to match a sequence of one or more characters, or .* to match zero or more characters. Use ^ at the front of your regex to mean "Start of the URL" and use $ at the tail of the regex to mean "End of the URL."

####**regex:.+** matches
* **http://www.example.com/Path1/query=example**

####**regex:.+\.jpg.** matches
* **http://www.example.com/Path1/query=foo.jpg**&bar
* **http://www.example.com/Path1/query=example.jpg**

####**regex:.+\.jpg$** matches
* http://www.example.com/Path1/query=foo.jpg&bar (No Match - improper ending)
* **http://www.example.com/Path1/query=example.jpg**

####**regex:.+\.(jpg|gif|bmp)$** matches 
* http://www.example.com/Path1/query=foo.bmp&bar (No Match  - improper ending)
* **http://www.example.com/Path1/query=example.gif**
* http://www.example.com/Path1/query=example.Gif  (No Match - mismatched case)
* **http://www.example.com/Path1/query=example.bmp**

####**regex:(?insx).+\.(jpg|gif|bmp)$**	matches
* http://www.example.com/Path1/query=foo.bmp&bar (No Match - improper ending)
* **http://www.example.com/Path1/query=example.gif**
* **http://www.example.com/Path1/query=example.Gif**
* **http://www.example.com/Path1/query=example.bmp**
 	
Got a great regular expression to share?  Please send it to me using the "Contact" link at the top-right side of this page!
You can learn more about regular expressions [here](http://www.regular-expressions.info/quickstart.html).

You can specify regular expression options (like case-sensitivity) by leading the expression with an appropriate declaration.  (?insx) works well; it turns on case-insensitivity, requires explicit capture groups, enables single-line syntax, and enables comments after the #character. [Learn more on MSDN](http://msdn.microsoft.com/en-us/library/yd1hzczs(VS.80).aspx).

##Actions

Beyond simply returning files, the AutoResponder can also perform special actions...

###filename	
Return contents of filename as the response.

###http://targetURL	
Return the contents of the targetURL as the response

###*redir:http://targetURL	
Return a HTTP Redirect to the target URL. Unlike the simple URL rule, this ensures that the client knows where its request is going so proper cookies are sent, etc.

###*bpu	
Break on request before hitting server. Non-final action.

###*bpafter	
Send request to server and break on the response. Non-final action.

###*delay:\#\#\#\#	
Delay sending request to the server by #### of milliseconds. Non-final action.

###*header:Name=Value	
Set the Request header with the given Name to the specfied value. If no header of that name exists, a new header will be created. Non-final action.

###*flag:Name=Value	
Set the [Session Flag](./SessionFlags) with the given Name to the specfied value. If no header of that name exists, a new header will be created. Non-final action.

###*CORSPreflightAllow	
Returns a response that indicates that [CORS](http://en.wikipedia.org/wiki/Cross-origin_resource_sharing) is allowed.

###*reset
Reset the client connection immediately using a TCP/IP RST to the client.

###*drop
Close the client connection immediately without sending a response.

###*exit
Stop processing rules at this point. 
	
For rules whose match action is a regular expression, you can use Regular Expression Replacement Group expressions in the Action string to copy content from the Inbound URL to the action string. [Learn more...](http://blogs.msdn.com/b/fiddler/archive/2012/01/09/fiddler-2.3.8.2-beta-views-woff-mp3-h264-datauris-and-autoresponder-supports-regular-expression-groups.aspx)

Rules with Non-final actions will allow the request to match multiple AutoResponder rules. As soon a rule specifying a final action is reached, the matching process exits and no further rules are processed for that session.

##Latency

You can optionally induce a delay (latency) before a response is returned. To enable Latency, click the **Enable Latency** checkbox. Right-click one or more rules and choose **Set Latency** to set the desired number of milliseconds. If you wish to adjust the existing latency, simply type a plus or minus before the number of milliseconds. For instance, to reduce the latency for all of the selected sessions by 5 milliseconds, enter **-5** in the prompt.
