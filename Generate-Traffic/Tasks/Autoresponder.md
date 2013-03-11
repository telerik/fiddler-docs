---
title: Create traffic with matching rules
slug: Autoresponder.md
tags: Generate Traffic, Autoresponder, regex, string literals, regular expressions
publish: true
ordinal: 2
---



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
 	
You can learn more about regular expressions [here](http://www.regular-expressions.info/quickstart.html).

You can specify regular expression options (like case-sensitivity) by leading the expression with an appropriate declaration.  (?insx) works well; it turns on case-insensitivity, requires explicit capture groups, enables single-line syntax, and enables comments after the #character. [Learn more on MSDN](http://msdn.microsoft.com/en-us/library/yd1hzczs(VS.80).aspx).

 To enable Latency, click the **Enable Latency** checkbox. Right-click one or more rules and choose **Set Latency** to set the desired number of milliseconds. If you wish to adjust the existing latency, simply type a plus or minus before the number of milliseconds. For instance, to reduce the latency for all of the selected sessions by 5 milliseconds, enter **-5** in the prompt.
