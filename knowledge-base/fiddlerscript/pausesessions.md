---
title: Pause Web Sessions
slug: PauseSessions
publish: true
position: 5
res_type: kb
---

Pause Web Sessions
==================

To pause specific sessions, [add rules][1] using FiddlerScript to the **OnBeforeRequest** function (except where noted). For example:



**Pause all HTTP POSTs to allow hand-editing (the POST verb is often used for submitting forms)**

		if (oSession.HTTPMethodIs("POST")){
		  oSession["x-breakrequest"]="breaking for POST";
		}



**Pause all HTTP POSTs that contain 'thekeyword'**

		if (oSession.HTTPMethodIs("POST") && (oSession.utilFindInRequest("thekeyword", true) > -1)){
		oSession["x-breakrequest"] = "keyword";
		}



**Pause a request for an XML file to allow hand-editing**

		if (oSession.url.toLowerCase().indexOf(".xml")>-1){
		 oSession["x-breakrequest"]="reason_XML"; 
		}



**Pause a response containing JavaScript to allow hand-editing**
(in **OnBeforeResponse**)

		if (oSession.oResponse.headers.ExistsAndContains("Content-Type", "javascript")){
		 oSession["x-breakresponse"]="reason is JScript"; 
		}


[1]: ../../Extend-Fiddler/AddRules