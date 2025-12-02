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

The UCC Applet is built around a cohesive architecture where incoming communications are intelligently managed, routed, and tracked. At its core is the relationship between conversations, sessions, and tasks. When a customer initiates a conversation, the system starts a **Session**, which represents a single, continuous interaction. This session automatically generates a **Task** in the `Task Queue`, creating a trackable work item for an agent. When the agent resolves the inquiry and closes the conversation, the session ends, and the corresponding task is completed. This ensures every customer interaction is accounted for as a manageable piece of work.

Underpinning this is a powerful **Contact Merging** algorithm. UCC automatically identifies and links contacts from the same person across different channels (e.g., WhatsApp, Facebook, Email), consolidating their interaction history into a single, unified profile. This provides agents with a true 360-degree view of the customer.

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

The Task Queue system is the central hub for managing and distributing work across your organization. It provides three different views tailored to different user roles and responsibilities, ensuring that each team member can focus on the tasks most relevant to them.

### 2.1 All Task Queue

The All Task Queue provides a comprehensive, organization-wide view of every task in the system. This queue is designed for supervisory and administrative roles who need complete visibility and control over task distribution and management.

#### 2.1.1 All Task Queue -> Listing page

The listing page is where Admins, Owners, and Managers can view all available tasks, their details and assignment status. This centralized view allows supervisors to monitor workload distribution, identify bottlenecks, and ensure tasks are properly assigned across teams and agents.

**Fields Legends:**
-   **Task Code**: A brief, unique identifier that provides a quick reference for the task. This code can be used for searching, referencing in conversations, or tracking specific tasks across the system.
-   **Team Code**: Identifies which team the task is currently assigned to. Tasks can be assigned to either a team (making them visible to all team members) or to a specific agent (making them exclusive to that person). This field will be empty if the task is assigned directly to an agent instead.
-   **Agent Code**: Shows the specific agent the task is assigned to. This field will be empty if the task is assigned to a team instead.
-   **Channel**: Indicates the communication channel through which this task originated or should be handled (WhatsApp, Email, SMS, Telegram Messenger, or Voice-Call). This helps agents understand the context and preferred communication method for the task.

{{< figure src="/images/ucc-applet/e91298aa-3164-438a-9fcf-c479c35a4ea5.jpeg" caption="Fig 1: all-task-queue-listing" >}} 

#### 2.1.2 All Task Queue -> Listing Bulk Actions

Bulk actions allow supervisors to efficiently manage multiple tasks simultaneously, saving time when similar operations need to be performed across several tasks. When you select one or more tick boxes in the all task queue listing component, the bulk actions dropdown will become active, allowing you to perform operations on all selected tasks at once.

**Available Bulk Actions:**
-   **ASSIGN_WORKER**: Allows you to assign multiple tasks to a specific agent or team in one operation. This is useful when distributing a batch of related tasks or balancing workload across your team.
-   **COMPLETE**: Marks selected tasks as completed, removing them from active queues. Use this when tasks have been finished but weren't marked complete by the assigned agent.
-   **CANCEL**: Cancels selected tasks when they are no longer needed or relevant. Canceled tasks are removed from active work queues.
-   **UNASSIGN**: Removes the current assignment from selected tasks, returning them to an unassigned state where they can be picked up by any available team member or reassigned as needed.

{{< figure src="/images/ucc-applet/db51a49e-fed9-40f6-810d-749d888f77b1.jpeg" caption="Fig 2: all-task-queue-listing-bulk-actions" >}}

**ASSIGN_WORKER Details:**

The assignment process is a two-step workflow that first determines the type of assignment (team or individual), then selects the specific recipient.

After selecting the ASSIGN_WORKER option from dropdown, the WORKER_TYPE field will be displayed where you can choose between "AGENT" (assigning to a specific individual) or "TEAM" (assigning to a group where any member can claim the task).

{{< figure src="/images/ucc-applet/24927c55-9a9c-4557-aaf7-aa9dfd93232b.jpeg" caption="Fig 3: all-task-queue-listing-bulk-actions-ASSIGN_WORKER-part-1" >}}

Once you've selected the worker type, the system will display a list of available agents or teams based on your selection. Choose the appropriate agent or team from this list to complete the assignment. All selected tasks will then be assigned to your chosen worker.

{{< figure src="/images/ucc-applet/5e564a41-338c-463b-9bef-9702dcbbddb5.jpeg" caption="Fig 4: all-task-queue-listing-bulk-actions-ASSIGN_WORKER-part-2" >}}

#### 2.1.3 All Task Queue -> Edit page

The edit page provides detailed control over individual tasks, allowing supervisors to modify task information and manage both the task's status and assignment. This page is accessed by clicking on a specific task from the listing page.

**Details That Can Be Updated:**
-   **Priority**
-   **Description**

{{< figure src="/images/ucc-applet/dda65f67-d7e4-4a50-b09f-315b5337a70a.jpeg" caption="Fig 5: all-task-queue-edit-part-1" >}}

**Task Actions:**

Beyond editing basic details, the Task Actions dropdown provides options to change the task's status or reassign it to different workers. This is where you can mark tasks as complete, cancel them, or move them to different agents or teams.

"Task Status" and "Task Assignment" can be updated by clicking the "TASK ACTIONS" dropdown, which reveals the available actions for the current task state.

{{< figure src="/images/ucc-applet/a9de6003-56ff-4454-8b1b-1a69a56e98c2.jpeg" caption="Fig 6: all-task-queue-edit-part-2" >}}

### 2.2 Team Task Queue

The Team Task Queue is designed for collaborative work environments where tasks are assigned to a group rather than specific individuals. This queue shows all tasks currently assigned to teams that the logged-in user is a member of, allowing team members to view available work and claim tasks they're ready to handle.

#### 2.2.1 Team Task Queue -> Listing page

This listing page is where members of a team can view all tasks assigned to their team. When a task appears in this queue, it means the task is available for any team member to claim and work on. This creates a flexible work distribution model where agents can self-assign based on their availability and expertise.

**Fields Legends:**
-   **Task Code**: A brief, unique identifier for quick reference and tracking of the task.
-   **Team Code**: Shows which team the task is assigned to. Since this is the Team Task Queue, this will always show your team's code.
-   **Channel**: Indicates the communication channel (WhatsApp, Email, SMS, Telegram Messenger, or Voice-Call) associated with the task, helping you understand the nature and context of the work.

Note that the Agent Code field is not shown in this view because these tasks are assigned to the team as a whole, not to individual agents yet.

{{< figure src="/images/ucc-applet/2f06004a-ba70-4a1d-bcdd-267e6eb3dfd2.jpeg" caption="Fig 7: team-task-queue-listing" >}}

#### 2.2.2 Team Task Queue -> Listing Bulk Actions

Team members can use bulk actions to efficiently claim multiple tasks at once or release tasks they're unable to complete. When tick boxes are selected in the team task queue listing component, the bulk actions dropdown becomes active.

**Available Bulk Actions:**
-   **ASSIGN_TO_ME**: Allows you to claim multiple team tasks simultaneously, assigning them to yourself. This is useful when you're ready to take on several related tasks or have capacity to handle multiple items from the queue.
-   **UNASSIGN**: Releases selected tasks back to the team pool, making them available for other team members to claim. Use this if you've claimed tasks but are unable to complete them due to workload or other priorities.

{{< figure src="/images/ucc-applet/e3bb770a-dfdd-4cfb-82de-bad7eb32c6a9.jpeg" caption="Fig 8: team-task-queue-listing-bulk-actions" >}}

#### 2.2.3 Team Task Queue -> Edit page

The team task queue edit page provides a simplified interface focused on task assignment actions. Team members can claim tasks for themselves or release tasks back to the team pool, but cannot modify task details like priority or description (those changes are reserved for supervisory roles in the All Task Queue).

**Actions Available:**
-   **UNASSIGN**
-   **ASSIGN_TO_ME**

"Task Assignment" can be updated by clicking the "TASK ACTIONS" dropdown, which shows the assignment options available for this task.

{{< figure src="/images/ucc-applet/2ce26485-ea11-4e93-9338-a95f2de2f8b2.jpeg" caption="Fig 9: team-task-queue-edit" >}}

### 2.3 My Task Queue

The My Task Queue is your personal workspace showing only tasks that have been specifically assigned to you. This is where individual agents manage their day-to-day work, update task progress, and complete their assigned responsibilities.

#### 2.3.1 My Task Queue -> Listing page

This listing page displays all tasks that are currently assigned directly to you, whether they were assigned by a supervisor or claimed by you from a team queue. This focused view helps you concentrate on your specific responsibilities without distraction from other team members' work.

**Fields Legends:**
-   **Task Code**: The unique identifier for the task, useful for referencing in communications or searching.
<!-- -   **Team Code**: Shows which team this task is associated with, even though it's now assigned to you individually. This provides context about the task's origin. -->
-   **Channel**: The communication channel (WhatsApp, Email, SMS, Telegram Messenger, or Voice-Call) for the task, indicating how you should interact with the customer or how the task originated.

{{< figure src="/images/ucc-applet/ae77ad3e-7657-4d13-adc5-f3ba9802d00d.jpeg" caption="Fig 10: my-task-queue-listing" >}}

#### 2.3.2 My Task Queue -> Listing Bulk Actions

From your personal queue, you can efficiently update the status of multiple tasks simultaneously. This is particularly useful at the end of a work session when you need to mark several completed tasks or need to adjust the status of multiple related items. Selecting tick boxes in the my task queue listing activates the bulk actions functionality.

**Available Bulk Actions:**
-   **IN-PROGRESS**
-   **COMPLETED**
-   **CANCELED**
-   **UNASSIGNED**

{{< figure src="/images/ucc-applet/9b48ed3e-e61f-4999-9984-cc6f82f4933c.jpeg" caption="Fig 11: my-task-queue-listing-bulk-actions" >}}

#### 2.3.3 My Task Queue -> Edit page

The edit page for your personal tasks provides access to update both the task's status (marking it as in-progress, completed, etc.) and its assignment (releasing it back to the team or unassigning it entirely). This gives you control over managing your individual workload while working through assigned tasks.

"Task Status" and "Task Assignment" can be updated by clicking the "TASK ACTIONS" dropdown, which reveals the available actions you can take on this task.

{{< figure src="/images/ucc-applet/fc433fe4-3984-4efb-8575-de979c9f87a9.jpeg" caption="Fig 12: my-task-queue-edit-part" >}}

## 3. Task Queue Outbound

The Task Queue Outbound system manages proactive, agent-initiated tasks where your team reaches out to customers or contacts, as opposed to responding to incoming requests. These outbound tasks might include follow-up calls, scheduled check-ins, marketing campaigns, renewal reminders, or any scenario where your organization initiates contact. Like the standard Task Queue, it provides three specialized views tailored to different organizational roles and workflows.

### 3.1 All Task Queue Outbound

The All Task Queue Outbound provides supervisors with complete visibility into all outbound tasks across the organization. This comprehensive view enables Admins, Owners, and Managers to orchestrate outbound campaigns, monitor progress, and ensure efficient distribution of proactive outreach work.

#### 3.1.1 All Task Queue Outbound -> Listing page

The listing page lets Admins, Owners, and Managers view all available outbound tasks, their details, and assignment status. This centralized dashboard allows leadership to oversee all outbound initiatives, track which campaigns or follow-ups are in progress, and identify any outbound work that needs attention or reassignment.

**Fields Legends:**
-   **Task Code**: A unique identifier that provides quick reference for the outbound task. This code is particularly useful when coordinating outbound campaigns or tracking specific customer outreach initiatives.
-   **Team Code**: Indicates which team is responsible for this outbound task. Outbound tasks can be assigned to an entire team (allowing any member to handle the outreach) or to a specific agent (for personalized or relationship-based follow-ups). This field remains empty if the task is assigned directly to an individual agent.
-   **Agent Code**: Shows the specific agent assigned to handle this outbound task. When outbound work requires a personal touch or specific expertise, tasks can be assigned directly to individuals. This field is empty if the task is assigned to a team instead.
-   **Channel**: Specifies the communication channel to be used for the outbound contact (WhatsApp, Email, SMS, Telegram Messenger, or Voice-Call). This helps agents prepare appropriately and use the right tools for their outreach.

{{< figure src="/images/ucc-applet/8739cf78-a47e-4368-b561-ddd517996343.jpeg" caption="Fig 13: all-task-queue-outbound-listing" >}}

#### 3.1.2 All Task Queue Outbound -> Listing Bulk Actions

Bulk actions enable supervisors to efficiently manage large volumes of outbound tasks simultaneously, which is particularly valuable when coordinating campaigns or redistributing workload across teams. Selecting tick boxes in the all task queue outbound listing component activates the bulk actions functionality, allowing you to perform the same operation across multiple outbound tasks at once.

**Available Bulk Actions:**
-   **ASSIGN_WORKER**
-   **COMPLETE**
-   **CANCEL**
-   **UNASSIGN**

{{< figure src="/images/ucc-applet/516cb2fa-9199-4bb6-abf8-f00934b74b87.jpeg" caption="Fig 14: all-task-queue-listing-bulk-actions" >}}

**ASSIGN_WORKER Details:**

The assignment workflow for outbound tasks follows a two-step process that first identifies whether the work should go to a team or individual, then selects the specific recipient. This flexibility allows you to match outbound tasks with the most appropriate resources.

After selecting the ASSIGN_WORKER option from dropdown, the WORKER_TYPE field will be displayed where "AGENT" or "TEAM" can be selected. Choose "AGENT" when the outbound task requires specific expertise or relationship continuity with a customer, or choose "TEAM" when any qualified team member can handle the outreach.

{{< figure src="/images/ucc-applet/2903b931-dc87-4c2a-aabd-13c13d080ddb.jpeg" caption="Fig 15: all-task-queue-listing-bulk-actions-ASSIGN_WORKER-part-1" >}}

Once you've selected the worker type, a filtered list will appear showing only the available agents or teams based on your selection. Choose the appropriate recipient from this list, and all selected outbound tasks will be assigned accordingly. This streamlined process makes it easy to distribute large volumes of outbound work efficiently.

{{< figure src="/images/ucc-applet/6c3a7b93-ab25-4ea4-8cbf-3f885e41f9f7.jpeg" caption="Fig 16: all-task-queue-listing-bulk-actions-ASSIGN_WORKER-part-2" >}}

#### 3.1.3 All Task Queue Outbound -> Edit page

The edit page provides detailed control over individual outbound tasks, allowing supervisors to refine task information and manage both the task's status and assignment. Access this page by clicking on a specific outbound task from the listing to make adjustments as circumstances change or new information becomes available.

**Details That Can Be Updated:**
-   **Priority**
-   **Description**

{{< figure src="/images/ucc-applet/43d575f8-e9a3-4fea-b14b-9c3a848695ee.jpeg" caption="Fig 17: all-task-queue-outbound-edit-part-1" >}}

**Task Actions:**

Beyond editing basic details, the Task Actions dropdown provides options to manage the task's lifecycle—marking it complete, canceling it, or reassigning it to different workers. This centralized control ensures supervisors can respond quickly to changing circumstances in outbound campaigns.

"Task Status" and "Task Assignment" can be updated by clicking the "TASK ACTIONS" dropdown, which reveals all available management actions for the current outbound task.

{{< figure src="/images/ucc-applet/696bd24a-cf60-4cf1-b50a-7c90f84c1751.jpeg" caption="Fig 18: all-task-queue-edit-part-2" >}}

### 3.2 Team Task Queue Outbound

The Team Task Queue Outbound is designed for collaborative outbound work where tasks are assigned to a team rather than specific individuals. This queue displays all outbound tasks assigned to teams that the logged-in user belongs to, creating a shared pool of outbound work that team members can claim based on their availability and readiness to make customer contacts.

#### 3.2.1 Team Task Queue Outbound -> Listing page

This listing page is where members of a team can view all outbound tasks assigned to their team. When an outbound task appears here, it's available for any team member to claim and complete. This flexible model allows agents to self-select outbound work when they have capacity, are in the right mindset for proactive outreach, or have relevant expertise for specific types of customer contact.

**Fields Legends:**
-   **Task Code**: The unique identifier for the outbound task, useful for referencing in team discussions or tracking specific customer contacts.
-   **Team Code**: Displays which team is responsible for this outbound work. Since this is the Team Task Queue Outbound, this will always show your team's identifier.
-   **Channel**: Shows the communication channel (WhatsApp, Email, SMS, Telegram Messenger, or Voice-Call) to be used for the outbound contact. This helps you prepare with the appropriate tools and mindset for the type of customer interaction.

Note that the Agent Code field is not displayed in this view because these outbound tasks are assigned to the team as a collective, not to specific individuals yet. Once you claim a task, it will move to your personal My Task Queue Outbound.

{{< figure src="/images/ucc-applet/e586c8cc-5024-4111-8e3a-1ec665ffe4f3.jpeg" caption="Fig 19: team-task-queue-listing" >}}

#### 3.2.2 Team Task Queue Listing Outbound -> Bulk Actions

Team members can use bulk actions to efficiently claim multiple outbound tasks at once or release tasks back to the team pool. This is particularly useful when preparing for a focused outbound calling session or when redistributing work within the team. Selecting tick boxes in the team task queue outbound listing component activates the bulk actions functionality.

**Available Bulk Actions:**
-   **ASSIGN_TO_ME**
-   **UNASSIGN**

{{< figure src="/images/ucc-applet/1011f5ca-9416-4b7e-8d61-d8b5a006df43.jpeg" caption="Fig 20: team-task-queue-listing-bulk-actions" >}}

#### 3.2.3 Team Task Queue Outbound -> Edit page

The team task queue outbound edit page provides a focused interface for managing task assignments. Team members can claim outbound tasks for themselves or release them back to the team, but cannot modify task details like priority or description—those administrative functions are reserved for supervisory roles in the All Task Queue Outbound.

**Actions Available:**
-   **UNASSIGN**
-   **ASSIGN_TO_ME**

"Task Assignment" can be updated by clicking the "TASK ACTIONS" dropdown, which displays the assignment management options available for this outbound task.

{{< figure src="/images/ucc-applet/e1ae74bb-827b-4fb4-b57a-0c4d13b9eaf9.jpeg" caption="Fig 21: team-task-queue-edit" >}}

### 3.3 My Task Queue Outbound

The My Task Queue Outbound is your personal workspace for managing outbound tasks that have been specifically assigned to you. This is where you'll find all the proactive customer contacts you're responsible for, whether they were assigned directly by a supervisor or claimed by you from your team's queue. This focused view helps you organize and execute your outbound work efficiently.

#### 3.3.1 My Task Queue Outbound -> Listing page

This listing page displays all outbound tasks currently assigned directly to you. This personalized view allows you to plan your outbound work, prioritize which contacts to make first, and track your progress through your assigned customer outreach activities without distraction from other team members' tasks.

**Available Fields:**
-   **Task Code**: The unique identifier for the outbound task, useful for referencing in notes, logs, or communications about your customer contacts.
-   **Team Code**: Shows which team this outbound task originated from, even though it's now your individual responsibility. This provides context about the broader campaign or initiative the task belongs to.
-   **Channel**: Identifies the communication channel (WhatsApp, Email, SMS, Telegram Messenger, or Voice-Call) you should use for this outbound contact. This helps you prepare mentally and practically for the type of customer interaction ahead.

{{< figure src="/images/ucc-applet/35c3a67e-3a94-41e4-85c7-d886d4487233.jpeg" caption="Fig 22: my-task-queue-listing" >}}

#### 3.3.2 My Task Queue Listing Outbound -> Bulk Actions

From your personal outbound queue, you can efficiently update the status of multiple tasks at once. This streamlines your workflow when managing numerous customer contacts, allowing you to quickly mark progress as you work through your outbound assignments. Selecting tick boxes in the my task queue outbound listing activates the bulk actions functionality.

**Available Bulk Actions:**
-   **IN-PROGRESS**: Updates the task status to indicate you're actively working on the outbound contact. This might mean you're preparing for the call, have attempted contact, or are in the middle of a multi-step outreach process. This status signals to supervisors that the task is being actively handled.
-   **COMPLETED**: Marks outbound tasks as finished after you've successfully completed the customer contact and any required follow-up actions. Completed tasks are removed from your active queue, allowing you to focus on remaining outbound work.
-   **CANCELED**: Updates the task status to canceled when the outbound contact is no longer needed. This might occur if the customer was reached through another channel, if they've opted out of contact, or if the reason for outreach is no longer relevant.
-   **UNASSIGNED**: Removes your assignment from the outbound tasks, returning them to an unassigned state where they can be reassigned. Use this when you're unable to complete the outbound contact—perhaps due to lacking necessary information, needing specialized expertise, or if another team member has a better relationship with the customer.

{{< figure src="/images/ucc-applet/1abf02b9-26d0-424b-b0c6-34c5845d956f.jpeg" caption="Fig 23: my-task-queue-listing-bulk-actions" >}}

#### 3.3.3 My Task Queue Outbound -> Edit page

The edit page for your personal outbound tasks provides access to update both the task's status (tracking your progress through the outbound contact process) and its assignment (releasing it if needed). This gives you the tools to manage your individual outbound workload effectively while maintaining flexibility to handle changing circumstances.

"Task Status" and "Task Assignment" can be updated by clicking the "TASK ACTIONS" dropdown, which reveals all the management actions available for this outbound task, allowing you to mark progress or transfer responsibility as needed.

{{< figure src="/images/ucc-applet/60226237-8106-49e6-9dae-74cf072855db.jpeg" caption="Fig 24: my-task-queue-edit" >}}

## 4. Inbox

The Inbox is the central hub for managing all incoming customer communications across multiple channels. It provides a unified interface where agents can view, respond to, and manage customer conversations, emails, and voice calls in one place. The Inbox organizes work into three views: All Tasks (for supervisors), My Team Tasks (for team-level visibility), and My Tasks (for individual agents), ensuring everyone has access to the communications relevant to their role.

### 4.1 Inbox -> All Tasks

The All Tasks view provides supervisors with comprehensive visibility into all incoming communications across the organization. This high-level perspective enables Admins and Owners to monitor overall communication volume, identify bottlenecks, ensure timely responses, and maintain quality standards across all customer interactions.

#### 4.1.1 Inbox -> All Task -> Summary

This page provides a quick view of the total number of open Tasks, Conversations, Emails, and Voice calls. It serves as a real-time dashboard showing the current workload across all communication channels, helping supervisors make informed decisions about resource allocation and priority management. This summary view will only be available to higher-level users such as the Owner and Admin who need organization-wide visibility.

The summary cards display aggregate counts, giving you an at-a-glance understanding of how many active communications require attention across your entire organization. This helps you quickly identify if any particular channel is experiencing high volume that might need additional support.

{{< figure src="/images/ucc-applet/b609c858-3c35-4b26-bd2b-05b68a527937.jpeg" caption="Fig 25: inbox-all-task-summary" >}}

#### 4.1.2 Inbox -> All Task -> Conversation

The All-Task page provides tabbed navigation allowing you to switch between different communication types. Each tab—Conversation, Email, and Voice—filters the view to show only tasks from that specific channel, making it easy to focus on particular communication methods or review activity across different platforms.

Selecting each of the tabs in the All-Task page will lead to Conversation/Email/Voice Tasks, displaying the relevant communications and allowing you to manage them appropriately based on their channel-specific characteristics.

{{< figure src="/images/ucc-applet/541b33a1-b64b-4499-a0f9-b57e79f998e6.jpeg" caption="Fig 26: inbox-all-task-conversation-email-voice-tab-selection" >}}

##### 4.1.2.1 Inbox -> All Task -> Conversation -> Listing

After the conversation tab is selected, the listing page opens, displaying all active conversation-based communications. This list shows conversations from channels like WhatsApp, Telegram, and other messaging platforms. Each row represents a distinct customer conversation, showing key information like the customer name, last message timestamp, assigned agent, and conversation status.

The listing provides supervisors with a bird's-eye view of all ongoing conversations, making it easy to spot conversations that need attention, have been waiting too long, or require reassignment. The left sidebar shows the conversation list while maintaining space for the message thread to appear on the right when a conversation is selected.

{{< figure src="/images/ucc-applet/5bbcad7b-e35e-41c2-b692-2a4f959da693.jpeg" caption="Fig 27: inbox-all-task-conversation-listing" >}}

##### 4.1.2.2 Inbox -> All Task -> Conversation -> Listing Filters

Filters provide powerful tools to narrow down the conversation list and focus on specific subsets of communications. This is especially valuable when managing high volumes of conversations or when you need to find specific customer interactions quickly.

Filters allow the user to filter conversations via:
-   **Channel**: Filter by communication platform (WHATSAPP, TELEGRAM, etc.) to focus on conversations from specific messaging services.
-   **Sender**: Filter by customer name to find all conversations with a particular customer or locate specific individuals.
-   **Receiver**: Filter by agent to see all conversations assigned to a particular team member, useful for reviewing an agent's workload or quality.
-   **Virtual Contacts**: Filter by virtual contact numbers or identifiers used in your system for routing and organization.
-   **Date From - Date To**: Filter conversations by date range to review activity during specific time periods or find historical conversations.
-   **Task Status**: Filter by status (Active/Inactive/Assigned/Unassigned) to focus on conversations requiring immediate attention or those awaiting assignment.

These filters can be combined to create very specific views—for example, showing all unassigned WhatsApp conversations from the last 24 hours that need immediate attention.

{{< figure src="/images/ucc-applet/3f13dd0e-e1f3-46db-b07f-94f62034c8da.jpeg" caption="Fig 28: inbox-all-task-conversation-listing-filters" >}}

##### 4.1.2.3 Inbox -> All Task -> Conversation Listing -> Sort

Sorting capabilities allow you to organize conversations in ways that match your workflow priorities. You can arrange conversations to surface the most urgent, oldest, or newest items first, helping you manage your workload strategically.

Users can sort in ASCENDING or DESCENDING order based on various criteria such as date received, customer name, priority level, or last activity timestamp. For example, sorting by oldest date first helps ensure no conversation waits too long for a response, while sorting by newest first helps you catch and respond to just-arrived messages promptly.

{{< figure src="/images/ucc-applet/f98db44f-b5f3-4e40-8173-9b9922222ada.jpeg" caption="Fig 29: inbox-all-task-conversation-listing-sort" >}}

The sort criteria dropdown provides multiple options for organizing your conversation list, allowing you to quickly change your view based on what's most important at the moment.

{{< figure src="/images/ucc-applet/1d12d08d-6b3b-47af-8f09-efce59063c6e.jpeg" caption="Fig 30: inbox-all-task-conversation-listing-sort-criteria" >}}

##### 4.1.2.4 Inbox -> All Task -> Conversation -> Filter By Project

Project-based filtering allows you to organize and view conversations according to specific business initiatives, campaigns, or organizational structures. This is particularly valuable for organizations managing multiple products, services, or customer segments through different projects.

Users can filter conversations by selecting a project from the "Projects" tab and applying the filter. This shows only conversations associated with that particular project, helping you focus on work related to specific business areas, track project-specific customer interactions, or ensure proper handling of specialized inquiries.

{{< figure src="/images/ucc-applet/2ac8f14f-776f-4f65-b5b7-edb6728fff71.jpeg" caption="Fig 31: inbox-all-task-conversation-filter-by-project" >}}

##### 4.1.2.5 Inbox -> All Task -> Conversation -> Messages Listing

When you select a conversation from the list, the complete message thread appears on the right side of the screen, showing the full history of communication between the customer and your organization. This dual-pane interface allows you to browse conversations on the left while reading the detailed message history on the right.

By selecting one conversation, all messages in the conversation will be displayed on the right in chronological order, with the most recent messages at the bottom. Scrolling up in the message pane will load older messages, allowing you to review the complete conversation history. This is particularly useful for understanding context, reviewing what was previously discussed, or catching up on conversations handled by other team members.

{{< figure src="/images/ucc-applet/02f60dce-af0a-4dcc-8df3-51390ace1dcf.jpeg" caption="Fig 32: inbox-all-task-conversation-messages-listing" >}}

##### 4.1.2.6 Inbox -> All Task -> Conversation -> Messages Session Close

Sessions provide a structured way to organize customer interactions around specific issues or inquiries. Each session represents a distinct customer query or problem that needs resolution. This session-based approach helps maintain clarity in customer relationships and ensures proper tracking of individual issues even with long-term customers.

When a customer messages UCC, even if it is an existing customer, a new session is created. Sessions are meant to handle a single query or issue—for example, one session might address a billing question, while a later session handles a technical support request. After the problem is resolved and the customer's needs are met, the session can be closed.

Closing a session signals that the particular issue has been resolved, helps keep active conversations focused on current needs, and maintains clean records of which problems have been addressed. Even after a session is closed, the conversation history remains accessible for future reference.

{{< figure src="/images/ucc-applet/2fa13312-c842-4bb1-b5db-8bd1b020da3d.jpeg" caption="Fig 33: inbox-all-task-conversation-messages-end-session" >}}

##### 4.1.2.7 Inbox -> All Task -> Conversation -> Search By Message Content

The message search functionality allows you to find specific conversations or messages quickly by searching for keywords or phrases within the conversation content. This is invaluable when you need to locate a particular discussion, reference something mentioned earlier, or find conversations where specific topics were discussed.

Users can type in parts of a text to search for particular messages. The search is typically case-insensitive and will highlight or filter to show messages containing your search terms. In the picture below, "Hello" is inputted as an example, which would find all messages containing that greeting.

This feature is especially useful when dealing with high volumes of conversations, trying to find specific customer commitments, locating previous discussions of particular products or issues, or researching how similar questions were handled in the past.

{{< figure src="/images/ucc-applet/8d5ae225-9f6e-4cb1-a5cc-546fc36b417a.jpeg" caption="Fig 34: inbox-all-task-conversation-search-by-message-content" >}}

##### 4.1.2.8 Inbox -> All Task -> Conversation -> Messages Sending Options

The message composition area provides multiple tools for creating rich, effective customer responses. These options allow you to communicate in ways that best suit the situation, whether that's a quick text reply, a templated response, or a message with supporting documents.

There are several sending options marked from 1-5 in the picture below:
1.  **Emoji picker**: Add emojis to make your messages more friendly and expressive. Emojis can help convey tone, show empathy, or make communications feel more personal and approachable.
2.  **Send Message**: The primary send button that delivers your typed message to the customer. Click this after composing your response to send it through the conversation channel.
3.  **Send Predefined Message**: Access templated responses for common scenarios. This saves time when handling frequent questions and ensures consistent messaging across your team.
4.  **Send My Name Card Template Message**: Share your contact information or agent details with the customer in a formatted way, making it easy for customers to reach you or know who they're speaking with.
5.  **Add Attachment**: Include files, images, documents, or other media with your message. This is useful for sharing screenshots, documents, product images, or any supporting materials that help resolve the customer's inquiry.

{{< figure src="/images/ucc-applet/d628631d-3c88-40ad-9e16-83d64e62aef2.jpeg" caption="Fig 35: inbox-all-task-conversation-messages-sending-options" >}}

##### 4.1.2.9 Inbox -> All Task -> Conversation Messages -> Customer Details

The customer details panel provides a comprehensive view of all available information about the customer you're communicating with. This centralized information hub pulls data from across your organization's systems, giving agents the context they need to provide informed, personalized support.

By clicking the arrow on the top right corner of the conversation message area, the customer details page will slide open. This page will provide an all-around view of all customer-related information obtained from other applets and integrated systems, including personal information, purchase history, previous interactions, preferences, and more. This 360-degree customer view helps agents understand who they're talking to, anticipate needs, and provide support that takes into account the customer's complete relationship with your organization.

{{< figure src="/images/ucc-applet/794bdad6-3dc5-44ce-a763-075e3426fe44.jpeg" caption="Fig 36: inbox-all-task-conversation-messages-customer-details" >}}

###### 4.1.2.9.1 Inbox -> All Task -> Conversation -> Messages -> Customer Details -> Information -> Personal Info

The personal information tab consolidates all identifying and contact information about the customer. This foundational data helps agents confirm they're speaking with the right person, address customers appropriately, and access alternative contact methods if needed.

The personal information tab shows customer information such as name, email, phone numbers, company affiliation, job title, and other demographic or identifying details to help agents confirm the customer's identity and personalize their interactions. This information might come from CRM systems, previous registrations, or information the customer has provided during past interactions.

Having this information readily available eliminates the need to repeatedly ask customers for basic details and allows agents to jump straight into addressing the customer's current needs.

{{< figure src="/images/ucc-applet/6e25ae4e-34f4-4e7d-9b86-475425ff0d12.jpeg" caption="Fig 37: inbox-all-task-conversation-messages-customer-details-information-personal-information" >}}

###### 4.1.2.9.2 Inbox -> All Task -> Conversation -> Messages -> Customer Details -> Information -> Task Assignment

The Task Assignment information tab displays the current assignment status of the conversation task and provides quick access to change assignments when needed. This is particularly useful when supervisors need to redistribute work, assign conversations to specialists, or balance workload across the team.

The Task Assignment information tab shows which agent or team the conversation task is currently assigned to and allows quick changing of assignment without navigating away from the conversation. You can reassign conversations on the fly when you notice they need specialized expertise, when an agent is overwhelmed, or when you want to match customers with specific team members who have handled their previous inquiries.

{{< figure src="/images/ucc-applet/206ac5ee-5cca-414f-a2aa-ad2bd9c68fc8.jpeg" caption="Fig 38: inbox-all-task-conversation-messages-customer-details-information-task-assignment" >}}

###### 4.1.2.9.3 Inbox -> All Task -> Conversation -> Messages -> Customer Details -> Information -> Preferred Agent

The Preferred Agent tab displays a relationship-based assignment feature that honors customer preferences for working with specific team members. This helps build stronger customer relationships by allowing customers to consistently work with agents they trust and have rapport with.

The Preferred Agent tab shows the list of agents preferred by the customer. Customers can designate preferred agents by scanning an agent's QR code and selecting them as their preferred contact. When a customer has indicated preferred agents, the system can route their inquiries to these individuals when possible, ensuring continuity and leveraging existing relationships.

This feature is particularly valuable in relationship-driven businesses where customers benefit from working with familiar team members who understand their history and preferences.

###### 4.1.2.9.4 Inbox -> All Task -> Conversation -> Messages -> Customer Details -> Information -> Conversation History

The Conversation History tab provides a chronological view of all past interactions with the customer across all channels and time periods. This complete history helps agents understand the customer's journey, identify patterns, and provide support that considers the full context of the customer relationship.

The Conversation History tab shows all previous conversations, inquiries, and interactions the customer has had with your organization. This might include past questions, resolved issues, feedback provided, or any other communications. Having this historical context allows agents to reference previous discussions ("As we talked about last month..."), avoid asking customers to repeat information, identify recurring issues that might need deeper attention, and provide a seamless experience even when different agents handle different conversations.

{{< figure src="/images/ucc-applet/87fff6ae-a9c8-452d-9e57-8258c7971571.jpeg" caption="Fig 39: inbox-all-task-conversation-messages-customer-details-information-task-assignment" >}}

###### 4.1.2.9.5 Inbox -> All Task -> Conversation -> Messages -> Customer Details -> Tags

Tags allow agents to categorize conversations based on specific topics, urgency, or customer types. Agents can create new tags or select existing ones to label the conversation, making it easier to filter and organize interactions later.

###### 4.1.2.9.6 Inbox -> All Task -> Conversation -> Messages -> Customer Details -> Issue Tracker

The Issue Tracker tab allows agents to log and track specific problems or requests raised during the conversation. Agents can view details of the issue, assign categories, and attach relevant files, ensuring that customer complaints or technical problems are formally recorded and monitored.

###### 4.1.2.9.7 Inbox -> All Task -> Conversation -> Messages -> Customer Details -> Shopping Cart

The Shopping Cart tab facilitates integrated commerce by allowing agents to create orders directly within the UCC interface. Linked to the Customer and Doc Item applets, agents can select the branch, location, currency, and sales agent, and then add items to the cart. Agents can also configure delivery details and settlement options for the order, streamlining the entire sales process from selection to fulfillment within the conversation.

###### 4.1.2.9.8 Inbox -> All Task -> Conversation -> Messages -> Customer Details -> Transaction History

This tab provides a consolidated view of the customer's past transactions across all platforms. Using contact merging, the system identifies the user and displays their order details, amounts, and settlement status from various sources (e.g., Shopee, Lazada), giving agents a complete picture of the customer's purchasing behavior.

###### 4.1.2.9.9 Inbox -> All Task -> Conversation -> Messages -> Customer Details -> E-Invoice

The E-Invoice tab enables agents to issue electronic invoices to customers upon request. Agents can input transaction details (e.g., invoice number, amount, date, PIN) or use a snapshot of a receipt to generate the invoice. The tab also maintains a history of issued e-invoices, allowing agents to reuse a customer's saved tax information for future invoices without having to ask for it again. This history includes the validation status of each document with relevant authorities (e.g., IRB), confirming whether it has been successfully accepted.

###### 4.1.2.9.10 Inbox -> All Task -> Conversation -> Messages -> Customer Details -> Product

The Product tab allows agents to browse and share product links directly with customers. If a requested item is out of stock, agents can use this feature to find and recommend similar available products, sending a shareable link to the customer to encourage purchase completion.

###### 4.1.2.9.11 Inbox -> All Task -> Conversation -> Messages -> Customer Details -> Marketing (Vouchers)

Under the Marketing tab, agents can access and share vouchers with customers. This feature supports syncing vouchers from marketplace platforms (like Shopee). Vouchers can be synced manually by the agent using the "Sync Voucher" option, or they can be updated automatically by a background process that runs at regular intervals. Agents can use these vouchers to resolve complaints, such as delivery issues or faulty products, by offering discounts or compensation directly through the chat.

###### 4.1.2.9.12 Inbox -> All Task -> Conversation -> Messages -> Customer Details -> Agent Handover

The Agent Handover feature integrates with the Bot Applet to manage conversations when agents are unavailable. If a customer initiates a chat (e.g., via Web Chat) and receives no response, agents can use this menu to trigger an automated bot reply via email, ensuring the customer's inquiry is acknowledged even during busy periods.

### 4.2 My Team Tasks

My Team Tasks provides a team-level view of incoming communications, showing all inbox items assigned to your team. This view is functionally the same as the All Tasks view described above (section 4.1), but filtered to show only communications assigned to teams you're a member of.

This focused view allows team members to see all incoming work their team is responsible for without seeing communications assigned to other teams. It provides the same listing, filtering, sorting, and conversation management capabilities as the All Tasks view, but with a team-specific scope. Team members can claim conversations from this queue to move them into their personal My Tasks queue.

### 4.3 My Tasks

My Tasks provides your personal inbox view, showing only communications that have been specifically assigned to you. This focused workspace is functionally the same as the All Tasks view described above (section 4.1), but filtered to show exclusively your individual assignments.

This personalized view eliminates distractions from other team members' work and allows you to concentrate on the customer communications you're directly responsible for. It includes all the same features for viewing conversations, accessing customer details, sending messages, and managing communication threads, but scoped to only your assigned work. This is where individual agents spend most of their time handling customer inquiries and maintaining ongoing conversations.

## 5. Outbound

The Outbound section manages proactive communications initiated by your organization rather than responding to incoming customer inquiries. This is where you handle outreach activities like follow-up messages, marketing campaigns, proactive notifications, or scheduled check-ins with customers.

Outbound (All tasks, My Team Tasks, and My Task) are functionally the same as "Inbox" (refer to section 4 above). The same interface, tools, and capabilities are available for managing outbound communications as are used for inbox items. The key difference is that these conversations represent messages sent by users outside of direct response to customer inquiries—they carry messages initiated by your organization.

The Outbound section uses the same three-tier structure: All Tasks for supervisors to oversee all outbound communications, My Team Tasks for team-level visibility into team outbound work, and My Tasks for individual agents to manage their personal outbound assignments.

## 6. Social Media

The Social Media section provides integrated management of your organization's social media presence, allowing you to create, monitor, and respond to content across social platforms directly from within the UCC system. This unified interface eliminates the need to switch between multiple social media platforms and tools, streamlining your social media management workflow.

Using the top navigation tabs, users can move between accessing different social media integrations. Each tab represents a different social platform where your organization has a presence, allowing quick switching between managing different social channels.

{{< figure src="/images/ucc-applet/894b85a5-06ff-466a-8280-d4cc89680389.jpeg" caption="Fig 40: Social Media Navigation Tab" >}}

### 6.1 Facebook

The Facebook integration allows you to manage your organization's Facebook pages and content directly from UCC. This includes viewing all your Facebook pages, creating new posts, editing existing content, and monitoring engagement—all without leaving the UCC platform.

This page provides a list of all the Facebook pages of the business the user has access to. If your organization manages multiple Facebook pages (perhaps for different brands, locations, or departments), they'll all be listed here. You can select any page to begin managing its content and engagement.

{{< figure src="/images/ucc-applet/5b560785-5dcf-44ba-a20c-fa124d91d8ec.jpeg" caption="Fig 41: social-media-facebook-page-listing" >}}

**Post Listing:**

Once you select a Facebook page, you'll see all the posts associated with that page. This unified view brings your Facebook content into the UCC interface for easy management.

Clicking the Facebook page opens up the listing page showing all posts connected to the page from Facebook. This includes posts you've created through UCC as well as any posts created directly on Facebook. The listing typically shows post content, engagement metrics (likes, comments, shares), posting date, and status, giving you a complete overview of your Facebook page activity.

{{< figure src="/images/ucc-applet/e422c4be-44d5-482f-9604-fb0cabfc8d5e.jpeg" caption="Fig 42: social-media-facebook-page-post-listing" >}}

**Post Create:**

Creating new Facebook posts directly from UCC streamlines your content publishing workflow. You can compose posts, add rich media, and publish to Facebook without switching platforms, making it easier to maintain consistent social media activity.

The highlighted area in the screenshot below shows the text region where the contents of a new post can be typed. Once you've written your post content, clicking the submit button will simultaneously create the post in both UCC (for your records) and publish it to Facebook (making it visible to your audience).

The attachment icons below the text region allow you to enrich your posts with visual content. You can upload Images to make posts more engaging, add Videos for dynamic content, or include Links that will appear as formatted link previews. These media attachments are processed and published to Facebook along with your text content.

{{< figure src="/images/ucc-applet/60acc284-be89-4834-89bc-d938beb5e572.jpeg" caption="Fig 43: social-media-facebook-page-create-post" >}}

**Post Edit or Delete:**

The ability to edit or remove posts after publishing gives you flexibility to correct errors, update information, or remove content that's no longer relevant. These changes sync with Facebook, ensuring consistency between UCC and your live social media presence.

On the right-hand side of each post, as shown in the screenshot below, the Edit and Delete buttons provide post management options. The Edit button allows you to modify post content and media, while the Delete button removes the post entirely from both UCC and Facebook.

When you click Edit, the text region containing the contents of the post will become editable again. You can make any necessary changes to the text or media. After making modifications, click the "Save" button to publish your changes to Facebook, or click the "Discard" button to abandon your edits and keep the post as it was.

{{< figure src="/images/ucc-applet/47597bf1-de06-4f40-893f-9713d349a1d3.jpeg" caption="Fig 44: social-media-facebook-page-update-delete-post" >}}

The Save and Discard options give you control over whether your changes go live, allowing you to review edits before committing them.

{{< figure src="/images/ucc-applet/1c1f603d-fb78-4cd5-b604-379b7bac70fe.jpeg" caption="Fig 45: social-media-facebook-page-post-update-discard" >}}

### 6.2 YouTube

(This part is under development)

The YouTube integration is currently being developed and will follow similar patterns to the Facebook integration, allowing you to manage your organization's YouTube channel, videos, and engagement from within UCC. Check back for updates as this feature becomes available.

## 7. UCC Dashboard

The UCC Dashboard provides a comprehensive, visual overview of your organization's communication and task management performance. This analytics hub transforms raw operational data into actionable insights through charts, graphs, and key metrics, helping supervisors and managers understand trends, identify issues, and make data-driven decisions about resource allocation and process improvements.

The dashboard is date-driven, allowing you to analyze performance over specific time periods. To use the dashboard, "Date From" and "Date To" need to be selected to define your analysis period, and the filter button needs to be clicked to load the data. Based on the selected date duration, the dashboard will populate with various performance metrics, activity summaries, and trend visualizations that reflect your organization's operations during that timeframe.

The dashboard displays multiple categories of information including task completion rates, response times, channel activity distribution, agent performance metrics, and workload trends. Some key figures that will load up are highlighted in the subsequent screenshots, showing how data is visualized across different chart types and metric cards.

{{< figure src="/images/ucc-applet/0ce1b2a2-479e-46b7-ad61-f9d8ef426bd1.jpeg" caption="Fig 46: dashboard-listing-1" >}}

The dashboard continues with additional metrics and visualizations that provide deeper insights into specific operational areas. These might include time-series graphs showing how metrics change over your selected period, comparison charts showing performance across different teams or channels, and summary cards highlighting critical KPIs.

{{< figure src="/images/ucc-applet/17846fd8-2697-4784-8537-afcda92c9f1d.jpeg" caption="Fig 47: dashboard-listing-2" >}}

Further down the dashboard, you'll find more specialized analytics that help you understand nuanced aspects of your operations—such as peak activity times, channel preferences, task type distributions, or agent utilization patterns. This comprehensive view helps you spot opportunities for improvement and validate the effectiveness of process changes.

{{< figure src="/images/ucc-applet/fd1873e7-a5e9-44a8-b6fb-7fd460c24c48.jpeg" caption="Fig 48: dashboard-listing-3" >}}

## 8. Reports

The Reports section provides detailed, exportable data about your UCC operations. While the dashboard offers visual analytics, reports give you the raw data and detailed breakdowns needed for deeper analysis, record-keeping, compliance, or integration with external business intelligence tools. Reports can be filtered by date range and exported for use in spreadsheets or other analytical software.

### 8.1 Task Report

The Task Report provides a comprehensive, line-by-line breakdown of all tasks handled through UCC during your specified time period. This detailed view allows you to analyze individual task performance, identify patterns in task handling, track specific customer interactions, and understand how different types of tasks flow through your system.

The task report shows a summary of the most important information for tasks in UCC, presenting each task as a separate row with key attributes. To generate the report, "Date From" and "Date To" need to be selected to define your analysis period, and the filter button needs to be clicked. Based on the selected date duration, data will be loaded up showing all tasks that were active, created, or modified during that timeframe.

{{< figure src="/images/ucc-applet/c3ec35f6-3da8-4866-b602-30a3aed7631c.jpeg" caption="Fig 49: report-task-report-listing-1" >}}

The task report shows the following information for each task:
-   **Target Type**: Indicates the communication medium for the task—Conversation (messaging platforms), Email (email communications), or Voice (phone calls). This helps you understand the distribution of work across different communication channels.
-   **Channel**: Specifies the exact platform or service used, such as WHATSAPP, TELEGRAM, EMAIL, SMS, or VOICE. This granular detail helps you understand which specific channels are most active.
-   **Total Duration**: Shows how long the task has lasted from creation to completion (or current time if ongoing).

This comprehensive information can be exported using the "Export CSV" button, allowing you to download the complete dataset for analysis in Excel, import into business intelligence tools, create custom reports, or maintain records for compliance purposes.

{{< figure src="/images/ucc-applet/4067eff8-5efe-41a6-aeab-d715f4ea70be.jpeg" caption="Fig 50: report-task-report-listing-2" >}}

### 8.2 Agent Report

The Agent Report provides a performance-focused view of individual agent activity and productivity. This report is essential for understanding how agents are performing, identifying training opportunities, recognizing top performers, and ensuring workload is balanced appropriately across your team.

The Agent report shows a summary of agent activities in UCC, with each agent represented as a row containing their key performance metrics. To generate the report, "Date From" and "Date To" need to be selected to define the period you want to analyze, and the filter button needs to be clicked. Based on the selected date duration, data will be loaded up showing agent performance during that timeframe.

{{< figure src="/images/ucc-applet/2671ff99-ef7c-4164-9940-8ad2ac28d4a6.jpeg" caption="Fig 51: report-agent-report-listing-1" >}}

The agent report shows the following information for each agent:
-   **Completed Tasks**
-   **Canceled Tasks**
-   **In-progress Tasks**
-   **Average Duration**

The report can also be exported as CSV using the "Export CSV" button, enabling further analysis in spreadsheet software, integration with HR or performance management systems, or archival for performance review purposes.

{{< figure src="/images/ucc-applet/967b836a-6abd-412b-8ff0-538a1394f048.jpeg" caption="Fig 52: report-agent-report-listing-2" >}}

## 9. My Profile

The My Profile section is your personal workspace for managing your agent identity, preferences, and customer relationship tools within UCC. This area provides information about your role, access permissions, and specialized features that help you build stronger customer relationships through personalized service.

### 9.1 About Me

The About Me page serves as your personal dashboard, providing quick-reference information about your agent profile, permissions, and team associations. This helps you understand your role within the organization and what resources you have access to.

The About Me page provides some quick view information regarding your agent profile, such as the virtual contacts (phone numbers, messaging accounts, or communication channels) you have access to for communicating with customers, and your team name if you belong to a team. This information helps you understand which communication channels you're authorized to use and which team queues you can access for collaborative work.

Understanding your virtual contact assignments is important because it determines which customer communications you'll receive, while knowing your team membership helps you understand which team-based tasks you can claim and which colleagues you can collaborate with.

{{< figure src="/images/ucc-applet/f6d1faec-bd36-4620-84b6-a82bf21cc194.jpeg" caption="Fig 53: profile-about-me" >}}

### 9.2 QR Code

The QR Code feature enables relationship-based customer service by allowing customers to designate you as their preferred agent. This powerful tool helps build customer loyalty, ensures continuity of service, and allows customers to bypass general queues to reach agents they trust and have worked with successfully before.

The QR Codes tab generates a unique QR code specific to you which you can share with customers who want to specifically be helped by you. This might be appropriate after you've successfully resolved a complex issue, when customers express satisfaction with your service, or when building ongoing relationships with key accounts.

When a customer scans your QR code using their smartphone, it provides them with your agent information and also designates you as their preferred agent in the system. Future communications from that customer can then be intelligently routed to you when possible, ensuring they receive consistent service from someone who already understands their needs and history.

This feature is particularly valuable in businesses where relationship continuity matters—such as technical support where understanding a customer's setup is important, account management where knowing customer preferences is valuable, or any service where building trust and rapport improves outcomes.

*(Note: This personal QR code for designating a preferred agent is distinct from the QR codes generated in the `Configuration` section, which are used on product packaging to initiate new support conversations.)*

{{< figure src="/images/ucc-applet/99ed0bcd-4e1e-451d-a297-b5883c2ac5ce.jpeg" caption="Fig 54: profile-qr-code-preferred-agent" >}}

## 10. Contacts

The Contacts section is your centralized customer database within UCC, consolidating all customer contact information gathered across all communication channels and interactions. This unified contact repository ensures every agent has access to up-to-date customer information, eliminates duplicate contact records, and provides a foundation for personalized customer service and targeted outreach campaigns.

### 10.1 Contacts -> Listing

The contact listing page is the main view for browsing and searching your customer database. It presents all contacts in an organized, searchable format that makes it easy to find specific customers or review your entire contact base.

The contact listing page shows all customer contacts available and accumulated by UCC so far. This includes contacts created automatically when customers first message your organization, contacts imported from external sources, and contacts manually created by agents. Each row typically displays key information like customer name, contact channel, phone number or handle, and when the contact was last active.

This centralized view allows you to quickly locate customer information, verify contact details before outreach, identify duplicate contacts that need consolidation, or export contact lists for specific purposes.

{{< figure src="/images/ucc-applet/23d97877-0a52-4990-8b54-90fec9fcb59a.jpeg" caption="Fig 55: contact-listing" >}}

### 10.2 Contacts -> Listing Export As CSV

The export functionality allows you to extract your contact database for use in external tools, marketing campaigns, data analysis, or backup purposes. This interoperability ensures your contact data can flow to wherever it's needed in your business operations.

On the Listing page, users have the option to generate a comma-separated values (CSV) excel file of all available contacts for use in other applets such as Digital Marketing for broadcast campaigns, CRM systems for deeper customer relationship management, or analytical tools for customer segmentation studies.

By clicking the 'Export CSV' button, users can download the CSV file and store it on their own hard drive wherever they please. The exported file will contain all contact fields in a standard format that can be opened in Excel, Google Sheets, or imported into various business applications. This is particularly useful when planning bulk outreach campaigns, conducting customer analysis, or migrating data between systems.

{{< figure src="/images/ucc-applet/95e6194e-5a5f-4c14-adad-7114f99ca4c0.jpeg" caption="Fig 56: contact-listing-export-excel-csv" >}}

### 10.3 Contacts -> Create (Manual Creation)

Manual contact creation allows agents to add customers to the database proactively—before they've necessarily contacted your organization. This is useful when you collect customer information through other channels like in-person meetings, trade shows, business card exchanges, or referrals.

Clicking the plus (+) button from the listing page will bring the user to the Create contact page where users can create a new customer contact by entering comprehensive information. Manual creation ensures you can capture all relevant details accurately when they're provided, rather than waiting for system-automated contact creation which might have incomplete information.

The following details can be entered when manually creating a contact:

-   **First Name**
-   **Last Name**
-   **Contact Name**: Usually the customer's username on the platform if known, or their phone number if no username exists. This is what appears in conversation lists.
-   **Channel**: Select from a dropdown menu with communication platform options including SMS, TELEGRAM, WHATSAPP, and FB_MESSENGER. This determines how the system will communicate with this contact.
-   **Phone number**
-   **Reference**: The platform-specific identifier such as Telegram handle (e.g., @username), WhatsApp number, or Facebook username that uniquely identifies them on that platform.
-   **Email**: filling this in, enables email-based communications and providing an alternative contact method.
-   **Description**

{{< figure src="/images/ucc-applet/33f85d62-f031-404c-a2ca-8dd03a5e72fd.jpeg" caption="Fig 57: contact-create-manual-creation" >}}

### 10.4 Contacts -> Create (Import Excel CSV)

Bulk contact import enables you to add large numbers of contacts to UCC efficiently, which is essential when migrating from other systems, importing contacts from events or campaigns, or consolidating contact lists from multiple sources.

Switching over to the "Import File" tab will allow users to select an Excel CSV file from their own computer and click the "Upload" button to upload the file to UCC. The CSV import feature streamlines the process of adding dozens, hundreds, or even thousands of contacts at once.

In the CSV file, each row must represent one contact and must have all the required fields (as highlighted in the contact create manual creation section) separated by commas in the proper format. The first row typically contains column headers matching the field names, and subsequent rows contain the actual contact data.

Once the file is uploaded, you can preview it to verify the data looks correct. Then by clicking the "Import" button, the system will process each row in the CSV and create a new contact for each one. The system typically provides feedback on how many contacts were successfully imported and flags any rows that had errors or missing required information.

This bulk import capability is invaluable when launching new campaigns, onboarding customers from acquired businesses, or consolidating contact databases from multiple sources.

{{< figure src="/images/ucc-applet/6851f654-4c2d-4485-a4ee-e75c75b37d03.jpeg" caption="Fig 58: contact-create-import-csv" >}}

### 10.5 Contacts -> Update

Contact information changes over time—customers change phone numbers, update email addresses, or prefer different communication channels. The update functionality ensures your contact database remains accurate and current.

Clicking an item from the listing page will open the contact detail view where users can update the contact information. After making changes, clicking the "Save" button will confirm the update and store the new information in the system.

Fields that can be updated include all the same information captured during creation:

-   **Contact Name**: Modify if the customer changes their username or you discover a more appropriate identifier.
-   **Channel**: Change if the customer prefers a different communication platform (for example, switching from SMS to WhatsApp).
-   **Reference**: Update the platform-specific handle if it changes.

Keeping contact information current ensures communications reach customers reliably, reduces bounced messages, and demonstrates professionalism through accurate addressing.

{{< figure src="/images/ucc-applet/5ccca342-bc9b-436f-8fc8-d780df769e88.jpeg" caption="Fig 59: contact-update" >}}

### 10.6 Contacts -> Delete

Sometimes contacts need to be removed from your database—perhaps due to duplicate entries, customer requests for data deletion, inactive contacts you're purging, or test contacts that shouldn't remain in production data. The delete function provides this capability.

Scrolling down a bit in the edit page will reveal the button to delete the contact entirely. This action permanently removes the contact record from UCC, including all associated contact information. 

Before deleting, ensure this is truly necessary, as deletion is typically permanent and cannot be easily undone. Consider whether the contact might be needed for historical records, reporting, or potential future re-engagement. Some organizations prefer to mark contacts as inactive rather than deleting them to preserve historical data integrity.

The delete function should be used thoughtfully, particularly in organizations with data retention policies or compliance requirements that mandate keeping customer records for specific periods.

{{< figure src="/images/ucc-applet/e9fc3ee7-f1ee-4ac7-9c78-51081afacf29.jpeg" caption="Fig 60: contact-delete" >}}

## 11. Broadcast

The Broadcast feature enables mass communication with multiple customers simultaneously, allowing you to send promotional messages, announcements, updates, or important notifications to large groups efficiently. This is essential for marketing campaigns, service announcements, event notifications, or any scenario where you need to reach many customers at once with the same message.

### Simple Broadcast (Advanced Broadcasts can be sent from Digital Marketing Applet)

The broadcast page allows users to send advertisement messages or important communications to a list of leads or customers. This simple broadcast interface is designed for straightforward, one-time message distribution. For more sophisticated campaigns with scheduling, segmentation, analytics, and advanced features, Advanced Broadcasts can be sent from the Digital Marketing Applet.

The simple broadcast workflow follows a step-by-step process that guides you through channel selection, endpoint configuration, recipient selection, and message composition, ensuring all necessary elements are in place before sending.

{{< figure src="/images/ucc-applet/7bab0cae-bdd6-4d79-99cc-d9ce2a340438.jpeg" caption="Fig 61: broadcast-main" >}}

**STEP 1: Select a Channel**

The first step determines which communication platform will be used to deliver your broadcast message. Different channels have different characteristics, costs, and customer preferences, so selecting the appropriate channel is important for campaign success.

This step requires the user to select a channel as highlighted below. WhatsApp channel is the most optimized and typically offers the best deliverability, engagement rates, and rich media support. However, you can also choose other channels like SMS or Telegram based on your audience's preferences and where you have permission to contact them.

Consider factors like message formatting capabilities (text-only vs. rich media), delivery costs, and where your customers are most active when selecting your channel.

{{< figure src="/images/ucc-applet/921beaf1-d6d2-48ba-b19a-83a545ff626a.jpeg" caption="Fig 62: broadcast-main-select-channel" >}}

**STEP 2: Select an Endpoint**

An endpoint represents the specific sending identity or phone number your broadcast will come from. If you have multiple business phone numbers or WhatsApp Business accounts, you'll choose which one sends this particular broadcast.

This step requires the user to select an endpoint—for example, the available company WhatsApp number if you selected WhatsApp in Step 1—as highlighted below. The endpoint selection is important because customers will see this number as the sender, and their replies will come back to this account.

Choose endpoints strategically based on brand recognition (customers might recognize certain numbers), capacity (to avoid overwhelming a single number), or purpose (different numbers for sales vs. support).

{{< figure src="/images/ucc-applet/7f76c17d-8358-4f2e-9ea3-913bda26a0d4.jpeg" caption="Fig 63: broadcast-main-select-endpoint" >}}

**STEP 3 (OPTION 1): Select Contacts One by One**

For smaller, highly targeted broadcasts where you want precise control over recipients, you can manually select each contact individually. This approach is ideal for small VIP lists, personalized campaigns, or when you're carefully curating who should receive a specific message.

This step requires the user to select contacts to send broadcasts to. Users can select contacts one by one from the drop-down list, which shows your available contacts from the UCC contact database. As you select each contact, they're added to the recipient list for this broadcast.

This manual selection method ensures precision and is useful when broadcasting to small groups or when you need to carefully consider each recipient's relevance to the message content.

{{< figure src="/images/ucc-applet/3316b124-d5ce-423d-a3fe-03867674cccd.jpeg" caption="Fig 64: broadcast-main-select-contact-one-by-one" >}}

**STEP 3 (OPTION 2): Import Contact CSV**

For larger broadcasts or when working with pre-defined contact lists, importing a CSV file streamlines the recipient selection process. This method is essential for campaigns targeting hundreds or thousands of contacts, or when using segmented lists created through data analysis.

Another option available to users for contact selection involves importing a CSV list of contacts who should receive the broadcast. Users can click the "Attachment" icon highlighted in red below and select a suitable Excel CSV file from their computer. 

The CSV list can be created in Excel with each row representing one contact and required columns matching the contact format. This CSV can also be exported directly from the Contacts page (see section 10.2), making it easy to broadcast to filtered subsets of your contact database—for example, all customers in a specific region, all contacts from a particular channel, or all customers who haven't been contacted recently.

This bulk import capability makes large-scale broadcasting practical and efficient, enabling marketing campaigns, service announcements, or event invitations to reach thousands of customers quickly.

**STEP 4 (Final): Select Message Type and Send**

The final step involves choosing what type of content your broadcast will contain and actually sending the message. Message type selection determines the format and capabilities of your broadcast.

Users have to select the message type as highlighted below—options typically include plain text messages, messages with images, messages with documents, or templated messages with structured formats. Different message types have different engagement characteristics and are appropriate for different purposes.

Once you've selected your message type and composed your content, clicking the "Send Message" button initiates the broadcast. The system will then deliver your message to all selected contacts through the chosen channel and endpoint. Depending on the number of recipients, this might happen nearly instantaneously for small lists or be processed in batches for large campaigns to comply with platform rate limits.

{{< figure src="/images/ucc-applet/e62a205e-6882-449b-bef1-54e78ea30ff4.jpeg" caption="Fig 65: broadcast-main-import-contact" >}}

{{< figure src="/images/ucc-applet/7b30c7b4-38cc-42d9-8a3f-50dd319fe6a6.jpeg" caption="Fig 66: broadcast-main-select-messagetype" >}}

## 12. Live Dashboard

The Live Dashboard provides real-time visibility into agent activity, enabling supervisors to monitor operations as they happen, identify agents who need support, ensure adequate coverage, and make immediate adjustments to resource allocation. Unlike historical reports that show what happened in the past, the Live Dashboard shows what's happening right now, enabling proactive management and immediate response to changing conditions.

The Live Dashboard page presents a real-time view of all agents who are currently using UCC and the actions they are currently performing. This instant visibility helps supervisors properly monitor the activity and progress of agents, identify capacity issues before they become problems, recognize when agents might need assistance, and ensure service level targets are being met.

{{< figure src="/images/ucc-applet/85c5123b-d7a3-494f-bc3f-e754f09e85c7.jpeg" caption="Fig 67: live-dashboard-base-view" >}}

### 12.1 Online Agents

The Online Agents view focuses specifically on agents who are actively engaged in work right now, showing what they're doing and for how long. This focused view helps supervisors understand current workload distribution, identify agents handling long or complex interactions who might need backup, and see at a glance how many active conversations, emails, or calls are in progress.

The Online Agents page presents a real-time view of all agents who are currently performing tasks such as answering conversations (messaging interactions), handling emails, or receiving voice calls. The view shows the specific task each agent is working on and the duration of those tasks, helping you identify when agents have been on particularly long calls or stuck on complex issues that might benefit from supervisor intervention.

The interface includes powerful grouping functionality. By dragging the column headers highlighted in red to the grouping area, users can reorganize the data according to the contents of the dragged column. This dynamic grouping allows you to view the data in different ways based on what question you're trying to answer—for example, grouping by agent shows all tasks for each person, while grouping by task type shows all conversations, all emails, and all calls separately.

{{< figure src="/images/ucc-applet/c05c001a-dcdb-4fd7-a8d7-8d5d12377fdc.jpeg" caption="Fig 68: live-dashboard-online-agents-modified-view-step-one" >}}

In the screenshot below, the data has been grouped based on agent after the Agent column header was dragged to the grouping box above. This creates an organized view showing each agent and all their current tasks nested beneath them, making it easy to see each agent's current workload at a glance.

This grouping capability is particularly valuable during high-volume periods when you need to quickly assess which agents are handling multiple tasks, which are available for new work, or which might be overwhelmed and need assistance or task redistribution.

{{< figure src="/images/ucc-applet/b0c672b0-ffb8-4c5f-b0eb-dfc0450b5f7e.jpeg" caption="Fig 69: live-dashboard-online-agents-modified-view-step-two" >}}

### 12.2 All Agents

The All Agents view provides a comprehensive roster of your entire agent team, showing availability status regardless of whether they're currently working on tasks. This complete organizational view helps you understand total capacity, identify who's available to take on new work, see who's offline when they should be online, and track agent activity patterns.

The All Agents page contains all agents and their different organization accounts, showing in real-time their availability status—either "OFFLINE" (not currently logged in or available) or "AVAILABLE" (logged in and ready to receive work). The view also displays their last online time, which helps you understand agent attendance patterns, identify who was recently active, and see when offline agents were last available.

This comprehensive view is essential for capacity planning and workload management. When you see many agents offline during business hours, you know you might have coverage issues. When you see many available agents with no active tasks, you know you have capacity for additional work or proactive outreach.

Like the Online Agents view, this page includes the dynamic grouping functionality. By dragging column headers highlighted in red to the grouping area, users can reorganize data according to different dimensions. For example, grouping by status shows all available agents together and all offline agents together, making it easy to count current capacity at a glance.

{{< figure src="/images/ucc-applet/650eb7f1-e7a2-4e9a-9ca8-f134e7722c88.jpeg" caption="Fig 70: live-dashboard-all-agents-modified-view-step-one" >}}

The screenshot below shows the result after grouping—agents are organized in a hierarchical view that makes patterns immediately visible. This organized presentation helps supervisors quickly answer questions like "How many agents are available right now?" or "Which agents have been offline the longest?"

{{< figure src="/images/ucc-applet/fe06ff40-d1fd-4bd3-88e4-5ed5af02c07e.jpeg" caption="Fig 71: live-dashboard-all-agents-modified-view-step-two" >}}

### 12.3 All Agents (under process)

(This part is under process)

This section is currently under development and will provide additional capabilities for viewing and managing agent status and activity. Check back for updates as this feature becomes available.

## 13. Task Router

The Task Router menu provides a technical view into the lifecycle of tasks as they move through the UCC system. It makes a critical distinction between live operations and historical records, separated into two main views:

-   **Router Queue**: This is the queue of **live, ongoing tasks**. When a new task is created (e.g., from a new customer conversation), it first appears here while it is open and waiting to be handled or is actively in progress. This view represents the current, real-time state of work in the system.

-   **Tasks**: This view acts as a comprehensive **history table** for all tasks that have been completed or closed. Once an agent ends a session and its corresponding task is marked as completed, the task moves from the `Router Queue` to this `Tasks` list. Here, you can review the full history of past work, click on any completed task to see its detailed event log, and audit the entire lifecycle of any interaction.

## 14. Configuration

The Configuration menu allows administrators and managers to set up the foundational elements of the UCC system, ensuring it aligns with organizational workflows and campaigns.

### 14.1 Projects

Projects allow you to organize tasks and agents around specific initiatives, such as marketing campaigns (e.g., "CNY Campaign"). You can assign specific agents to handle a project and configure settings like payment gateways and settlement links specific to that initiative.

### 14.2 Virtual Contacts

Virtual Contacts represent the communication endpoints for your organization. Here, you can configure profiles for various channels including WhatsApp, SMS, Voice, Email, and Web Chat. This setup defines how customers can reach you and identifies the "sender" identity for your outbound communications.

### 14.3 Teams and Skills

This section allows you to create Teams and define the Skills associated with them.
*   **Teams**: specific groups of agents (e.g., "Support Team", "Sales Team").
*   **Skills**: Attributes or expertise required for certain tasks.
By linking skills to teams, the system can intelligently route incoming conversations to the most appropriate group of agents based on the nature of the inquiry.

### 14.4 Agents

The Agent configuration section is used for onboarding new customer support agents into the UCC system. This typically involves setting up agent profiles and assigning them to teams or projects.

### 14.5 Predefined Messages

Administrators can configure Predefined Messages to standardize agent responses and improve efficiency. These templates can be categorized (e.g., Welcome Message, Closing Message, Thank You) and made available to agents within the conversation interface.

### 14.6 QR Code

The QR Code configuration allows you to generate unique QR codes linked to specific routing keywords. These codes can be printed on parcels or product packaging. When a customer scans the code, it initiates a conversation (typically via Web Chat) with a specific context, such as "Product Inquiry" or "Returns," allowing for streamlined handling of post-purchase interactions.

*(Note: This QR code for product and parcel inquiries is distinct from the personal QR codes found in the `My Profile` section, which are used by customers to select a preferred agent.)*

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


<!-- *Last updated: November 2024 | Version 3.0* -->