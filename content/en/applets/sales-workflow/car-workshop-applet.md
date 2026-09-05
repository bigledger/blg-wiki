---
title: "Car Workshop Applet"
description: "Reference card for service advisors, technicians and administrators who operate the Car Workshop applet: the consultation record, its checklists and vehicle link, the documents it spawns (quotation, jobsheet, invoices, receipt), every exposed setting, and the real failure modes."
applet_code: "carWorkshopApplet"
applet_repo: "blg-applet-wavelet-car-workshop-applet"
modules: [crm-digital, financial-accounting]
related_applets: [internal-jobsheet-applet, internal-sales-quotation-applet, internal-sales-invoice-applet, internal-purchase-invoice-applet, internal-receipt-voucher-applet, customer-applet, organisation-applet, membership-admin-applet, workflow-design-applet]
guides: []
sources:
  screens:
    - blg-applet-wavelet-car-workshop-applet/micro-fe/projects/wavelet-erp/applets/car-workshop-applet/src/app/app.routing.ts
    - blg-applet-wavelet-car-workshop-applet/micro-fe/projects/wavelet-erp/applets/car-workshop-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-car-workshop-applet/micro-fe/projects/wavelet-erp/applets/car-workshop-applet/src/app/components/consultation-container/consultation-create-edit/consultation-create-edit.component.ts
    - blg-applet-wavelet-car-workshop-applet/micro-fe/projects/wavelet-erp/applets/car-workshop-applet/src/app/components/consultation-container/consultation-create-edit/consultation-create-edit.component.html
    - blg-applet-wavelet-car-workshop-applet/micro-fe/projects/wavelet-erp/applets/car-workshop-applet/src/app/components/consultation-container/consultation-listing/consultation-listing.component.ts
    - blg-applet-wavelet-car-workshop-applet/micro-fe/projects/wavelet-erp/applets/car-workshop-applet/src/app/components/consultation-container/consultation-create-edit/consultation-checklist/consultation-checklist.component.html
    - blg-applet-wavelet-car-workshop-applet/micro-fe/projects/wavelet-erp/applets/car-workshop-applet/src/app/components/internal-jobsheet-container/internal-jobsheet-edit/internal-jobsheet-edit.component.html
  configuration:
    - blg-applet-wavelet-car-workshop-applet/micro-fe/projects/wavelet-erp/applets/car-workshop-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-car-workshop-applet/micro-fe/projects/wavelet-erp/applets/car-workshop-applet/src/app/models/jobsheet-applet-settings.model.ts
    - blg-applet-wavelet-car-workshop-applet/micro-fe/projects/wavelet-erp/applets/car-workshop-applet/src/app/models/applet-constants.ts
    - blg-applet-wavelet-car-workshop-applet/micro-fe/projects/wavelet-erp/applets/car-workshop-applet/src/app/components/settings-container/field-configuration/field-configuration.component.ts
    - blg-applet-wavelet-car-workshop-applet/micro-fe/projects/wavelet-erp/applets/car-workshop-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-wavelet-car-workshop-applet/micro-fe/projects/wavelet-erp/applets/car-workshop-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-car-workshop-applet/micro-fe/projects/wavelet-erp/applets/car-workshop-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-applet-wavelet-car-workshop-applet/micro-fe/projects/wavelet-erp/applets/car-workshop-applet/src/app/components/settings-container/consultation-checklist-settings/checklist-create/checklist-create.component.ts
    - blg-applet-wavelet-car-workshop-applet/micro-fe/projects/wavelet-erp/applets/car-workshop-applet/src/app/components/settings-container/consultation-checklist-settings/checklist-edit/checklist-lines-listing/checklist-line-create/checklist-line-create.component.ts
    - blg-applet-wavelet-car-workshop-applet/micro-fe/projects/wavelet-erp/applets/car-workshop-applet/src/app/app.component.ts
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
  fields:
    - blg-applet-wavelet-car-workshop-applet/micro-fe/projects/wavelet-erp/applets/car-workshop-applet/src/app/components/consultation-container/consultation-create-edit/main-details/main-details.component.ts
    - blg-applet-wavelet-car-workshop-applet/micro-fe/projects/wavelet-erp/applets/car-workshop-applet/src/app/components/consultation-container/consultation-create-edit/main-details/select-vehicle/vehincle-create-edit.component/main-details/main-details.component.ts
    - blg-applet-wavelet-car-workshop-applet/micro-fe/projects/wavelet-erp/applets/car-workshop-applet/src/app/components/consultation-container/consultation-create-edit/main-details/select-vehicle/select-vehicle-listing.component.ts
    - blg-applet-wavelet-car-workshop-applet/micro-fe/projects/wavelet-erp/applets/car-workshop-applet/src/app/components/consultation-container/consultation-create-edit/consultation-requests-listing/consultation-requests-listing.component.ts
    - blg-applet-wavelet-car-workshop-applet/micro-fe/projects/wavelet-erp/applets/car-workshop-applet/src/app/components/consultation-container/consultation-create-edit/consultation-checklist/checklist-details/checklist-details.component.ts
    - blg-applet-wavelet-car-workshop-applet/micro-fe/projects/wavelet-erp/applets/car-workshop-applet/src/app/components/consultation-container/consultation-create-edit/consultation-checklist/checklist-car-condition/image-create/image-create.component.ts
    - blg-applet-wavelet-car-workshop-applet/micro-fe/projects/wavelet-erp/applets/car-workshop-applet/src/app/components/consultation-container/consultation-create-edit/consultation-checklist/checklist-listing/checklist-create/checklist.create.component.ts
    - blg-applet-wavelet-car-workshop-applet/micro-fe/projects/wavelet-erp/applets/car-workshop-applet/src/app/components/consultation-container/consultation-create-edit/consultation-checklist/checklist-quality-control/checklist-quality-control.component.ts
  lifecycle:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/AsvConsultationHdrDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/AsvChecklistHdrDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/AsvConsultationHdrService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/AsvConsultationHdrUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/AsvConsultationGenDocHdrLinkService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalJobsheetDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/permissions/TntAsvPermissions.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/AsvConsultationHdrController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/entity/EntityVehicleController.java
    - blg-applet-wavelet-car-workshop-applet/micro-fe/projects/wavelet-erp/applets/car-workshop-applet/src/app/state-controllers/consultation-controller/store/effects/consultation.effects.ts
    - blg-applet-wavelet-car-workshop-applet/micro-fe/projects/wavelet-erp/applets/car-workshop-applet/src/app/state-controllers/internal-jobsheet-controller/store/effects/internal-jobsheet.effects.ts
  troubleshooting:
    - blg-applet-wavelet-car-workshop-applet/micro-fe/projects/wavelet-erp/applets/car-workshop-applet/src/app/components/consultation-container/consultation-create-edit/main-details/main-details.component.ts
    - blg-applet-wavelet-car-workshop-applet/micro-fe/projects/wavelet-erp/applets/car-workshop-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - gh:bigledger/blg-applet-wavelet-car-workshop-applet#5
    - gh:bigledger/blg-applet-wavelet-car-workshop-applet#2
    - gh:bigledger/blg-wiki#321
  reviewed_at_commit:
    - blg-applet-wavelet-car-workshop-applet@94224f70
    - blg-shared-utilities (checked 2026-09-05)
    - blg-akaun-platform-java@871dbf5c
tags:
- automotive
- workshop-management
- consultation
- internal-jobsheet
- service-operations
weight: 205
---

## Overview

The **Car Workshop Applet** runs a vehicle service case from intake to billing. Its own record is the **consultation** (`bl_asv_consultation_hdr`): one branch, one vehicle, one consultant, an optional member, a list of customer requests and three inspection checklists (pre-inspection, safety, quality control) with photos. From inside a consultation the service advisor raises the financial documents — sales quotation, jobsheet, purchase invoice, sales invoice, receipt voucher — and the applet links each one back to the consultation. It is opened by front-desk advisors and technicians; administrators maintain the predefined checklists and the default branch.

{{< callout type="info" >}}
The consultation is not a financial document: it has no signums, no posting and no running-number reservation at FINAL. Its **Posting Status** field (OPEN / CLOSE / DRAFT) is a free label saved as-is. Money and stock move only through the documents created from its tabs — each of which is documented on its own page.
{{< /callout >}}

## Where it fits

| Direction | Document / applet | How it connects |
|---|---|---|
| Upstream (master data) | [Customer](/applets/master-data/customer-applet/), [Organisation](/applets/master-data/organisation-applet/), [Membership Admin](/applets/membership/membership-admin-applet/) | Account tab (entity), branch and consultant (employee), optional member card |
| Upstream (master data) | Vehicle records (`bl_fi_mst_entity_vehicle_hdr`, API `entity-vehicle-hdrs`) | A vehicle belongs to a customer entity; the consultation stores the vehicle GUID and registration number |
| Downstream | [Sales Quotation (Internal)](/applets/sales-workflow/internal-sales-quotation-applet/) | Created from the **Quotation** tab; linked through `bl_asv_consultation_gendoc_hdr_link` |
| Downstream | [Jobsheet (Internal)](/applets/sales-workflow/internal-jobsheet-applet/) | Created from the **JobSheet** tab or the applet's own **Job Sheet** menu (`INTERNAL_JOBSHEET`, both signums 0) |
| Downstream | [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/), [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/) | Created from the **Sales Invoice**, **Purchases** and **Receipt** tabs; the invoice bills the customer, the purchase invoice records supplier parts, the receipt voucher collects payment |

## Screens and menus

Route root: `applet/tnt/wavelet/erp/car-worshop-applet/` (the typo is in the code).

| Menu item | Route | What it shows |
|---|---|---|
| **Consultation** | `consultation` | Consultation listing (Consultation No, Consultation Name, Branch, Consultant, Member, Vehicle Plate, Last Update, Created Date, Status) with create and edit |
| **Job Sheet** | `internal-jobsheet` | Listing, create and edit of `INTERNAL_JOBSHEET` documents — the same document type as the standalone Jobsheet applet |
| **Settings** | `settings/…` | Field Settings, Checklist Settings, Default Selection, Webhook, permission listings, Release Notes, Audit Trail |
| **Personalization** | `personalization/…` | Per-user Default Selection (branch, location) and sidebar |

### The consultation form

Pressing **+** creates a working record with status `TEMP` (`POST consultation-hdrs/backoffice-ep/temp`, `AsvConsultationHdrController.java` L69–L80); the first Save updates it to `ACTIVE` (`consultation-create-edit.component.ts` L342). Tabs, in the default order (re-orderable under Settings → Default Selection): **Details**, **Account**, **Requests**, **Checklist**, **Quotation**, **JobSheet**, **Purchases**, **Sales Invoice**, **Receipt**. A Delete button on Details removes the consultation.

- **Details** — branch, vehicle plate (opens the *Select Vehicle Listing* side panel: Plate No, Brand, Model, Engine Capacity, Remarks; a new vehicle can be created there with plate, model and engine capacity required), consultation number, consultant, member card, description, posting status.
- **Account** — the shared entity picker (Entity Details, Bill To, Ship To).
- **Requests** — a grid of customer-reported issues: No., Description, Remarks, Status (checkbox), Created Date.
- **Checklist** — three inspection types, **Pre-Inspection**, **Safety** and **QC** (`checklist_type` = `PRE-INSPECTION`, `SAFETY`, `QUALITY-CONTROL`), each with sub-tabs **Details** (date, technician, description, status), **Car Condition** (photos with a position — FRONT / BACK / LEFT / RIGHT — and description) and **Checklist** (tick lines from the predefined checklists).
- **Quotation, JobSheet, Purchases, Sales Invoice, Receipt** — an embedded listing of the documents already linked to this consultation, with create/edit forms of the respective document type.

### Settings menu

| Settings entry | Route | Purpose |
|---|---|---|
| Field Settings | `settings/field-settings` | **Placeholder only** — see Configuration |
| Checklist Settings | `settings/consultation-checklist-settings` | Predefined checklist headers and their lines |
| Default Selection | `settings/default-selection` | Default branch and location; consultation tab order |
| Webhook | `settings/webhook` | Subscribe endpoints to document events |
| Client-Side Permission / Permission Set / User / Team / Role | `settings/*-listing` | Access control (shared permission module) |
| Release Notes, Audit Trail | `settings/release-notes`, `settings/applet-log` | Version history and settings audit |

## Configuration

### Before you can use it

| Prerequisite | Where | Why the consultation needs it |
|---|---|---|
| Company and branch | [Organisation](/applets/master-data/organisation-applet/) | Branch is required on Details (`Validators.required`, `main-details.component.ts` L79); picking a branch in Default Selection copies its `MAIN_LOCATION` |
| Employees (consultants, technicians) | [Organisation](/applets/master-data/organisation-applet/) | Consultant is required on Details (L83); technician is required on every checklist Details tab (`checklist-details.component.ts`) |
| Customer entities | [Customer](/applets/master-data/customer-applet/) | The Account tab is marked `[required]="true"`; a vehicle belongs to an entity |
| Members (optional) | [Membership Admin](/applets/membership/membership-admin-applet/) | Member card on Details |
| Predefined checklists | Settings → Checklist Settings (this applet) | The Checklist sub-tab can only tick lines that exist on a predefined checklist |
| Running number `CONSULTATION_RUNNING_NO` | Tenant running-number setup | Assigned on creation by the backend (`AsvConsultationHdrDataConsistencyObject.java` L192–L194) |
| API permissions `API_TNT_DM_ASV_CONSULTATION_HDR_{TEMP_CREATE,CREATE,READ,UPDATE,DELETE}`, `…_ASV_CONSULTATION_GENDOC_HDR_LINK_*`, `…_ASV_CHECKLIST_HDR_*`, `…_ASV_CHECKLIST_LINE_*`, `…_ASV_CONSULTATION_CHECKLIST_LINE_*`, `…_CHECKLIST_IMAGE_LINE_*` | Settings → Permission Set / User / Team / Role | Each ASV table has its own permission family (`TntAsvPermissions.java`); the document tabs additionally need the `TNT_API_DOC_INTERNAL_*` permissions of the document types they create |
| Everything the spawned documents need (default GL codes, tax codes, settlement methods, pricing) | See [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [Jobsheet (Internal)](/applets/sales-workflow/internal-jobsheet-applet/), [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/) | The consultation itself posts nothing |

### Applet settings

**Where the settings live.** `app.routing.ts` mounts three settings surfaces: the applet-local **Default Selection** (`settings/default-selection`, with a personal copy at `personalization/personal-default-selection`), the applet-local **Checklist Settings** (`settings/consultation-checklist-settings`) and **Field Settings** (`settings/field-settings`). Field Settings is routed to the applet's **own** `FieldConfigurationComponent` (`components/settings-container/field-configuration/`), not the shared one: it is a 50-line template of unbound `<mat-slide-toggle>` controls (Lines Settings: Unit Discount, SST/VAT/GST, WHT, Blanket Order; Department Settings…) with an empty component class and a SAVE button wired to nothing. **No setting can be saved from that screen.** Consequently the only keys that pass all four proofs in this applet are the Default Selection keys below.

Who can change them: any user who can open Settings; there is no finer per-setting authority. Personalization → Default Selection lets a user override `DEFAULT_BRANCH` / `DEFAULT_LOCATION` for themselves.

#### Default Selection (applet-local)

| Setting | Key | What it controls | Default | Effect when changed |
|---|---|---|---|---|
| Default Branch | `DEFAULT_BRANCH` (+ `DEFAULT_COMPANY`) | Pre-fills the branch on a new consultation; picking a branch copies its `MAIN_LOCATION` into Default Location | none (`new UntypedFormControl()`, `default-settings.component.ts` L55; reset to `null`, L106) | New consultations only |
| Default Location | `DEFAULT_LOCATION` | Default stock location used by the documents created from the consultation | none (L56) | New documents only |
| Details Tab Ordering | `CONSULTATION_DETAILS_TAB_ORDER` | Drag-and-drop order of the nine consultation tabs; tabs added by an upgrade are appended (L64–L80) | Details, Account, Requests, Checklist, Quotation, JobSheet, Purchases, Sales Invoice, Receipt (L40–L48) | Tab order for all users |

Save writes only these keys (`onSave()`, L94–L100).

#### Checklist Settings (applet-local master data)

A **checklist header** (`bl_asv_checklist_hdr`) has Name (required, max 255 — `checklist-create.component.ts` L96), Description and Remarks; its **lines** (`bl_asv_checklist_line`) each have Name (required, max 255), Description and Remarks. Headers and lines can be created, edited and deleted from the listing; the consultation's Checklist sub-tab shows every header with its lines as a tree of checkboxes (*Select All Checklists* at the top).

#### Rendered on Field Settings but not persisted

The stub screen shows toggles labelled *Unit Discount*, *SST/VAT/GST*, *WHT*, *Blanket Order* and a Department Settings panel. They are not bound to any form control, are not saved, and are not read by any component (`field-configuration.component.ts` is an empty class at commit `94224f70`). Switching them has no effect.

#### Read at runtime without a control in this applet

The embedded document forms (jobsheet, quotation, sales and purchase invoice, receipt voucher) are copies of the standalone applets' components and read the same setting keys from the master settings stored under `appletCode = carWorkshopApplet` (`app.component.ts` L67): 240 keys are declared across `applet-settings.model.ts` and `jobsheet-applet-settings.model.ts`, and 146 of them are actually read — the `HIDE_*` / `EXPAND_*` families, `DISABLE_GEN_DOC_LISTING`, `DEFAULT_POSTING_STATUS`, `DEFAULT_STATUS`, `DEFAULT_TRANSACTION_DATE`, `SORT_ORDER`, `FUZZY_SEARCH_COLUMNS`, `ENABLE_SERIAL_NUMBER_VALIDATION_FINAL`, `ENABLE_DRAFT_LOCK_SERIAL_NUMBER_CHECKING`, `DISALLOW_SELL_BELOW_MIN_PRICE` / `…_REPLACEMENT_PRICE` / `…_MA_COST`, `ENABLE_MULTIPLE_KO`, `ENABLE_CREDIT_LIMIT_FILTER`, `ALLOW_TO_CONTRA_MORE_THAN_DOC_OPEN_AMOUNT`, `EDIT_CONTRA_TXN_DATE`, the credit-card `HIDE_*` / `MANDATORY_*` keys, and so on. Because this applet has no working screen for them, they can only be set by an API write to the applet settings (or are simply absent, in which case every toggle behaves as *off / shown* and the documents behave like their standalone applets with default settings). Their meaning is documented on the standalone pages: [Jobsheet (Internal)](/applets/sales-workflow/internal-jobsheet-applet/), [Sales Quotation (Internal)](/applets/sales-workflow/internal-sales-quotation-applet/), [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/), [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/).

### Document behaviour settings

| Area | How it is configured |
|---|---|
| Consultation status | Record status `TEMP` → `ACTIVE` on first save (`INACTIVE` exists in `models/options.ts` but is not offered on the form). **Posting Status** is a plain dropdown — `OPEN`, `CLOSE`, `DRAFT` (`main-details.component.ts` L52–L56) — saved verbatim to `posting_status`; the backend attaches no behaviour to it (the DCO validates only guid, name, audit columns, status and revision, `AsvConsultationHdrDataConsistencyObject.java`). |
| Checklist status | Each checklist Details tab has the same `OPEN` / `CLOSE` / `DRAFT` dropdown (`checklist-details.component.ts` L58), saved to `consultation_status` on `bl_asv_consultation_checklist_detail_line`. |
| Document creation from tabs | Saving a new document on the Quotation / JobSheet / Purchases / Sales Invoice / Receipt tab creates the document through the normal generic-document API and then posts an `AsvConsultationGenDocHdrLink` (`consultation_guid`, `gen_doc_hdr_guid`, `server_doc_type`) — `internal-jobsheet.effects.ts` L338–L346 and the equivalent effect in each of the other four controllers. The tab listings filter by `consultation_guids` + `server_doc_type` (L42–L46). |
| Vehicle change propagation | Changing the vehicle on a consultation that already has linked documents rewrites `vehicle_registration_no` and `vehicle_hdr_guid` on every linked document header (`changeGenDocsVehicle$`, `consultation.effects.ts` L114–L175). |
| Posting of the spawned documents | Fixed by each document's own backend rules (jobsheet: both signums 0 — `InternalJobsheetDataConsistencyObject.java` L15–L17; invoice, purchase invoice, receipt voucher: see their pages). No applet setting here changes it. |
| Printables, e-Invoice, workflow, intercompany | No controls in this applet. |
| Webhooks | Settings → Webhook; the spawned documents emit their own `<SERVER_DOC_TYPE>_CREATED` events on creation through the API; the consultation tables have no webhook topic (`AsvConsultationHdrService.java` calls no `WebhookService`). |

### Feature visibility / permissions

API permissions (server-side) are per ASV table — `API_TNT_DM_ASV_CONSULTATION_HDR_{TEMP_CREATE,CREATE,READ,UPDATE,DELETE,OWNER,MEMBER,ADMIN}`, the same families for `ASV_CONSULTATION_GENDOC_HDR_LINK`, `ASV_CHECKLIST_HDR`, `ASV_CHECKLIST_LINE`, `ASV_CONSULTATION_CHECKLIST_LINE`, `ASV_CONSULTATION_CHECKLIST_IMAGE_LINE`, `ASV_CONSULTATION_CHECKLIST_DETAIL_LINE` and `ASV_CONSULTATION_REQUEST_LINE` (`TntAsvPermissions.java`) — plus `TNT_API_DOC_INTERNAL_JOBSHEET_*`, `…_INTERNAL_SALES_QUOTATION_*`, `…_INTERNAL_SALES_INVOICE_*`, `…_INTERNAL_PURCHASE_INVOICE_*` and `…_INTERNAL_RECEIPT_VOUCHER_*` for the document tabs, and `entity-vehicle-hdrs` create/update for vehicles.

Client-side permissions: the registry (`bl_applet_client_side_perm_dfn`) seeds **no** definitions for `carWorkshopApplet`. The embedded document forms check the same `SHOW_*` / `ALLOW_*` codes as their standalone applets; none can be granted here until they are seeded. Settings → Feature Visibility is not routed in this applet.

## Fields

**Consultation — Details** (`bl_asv_consultation_hdr`)

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Branch | Workshop branch (`guid_branch`) | Yes (`Validators.required`, `main-details.component.ts` L79) | Pre-filled from Default Selection |
| Vehicle Plate | Registration number (`vehicle_registration_no`) and the vehicle GUID behind it | Yes (L80) | Chosen from the Select Vehicle side panel; changing it on a saved consultation updates the linked documents |
| Consultation No | `consultation_running_no` | Generated | Assigned by the backend on creation from `CONSULTATION_RUNNING_NO` |
| Consultation Name | `name` | Backend rejects a *null* name (`ASV_CONSULTATION_HDR_OBJECT_NAME_IS_NULL_OR_EMPTY`) | Optional in the form; the applet sends the field as typed (an empty string passes the null check — `consultation-create-edit.component.ts` L335) |
| Consultant | Employee handling intake (`consultant_guid`) | Yes (L83) | |
| MemberCard | Linked member (`member_guid`) | No | Select Member panel |
| Description | Free text | No | |
| Posting Status | `OPEN` / `CLOSE` / `DRAFT` | No | Label only; see Document behaviour |
| Created / Modified by and dates | Audit | Read-only | |

**Vehicle** (`bl_fi_mst_entity_vehicle_hdr`, created from the Select Vehicle panel)

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Vehicle Plate No | `regnum` | Yes (`vehiclePlateNo`, `Validators.required`) | |
| Vehicle Model | `model_name` | Yes | Brand, manufacturer, variant and engine exist as columns and listing columns |
| Engine Capacity | `capacity` | Yes | |
| Remarks, Status | Free text, record status | No | The table also carries year, chassis and engine numbers, colour, mileage, last/next repair, road-tax, insurance, permit and inspection dates for other applets; this form does not expose them |
| Customer (entity), Bill To / Ship To | The vehicle's owner | Entity required on the vehicle's Account tab | |

**Requests** (`bl_asv_consultation_request_line`): Description, Remarks, Status (checkbox → `request_status`); rows are added with **+** and removed with the row action.

**Checklist** (per type `PRE-INSPECTION`, `SAFETY`, `QUALITY-CONTROL`)

| Sub-tab | Table | Fields | Required |
|---|---|---|---|
| Details | `bl_asv_consultation_checklist_detail_line` | Date (`txn_date`), Technician (`technician_guid`), Description, Status (`OPEN` / `CLOSE` / `DRAFT` → `consultation_status`) | Date, Technician, Status (`checklist-details.component.ts` — `Validators.required`) |
| Car Condition | `bl_asv_consultation_checklist_image_line` | Image (uploaded file), Position (`FRONT` / `BACK` / `LEFT` / `RIGHT`), Description | Position (`image-create.component.ts`) |
| Checklist | `bl_asv_consultation_checklist_line` | Ticked lines from the predefined checklists (`name`, `remarks`, `checklist_status`) | At least one line when saving a selection (`checklistLines`, `Validators.required`) |

**Job Sheet** (own menu and the JobSheet tab) — `INTERNAL_JOBSHEET` with tabs Search, Main Details, Account, Lines, Payment, Department Hdr on create, plus Delivery Details, Contra, Doc Link, Attachments, Export and Convert on edit. Field-level reference: [Jobsheet (Internal)](/applets/sales-workflow/internal-jobsheet-applet/).

## Lifecycle and effects

| Record | Statuses | Effects |
|---|---|---|
| Consultation | `TEMP` (created by **+**) → `ACTIVE` (first Save); deleted by the Delete button (`DELETE consultation-hdrs/backoffice-ep/{guid}` → `AsvConsultationHdrUow.delete`, a row delete, `AsvConsultationHdrUow.java` L69–L81) | Creation assigns `consultation_running_no` (`AsvConsultationHdrDataConsistencyObject.java` L192–L194). No journal, stock, ARAP or e-Invoice effect at any status. Posting Status `OPEN` / `CLOSE` / `DRAFT` is informational |
| Checklist detail / image / line rows | Saved with the consultation; each type has its own `OPEN` / `CLOSE` / `DRAFT` status | Stored only; nothing downstream reads them |
| Document links | Created when a document is saved from a tab; one row per document in `bl_asv_consultation_gendoc_hdr_link` | Deleting the consultation removes the consultation row; the linked documents remain as ordinary documents in their own applets |
| Jobsheet (from this applet) | DRAFT → FINAL → VOID, as in the Jobsheet applet | Both signums 0 (`InternalJobsheetDataConsistencyObject.java` L15–L17): FINAL assigns numbers only; see the jobsheet page for its posting proof |

**Posting proof block** (for the applet's own record)

| Item | Value | Source |
|---|---|---|
| Server document type | none — `bl_asv_consultation_hdr` is not a generic document; the embedded Job Sheet is `INTERNAL_JOBSHEET` | `AsvConsultationHdrDataConsistencyObject.java`; `models/applet-constants.ts` (`docType = "INTERNAL_JOBSHEET"`, `amount_signum = 0`, `quantity_signum = 0`) |
| Amount / quantity signum | not applicable (jobsheet: 0 / 0) | `InternalJobsheetDataConsistencyObject.java` L15–L17 |
| Dr/Cr equation, GL precedence, stock processor | none — nothing is posted by the consultation or by a jobsheet | `JournalPostingService.java` L96 skips zero-signum lines |
| What VOID reverses | no VOID on a consultation; a voided jobsheet reverses nothing | — |
| Money and stock | move only through the Sales Invoice, Purchase Invoice and Receipt Voucher created from the tabs | their pages |

## Related applets

- [Jobsheet (Internal)](/applets/sales-workflow/internal-jobsheet-applet/) — the work order; this applet embeds a full copy of it under its **Job Sheet** menu and **JobSheet** tab.
- [Sales Quotation (Internal)](/applets/sales-workflow/internal-sales-quotation-applet/) — quote raised from the **Quotation** tab.
- [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/) — customer billing from the **Sales Invoice** tab.
- [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/) — supplier parts from the **Purchases** tab.
- [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/) — collection from the **Receipt** tab.
- [Customer](/applets/master-data/customer-applet/), [Organisation](/applets/master-data/organisation-applet/), [Membership Admin](/applets/membership/membership-admin-applet/) — entity, branch/employee and member master data.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| Toggles on Settings → Field Settings do nothing | The screen is a placeholder with no bound controls and no save (`field-configuration.component.html`) | Expected; the embedded documents use default behaviour unless settings are written through the API |
| A checklist line or column you expected is hidden on the Lines grid of a jobsheet or invoice created here | Those documents read the `HIDE_*` keys stored under `carWorkshopApplet`, which were set through the API or copied from another tenant | Inspect the applet's master settings through the API; the standalone applet's settings do not apply here |
| Creating a consultation returned `CLIENT_QUERY_WRONG_FORMAT` / two consultations appeared | Race condition in the create flow (applet issue #5, fixed) | Upgrade the applet |
| Save disabled on Details | Branch, Vehicle Plate or Consultant empty — all three are required | Fill them; pick the vehicle from the side panel rather than typing a plate |
| Save disabled on a checklist Details tab | Date, Technician and Status are required | Fill them |
| Cannot save the Checklist sub-tab selection | No line ticked (`checklistLines` is required) | Tick at least one predefined line, or add lines under Settings → Checklist Settings first |
| Vehicle side panel shows no vehicles | Vehicles belong to customer entities; none exist yet | Create one from the panel (plate, model, engine capacity required) and link it to the customer |
| Linked documents still show the old plate after the vehicle was changed | Older build, or the propagation effect failed for one document (`changeGenDocsVehicleFailure`) | Reopen the document and correct the plate, or upgrade |
| Consultation deleted but its jobsheet / invoice still exist | Expected: the delete removes the consultation row only | Void or discard the documents in their own applets |
| "Do You Wish To Save Your Changes?" when leaving | Unsaved edits on the consultation (return pop-up) | Save or discard |

## Related documentation

- [CRM & Digital module](/modules-v2/crm-digital/), [Financial Accounting module](/modules-v2/financial-accounting/)
- [Sales Workflow applets](/applets/sales-workflow/)
