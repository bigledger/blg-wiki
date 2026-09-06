---
title: "Unified Contact Center"
description: "Reference for the Unified Contact Center applet — the omnichannel inbox, the task queues and the rule engine that routes work to teams and agents, plus the virtual contacts, endpoints, agents, teams, skills, queues and rules that have to be configured first."
applet_code: "UnifiedContactCenter"
page_type: applet
applet_repo: "alg-applets-ucc"
modules: [crm-digital]
related_applets:
  - customer-maintenance-applet
  - entity-applet
  - doc-item-maintenance-applet
  - shopping-cart-applet
  - membership-admin-applet
  - my-e-invoice-admin-applet
  - employee-applet
guides: []
sources:
  screens:
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/app.routing.ts
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/shared/shared.module.ts
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/ucc-applet/ucc-applet-routing.module.ts
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/core/side-menu/content/side-menu-content.component.html
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/core/side-menu/content/side-menu-content.component.ts
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/ucc-applet/inbox/inbox-routing.module.ts
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/ucc-applet/inbox/customer-details/customer-details.component.html
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/ucc-applet/inbox/customer-details/conversation-info/conversation-info.component.html
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/ucc-applet/inbox/customer-details/contact-merging/contact-merging.component.html
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/ucc-applet/social-media/social-media.component.ts
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/ucc-applet/social-media/social-media-routing.module.ts
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/ucc-applet/task-router/task-router-routing.module.ts
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/ucc-applet/task-router/task/task-constants.ts
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/ucc-applet/task-router/task-router-queue/task-router-queue-constants.ts
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/ucc-applet/reports/reports-routing.module.ts
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/ucc-applet/live-dashboard/live-dashboard-routing.module.ts
    - alg-applets-ucc/micro-fe/projects/shared-utilities/modules/settings/settings.component.html
  configuration:
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/components/settings-container/application-settings/application-settings.component.ts
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/components/settings-container/application-settings/application-settings.component.html
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/components/settings-container/field-configuration/field-configuration.component.ts
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/models/menu-items.ts
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/services/client-side-applet-permission.service.ts
    - alg-applets-ucc/micro-fe/projects/shared-utilities/modules/permission/client-side-permissions-controller/selectors/client-side-permission.selectors.ts
    - alg-applets-ucc/micro-fe/projects/shared-utilities/modules/permission/client-side-permissions-controller/effects/client-side-permission.effects.ts
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/app.component.ts
  fields:
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/ucc-applet/phonebook/contacts/create-contact/create-contact.component.ts
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/ucc-applet/configurations/virtual-contacts/create-virtual-contact/create-virtual-contact.component.ts
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/ucc-applet/configurations/virtual-contacts/virtual-contact-constants.ts
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/ucc-applet/configurations/virtual-contacts/endpoints/create-endpoint/create-endpoint.component.ts
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/ucc-applet/configurations/teams/create-team/create-team.component.ts
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/ucc-applet/configurations/projects/create-project/create-project.component.ts
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/ucc-applet/configurations/qr-codes/create-qr-code/create-qr-code.component.ts
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/ucc-applet/configurations/rule/create-rule/create-rule.component.ts
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/ucc-applet/configurations/automation-rule/automation-rule-constants.ts
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/ucc-applet/broadcast/broadcasts/broadcasts-create/broadcast-create.component.html
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/ucc-applet/broadcast/broadcasts/broadcasts-create/broadcast-whatsapp/broadcast-whatsapp.component.ts
  lifecycle:
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/models/channel-constants.ts
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/models/task-constants.ts
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/models/http-models/api-config.ts
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/services/http-services/conversation.service.ts
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/services/websocket-services/inbox-socket.service.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/alg/cc/taskAssignment/TaskStatus.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/alg/cc/taskAssignment/TaskEventType.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/alg/cc/ruleEngine/ActionType.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/alg/cc/ruleEngine/OperatorType.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/alg/cc/ruleEngine/SkillBasedActionExecutionService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/alg/cc/ruleEngine/OutboundActionExecutionService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/alg/cc/cudServices/ConversationResourceService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/alg/cc/cudServices/TaskService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/alg/cc/SkillBasedTaskAssignmentProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/alg/cc/ExpiredTaskQueueProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/alg/cc/ExpiredTaskQueueDeletionProcessor.java
  troubleshooting:
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/ucc-applet/configurations/virtual-contacts/endpoints/create-endpoint/create-endpoint.component.ts
    - alg-applets-ucc/micro-fe/projects/akaun-platform/applets/unified-contact-center-applet/src/app/guards/auth.guard.ts
    - gh:bigledger/blg-applets-ucc#311
    - gh:bigledger/blg-applets-ucc#312
    - gh:bigledger/blg-applets-ucc#309
    - gh:bigledger/blg-applets-ucc#330
    - gh:bigledger/blg-applets-ucc#363
tags:
- applets
- customer-service
- omnichannel
- communication
- crm
weight: 105
---

## Overview

The Unified Contact Center (UCC) applet is BigLedger's contact-centre desk. Messages arriving on
twelve kinds of channel — WhatsApp, Telegram, SMS, Facebook Messenger, e-mail, voice, web chat,
Instagram, LINE, Lazada and Shopee — land in one **Inbox**. Each arrival becomes a **Task**, which a
rule engine routes to a team or an individual agent, and which an agent works on beside the
customer's CRM record, shopping cart, transaction history and e-invoice details.

It is opened by agents, team leaders and supervisors. It is configured by whoever owns the
contact-centre set-up: the **Virtual Contacts** and their per-channel **Endpoints** (the sending and
receiving identities), the **Agents**, **Teams** and **Skills**, and the **Queues**, **Rules** and
**Actions** that decide who gets what.

Two things distinguish it from every other applet documented here. Its conversation data does not
live in the tenant's PostgreSQL database — conversations, messages, sessions, e-mail threads,
Facebook posts and voice calls are stored in a per-tenant MongoDB database, while tasks, queues,
agents, teams, rules and contacts are in PostgreSQL. And it posts no journal and moves no stock: it
creates work items and messages, and hands commerce off to other applets.

## Where it fits

| Direction | What | Why |
|---|---|---|
| Configuration | Messaging channel register (`bl_msg_channel_hdr`) | Every endpoint, contact and broadcast picks its channel from this list. It is not maintained inside UCC |
| Configuration | Issue category groups (`bl_wf_issue_label_list_hdr`, namespace `WF_CATEGORY`) | The only real applet setting here selects up to eleven of these groups for the Issue Tracker panel |
| Upstream | [Customer Maintenance](/applets/master-data/customer-maintenance-applet/) and [Entity](/applets/master-data/entity-applet/) | Contact Merging links a conversation's contact to a CRM contact, a business entity, a membership card or a platform login |
| Adjacent | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) | The Product panel in a conversation browses items to share with the customer |
| Downstream | [Shopping Cart](/applets/ecommerce/shopping-cart-applet/) | The Shopping cart panel creates a cart for the customer from inside the conversation |
| Downstream | [MyInvois Admin](/applets/e-invoice/my-e-invoice-admin-applet/) | The E-Invoice panel requests an e-invoice for the customer and lists what has been issued |
| Downstream | [Membership Admin](/applets/membership/membership-admin-applet/) | Membership is one of the four things a contact can be merged with |
| Adjacent | [Employee](/applets/master-data/employee-applet/) | An agent record is a contact-centre role attached to a platform login subject, not an employee record |

{{< callout type="info" >}}
The registry holds two ACTIVE rows whose names both begin *Unified Contact Center*. This page
documents `UnifiedContactCenter`, the row whose `documentation_url` points here and which mounts at
`applets/tnt/ailedger/ucc`. A second, newer implementation is an internal tool and is out of scope
for the wiki.
{{< /callout >}}

## Screens and menus

The applet mounts at `applets/tnt/ailedger/ucc` and opens on the Inbox. The sidebar carries an
**agent availability toggle** at the top — it sends `AVAILABLE` or `OFFLINE` over the applet
WebSocket, and it is what the Live Dashboard's All Agents grid reports.

| Menu | Route | Gated by |
|---|---|---|
| Task Queue → All Task Queue | `task-queue/all-tasks` | `ALL_TASK_QUEUE_VIEW` |
| Task Queue → Team Task Queue, My Task Queue | `task-queue/team`, `task-queue/my-tasks` | not gated |
| Task Queue Outbound → All / Team / My | `outbound-task-queue/…` | All only: `ALL_TASK_QUEUE_VIEW` |
| Inbox → All Tasks | `inbox/tasks` | `INBOX_ALL_TASK_VIEW` |
| Inbox → My Team Tasks, My Tasks, Active Tasks | `inbox/my-tasks`, `inbox/active-tasks` | not gated |
| Outbound → All Tasks | `outbound/tasks` | section: `OUTBOUND_MENU_VIEW`; item: `OUTBOUND_ALL_TASK_VIEW` |
| Outbound → My Team Tasks, My Tasks | `outbound/my-tasks` | section: `OUTBOUND_MENU_VIEW` |
| Quality | `quality` | not gated |
| Social Media | `social-media` | not gated |
| Dashboard | `dashboard` | `DASHBOARD_MENU_VIEW` |
| Reports → Task, Agent, Conversation, User | `reports/task`, `/agent`, `/conversation`, `/user` | section: `REPORT_MENU_VIEW` |
| My-Profile | `profiles/my-profile` | not gated |
| Contacts | `phonebook/contacts` | `CONTACT_VIEW` |
| Broadcast | `broadcast/broadcasts` | `BROADCAST_MENU_VIEW` |
| Live Dashboard → Online Agent, All Agents, Active Tasks | `live-dashboard/…` | `BROADCAST_MENU_VIEW` — see the note below |
| Task Router → Router Queue, Tasks | `task-router/router-queue`, `task-router/task` | `BROADCAST_MENU_VIEW` — see the note below |
| Configurations | `configurations/…` | see [Feature visibility and permissions](#feature-visibility-and-permissions) |
| Settings | `settings` | not gated |
| Personalization | `personalization` | not gated |

Each Inbox and Outbound view has three channel tabs — Conversation, Email, Voice — over a summary
strip of open counts.

{{< figure src="/images/ucc-applet/b609c858-3c35-4b26-bd2b-05b68a527937.jpeg" title="Inbox → All Tasks" alt="The UCC sidebar beside the All Tasks summary showing To-Do Tasks, Conversations, Email and Voice count tiles and the Conversation, Email and Voice tabs" >}}

{{< figure src="/images/ucc-applet/541b33a1-b64b-4499-a0f9-b57e79f998e6.jpeg" title="The channel tabs" alt="The Conversation, Email and Voice tabs above the four count tiles, with a Projects filter at the right" >}}

### Inbox

Selecting a conversation opens the message thread and, behind an arrow at the top right, the
customer panel. Its tabs, in order: **Information**, **Tag**, **Predefine Messages**, **Issue
Tracker**, **Shopping cart**, **Transaction History**, **E-Invoice** (with *Request E-Invoice* and
*E-Invoice History* sub-tabs), **Media Library**, **Product**, **Contact Merging**, **Marketing**
and **AgentHandover**. Media Library and Product are hidden on voice conversations. A Membership tab
exists in the template but is commented out.

The **Information** tab itself has sub-tabs: Personal Info (or Group Info on a group conversation),
Assigned Agents and Assigned Team, Task Assignment (or Outbound Task Assignment), Preferred Agents,
Conversation History, Campaign History and Conversation Instance History.

**Contact Merging is manual, not automatic.** It is a four-tab panel — Contact Hdr, Entity,
Membership, Login Subject — in which an agent searches for and links the record they want. Nothing
in the applet infers that two channel identities are the same person on its own.

### Social Media

Three platform tabs are rendered — Facebook, Instagram and Twitter — but only two routes exist
(`facebook`, `instagram`), and the Instagram and Twitter tabs link to `../emails` and `../voice`,
which are not routes of this module.

{{< figure src="/images/ucc-applet/894b85a5-06ff-466a-8280-d4cc89680389.jpeg" title="Social Media" alt="The Social Media page with Facebook, Instagram and Twitter tabs above four summary tiles" >}}

{{< figure src="/images/ucc-applet/5b560785-5dcf-44ba-a20c-fa124d91d8ec.jpeg" title="Facebook page listing" alt="The Facebook tab listing the managed page with a search box and filter" >}}

### Dashboard

Date-ranged. It reports New Conversations, Messages and Session counts with a percentage change,
then conversation counts grouped by channel and by project, message counts grouped by message type
(`AUDIO`, `CONTACT`, `IMAGE`, `TEMPLATE`, `TEXT`, unsupported) and by sender type (`AUTO`,
`HUMAN_AGENT`, `USER`, `VIRTUAL`), and predefined-message counts per agent.

{{< figure src="/images/ucc-applet/0ce1b2a2-479e-46b7-ad61-f9d8ef426bd1.jpeg" title="Dashboard filters" alt="The dashboard Date From, Date To and Search controls above empty metric cards" >}}

{{< figure src="/images/ucc-applet/17846fd8-2697-4784-8537-afcda92c9f1d.jpeg" title="Dashboard charts" alt="New Conversations, Messages and Session tiles above pie charts of conversation counts by channel and message counts by message type and sender type" >}}

{{< figure src="/images/ucc-applet/fd1873e7-a5e9-44a8-b6fb-7fd460c24c48.jpeg" title="Predefined message counts by agent" alt="Two bar charts, Predefined Message Count by Agent and Predefined Message Count to Unique Conversations, each beside a grid of agent codes and message counts" >}}

### Reports

Four reports, each date-ranged and exportable to CSV at 50 rows a page.

| Report | Columns |
|---|---|
| Task | Code, Name, Target Type, Task Status, Channel, Total Duration, Created Date, Last Modified Date |
| Agent | Code, Name, Total Tasks, Completed Tasks, Cancelled Tasks, In-Progress Tasks, Average Duration |
| Conversation | Route `reports/conversation` |
| User | Route `reports/user` |

{{< figure src="/images/ucc-applet/c3ec35f6-3da8-4866-b602-30a3aed7631c.jpeg" title="Task Report" alt="The Task Report with Date From and Date To filters over an empty grid with Code, Name, Target Type, Task Status, Channel, Total Duration, Created Date and Last Modified Date columns" >}}

{{< figure src="/images/ucc-applet/2671ff99-ef7c-4164-9940-8ad2ac28d4a6.jpeg" title="Agent Report" alt="The Agent Report with date filters over a grid with Code, Name, Total Tasks, Completed Tasks, Cancelled Tasks, In-Progress Tasks and Average Duration columns" >}}

### Task Router

Two screens, and they are not what their names suggest.

| Screen | Lists | Columns |
|---|---|---|
| Router Queue | `bl_alg_cc_queue_hdr` — the routing **queues**, not the tasks in them | Queue Code, Queue Name, Queue Description, Created Date, Updated Date |
| Tasks | `bl_alg_cc_task_hdr` — every task at any status | Name, Code, Target Type, Status, Queue Name, Created Date, Updated Date |

### Broadcast

A one-off send: pick a channel, pick the endpoint to send from, pick recipients (from the contact
list or by uploading a `.txt` or `.csv` file), pick a message type, send.

{{< figure src="/images/ucc-applet/7bab0cae-bdd6-4d79-99cc-d9ce2a340438.jpeg" title="Compose Broadcast Message" alt="The broadcast form with Channel, Endpoint ID, Select Contacts, Upload new contacts, Send To and Message Type fields and Send Message and Discard buttons" >}}

{{< figure src="/images/ucc-applet/921beaf1-d6d2-48ba-b19a-83a545ff626a.jpeg" title="The broadcast channel list" alt="The channel drop-down open, listing SMS, Telegram, Whatsapp, Facebook Messenger, Email and Facebook Feed" >}}

{{< callout type="warning" >}}
The channel drop-down offers every configured channel except Voice and Web, but a compose panel
exists for only five of them — WhatsApp, Telegram, SMS, Facebook Messenger and e-mail. Choose any
other channel and the form below the drop-down stays empty.
{{< /callout >}}

## Configuration

### Before you can use it

| Prerequisite | Where it is set | Why it matters here |
|---|---|---|
| The channel you want must exist in the messaging channel register | Platform data (`bl_msg_channel_hdr`) | Endpoints, contacts and broadcasts all pick from this list; UCC has no screen that adds to it |
| At least one **Project** | This applet → Configurations → Projects | A Virtual Contact cannot be saved without one |
| A **Virtual Contact** with one **Endpoint** per channel | This applet → Configurations → Virtual Contacts | The endpoint holds the number, page, bot or mailbox and its provider credentials. Without one, nothing can be received or sent on that channel |
| **Agents** | This applet → Configurations → Agents | An agent record attaches a platform login subject to the contact centre. A user without one has nothing to be assigned |
| **Teams** | This applet → Configurations → Teams | Stored in the platform's group table `app_mst_grp_hdr` and shared with the rest of the product |
| **Skills**, **Queues**, **Rules** and **Actions** | This applet → Configurations | Only needed for automatic routing; without them every task falls through to the default "any agent with the fewest tasks" |
| Issue category groups | Workflow / issue label lists, namespace `WF_CATEGORY` | The eleven Application Settings slots select from these; without them the Issue Tracker panel has no categories |
| A notification subscription with topic code `UCC_MESSAGE_RECEIVED` | Platform (`bl_applet_notification_subscription_hdr`) | Browser push registration silently does nothing if the row is absent |

### Applet settings

Settings are **applet-local**. `ucc-applet-routing.module.ts` routes `settings/application-settings`,
`settings/field-settings` and `settings/default-selection` to components in this applet's own
`components/settings-container/`, not to the shared `FieldConfigurationComponent` from
`blg-shared-utilities`. The settings menu is defined in `models/menu-items.ts` and lists three
entries; the shared settings shell adds Client Side Permissions, Server Side Permissions,
Integration → Triggers and Developer Tools around them.

Only one setting in this applet passes all four proofs — declared, rendered, persisted and consumed.

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| Issue Category → Category Group 0…10, each with a *Mandatory* checkbox | Which issue category groups an agent can pick from in the Issue Tracker panel, and which of them must be filled in | Eleven empty slots; the form patches in blank rows when the tenant has never saved | The Issue Tracker's category drop-downs are rebuilt from the chosen groups, and each slot marked Mandatory becomes a required field on the issue form |

Anyone who can reach Settings can change it; the menu itself is not permission-gated, although the
Configurations menu is.

**Field Settings does nothing.** The component is 22 lines with no form group, no save handler and
no binding of any kind; the eight toggles its template renders — Unit Discount, SST/VAT/GST, WHT,
Blanket Order, Segment, G/L Dimension, Profit Center, Project — are boilerplate copied from a
document applet and have no meaning in a contact centre. The SAVE button has no click handler.

**Default Selection and Personalization → Default Selection cannot work.** Both components declare
an `appletContainer` that is never assigned, because both are routed directly rather than embedded
with an input binding. Changing Default Branch or Default Location dereferences that undefined
object, and their SAVE buttons emit an `@Output` that nothing is listening to.

Two routes exist with no menu entry — `settings/webhook` (shown by the shared shell as
*Integration → Triggers*) and `settings/feature-visibility`, which is also the default redirect, so
opening Settings lands on Feature Visibility. The shared shell's *Applet Access* link points at
`client-side-permission-listing`, which this applet does not route. The Personalization menu lists a
*Field Settings* entry that likewise has no matching route.

### Settings in other applets that control this applet

| Setting | Where it is set | Effect here |
|---|---|---|
| Channel records | Platform messaging channel register | Determines the channel list everywhere in the applet: endpoint creation, contact creation and the broadcast drop-down |
| Issue category groups | Issue label lists, namespace `WF_CATEGORY` | The pool the eleven Application Settings slots choose from |
| Notification subscription `UCC_MESSAGE_RECEIVED` | Platform notification subscriptions | Whether browser push registration happens at all |

### Feature visibility and permissions

UCC is unusual: its client-side permission codes **are** seeded. There are 67 `CLIENT_SIDE_PERM`
rows for `UnifiedContactCenter` in `bl_applet_client_side_perm_dfn`, so the codes the code checks
can actually be granted through Settings → Client Side Permissions. Most applets in this repo check
codes that were never seeded.

A permission is true only when the signed-in subject has been granted that exact code — the selector
tests membership of the granted list, and the granted list is fetched by subject and applet from the
definition table. A code with no definition row can therefore never be true for anyone, including
the tenant owner.

Four seeded codes are never checked anywhere in the applet: `ACTION_VIEW`, `AGENT_DELETE`,
`AGENT_UPDATE` and `PREDEFINED_MESSAGE_ENDPOINT_VIEW`.

Thirteen codes are checked in code but have no definition row. Four of those checks are commented
out; the rest are live and permanently false:

| Code | Where | Consequence |
|---|---|---|
| `LIVE_DASHBOARD_VIEW` | Side menu | Computed and then never used in the template — the Live Dashboard section is gated by `BROADCAST_MENU_VIEW` instead |
| `PROJECT_DRIVE_CREATE`, `PROJECT_DRIVE_DELETE`, `PROJECT_DRIVE_VIEW` | Project edit | The drive-link block they guard is commented out |
| `SKILL_VIEW`, `SKILL_UPDATE`, `SKILL_DELETE` | Skill configuration | The menu gate is hard-wired to true, so Skill is visible to everyone who can see Configurations |
| `TASK_ROUTER_VIEW`, `TASK_ROUTER_QUEUE_UPDATE`, `TASK_ROUTER_QUEUE_DELETE`, `TASK_ROUTER_QUEUE_RULE_VIEW`, `TASK_ROUTER_QUEUE_SKILL_VIEW`, `TASK_ROUTEER_QUEUE_CREATE` | Task Router | All commented out; the Task Router section is gated by `BROADCAST_MENU_VIEW`, and the last is also misspelt |

Three menu items are gated by a permission that does not describe them. Grant these if the item is
missing:

| Menu item | Permission actually required |
|---|---|
| Live Dashboard | `BROADCAST_MENU_VIEW` |
| Task Router | `BROADCAST_MENU_VIEW` |
| Configurations → Teams | `SQUAD_VIEW` |
| Configurations → Quality Control | `SQUAD_VIEW` |
| Configurations → Outbound Tasks | `TASK_VIEW` |

The Configurations section itself appears if the user holds any one of `SETTINGS_MENU_VIEW`,
`PROJECT_VIEW`, `VIRTUAL_CONTACT_VIEW`, `SQUAD_VIEW`, `AGENT_VIEW`, `PREDEFINED_MESSAGE_VIEW`,
`QR_CODE_VIEW`, `TASK_VIEW`, `AUTOMATION_RULE_VIEW` or `RULE_VIEW`.

{{< callout type="warning" >}}
The applet's own route guard grants entry unconditionally: it returns `true` on success and `true`
again in its error handler. Access to the applet is controlled by the platform's applet
assignment, not by anything in this applet, and the permission codes above hide menu items and
buttons rather than protect endpoints.
{{< /callout >}}

## Fields

### Contact (Contacts → Create)

Contacts are written to the shared CRM contact table `bl_crm_contact_hdr` with a source of
`AI_LEDGER` — they are CRM contacts, not a private UCC address book.

| Field | Meaning | Required | Notes |
|---|---|---|---|
| First Name, Last Name, Contact Name | Who the contact is | At least one of the three | Max 255 characters each |
| Channel | The channel this identity belongs to | Yes | Saved as the contact's `id_type` |
| Phone | The number in international form | Only for WhatsApp, SMS and Voice | Stored in E.164 form; also copied into ID No for those three channels |
| Reference (Telegram / FB Username) | The platform handle | No | |
| Email | E-mail address | No | Validated as an e-mail when filled |
| ID No (Telegram ID / Facebook PSID) | The platform's own identifier | No | **Read-only.** It is filled automatically from Phone on WhatsApp, SMS and Voice, and cannot be typed for any other channel |
| Description | Free text | No | |

### Virtual Contact and Endpoint

A **Virtual Contact** is the identity your organisation presents; an **Endpoint** is one channel of
it.

| Virtual Contact field | Required | Notes |
|---|---|---|
| Name | Yes | Max 255 characters |
| Code | Yes | |
| Project | Yes | Links the virtual contact to a project |
| Description | No | |

| Endpoint field | Required | Notes |
|---|---|---|
| Channel | Yes | Drives every other field on the form |
| Endpoint ID | Yes | 5–255 characters. The form hints what to enter per channel: a Telegram bot token, a `+60…` number for WhatsApp, SMS and Voice, a Facebook page id, an e-mail address, a website URL, a Lazada seller id |
| Endpoint Name | Yes | A label — a bot username, a page name, a shop name |
| Provider | Yes, except on Web, Lazada, Shopee and Instagram Feed | See the matrix below |
| Capabilities | No | Text, Voice, Media |
| Access / Account ID | Depends on provider | Required for WhatsApp; labelled *WhatsApp Business Phone number ID* when the provider is WhatsApp Business. Disabled for Facebook, LINE and Instagram Chat |
| Auth Token | Depends on provider | Required for WhatsApp and LINE, and for any provider other than the token-less ones listed below |
| API Key, API Token | Yes for Lazada, Shopee and Instagram Feed | |
| Append Agent Name, First Name, Last Name, Application ID, Enable Recording | No | Recording applies to voice |

| Channel | Providers offered |
|---|---|
| WhatsApp | `TWILIO`, `VONAGE`, `WHATSAPP_BUSINESS` |
| SMS, Voice | `TWILIO` |
| Telegram | `TELEGRAM_BOT_API` |
| Facebook Messenger, Facebook Feed | `FACEBOOK_API` |
| E-mail | `SEND_GRID`, `AMAZON_SES` |
| Lazada | `LAZADA_API` |
| Shopee | `SHOPEE_API` |
| Instagram Feed | `INSTAGRAM_API` |
| Instagram Chat | `INSTAGRAM_CHAT_API` |
| LINE | `LINE_API` |
| Web | none — the provider field is disabled |

`TELEGRAM_BOT_API`, `SEND_GRID`, `AMAZON_SES`, `LAZADA_API`, `SHOPEE_API`, `INSTAGRAM_API` and
`INSTAGRAM_CHAT_API` need no Access ID or Auth Token; the two credential fields are disabled for
them.

Editing an endpoint opens a **Template Messages** panel where a predefined message can be attached
to one of four greeting events: New Session, New Conversation, Idle Time and Agents Busy.

### Team, Project, QR Code, Rule

| Screen | Fields |
|---|---|
| Team | Name (required, max 255), Code (required), Description, Website; plus an address block — Address 1 and 2, City, State, Country, Postal Code. Saved to `app_mst_grp_hdr` |
| Project | Name (required, max 255), Code (required), Description, Customer Details |
| QR Code | Name (required, max 255), Code (required), Virtual Contact (required), Team, Description, virtual username and auth token, URL |
| Automation Rule | A single drop-down. Only two values can be created: `TASK_TEAM_ASSIGNMENT_AUTOMATION_RULE_SET` and `OUTBOUND_TASK_ASSIGNMENT_AUTOMATION_RULE_SET`. Name, code and description are all copied from the chosen constant |
| Rule | Rule Type (`STANDARD` or `CUSTOM`, default `STANDARD`), parent Automation Rule, Rule Name, Rule Code, Priority (1–10) and Description — all required |

Rule conditions compare a value with one of six operators — `EQ`, `NOT_EQ`, `LT`, `LTE`, `GT`,
`GTE` — against a value typed as `NUMERIC`, `STRING`, `BOOLEAN` or `DATE`.

## Lifecycle and effects

### Where the records live

| Record | Store |
|---|---|
| Conversations, messages, sessions, conversation events and tags, e-mails and e-mail threads, endpoints as seen by the chat engine, predefined messages, Facebook posts, lines, comments and reactions, voice calls and voice conversations, vouchers, Telegram group topics | A **per-tenant MongoDB database**, through `MongoTemplate` |
| Tasks, task events, task queues, outbound tasks and their queues, agents, squads, skills, projects, rules, actions, rule actions, automation rules, virtual contacts, endpoints, template messages, QR codes, quality-control sets and lines — 55 `bl_alg_cc_*` tables | The tenant's PostgreSQL database |
| Contacts | `bl_crm_contact_hdr`, shared with CRM |
| Teams | `app_mst_grp_hdr`, shared with the platform |

Everything the applet reads and writes goes through `core2/tnt/dm/alg/cc/` on the platform API. Live
updates arrive over a WebSocket that reconnects two seconds after any close, refreshes every eight
minutes and times out after 24 hours. Browser push notifications use Firebase Cloud Messaging and
the topic code `UCC_MESSAGE_RECEIVED`; the applet registers a device only if a subscription row for
that topic already exists in the tenant.

### Task statuses

| Status | Set by |
|---|---|
| `CREATED` | Task creation |
| `TEAM_ASSIGNED` | A team assignment action, or an agent releasing a task back to the team |
| `AGENT_ASSIGNED` | An agent assignment action, or *Assign to me* |
| `IN-PROGRESS` | The agent starting work (front end only) |
| `COMPLETED`, `CANCELLED` | Completing or cancelling |
| `UNASSIGNED` | Unassigning (front end only) |

The back end's `TaskStatus` enum carries five of these — `CREATED`, `TEAM_ASSIGNED`,
`AGENT_ASSIGNED`, `COMPLETED`, `CANCELLED`. `IN-PROGRESS` and `UNASSIGNED` exist only in the
front-end enum, so a status set from the desk is not one the routing engine recognises.

Bulk actions on a queue listing offer `ASSIGN_WORKER` (then *Agent* or *Team*, then the recipient),
`ASSIGN_TO_ME`, `COMPLETE`, `CANCEL` and `UNASSIGN`. Every change writes a task event; the event
types are `TASK_CREATED`, `RULE_MATCHED`, `TEAM_ASSIGNED`, `AGENT_ASSIGNED`, `TASK_STATUS_CHANGED`,
`TASK_IN_PROGRESS`, `TASK_COMPLETED`, `TASK_CANCELLED` and `PRIORITY_CHANGED`. A task's target type
is `CONVERSATION`, `EMAIL` or `VOICE`.

### How a task is routed

A new task is put on a processing queue, and the skill-based assignment processor picks it up.

1. Rules belonging to the task's queue and automation-rule set are fetched, **ordered by priority**.
2. The first rule whose conditions match the task is selected; a `RULE_MATCHED` event is written.
3. The rule's action runs.
4. If no rule matched, the automation rule's **default rule** runs instead.
5. If that also fails or does not exist, the fallback is **assign to any agent with the fewest
   tasks**, recorded as `RULE_MATCH_BUT_NO_APPLICABLE_AGENT_AND_DEFAULT_ACTION_PERFORMED`.

Thirteen action types are declared. The inbound engine implements nine of them:

| Action | Inbound |
|---|---|
| `ASSIGN_TO_AVAILABLE_AGENT_WITH_LEAST_TASKS` | implemented |
| `ASSIGN_TO_ANY_AGENT_WITH_LEAST_TASKS` | implemented, and the final fallback |
| `ASSIGN_TO_ANY_AGENT_AT_RANDOM` | implemented |
| `ASSIGN_TO_AVAILABLE_TEAM_AGENT_WITH_LEAST_TASKS` | implemented |
| `ASSIGN_TO_TEAM_AND_KEEP_IN_QUEUE` | implemented |
| `KEEP_IN_THE_QUEUE` | implemented |
| `PROCESS_OCR_EMAIL_EINVOICE_ATTACHMENT`, `PROCESS_OCR_PAYMENT_STATEMENT_ATTACHMENT`, `PROCESS_WEB_EMAIL` | implemented |
| `ASSIGN_TO_TEAM`, `ASSIGN_TO_AVAILABLE_AGENT`, `CREATE_ISSUE` | **not** handled by the inbound switch — the action is logged as unmatched and the rule is treated as failed |

Outbound tasks use a different engine that supports **only** `ASSIGN_TO_TEAM`; a rule carrying any
other action is skipped and the task is simply put on a queue.

### Job processors

Twenty-four background processors serve the applet. The ones whose behaviour a reader will notice:

| Processor | Queue code | What it does |
|---|---|---|
| Task handling scheduler / polling | `TASK_HANDLING_QUEUE_SCHEDULER_PROCESSOR`, `TASK_HANDLING_QUEUE_POLLING_PROCESSOR` | Put new tasks on `bl_alg_cc_task_processing_queue` and read them back for assignment |
| Skill-based assignment | `SKILL_BASED_TASK_ASSIGNMENT_PROCESSOR` | The routing engine described above |
| Team assignment | — | Assigns a task to a team and creates the team queue row |
| Outbound task creation and assignment | — | The outbound equivalents |
| Expired task scheduler / processor / deletion | `EXPIRED_TASK_QUEUE_*` | Intended to close and remove old tasks |
| Campaign send, campaign conversation history | `CAMPAIGN_SENDING_QUEUE_PROCESSOR` and related | Broadcast and campaign delivery |
| E-mail send | — | Outbound e-mail |
| Shopee and Lazada authentication, Shopee conversation sync | — | Marketplace channel upkeep |
| OCR e-invoice attachment | — | Reads an e-invoice out of an e-mail attachment |
| QC line generation | — | Builds quality-control lines |
| Applet notification | — | Push notifications |

{{< callout type="warning" >}}
The expiry chain does not complete. `ExpiredTaskQueueDeletionProcessor.processEvent` has its entire
body commented out behind the note *"Kindly fix this code before redeploying, since this is causing
the entire platform to break"*. The scheduler and the queue processor still run, so rows are
produced and consumed, but no task is ever closed or removed by expiry. Tasks that nobody completes
stay open indefinitely.
{{< /callout >}}

### What the applet does not do

It posts no journal, moves no stock and creates no financial document. Commerce started from a
conversation is handed to the Shopping Cart and e-invoice applets, which own the documents and the
posting.

## Related applets

- [Customer Maintenance](/applets/master-data/customer-maintenance-applet/) and
  [Entity](/applets/master-data/entity-applet/) — the CRM contact and business entity a conversation
  contact is merged with.
- [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) — the items the Product
  panel browses and shares.
- [Shopping Cart](/applets/ecommerce/shopping-cart-applet/) — the cart an agent builds from inside a
  conversation, and the payment link the customer receives.
- [MyInvois Admin](/applets/e-invoice/my-e-invoice-admin-applet/) — the e-invoice the E-Invoice panel
  requests, and the validation status it reports back.
- [Membership Admin](/applets/membership/membership-admin-applet/) — one of the four records Contact
  Merging can attach.
- [Employee](/applets/master-data/employee-applet/) — separate from an agent record; an agent is a
  contact-centre role on a login subject.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| A menu item is missing for a user who has "everything else" | The three gates that do not match their labels: Live Dashboard and Task Router need `BROADCAST_MENU_VIEW`; Teams and Quality Control need `SQUAD_VIEW`; Outbound Tasks needs `TASK_VIEW` | Grant the code in the table above, not the one the menu name suggests |
| Live Dashboard never appears even for an administrator | `LIVE_DASHBOARD_VIEW` is computed but not used, and has no definition row | Grant `BROADCAST_MENU_VIEW` |
| The broadcast form is blank below the channel drop-down | Only WhatsApp, Telegram, SMS, Facebook Messenger and e-mail have a compose panel | Broadcast on one of those five; send on marketplace and Instagram channels from the conversation |
| Nothing saves on Settings → Field Settings | The component has no form binding and no save handler | Nothing to fix in configuration — the screen is inert |
| Default Branch or Default Location throws, or SAVE appears to do nothing, on Default Selection | `appletContainer` is never assigned, and SAVE emits an output with no listener | Do not rely on these two screens |
| A manually created Telegram or Facebook contact never matches an inbound message | ID No is read-only and is filled only for WhatsApp, SMS and Voice, so a Telegram ID or Facebook PSID cannot be entered by hand | Let the contact be created by the first inbound message, then edit it |
| A routing rule "matches" but the task lands on the wrong agent | `ASSIGN_TO_TEAM`, `ASSIGN_TO_AVAILABLE_AGENT` and `CREATE_ISSUE` are not handled by the inbound switch; the rule is treated as failed and the fallback assigns to whoever has the fewest tasks | Use one of the nine implemented actions |
| An outbound rule's action is ignored | The outbound engine supports only `ASSIGN_TO_TEAM` | Use `ASSIGN_TO_TEAM` for outbound rules |
| Old tasks never disappear from the queues | The expiry deletion processor's body is commented out | Complete or cancel tasks explicitly |
| Browser notifications never arrive | Registration is skipped when no subscription row with topic code `UCC_MESSAGE_RECEIVED` exists | Create the subscription in the tenant |
| Reply-to a Telegram message does not resolve | Telegram's `message_id` was not persisted at the top level of the message record, so reply lookups failed (`gh:bigledger/blg-applets-ucc#309`) | Fixed; on an older build, replies fall back to a plain message |
| Broadcast and WhatsApp send or receive misbehaves | Known open work on the WhatsApp `/send` and `/receive` endpoints and on broadcast messages (`gh:bigledger/blg-applets-ucc#311`, `#312`) | Check the endpoint's provider credentials first |
| The Broadcast panel stays on screen after switching menus | Known open defect (`gh:bigledger/blg-applets-ucc#363`) | Reload the applet |
| The Instagram or Twitter tab under Social Media goes nowhere | Those tabs link to routes that do not exist in the Social Media module | Only Facebook is usable |

## Related documentation

- [CRM and Digital module](/modules-v2/crm-digital/)
- [Applet directory](/applets/applet-directory/)

### Recorded walkthroughs

An introduction to the applet:

{{< youtube cgGqMnSo5bQ >}}

Two recorded webinars covering the same ground in more depth:

{{< youtube jbh717rxfuk >}}

{{< youtube zY0rVA_a_LY >}}
