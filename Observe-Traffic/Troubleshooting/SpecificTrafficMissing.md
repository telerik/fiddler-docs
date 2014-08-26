---
title: Specific Traffic is Missing
slug: SpecificTrafficMissing
tags: Observe Traffic, Troubleshooting, missing traffic, filter, Web Sessions List
publish: true
position: 3
---

Problem: Specific Traffic is Missing
------------------------------------

I see some traffic in the Web Sessions List, but some traffic (for example, from a specific program) seems to be missing.

Solution: Check for Traffic Filters
-----------------------------------

Check to see if any Traffic Filters are enabled.  

+ Check in the **status bar**

 ![SBFilter](../../images/SBFilter.png) 

+ Check the **Process Filter** in the toolbar.

![TBFilter](../../images/TBFilter.png)  

+ Check the **Filters tab**. 

![FiltersTab](../../images/filterstab.png)

+ If you've written or set any [Fiddler Rules][1] check those too.

+ Click **Help > Troubleshoot Filters...**. When you do so, traffic that would otherwise be hidden is instead shown in a strikethrough font. The **Comments** column will show which of Fiddler's filters was responsible for attempting to hide the traffic.

[1]: ../../Extend-Fiddler/AddRules
