---
title: Replay Captured Traffic
page_title: Replaying Captured Traffic - Fiddler Classic
description: Replay captured HTTP traffic in Fiddler Classic by enabling the AutoResponder with saved matching rules.
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

1. Select sessions in the **Web Sessions List**. Press `Ctrl+Click` to select multiple sessions.

 ![Web Sessions List](./images/WebSessionsList.png)

2. Click the **Autoresponder** tab to the right.

 ![Autoresponder Tab](./images/AutoresponderTab.png)

3. Click and drag the selected web sessions from the **Web Sessions List** to the rules list in the **Autoresponder tab**.

 ![Drag Web Sessions](./images/DragWebSessions.png)

The rules list now populates with rules that respond to the captured requests with the corresponding captured responses.