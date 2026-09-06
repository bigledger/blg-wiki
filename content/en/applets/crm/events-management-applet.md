---
title: "Event Management Applet"
description: "Reference for the calendar and event register: calendars and their members, events and participants, entity linking, agenda attachments, and the claim-based expense report"
applet_code: "eventManagementApplet"
page_type: applet
applet_repo: "blg-applet-wavelet-events-management-applet"
modules: [sales-crm]
related_applets:
  - employee-applet
  - organisation-applet
  - entity-applet
  - engagement-applet
  - cp-commerce-admin-applet
guides: []
sources:
  screens_and_menus:
    - blg-applet-wavelet-events-management-applet/micro-fe/projects/wavelet-erp/applets/events-management-applet/src/app/app.routing.ts
    - blg-applet-wavelet-events-management-applet/micro-fe/projects/wavelet-erp/applets/events-management-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-events-management-applet/micro-fe/projects/wavelet-erp/applets/events-management-applet/src/app/app.component.ts
    - blg-applet-wavelet-events-management-applet/micro-fe/projects/wavelet-erp/applets/events-management-applet/src/app/services/event-pages.service.ts
    - blg-applet-wavelet-events-management-applet/micro-fe/projects/wavelet-erp/applets/events-management-applet/src/app/services/calendar-pages.service.ts
    - blg-applet-wavelet-events-management-applet/micro-fe/projects/wavelet-erp/applets/events-management-applet/src/app/services/calendar-member-pages.service.ts
    - blg-applet-wavelet-events-management-applet/micro-fe/projects/wavelet-erp/applets/events-management-applet/src/app/services/event-expenses-report-pages.service.ts
    - blg-applet-wavelet-events-management-applet/micro-fe/projects/wavelet-erp/applets/events-management-applet/src/app/components/event-container/event-edit/event-edit.component.html
  configuration:
    - blg-applet-wavelet-events-management-applet/micro-fe/projects/wavelet-erp/applets/events-management-applet/src/app/components/settings-container/field-configuration/field-configuration.component.ts
    - blg-applet-wavelet-events-management-applet/micro-fe/projects/wavelet-erp/applets/events-management-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-wavelet-events-management-applet/micro-fe/projects/wavelet-erp/applets/events-management-applet/src/app/models/applet-settings.model.ts
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/cms/cmsCalendar/CmsCalendarHdrController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/cms/cmsCalendar/CmsCalendarEventController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/auditAssuranceTax/claim/report/ClaimReportController.java
  fields:
    - blg-applet-wavelet-events-management-applet/micro-fe/projects/wavelet-erp/applets/events-management-applet/src/app/components/event-container/event-create/event-create.component.ts
    - blg-applet-wavelet-events-management-applet/micro-fe/projects/wavelet-erp/applets/events-management-applet/src/app/components/event-container/event-create/event-create.component.html
    - blg-applet-wavelet-events-management-applet/micro-fe/projects/wavelet-erp/applets/events-management-applet/src/app/components/calendar-container/calendar-create/calendar-create.component.ts
    - blg-applet-wavelet-events-management-applet/micro-fe/projects/wavelet-erp/applets/events-management-applet/src/app/components/event-container/event-listing/event-listing.component.ts
    - blg-applet-wavelet-events-management-applet/micro-fe/projects/wavelet-erp/applets/events-management-applet/src/app/components/calendar-container/calendar-listing/calendar-listing.component.ts
  lifecycle:
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/cms/cmsCalendar/CmsCalendarEventController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/cms/cmsCalendar/CmsCalendarMemberController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/cms/cmsCalendar/CmsCalendarEventParticipantLinkController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/CmsCalendarDataConsistencyObjects/CmsCalendarEventLinkQueueDataConsistencyObject.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/erp/auditAssuranceTax/claim/bl_aat_claim_document_line.java
  troubleshooting:
    - blg-applet-wavelet-events-management-applet/micro-fe/projects/wavelet-erp/applets/events-management-applet/src/app/components/event-container/event-create/event-create.component.ts
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/auditAssuranceTax/claim/report/ClaimReportController.java
    - gh:bigledger/blg-applet-wavelet-events-management-applet#5
tags:
- events-management
- event-planning
- corporate-events
- event-calendar
- expense-tracking
weight: 120
---

## Overview

The Event Management Applet keeps a tenant's calendars and the events on them:
`bl_cms_calendar_hdr` (a calendar), `bl_cms_calendar_event_hdr` (an event), and the links that put
members on a calendar, participants on an event, and companies against an event. It shows the same
data three ways — a month/week calendar view, a flat event listing, and a calendar listing.

Its fourth screen, the **Event Expense Report**, is not an expense store. Costs reach an event
because a **staff claim line** carries `bl_aat_claim_document_line.calendar_event_hdr_guid`, and the
report is served by the audit/assurance/tax **claim** report endpoints. The applet reads that data;
it never writes a claim.

It is master data plus links: no journal, no posting status, no stock.

## Where it fits

| Direction | What | Why |
| :--- | :--- | :--- |
| Before | Calendars, created in this applet | An event belongs to a calendar. The applet settings hold the calendar an event defaults to. |
| Before | [Employee](/applets/master-data/employee-applet/) | The event's PIC (person in charge) and its participants are chosen from the employee listing; calendar members are employees too. |
| Before | [Organization](/applets/master-data/organisation-applet/) / [Entity](/applets/master-data/entity-applet/) | The event's Company is required, and the *Company Linking* tab attaches further entities to an event. |
| Alongside | The audit/assurance/tax claims module | An expense appears against an event because a claim line is tagged with the event GUID. Reading the report needs claim-report permission. |
| Adjacent | [Engagement Applet](/applets/crm/engagement-applet/) | The other applet in the same audit/assurance/tax family; both feed the claims reporting. |

## Screens and menus

Four sidebar entries (`models/menu-items.ts`), all under the applet's main router:

| Menu | Route | What it is |
| :--- | :--- | :--- |
| Event Calender | `event-calender` | The scheduler view. Clicking a slot pre-fills the start date of a new event. |
| Event Listing | `events` | A grid of events: Title, Event Code, Event Type, PIC, Event Venue, Description, Status, Date From, Date To, Updated Date. |
| Calendar Listing | `calendars` | A grid of calendars: Calendar Name, Description, Time Zone, Creation Date, Modification Date, Status. **Removed from the menu when `HIDE_CALENDAR_LISTING_MENU` is on** — `app.component.ts` filters the item out of `menuItems`. |
| Event Expense Report | `event-expense-report` | Claim lines tagged to events, across all events: Event Title, Event PIC Name, Employee Name, Claim ID, Claim Item, Claim Status, Claim Amount, with a statistics panel. |

The applet name shown in the layout header is **Events Management**; the registry name is
**Event Management Applet**.

### Event Edit

| Tab | Shown when | Contents |
| :--- | :--- | :--- |
| Details | always | The event record — see [Fields](#fields) — plus the recurring-event controls and a **Delete** button that asks for confirmation ("Delete recurring event") before removing the series. |
| *Company* Linking *(label follows the relabel setting)* | `HIDE_ENTITY_LINKING_TAB` is off | Companies/entities attached to the event through `bl_cms_calendar_event_company_link`, with add and edit panels. |
| Agenda | always | File attachments (`bl_cms_event_attachment`): File Name, Size, Uploaded Date, Uploaded By. Despite the tab name it is an attachment list, not a structured agenda. |
| Events Participant | always | `bl_cms_calendar_event_participant_link` rows: Participant Name, Email. |
| Expenses | always | The single-event version of the expense report: Event Title, Employee Name, Claim ID, Claim Item, Claim Status, Claim Amount. Read-only. |

### Calendar Edit

Two tabs: **Main** (name, time zone, description) and **Members**
(`bl_cms_calendar_member_hdr`: Member Name, Email, Status), with an Add Member panel.

### Settings

The settings menu (`settingItems`) lists three entries: **Field Settings**, **Default Selection**
and **Events Calendar Permission** — the last of which opens the calendar-member listing, so
"permission" here means *who is a member of which calendar*.

`settings/webhook`, `settings/feature-visibility`, `settings/applet-log` (an audit-trail listing and
viewer) and the permission wizard, permission-set, user, team and role permission listings are all
routed with **no menu entry** and can be reached by URL only. The `settings` path with no child
redirects to `feature-visibility`.

{{< callout type="info" >}}
No product screenshots exist for this applet. The only image in the repository was an AI-generated
marketing infographic and it has been removed.
{{< /callout >}}

## Configuration

### Before you can use it

| Prerequisite | Where | Why |
| :--- | :--- | :--- |
| At least one calendar | Calendar Listing, in this applet | An event has to sit on a calendar; the settings screen also wants one as the default. |
| Employees | [Employee](/applets/master-data/employee-applet/) | The PIC, the participants and the calendar members are all employees. |
| A company | [Organization](/applets/master-data/organisation-applet/) | Company is `Validators.required` on Event Create. |
| Claim-report permission, for the Expenses screens | The claims side of the audit/assurance/tax module | Both expense reports call `ClaimReportController`, which requires `TNT_AAT_CLAIM_REPORT_OWNER` / `_ADMIN` / `_CREATE`. Calendar permissions do not open them. |

### Applet settings

Settings live in an **applet-local** `FieldConfigurationComponent`
(`./components/settings-container/field-configuration/`), routed by `app.routing.ts` in preference to
the shared screen even though the shared-utilities submodule is present (METHOD §29). It is a working
screen: nine reactive controls, patched from the session's master settings and saved through
`SessionActions.saveMasterSettingsInit` into the applet's `APPLET_SETTINGS` row.

It is called **Field Settings** in the menu and has three tabs. Anyone who can open Applet Settings
can change these, and they apply to the whole tenant.

| Setting | Tab | What it controls | Default | Effect when on |
| :--- | :--- | :--- | :--- | :--- |
| `HIDE_EVENT_CODE` | Main | The Event Code field on Event Create and Event Edit, and the Event Code column on the listing | unset (off) | The field and the column disappear. |
| `HIDE_EVENT_TYPE` | Main | The Event Type field on Event Create and Event Edit, and the Event Type column on the listing | unset (off) | Same. New events then carry whatever Event Type was already set. |
| `RELABEL_COMPANY_TO_ENTITY` | Main | The word used for the company | unset (off) | Reads *Entity* instead of *Company* on Event Create, Event Edit, the event listing, the tab label of *Company Linking*, and both expense reports. Label only — the field still writes the company GUID. |
| `RELABEL_BRANCH_TO_JOB_GROUP` | Main | The word used for the branch | unset (off) | Reads *Job Group* instead of *Branch* on Event Edit and both expense reports. |
| `HIDE_ENTITY_LINKING_TAB` | Entity Linking | The *Company Linking* tab on Event Edit | unset (off) | The tab disappears. Existing links are kept, just not visible. |
| `HIDE_CALENDAR_LISTING_MENU` | Calendar Menu | The **Calendar Listing** sidebar entry | unset (off) | `app.component.ts` filters `calendars` out of `menuItems`. The route still resolves if typed. |
| `selectedCalendar` | Calendar Menu | The calendar new events default to | unset | Read by Event Create and by the calendar-member screens. The drop-down is loaded from `CmsCalendarHdrService` ordered by `updated_date DESC`. |

**Two controls on this screen are not read anywhere:**

- `HIDE_DEFAULT_SELECT_CALENDAR` renders as *Hide Default Select Calendar* and is saved. It hides the
  Default Select Calendar drop-down **on the settings screen itself**, and nothing else in the applet
  reads it — turning it on does not stop `selectedCalendar` being applied.
- `ENABLE_AUDIT_TRAIL` renders as *Enable Audit Trail* and is saved, but the key appears nowhere else
  in the applet — the `settings/applet-log` route is not gated on it (and has no menu entry either).

### Feature visibility and permissions

The applet has no `HIDE_*`/`SHOW_*` client-side permission pairing. Server-side:

| Area | Permission codes |
| :--- | :--- |
| Calendars (`calendar-hdrs`) | `TNT_API_CMS_CALENDAR_` `OWNER` / `ADMIN` / `CREATE` / `UPDATE` / `DELETE` / `READ` |
| Events (`calendar-events`) | `TNT_API_CMS_CALENDAR_` `OWNER` / `ADMIN` / `DELETE` / `READ` |
| Calendar members, participant links, post links, event link queues | the same `TNT_API_CMS_CALENDAR_*` family |
| Both expense reports | `TNT_AAT_CLAIM_REPORT_` `OWNER` / `ADMIN` / `CREATE` |

{{< callout type="warning" >}}
The expense screens are gated by **claim** permissions, not calendar permissions. Someone who can
create, edit and delete events will still get nothing from the Expenses tab or the Event Expense
Report unless they also hold `TNT_AAT_CLAIM_REPORT_CREATE` (or OWNER/ADMIN). Note that the read is
gated by a `_CREATE` code — the report endpoints are POSTs.
{{< /callout >}}

## Fields

### Event — Create and Details

| Field | Meaning | Required | Notes |
| :--- | :--- | :--- | :--- |
| Event Name (`title`) | The event's name | Yes | The listing calls this column *Title*. |
| PIC | Person in charge | No | Chosen from the employee listing; the name field itself is disabled and filled by the picker. |
| Company *(label: Entity when relabelled)* | Owning company | Yes | `Validators.required` plus `Validators.maxLength(255)`. |
| Event Code | Free-text reference | No | Hidden by `HIDE_EVENT_CODE`. |
| Event Type | `PRIVATE` or `PUBLIC` | No | Hidden by `HIDE_EVENT_TYPE`. A two-value list; there is no per-calendar privacy model behind it. |
| Event Venue (`location`) | Where it happens | No | |
| Start Date | When it starts | Yes | Pre-filled when the event is started from a slot in the calendar view. |
| End Date | When it ends | No | Nothing checks that it is after the start date. |
| All day | Whether the event spans the day | No | |
| Status | `ACTIVE` or `INACTIVE` | No | Two-value list. |
| Description | Free text | No | |
| Event Color | The colour in the calendar view | No | Defaults to `#b7c08b`. |
| Recurring | Whether the event repeats | No | Deleting a recurring event asks *"Delete recurring event"* before removing the series. |

### Calendar — Create and Main

| Field | Required | Notes |
| :--- | :--- | :--- |
| Calendar Name | Yes | |
| Time Zone | No | Stored on `bl_cms_calendar_hdr.timezone`. |
| Description | No | |

### Calendar members and event participants

Calendar members (Settings → Events Calendar Permission, or Calendar Edit → Members) carry Member
Name, Email and Status. Event participants carry Participant Name and Email. Both are links to
employees, added through a picker.

### Event expense report rows

Read-only, from the claim reports: Event Title, Event PIC Name, Employee Name, Claim ID, Claim Item,
Claim Status, Claim Amount. The single-event version inside Event Edit drops the Event Title and PIC
columns.

## Lifecycle and effects

### Posting proof

| Aspect | Value |
| :--- | :--- |
| Server document type | None. `bl_cms_calendar_hdr` and `bl_cms_calendar_event_hdr` are CMS master data, not generic documents. |
| Amount signum / quantity signum | Not applicable — no `FinancialDocDataConsistencyObject`. |
| Dr/Cr equation | None. The applet posts no journal and creates no claim. |
| GL precedence | Not applicable. |
| Stock processor | None. |
| What VOID reverses | There is no VOID and no posting status. Calendars and events carry `status` (`ACTIVE` / `INACTIVE`) only; an event is removed with Delete, which for a recurring event removes the series after a confirmation. |

### What it writes

| Screen | Table |
| :--- | :--- |
| Calendar Create / Edit | `bl_cms_calendar_hdr` |
| Calendar Edit → Members, Settings → Events Calendar Permission | `bl_cms_calendar_member_hdr` |
| Event Create / Edit | `bl_cms_calendar_event_hdr`, linked to its calendar through `bl_cms_calendar_event_link` |
| Event Edit → Company Linking | `bl_cms_calendar_event_company_link` |
| Event Edit → Events Participant | `bl_cms_calendar_event_participant_link` |
| Event Edit → Agenda | `bl_cms_event_attachment` |
| Event Edit → Expenses, Event Expense Report | **nothing** — both are reads against the claim report endpoints |

### How an expense reaches an event

`bl_aat_claim_document_line` carries a `calendar_event_hdr_guid` column that FKs to
`bl_cms_calendar_event_hdr`. A claim line tagged with an event is what makes that cost appear on the
event. The reports are `POST .../erp/audit-assurance-tax/claim/reports/event-expenses-reports/...`
(a multi-event variant and a `single-event/{calendar_event_hdr_guid}` variant, each with a
`/statistics` sibling that feeds the dashboard panel).

Nothing in this applet tags a claim line. The tagging happens on the claim side; this applet only
reports on it.

### The notification queue

`bl_cms_calendar_event_notification_queue` exists as a table with a validator
(`CmsCalendarEventLinkQueueDataConsistencyObject`) and a controller
(`CmsCalendarEventLinkQueueController`). No job processor under `akaun-api/.../jobProcessor/` reads
it. **Creating or changing an event sends no e-mail, SMS or notification** at the commits read here.

## Related applets

- [Employee](/applets/master-data/employee-applet/) — the PIC, the participants and the calendar
  members are all employee records.
- [Organization](/applets/master-data/organisation-applet/) and
  [Entity](/applets/master-data/entity-applet/) — the required Company on an event, and the entities
  attached on the Company Linking tab.
- [Engagement Applet](/applets/crm/engagement-applet/) — the other applet in the audit/assurance/tax
  family; both surface claim data rather than owning it.
- [CP Commerce Admin](/applets/ecommerce/cp-commerce-admin-applet/) — its Activities group also covers
  facilities, activities, calendars and scheduling, for the storefront rather than the back office.

## Troubleshooting

| Symptom | Cause | Fix |
| :--- | :--- | :--- |
| The Expenses tab and the Event Expense Report are empty or refuse to load, though events are visible | Both call `ClaimReportController`, gated by `TNT_AAT_CLAIM_REPORT_OWNER` / `_ADMIN` / `_CREATE`. Calendar permissions do not cover them. | Grant the claim-report permission. Note the read is behind a `_CREATE` code because the report endpoints are POSTs. |
| An event's costs never appear on the Expenses tab | An expense reaches an event only when a claim line is saved with `calendar_event_hdr_guid` set. Nothing in this applet tags a claim. | Tag the claim line with the event on the claims side. |
| Calendar Listing has disappeared from the sidebar | `HIDE_CALENDAR_LISTING_MENU` is on; `app.component.ts` filters the entry out of `menuItems`. | Turn it off in Field Settings. The `calendars` route still resolves if the URL is typed. |
| Turning on *Hide Default Select Calendar* does not stop new events defaulting to a calendar | `HIDE_DEFAULT_SELECT_CALENDAR` only hides the drop-down on the settings screen; nothing else reads it, and `selectedCalendar` keeps being applied by Event Create. | Clear `selectedCalendar` instead. |
| *Enable Audit Trail* does nothing | The key is saved and read by nothing; `settings/applet-log` is not gated on it. | The audit-trail screen is reachable at `settings/applet-log`, which has no menu entry — navigate by URL. |
| The settings gear opens on Feature Visibility, a screen with no menu entry | `settings` with no child redirects to `feature-visibility`, which is not in `settingItems`. | Pick Field Settings, Default Selection or Events Calendar Permission from the menu. |
| An event was saved with an End Date before its Start Date | Only Event Name, Company and Start Date carry validators; there is no cross-field date check on either side. | Correct it by hand. |
| Nobody was notified that an event was created or changed | `bl_cms_calendar_event_notification_queue` has a table, a validator and a controller but no job processor reads it. There is no e-mail, SMS or webhook on an event. | Announce events out of band. |
| "Events Calendar Permission" does not grant permissions | The settings entry of that name opens the calendar **member** listing — membership of a calendar, not a permission set. | Server-side access is the `TNT_API_CMS_CALENDAR_*` family, granted through the permission screens (routed but unlinked) or the Tenant Admin applet. |

## Related documentation

- [Employee Applet](/applets/master-data/employee-applet/)
- [Organization Applet](/applets/master-data/organisation-applet/)
- [Engagement Applet](/applets/crm/engagement-applet/)
