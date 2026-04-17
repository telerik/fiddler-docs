---
title: Create Traffic with Custom Matching Rules
page_title: Creating Traffic with Custom Matching Rules - Fiddler Classic
description: Create custom traffic in Fiddler Classic by configuring AutoResponder matching rules for specific URLs.
slug: ComposeAutoresponder
publish: true
position: 2
previous_url: /generate-traffic/tasks/composeautoresponder
---

# Create Traffic with Custom Matching Rules

## Enable Autoresponder

In the **Autoresponder** tab, check **Enable automatic responses**.
 ![Enable Automatic Responses](./images/EnableAutomaticResponses.png)

## Compose Autoresponder Rules

At the bottom of the **Autoresponder** tab, under the **Rule Editor**:
1. Type a **match rule** in the top field.
2. Type an **action string** in the bottom field.
  ![Rule Editor](./images/RuleEditor.png)

When **Enable automatic responses** is checked, Fiddler Classic undertakes the action if a captured request URI matches the match rule.

