<!-- http://fiddler2.com/Fiddler2/help/Filters.asp -->

#Filters Reference

Fiddler's **Filters** tab allows you to easily filter and flag traffic displayed in the Fiddler UI, as well as perform some lightweight modifications.

###Hosts

The **Zone Filter** dropdown at the top of the dialog allows you to show traffic only to your Intranet (e.g. dotless hostnames) or only to the Internet (e.g. dotted hostnames). This is a useful option when debugging a site in one zone while referencing web-based documentation from the other zone.

The **Host Filter** dropdown enables you to flag or exclude display of traffic to specified domain names. Note, if you put, e.g. **fiddler2.com** in the list, you *will not see traffic to* [www.fiddler2.com.](http://www.fiddler2.com/) To see traffic to subdomains of Fiddler2.com, set the filter to ***.fiddler2.com--** this will include traffic to **test.fiddler2.com** and **sub.fiddler2.com**, etc. If you want to see traffic to fiddler2.com as well, set the filter to ***fiddler2.com**--this will include traffic to any domain that ends with fiddler2.com.

Note: When the box is yellow, it means your changes have not yet been applied. Click anywhere outside the box to save your changes to the list.

When configured to hide traffic to certain hosts, *Fiddler will still proxy traffic to those hosts,* but that traffic *will be hidden* from the Fiddler Session List. List multiple hosts using a semi-colon.

Sample:  
![FiltersReferenceImage](~/images/FiltersReferenceSample)

###Client Process

The process filter allows you to control which processes' traffic is shown within Fiddler. 

The **Hide traffic from Service Host** option will hide traffic from svchost.exe, a system process that synchronizes RSS Feeds and performs other background network activity.

Note: Fiddler can only determine the process name/PID owner of a request when the client application is running on the same computer as Fiddler itself.

When configured to hide traffic from certain processes, *Fiddler will still proxy their traffic*, but that traffic *will be hidden* from the Fiddler Session List.

###Breakpoints

The breakpoints enable you to break requests or responses that contain the specified attributes.

###Request Headers

Using these options, you can add or remove HTTP request headers, and flag responses that contain certain headers.

You can also filter displayed traffic down to specific URLs with the **Show only if url contains** box. You can demand case-sensitivity with the EXACT directive

		EXACT://example.com/q=Case+Sensitive+String 

or you can use regular expressions, so you can use:

		REGEX:(?insx).*\.(gif|png|jpg)$ #only show requests for img types

###Response Status Code

Using these options, you can filter display of responses based on the Response Status Code.

You can set the boxes to hide sessions whose responses code match target values [HTTP errors, redirects, authentication challenges and cache-reuse].

###Response Type and Size

Using these options, you can control what types of responses appear within the session list.

The list of "Block" checkboxes enables blocking responses of the specified types, returning a HTTP/404 error to the client instead of the target resource.

###Response Headers

Using these options, you can add or remove HTTP response headers, and flag responses that contain certain headers.