---
title: "Unified Contact Center (UCC) Applet"
description: "Complete omnichannel customer engagement platform - WhatsApp, Facebook, Telegram, and more in one unified interface"
tags:
- applets
- customer-service
- omnichannel
- communication
weight: 5
---

### Introduction

Unified Contact Center (UCC) Applet is now available in the Applet Store. UCC Applet handles omnichannel conversations and provides a superior customer service experience which will allow the users to be able to send and receive messages from multiple messaging platforms in a single applet.

Besides, the UCC applet provides the function of the shopping cart, users can send the payment link to the customer, then the payment status will show up in UCC.

The UCC Applet consists of nine (9) main modules which are Inbox, Dashboard, My-Profile, Contacts, Broadcast, Task Queue, Configurations, Settings, and Personalization.

## 1. Overview of Whatsapp Business Set-Up

The following are the steps required to set up the WhatsApp Business App for new customers.

1.  Ask the Manager to permit Wavelet Facebook Business Settings.
2.  Go to https://developers.facebook.com/apps/?show_reminder=true and create a new app as explained here: Get Started - WhatsApp Cloud API - Documentation - Meta for Developers
3.  Configure the Webhook:
    a. Download Download ngrok
    b. Install and run grok on the terminal ⇒ "grok http 80" (windows) or "ngrok http 5000"
    c. Copy the link next to "Forwarding". It looks something like https://3db9-121-121-122-11.ap.ngrok.io
    d. Follow the documentation for Callback URL pass ngrok link and endpoint from the code (https://3db9-121-121-122-11.ap.ngrok.io/v1/integration/channels/whatsapp/receive)
    e. If Webhook is set successfully, you will; receive a message.
4.  Add phone numbers:
    a. Add the client's phone number here: https://business.facebook.com/wa/manage/phone-numbers/?business_id=1329448660474352&waba_id=105748575486134
    b. Do not sign up with the customer's phone number with the WhatsApp Business app. If previously signed up with a customer phone number follow these instructions https://developers.facebook.com/docs/whatsapp/embedded-signup/webhooks
    c. Phone number will be approved after 6 hours and 1k free messaging limits will be granted depending on the quality rating.

## 2. Task Queue

### 2.1 All Task Queue

#### 2.1.1 All Task Queue -> Listing page

The listing page is where Admins, Owners, and Managers can view all available tasks, their details and assignment status.

**Available Fields:**
-   **Task Code**: brief task description
-   **Team Code**: Team Task is assigned to. (The task can be assigned to one team or agent at a time)
-   **Agent Code**: Agent Task is assigned to (Task can be assigned to one team or agent at a time).
-   **Channel**: WhatsApp/ Email/ SMS/ Telegram Messenger/Voice-Call task
-   **Description**: task description in more detail
-   **Priority**: Priority (1-10) of task
-   **Create Date**: Created date of task
-   **Update Date**: Updated date of task

{{< figure src="/images/ucc-applet/e91298aa-3164-438a-9fcf-c479c35a4ea5.jpeg" caption="Fig 1: all-task-queue-listing" >}} 

#### 2.1.2 All Task Queue -> Listing Bulk Actions

If the Tick boxes in the all task queue listing component are selected it will activate the Bulk actions.

**Available Bulk Actions:**
-   **ASSIGN_WORKER**: used to update assignments to "AGENT" or "TEAM"
-   **COMPLETE**: complete tasks
-   **CANCEL**: cancel tasks
-   **UNASSIGN**: used to update assignments to "UNASSIGN"

{{< figure src="/images/ucc-applet/db51a49e-fed9-40f6-810d-749d888f77b1.jpeg" caption="Fig 2: all-task-queue-listing-bulk-actions" >}}

**ASSIGN_WORKER Details:**
After selecting the ASSIGN_WORKER option from dropdown, the WORKER_TYPE field will be displayed where "AGENT" or "TEAM" can be selected.

{{< figure src="/images/ucc-applet/24927c55-9a9c-4557-aaf7-aa9dfd93232b.jpeg" caption="Fig 3: all-task-queue-listing-bulk-actions-ASSIGN_WORKER-part-1" >}}

Afterwards the suitable "AGENT" or "TEAM" can be selected from the available list.

{{< figure src="/images/ucc-applet/5e564a41-338c-463b-9bef-9702dcbbddb5.jpeg" caption="Fig 4: all-task-queue-listing-bulk-actions-ASSIGN_WORKER-part-2" >}}

#### 2.1.3 All Task Queue -> Edit page

This page allows "task details" and "task status" and "task assignment" to be updated.

**Details That Can Be Updated:**
-   Priority
-   Description

{{< figure src="/images/ucc-applet/dda65f67-d7e4-4a50-b09f-315b5337a70a.jpeg" caption="Fig 5: all-task-queue-edit-part-1" >}}

**Task Actions:**
"Task Status" and "Task Assignment" can be updated by clicking the "TASK ACTIONS" dropdown.

{{< figure src="/images/ucc-applet/a9de6003-56ff-4454-8b1b-1a69a56e98c2.jpeg" caption="Fig 6: all-task-queue-edit-part-2" >}}

### 2.2 Team Task Queue

#### 2.2.1 Team Task Queue -> Listing page

This listing page is where members of a Team can view all tasks assigned to a particular team.

**Available Fields:**
-   **Task Code**: brief task description
-   **Team Code**: Team Task is assigned to. (The task can be assigned to one team or agent at a time)
-   **Channel**: WhatsApp/ Email/ SMS/ Telegram Messenger/Voice-Call task
-   **Description**: task description in more detail
-   **Priority**: Priority (1-10) of task
-   **Create Date**: Created date of task
-   **Update Date**: Updated date of task

{{< figure src="/images/ucc-applet/2f06004a-ba70-4a1d-bcdd-267e6eb3dfd2.jpeg" caption="Fig 7: team-task-queue-listing" >}}

#### 2.2.2 Team Task Queue -> Listing Bulk Actions

If the Tick boxes in the all task queue listing component are selected it will activate the Bulk actions.

**Available Bulk Actions:**
-   **ASSIGN_TO_ME**: used to update assignments to the user
-   **UNASSIGN**: used to update assignments to "UNASSIGN"

{{< figure src="/images/ucc-applet/e3bb770a-dfdd-4cfb-82de-bad7eb32c6a9.jpeg" caption="Fig 8: team-task-queue-listing-bulk-actions" >}}

#### 2.2.3 Team Task Queue -> Edit page

This page allows "task assignment" to be updated.

**Actions Available:**
-   UNASSIGN
-   ASSIGN_TO_ME

"Task Assignment" can be updated by clicking the "TASK ACTIONS" dropdown.

{{< figure src="/images/ucc-applet/2ce26485-ea11-4e93-9338-a95f2de2f8b2.jpeg" caption="Fig 9: team-task-queue-edit" >}}

### 2.3 My Task Queue

#### 2.3.1 My Task Queue -> Listing page

This listing page is where members of a Team can view all tasks assigned to a particular team.

**Available Fields:**
-   **Task Code**: brief task description
-   **Team Code**: Team Task is assigned to. (The task can be assigned to one team or agent at a time)
-   **Channel**: WhatsApp/ Email/ SMS/ Telegram Messenger/Voice-Call task
-   **Description**: task description in more detail
-   **Priority**: Priority (1-10) of task
-   **Create Date**: Created date of task
-   **Update Date**: Updated date of task

{{< figure src="/images/ucc-applet/ae77ad3e-7657-4d13-adc5-f3ba9802d00d.jpeg" caption="Fig 10: my-task-queue-listing" >}}

#### 2.3.2 My Task Queue -> Listing Bulk Actions

If the Tick boxes in the all task queue listing component are selected it will activate the Bulk actions.

**Available Bulk Actions:**
-   **IN-PROGRESS**: task status changed to in progress
-   **COMPLETED**: task status changed to completed
-   **CANCELED**: task status changed to is canceled
-   **UNASSIGNED**: task status changed to unassigned

{{< figure src="/images/ucc-applet/9b48ed3e-e61f-4999-9984-cc6f82f4933c.jpeg" caption="Fig 11: my-task-queue-listing-bulk-actions" >}}

#### 2.3.3 My Task Queue -> Edit page

"Task Status" and "Task Assignment" can be updated by clicking the "TASK ACTIONS" dropdown.

{{< figure src="/images/ucc-applet/fc433fe4-3984-4efb-8575-de979c9f87a9.jpeg" caption="Fig 12: my-task-queue-edit-part" >}}

## 3. Task Queue Outbound

### 3.1 All Task Queue Outbound

#### 3.1.1 All Task Queue Outbound -> Listing page

The listing page lets Admins, Owners, and Managers view all available outbound tasks, their details, and assignment status.

**Available Fields:**
-   **Task Code**: brief task description
-   **Team Code**: Team Task is assigned to. (The task can be assigned to one team or agent at a time)
-   **Agent Code**: Agent Task is assigned to (Task can be assigned to one team or agent at a time).
-   **Channel**: WhatsApp/ Email/ SMS/ Telegram Messenger/Voice-Call task
-   **Description**: task description in more detail
-   **Priority**: Priority (1-10) of task
-   **Create Date**: Created date of task
-   **Update Date**: Updated date of task

{{< figure src="/images/ucc-applet/8739cf78-a47e-4368-b561-ddd517996343.jpeg" caption="Fig 13: all-task-queue-outbound-listing" >}}

#### 3.1.2 All Task Queue Outbound -> Listing Bulk Actions

If the Tick boxes in the all task queue outbound listing component are selected it will activate the Bulk actions.

**Available Bulk Actions:**
-   **ASSIGN_WORKER**: used to update assignments to "AGENT" or "TEAM"
-   **COMPLETE**: complete tasks
-   **CANCEL**: cancel tasks
-   **UNASSIGN**: used to update assignments to "UNASSIGN"

{{< figure src="/images/ucc-applet/516cb2fa-9199-4bb6-abf8-f00934b74b87.jpeg" caption="Fig 14: all-task-queue-listing-bulk-actions" >}}

**ASSIGN_WORKER Details:**
After selecting the ASSIGN_WORKER option from dropdown, the WORKER_TYPE field will be displayed where "AGENT" or "TEAM" can be selected.

{{< figure src="/images/ucc-applet/2903b931-dc87-4c2a-aabd-13c13d080ddb.jpeg" caption="Fig 15: all-task-queue-listing-bulk-actions-ASSIGN_WORKER-part-1" >}}

Afterwards the suitable "AGENT" or "TEAM" can be selected from the available list.

{{< figure src="/images/ucc-applet/6c3a7b93-ab25-4ea4-8cbf-3f885e41f9f7.jpeg" caption="Fig 16: all-task-queue-listing-bulk-actions-ASSIGN_WORKER-part-2" >}}

#### 3.1.3 All Task Queue Outbound -> Edit page

This page allows you to update "task details," "task status," and "task assignment."

**Details That Can Be Updated:**
-   Priority
-   Description

{{< figure src="/images/ucc-applet/43d575f8-e9a3-4fea-b14b-9c3a848695ee.jpeg" caption="Fig 17: all-task-queue-outbound-edit-part-1" >}}

**Task Actions:**
"Task Status" and "Task Assignment" can be updated by clicking the "TASK ACTIONS" dropdown.

{{< figure src="/images/ucc-applet/696bd24a-cf60-4cf1-b50a-7c90f84c1751.jpeg" caption="Fig 18: all-task-queue-edit-part-2" >}}

### 3.2 Team Task Queue Outbound

#### 3.2.1 Team Task Queue Outbound -> Listing page

This listing page is where members of a Team can view all outbound tasks assigned to a particular team.

**Available Fields:**
-   **Task Code**: brief task description
-   **Team Code**: Team Task is assigned to. (The task can be assigned to one team or agent at a time)
-   **Channel**: WhatsApp/ Email/ SMS/ Telegram Messenger/Voice-Call task
-   **Description**: task description in more detail
-   **Priority**: Priority (1-10) of task
-   **Create Date**: Created date of task
-   **Update Date**: Updated date of task

{{< figure src="/images/ucc-applet/e586c8cc-5024-4111-8e3a-1ec665ffe4f3.jpeg" caption="Fig 19: team-task-queue-listing" >}}

#### 3.2.2 Team Task Queue Listing Outbound -> Bulk Actions

If the Tick boxes in the all task queue listing component are selected it will activate the Bulk actions.

**Available Bulk Actions:**
-   **ASSIGN_TO_ME**: used to update assignments to the user
-   **UNASSIGN**: used to update assignments to "UNASSIGN"

{{< figure src="/images/ucc-applet/1011f5ca-9416-4b7e-8d61-d8b5a006df43.jpeg" caption="Fig 20: team-task-queue-listing-bulk-actions" >}}

#### 3.2.3 Team Task Queue Outbound -> Edit page

This page allows "task assignment" to be updated.

**Actions Available:**
-   UNASSIGN
-   ASSIGN_TO_ME

"Task Assignment" can be updated by clicking the "TASK ACTIONS" dropdown.

{{< figure src="/images/ucc-applet/e1ae74bb-827b-4fb4-b57a-0c4d13b9eaf9.jpeg" caption="Fig 21: team-task-queue-edit" >}}

### 3.3 My Task Queue Outbound

#### 3.3.1 My Task Queue Outbound -> Listing page

This listing page is where members of a Team can view all outbound tasks assigned to a particular team.

**Available Fields:**
-   **Task Code**: brief task description
-   **Team Code**: Team Task is assigned to. (The task can be assigned to one team or agent at a time)
-   **Channel**: WhatsApp/ Email/ SMS/ Telegram Messenger/Voice-Call task
-   **Description**: task description in more detail
-   **Priority**: Priority (1-10) of task
-   **Create Date**: Created date of task
-   **Update Date**: Updated date of task

{{< figure src="/images/ucc-applet/35c3a67e-3a94-41e4-85c7-d886d4487233.jpeg" caption="Fig 22: my-task-queue-listing" >}}

#### 3.3.2 My Task Queue Listing Outbound -> Bulk Actions

If the Tick boxes in the all task queue listing component are selected it will activate the Bulk actions.

**Available Bulk Actions:**
-   **IN-PROGRESS**: task status changed to in progress
-   **COMPLETED**: task status changed to completed
-   **CANCELED**: task status changed to is canceled
-   **UNASSIGNED**: task status changed to unassigned

{{< figure src="/images/ucc-applet/1abf02b9-26d0-424b-b0c6-34c5845d956f.jpeg" caption="Fig 23: my-task-queue-listing-bulk-actions" >}}

#### 3.3.3 My Task Queue Outbound -> Edit page

"Task Status" and "Task Assignment" can be updated by clicking the "TASK ACTIONS" dropdown.

{{< figure src="/images/ucc-applet/60226237-8106-49e6-9dae-74cf072855db.jpeg" caption="Fig 24: my-task-queue-edit" >}}

## 4. Inbox

### 4.1 Inbox -> All Tasks

#### 4.1.1 Inbox -> All Task -> Summary

This page provides a quick view of the total number of open Tasks, Conversations, Emails, and Voice calls. It will only be available to higher-level users such as the Owner and Admin.

{{< figure src="/images/ucc-applet/b609c858-3c35-4b26-bd2b-05b68a527937.jpeg" caption="Fig 25: inbox-all-task-summary" >}}

#### 4.1.2 Inbox -> All Task -> Conversation

Selecting each of the tabs in the All-Task page will lead to Conversation/Email/Voice Tasks.

{{< figure src="/images/ucc-applet/541b33a1-b64b-4499-a0f9-b57e79f998e6.jpeg" caption="Fig 26: inbox-all-task-conversation-email-voice-tab-selection" >}}

##### 4.1.2.1 Inbox -> All Task -> Conversation -> Listing

After the conversation tab is selected the listing page is opened.

{{< figure src="/images/ucc-applet/5bbcad7b-e35e-41c2-b692-2a4f959da693.jpeg" caption="Fig 27: inbox-all-task-conversation-listing" >}}

##### 4.1.2.2 Inbox -> All Task -> Conversation -> Listing Filters

Filters allow the user to filter conversations via:
-   Channel (WHATSAPP, TELEGRAM, etc)
-   Sender (customer name)
-   Receiver (agent)
-   Virtual Contacts
-   Date From - Date To
-   Task Status (Active/Inactive/Assigned/Unassigned)

{{< figure src="/images/ucc-applet/3f13dd0e-e1f3-46db-b07f-94f62034c8da.jpeg" caption="Fig 28: inbox-all-task-conversation-listing-filters" >}}

##### 4.1.2.3 Inbox -> All Task -> Conversation Listing -> Sort

Users can sort in ASCENDING or DESCENDING order based on the following criteria:

{{< figure src="/images/ucc-applet/f98db44f-b5f3-4e40-8173-9b9922222ada.jpeg" caption="Fig 29: inbox-all-task-conversation-listing-sort" >}}

{{< figure src="/images/ucc-applet/1d12d08d-6b3b-47af-8f09-efce59063c6e.jpeg" caption="Fig 30: inbox-all-task-conversation-listing-sort-criteria" >}}

##### 4.1.2.4 Inbox -> All Task -> Conversation -> Filter By Project

Users can filter conversation by selecting a project from the "Projects" tab and selecting a filter.

{{< figure src="/images/ucc-applet/2ac8f14f-776f-4f65-b5b7-edb6728fff71.jpeg" caption="Fig 31: inbox-all-task-conversation-filter-by-project" >}}

##### 4.1.2.5 Inbox -> All Task -> Conversation -> Messages Listing

By selecting one conversation, all messages in the conversation will be displayed on the right, and scrolling up will load older messages.

{{< figure src="/images/ucc-applet/02f60dce-af0a-4dcc-8df3-51390ace1dcf.jpeg" caption="Fig 32: inbox-all-task-conversation-messages-listing" >}}

##### 4.1.2.6 Inbox -> All Task -> Conversation -> Messages Session Close

When a customer messages UCC, even if it is an older customer a new session is created. Sessions are meant to handle a single query. After the problem is resolved the session can be closed.

{{< figure src="/images/ucc-applet/2fa13312-c842-4bb1-b5db-8bd1b020da3d.jpeg" caption="Fig 33: inbox-all-task-conversation-messages-end-session" >}}

##### 4.1.2.7 Inbox -> All Task -> Conversation -> Search By Message Content

Users can type in parts of a text to search for particular messages. In the picture below "Hello" is inputted.

{{< figure src="/images/ucc-applet/8d5ae225-9f6e-4cb1-a5cc-546fc36b417a.jpeg" caption="Fig 34: inbox-all-task-conversation-search-by-message-content" >}}

##### 4.1.2.8 Inbox -> All Task -> Conversation -> Messages Sending Options

There are several sending options marked from 1-5 in the picture below:
1.  Emoji picker
2.  Send Message
3.  Send Predefined Message
4.  Send My Name Card Template Message
5.  Add Attachment

{{< figure src="/images/ucc-applet/d628631d-3c88-40ad-9e16-83d64e62aef2.jpeg" caption="Fig 35: inbox-all-task-conversation-messages-sending-options" >}}

##### 4.1.2.9 Inbox -> All Task -> Conversation Messages -> Customer Details

By clicking the arrow on the top right corner of the conversation message the customer details page will be opened. This page will provide an all-around view of all customer-related information obtained from other applets and will help agents to provide informed support.

{{< figure src="/images/ucc-applet/794bdad6-3dc5-44ce-a763-075e3426fe44.jpeg" caption="Fig 36: inbox-all-task-conversation-messages-customer-details" >}}

###### 4.1.2.9.1 Inbox -> All Task -> Conversation -> Messages -> Customer Details -> Information -> Personal Info

The personal information tab shows customer information such as name, email, company information, and such to help agents identify customer.

{{< figure src="/images/ucc-applet/6e25ae4e-34f4-4e7d-9b86-475425ff0d12.jpeg" caption="Fig 37: inbox-all-task-conversation-messages-customer-details-information-personal-information" >}}

###### 4.1.2.9.2 Inbox -> All Task -> Conversation -> Messages -> Customer Details -> Information -> Task Assignment

The Task Assignment information tab shows which agent or team the Conversation task is assigned to and allows quick changing of assignment.

{{< figure src="/images/ucc-applet/206ac5ee-5cca-414f-a2aa-ad2bd9c68fc8.jpeg" caption="Fig 38: inbox-all-task-conversation-messages-customer-details-information-task-assignment" >}}

###### 4.1.2.9.3 Inbox -> All Task -> Conversation -> Messages -> Customer Details -> Information -> Preferred Agent

The Preferred Agent tab shows the list of agents preferred by the customer (the customer scanned their QR and selected them as preferred agent).

###### 4.1.2.9.4 Inbox -> All Task -> Conversation -> Messages -> Customer Details -> Information -> Conversation History

The Task Assignment information tab shows which agent or team the Conversation task is assigned to and allows quick changing of assignments.

{{< figure src="/images/ucc-applet/87fff6ae-a9c8-452d-9e57-8258c7971571.jpeg" caption="Fig 39: inbox-all-task-conversation-messages-customer-details-information-task-assignment" >}}

### 4.2 My Team Tasks

My Team Tasks are the same as above (All Tasks Queue).

### 4.3 My Tasks

My Tasks are the same as above (All Tasks Queue).

## 5. Outbound

Outbound (All tasks, My Team Tasks, and My Task) are the same as "Inbox" (refer to point no. 3). They carry the messages sent by user outside.

## 6. Social Media

Using the top navigation tabs users can move between accessing different social media integrations.

{{< figure src="/images/ucc-applet/894b85a5-06ff-466a-8280-d4cc89680389.jpeg" caption="Fig 40: Social Media Navigation Tab" >}}

### 6.1 Facebook

This page provides a list of all the Facebook pages of the business the user has access to.

{{< figure src="/images/ucc-applet/5b560785-5dcf-44ba-a20c-fa124d91d8ec.jpeg" caption="Fig 41: social-media-facebook-page-listing" >}}

**Post Listing:**
Clicking the Facebook page opens up the listing page showing all posts connected to the page from Facebook.

{{< figure src="/images/ucc-applet/e422c4be-44d5-482f-9604-fb0cabfc8d5e.jpeg" caption="Fig 42: social-media-facebook-page-post-listing" >}}

**Post Create:**
The highlighted area in the screenshot below shows the text region where the contents of a new post can be typed and then the submit button will create a new post in UCC and Facebook. The attachment icons below the text region will allow attachments such as Images, Videos, and Links to be uploaded as well in the post.

{{< figure src="/images/ucc-applet/60acc284-be89-4834-89bc-d938beb5e572.jpeg" caption="Fig 43: social-media-facebook-page-create-post" >}}

**Post Edit or Delete:**
On the right-hand side of each post, as shown in the screenshot below, the Edit and Delete button is present and can be used to update or delete the post on Facebook. 

The text region containing the contents of the post will become editable again. Changes can be made and the “Save” button can be clicked to save changes or the “Discard” button to discard changes.

{{< figure src="/images/ucc-applet/47597bf1-de06-4f40-893f-9713d349a1d3.jpeg" caption="Fig 44: social-media-facebook-page-update-delete-post" >}}

{{< figure src="/images/ucc-applet/1c1f603d-fb78-4cd5-b604-379b7bac70fe.jpeg" caption="Fig 45: social-media-facebook-page-post-update-discard" >}}

### 6.2 YouTube

(This part is under development)

## 7. UCC Dashboard

In the dashboard page, "Date From" and "Date To" need to be selected and the filter button needs to be clicked based on the selected date duration will be loaded up. Some figures that will load up are highlighted in the subsequent screenshots.

{{< figure src="/images/ucc-applet/0ce1b2a2-479e-46b7-ad61-f9d8ef426bd1.jpeg" caption="Fig 46: dashboard-listing-1" >}}

{{< figure src="/images/ucc-applet/17846fd8-2697-4784-8537-afcda92c9f1d.jpeg" caption="Fig 47: dashboard-listing-2" >}}

{{< figure src="/images/ucc-applet/fd1873e7-a5e9-44a8-b6fb-7fd460c24c48.jpeg" caption="Fig 48: dashboard-listing-3" >}}

## 8. Reports

### 8.1 Task Report

The task report shows a summary of the most important information for tasks in UCC. "Date From" and "Date To" need to be selected and the filter button needs to be clicked based on the selected date duration data will be loaded up.

{{< figure src="/images/ucc-applet/c3ec35f6-3da8-4866-b602-30a3aed7631c.jpeg" caption="Fig 49: report-task-report-listing-1" >}}

The task report shows the following information:
-   **Code**: the task code
-   **Name**: name of the task
-   **Target Type**: Conversation/Email/Voice
-   **Task Status**: status of task example:- Canceled/Completed/Agent_Assigned and so on
-   **Channel**: WHATSAPP/TELEGRAM and such
-   **Total Duration**: how long the task has lasted and if it is ongoing
-   **Created Date**
-   **Last Modified Date**

This information can be exported using the "Export CSV" button.

{{< figure src="/images/ucc-applet/4067eff8-5efe-41a6-aeab-d715f4ea70be.jpeg" caption="Fig 50: report-task-report-listing-2" >}}

### 8.2 Agent Report

The Agent report shows a summary of agent activities in UCC. "Date From" and "Date To" need to be selected and the filter button needs to be clicked based on the selected date duration data will be loaded up.

{{< figure src="/images/ucc-applet/2671ff99-ef7c-4164-9940-8ad2ac28d4a6.jpeg" caption="Fig 51: report-agent-report-listing-1" >}}

The agent report shows the following information:
-   **Code**: agent code
-   **Name**: Name of agent
-   **Total Tasks**: Total number of tasks that have been assigned to the agent
-   **Completed Tasks**: Total number of tasks that has been completed by the agent
-   **Canceled Tasks**: Total number of tasks assigned to the agent that have been canceled
-   **In-progress tasks**: tasks that are currently being handled by the agent
-   **Average duration**: the average time required by the agent to complete tasks

The report can also be exported as CSV using the "Export CSV" button.

{{< figure src="/images/ucc-applet/967b836a-6abd-412b-8ff0-538a1394f048.jpeg" caption="Fig 52: report-agent-report-listing-2" >}}

## 9. My Profile

### 9.1 About Me

About Me page provides some quick view information regarding the agent such as the virtual contacts the agent has access to and agent's team name if the agent belongs to a team.

{{< figure src="/images/ucc-applet/f6d1faec-bd36-4620-84b6-a82bf21cc194.jpeg" caption="Fig 53: profile-about-me" >}}

### 9.2 QR Code

The QR Codes tab will generate a QR code specific to the agent which the agent can send to customers who want to specifically be helped by this particular agent. The qr code when scanned provides the agent's information and also designates the agent as the preferred agent for the customer who scanned.

{{< figure src="/images/ucc-applet/99ed0bcd-4e1e-451d-a297-b5883c2ac5ce.jpeg" caption="Fig 54: profile-qr-code-preferred-agent" >}}

## 10. Contacts

### 10.1 Contacts -> Listing

The contact listing page shows all customer contacts available and accumulated by thus UCC so far.

{{< figure src="/images/ucc-applet/23d97877-0a52-4990-8b54-90fec9fcb59a.jpeg" caption="Fig 55: contact-listing" >}}

### 10.2 Contacts -> Listing Export As CSV

On the Listing page, users have the option to generate a comma-separated excel file of all available contacts for use in other applets such as Digital Marketing for broadcast. By clicking the 'Export CSV' button users can store the CSV file in their own hard drive wherever they please.

{{< figure src="/images/ucc-applet/95e6194e-5a5f-4c14-adad-7114f99ca4c0.jpeg" caption="Fig 56: contact-listing-export-excel-csv" >}}

### 10.3 Contacts -> Create (Manual Creation)

Clicking the plus (+) button from the listing page will bring the user to the Create contact page where users can create a new customer contact by inserting the following details:

-   First Name
-   Last Name
-   Contact Name (usually the user name if known or phone number)
-   Channel (Dropdown Menu with options):
    -   SMS
    -   TELEGRAM
    -   WHATSAPP
    -   FB_MESSENGER
-   Phone number connected to contact (Country code can be selected from dropdown)
-   Reference (Telegram/Whatsapp handle or Facebook username)
-   Email (is known)
-   Description

{{< figure src="/images/ucc-applet/33f85d62-f031-404c-a2ca-8dd03a5e72fd.jpeg" caption="Fig 57: contact-create-manual-creation" >}}

### 10.4 Contacts -> Create (Import Excel CSV)

Switching over to the "Import File" tab will allow users to select an Excel CSV file from their own machine and click the "Upload" button to upload the file. In the CSV file, each row must have all the required as highlighted in contact create (manual creation) separated by commas. Then by clicking the "Import" button each row in CSV will be used to create a new contact.

{{< figure src="/images/ucc-applet/6851f654-4c2d-4485-a4ee-e75c75b37d03.jpeg" caption="Fig 58: contact-create-import-csv" >}}

### 10.5 Contacts -> Update

Clicking an item from the listing page will allow users to update the contact and clicking the "Save" button will confirm the update. Fields that can be updated are:

-   First Name
-   Last Name
-   Contact Name (usually the user name if known or phone number)
-   Channel (Dropdown Menu with options):
    -   SMS
    -   TELEGRAM
    -   WHATSAPP
    -   FB_MESSENGER
-   Phone number connected to contact (Country code can be selected from dropdown)
-   Reference (Telegram/Whatsapp handle or Facebook username)
-   Email (is known)
-   Description

{{< figure src="/images/ucc-applet/5ccca342-bc9b-436f-8fc8-d780df769e88.jpeg" caption="Fig 59: contact-update" >}}

### 10.6 Contacts -> Delete

Scrolling down a bit in the edit page will reveal the button to delete contact entirely.

{{< figure src="/images/ucc-applet/e9fc3ee7-f1ee-4ac7-9c78-51081afacf29.jpeg" caption="Fig 60: contact-delete" >}}

## 11. Broadcast

### Simple Broadcast (Advanced Broadcasts can be sent from Digital Marketing Applet)

The broadcast page allows the user to broadcast advertisement messages to a list of leads. Advanced Broadcasts can be sent from Digital Marketing Applet.

{{< figure src="/images/ucc-applet/7bab0cae-bdd6-4d79-99cc-d9ce2a340438.jpeg" caption="Fig 61: broadcast-main" >}}

**STEP 1: Select a Channel**

This step requires the user to select a channel as highlighted below (Whatsapp channel is the most optimized).

{{< figure src="/images/ucc-applet/921beaf1-d6d2-48ba-b19a-83a545ff626a.jpeg" caption="Fig 62: broadcast-main-select-channel" >}}

**STEP 2: Select an Endpoint**

This step requires the user to select an endpoint (available company WhatsApp number if WhatsApp) as highlighted below.

{{< figure src="/images/ucc-applet/7f76c17d-8358-4f2e-9ea3-913bda26a0d4.jpeg" caption="Fig 63: broadcast-main-select-endpoint" >}}

**STEP 3 (OPTION 1): Select Contacts One by One**

This step requires the user to select contacts to send broadcasts to. Users can select contacts one by one from the drop-down list.

{{< figure src="/images/ucc-applet/3316b124-d5ce-423d-a3fe-03867674cccd.jpeg" caption="Fig 64: broadcast-main-select-contact-one-by-one" >}}

**STEP 3 (OPTION 2): Import Contact CSV**

Another option available to users for contact selection involves importing a CSV list of contacts who must be sent the broadcast. Users can click the "Attachment" icon highlighted in red below and select a suitable Excel CSV file from their machine. The CSV list can be created in Excel. (Can also be exported from the contacts page)

**STEP 4 (Final): Select Message Type and Send**

Users have to select the message type as highlighted below and finally click the "Send Message" button.

{{< figure src="/images/ucc-applet/e62a205e-6882-449b-bef1-54e78ea30ff4.jpeg" caption="Fig 65: broadcast-main-import-contact" >}}

{{< figure src="/images/ucc-applet/7b30c7b4-38cc-42d9-8a3f-50dd319fe6a6.jpeg" caption="Fig 66: broadcast-main-select-messagetype" >}}

## 12. Live Dashboard

The Live Dashboard page presents a real-time view of all Agents who are currently using UCC and the actions that they are currently performing. Thus, the Live Dashboard page helps to properly monitor the activity and progress of agents.

{{< figure src="/images/ucc-applet/85c5123b-d7a3-494f-bc3f-e754f09e85c7.jpeg" caption="Fig 67: ive-dashboard-base-view" >}}

### 12.1 Online Agents

The Online Agents page presents a real time view of  all Agents who are currently performing some tasks such as answering Conversation, Email or Receiving voice calls and the duration of those tasks. By dragging the column headers highlighted in red users can group data according to the contents of the dragged column.

{{< figure src="/images/ucc-applet/c05c001a-dcdb-4fd7-a8d7-8d5d12377fdc.jpeg" caption="Fig 68: live-dashboard-online-agents-modified-view-step-one" >}}

In the screenshot below the column has been grouped based on agent after the Agent column had been dropped to the box above.

{{< figure src="/images/ucc-applet/b0c672b0-ffb8-4c5f-b0eb-dfc0450b5f7e.jpeg" caption="Fig 69: live-dashboard-online-agents-modified-view-step-two" >}}

### 12.2 All Agents

The All Agents page contains all agents and their different organization accounts and shows in real time their availability status “OFFLINE” or “AVAILABLE” and their last online time. By dragging the column headers highlighted in red users can group data according to the contents of the dragged column.

{{< figure src="/images/ucc-applet/650eb7f1-e7a2-4e9a-9ca8-f134e7722c88.jpeg" caption="Fig 70: live-dashboard-all-agents-modified-view-step-one" >}}

{{< figure src="/images/ucc-applet/fe06ff40-d1fd-4bd3-88e4-5ed5af02c07e.jpeg" caption="Fig 71: live-dashboard-all-agents-modified-view-step-two" >}}

### 12.3 All Agents (under process)

(This part is under process)

## 13. Configurations

-   Projects
-   Virtual Contacts
-   Teams
-   Agents
-   Predefined Messages
-   Qr Codes
-   Tasks
-   Outbound Tasks
-   Automation Rule
-   Rule
-   Action

## Ready to Transform Your Customer Service?

The UCC Applet is more than just a messaging platform - it's a complete customer engagement solution that will revolutionize how you interact with customers.

{{< cards >}}
  {{< card link="/applications/unified-contact-center" title="Learn More" subtitle="Explore UCC capabilities" >}}
  {{< card link="/demos-resources" title="Watch Demo" subtitle="See UCC in action" >}}
  {{< card link="mailto:sales@bigledger.com" title="Contact Sales" subtitle="Get personalized pricing" >}}
{{< /cards >}}


*Last updated: November 2024 | Version 3.0*