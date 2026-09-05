---
title: "Delivery And Installation Driver"
description: "Driver-facing half of the delivery module: a logged-in driver sees the trips a dispatcher assigned to them, starts and cancels jobs, reorders the stops on a trip, and completes each job with a proof of delivery (recipient name and IC, signature, photos, quantities delivered, failure reasons, cash collected)."
applet_code: "Delivery_Installation_Driver_Applet"
applet_repo: "blg-applet-wavelet-delivery-installation-driver-applet"
modules: [inventory]
related_applets: [delivery-installation-applet, driver-delivery-order-applet, internal-sales-order-applet, internal-sales-invoice-applet, internal-delivery-order-applet]
guides: []
sources:
  screens:
    - blg-applet-wavelet-delivery-installation-driver-applet/micro-fe/projects/wavelet-erp/applets/delivery-installation-driver-applet/src/app/app.routing.ts
    - blg-applet-wavelet-delivery-installation-driver-applet/micro-fe/projects/wavelet-erp/applets/delivery-installation-driver-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-delivery-installation-driver-applet/micro-fe/projects/wavelet-erp/applets/delivery-installation-driver-applet/src/app/services/trip-calendar-pages.service.ts
    - blg-applet-wavelet-delivery-installation-driver-applet/micro-fe/projects/wavelet-erp/applets/delivery-installation-driver-applet/src/app/components/trip-calendar-container/trip-calendar/trip-calendar.component.ts
    - blg-applet-wavelet-delivery-installation-driver-applet/micro-fe/projects/wavelet-erp/applets/delivery-installation-driver-applet/src/app/components/shared-components/trip/trip-details/trip-details.component.html
    - blg-applet-wavelet-delivery-installation-driver-applet/micro-fe/projects/wavelet-erp/applets/delivery-installation-driver-applet/src/app/components/shared-components/job/job-card/job-card.component.html
    - blg-applet-wavelet-delivery-installation-driver-applet/micro-fe/projects/wavelet-erp/applets/delivery-installation-driver-applet/src/app/components/shared-components/job/job-details/job-details.component.html
    - blg-applet-wavelet-delivery-installation-driver-applet/micro-fe/projects/wavelet-erp/applets/delivery-installation-driver-applet/src/app/components/shared-components/job/job-confirm-delivery/job-confirm-delivery.component.html
  configuration:
    - blg-applet-wavelet-delivery-installation-driver-applet/micro-fe/projects/wavelet-erp/applets/delivery-installation-driver-applet/src/app/app.routing.ts
    - blg-applet-wavelet-delivery-installation-driver-applet/micro-fe/projects/wavelet-erp/applets/delivery-installation-driver-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-delivery-installation-driver-applet/micro-fe/projects/wavelet-erp/applets/delivery-installation-driver-applet/src/app/components/settings-container/settings-container.component.ts
    - blg-applet-wavelet-delivery-installation-driver-applet/micro-fe/projects/wavelet-erp/applets/delivery-installation-driver-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-wavelet-delivery-installation-driver-applet/micro-fe/projects/wavelet-erp/applets/delivery-installation-driver-applet/src/app/components/settings-container/field-configuration/field-configuration.component.ts
    - blg-applet-wavelet-delivery-installation-driver-applet/micro-fe/projects/wavelet-erp/applets/delivery-installation-driver-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-delivery-installation-driver-applet/micro-fe/projects/wavelet-erp/applets/delivery-installation-driver-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-applet-wavelet-delivery-installation-driver-applet/micro-fe/projects/wavelet-erp/applets/delivery-installation-driver-applet/src/app/app.component.ts
    - blg-applet-wavelet-delivery-installation-driver-applet/micro-fe/projects/wavelet-erp/applets/delivery-installation-driver-applet/src/app/resolver/permission.resolver.ts
    - blg-applet-wavelet-delivery-installation-driver-applet/micro-fe/projects/wavelet-erp/applets/delivery-installation-driver-applet/src/app/state-controllers/shared-components-controller/store/effects/shared-components.effects.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/JobUows/JobsUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/TripsUows/TripsUow.java
  fields:
    - blg-applet-wavelet-delivery-installation-driver-applet/micro-fe/projects/wavelet-erp/applets/delivery-installation-driver-applet/src/app/components/shared-components/job/job-confirm-delivery/job-confirm-delivery.component.ts
    - blg-applet-wavelet-delivery-installation-driver-applet/micro-fe/projects/wavelet-erp/applets/delivery-installation-driver-applet/src/app/components/shared-components/job/job-confirm-delivery/job-confirm-delivery.component.html
    - blg-applet-wavelet-delivery-installation-driver-applet/micro-fe/projects/wavelet-erp/applets/delivery-installation-driver-applet/src/app/components/shared-components/signature-dialog/signature-dialog.component.ts
    - blg-applet-wavelet-delivery-installation-driver-applet/micro-fe/projects/wavelet-erp/applets/delivery-installation-driver-applet/src/app/components/shared-components/failure-details-dialog/failure-details-dialog.component.html
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/job/JobsController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/job/JobDocLineLinkController.java
  lifecycle:
    - blg-applet-wavelet-delivery-installation-driver-applet/micro-fe/projects/wavelet-erp/applets/delivery-installation-driver-applet/src/app/models/constants/job-delivery-statuses.constants.ts
    - blg-applet-wavelet-delivery-installation-driver-applet/micro-fe/projects/wavelet-erp/applets/delivery-installation-driver-applet/src/app/components/shared-components/job/job-details/job-details.component.ts
    - blg-applet-wavelet-delivery-installation-driver-applet/micro-fe/projects/wavelet-erp/applets/delivery-installation-driver-applet/src/app/state-controllers/shared-components-controller/store/effects/shared-components.effects.ts
    - blg-applet-wavelet-delivery-installation-driver-applet/micro-fe/projects/wavelet-erp/applets/delivery-installation-driver-applet/src/app/state-controllers/trip-calendar-controller/store/effects/trip-calendar.effects.ts
    - blg-applet-wavelet-delivery-installation-driver-applet/micro-fe/projects/wavelet-erp/applets/delivery-installation-driver-applet/src/app/state-controllers/app-controller/store/effects/app.effects.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/delivery/job-services/login-driver-job-hdr.service.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/delivery/job-services/login-driver-job-docline-link.service.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/delivery/job-services/login-driver-job-attachment.service.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/delivery/trip-services/login-driver-trip.service.ts
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/job/JobsController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/job/JobsDocController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/job/JobDocLineLinkController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/job/JobAttachmentController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/trip/TripsController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JobsService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JobAttachmentService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/del/DeliveryJobEventUpdateActionService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/JobUows/JobsUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/TripsUows/TripsUow.java
  troubleshooting:
    - blg-applet-wavelet-delivery-installation-driver-applet/micro-fe/projects/wavelet-erp/applets/delivery-installation-driver-applet/src/app/models/constants/toast.constants.ts
    - blg-applet-wavelet-delivery-installation-driver-applet/micro-fe/projects/wavelet-erp/applets/delivery-installation-driver-applet/src/app/state-controllers/app-controller/store/effects/app.effects.ts
    - blg-applet-wavelet-delivery-installation-driver-applet/micro-fe/projects/wavelet-erp/applets/delivery-installation-driver-applet/src/app/state-controllers/shared-components-controller/store/effects/shared-components.effects.ts
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/job/JobsController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/JobUows/JobsUow.java
    - gh:bigledger/blg-wiki#55
    - gh:bigledger/blg-applet-wavelet-delivery-installation-driver-applet#3
tags:
- field-service
- driver-app
- proof-of-delivery
- logistics-mobile
- trip-execution
weight: 186
---

## Overview

The Delivery And Installation Driver applet is the driver-facing half of BigLedger's delivery module. A dispatcher plans **Trips** and **Jobs** in the [Delivery Installation applet](/applets/delivery-installation/delivery-installation-applet/); a driver whose login is linked to a driver record opens this applet on a phone or tablet, sees only the trips assigned to them, and works through the stops: *Start Job*, then *Confirm Delivery* with a proof of delivery (recipient name and IC number, signature, photos, quantity delivered per item, failure reason for short or refused items, cash collected), or *Cancel Job*. Every action calls the backend's `login-driver-ep` endpoints, which check the driver's identity instead of the usual permission sets, write a job event, and roll the delivery status up to the source Sales Order, Sales Invoice, Delivery Order or Shipment so the office sees progress without a phone call.

The applet posts nothing to the General Ledger and moves no stock. A native Android build (repository `akn-kotlin-mobile-delivery-driver`) implements the same trip calendar, job screen, complete and cancel flow against the same endpoints; this page documents the web applet in the registry.

{{< callout type="info" >}}
**What the driver can and cannot do.** Drivers start, complete and cancel *jobs* and reorder the stops on a trip. They do not start or complete *trips*, do not choose custom statuses, do not back-date events and do not see jobs that are not on one of their trips. All of that stays with the dispatcher in the Delivery Installation applet.
{{< /callout >}}

## Where it fits

| Direction | Applet / object | Relationship |
|---|---|---|
| Upstream | [Delivery Installation applet](/applets/delivery-installation/delivery-installation-applet/) | Creates the driver record, the trips (with the driver assigned through `bl_del_trip_driver_link`), the jobs on each trip and the return-reason list this applet offers as *Failure Reason*. Nothing can be created here. |
| Upstream (indirect) | [Sales Order (Internal)](/applets/sales-workflow/internal-sales-order-applet/), [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [Delivery Order (Internal)](/applets/sales-workflow/internal-delivery-order-applet/), Shipments | The documents whose lines became the job lines the driver ticks off. Their item names and *Qty to Deliver* are what the checklist shows. |
| Identity | The driver's BigLedger login | A driver is recognised when `bl_del_driver_hdr.login_subject_guid` equals the caller's login subject and the driver is linked to at least one trip (`JobsUow.validateTripDriver`, `TripsUow.validateTripDriver`). |
| Downstream | Job events, proof of receipt, source-document `delivery_status` | Start / Complete / Cancel write a `bl_del_job_event`, update the job header, its document and shipment links, and set `PARTIALLY DELIVERED` / `FULLY DELIVERED` on the source document and shipment (`JobsService.getJobsDto`). Proof-of-delivery fields land in `bl_del_job_hdr.proof_rct_*` and `bl_del_job_docline_link.proof_rct_*`, `reason`, `qty_delivered`; photos and the signature in `bl_del_job_attachment`. |
| Alternative | [Driver Delivery Order Applet](/applets/inventory-workflow/driver-delivery-order-applet/) | The lightweight alternative when a single driver field on the Delivery Order is enough; it has no trips, jobs or proof of delivery. |

## Screens and menus

The applet has one menu item. The *Trip Listing* and *Job Listing* routes and menu entries exist in the source but are commented out (`app.routing.ts` L30–L37, `menu-items.ts` L14–L25), so the calendar is the only way in.

| Screen (column) | How you reach it | What it shows |
|---|---|---|
| **Trip Calendar** | Left menu › Trip Calendar (also the default route) | A month / week / day / agenda calendar (FullCalendar `dayGridMonth`, `timeGridWeek`, `timeGridDay`, `listMonth`; the initial view is Agenda) of the trips assigned to the logged-in driver. Clicking a trip opens Trip Details. |
| **Trip Details** | Click a trip on the calendar | Trip name, start and end date, duration (`end − start` as *Nhr Mmin*), delivery region, then one **job card** per job, sorted by `sequence_in_trip`. The *reorder* icon switches every card into edit mode with *move up* / *move down* arrows; *save* sends the new sequence, *cancel* restores the previous order. Only jobs whose status is Delivery Arranged, Ready To Ship, Out For Delivery, Complete or Cancelled are loaded (`trip-calendar.effects.ts` L29–L30). |
| **Job card** | Inside Trip Details | Job ID (`running_number_01`), recipient address (lines 1–5, city, postcode, state, country), planned start time, colour-coded status, recipient name and phone. |
| **Job Details** | Tap a job card | Status, Job ID, *Location* (the address as a `maps.google.com/?q=` link), Start Time, Client Name, *Contact Detail* (a `tel:` link), Duration, Remarks, and the item list as *item name (qty to deliver)*. The action bar shows **Cancel Job**, **Confirm Delivery** and **Start Job** depending on the status (see Lifecycle). |
| **Job Confirm Delivery** | *Confirm Delivery* on Job Details | The proof-of-delivery form: per-item checklist with quantity delivered and a *Failure Reason* dialog, Recipient Information (Name, IC Number, signature pad), Item Images (camera capture), Remarks, Cash Amount, and the **Complete Job** button. |

{{< figure src="/images/delivery-installation-driver-applet/trip-calendar-month.png" alt="Trip Calendar in Month view with Month, Week, Day and Agenda buttons" caption="Trip Calendar, Month view. The Month / Week / Day / Agenda buttons switch the FullCalendar view; trips assigned to the logged-in driver appear as events." >}}

{{< figure src="/images/delivery-installation-driver-applet/trip-calendar-week.png" alt="Trip Calendar in Week view with hourly rows" caption="Trip Calendar, Week view. Each trip is placed by its trip start and end date." >}}

**Settings and Personalization menus** (`menu-items.ts` L27–L57): *Settings › Field Settings* and *Default Selection*; *Personalization › Field Settings* and *Default Selection*. The Settings route also mounts the shared Webhook, Client-Side Permission, Permission Set, User / Team / Role Permission screens from blg-shared-utilities, and `settings` on its own redirects to the client-side permission listing. *Personalization › Field Settings* has no matching child route (`app.routing.ts` L85–L96 defines only `personal-default-selection` and `sidebar`), so it falls through to the applet's 404 page. None of these screens changes how the driver screens behave (see Configuration).

## Configuration

### Before you can use it

- **A driver record linked to the login**, created in the [Delivery Installation applet](/applets/delivery-installation/delivery-installation-applet/) › Driver Listing. The link is `bl_del_driver_hdr.login_subject_guid`; the Delivery Installation applet sets it through *Verify Email* (matches an existing `EMAIL_USERNAME` login principal) or *Send Invite*. Every `login-driver-ep` endpoint starts by checking that a non-deleted driver record with the caller's login subject exists **and** is linked to at least one trip (`JobsUow.validateTripDriver` L694–L709, `TripsUow.validateTripDriver` L449); otherwise the response is *not authorised* and the applet shows *Error: Failed to retrive trips*.
- **Trips with the driver assigned and jobs added**, planned in the Delivery Installation applet. The calendar query only returns trips whose `bl_del_trip_driver_link` points at the caller's driver record (`TripsUow.generateSqlForPost` L291–L297). A job can only be acted on if it has a trip (`guid_trip_hdr`; otherwise `JOB_HDR_OBJECT_GUID_TRIP_HDR_IS_NULL_OR_EMPTY`) and the driver is linked to that trip (`JobsUow.hasDriverPermission` L711–L722).
- **Return reasons**, maintained in the Delivery Installation applet › Settings › Return Reasons Settings (`bl_applet_config`, `param_code = RETURN_REASON`). They are offered as *Failure Reason* on each item — with the caveat under *Settings in other applets* below.
- **Applet access for the driver's login.** The driver only needs this applet assigned to their login; the driver endpoints do **not** check the `API_TNT_DM_DEL_*` permission families that the back-office applet uses (`JobsController.java` L523–L547, L1062–L1085, L1144–L1160; `JobsDocController.java` L169–L195; `JobAttachmentController.java` L303–L323 — all test the driver identity, none call `UserPermissionService.isUserPermitted`).

### Applet settings

Settings live in **applet-local components only**; there is no shared `FieldConfigurationComponent` from blg-shared-utilities for this applet code, no inline settings gear, and no settings key is read anywhere in the driver screens or effects. Who can change them is moot: no exposed control found (routes and settings components checked at commit be97a51). Specifically:

| Screen | State at commit be97a51 |
|---|---|
| Settings › Field Settings | A static template of eight `mat-slide-toggle`s (Unit Discount, SST/VAT/GST, WHT, Blanket Order, Segment, G/L Dimension, Profit Center, Project) bound to nothing and a *SAVE* button with no handler (`field-configuration.component.html`, `field-configuration.component.ts`). Nothing is declared, persisted or consumed. |
| Settings › Default Selection | Declares `DEFAULT_BRANCH` / `DEFAULT_LOCATION` writes into an `APPLET_SETTINGS` extension, but the component is routed directly, its `appletSettings$` input is never bound and `appletContainer` stays undefined, so picking a branch throws in `valueChanges` (`default-settings.component.ts` L31–L62) and *SAVE* emits `undefined`. No screen reads either key. |
| Personalization › Default Selection | Same code with the loader commented out (`personal-default-settings.component.ts` L31–L39). |

### Settings in other applets that control this applet

| Setting / master data | Where it is set | Effect here |
|---|---|---|
| Driver record → login link (`login_subject_guid`) | Delivery Installation applet › Driver Listing › *Verify Email* / *Send Invite* | Decides whether the login passes `validateTripDriver` at all. |
| Trip → driver assignment (`bl_del_trip_driver_link`) | Delivery Installation applet › Trips › Driver Name | Which trips appear on the calendar and which jobs can be started, completed, cancelled or reordered. Reassigning a trip removes the old driver's access immediately (`hasDriverPermission` re-runs on every call). |
| Jobs on the trip and their order | Delivery Installation applet › Trip › Jobs tab (*Add to Trip*, drag order) | The job cards and their initial `sequence_in_trip`; the driver's *reorder* writes the same column, so both sides see the latest order. |
| Return reasons (`RETURN_REASON` in `bl_applet_config`) | Delivery Installation applet › Settings › Return Reasons Settings | The *Failure Reason* dropdown. The driver applet queries the row with a **hard-coded** `applet_hdr_guid` (`shared-components.effects.ts` L243) that does not match the Delivery Installation applet's guid in the applet registry, whereas the Delivery Installation applet reads and writes the row under its own guid from the session. Unless a tenant's row happens to carry the hard-coded guid, the dropdown is empty (see Troubleshooting). |
| `JS_HIDE_JOB_STATUS`, `HIDE_BATCH_PRINT` and the other Delivery Installation settings | Delivery Installation applet › Application Settings | No effect here; the driver applet reads no settings. |
| Custom statuses (`bl_del_job_custom_status_hdr`) | Delivery Installation applet › Custom Status Settings | Not available to drivers: the driver applet has no custom-status screen or call. |

### Feature visibility / permissions

- **Client-side permissions:** none are seeded for `Delivery_Installation_Driver_Applet` in `bl_applet_client_side_perm_dfn` (0 rows on 2026-09-05), and the applet's own permission loading is commented out (`app.component.ts` L48–L140). The Client-Side Permission screen under Settings therefore has nothing to grant.
- **Server-side:** the driver endpoints gate on identity, in three SQL checks — `validateTripDriver` (is the caller a driver with any trip), `hasDriverPermission(tripGuid, subject)` (is the caller a driver on *this* job's trip; used by start, complete, cancel, attachment upload and job fetch) and `validateDriverUpdatePermission(jobGuid, subject)` (used by the proof-of-receipt updates). Failing the first returns *not authorised*; failing the others throws `YOU_ARE_NOT_AUTHORIZED_TO_MAKE_CHANGES` (status changes), `DRIVER_HAS_NO_ACCESS_TO_UPDATE_JOB_HDR_OBJECT_USING_THE_GUID_PROVIDED` / `…JOB_DOC_HDR_LINK_OBJECT…` (proof of receipt), or silently drops the job from a cancel request (`JobsDocController.java` L177–L188 collects only `approvedGuids`).
- The Permission Set / User / Team / Role screens under Settings are the shared components and manage the `API_TNT_DM_DEL_*` permissions of the *back-office* endpoints; they are not consulted by anything the driver applet calls.

## Fields

The only form is **Job Confirm Delivery** (`job-confirm-delivery.component.ts` L80–L93). Everything else is read-only.

**Items** — one row per job line (`bl_del_job_docline_links`)

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Delivered (checkbox) | Visual tick for the driver | No | Declared in the form but **not sent** to the backend; only *Quantity Delivered* and the failure details are saved (`shared-components.effects.ts` L87–L98). |
| Item name (qty to deliver) | `item_name` and `qty_to_deliver` from the job line | — | Read-only label. |
| Quantity Delivered (`#`) | `qty_delivered` on the job line | Yes (numeric) | Defaults to `qty_to_deliver`; validators `min(0)` and `max(qty_to_deliver)` (L89). A value outside the range makes the form invalid and disables *Complete Job*. Client-side only — the backend `updateProofOfReceipt` stores whatever it receives. |
| Failure Reason (dialog, `assignment_late` icon) | `reason` and `proof_rct_remarks` on the job line | No | *Failure Reason* is a dropdown of the return-reason **names**; *Remarks* free text. Leave empty for a fully delivered line. |

**Recipient Information, images and collection**

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Name | `proof_rct_name` on the job header and on every line | Yes | Pre-filled with the job's `recipient_name`. |
| IC Number | `proof_rct_id` on the job header and every line | Yes | Rendered as `type="number"`, so letters and hyphens cannot be typed; stored as text (`varchar(150)`). |
| Recipient's Signature (*Open Signature*) | One `bl_del_job_attachment` row, `obj_type = PHOTO` | Yes | Signature-pad dialog (`signature_pad`, min stroke width 5, canvas up to 500×300); *Save* returns a PNG data URL, *Clear* wipes it, *Cancel* keeps the previous one. |
| Item Images (camera icon) | `bl_del_job_attachment` rows, `obj_type = PHOTO` | Yes — at least one | `<input type="file" accept="image/*" capture="environment">`: one capture per tap, each shown as a thumbnail with a delete button. *Complete Job* stays disabled while `images.length < 1` (template L86). |
| Remarks | `proof_rct_remarks` on the job header | No | |
| Cash Amount | `collection_amount` on the job header (`numeric(70,22)`) | Yes | Required by the form even when nothing is collected — enter `0`. Not written to the job lines. |

Nothing captures GPS coordinates, a device timestamp, or the recipient's phone (`proof_rct_phone` exists in the tables but the form has no field for it and sends `undefined`).

## Lifecycle and effects

Not a document applet: no `*DataConsistencyObject` signum, no `JournalPostingTypeHandler`, no `JournalPostingService` call and no stock processor. The effects are delivery statuses, job events, proof-of-receipt columns, attachments and — through cancel — pick-pack-queue balances.

**Statuses as the driver sees them.** The applet compares `bl_del_job_hdr.delivery_status` lower-cased against its own list (`job-delivery-statuses.constants.ts`): `created`, `out_for_delivery`, `in progress`, `cancelled`, `complete`, `incomplete`, `ready_to_ship`, `delivery_arranged`. The backend only ever writes `DELIVERY_ARRANGED`, `READY_TO_SHIP`, `OUT_FOR_DELIVERY`, `COMPLETE`, `CANCELLED` / `Cancelled`, `DELIVERY_REARRANGED` and `JOB_RE_ARRANGED` (`DeliveryStatusConstant.java`); `created`, `in progress` and `incomplete` never occur, and re-arranged jobs are filtered out of the trip (`trip-calendar.effects.ts` L29–L30). Which buttons appear (`job-details.component.ts` L35–L38):

| Job status | Start Job | Confirm Delivery | Cancel Job |
|---|---|---|---|
| Delivery Arranged | yes | — | — |
| Ready To Ship | yes | — | yes |
| Out For Delivery | — | yes | yes |
| Complete, Cancelled | — | — | — |

Nothing in the backend enforces this order: the `login-driver-ep` start and complete endpoints accept any non-deleted job the driver is entitled to, except that complete rejects a job whose status is exactly `CANCELLED` (`JobsUow.getByGuidWithCondition` L820–L840). The only guards are the applet's button visibility above.

| Action | Calls (in order) | What the backend does |
|---|---|---|
| **Start Job** | `POST del/jobs/login-driver-ep/start-jobs/{guid}` | `hasDriverPermission`, then `JobsService.changeJobDeliverStatus(OUT_FOR_DELIVERY)` (`JobsController.java` L1113–L1128, `JobsService.java` L623–L644): sets `delivery_status` on the job header, its document-header links, document-line links and shipment links; writes a `bl_del_job_event` with `event_code = DELIVERY_STATUS_CHANGED`, `action = OUT_FOR_DELIVERY` and a description stamped with the **server** time in `dd MMM, HH:mm` (the single-guid endpoint passes an empty event time — `DeliveryJobEventUpdateActionService.createMeaningfulEventDescription` L56–L66); then rolls the status up to the source document and shipment. |
| **Reorder Jobs → save** | `POST del/jobs/login-driver-ep/update-job-sequence-in-trips/` | `validateTripDriver`, then `JobsUow.updateJobSequence` writes `sequence_in_trip` for the moved jobs only (`JobsController.java` L550–L575). No status change, no event. Jobs that arrive with a null sequence are numbered by their position on first load and included in the next save (`trip-details.component.ts` L63–L77). |
| **Complete Job** | 1. `PUT del/jobs/login-driver-ep/updateProofOfReceipt/{jobGuid}` — 2. `POST del/job-attachments/login-driver-ep` (multipart, all photos) — 3. `POST del/job-attachments/login-driver-ep` (multipart, signature) — 4. `PUT del/job-docline-links/login-driver-ep/updateProofOfReceipt/{lineGuid}` per item — 5. `POST del/jobs/login-driver-ep/complete-jobs/{guid}` — 6. `POST del/jobs/multi-jobs/login-driver-ep` to reload | Steps 1–4 run in parallel (`forkJoin`, `shared-components.effects.ts` L54–L124); step 5 runs only when all of them succeed. 1 writes `proof_rct_name`, `proof_rct_id`, `proof_rct_remarks`, `collection_amount` on the header (`JobsController.updatedPOR` L1091–L1110). 2–3 store each multipart file through `FileService.uploadFileForHdr` and insert a `bl_del_job_attachment` with `obj_type = PHOTO` (`JobAttachmentService.getContainersWithFileDetails` L53–L80); the applet builds one Blob from all captured data URLs and one from the signature data URL (effects L66–L77), so each call carries a single file. 4 writes name, IC, `reason`, `proof_rct_remarks` and `qty_delivered` on each line (`JobDocLineLinkController.updatedPOR`). 5 = `changeJobDeliverStatus(COMPLETE)` as for Start Job, then `updateGenDocDeliveryStatus` / `updateShipmentHdrDeliveryStatus` set `PARTIALLY DELIVERED` or `FULLY DELIVERED` on the source document and shipment. There is no transaction across the six calls: if 2 or 3 fails, 1 and 4 have already been saved and the job stays *Out For Delivery*. |
| **Cancel Job** | `POST del/job-docs/cancel-job/login-driver-ep` with `jobs_guids: [guid]` | For each job, `hasDriverPermission`; permitted jobs go to `JobsService.cancelJobs` (`JobsService.java` L401–L450): status `Cancelled` on the job and its document links, **each line's `qty_to_deliver` is added back to `bl_fi_pick_pack_queue.qty_balance`** so the dispatcher can re-plan the document, a cancellation event is written and the status rolled up. No reason is captured — a driver who needs to record *why* uses the per-item Failure Reason at completion instead. |
| Ready To Ship | `POST del/jobs/login-driver-ep/ready-to-ship` | Exists in the backend for drivers (`JobsController.java` L1310–L1330) but the applet has no button for it. |

Two backend details matter for support. First, the completion guard compares against `CANCELLED` while *Cancel Job* (here and in the back-office listings) stores `Cancelled`, so a job the driver cancelled is refused by the applet's own button logic but not by the backend (`JobsService.java` L413 vs `JobsUow.java` L828); only trip-level cancellation writes the upper-case value. Second, drivers cannot start or complete a **trip**: the only `login-driver-ep` trip endpoint is the query (`TripsController.java` L623–L655); trip status is the dispatcher's.

## Related applets

- [Delivery Installation applet](/applets/delivery-installation/delivery-installation-applet/) — plans everything this applet executes: driver records and their login link, trips, jobs, job order, return reasons. Driver actions show up there as job events and as the recipient / return data on the job lines.
- [Driver Delivery Order Applet](/applets/inventory-workflow/driver-delivery-order-applet/) — the other driver-facing applet, built on the Delivery Order's `delivery_driver_guid` rather than on trips and jobs; it has no proof of delivery.
- [Sales Order (Internal)](/applets/sales-workflow/internal-sales-order-applet/), [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [Delivery Order (Internal)](/applets/sales-workflow/internal-delivery-order-applet/) — the documents whose `delivery_status` becomes `PARTIALLY DELIVERED` / `FULLY DELIVERED` when the driver completes a job, and whose pick-pack balance is restored when the driver cancels one.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| The applet opens but the calendar is empty and a toast says *Error: Failed to retrive trips*. | The login is not recognised as a driver: no non-deleted `bl_del_driver_hdr` with this `login_subject_guid`, or the driver record is not linked to any trip (`validateTripDriver` returns false → *not authorised*). | In the Delivery Installation applet open the driver record, use *Verify Email* (or *Send Invite* and let the driver register), then assign the driver to a trip. |
| The calendar stays empty although the driver is on trips (the *Agenda* view says *No events to display*). | The calendar effect reads the paged trip response as if it were a single trip (`app.effects.ts` L52–L88: `a_a.bl_del_trip_hdr.guid` on the response envelope), which throws and ends in the same *Failed to retrive trips* toast; the same code is in the deployed bundle checked on 2026-09-05. The parallel `loadTrips$` effect parses the list correctly but feeds a store slice the calendar does not read. | Report to product; until the effect is fixed the web calendar cannot list trips. The Android driver app uses its own calendar code. |
| A trip shows fewer jobs than the dispatcher added. | Only jobs in Delivery Arranged, Ready To Ship, Out For Delivery, Complete or Cancelled are loaded; re-arranged jobs (`DELIVERY_REARRANGED`, `JOB_RE_ARRANGED`) are filtered out (`trip-calendar.effects.ts` L29–L30). | Have the dispatcher set the job back to Ready To Ship / Delivery Arranged. |
| *Complete Job* is greyed out. | The form is invalid or has no photo: Name, IC Number, Signature and Cash Amount are required, every Quantity Delivered must be between 0 and the quantity to deliver, and at least one image must be captured. | Fill the missing field (enter `0` in Cash Amount when nothing was collected), take a photo, check quantities. |
| *Error: Failed to complete job* with `JOB_HDR_GUID_DOES_NOT_EXIST_OR_CANCELLED_JOB_CANNOT_BE_COMPLETED`. | The dispatcher cancelled the whole trip (status `CANCELLED`) or deleted the job while the driver had it open. | Refresh the trip; the job's quantity has gone back to the pick-pack queue and a new job must be planned. |
| `YOU_ARE_NOT_AUTHORIZED_TO_MAKE_CHANGES`, `DRIVER_HAS_NO_ACCESS_TO_UPDATE_JOB_HDR_OBJECT_USING_THE_GUID_PROVIDED`, or a *Cancel Job* that "succeeds" but changes nothing. | The trip was reassigned to another driver, or the driver–trip link was deleted, between opening the job and tapping the button (`hasDriverPermission` / `validateDriverUpdatePermission` re-run on every call; cancel silently drops unauthorised jobs). | Check the trip's driver in the Delivery Installation applet. |
| The *Failure Reason* dropdown is empty even though return reasons are configured. | The driver applet looks the `RETURN_REASON` row up under a hard-coded applet guid (`shared-components.effects.ts` L243) that is not the Delivery Installation applet's guid in the registry, so the query returns no row. | Report to product (the effect should use the Delivery Installation applet's guid). Meanwhile record the reason in the line's *Remarks*. |
| Proof-of-delivery data is saved but the job is still *Out For Delivery*. | One of the parallel calls before `complete-jobs` failed (typically the attachment upload); the header and line proof fields were already written. | Open *Confirm Delivery* again, re-capture the photo and signature, and complete; the earlier values are overwritten. |
| Job events show a time the driver did not enter, and no year. | Driver actions use the single-guid endpoints with an empty event time, so the server stamps `dd MMM, HH:mm` at the moment of the call; the applet offers no date field. | Expected. Use the event's created-date column for the full timestamp. |
| *Personalization › Field Settings* shows the 404 page; *Default Selection* throws when a branch is picked. | Menu item without a route; Default Selection component never receives the applet container. | Neither screen configures anything (see Configuration); ignore. |
| IC numbers with letters cannot be entered. | The IC Number input is `type="number"`. | Enter the digits only; the value is stored as text. |

## Related documentation

- [Delivery Installation applet](/applets/delivery-installation/delivery-installation-applet/) — the dispatcher's reference, including trip and job statuses, return-reason and custom-status settings.
- [Inventory module](/modules-v2/inventory/) — outbound movements and delivery orders.
- No user guide covers the driver workflow yet; the sales-side guides [Installation Scheduling Workflow](/guides/sales-guides/installation-scheduling-workflow/) and [Partial Delivery Workflow](/guides/sales-guides/partial-delivery-workflow/) describe the documents that become jobs.
