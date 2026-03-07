---
title: "Unified Contact Center (UCC) Applet"
description: "Complete omnichannel customer engagement platform - WhatsApp, Facebook, Telegram, and more in one unified interface"
tags:
- applets
- customer-service
- omnichannel
- communication
weight: 105
---

### Introduction

The Unified Contact Center (UCC) Applet is a comprehensive customer communication and task management platform now available in the Applet Store. UCC transforms how organizations handle customer interactions by consolidating all communication channels into a single, unified workspace, eliminating the need to switch between multiple applications and ensuring no customer message goes unnoticed.

A short introduction to the Unified Contact Center (UCC) Applet:

<div style="max-width:560px; margin:24px auto;">
  <div style="position:relative; padding-bottom:56.25%; height:0; overflow:hidden;">
    <iframe
      src="https://www.youtube.com/embed/cgGqMnSo5bQ"
      style="position:absolute; top:0; left:0; width:100%; height:100%;"
      frameborder="0"
      allowfullscreen>
    </iframe>
  </div>
</div>


A Webinar to get to know about the functionalities of the Unified Contact Center (UCC) Applet:

<div style="max-width:560px; margin:24px auto;">
  <div style="position:relative; padding-bottom:56.25%; height:0; overflow:hidden;">
    <iframe
      src="https://www.youtube.com/embed/jbh717rxfuk"
      style="position:absolute; top:0; left:0; width:100%; height:100%;"
      frameborder="0"
      allowfullscreen>
    </iframe>
  </div>
</div>

---

#### Core Capabilities

**Omnichannel Communication Management**

UCC Applet handles omnichannel conversations and provides a superior customer service experience by allowing users to send and receive messages from multiple messaging platforms in a single, integrated interface. Whether customers reach out via WhatsApp, Telegram, Email, SMS, Facebook Messenger, or Voice calls, all communications flow into UCC where agents can respond efficiently without juggling multiple tools or losing context.

This unified approach ensures consistent service quality across all channels, maintains complete conversation history regardless of platform, and allows supervisors to monitor and manage all customer interactions from one central location. Customers can reach you through their preferred communication method while your team maintains a streamlined, efficient workflow.

**Intelligent Task Management**

Beyond message handling, UCC features a sophisticated task queue system that organizes, prioritizes, and routes work across your organization. Tasks are automatically created from customer interactions and can be assigned to teams or individual agents based on expertise, availability, or customer preference. The system supports both inbound tasks (responding to customer inquiries) and outbound tasks (proactive customer outreach), with specialized queues tailored to different organizational roles—from supervisors who need organization-wide visibility to individual agents who need focused personal workspaces.

**Integrated Commerce Features**

UCC goes beyond communication by providing shopping cart functionality that bridges the gap between customer service and sales. Users can send payment links directly to customers through conversations, streamlining the purchase process and reducing friction. Payment status updates appear automatically in UCC, giving agents real-time visibility into transaction progress and allowing them to provide informed support throughout the customer's buying journey.

**Social Media Management**

The platform includes integrated social media management capabilities, allowing you to create, monitor, and manage content across platforms like Facebook directly from UCC. This eliminates the need to switch between social media management tools and customer service platforms, creating a truly unified communication hub.

**Analytics and Insights**

UCC provides comprehensive reporting and analytics through its dashboard and reporting modules. Supervisors can track key performance metrics, monitor agent productivity, analyze task completion rates, and understand communication volume patterns across channels. These insights enable data-driven decisions about staffing, training needs, and process improvements.

**Real-Time Monitoring**

The Live Dashboard gives supervisors real-time visibility into agent activity, showing who's online, what they're working on, and how long they've been engaged with specific tasks. This immediate visibility enables proactive management, allowing supervisors to identify bottlenecks, redistribute work, or provide support before small issues become major problems.

#### System Architecture

The UCC Applet is built around a cohesive architecture where incoming communications are intelligently managed, routed, and tracked. At its core is the relationship between conversations, sessions, and tasks. When a new conversation is initiated, the system starts one **Session** (a single, continuous interaction) and creates one **Task** in the `Task Queue`. This task is the trackable work item for an agent. When the agent ends the session (e.g., after resolving an inquiry), the task is closed. If a different agent replies to the same conversation after a session is closed, the system initiates a new session and a new task to ensure clear ownership and tracking. This ensures every customer interaction is accounted for as a manageable piece of work.

Underpinning this is a powerful **Contact Merging** algorithm. UCC automatically identifies conversations from different channels (e.g., Messenger, Telegram, Lazada, Email) as belonging to the same user, linking their profiles and consolidating their interaction history into a single, unified view. This provides agents with a true 360-degree view of the customer.

The UCC Applet consists of multiple integrated modules that leverage these core concepts:

-   **Task Queue**: The operational backbone where all work is organized, prioritized, and distributed. Includes specialized views (All Task Queue, Team Task Queue, My Task Queue) for different organizational roles and separate queues for inbound and outbound work.

-   **Inbox**: The primary communication hub where agents view and respond to customer messages across all channels. Provides unified conversation threading, customer detail access, and message composition tools.

-   **Outbound**: Dedicated workspace for managing proactive customer communications, campaign follow-ups, and agent-initiated outreach activities.

-   **Social Media**: Integrated social media management allowing direct posting, editing, and monitoring of social content without leaving UCC.

-   **Dashboard**: Visual analytics hub presenting key performance indicators, trends, and operational metrics through charts and graphs.

-   **Reports**: Detailed, exportable data about task performance and agent productivity, enabling deep analysis and record-keeping.

-   **My Profile**: Personal workspace where agents manage their identity, access permissions, and relationship-building tools like personalized QR codes.

-   **Contacts**: Centralized customer database consolidating all contact information across channels, with import/export capabilities and comprehensive contact management.

-   **Broadcast**: Mass communication tool for sending messages to multiple customers simultaneously, supporting both manual selection and bulk CSV import.

-   **Live Dashboard**: Real-time monitoring interface showing current agent activity, availability status, and active task engagement.

-   **Configurations**: Administrative control center for setting up projects, virtual contacts, teams, agents, automation rules, and other foundational system elements.

-   **Settings**: System-level configurations and preferences.

-   **Personalization**: Customization options allowing users to tailor UCC to their specific workflows and preferences.

#### Who Benefits from UCC?

**For Agents**: UCC eliminates the chaos of managing multiple communication tools, providing a single interface for all customer interactions. Agents can focus on providing great service rather than wrestling with technology.

**For Team Leaders**: UCC provides the visibility and control needed to manage team performance, distribute work effectively, and ensure consistent service quality across all customer touchpoints.

**For Supervisors and Managers**: UCC delivers the analytics, monitoring capabilities, and administrative controls needed to optimize operations, make data-driven decisions, and continuously improve customer service delivery.

**For Organizations**: UCC transforms customer communication from a collection of disconnected channels into a unified, manageable, and measurable system that scales with business growth while maintaining service quality.

#### Getting Started

This documentation will guide you through each module of UCC, explaining features, workflows, and best practices. Whether you're an agent learning to manage customer conversations, a team leader organizing work distribution, or an administrator configuring the system, you'll find detailed explanations and practical guidance for using UCC effectively.

## 1. Overview of WhatsApp Business Set-Up

The following are the steps required to set up the WhatsApp Business App for new customers.

1.  Ask the Manager to permit Wavelet Facebook Business Settings.

2.  Go to [https://developers.facebook.com/apps/?show_reminder=true](https://developers.facebook.com/apps/?show_reminder=true) and create a new app as explained here: Get Started - WhatsApp Cloud API - Documentation - Meta for Developers

3.  Configure the Webhook:
    
    a. Download ngrok
    
    b. Install and run grok on the terminal ⇒ `grok http 80` (windows) or `ngrok http 5000`
    
    c. Copy the link next to "Forwarding". It looks something like `https://3db9-121-121-122-11.ap.ngrok.io`
    
    d. Follow the documentation for Callback URL pass ngrok link and endpoint from the code:  
       `https://3db9-121-121-122-11.ap.ngrok.io/v1/integration/channels/whatsapp/receive`
    
    e. If Webhook is set successfully, you will receive a message.

4.  Add phone numbers:
    
    a. Add the client's phone number here: [https://business.facebook.com/wa/manage/phone-numbers/?business_id=1329448660474352&waba_id=105748575486134](https://business.facebook.com/wa/manage/phone-numbers/?business_id=1329448660474352&waba_id=105748575486134)
    
    b. Do not sign up with the customer's phone number with the WhatsApp Business app. If previously signed up with a customer phone number follow these instructions: [https://developers.facebook.com/docs/whatsapp/embedded-signup/webhooks](https://developers.facebook.com/docs/whatsapp/embedded-signup/webhooks)
    
    c. Phone number will be approved after 6 hours and 1k free messaging limits will be granted depending on the quality rating.
    
## 2. Task Queue

The Task Queue system is the central hub for managing and distributing work across your organization. It provides three different views tailored to different user roles and responsibilities: `All Task Queue`, `Team Task Queue`, and `My Task Queue`.

Tasks can also be categorized into secondary queues (e.g., `Instagram Queue`, `Default Queue`, `Sales Queue`) which are used to group agents based on their expertise or channel focus. This ensures that tasks are routed to the agents best equipped to handle them.

### 2.1 All Task Queue

The All Task Queue provides a comprehensive, organization-wide view of every task in the system. This queue is designed for supervisory and administrative roles who need complete visibility and control over task distribution and management.

#### 2.1.1 All Task Queue -> Listing page

All available tasks details including, their details and assignment status. This centralized view allows supervisors to monitor workload distribution, identify bottlenecks, and ensure tasks are properly assigned across teams and agents.

**Fields Legends:**
-   **Task Code**: Unique identifier that provides a quick reference for searching, referencing in conversations, or tracking specific tasks across the system.
-   **Team Code**: Identifies which team the task is currently assigned to. Tasks can be assigned to either a team (making them visible to all team members) or to a specific agent (making them exclusive to that person). This field will be empty if the task is assigned directly to an agent instead.
-   **Agent Code**: Shows the specific agent the task is assigned to. This field will be empty if the task is assigned to a team instead.
-   **Channel**: Indicates the communication channel through which this task originated or should be handled (WhatsApp, Email, SMS, Telegram Messenger, or Voice-Call). This helps agents understand the context and preferred communication method for the task.

{{< figure src="/images/ucc-applet/e91298aa-3164-438a-9fcf-c479c35a4ea5.jpeg" caption="Fig 1: all-task-queue-listing" >}} 

#### 2.1.2 All Task Queue -> Listing Bulk Actions

When you select one or more tick boxes in the all task queue listing component, the bulk actions dropdown will become active, allowing you to perform operations on all selected tasks at once.

{{< figure src="/images/ucc-applet/db51a49e-fed9-40f6-810d-749d888f77b1.jpeg" caption="Fig 2: all-task-queue-listing-bulk-actions" >}}

**ASSIGN_WORKER Details:**

The assignment process is a two-step workflow that first determines the type of assignment (team or individual), then selects the specific recipient.

After selecting the ASSIGN_WORKER option from dropdown, the WORKER_TYPE field will be displayed where you can choose between "AGENT" (assigning to a specific individual) or "TEAM" (assigning to a group where any member can claim the task).

{{< figure src="/images/ucc-applet/24927c55-9a9c-4557-aaf7-aa9dfd93232b.jpeg" caption="Fig 3: all-task-queue-listing-bulk-actions-ASSIGN_WORKER-part-1" >}}

Once you've selected the worker type, the system will display a list of available agents or teams based on your selection. Choose the appropriate agent or team from this list to complete the assignment. All selected tasks will then be assigned to your chosen worker.

{{< figure src="/images/ucc-applet/5e564a41-338c-463b-9bef-9702dcbbddb5.jpeg" caption="Fig 4: all-task-queue-listing-bulk-actions-ASSIGN_WORKER-part-2" >}}

#### 2.1.3 All Task Queue -> Edit page

The edit page provides detailed control over individual tasks, allowing supervisors to modify task information and manage both the task's status and assignment. (Access this page by clicking on a specific task from the listing page)

{{< figure src="/images/ucc-applet/dda65f67-d7e4-4a50-b09f-315b5337a70a.jpeg" caption="Fig 5: all-task-queue-edit-part-1" >}}

**Task Actions:**

This is where you can mark tasks as complete, cancel them, or move them to different agents or teams.

{{< figure src="/images/ucc-applet/a9de6003-56ff-4454-8b1b-1a69a56e98c2.jpeg" caption="Fig 6: all-task-queue-edit-part-2" >}}

### 2.2 Team Task Queue

The Team Task Queue is designed for collaborative work environments where tasks are assigned to a group rather than specific individuals. This queue shows all tasks currently assigned to teams that the logged-in user is a member of, allowing team members to view available work and claim tasks they're ready to handle.

#### 2.2.1 Team Task Queue -> Listing page

When a task appears in this queue, it means the task is available for any team member to claim and work on.

**Fields Legends:**
-   **Team Code**: Shows which team the task is assigned to. Since this is the Team Task Queue, this will always show your team's code.
-   **Channel**: Indicates the communication channel (WhatsApp, Email, SMS, Telegram Messenger, or Voice-Call) associated with the task, helping you understand the nature and context of the work.

Note that the Agent Code field is not shown in this view because these tasks are assigned to the team as a whole, not to individual agents yet.

{{< figure src="/images/ucc-applet/2f06004a-ba70-4a1d-bcdd-267e6eb3dfd2.jpeg" caption="Fig 7: team-task-queue-listing" >}}

#### 2.2.2 Team Task Queue -> Listing Bulk Actions

Team members can use bulk actions to efficiently claim multiple tasks at once or release tasks they're unable to complete. When tick boxes are selected in the team task queue listing component, the bulk actions dropdown becomes active.

{{< figure src="/images/ucc-applet/e3bb770a-dfdd-4cfb-82de-bad7eb32c6a9.jpeg" caption="Fig 8: team-task-queue-listing-bulk-actions" >}}

#### 2.2.3 Team Task Queue -> Edit page

The team task queue edit page provides a simplified interface focused on task assignment actions. Team members can claim tasks for themselves or release tasks back to the team pool, but cannot modify task details like priority or description (those changes are reserved for supervisory roles in the All Task Queue).

{{< figure src="/images/ucc-applet/2ce26485-ea11-4e93-9338-a95f2de2f8b2.jpeg" caption="Fig 9: team-task-queue-edit" >}}

### 2.3 My Task Queue

The My Task Queue is your personal workspace showing only tasks that have been specifically assigned to you. This is where individual agents manage their day-to-day work, update task progress, and complete their assigned responsibilities.

#### 2.3.1 My Task Queue -> Listing page

This listing page displays all tasks that are currently assigned directly to you, whether they were assigned by a supervisor or claimed by you from a team queue.

**Fields Legends:**
-   **Team Code**: Shows which team this task is associated with, even though it's now assigned to you individually. This provides context about the task's origin.
-   **Channel**: The communication channel (WhatsApp, Email, SMS, Telegram Messenger, or Voice-Call) for the task, indicating how you should interact with the customer or how the task originated.

{{< figure src="/images/ucc-applet/ae77ad3e-7657-4d13-adc5-f3ba9802d00d.jpeg" caption="Fig 10: my-task-queue-listing" >}}

#### 2.3.2 My Task Queue -> Listing Bulk Actions

From your personal queue, you can efficiently update the status of multiple tasks simultaneously. Selecting tick boxes in the my task queue listing activates the bulk actions functionality.

{{< figure src="/images/ucc-applet/9b48ed3e-e61f-4999-9984-cc6f82f4933c.jpeg" caption="Fig 11: my-task-queue-listing-bulk-actions" >}}

#### 2.3.3 My Task Queue -> Edit page

The edit page for your personal tasks provides access to update both the task's status (marking it as in-progress, completed, etc.) and its assignment (releasing it back to the team or unassigning it entirely).

{{< figure src="/images/ucc-applet/fc433fe4-3984-4efb-8575-de979c9f87a9.jpeg" caption="Fig 12: my-task-queue-edit-part" >}}

## 3. Task Queue Outbound

The Task Queue Outbound system manages proactive, agent-initiated tasks where your team reaches out to customers or contacts, as opposed to responding to incoming requests.

These outbound tasks might include:
- follow-up calls
- scheduled check-ins
- marketing campaigns
- renewal reminders
- any scenario where your organization initiates contact.

Like the standard Task Queue, it provides three specialized views tailored to different organizational roles and workflows.

### 3.1 All Task Queue Outbound

The All Task Queue Outbound provides supervisors with complete visibility into all outbound tasks across the organization.

#### 3.1.1 All Task Queue Outbound -> Listing page

The listing page lets Admins, Owners, and Managers view all available outbound tasks, their details, and assignment status.

**Fields Legends:**
-   **Task Code**: A unique identifier that is used when coordinating outbound campaigns or tracking specific customer outreach initiatives.
-   **Team Code**: Indicates which team is responsible for this outbound task. Outbound tasks can be assigned to an entire team (allowing any member to handle the outreach) or to a specific agent (for personalized or relationship-based follow-ups).
-   **Agent Code**: Shows the specific agent assigned to handle this outbound task.
-   **Channel**: Specifies the communication channel to be used for the outbound contact (WhatsApp, Email, SMS, Telegram Messenger, or Voice-Call).

{{< figure src="/images/ucc-applet/8739cf78-a47e-4368-b561-ddd517996343.jpeg" caption="Fig 13: all-task-queue-outbound-listing" >}}

#### 3.1.2 All Task Queue Outbound -> Listing Bulk Actions

Selecting tick boxes in the all task queue outbound listing component activates the bulk actions functionality, allowing you to perform the same operation across multiple outbound tasks at once.

{{< figure src="/images/ucc-applet/516cb2fa-9199-4bb6-abf8-f00934b74b87.jpeg" caption="Fig 14: all-task-queue-listing-bulk-actions" >}}

**ASSIGN_WORKER Details:**

The assignment workflow for outbound tasks follows a two-step process that first identifies whether the work should go to a team or individual, then selects the specific recipient. This flexibility allows you to match outbound tasks with the most appropriate resources.

After selecting the ASSIGN_WORKER option from dropdown, the WORKER_TYPE field will be displayed where "AGENT" or "TEAM" can be selected.

{{< figure src="/images/ucc-applet/2903b931-dc87-4c2a-aabd-13c13d080ddb.jpeg" caption="Fig 15: all-task-queue-listing-bulk-actions-ASSIGN_WORKER-part-1" >}}

Once you've selected the worker type, a filtered list will appear showing only the available agents or teams based on your selection.

{{< figure src="/images/ucc-applet/6c3a7b93-ab25-4ea4-8cbf-3f885e41f9f7.jpeg" caption="Fig 16: all-task-queue-listing-bulk-actions-ASSIGN_WORKER-part-2" >}}

#### 3.1.3 All Task Queue Outbound -> Edit page

Allows supervisors to refine task information and manage both the task's status and assignment as circumstances change or new information becomes available. (Access this page by clicking on a specific outbound task from the listing to make adjustments)

{{< figure src="/images/ucc-applet/43d575f8-e9a3-4fea-b14b-9c3a848695ee.jpeg" caption="Fig 17: all-task-queue-outbound-edit-part-1" >}}

**Task Actions:**

Beyond editing basic details, the Task Actions dropdown provides options to manage the task's lifecycle—marking it complete, canceling it, or reassigning it to different workers.

{{< figure src="/images/ucc-applet/696bd24a-cf60-4cf1-b50a-7c90f84c1751.jpeg" caption="Fig 18: all-task-queue-edit-part-2" >}}

### 3.2 Team Task Queue Outbound

The Team Task Queue Outbound is designed for collaborative outbound work where tasks are assigned to a team rather than specific individuals.

#### 3.2.1 Team Task Queue Outbound -> Listing page

This listing page is where members of a team can view all outbound tasks assigned to their team. When an outbound task appears here, it's available for any team member to claim and complete.

**Fields Legends:**
-   **Task Code**: The unique identifier used for referencing in team discussions or tracking specific customer contacts.
-   **Team Code**: Displays the team responsible for this outbound work.
-   **Channel**: Shows the communication channel (WhatsApp, Email, SMS, Telegram Messenger, or Voice-Call) to be used for the outbound contact.

> [!NOTE]
> the Agent Code field is not displayed in this view because these outbound tasks are assigned to the team as a collective, not to specific individuals yet. Once you claim a task, it will move to your personal My Task Queue Outbound.

{{< figure src="/images/ucc-applet/e586c8cc-5024-4111-8e3a-1ec665ffe4f3.jpeg" caption="Fig 19: team-task-queue-listing" >}}

#### 3.2.2 Team Task Queue Listing Outbound -> Bulk Actions

Team members can use bulk actions to efficiently claim multiple outbound tasks at once or release tasks back to the team pool. Selecting tick boxes activates the bulk actions functionality.

{{< figure src="/images/ucc-applet/1011f5ca-9416-4b7e-8d61-d8b5a006df43.jpeg" caption="Fig 20: team-task-queue-listing-bulk-actions" >}}

#### 3.2.3 Team Task Queue Outbound -> Edit page

Team members can claim outbound tasks for themselves or release them back to the team, but cannot modify task details like priority or description—those administrative functions are reserved for supervisory roles in the All Task Queue Outbound.

{{< figure src="/images/ucc-applet/e1ae74bb-827b-4fb4-b57a-0c4d13b9eaf9.jpeg" caption="Fig 21: team-task-queue-edit" >}}

### 3.3 My Task Queue Outbound

The My Task Queue Outbound is your personal workspace for managing outbound tasks that have been specifically assigned to you. This is where you'll find all the proactive customer contacts you're responsible for.

#### 3.3.1 My Task Queue Outbound -> Listing page

This listing page displays all outbound tasks currently assigned directly to you.

**Fields Legends:**
-   **Task Code**: The unique identifier for the outbound task, used for referencing in notes, logs, or communications about your customer contacts.
-   **Team Code**: This provides context about the broader campaign or initiative the task belongs previously, to gather more information about the task.
-   **Channel**: Identifies the communication channel (WhatsApp, Email, SMS, Telegram Messenger, or Voice-Call) you should use for this outbound contact.

{{< figure src="/images/ucc-applet/35c3a67e-3a94-41e4-85c7-d886d4487233.jpeg" caption="Fig 22: my-task-queue-listing" >}}

#### 3.3.2 My Task Queue Listing Outbound -> Bulk Actions

From your personal outbound queue, you can efficiently update the status of multiple tasks at once. Selecting tick boxes in the my task queue outbound listing activates the bulk actions functionality.

{{< figure src="/images/ucc-applet/1abf02b9-26d0-424b-b0c6-34c5845d956f.jpeg" caption="Fig 23: my-task-queue-listing-bulk-actions" >}}

#### 3.3.3 My Task Queue Outbound -> Edit page

The edit page for your personal outbound tasks provides access to update both the task's status (tracking your progress through the outbound contact process) and its assignment (releasing it if needed).

{{< figure src="/images/ucc-applet/60226237-8106-49e6-9dae-74cf072855db.jpeg" caption="Fig 24: my-task-queue-edit" >}}

## 4. Inbox

The Inbox is the central hub for managing all incoming customer communications across multiple channels. It provides a unified interface where agents can view, respond to, and manage customer conversations, emails, and voice calls in one place.

The Inbox organizes work into three views: 
- All Tasks (for supervisors)
- My Team Tasks (for team-level visibility)
- My Tasks (for individual agents)

### 4.1 Inbox -> All Tasks

The All Tasks view provides supervisors with comprehensive visibility into all incoming communications across the organization.

#### 4.1.1 Inbox -> All Task -> Summary

This page provides a quick view of the total number of open Tasks, Conversations, Emails, and Voice calls. This summary view will only be available to higher-level users such as the Owner and Admin who need organization-wide visibility.

The summary cards display aggregate counts, giving you an at-a-glance understanding of how many active communications require attention across your entire organization.

{{< figure src="/images/ucc-applet/b609c858-3c35-4b26-bd2b-05b68a527937.jpeg" caption="Fig 25: inbox-all-task-summary" >}}

#### 4.1.2 Inbox -> All Task -> Conversation

Each tab—Conversation, Email, and Voice—filters the view to show only tasks from that specific channel.

{{< figure src="/images/ucc-applet/541b33a1-b64b-4499-a0f9-b57e79f998e6.jpeg" caption="Fig 26: inbox-all-task-conversation-email-voice-tab-selection" >}}

##### 4.1.2.1 Inbox -> All Task -> Conversation -> Listing

After the conversation tab is selected, the listing page opens, displaying all active conversation-based communications. This list shows conversations from channels like WhatsApp, Telegram, and other messaging platforms. 

The listing provides supervisors with a bird's-eye view of all ongoing conversations, making it easy to spot conversations that need attention, have been waiting too long, or require reassignment.

{{< figure src="/images/ucc-applet/5bbcad7b-e35e-41c2-b692-2a4f959da693.jpeg" caption="Fig 27: inbox-all-task-conversation-listing" >}}

##### 4.1.2.2 Inbox -> All Task -> Conversation -> Listing Filters

Filters provide powerful tools to narrow down the conversation list and focus on specific subsets of communications.

Filters allow the user to filter conversations via:
-   **Channel**: Filter by communication platform (WHATSAPP, TELEGRAM, etc.) to focus on conversations from specific messaging services.
-   **Sender**: Filter by customer name.
-   **Receiver**: Filter by agent, also used for reviewing an agent's workload or quality.
-   **Virtual Contacts**: Filter by virtual contact numbers or identifiers used in your system for routing and organization.
-   **Date From - Date To**
-   **Task Status**: Filter by status (Active/Inactive/Assigned/Unassigned)

{{< figure src="/images/ucc-applet/3f13dd0e-e1f3-46db-b07f-94f62034c8da.jpeg" caption="Fig 28: inbox-all-task-conversation-listing-filters" >}}

##### 4.1.2.3 Inbox -> All Task -> Conversation Listing -> Sort

You can arrange conversations to surface the most urgent, oldest, or newest items first, helping you manage your workload strategically.

{{< figure src="/images/ucc-applet/f98db44f-b5f3-4e40-8173-9b9922222ada.jpeg" caption="Fig 29: inbox-all-task-conversation-listing-sort" >}}

Users can sort in ASCENDING or DESCENDING order based on various criteria such as date received, customer name, priority level, or last activity timestamp.

{{< figure src="/images/ucc-applet/1d12d08d-6b3b-47af-8f09-efce59063c6e.jpeg" caption="Fig 30: inbox-all-task-conversation-listing-sort-criteria" >}}

##### 4.1.2.4 Inbox -> All Task -> Conversation -> Filter By Project

Project-based filtering allows you to organize and view conversations according to specific business initiatives, campaigns, or organizational structures.

Users can filter conversations by selecting a project from the "Projects" tab and applying the filter. This shows only conversations associated with that particular project, track project-specific customer interactions, or ensure proper handling of specialized inquiries.

{{< figure src="/images/ucc-applet/2ac8f14f-776f-4f65-b5b7-edb6728fff71.jpeg" caption="Fig 31: inbox-all-task-conversation-filter-by-project" >}}

##### 4.1.2.5 Inbox -> All Task -> Conversation -> Messages Listing

When a conversation is selected from the list, the complete message thread appears.

{{< figure src="/images/ucc-applet/02f60dce-af0a-4dcc-8df3-51390ace1dcf.jpeg" caption="Fig 32: inbox-all-task-conversation-messages-listing" >}}

##### 4.1.2.6 Inbox -> All Task -> Conversation -> Messages Session Close

Each session represents a distinct customer query or problem that needs resolution. This ensures proper tracking of individual issues even with long-term customers.

When a customer messages UCC, even if it is an existing customer, a new session is created. Sessions are meant to handle a single query or issue—for example, one session might address a billing question, while a later session handles a technical support request. After the problem is resolved and the customer's needs are met, the session can be closed.

Closing a session signals that the particular issue has been resolved, helps keep active conversations focused on current needs, and maintains clean records of which problems have been addressed. Even after a session is closed, the conversation history remains accessible for future reference.

{{< figure src="/images/ucc-applet/2fa13312-c842-4bb1-b5db-8bd1b020da3d.jpeg" caption="Fig 33: inbox-all-task-conversation-messages-end-session" >}}

##### 4.1.2.7 Inbox -> All Task -> Conversation -> Search By Message Content

The message search functionality allows you to find specific messages quickly by searching for keywords or phrases within the conversation content. The search is typically case-insensitive.

This feature is useful for locating specific discussions, such as:
- finding customer commitments
- referencing previous conversations about products or issues
- researching how similar questions were handled in the past

{{< figure src="/images/ucc-applet/8d5ae225-9f6e-4cb1-a5cc-546fc36b417a.jpeg" caption="Fig 34: inbox-all-task-conversation-search-by-message-content" >}}

##### 4.1.2.8 Inbox -> All Task -> Conversation -> Messages Sending Options

The message composition area provides multiple tools for creating effective customer responses:

1.  **Usual Messager Utilities**: Usual messager utilities that can be found on other apps like: **Emoji picker** and **Add Attachment** 
2.  **Send Predefined Message**: Access templated responses for common scenarios to save time and ensure consistency.
3.  **Send My Name Card Template Message**: Share your agent details with the customer in a formatted card.

{{< figure src="/images/ucc-applet/d628631d-3c88-40ad-9e16-83d64e62aef2.jpeg" caption="Fig 35: inbox-all-task-conversation-messages-sending-options" >}}

##### 4.1.2.9 Inbox -> All Task -> Conversation Messages -> Customer Details

The customer details panel provides a comprehensive view of all available information about the customer you're communicating with. 

By clicking the arrow on the top right corner of the conversation message area, the customer details page will slide open. This page will provide an all-around view of all customer-related information obtained from other applets and integrated systems.

{{< figure src="/images/ucc-applet/794bdad6-3dc5-44ce-a763-075e3426fe44.jpeg" caption="Fig 36: inbox-all-task-conversation-messages-customer-details" >}}

###### 4.1.2.9.1 Inbox -> All Task -> Conversation -> Messages -> Customer Details -> Information -> Personal Info

The tab consolidates all identifying and contact information about the customer, which may include email, phone numbers, the channel from which the conversation originated, and other details from past interactions or integrated CRM systems.

{{< figure src="/images/ucc-applet/6e25ae4e-34f4-4e7d-9b86-475425ff0d12.jpeg" caption="Fig 37: inbox-all-task-conversation-messages-customer-details-information-personal-information" >}}

###### 4.1.2.9.2 Inbox -> All Task -> Conversation -> Messages -> Customer Details -> Information -> Task Assignment

The Task Assignment tab shows any tasks that have been created from the conversation and assigned to an agent. The tab shows which agent or team the task is currently assigned to and allows for on-the-fly changes without leaving the conversation view.

{{< figure src="/images/ucc-applet/206ac5ee-5cca-414f-a2aa-ad2bd9c68fc8.jpeg" caption="Fig 38: inbox-all-task-conversation-messages-customer-details-information-task-assignment" >}}

###### 4.1.2.9.3 Inbox -> All Task -> Conversation -> Messages -> Customer Details -> Information -> Preferred Agent

The Preferred Agent tab displays a relationship-based assignment feature that honors customer preferences for working with specific team members. This feature is particularly valuable in relationship-driven businesses where customers benefit from working with familiar team members who understand their preferences.

The Preferred Agent tab shows the list of agents preferred by the customer. Customers can designate preferred agents by scanning an agent's QR code and selecting them as their preferred contact.

###### 4.1.2.9.4 Inbox -> All Task -> Conversation -> Messages -> Customer Details -> Information -> Conversation History

The Conversation History tab displays all previous conversations from the same user accross all platform. Using the contact merging feature, it identifies and consolidates interactions across different channels into a single chronological view.

{{< figure src="/images/ucc-applet/87fff6ae-a9c8-452d-9e57-8258c7971571.jpeg" caption="Fig 39: inbox-all-task-conversation-messages-customer-details-information-conversation-history" >}}

###### 4.1.2.9.5 Inbox -> All Task -> Conversation -> Messages -> Customer Details -> Tags

Tags allow agents to categorize conversations based on specific topics, urgency, or customer types. Agents can create new tags or select existing ones to label the conversation, making it easier to filter and organize interactions later.

###### 4.1.2.9.6 Inbox -> All Task -> Conversation -> Messages -> Customer Details -> Predefined Messages

The Predefined Messages tab allows agents to quickly use templated messages (e.g., welcome, closing, or thank you messages) to expedite conversations. These messages are configured in the Configuration section and help ensure consistent, efficient communication for common scenarios.

###### 4.1.2.9.7 Inbox -> All Task -> Conversation -> Messages -> Customer Details -> Issue Tracker

The Issue Tracker tab is used to track specific issues that have been created from the conversation. Agents can log details of the problem, assign categories, and attach relevant files, ensuring that customer complaints or technical problems are formally recorded and monitored through to resolution.

###### 4.1.2.9.8 Inbox -> All Task -> Conversation -> Messages -> Customer Details -> Shopping Cart

The Shopping Cart tab facilitates integrated commerce by allowing an agent to create a new shopping cart for the user. It is linked to the Customer and Doc Item applets, allowing agents to select the necessary information to complete the transaction such as:
- branch
- location
- currency
- sales agent
- line items
- delivery details
- settlement options

###### 4.1.2.9.9 Inbox -> All Task -> Conversation -> Messages -> Customer Details -> Transaction History

This tab provides a consolidated view of the customer's past transactions across all platforms (e.g., Shopee, Lazada), merged under a single user contact via contact merging. Agents can view:
- order details
- amounts
- settlement status
- and a list of purchased items.

###### 4.1.2.9.10 Inbox -> All Task -> Conversation -> Messages -> Customer Details -> E-Invoice

With the E-Invoice tab, agents can issue electronic invoices to customers upon request, which is especially relevant since e-invoice regulations became mandatory.

The tab also maintains a history of issued e-invoices, allowing agents to reuse a customer's saved tax information for future invoices without having to ask for it again.

This history includes the validation status of each document with relevant authorities (e.g., IRB), confirming whether it has been successfully accepted.

###### 4.1.2.9.11 Inbox -> All Task -> Conversation -> Messages -> Customer Details -> Product

Linked to the doc item applet, the Product tab displays products from marketplace platforms (like Shopee or Lazada). It allows agents to browse and share product links directly with customers. 
<!-- If a requested item is out of stock, agents can use this feature to find and recommend similar available products, sending a shareable link to encourage purchase completion. -->

###### 4.1.2.9.12 Inbox -> All Task -> Conversation -> Messages -> Customer Details -> Marketing (Vouchers)

Under the Marketing tab, agents can access and share vouchers with customers. This feature supports syncing vouchers from marketplace platforms (like Shopee). Vouchers can be synced manually by the agent or updated automatically by a background process.

###### 4.1.2.9.13 Inbox -> All Task -> Conversation -> Messages -> Customer Details -> Agent Handover

The Agent Handover feature links the UCC module with the Bot Applet. It is used when a conversation is initiated (e.g., via web chat) but no agents are available; agents can later use the bot feature to send an automated reply via email, ensuring the customer's inquiry is acknowledged even during off-hours or busy periods.

### 4.2 My Team Tasks

My Team Tasks shows all conversations assigned to the team(s) you belong to. Think of it as your team’s shared inbox. Everyone on the team can see the same incoming work here.

This view works exactly like All Tasks (section 4.1), but it only shows items for your team. The features—sorting, filtering, conversation view, customer details, message tools, and assignment controls—are all the same.

<!-- Use this page when:
- you want to see everything your team is responsible for,
- you want to pick up new conversations to work on,
- you need to help teammates manage the team's workload. -->

When you claim a conversation from My Team Tasks, it moves into your personal My Tasks list.

### 4.3 My Tasks

My Tasks is your personal inbox. It shows only the conversations and work items assigned directly to you.

This view behaves exactly like All Tasks (section 4.1), but filtered to your own assignments. All the same tools are available: viewing conversations, checking customer details, sending replies, closing sessions, searching messages, and updating task assignments.

## 5. Outbound

The Outbound section handles messages sent from your organization to customers, instead of replies to incoming messages. This includes activities like:
- follow-up messages,
- scheduled notifications,
- marketing or promotional messages,
- proactive check-ins.

Outbound has the same structure as Inbox:
- **All Tasks** – supervisors see all outbound work,
- **My Team Tasks** – team-level outbound messages,
- **My Tasks** – your personal outbound assignments.

All features work the same way as described in section 4. The only difference is the purpose: Outbound tasks start from your organization rather than the customer.

## 6. Social Media

The Social Media section lets you manage your organization’s social media accounts directly inside UCC. You can create posts, update content, respond to engagement (where supported), and switch between different managed platforms without leaving the system.

Each tab at the top represents a social platform. Selecting a tab switches the view to that platform’s management tools.

{{< figure src="/images/ucc-applet/894b85a5-06ff-466a-8280-d4cc89680389.jpeg" caption="Fig 40: Social Media Navigation Tab" >}}

### 6.1 Facebook

The Facebook integration lets you manage your organization’s Facebook pages without opening Facebook. You can:
- view all pages you have access to,
- review all posts,
- create new posts,
- edit or delete existing posts.

{{< figure src="/images/ucc-applet/5b560785-5dcf-44ba-a20c-fa124d91d8ec.jpeg" caption="Fig 41: social-media-facebook-page-listing" >}}

**Post Listing:**

You will see a list of pages you have permission to manage. Select a page to open its content.

{{< figure src="/images/ucc-applet/e422c4be-44d5-482f-9604-fb0cabfc8d5e.jpeg" caption="Fig 42: social-media-facebook-page-post-listing" >}}

**Post Create:**

You can create new posts directly from UCC and publish the post directly to Facebook.

{{< figure src="/images/ucc-applet/60acc284-be89-4834-89bc-d938beb5e572.jpeg" caption="Fig 43: social-media-facebook-page-create-post" >}}

**Post Edit or Delete:**

You can edit a post to update its text or media. Saving pushes the changes to Facebook.
If you no longer want the post visible, delete it.

{{< figure src="/images/ucc-applet/47597bf1-de06-4f40-893f-9713d349a1d3.jpeg" caption="Fig 44: social-media-facebook-page-update-delete-post" >}}

The Save and Discard options give you control over whether your changes go live, allowing you to review edits before committing them.

{{< figure src="/images/ucc-applet/1c1f603d-fb78-4cd5-b604-379b7bac70fe.jpeg" caption="Fig 45: social-media-facebook-page-post-update-discard" >}}

### 6.2 YouTube

(This part is under development)

The YouTube integration is currently being developed and will follow similar patterns to the Facebook integration, allowing you to manage your organization's YouTube channel, videos, and engagement from within UCC. Check back for updates as this feature becomes available.

## 7. UCC Dashboard

The UCC Dashboard provides a comprehensive, visual overview of your organization's communication and task management performance. 
This analytics hub transforms raw operational data into actionable insights through 
- charts
- graphs
- key metrics

The dashboard is date-driven, allowing you to analyze performance over specific time periods.
<!-- 
The dashboard displays multiple categories of information including task completion rates, response times, channel activity distribution, agent performance metrics, and workload trends. -->

{{< figure src="/images/ucc-applet/0ce1b2a2-479e-46b7-ad61-f9d8ef426bd1.jpeg" caption="Fig 46: dashboard-listing-1" >}}

The dashboard continues with additional metrics and visualizations that provide deeper insights into specific operational areas. These might include time-series graphs showing how metrics change over your selected period, comparison charts showing performance across different teams or channels, and summary cards highlighting critical KPIs.

{{< figure src="/images/ucc-applet/17846fd8-2697-4784-8537-afcda92c9f1d.jpeg" caption="Fig 47: dashboard-listing-2" >}}

Further down the dashboard, you'll find more specialized analytics that help you understand nuanced aspects of your operations—such as peak activity times, channel preferences, task type distributions, or agent utilization patterns.

{{< figure src="/images/ucc-applet/fd1873e7-a5e9-44a8-b6fb-7fd460c24c48.jpeg" caption="Fig 48: dashboard-listing-3" >}}

## 8. Reports

The Reports section provides detailed, exportable data about your UCC operations. While the dashboard offers visual analytics, reports give you the raw data and detailed breakdowns needed for deeper analysis, record-keeping, or compliance.

### 8.1 Task Report

The Task Report provides a comprehensive, line-by-line breakdown of all tasks handled through UCC during your specified time period.

The task report shows a summary of the most important information for tasks in UCC, presenting each task as a separate row with key attributes. To generate the report, "Date From" and "Date To" need to be selected to define your analysis period, and the filter button needs to be clicked.

{{< figure src="/images/ucc-applet/c3ec35f6-3da8-4866-b602-30a3aed7631c.jpeg" caption="Fig 49: report-task-report-listing-1" >}}

The task report shows the following information for each task:
-   **Target Type**: Indicates the communication medium for the task—Conversation (messaging platforms), Email (email communications), or Voice (phone calls).
-   **Channel**: Specifies the exact platform or service used, such as WHATSAPP, TELEGRAM, EMAIL, SMS, or VOICE.
-   **Total Duration**: Shows how long the task has lasted from creation to completion (or current time if ongoing).

This comprehensive information can be exported using the "Export CSV" button.

{{< figure src="/images/ucc-applet/4067eff8-5efe-41a6-aeab-d715f4ea70be.jpeg" caption="Fig 50: report-task-report-listing-2" >}}

### 8.2 Agent Report

The Agent Report provides a performance-focused view of individual agent activity and productivity. 

The Agent report shows a summary of agent activities in UCC, with each agent represented as a row containing their key performance metrics. To generate the report, "Date From" and "Date To" need to be selected and the filter button needs to be clicked.

{{< figure src="/images/ucc-applet/2671ff99-ef7c-4164-9940-8ad2ac28d4a6.jpeg" caption="Fig 51: report-agent-report-listing-1" >}}

The report can also be exported as CSV using the "Export CSV" button.

{{< figure src="/images/ucc-applet/967b836a-6abd-412b-8ff0-538a1394f048.jpeg" caption="Fig 52: report-agent-report-listing-2" >}}

## 9. My Profile

The My Profile section is your personal workspace for managing your agent identity, preferences, and customer relationship tools within UCC.

### 9.1 About Me

The About Me page provides some quick view information regarding your agent profile, such as the virtual contacts (phone numbers, messaging accounts, or communication channels) you have access to for communicating with customers.

{{< figure src="/images/ucc-applet/f6d1faec-bd36-4620-84b6-a82bf21cc194.jpeg" caption="Fig 53: profile-about-me" >}}

### 9.2 QR Code

The QR Codes tab generates a unique QR code specific to you which you can share with customers who want to specifically be helped by you and designate you as their preferred agent.

> [!NOTE]
> This personal QR code for designating a preferred agent is distinct from the QR codes generated in the `Configuration` section, which are used on product packaging to initiate new support conversations.

{{< figure src="/images/ucc-applet/99ed0bcd-4e1e-451d-a297-b5883c2ac5ce.jpeg" caption="Fig 54: profile-qr-code-preferred-agent" >}}

## 10. Contacts

The Contacts section is your centralized customer database within UCC, consolidating all contact information gathered across all communication channels. This unified repository ensures agents have access to up-to-date customer information and provides a foundation for personalized service.

### 10.1 Contacts -> Listing

The contact listing page is the main view for browsing and searching your customer database. It shows all contacts accumulated by UCC, including those created automatically from new conversations, imported, or manually added by agents.

{{< figure src="/images/ucc-applet/23d97877-0a52-4990-8b54-90fec9fcb59a.jpeg" caption="Fig 55: contact-listing" >}}

### 10.2 Contacts -> Listing Export As CSV

The export functionality allows you to generate a CSV file of your contact database for use in external tools, marketing campaigns, or for backup.

{{< figure src="/images/ucc-applet/95e6194e-5a5f-4c14-adad-7114f99ca4c0.jpeg" caption="Fig 56: contact-listing-export-excel-csv" >}}

### 10.3 Contacts -> Create (Manual Creation)

You can proactively add customers to the database by creating contacts manually. You can enter comprehensive details, including:

-   **First Name** & **Last Name**
-   **Contact Name**: The customer's username or phone number.
-   **Channel**: The customer's communication platform (e.g., SMS, WHATSAPP).
-   **Phone number**
-   **Reference**: The platform-specific identifier (e.g., Telegram handle).
-   **Email**
-   **Description**

{{< figure src="/images/ucc-applet/33f85d62-f031-404c-a2ca-8dd03a5e72fd.jpeg" caption="Fig 57: contact-create-manual-creation" >}}

### 10.4 Contacts -> Create (Import Excel CSV)

Bulk contact import enables you to add large numbers of contacts efficiently from a CSV file. 

On the "Import File" tab, you can upload a CSV file. The system will process each row to create a new contact, and will provide feedback on the import status, flagging any rows with errors.

{{< figure src="/images/ucc-applet/6851f654-4c2d-4485-a4ee-e75c75b37d03.jpeg" caption="Fig 58: contact-create-import-csv" >}}

### 10.5 Contacts -> Update

You can update a contact's information to keep the database accurate. Editable fields include the Contact Name, Channel, and Reference. 

{{< figure src="/images/ucc-applet/5ccca342-bc9b-436f-8fc8-d780df769e88.jpeg" caption="Fig 59: contact-update" >}}

### 10.6 Contacts -> Delete

The delete function permanently removes a contact record from UCC. 

{{< figure src="/images/ucc-applet/e9fc3ee7-f1ee-4ac7-9c78-51081afacf29.jpeg" caption="Fig 60: contact-delete" >}}

## 11. Broadcast

The Broadcast feature enables mass communication with multiple customers simultaneously, which is essential for marketing campaigns, service announcements, or other important notifications.

### Simple Broadcast (Advanced Broadcasts can be sent from Digital Marketing Applet)

This interface is designed for straightforward, one-time message distribution. The workflow guides you through the following steps:

{{< figure src="/images/ucc-applet/7bab0cae-bdd6-4d79-99cc-d9ce2a340438.jpeg" caption="Fig 61: broadcast-main" >}}

**1. Select a Channel**: Choose the communication platform for the broadcast (e.g., WhatsApp, SMS). The choice of channel affects deliverability, cost, and rich media support.

{{< figure src="/images/ucc-applet/921beaf1-d6d2-48ba-b19a-83a545ff626a.jpeg" caption="Fig 62: broadcast-main-select-channel" >}}

**2. Select an Endpoint**: An endpoint is the specific sending identity (e.g., company phone number) that the broadcast will come from.

{{< figure src="/images/ucc-applet/7f76c17d-8358-4f2e-9ea3-913bda26a0d4.jpeg" caption="Fig 63: broadcast-main-select-endpoint" >}}

**3. Select Recipients**: You have two options for selecting contacts:
-   **Manual Selection**: For smaller, targeted broadcasts, select contacts one by one from your UCC contact database.
-   **Import CSV**: For larger campaigns, import a CSV file of contacts. This is useful when working with segmented lists, such as those exported from the Contacts page.

{{< figure src="/images/ucc-applet/3316b124-d5ce-423d-a3fe-03867674cccd.jpeg" caption="Fig 64: broadcast-main-select-contact-one-by-one" >}}

**4. Compose and Send**: Select the message type (e.g., plain text, image, document) and compose your content. Clicking "Send Message" initiates the broadcast to all selected recipients.

{{< figure src="/images/ucc-applet/e62a205e-6882-449b-bef1-54e78ea30ff4.jpeg" caption="Fig 65: broadcast-main-import-contact" >}}

{{< figure src="/images/ucc-applet/7b30c7b4-38cc-42d9-8a3f-50dd319fe6a6.jpeg" caption="Fig 66: broadcast-main-select-messagetype" >}}

## 12. Live Dashboard

The Live Dashboard provides real-time visibility into agent activity, enabling supervisors to monitor operations as they happen, identify agents who need support, ensure adequate coverage, and make immediate adjustments to resource allocation. 

{{< figure src="/images/ucc-applet/85c5123b-d7a3-494f-bc3f-e754f09e85c7.jpeg" caption="Fig 67: live-dashboard-base-view" >}}

### 12.1 Online Agents

The Online Agents page presents a real-time view of all agents who are currently performing tasks such as answering conversations (messaging interactions), handling emails, or receiving voice calls and for how long.

The interface includes powerful grouping functionality. By dragging the column headers highlighted in red to the grouping area, users can reorganize the data according to the contents of the dragged column.

{{< figure src="/images/ucc-applet/c05c001a-dcdb-4fd7-a8d7-8d5d12377fdc.jpeg" caption="Fig 68: live-dashboard-online-agents-modified-view-step-one" >}}

In the screenshot below, the data has been grouped based on agent after the Agent column header was dragged to the grouping box above. This creates an organized view showing each agent and all their current tasks nested beneath them, making it easy to see each agent's current workload at a glance.

{{< figure src="/images/ucc-applet/b0c672b0-ffb8-4c5f-b0eb-dfc0450b5f7e.jpeg" caption="Fig 69: live-dashboard-online-agents-modified-view-step-two" >}}

### 12.2 All Agents

The All Agents view shows every agent in the organization, together with their availability status:
- **AVAILABLE**
- **OFFLINE**

It also shows each agent’s last online time.

Grouping

This page also supports grouping. Drag any column header to the grouping bar to reorganize the list—for example, grouping by status to see all available and offline agents together.

{{< figure src="/images/ucc-applet/650eb7f1-e7a2-4e9a-9ca8-f134e7722c88.jpeg" caption="Fig 70: live-dashboard-all-agents-modified-view-step-one" >}}

The screenshot below shows the result after grouping—agents are organized in a hierarchical view that makes patterns immediately visible.

{{< figure src="/images/ucc-applet/fe06ff40-d1fd-4bd3-88e4-5ed5af02c07e.jpeg" caption="Fig 71: live-dashboard-all-agents-modified-view-step-two" >}}

## 13. Task Router

The Task Router menu provides a technical view into the lifecycle of tasks as they move through the UCC system. It is separated into two main components representing live operations and historical records:

-   **Router Queue**: This contains all **live, ongoing, and open tasks**. When a new task is created, it appears here while waiting to be handled or while actively in progress. It represents the current, real-time state of work in the system.

-   **Tasks**: This serves as a comprehensive **history table** for all tasks that have been completed or closed. Once a task is finished, it moves from the `Router Queue` to this `Tasks` list. Here, you can review the full history of past work and audit the entire lifecycle of any interaction.

## 14. Configuration

The Configuration menu allows administrators and managers to set up the foundational elements of the UCC system, ensuring it aligns with organizational workflows and campaigns.

### 14.1 Projects

Projects are used to create and organize work around specific initiatives, such as marketing campaigns (e.g., "CNY Campaign"). You can assign specific agents and settlement details to a project, and configure settings like payment gateways and other links specific to that initiative.

### 14.2 Virtual Contacts

Virtual Contacts are used to create profiles and define the communication endpoints for your organization, such as WhatsApp, SMS, Voice, Email, and the web chat public profile. This setup defines how customers can reach you and identifies the "sender" identity for your outbound communications.

### 14.3 Teams and Skills

This section allows you to create teams and define the skills associated with them, which is critical for intelligent routing.
*   **Teams**: Allows for the creation of teams, where each team can include multiple agents.
*   **Skills**: Used to create skills that can be linked with a team. This allows the system to assign conversations that require specific skills to the most appropriate team.

### 14.4 Agents

The Agent menu is used for onboarding new customer support agents into the UCC system. This involves setting up their profiles and assigning them to relevant teams, projects, and skills.

### 14.5 Predefined Messages

This is the configuration area where administrators can set up various Predefined Messages to standardize agent responses and improve efficiency. These message templates (e.g., for sending a thank you message after a purchase) are then made available to agents within the conversation interface.

### 14.6 QR Code

This is used to generate QR codes that can be attached to parcels or product packaging. When a customer scans the QR code (often linked to a keyword), it can initiate a conversation (primarily via the web chat feature) with the appropriate context, such as "Product Inquiry" or "Returns".

> [!NOTE]
> This QR code for product and parcel inquiries is distinct from the personal QR codes found in the `My Profile` section, which are used by customers to select a preferred agent.

### 14.7 Other Configurations

-   **Tasks**: Configure task-related settings, workflows, and parameters that govern how inbound work is created, assigned, and managed through the system.
-   **Outbound Tasks**: Set up configurations specific to outbound task management, including settings for proactive outreach campaigns and agent-initiated customer contacts.
-   **Automation Rule**: Define automated behaviors that trigger based on specific conditions, helping streamline operations by automatically routing work, sending notifications, or taking actions without manual intervention.
-   **Rule**: Configure conditional logic that determines when automation should occur, what criteria must be met, and how the system should evaluate different scenarios.
-   **Action**: Set up specific actions that the system can take automatically, such as assigning tasks, sending messages, updating statuses, or triggering workflows.

## Ready to Transform Your Customer Service?

The UCC Applet is more than just a messaging platform - it's a complete customer engagement solution that will revolutionize how you interact with customers.

{{< cards >}}
  <!-- {{< card link="/applications/unified-contact-center" title="Learn More" subtitle="Explore UCC capabilities" >}} -->
  {{< card link="/demos-resources" title="Watch Demo" subtitle="See UCC in action" >}}
  {{< card link="mailto:sales@bigledger.com" title="Contact Sales" subtitle="Get personalized pricing" >}}
{{< /cards >}}