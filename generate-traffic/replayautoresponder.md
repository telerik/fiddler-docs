---
title: Replay Captured Traffic
meta_title: Replay Captured Traffic - Fiddler Classic Documentation
description: Learn how to replay previously captured traffic sessions in Fiddler Classic to reproduce scenarios and test server responses.
slug: ReplayAutoresponder
publish: true
position: 3
previous_url: /generate-traffic/tasks/replayautoresponder
---

# Replay Captured Traffic

## Enable Autoresponder

In the **Autoresponder** tab, check **Enable automatic responses**.

 ![Enable Automatic Responses](./images/EnableAutomaticResponses.png)

## Create matching rules from the Web Sessions List

To replay captured responses to matching requests instead of transmitting the request to the destination server:

1. Select sessions in the **Web Sessions List**. Press Control-click to select multiple sessions.

 ![Web Sessions List](./images/WebSessionsList.png)

2. Click the **Autoresponder** tab to the right.

 ![Autoresponder Tab](./images/AutoresponderTab.png)

3. Click and drag the selected web sessions from the **Web Sessions List** to the rules list in the **Autoresponder tab**.

 ![Drag Web Sessions](./images/DragWebSessions.png)

The rules list will now populate with rules that respond to the captured requests with the corresponding captured responses.