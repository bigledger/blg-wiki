---
title: "Rma Applet (Internal)"
description: "Reference for the Internal RMA applet — service notes, customer RMA and supplier RTV documents, customer-raised RMA requests, the RMA report, and the return-reason, request-action and workflow settings behind them."
applet_code: "InternalRmaApplet"
page_type: applet
applet_repo: "blg-applet-wavelet-internal-rma-applet"
modules: [sales-crm, inventory, financial-accounting]
related_applets:
  - workflow-design-applet
  - internal-sales-invoice-applet
  - customer-maintenance-applet
  - supplier-applet-1
  - organisation-applet
  - inv-item-maintenance-applet
  - warranty-admin-applet
guides: []
sources:
  screens:
    - blg-applet-wavelet-internal-rma-applet/micro-fe/projects/wavelet-erp/applets/internal-rma-applet/src/app/app.routing.ts
    - blg-applet-wavelet-internal-rma-applet/micro-fe/projects/wavelet-erp/applets/internal-rma-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-internal-rma-applet/micro-fe/projects/wavelet-erp/applets/internal-rma-applet/src/app/components/service-note-container/service-note-edit/service-note-edit.component.ts
    - blg-applet-wavelet-internal-rma-applet/micro-fe/projects/wavelet-erp/applets/internal-rma-applet/src/app/components/service-note-container/service-note-edit/service-note-edit.component.html
    - blg-applet-wavelet-internal-rma-applet/micro-fe/projects/wavelet-erp/applets/internal-rma-applet/src/app/components/customer-rma-container/customer-rma-edit/customer-rma-edit.component.html
    - blg-applet-wavelet-internal-rma-applet/micro-fe/projects/wavelet-erp/applets/internal-rma-applet/src/app/components/supplier-rtv-container/supplier-rtv-edit/supplier-rtv-edit.component.html
    - blg-shared-utilities/modules/settings/settings.component.html
  configuration:
    - blg-applet-wavelet-internal-rma-applet/micro-fe/projects/wavelet-erp/applets/internal-rma-applet/src/app/app.module.ts
    - blg-applet-wavelet-internal-rma-applet/micro-fe/projects/wavelet-erp/applets/internal-rma-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-internal-rma-applet/micro-fe/projects/wavelet-erp/applets/internal-rma-applet/src/app/components/settings-container/field-configuration/field-configuration.component.ts
    - blg-applet-wavelet-internal-rma-applet/micro-fe/projects/wavelet-erp/applets/internal-rma-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-wavelet-internal-rma-applet/micro-fe/projects/wavelet-erp/applets/internal-rma-applet/src/app/components/settings-container/reason-settings-container/reason-settings-create/reason-settings-create.component.ts
    - blg-applet-wavelet-internal-rma-applet/micro-fe/projects/wavelet-erp/applets/internal-rma-applet/src/app/components/settings-container/request-action-container/request-action-create/request-action-create.component.ts
    - blg-applet-wavelet-internal-rma-applet/micro-fe/projects/wavelet-erp/applets/internal-rma-applet/src/app/components/settings-container/workflow-settings-container/company-workflow-create/company-workflow-create.component.ts
    - blg-applet-wavelet-internal-rma-applet/micro-fe/projects/wavelet-erp/applets/internal-rma-applet/src/app/models/constants/applet-constants.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/permissions/TntSvcPermissions.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/svc/RMAReportExportController.java
  fields:
    - blg-applet-wavelet-internal-rma-applet/micro-fe/projects/wavelet-erp/applets/internal-rma-applet/src/app/components/service-note-container/service-note-create/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-rma-applet/micro-fe/projects/wavelet-erp/applets/internal-rma-applet/src/app/models/constants/sales-invoice-details.constants.ts
    - blg-applet-wavelet-internal-rma-applet/micro-fe/projects/wavelet-erp/applets/internal-rma-applet/src/app/models/customer-constants.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/rma-services/service-iussue-hdr.service.ts
  lifecycle:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalSalesRMADataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalSupplierRtvDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentTypeHandler.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/svc/SvcIssueRequestHdrController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/SvcIssueRequestHdrProcessor.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/svc/SvcIssueRequestHdrUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/table/SVCApprovalStatus.java
  troubleshooting:
    - blg-applet-wavelet-internal-rma-applet/micro-fe/projects/wavelet-erp/applets/internal-rma-applet/src/app/components/rma-submissions-container/rma-submissions-edit/rma-submissions-edit.component.ts
    - blg-applet-wavelet-internal-rma-applet/micro-fe/projects/wavelet-erp/applets/internal-rma-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
tags:
- rma
- returns-management
- stock-returns
- warranty
- internal-logistics
---

## Overview

The Internal RMA applet handles goods coming back. It carries three different records that are often
confused with each other: a **Service Note**, which is the repair or return job itself and lives in
its own `bl_svc_*` tables; a **Customer RMA**, a generic document of type `INTERNAL_SALES_RMA` that
authorises a return from a customer; and a **Supplier RTV**, a generic document of type
`INTERNAL_SUPPLIER_RTV` that sends goods back to a supplier. A fourth screen, **RMA Requests**, is
the inbox for requests raised by a logged-in customer or supplier entity, which become service notes
once approved.

It is opened by service desk and warehouse staff, and configured by whoever owns returns policy —
the return-reason and request-action code lists, and the workflow processes that drive a service
note's status, are all maintained inside this applet.

## Where it fits

| Direction | What | Why |
|---|---|---|
| Upstream | [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/) | A service note and a Customer RMA are normally raised against an item that was sold; the Customer RMA form carries the invoice item details |
| Upstream | [Customer Maintenance](/applets/master-data/customer-maintenance-applet/) and [Supplier](/applets/master-data/supplier-applet-1/) | The entity on a service note, Customer RMA or Supplier RTV |
| Upstream | [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) | The item, serial number and unit of measure on every line |
| Configuration | [Workflow Design Applet](/applets/master-data/workflow-design-applet/) | Supplies the workflow *processes* whose statuses a service note moves through. Nothing else in the product uses that engine |
| Downstream | Generic document flow | A Supplier RTV moves stock (quantity signum +1) and posts; a Customer RMA does neither (both signums 0) |
| Adjacent | [Warranty Admin](/applets/rma/warranty-admin-applet/) | Warranty and expiry dates on the service note |

## Screens and menus

The applet mounts at `applet/tnt/wavelet/erp/internal-rma-applet` with eight sidebar entries.

| Menu | Route | Backing table / document | What it is |
|---|---|---|---|
| Service Note | `service-note` | `bl_svc_issue_hdr` (`svc/issue-hdrs`) | The repair / return job. Not a generic document |
| Customer RMA | `customer-rma` | generic document `INTERNAL_SALES_RMA` | Return authorisation from a customer |
| Customer RMA Line | `customer-rma-line-listing` | the same document's lines | A line-level view across all Customer RMAs |
| Supplier RTV | `supplier-rtv` | generic document `INTERNAL_SUPPLIER_RTV` | Return to vendor |
| Supplier RTV Line | `supplier-rtv-line-listing` | the same document's lines | A line-level view across all Supplier RTVs |
| RMA Requests | `rma-submissions` | `bl_svc_issue_request_hdr` (`svc/issue-request-hdrs`) | Requests raised by a logged-in entity, awaiting approval |
| RMA Report | `rma-report` | `svc/rma-reports` | A flat report across service notes |
| Audit Trail | `audit-trail` | shared audit-trail module | Applet-level change history |

### Service Note

The edit screen's tabs are Main Details, Account, Gen Doc, Replacement (with Replacement Details and
Replacement Tracking sub-tabs), Attachments, Export and Events. Every tab except Main Details can be
hidden by an applet setting, and the whole set can be reordered from Default Selection. A separate
simplified layout replaces the Main Details form when `SIMPLIFIED_UI` is on.

The **Lines** tab exists in the template but is commented out.

### Customer RMA and Supplier RTV

Both edit screens carry the same tabs: Main Details, Account, Lines, Attachments, Export, Events.
A "Doc Link" tab and, on Customer RMA, "RMA Doc" and "Gen Doc" tabs are commented out.

{{< callout type="info" >}}
The Supplier RTV Line listing renders with the heading **"Customer RMA Line Items Listing"** — the
supplier line screen re-uses the customer component's title. The data underneath is correct; only
the heading is wrong.
{{< /callout >}}

### RMA Requests

{{< figure src="/images/internal-rma-applet/rma-report.png" title="RMA Report" alt="The RMA Report grid with Service Note, Item Name, Serial No, Customer, Reason, Request Action, Service Note date, Workflow, Report date and Category columns" >}}

### Settings

{{< figure src="/images/internal-rma-applet/settings-overview.png" title="Applet Settings" alt="The Applet Settings menu showing System Configuration with Application Settings, Default Selection, Printable Format Settings, Return Reasons Settings, Request Action Settings and Workflow Settings; Server Side Permissions; and Developer Tools" >}}

Unlike most applets in this repo, every entry the shared settings shell renders here has a matching
route: Permission Wizard, Permission Set, User Permission, Role Permission, Release Notes and Applet
Log (labelled *Audit Trail*) are all declared in `app.routing.ts`. Two routes exist with no menu
link — `webhook` and `feature-visibility` — and `client-side-permission-listing` is the default
redirect for `settings`, so opening Settings lands on the client-side permission grid even though
the menu does not point there.

## Configuration

### Before you can use it

| Prerequisite | Where it is set | Why it matters here |
|---|---|---|
| Company, branch and location | [Organization](/applets/master-data/organisation-applet/) | Branch and Location are required on a service note |
| Customer and supplier entities | [Customer Maintenance](/applets/master-data/customer-maintenance-applet/), [Supplier](/applets/master-data/supplier-applet-1/) | The party on every document here |
| Items with serial numbers where relevant | [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) | `MAKE_SERIAL_NO_MANDATORY` makes the serial number required |
| At least one workflow process per role you want statuses for | [Workflow Design Applet](/applets/master-data/workflow-design-applet/) | Without a process, the Workflow status drop-downs on a service note have nothing to offer |
| A `bl_fi_comp_workflow_gendoc_process_template_hdr` row per company | This applet → Settings → Workflow Settings | Binds a workflow process to a company for `INTERNAL_SALES_RMA` |
| Return reason codes and request action codes | This applet → Settings | Both are required-code, required-name master lists with no seed data |
| Jasper printable formats | This applet → Settings → Printable Format Settings | Needed before a service note, Customer RMA or Supplier RTV can be printed |

### Applet settings

Settings are **applet-local**: `app.routing.ts` imports this applet's own `FieldConfigurationComponent`
and `DefaultSettingsComponent`, plus four further settings screens, and `AppletSettingsModule` is in
`AppModule.imports`. The applet does carry the `blg-shared-utilities` submodule, but only for the
permission, layout and audit-trail modules — not for the settings screen.

The **Application Settings** screen (route `field-settings`, labelled "Application Settings" in the
menu) is the real one, and it is unusually complete: **82 keys are declared in the form, all 82 are
rendered as controls, and all 82 are persisted** by a single `saveMasterSettingsInit` dispatch of
`this.form.value`. **68 of them are consumed** somewhere in the applet. This is the opposite of the
unbound eight-toggle stub found in several master-data applets.

{{< figure src="/images/internal-rma-applet/settings-application-settings.png" title="Application Settings" alt="The Application Settings screen with Sidebar Menu, Service Note, Customer RMA, Supplier RTV and Report tabs, showing the HIDE_CUSTOMER_RMA_LISTING, HIDE_CUSTOMER_RMA_LINE_LISTING, HIDE_SUPPLIER_RTV, HIDE_SUPPLIER_RTV_LINE, HIDE_RMA_REQUESTS and HIDE_RMA_REPORT toggles" >}}

The screen groups the toggles into five tabs — Sidebar Menu, Service Note, Customer RMA, Supplier
RTV, Report — and labels each toggle with its raw key name. Only a tenant user who can reach
*Settings* can change them; they apply tenant-wide.

**Menu visibility** (Sidebar Menu tab)

| Setting | What it controls |
|---|---|
| `HIDE_CUSTOMER_RMA_LISTING`, `HIDE_CUSTOMER_RMA_LINE_LISTING` | The two Customer RMA menu entries |
| `HIDE_SUPPLIER_RTV`, `HIDE_SUPPLIER_RTV_LINE` | The two Supplier RTV menu entries |
| `HIDE_RMA_REQUESTS`, `HIDE_RMA_REPORT` | The RMA Requests and RMA Report entries |

**Service note tabs**

| Setting | What it controls |
|---|---|
| `HIDE_ACCOUNT_TAB`, `HIDE_GEN_DOC`, `HIDE_REPLACEMENT_TAB`, `HIDE_ATTACHMENT_TAB`, `HIDE_EXPORT_TAB`, `HIDE_EVENTS_TAB` | The six hideable tabs on the service note edit screen. Main Details has no hide key and cannot be removed |

**Workflow**

| Setting | What it controls | Default |
|---|---|---|
| `WORKFLOW_PROCESS_GUID` | The internal workflow process a service note follows | Empty |
| `CUSTOMER_WORKFLOW_PROCESS_GUID` | The process behind the customer-facing status | Empty |
| `SUPPLIER_WORKFLOW_PROCESS_GUID` | The process behind the supplier-facing status | Empty |
| `SHOW_CUSTOMER_WORKFLOW_STATUS`, `SHOW_SUPPLIER_WORKFLOW_STATUS` | Whether those two status drop-downs appear at all — opt-in, not hide toggles | Off |

Each of the three process settings is a drop-down over the processes defined in the
[Workflow Design Applet](/applets/master-data/workflow-design-applet/).

**Field and control visibility on the service note** — all default off (a `HIDE_*` key is only true
once it has been saved as true):

`HIDE_CRM_CONTACT`, `HIDE_MEMBER_CARD`, `HIDE_SALES_AGENT`, `HIDE_EXPIRY_DATE`,
`HIDE_EXTENDED_EXPIRY_DATE`, `HIDE_CUSTOMER_REQUEST_SERVICE_NOTE_DATE`, `HIDE_TERMS`,
`HIDE_REFERENCE`, `HIDE_REASON`, `HIDE_BRANCH`, `HIDE_LOCATION`, `HIDE_UOM`,
`HIDE_EXTERNAL_SERVICE_NOTE`, `HIDE_INVOICE_ITEM`, `HIDE_SERVICE_AND_REPAIR`,
`HIDE_REPLACED_SERVICE_ITEM`, `HIDE_SERVICE_NOTE_CLOSED_DATE`, `HIDE_ITEM_CODE`,
`HIDE_PURCHASE_DATE`, `HIDE_WARRANTY_EXPIRY_DATE`, `HIDE_REMARKS`, `HIDE_REPLACEMENT_ITEM_CODE`,
`HIDE_SERVICE_NOTE_NO`, `HIDE_DATE_TXN`, `HIDE_CUSTOMER`, `HIDE_ITEM_NAME`, `HIDE_SERIAL_NUMBER`,
`HIDE_REPLACEMENT_ITEM_NAME`, `HIDE_REPLACEMENT_ITEM_SERIAL_NO`, `HIDE_REQUEST_ACTION`,
`HIDE_EMAIL`, `HIDE_DELETE_BUTTON`, and the Add Item sub-form's `HIDE_ADD_ITEM_UOM`,
`HIDE_ADD_ITEM_SERIAL_NO`, `HIDE_ADD_ITEM_EXPIRY_DATE`, `HIDE_ADD_ITEM_EXTENDED_EXPIRY_DATE`.

**Branch and location controls on the two documents**: `HIDE_CUSTOMER_RMA_BRANCH`,
`HIDE_CUSTOMER_RMA_LOCATION`, `HIDE_CUSTOMER_RMA_SENDING_BRANCH`,
`HIDE_CUSTOMER_RMA_RECEIVING_BRANCH`, `HIDE_SUPPLIER_RTV_BRANCH`, `HIDE_SUPPLIER_RTV_LOCATION`,
`HIDE_SUPPLIER_RTV_SENDING_BRANCH`, `HIDE_SUPPLIER_RTV_RECEIVING_BRANCH`, and
`HIDE_SENDING_RECEIVING_BRANCH_TAB_FOR_CORPORATE`.

**Behaviour switches**

| Setting | What it controls |
|---|---|
| `SIMPLIFIED_UI` | Replaces the service note Main Details form with a cut-down layout |
| `AUTO_UI` | An alternative service note layout |
| `REASON_UI` | Whether Reason is a drop-down over the Return Reasons list (`DROP_DOWN`) or a free-text box (`INPUT_FIELD`) |
| `SHOW_REASON_DESCRIPTION` | Shows a free-text reason description alongside the coded reason. Opt-in |
| `MAKE_SERIAL_NO_MANDATORY` | Makes the serial number required on the service note |
| `ENABLE_PIC_SELECTION` | Enables the person-in-charge (assignee / reporter) selection |

**Keys that are declared, rendered and saved but read by nothing** — do not rely on them:

| Setting | Note |
|---|---|
| `HIDE_CUSTRMA_DOC_NO` | No reader anywhere in the applet or the Java backend |
| `HIDE_SUPRTV_DOC_NO` | Same |
| `HIDE_WORKFLOW_STATUS` | Same. Use `SHOW_CUSTOMER_WORKFLOW_STATUS` / `SHOW_SUPPLIER_WORKFLOW_STATUS` for the two entity-facing statuses; the internal status has no working hide key |
| `HIDE_WORKFLOW_RESOLUTION` | Same |
| `ITEM_CATEGORY_GROUP_1` … `_10` | Ten multi-select label-list controls, saved and never read. The identically named `ITEM_CATEGORY_GROUP_*` symbols in the Java tree belong to the financial-item CSV import and are unrelated |

Two keys appear in `models/applet-settings.model.ts` but not on this screen: `SERVICE_NOTE_DETAILS_TAB_ORDER`
(owned by Default Selection, below) and `salesManLabels`, which is model-only.

### Default Selection

{{< figure src="/images/internal-rma-applet/settings-default-selection.png" title="Default Selection" alt="The Default Selection screen with an Applet Default Settings panel holding Default Branch and Default Location, a Service Note Details Tab Ordering panel, and SAVE and RESET buttons" >}}

| Setting | What it controls | Effect when changed |
|---|---|---|
| `DEFAULT_BRANCH`, `DEFAULT_LOCATION` | Pre-selected branch and location | Applied when a new record is started |
| `SERVICE_NOTE_DETAILS_TAB_ORDER` | The order of the seven service note tabs | The edit screen sorts its panels by the saved order and appends any tab not in the saved list at the end, so a tab added in a later release still appears |

### Return Reasons, Request Actions and Printable Formats

{{< figure src="/images/internal-rma-applet/settings-return-reasons.png" title="Return Reasons Settings" alt="The Return Reasons Settings listing with Reason Code and Reason Name columns" >}}

{{< figure src="/images/internal-rma-applet/settings-request-action.png" title="Request Action Settings" alt="The Request Action Settings listing with Request Action Code and Request Action Name columns" >}}

Both are simple two-column masters — code and name, both required — stored at
`svc/return-reasons` and `svc/request-actions`. Neither ships with seed data. Return reasons only
reach the service note form when `REASON_UI` is `DROP_DOWN`.

Printable Format Settings lists the Jasper formats available to this applet and marks one as the
default selection per document type.

### Workflow Settings

This screen writes `bl_fi_comp_workflow_gendoc_process_template_hdr` rows: a company, a workflow
process, this applet's GUID, a description, and `server_doc_type` hard-coded to `INTERNAL_SALES_RMA`.
Company and process are both required.

{{< callout type="info" >}}
This applet is the only consumer of the Workflow Design engine in the product. A service note carries
three independent workflow status fields — internal, customer-facing and supplier-facing — each
pointing at its own process. Which statuses a user can move to is decided by the workflow's
transition-to-role-to-user join, so a user with no role row sees an empty drop-down. See
[Workflow Design Applet](/applets/master-data/workflow-design-applet/) for how the processes,
statuses and transitions are built.
{{< /callout >}}

### Personalization

The Personalization menu offers only Default Selection (the Field Settings entry is commented out).
The screen never populates its applet container — the subscription that would do so is commented
out — so its branch and location handlers dereference `undefined` on the first change and SAVE
emits nothing. No personal default is stored.

### Feature visibility and permissions

Access control is server-side, through the `TntSvcPermissions` families. Each endpoint accepts the
`ADMIN` and `OWNER` variants alongside the one named.

| Family | Gates |
|---|---|
| `TNT_API_DM_SVC_ISSUE_HDR_*` | Service notes. **Also gates the RMA Report and both settings masters** |
| `TNT_API_DM_SVC_ISSUE_REQUEST_HDR_*` | RMA Requests, including the approve / reject action, which needs the `UPDATE` variant |
| `TNT_API_DM_SVC_DOC_HDR_*`, `_DOC_LINE_*`, `_DOC_EVENT_*`, `_DOC_ATTACHMENT_*` | Service documents, their lines, events and attachments |
| `TNT_API_DM_SVC_RETURN_REASON_*` | Return reason master (create / update / delete) |
| `TNT_API_DM_SVC_REQUEST_ACTION_*` | Request action master (create / update / delete) |
| `API_TNT_DM_SVC_ISSUE_PROCESSING_QUEUE_*` | The service issue processing queue |
| `TNT_API_DOC_INTERNAL_SALES_RMA_*` | The Customer RMA generic document |
| `TNT_API_DOC_INTERNAL_SUPPLIER_RTV_*` | The Supplier RTV generic document |

{{< callout type="warning" >}}
**Reading the return-reason and request-action lists needs `TNT_API_DM_SVC_ISSUE_HDR_READ`, not the
family that owns them.** So does the RMA Report. A user granted the full
`TNT_API_DM_SVC_RETURN_REASON_*` family but not the issue-header family can create and edit return
reasons and cannot list them.
{{< /callout >}}

## Fields

### Service Note — Main Details

Only four controls carry `Validators.required`: **Branch**, **Location**, **Status**, and — when
`ENABLE_PIC_SELECTION` is on — **Assignee** and **Reporter**.

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Service Note No. | The record's number | No | Read-only; assigned on save |
| External Service Note No. | The number in a third-party system | No | Hidden by `HIDE_EXTERNAL_SERVICE_NOTE` |
| Branch, Location | Where the job sits | Yes | Hidden by `HIDE_BRANCH` / `HIDE_LOCATION` — which does not remove the validator |
| RMA Type | e.g. `INTERNAL` | No | |
| Faulty Goods Pickup Type | How the goods come back | No | |
| Service Note Date, Customer Request Start, Service Note Closed Date | The three dates | No | Two of them have hide keys |
| Status | The record's own status | Yes | `ACTIVE` / `INACTIVE`. This is **not** the workflow status |
| Workflow status, Customer status, Supplier status | Position in each of the three workflow processes | No | Each is a drop-down over its process's transitions |
| Resolution | The workflow resolution | No | |
| Reason, Reason Description | Why the item came back | No | Drop-down or free text per `REASON_UI` |
| Request Action | What the customer asked for | No | Drop-down over Request Action Settings |
| Item Code, Item Name, UOM, Serial Number, Quantity | The item | Serial number only if `MAKE_SERIAL_NO_MANDATORY` | |
| Purchase Date, Warranty Expiry, Malfunction Date, Estimated Delivery Date | Warranty context | No | |
| Expiry Date, Extended Expiry Date | Service commitment dates | No | |
| Replacement item code / name / serial number | The item given back | No | |
| Parts Cost, Labour Cost, Disposal Cost, Gov Tax, Total Charges, Paid Amount | The charge breakdown | No | Captured on the service note; no journal is posted from here |
| CRM Contact, Member Card, Sales Agent, Terms, Reference, Tracking ID, Remarks | Assorted | No | Each has its own hide key |
| Assignee, Reporter | Person in charge | Yes when `ENABLE_PIC_SELECTION` is on | |

A fixed progress list is also available on the record — *Ready to send out from Branch, Collected by
warehouse/supplier, Investigating, Pending to confirmation, Ready to send out from warehouse,
Collected by Branch, Ready to collect by customer, Collected by customer, close.* It is hard-coded
in the applet and is not configurable.

### Customer RMA and Supplier RTV

Both are ordinary generic documents. The Main Details tab holds Branch, an external reference
(External DO No. on the Customer RMA, External Service Note No. on the Supplier RTV), Remarks and a
Tracking ID; Account holds the entity; Lines holds the returned items.

### RMA Requests

The request itself is created through `svc/issue-request-hdrs`. The only editable field on the
review screen is **Approval Status**, a drop-down of `APPROVED` and `REJECTED`; choosing `REJECTED`
opens a modal that requires a rejection reason.

## Lifecycle and effects

### The three record types are not one flow

There is no single "RMA lifecycle". Three independent things happen here.

**1. RMA Request → Service Note.** A request is created with `approval_status = PENDING_APPROVAL`,
either by a back-office user (`backoffice-ep`) or by a logged-in customer or supplier entity
(`login-entity-ep`, which checks `isUserLoginEntity` rather than a permission). Setting the status to
`APPROVED` enqueues the `SVC_ISSUE_REQUEST_HDR_PROCESSOR` job, whose stated purpose is *"Move
Approved row to svc issue hdr"*. It re-reads the request with

```sql
SELECT * FROM bl_svc_issue_request_hdr
WHERE guid = :guid AND svc_issue_hdr_guid IS NULL AND approval_status = 'APPROVED'
```

maps the row straight onto a `bl_svc_issue_hdr` object, creates the service note, and writes the new
service note's GUID back onto the request. That `svc_issue_hdr_guid IS NULL` test is the only
idempotency guard.

Once the status is `APPROVED` or `REJECTED` the drop-down is disabled, so the decision is one-way in
the UI. The backend `update-approval-status` endpoint does not enforce that — it accepts any
`SVCApprovalStatus` value and only checks `TNT_API_DM_SVC_ISSUE_REQUEST_HDR_UPDATE`. Every change is
written to the applet audit trail with the old and new container.

{{< callout type="info" >}}
**This is a fourth, separate approval mechanism.** It is not the optional document approval on
`bl_fi_generic_doc_approval_*`, not the Workflow Design engine, and not the budget register's
approval tables. It applies only to `bl_svc_issue_request_hdr`, it has exactly three states, and
nothing configures it — there is no approval-settings screen for it anywhere.
{{< /callout >}}

**2. Service Note → workflow statuses.** A service note's meaningful state is its position in up to
three workflow processes (internal, customer, supplier), each bound by an applet setting and, per
company, by a Workflow Settings row. Moving status is a `bl_svc_issue_hdr` update — it posts nothing
and moves no stock.

**3. Customer RMA and Supplier RTV → the generic document flow.** These are the only two records
here that behave like ordinary documents.

### Posting proof

| | Customer RMA | Supplier RTV |
|---|---|---|
| Server document type | `INTERNAL_SALES_RMA` | `INTERNAL_SUPPLIER_RTV` |
| Amount signum | `0` | `+1` |
| Quantity signum | `0` | `+1` |
| Short code | `SLSRMA` (print code `IRMA`) | — |
| Stock | **None.** It is one of the five sales document types listed in `GenericDocumentService` as signum-zero, alongside Quotation, Sales Order, Outbound Delivery Order and Jobsheet | Moves stock via the standard generic-document path |
| Journal | **None** — a zero amount signum produces no journal lines | Posts through the standard `JournalPostingService`, with the usual GL precedence: line GL → header GL → item-company link → company default |
| VOID | Nothing to reverse | Reverses the stock and journal effect through the standard generic-document VOID path |

A Customer RMA is therefore a **tracking and authorisation document only**. Any statement that
approving a Customer RMA restocks the item or raises a credit is wrong: the stock comes back through
a separate stock-in document, and the credit through a Sales Credit Note.

### Printing

Service notes, Customer RMAs and Supplier RTVs print through Jasper: single documents via
`svc/issue-hdrs/.../print`, and batches via `svc/issue-hdrs/batch-print-jasper-pdf/backoffice-ep`
and `svc/doc-hdrs/batch-print-jasper-pdf/backoffice-ep`, each taking a
`printableFormatHdrGuid` from Printable Format Settings.

## Related applets

- [Workflow Design Applet](/applets/master-data/workflow-design-applet/) — defines the processes,
  statuses, transitions and roles that the three workflow status fields on a service note use. This
  applet is the engine's only consumer.
- [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/) — the document a
  returned item usually came from.
- [Customer Maintenance](/applets/master-data/customer-maintenance-applet/) and
  [Supplier](/applets/master-data/supplier-applet-1/) — the entities on each record.
- [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) — items, serial
  numbers and units of measure.
- [Organization](/applets/master-data/organisation-applet/) — company, branch and location, and the
  companies listed on the Workflow Settings screen.
- [Warranty Admin](/applets/rma/warranty-admin-applet/) — the warranty side of the same items.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| The Workflow status drop-down on a service note is empty | Either no process is selected in Application Settings, or the available-status query finds no transition reachable by this user's role — it inner-joins transition → role → user | Set the three process settings, then check the user has a Role row in the workflow process |
| The customer or supplier status field does not appear at all | `SHOW_CUSTOMER_WORKFLOW_STATUS` / `SHOW_SUPPLIER_WORKFLOW_STATUS` are opt-in, not hide toggles | Turn the relevant one on in Application Settings |
| Turning on `HIDE_WORKFLOW_STATUS` or `HIDE_WORKFLOW_RESOLUTION` changes nothing | Both keys are saved and read by nothing | Use the two `SHOW_*` keys, or hide the whole tab |
| Turning on `HIDE_CUSTRMA_DOC_NO` or `HIDE_SUPRTV_DOC_NO` changes nothing | Same — declared, rendered, saved, never read | No workaround; the document number cannot be hidden |
| Approving an RMA Request does not produce a service note | The processor only picks up the request when `svc_issue_hdr_guid IS NULL` **and** `approval_status = 'APPROVED'`. If a service note was already created from it the request is skipped | Check the request row for an existing `svc_issue_hdr_guid` before re-approving |
| Approval Status cannot be changed back after approving or rejecting | The drop-down disables itself once the value is `APPROVED` or `REJECTED` | This is a client-side guard, not a backend rule; a reversal has to go through the API |
| The Reason field is free text when it should be a list | `REASON_UI` is `INPUT_FIELD` | Set it to `DROP_DOWN` in Application Settings, and add codes under Return Reasons Settings |
| The Reason drop-down is empty | Return Reasons Settings ships with no data | Add codes there first |
| Reason or Request Action codes will not list, but can be created | Both listings are gated by `TNT_API_DM_SVC_ISSUE_HDR_*`, not by their own permission family | Grant the issue-header read permission |
| The RMA Report is empty for a user with full service-note rights | Same cross-family gate — the report needs `TNT_API_DM_SVC_ISSUE_HDR_ADMIN`, `_OWNER` or `_READ` | Grant one of those |
| Save is blocked on a service note with no visible cause | Branch, Location and Status are required, and `HIDE_BRANCH` / `HIDE_LOCATION` remove the controls without removing the validators. `ENABLE_PIC_SELECTION` adds two more required fields | Turn the hide keys off, set the values, then turn them back on |
| A returned item never comes back into stock after a Customer RMA | `INTERNAL_SALES_RMA` has a quantity signum of 0 — it moves no stock by design | Raise the appropriate stock-in document separately |
| No journal appears for a Customer RMA | Amount signum 0 — it posts nothing | Raise a Sales Credit Note for the financial effect |
| Personalization → Default Selection saves nothing | The component never assigns its applet container, so the change handlers throw and SAVE emits `undefined` | Use Settings → Default Selection instead |
| The Supplier RTV Line screen is headed "Customer RMA Line Items Listing" | The supplier line component re-uses the customer component's title | Cosmetic only; the rows are Supplier RTV lines |

## Related documentation

- [Workflow Design Applet](/applets/master-data/workflow-design-applet/)
- [Warranty Admin](/applets/rma/warranty-admin-applet/)
- [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/)
