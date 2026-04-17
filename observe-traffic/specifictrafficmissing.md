---
title: Specific Traffic is Missing
page_title: Resolving Missing Specific Traffic - Fiddler Classic
description: Resolve missing traffic in Fiddler Classic by checking filters, toolbar process filters, and rules.
slug: SpecificTrafficMissing
publish: true
position: 3
previous_url: /observe-traffic/tasks/specifictrafficmissing, /observe-traffic/troubleshooting/specifictrafficmissing
---

# Problem: Specific Traffic is Missing

I see some traffic in the Web Sessions List, but some traffic (for example, from a specific program) seems to be missing.

## Solution: Check for Traffic Filters

Check to see if any Traffic Filters are enabled.  

+ Check in the **status bar**

 ![SBFilter](./images/SBFilter.png) 

+ Check the **Process Filter** in the toolbar.

![TBFilter](./images/TBFilter.png)  

+ Check the **Filters tab**. 

![FiltersTab](./images/filterstab.png)

+ If you've written or set any [Fiddler Classic Rules](slug://AddRules) check those too.

+ Click **Help** > **Troubleshoot Filters...**. When you do so, traffic that would otherwise be hidden is instead shown in a strikethrough font. The **Comments** column shows which of Fiddler's filters was responsible for attempting to hide the traffic.
