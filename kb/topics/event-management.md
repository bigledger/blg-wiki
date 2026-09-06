---
topic: event-management
aliases: [events management, calendar, corporate events, bl_cms_calendar_hdr, bl_cms_calendar_event_hdr, event expense report]
applets: [eventManagementApplet]
modules: [sales-crm]
related: [claims, employee, organisation, engagement, cp-commerce-admin]
wiki:
  - content/en/applets/crm/events-management-applet.md
status: seed
updated: 2026-09-06
---

# Event management

Calendars and the events on them: `bl_cms_calendar_hdr`, `bl_cms_calendar_event_hdr` and the links
that put members on a calendar, participants on an event and companies against an event. Master data
plus links — no journal, no posting status. Costs appear against an event only because a staff claim
line is tagged with the event.

## Facts

- 2026-09-06 — Registry `eventManagementApplet` "Event Management Applet", TNT-USER, ACTIVE,
  `documentation_url` = a Confluence page. The applet's own layout header reads "Events Management".
  Four sidebar entries: Event Calender (scheduler), Event Listing, Calendar Listing, Event Expense
  Report.
  [src:git:blg-applet-wavelet-events-management-applet@ccbfcbb .../events-management-applet/src/app/models/menu-items.ts]
- 2026-09-06 — **The expense screens are reads against the claims module.** Both the Expenses tab
  inside Event Edit and the Event Expense Report call
  `POST .../erp/audit-assurance-tax/claim/reports/event-expenses-reports/...` (a multi-event variant
  and a `single-event/{calendar_event_hdr_guid}` variant, each with a `/statistics` sibling), gated by
  `TNT_AAT_CLAIM_REPORT_OWNER` / `_ADMIN` / `_CREATE`. Calendar permissions do not open them, and the
  read sits behind a `_CREATE` code because the endpoints are POSTs.
  [src:git:blg-akaun-platform-java@1ff620e akaun-api/.../auditAssuranceTax/claim/report/ClaimReportController.java]
- 2026-09-06 — A cost reaches an event because `bl_aat_claim_document_line.calendar_event_hdr_guid`
  FKs to `bl_cms_calendar_event_hdr`. Nothing in the events applet tags a claim line; the tagging
  happens on the claims side.
  [src:git:blg-akaun-platform-java@1ff620e client-sdk/.../auditAssuranceTax/claim/bl_aat_claim_document_line.java]
- 2026-09-06 — Server-side permissions are the `TNT_API_CMS_CALENDAR_` family
  (`OWNER`/`ADMIN`/`CREATE`/`UPDATE`/`DELETE`/`READ`) across calendars, events, members, participant
  links, post links and event link queues.
  [src:git:blg-akaun-platform-java@1ff620e akaun-api/.../cms/cmsCalendar/CmsCalendarHdrController.java]
- 2026-09-06 — `bl_cms_calendar_event_notification_queue` has a table, a DCO
  (`CmsCalendarEventLinkQueueDataConsistencyObject`) and a controller, and **no job processor under
  `akaun-api/.../jobProcessor/` reads it**. Creating or changing an event sends no e-mail, SMS or
  webhook.
- 2026-09-06 — Applet-local `FieldConfigurationComponent`, routed in preference to the shared screen
  although the shared-utilities submodule is present (METHOD §29). Nine controls, patched from the
  session master settings, saved through `SessionActions.saveMasterSettingsInit`. Seven are consumed:
  `HIDE_EVENT_CODE`, `HIDE_EVENT_TYPE`, `HIDE_ENTITY_LINKING_TAB`, `HIDE_CALENDAR_LISTING_MENU`,
  `selectedCalendar`, `RELABEL_COMPANY_TO_ENTITY`, `RELABEL_BRANCH_TO_JOB_GROUP`.
  [src:git:blg-applet-wavelet-events-management-applet@ccbfcbb .../settings-container/field-configuration/field-configuration.component.ts]
- 2026-09-06 — Two are dead: `ENABLE_AUDIT_TRAIL` is saved and read nowhere (the `settings/applet-log`
  route is not gated on it), and `HIDE_DEFAULT_SELECT_CALENDAR` only hides its own drop-down on the
  settings screen — turning it on does not stop `selectedCalendar` being applied by Event Create.
- 2026-09-06 — `HIDE_CALENDAR_LISTING_MENU` is enforced in `app.component.ts` by filtering the
  `calendars` item out of `menuItems`. The route still resolves if typed — a menu hide, not an access
  control. Same shape as every other `HIDE_*_MENU` key in the estate.
- 2026-09-06 — Event fields: Event Name (required), PIC, Company (required, maxLength 255), Event
  Code, Event Type (`PRIVATE`/`PUBLIC` — a two-value list, not a privacy model), Event Venue, Start
  Date (required), End Date, All day, Status (`ACTIVE`/`INACTIVE`), Description, Event Color
  (default `#b7c08b`), Recurring. No cross-field date validation on either side.
  [src:git:blg-applet-wavelet-events-management-applet@ccbfcbb .../event-container/event-create/event-create.component.ts]
- 2026-09-06 — Event Edit tabs: Details, *Company* Linking (hidden by `HIDE_ENTITY_LINKING_TAB`),
  Agenda (an attachment list over `bl_cms_event_attachment` — File Name, Size, Uploaded Date,
  Uploaded By, not a structured agenda), Events Participant (name and e-mail), Expenses. Calendar
  Edit has Main and Members.
- 2026-09-06 — The settings menu's **Events Calendar Permission** entry opens the calendar-member
  listing — membership, not a permission set.
- 2026-09-06 — `settings/webhook`, `settings/feature-visibility`, `settings/applet-log` and the
  permission wizard / set / user / team / role listings are all routed with no menu entry; `settings`
  with no child redirects to `feature-visibility`.
- 2026-09-06 — The repository also carries two scaffold projects,
  `akaun-platform/testApplet` and `akaun-platform/example-applet`, both routed at
  `applets/akaun/dev/example-applet`. They are not this applet; a naive `find -name app.routing.ts`
  hits them first.

## How it connects

- **claims** — the only source of an event's costs. Whichever page documents the AAT claims applet
  should own the explanation of how a claim line is tagged with an event; this applet only reports.
- **employee** — PIC, participants and calendar members are all employees.
- **organisation** / **entity** — Company is required on an event; the Company Linking tab attaches
  further entities.
- **engagement** — the sibling applet in the same audit/assurance/tax family; both read the claim
  reports without owning them.
- **cp-commerce-admin** — its Activities group covers facilities, activities, calendars and
  scheduling for the storefront; this applet is the back-office equivalent.

## Open questions

- What is `bl_cms_calendar_event_notification_queue` for, if no processor drains it? Was an event
  reminder planned?
- `bl_cms_calendar_post_link` and `CmsCalendarPostLinkController` exist but no screen in the applet
  uses them — is the calendar meant to carry CMS posts?
- Event Type `PRIVATE` / `PUBLIC` is stored and displayed but gates nothing found so far. Is any
  consumer filtering on it?
