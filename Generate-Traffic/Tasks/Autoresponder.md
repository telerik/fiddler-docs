---
title: Create traffic with custom matching rules
slug: ComposeAutoresponder.md
tags: Generate Traffic, Autoresponder, regex, string literals, regular expressions
publish: true
ordinal: 2
---

Create traffic with custom matching rules
==================================

Enable Autoresponder
--------------------

In the **Autoresponder** tab, check **Enable automatic responses**.

 ![Enable Automatic Responses][1]


Compose an AutoResponder Rule
----------------------------

To respond to specific requests by returning files from the Fiddler server (the machine running Fiddler) instead of transmitting the request to the destination server:

+ At the bottom of the **Autoresponder** tab, under the **Rule Editor**:

	1. Type a **match rule** in the top field.

	2. Type an **action string** in the bottom field.

  ![Rule Editor][2]

Fiddler will undertake the action if a captured request URI matches the match rule.

[1]: ../../images/ComposeAutoresponder/EnableAutomaticResponses.md
[2]: ../../images/ComposeAutoresponder/RuleEditor.png