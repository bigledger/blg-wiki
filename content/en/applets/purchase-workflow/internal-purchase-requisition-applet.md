---
title: "Purchase Requisition (Internal)"
description: "Reference for the Purchase Requisition (Internal) applet: the internal buy request that precedes a Purchase Order, its screens and menus, every configuration switch that actually works (including the generic-document approval workflow that this applet does wire up), fields, lifecycle (no stock movement, no journal), the Jobsheet knock-off and known failure modes."
applet_code: "internal_purchase_requisition"
applet_repo: "blg-applet-wavelet-internal-purchase-requisition-applet"
modules: [purchasing]
related_applets:
  - internal-purchase-order-applet
  - internal-purchase-quotation-applet
  - internal-purchase-grn-applet
  - internal-purchase-invoice-applet
  - internal-stock-requisition-applet
  - purchase-report-applet
  - supplier-applet-1
  - employee-applet
  - organisation-applet
  - doc-item-maintenance-applet
  - tax-configuration-applet
  - workflow-design-applet
guides:
  - /guides/purchasing-guides/standard-procurement-workflow/
sources:
  configuration:
    - blg-applet-wavelet-internal-purchase-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-requisition-applet/src/app/app.routing.ts
    - blg-applet-wavelet-internal-purchase-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-requisition-applet/src/app/app.component.ts
    - blg-applet-wavelet-internal-purchase-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-requisition-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-internal-purchase-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-requisition-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-internal-purchase-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-requisition-applet/src/app/models/constants/applet-constants.ts
    - blg-applet-wavelet-internal-purchase-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-requisition-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-internal-purchase-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-requisition-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-internal-purchase-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-requisition-applet/src/app/components/settings-container/printable-format-settings-container/printable-format-listing/printable-format-listing.component.ts
    - blg-applet-wavelet-internal-purchase-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-requisition-applet/src/app/components/settings-container/branch-settings/branch/branch.component.html
    - blg-applet-wavelet-internal-purchase-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-requisition-applet/src/app/components/settings-container/workflow-settings-container/company-workflow-edit/company-workflow-edit.component.ts
    - blg-applet-wavelet-internal-purchase-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-requisition-applet/src/app/components/settings-container/approval-setting/approval-setting-create/approval-setting-create.component.ts
    - blg-applet-wavelet-internal-purchase-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-requisition-applet/src/app/components/settings-container/approval-setting/approval-setting-create/approval-setting-create.component.html
    - blg-applet-wavelet-internal-purchase-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-requisition-applet/src/app/components/settings-container/branch-container/branch-view/branch-view.component.html
    - blg-applet-wavelet-internal-purchase-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-requisition-applet/src/app/components/settings-container/branch-container/branch-view/branch-designation/branch-designation-create/branch-designation-create.component.ts
    - blg-applet-wavelet-internal-purchase-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-requisition-applet/src/app/components/settings-container/branch-container/branch-view/branch-designation-employee/branch-designation-employee-create/branch-designation-employee-create.component.ts
    - blg-applet-wavelet-internal-purchase-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-requisition-applet/src/app/components/settings-container/branch-container/branch-view/branch-employee-link/branch-employee-link-create/branch-employee-link-create.component.ts
    - blg-applet-wavelet-internal-purchase-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-requisition-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.html
    - blg-applet-wavelet-internal-purchase-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-requisition-applet/src/app/components/purchase-requisition-container/purchase-requisition-listing/purchase-requisition-listing.component.ts
    - blg-applet-wavelet-internal-purchase-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-requisition-applet/src/app/components/purchase-requisition-container/purchase-requisition-listing/purchase-requisition-listing.component.html
    - blg-applet-wavelet-internal-purchase-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-requisition-applet/src/app/components/purchase-requisition-container/purchase-requisition-create/purchase-requisition-create.component.html
    - blg-applet-wavelet-internal-purchase-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-requisition-applet/src/app/components/purchase-requisition-container/purchase-requisition-create/import-knock-off/import-knock-off.component.ts
    - blg-applet-wavelet-internal-purchase-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-requisition-applet/src/app/components/purchase-requisition-container/purchase-requisition-create/import-knock-off/import-knock-off.component.html
    - blg-applet-wavelet-internal-purchase-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-requisition-applet/src/app/components/purchase-requisition-container/purchase-requisition-create/import-knock-off/knock-off-jobsheet/knock-off-jobsheet.component.ts
    - blg-applet-wavelet-internal-purchase-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-requisition-applet/src/app/components/purchase-requisition-container/purchase-requisition-edit/purchase-requisition-edit.component.ts
    - blg-applet-wavelet-internal-purchase-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-requisition-applet/src/app/components/purchase-requisition-container/purchase-requisition-edit/purchase-requisition-edit.component.html
    - blg-applet-wavelet-internal-purchase-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-requisition-applet/src/app/components/purchase-requisition-container/purchase-requisition-edit/generic-doc-approval/submit-approval/submit-approval.component.ts
    - blg-applet-wavelet-internal-purchase-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-requisition-applet/src/app/components/purchase-requisition-container/purchase-requisition-edit/generic-doc-approval/submit-approval/create-approval/create-approval-main-details/create-approval-main-details.component.ts
    - blg-applet-wavelet-internal-purchase-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-requisition-applet/src/app/components/line-items-queue-container/line-items-queue-listing/line-items-queue-listing.component.ts
    - blg-applet-wavelet-internal-purchase-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-requisition-applet/src/app/components/line-items-container/line-items-listing/line-items-listing.component.ts
    - blg-applet-wavelet-internal-purchase-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-requisition-applet/src/app/components/approval-request/approval-request-listing/approval-request-listing.component.ts
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
    - blg-shared-utilities/modules/session/session-controller/effects/session.effects.ts
  fields:
    - blg-applet-wavelet-internal-purchase-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-requisition-applet/src/app/components/purchase-requisition-container/purchase-requisition-create/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-purchase-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-requisition-applet/src/app/components/purchase-requisition-container/purchase-requisition-create/main-details/main-details.component.html
    - blg-applet-wavelet-internal-purchase-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-requisition-applet/src/app/components/purchase-requisition-container/purchase-requisition-create/account/account-entity-details/account-entity-details.component.ts
    - blg-applet-wavelet-internal-purchase-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-requisition-applet/src/app/components/purchase-requisition-container/purchase-requisition-create/line-item-add/line-item-add.component.html
    - blg-applet-wavelet-internal-purchase-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-requisition-applet/src/app/components/purchase-requisition-container/purchase-requisition-create/line-item-add/item-details/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-purchase-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-requisition-applet/src/app/components/purchase-requisition-container/purchase-requisition-create/line-item-add/item-details/main-details/main-details.component.html
    - blg-applet-wavelet-internal-purchase-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-requisition-applet/src/app/components/purchase-requisition-container/purchase-requisition-create/department-hdr/department-hdr.component.html
    - blg-applet-wavelet-internal-purchase-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-requisition-applet/src/app/components/purchase-requisition-container/purchase-requisition-create/delivery-details/delivery-details.component.html
    - blg-applet-wavelet-internal-purchase-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-requisition-applet/src/app/components/purchase-requisition-container/purchase-requisition-edit/generic-doc-approval/submit-approval/create-approval/create-approval-main-details/create-approval-main-details.component.html
  lifecycle:
    - blg-applet-wavelet-internal-purchase-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-requisition-applet/src/app/state-controllers/purchase-requisition-controller/store/effects/purchase-requisition.effects.ts
    - blg-applet-wavelet-internal-purchase-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-requisition-applet/src/app/state-controllers/approval-request-controller/store/effects/approval-request.effects.ts
    - blg-applet-wavelet-internal-purchase-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-requisition-applet/src/app/state-controllers/line-item-queue-controller/effects/line-item-queue.effects.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalPurhaseRequisitionDataConsistencyObject.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/ServerDocTypes.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/GenericDocServerDocTypeEnum.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentTypeHandler.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/genericDocument/GenericDocumentController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/genericDocument/GenericDocumentLineOpenQueueController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/genericDocument/approval/GenericDocApprovalController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/genericDocument/approval/GenericDocApprovalRequestController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/genericDocument/approval/GenericDocApprovalSubmissionService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/erp/genericDocument/approval/GenericDocApprovalPrimaryProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/erp/genericDocument/approval/GenericDocApprovalPrimaryProcessorServiceForSubmissionLogic.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/erp/genericDocument/approval/GenericDocApprovalSequenceProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/erp/genericDocument/approval/GenericDocApprovalRequestProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/erp/genericDocument/approval/GenericDocApprovalRequestProcessorService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/erp/genericDocument/approval/GenericDocApprovalEmailNotificationForPendingApprovalService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/genericDocument/genericDocumentConverter/PurchaseRequisitionToPurchaseOrderConverter.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/genericDocument/GenericDocumentConversionService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/GenericDocumentConversionProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/GenericDocLineOpenQueueProcessor.java
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/generic-approval/bl_fi_generic_doc_approval_hdr.service.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/generic-approval/bl_fi_generic_doc_approval_request.service.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/generic-document-services/generic-doc-line-open-queue.service.ts
  troubleshooting:
    - gh:bigledger/blg-intranet#744
    - gh:bigledger/blg-intranet#880
    - gh:bigledger/blg-intranet#1020
    - gh:bigledger/blg-intranet#1068
    - gh:bigledger/blg-intranet#1069
    - gh:bigledger/blg-intranet#1071
    - gh:bigledger/blg-intranet#1130
    - gh:bigledger/blg-intranet#1527
    - gh:bigledger/blg-intranet#2700
    - gh:bigledger/blg-intranet#3738
    - gh:bigledger/blg-intranet#3918
    - gh:bigledger/blg-intranet#4399
    - gh:bigledger/blg-intranet#4453
    - gh:bigledger/blg-intranet#4484
    - gh:bigledger/blg-intranet#5375
    - gh:bigledger/blg-intranet#5727
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/genericDocument/approval/GenericDocApprovalSubmissionService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/erp/genericDocument/approval/GenericDocApprovalProcessorSharedPostingStatus.java
weight: 10
date: 2026-04-10
lastmod: 2026-09-05
draft: false
tags:
- purchase-workflow
- purchase-requisition
- internal-purchase
- approvals
- line-items
- line-items-queue
- knock-off
---

## Overview

A **purchase requisition** is your company's formal way of saying *"we need to buy this."* Before a supplier is contacted, a requester records what is needed, how much, for which branch and from which preferred supplier; a manager approves it if your company has switched approvals on; purchasing then raises a [Purchase Order](/applets/purchase-workflow/internal-purchase-order-applet/) from it. Think of it as a pre-approved shopping list: the requisition is the internal request, the purchase order is the commitment to the supplier.

The **Purchase Requisition (Internal)** applet is where requesters create requisitions, approvers act on them (**Approval Request** / **Approval History**), operations review lines across documents (**Line Items**, **Line Items Queue**) and administrators configure fields, approval routing and printing. It is a **record-only** document: server document type `INTERNAL_PURCHASE_REQUISITION` (short code `PURREQ`) carries quantity signum **0** and amount signum **0** — finalising it moves no stock and posts no journal. What FINAL does do is put the requisition's lines in the open queue so a Purchase Order can knock them off.

Approvals here are **optional and off until you build them** — a tenant with no *Approval Settings* row raises, finalises and converts requisitions with nobody signing anything. Where this applet differs from its inventory cousin, the [Stock Requisition](/applets/inventory-workflow/internal-stock-requisition-applet/), is that it gives you the whole loop from the UI: *Approval Settings* and *Branch Designation* are read by the backend when a requisition is submitted, approvers get e-mails and an Approval Request queue, and the final approval sets the requisition to FINAL. FINAL is never blocked while an approval is pending. The details are in [Lifecycle and effects](#lifecycle-and-effects) and in the [Document Approvals](/guides/document-approvals/) guide.

## Where it fits

Module: [Purchasing](/modules-v2/purchasing/).

| Direction | Document / applet | Relationship |
|---|---|---|
| Upstream | [Jobsheet](/applets/sales-workflow/internal-jobsheet-applet/) | The only source the **KO For** tab offers (the Purchase Order, Purchase GRN and Purchase Quotation sub-tabs exist in code but are commented out). A FINAL jobsheet with open lines is knocked off into a new requisition; it needs the company Knock Off Configuration row *Jobsheet → Purchase Requisition* (`LINE`). |
| Downstream | [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) | The PO applet's **KO For › Purchase Requisition** and **Search Purchase Requisition** pull FINAL requisition lines from the open queue; needs the company row *Purchase Requisition → Purchase Order*. The PO's *Approval Monitor* can make a requisition link mandatory before a PO may be submitted for approval. |
| Downstream | [Purchase Quotation (Internal)](/applets/purchase-workflow/internal-purchase-quotation-applet/) | Its KO For tab can knock off requisition lines (see that page — it reads the PR → PO flow row). |
| Downstream (backend only) | Purchase Order | `PurchaseRequisitionToPurchaseOrderConverter` copies a FINAL requisition into a new PO (DRAFT, or FINAL when the company flow config says so). It is reachable through the backend conversion endpoints and the `GENERIC_DOCUMENT_CONVERSION_PROCESSOR` job, not from any button in this applet. |
| Optional | [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/) | The GRN's line-level knock-off can target a requisition (open-queue types `INTERNAL_PURCHASE_GOODS_RECEIVED_NOTE → INTERNAL_PURCHASE_REQUISITION`); the PR-side sub-tab for it is commented out. |
| Reporting | [Purchase Report](/applets/purchase-workflow/purchase-report-applet/) | Requisition documents appear in the purchase-document reports. |
| Inventory twin | [Stock Requisition (Internal)](/applets/inventory-workflow/internal-stock-requisition-applet/) | Same 0/0 shape for a stock request between locations. It has the Approval Settings screen but no way to submit a requisition against it; this applet has the whole loop. |

## Screens and menus

{{< youtube acPX2sXOPVo >}}

*Walkthrough video of the applet.*

| Menu (sidebar) | Route | What it is | Hidden by |
|---|---|---|---|
| **Internal Purchase Requisition** | `internal-purchase-requisition` | Listing → create / edit. | — |
| **Line Items** | `line-items` | One grid of lines from all requisitions (`gen-doc-line/internal-purchase-requisitions` listing). Not the same as the Lines tab inside one document. | `HIDE_LINE_ITEMS_MENU` unless the `SHOW_LINE_ITEMS_MENU` permission is granted |
| **Line Items Queue** | `line-items-queue` | Open-queue rows of FINAL requisitions waiting for a Purchase Order (`INTERNAL_PURCHASE_REQUISITION → INTERNAL_PURCHASE_ORDER`), with an **APPROVE** button. | `HIDE_LINE_ITEMS_QUEUE_MENU` / `SHOW_LINE_ITEMS_QUEUE_MENU` |
| **Approval Request** | `approval-request` | The approver's inbox: approval requests addressed to the logged-in employee. Approve / Reject with remarks. | `HIDE_APPROVAL_REQUEST_MENU` / `SHOW_APPROVAL_REQUEST_MENU` |
| **Approval History** | `approval-history` | Every submission, approval and rejection record. | `HIDE_APPROVAL_HISTORY_MENU` / `SHOW_APPROVAL_HISTORY_MENU` |
| **Settings** | `settings/…` | Application Settings, Default Selection, Printable Format Settings, Branch Settings, Workflow Settings, Branch Designation, Approval Settings; Webhook, Feature Visibility, Client Side Permission, Role Pricing Scheme Link, Permission Wizard / Set / User / Team / Role Permission, Release Notes, Applet Log. | — |
| **Personalization** | `personalization/…` | Personal Default Selection, Sidebar. | — |

The sidebar filter is generic: for every menu the applet computes `HIDE_<STATE>_MENU` (an applet setting) and `SHOW_<STATE>_MENU` (a client-side permission) and hides the item when the setting is on and the permission is absent. Only the two approval `SHOW_…_MENU` codes are seeded in the registry (see [Feature visibility](#feature-visibility--permissions)).

**Listing.** Columns: Doc Short Code, Doc No (Tenant / Company / Branch), Posting Status, Status, Print Status, Branch Code, Currency, Supplier Name, Description, Purchaser, Amount Txn, ARAP columns, Qty Ordered / Received / Outstanding, Amount Ordered / Received / Outstanding, dates, Created / Modified by, Client Doc Type / 1–5, Quotation / Order / Delivery Order / Invoice / Others references, GL Dimension, Segment, Profit Center, Project, Remarks, References, KO Doc From / To. Buttons: **+** (create), **FINAL**, **VOID**, **Print** (single / multiple, using the printable format chosen in the drop-down), and the ag-grid export bar.

{{< figure src="/images/internal-purchase-requisition/For-Requesters-Create-Your-First-Purchase-Requisition.png" alt="Purchase Requisition listing with the create panel open on Main Details" caption="Listing with the create panel: **+** opens Main Details, Account, Lines, then the optional tabs." >}}

**Create screen** — tabs **Main Details**, **Account**, **Line Items**, then **Delivery Details**, **Payment**, **Department Hdr** and **KO For**, each of the last four hidden by its `HIDE_…_TAB` setting. **CREATE** saves a TEMP document and converts it to ACTIVE; **RESET** clears the draft.

**Edit screen** — tabs in the order set by *Default Selection → Details Tab Ordering*: Main Details, Account, Lines, Delivery Details, KO For (TEMP documents only), ARAP, Payment, Department Hdr, TraceDocument, Contra, Doc Link, Attachment, Export, Generic Doc Approval. Buttons: **RESET** and **FINAL** (DRAFT documents), **SAVE**, **DISCARD** (ACTIVE + DRAFT). With `VERTICAL_ORIENTATION` (or a personal `DEFAULT_ORIENTATION` of `VERTICAL`) the tabs become expansion panels; the `EXPAND_*` settings choose which panel opens first.

{{< figure src="/images/internal-purchase-requisition/attach-document.png" alt="Edit Purchase Requisition, Attachment tab, with the Add Attachment upload panel" caption="Attachment tab on the edit screen: quotes, photos and supporting files stay with the requisition." >}}

{{< figure src="/images/internal-purchase-requisition/submit-for-approval.png" alt="Generic Doc Approval tab with the create button, Submit For Approval and Resubmit" caption="Generic Doc Approval tab: **+** creates the approval record (choose submitter and approval setting), **Submit For Approval** sends it into the workflow, **Resubmit** after a rejection." >}}

**Approval Request** lists the approval requests addressed to the logged-in employee (`approval-requests/login-entity-primary-ep/{loginSubjectGuid}`) with the document number, company, entity, date, amount, approver, status and remarks. Select a row and click **Approve** or **Reject**; a dialog collects remarks. Opening a row shows Main Details and Lines read-only.

{{< figure src="/images/internal-purchase-requisition/apprival-request.png" alt="Approval Request listing with Approve and Reject buttons" caption="Approval Request: the approver's queue. Approve and Reject act on the selected row." >}}

**Line Items Queue** shows open-queue rows (Txn Date, Base Qty, Balance Qty, Knock Off Qty, Outlet PO / SO balance, Outlet Balance) and an **APPROVE** button (`gen-doc-line-open-queues/backoffice-ep/batch-approve`). Rows with zero knock-off quantity cannot be selected. See Lifecycle for what the approval does — and does not — change.

{{< figure src="/images/internal-purchase-requisition/settings.png" alt="Applet Settings landing showing System Configuration, Server Side Permissions and Developer Tools groups" caption="Settings: the shared Application Settings screen (here the Advanced Search Filter tab) plus the applet-local screens listed on the left." >}}

## Configuration

Source commits: applet `6c281e1` (2026-08-26; shared-utilities submodule `8ae0e9b`, cross-checked against org HEAD `af523eb`), backend `353fa9a` (2026-09-05). Registry code `internal_purchase_requisition`; the applet's own `main.ts` uses `internal-purchase-requisition-applet` in development only, and the shared settings screen maps **both** codes, so every tab toggle below renders on a live tenant.

### Before you can use it

| Prerequisite | Where | Why |
|---|---|---|
| Company, branches, locations | [Organisation](/applets/master-data/organisation-applet/) | Branch and Location are required on Main Details; the branch list is filtered by the user's `TNT_API_DOC_INTERNAL_PURCHASE_REQUISITION_READ_TGT_GUID` targets (tenant admins / owners see all). Delivery branch reads need `TNT_API_DOC_INTERNAL_PURCHASE_REQUISITION_DELIVERY_BRANCH_READ`. |
| Document numbering | [Organisation](/applets/master-data/organisation-applet/) → running numbers for `INTERNAL_PURCHASE_REQUISITION` | Doc No (Tenant / Company / Branch) are assigned on save. |
| Suppliers | [Supplier](/applets/master-data/supplier-applet-1/) | The Account tab requires an entity; `ENABLE_SELECT_MODE` + the `ALLOW_TO_CREATE_EDIT_ACCOUNT` permission let users create or edit a supplier from the picker. |
| Items, UOM, tax codes | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/), [Tax Configuration](/applets/master-data/tax-configuration-applet/) | Line prices, UOM ratios, SST / WHT codes. No GL codes are needed — nothing posts. |
| Knock Off Configuration rows | Organisation → Company → Knock Off Configuration | *Purchase Requisition → Purchase Order* (so FINAL creates open-queue rows the PO can find, and the Line Items Queue has anything to show); *Jobsheet → Purchase Requisition* if you use KO For. Without the first row FINAL still succeeds — the PO simply cannot find the requisition (`GenericDocLineOpenQueueProcessor` reads `bl_fi_comp_gendoc_flow_config`). |
| Employees with designations | [Employee](/applets/master-data/employee-applet/) + this applet's *Branch Designation* | Approvers are employee entities linked to a branch designation; the submitter is an employee entity. |
| Approval e-mail templates | Applet template messages `GENERIC_DOC_APPROVAL_PENDING_APPROVAL_NOTIFICATION` and `NO_REPLY_EMAIL_ADDRESS` | Approvers are e-mailed on each pending request; without the template the approval still proceeds and `email_notification_error` records "Cannot get AppletTemplateMessage template_type = …". |
| Printable format | *Settings → Printable Format Settings* | Print needs at least one format and a default (`PRINTABLE`); approval data is included in the requisition printable since intranet #1130. |

### Applet settings

Settings live in five places; all are tenant-wide except the last:

1. **Shared Application Settings** (`settings/field-settings`, the shared `FieldConfigurationComponent` keyed by the registry code) — the model below.
2. **Inline gear** — `app-applet-settings-toggle` is embedded on 20 screens (listing, edit header, main details, account, entity details, billing / shipping contact, supplier edit, line items grid, item details, line doc link, department header, payment, payment edit, ARAP, export, doc link, line-items queue). It shows only when the user has switched on *Personalization → Default Selection → Enable Inline Applet Config* (`ENABLE_INLINE_APPLET_CONFIG`, personal). 100 keys are editable there; they are the same tenant-wide values.
3. **Default Selection** (applet-local) — Default Branch, Default Location (and the branch's company) and **Details Tab Ordering** (`PURCHASE_REQUISITION_DETAILS_TAB_ORDER`, drag-and-drop of the 14 edit tabs).
4. **Printable Format Settings** — the default printable (`PRINTABLE`).
5. **Personal Default Selection** — Default Branch, Default Location, Enable Inline Applet Config (overrides the tenant defaults for that user).

Anyone with access to the applet's Settings menu can change them; the applet has no separate settings permission. Values are stored on the applet (`bl_applet_ext`, `APPLET_SETTINGS`) and are read by the document screens only after the first **Save** — a fresh tenant sees every tab and column until Application Settings has been saved once.

Every key in the table passes the four proofs (declared in `applet-settings.model.ts`, rendered on the shared screen and/or a gear, persisted by the shared session service, consumed by a component). Defaults are the shared screen's initial value: unchecked (false) for toggles, empty for selections, unless stated.

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| `HIDE_DELIVERY_DETAILS_TAB`, `HIDE_MAIN_PAYMENT_TAB`, `HIDE_DEPARTMENT_HDR_TAB`, `HIDE_KO_FOR_TAB` | Optional tabs on the create screen (and the first three on the edit screen). | off | Tab disappears; KO For also disappears from the edit screen because it only shows on TEMP documents. |
| `HIDE_MAIN_ARAP_TAB`, `HIDE_TRACE_DOCUMENT_TAB`, `HIDE_MAIN_CONTRA_TAB`, `HIDE_DOC_LINK_TAB`, `HIDE_ATTACHMENT_TAB`, `HIDE_EXPORT_TAB`, `HIDE_GENERIC_DOC_APPROVAL_TAB` | Edit-screen tabs. | off | Hidden for everyone except users holding the matching `SHOW_EXPORT_TAB` / `SHOW_GENERIC_DOC_APPROVAL_TAB` permission (both seeded). `HIDE_GENERIC_DOC_APPROVAL_TAB` also hides the **APPROVE** button and the Approval Status column of the Line Items Queue. Added for tenants that do not use approvals (intranet #1527). |
| `HIDE_GENDOC_FINAL_BUTTON`, `HIDE_GENDOC_VOID_BUTTON`, `HIDE_GENDOC_DISCARD_BUTTON`, `HIDE_GENDOC_SAVE_BUTTON` | FINAL / VOID on the listing and edit header, DISCARD and SAVE on the edit screen. | off | The listing re-enables FINAL / VOID for users with `SHOW_GENDOC_FINAL_BUTTON` / `SHOW_GENDOC_VOID_BUTTON` (checked in code, **not seeded**). Hiding FINAL for requesters is the only way to force the approval route — see Lifecycle. |
| `HIDE_PRINT_BUTTON`, `HIDE_EXPORT_AS_PDF_BUTTON` | Print on the listing; Export as PDF on the Export tab. | off | Print re-enabled by the seeded `SHOW_PRINT_BUTTON` permission. |
| `DISABLE_GEN_DOC_LISTING`, `DISABLE_LINE_ITEM_QUEUE_LISTING` | Stop the main listing / Line Items Queue from loading rows until the user searches. | off | Large tenants use this to avoid a full-table load on open. |
| `HIDE_SERVER_DOC_1/2/3`, `HIDE_CLIENT_DOC_TYPE`, `HIDE_CLIENT_DOC_1…5`, `HIDE_ARAP_PNS/SETTLEMENT/DOC_OPEN/CONTRA/BAL`, `HIDE_DESCRIPTION`, `HIDE_TRANSACTION_DATE`, `HIDE_CREATED_DATE`, `HIDE_UPDATED_DATE` | Listing columns and the corresponding Main Details fields / search filters. | off | Each column has a seeded `SHOW_…` permission that re-enables it per role (`isShowColumn`). |
| `SHOW_GL_DIMENSION`, `SHOW_SEGMENT`, `SHOW_PROFIT_CENTER`, `SHOW_PROJECT` | Opt-in listing columns for the header dimensions. | off | Column appears when the setting **or** the same-named permission is on. |
| `HIDE_DIMENSION`, `HIDE_SEGMENT`, `HIDE_PROFIT_CENTER`, `HIDE_PROJECT`, `HIDE_DEPARTMENT` | Dimension fields on the Department Hdr tab and the line Department tab. | off | Field hidden; header values still copy to lines. |
| `HIDE_UNIT_PRICE_STD_PRICING_SCHEME`, `HIDE_UNIT_PRICE_STD_INCL_TAX`, `HIDE_UNIT_PRICE_STD_EXCL_TAX`, `HIDE_UNIT_PRICE_STD_UOM_INCL_TAX`, `HIDE_UNIT_PRICE_STD_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_NET_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_NET_EXCL_TAX`, `HIDE_UNIT_DISCOUNT`, `HIDE_UNIT_DISCOUNT_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_TXN_UOM_INCL_TAX`, `HIDE_UNIT_PRICE_TXN`, `HIDE_QTY_BASE`, `HIDE_QTY_UOM`, `HIDE_UOM_TO_BASE_RATIO`, `HIDE_AMOUNT_STD_EXCL_TAX`, `HIDE_DISCOUNT_AMOUNT_EXCL_TAX`, `HIDE_AMOUNT_NET_EXCL_TAX`, `HIDE_AMOUNT_TXN`, `HIDE_TAX_CONFIG_SELECTION`, `HIDE_WHT_CONFIG_SELECTION`, `HIDE_LAST_PURCHASE_PRICE`, `HIDE_TOTAL_TXN_AMOUNT`, `HIDE_SST_VAT_GST_AMOUNT` | Individual price, quantity, tax and amount fields on the line form and the line grid. | off | Each has a seeded `SHOW_…` permission (except the two totals) so a purchasing role can see prices while a cashier cannot (intranet #4399, #3918). |
| `HIDE_COSTING_DETAILS`, `HIDE_PRICING_DETAILS`, `HIDE_ISSUE_LINK`, `HIDE_SERIAL_NUMBER`, `HIDE_BATCH_NUMBER`, `HIDE_BIN_NUMBER` | Sub-tabs of the line form. | off | Costing Details is re-enabled by the seeded `SHOW_COSTING_DETAILS` permission. |
| `HIDE_TRACKING_ID`, `HIDE_PERMIT_NO`, `HIDE_REMARKS`, `HIDE_CREATED_BY_DETAILS`, `HIDE_LOCATION`, `HIDE_DELIVERY_BRANCH`, `HIDE_DELIVERY_LOCATION`, `HIDE_DELIVERY_DETAILS`, `HIDE_DELIVERY_INSTRUCTION`, `HIDE_DOC_LINK`, `HIDE_DOC_LINK_FROM`, `HIDE_DOC_LINK_TO` | Main Details fields, line delivery fields and doc-link grids. | off | Field or grid hidden. |
| `HIDE_BILL_TO_TAB`, `HIDE_SHIP_FROM_TAB`, `HIDE_ACCOUNT_BILLING_CONTACT`, `HIDE_ACCOUNT_SHIPPING_CONTACT`, `HIDE_ENTITY_DETAILS_STATUS/IDENTITY_TYPE/CURRENCY/DESCRIPTION/TYPE/ID_NUMBER/EMAIL/PHONE_NUMBER` | Account tab: sub-tabs, contact blocks and entity fields. | off | Hidden. |
| `HIDE_CURRENCY`, `SHOW_FOREX_DATA_SOURCE`, `CANNOT_EDIT_CURRENCY_RATE` | Currency, forex data-source picker and rate on Main Details. | off | The rate field locks; the forex picker appears. |
| `ENABLE_SELECT_MODE`, `ENABLE_BRANCH_FILTER` | Supplier picker: allow create / edit from the picker (with `ALLOW_TO_CREATE_EDIT_ACCOUNT`); filter suppliers by the document's branch. | off | — |
| `DISALLOW_LINE_ITEM_EDIT` | Make saved lines read-only on the edit screen. | off | Overridden per role by the `ALLOW_LINE_ITEM_EDIT` permission (checked, not seeded). |
| `ENABLE_EDIT_PAYMENT_DATE` | Payment tab: allow the payment date to be edited. | off | — |
| `DEFAULT_TRANSACTION_DATE` | Default date-range filter of the Line Items menu (`1_day`, `1_week`, …). | empty | — |
| `SORT_ORDER` | Ascending sort of the line grids. | off | — |
| `VERTICAL_ORIENTATION` + `EXPAND_MAIN_DETAILS`, `EXPAND_ACCOUNT`, `EXPAND_LINE_ITEMS`, `EXPAND_KO_FOR`, `EXPAND_MAIN_ARAP`, `EXPAND_DELIVERY_DETAILS`, `EXPAND_DEPARTMENT_HDR`, `EXPAND_TRACE_DOCUMENT`, `EXPAND_MAIN_CONTRA`, `EXPAND_DOC_LINK`, `EXPAND_ATTACHMENT`, `EXPAND_EXPORT`, `EXPAND_SETTLEMENT`, `EXPAND_POSTING`, `EXPAND_DELIVERY_TRIPS` | Panel layout instead of tabs; which panel opens first. | off | `EXPAND_SETTLEMENT`, `EXPAND_POSTING`, `EXPAND_DELIVERY_TRIPS` name panels this applet does not have. |
| `DEFAULT_BRANCH`, `DEFAULT_LOCATION`, `DEFAULT_COMPANY` (Default Selection) | Pre-selected branch / location on a new requisition. | empty | Personal Default Selection overrides them per user. |
| `PURCHASE_REQUISITION_DETAILS_TAB_ORDER` (Default Selection) | Order of the 14 edit tabs / panels. | code order | New tabs added later are appended. |
| `PRINTABLE` (Printable Format Settings) | Default printable format for Print. | empty | — |

**Keys read at runtime without a control of their own** (set only through the JSON or another applet sharing the same settings store): `DEFAULT_POSTING_STATUS` and `DEFAULT_STATUS` (Line Items menu filters), `DISABLE_ITEM_LISTING` (item picker), `HIDE_EMPLOYEE_RANKING` (Branch Designation › Employee Ranking tab), `RELABEL_BRANCH_TO_JOB_GROUP` / `RELABEL_COMPANY_TO_ENTITY` (labels), `SHOW_DOCUMENT_DELETE_BUTTON` (read from `bl_applet_ext`, but the edit template has no delete button — dead), `HIDE_LISTING_BRANCH`, `HIDE_QTY_MAIN_LISTING`, `HIDE_AMOUNT_MAIN_LISTING`, `HIDE_QUOTATION` / `HIDE_ORDER` / `HIDE_DELIVERY_ORDER` / `HIDE_INVOICE` / `HIDE_OTHERS`, `SHOW_REMARKS_MAIN_LISTING`, `SHOW_REFERENCE_MAIN_LISTING` (listing columns; the first three are on the gear only), `HIDE_SETTLEMENT_TAB`, `HIDE_SUPPLIER_CATEGORY_TAB`, `HIDE_SUPPLIER_LOGIN_TAB`, `HIDE_SUPPLIER_PAYMENT_CONFIG_TAB` (gear only; the shared screen gates them to other applet codes), and the menu keys `HIDE_LINE_ITEMS_MENU`, `HIDE_LINE_ITEMS_QUEUE_MENU`, `HIDE_APPROVAL_REQUEST_MENU`, `HIDE_APPROVAL_HISTORY_MENU`.

**Declared but never read** (saving them changes nothing): `INCLUDE_*` and `ENABLE_*` for SST / WHT / dimension / profit centre / project / segment, `ENABLE_CUSTOM_STATUS_*` (15 keys), `ENABLE_FILTER_BY_TODAYS_TXN`, `EXPAND_E_INVOICE`, `DEFAULT_TOGGLE_COLUMN`, `ENABLE_EDITING_UNIT_PRICE_STD`.

### Document behaviour settings

| Area | Screen | What it does |
|---|---|---|
| Approval routing | *Settings → Approval Settings* — Approval Setting Code, Name, Submitter Designation Code, Branch, Server Doc Type (`INTERNAL_PURCHASE_REQUISITION` or `INTERNAL_PURCHASE_ORDER`), Total Required Approval Levels, then per level: Approval Quorum (≥ 1), Approval Logic (`ANY_TO_APPROVE` / `ALL_TO_APPROVE`), Min / Max Approval Amount, Approver Designation. | Stored in `bl_fi_generic_doc_approval_setting`. Chosen by the submitter on the Generic Doc Approval tab. The backend builds the approval sequence from it (levels, quorum); **Approval Logic, Min / Max Amount and Approver Designation are copied to the sequence rows but not evaluated** by the generic-document processors at the read commit — only the quorum count advances a level. |
| Approvers | *Settings → Branch Designation* → branch → **Submitter Designation** (labelled *Approval Designation* in panel view): Name, Code, Approval Setting, Description (`bl_fi_mst_branch_designation`), then **Approver** tab: employees with an Approval Level (`bl_fi_mst_employee_branch_designation_link`: designation code, approval setting, employee, level). | On submission the backend selects approvers whose link matches the approval setting **and** whose designation code equals the submitter's designation code, one sequence row per approver per level. |
| Employee Ranking | *Branch Designation* → branch → **Employee Ranking**: employee + Approval Rank 1–10 (`bl_fi_mst_comp_branch_location_entity_link.entity_approval_rank`). Hidden by `HIDE_EMPLOYEE_RANKING`. | Written by this applet; **no backend consumer** (no read outside the data layer). Configuration only. |
| Workflow status | *Settings → Workflow Settings* → company → attach a workflow process (`bl_fi_comp_workflow_gendoc_process_template_hdr`, server doc type fixed to `INTERNAL_PURCHASE_REQUISITION`). | Main Details then offers **Workflow Status** (the process's statuses, default pre-selected) and **Workflow Resolution**. Stored on the document; the backend FINAL path does not read them — this is a label, not a gate. Processes are designed in the [Workflow Design applet](/applets/master-data/workflow-design-applet/). |
| Posting | none | Fixed by the backend: 0/0 signums, no journal (see Lifecycle). The only applet-side levers are the FINAL / VOID / DISCARD button toggles. |
| Printing | *Settings → Printable Format Settings*; per branch under *Branch Settings → Printable Format* | Jasper print service `INTERNAL_PURCHASE_REQUISITION_PRINT_SERVICE`; the listing shows the document's Print Status. |
| Branch Settings | *Settings → Branch Settings* → branch: Branch Details, Item Category Filter, Pricing Scheme, Printable Format, Default Settlement Method. | Per-branch item filter for the picker, pricing scheme for line prices, default printable and settlement method. |
| e-Invoice | none | Requisitions are not e-Invoice documents; no submission flags exist. |

### Settings in other applets that control this applet

| Setting | Where it is set | Effect here |
|---|---|---|
| Knock Off Configuration rows PR → PO, Jobsheet → PR, GRN → PR | Organisation → Company → Knock Off Configuration | Whether FINAL creates open-queue rows for the PO / whether the KO For and downstream pickers find anything. |
| Approval Monitor rule PR → PO ("Is Document Conversion Required") | [Purchase Order](/applets/purchase-workflow/internal-purchase-order-applet/) → Settings → Approval Monitor | Forces every PO submitted for approval to be linked from a requisition (`GenericDocApprovalConversionMonitorCheckingService`). Set there, felt here as "every PO must start from a PR". |
| `validate_stock` in the flow config `property_json` | Organisation → Knock Off Configuration (AUTO rows) | Only relevant if the backend conversion PR → PO is used: the converter validates the requisition like a FINAL first. |
| Applet template messages | Applet Store / tenant admin | Approval e-mails (see prerequisites). |

### Feature visibility / permissions

Server-side (targeted) permissions checked by the applet: `TNT_API_DOC_INTERNAL_PURCHASE_REQUISITION_READ_TGT_GUID` (branch targets filter the listing and the branch drop-down), `…_CREATE_TGT_GUID` (the **+** button), `…_UPDATE_TGT_GUID` (SAVE), `…_DELIVERY_BRANCH_READ`, plus `TNT_TENANT_ADMIN` / `TNT_TENANT_OWNER` which bypass all three. The backend additionally requires `API_TNT_DM_ERP_GEN_DOC_LINE_OPEN_QUEUE_APPROVE` (or owner / admin) for the Line Items Queue **APPROVE**, and `TNT_DM_ERP_GEN_DOC_APPROVAL_CONVERSION_MONITOR_READ` for the PO-side monitor check.

Client-side permissions (`bl_applet_client_side_perm_dfn`, 50 ACTIVE rows seeded for this applet): `INTERNAL_PURCHASE_REQUISITION_DISPLAY_PRICING` (a **show** permission with a hide default: the price columns of the Lines grid and the Line Items menu are hidden for every role that does not hold it — `hidePriceFlag = !checkPermission(...)`), `ALLOW_TO_CREATE_EDIT_ACCOUNT`, `SHOW_APPROVAL_REQUEST_MENU`, `SHOW_APPROVAL_HISTORY_MENU`, `SHOW_EXPORT_TAB`, `SHOW_GENERIC_DOC_APPROVAL_TAB`, `SHOW_PRINT_BUTTON`, `SHOW_TRANSACTION_DATE` (unlocks the Transaction Date picker — without it the date is fixed at creation), `SHOW_COSTING_DETAILS`, `SHOW_LAST_PURCHASE_PRICE`, `SHOW_DESCRIPTION`, `SHOW_DOC_NO_TENANT/COMPANY/BRANCH`, `SHOW_CLIENT_DOC_TYPE`, `SHOW_CLIENT_DOC_1…5`, `SHOW_ARAP_*` (5), `SHOW_GL_DIMENSION`, `SHOW_SEGMENT`, `SHOW_PROFIT_CENTER`, `SHOW_PROJECT`, `SHOW_TAX_CONFIG_SELECTION`, `SHOW_WHT_CONFIG_SELECTION`, and the 16 price / quantity `SHOW_*` codes. Each `SHOW_*` re-enables what the matching `HIDE_*` setting hides, per role.

Checked in code but **not seeded** (granting them is impossible until they are): `SHOW_GENDOC_FINAL_BUTTON`, `SHOW_GENDOC_VOID_BUTTON`, `SHOW_LINE_ITEMS_MENU`, `SHOW_LINE_ITEMS_QUEUE_MENU`, `SHOW_LISTING_BRANCH`, `SHOW_QTY_MAIN_LISTING`, `SHOW_AMOUNT_MAIN_LISTING`, `SHOW_QUOTATION` / `SHOW_ORDER` / `SHOW_DELIVERY_ORDER` / `SHOW_INVOICE` / `SHOW_OTHERS`, `SHOW_REMARKS_MAIN_LISTING`, `SHOW_REFERENCE_MAIN_LISTING`, `ALLOW_LINE_ITEM_EDIT`, `HIDE_PRICE`. Seeded but never checked by this applet's code: `IPR_HIDE_TRACKING_ID_AND_PERMIT_NO`.

*Feature Visibility* and the permission screens under Settings are the shared components (webhooks, permission sets, user / team / role permissions, role → pricing-scheme link).

## Fields

**Main Details**

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Document Type | `INTERNAL_PURCHASE_REQUISITION` | — | Read-only. |
| Document No (Tenant / Company / Branch) | Running numbers | — | Assigned on save; read-only. |
| Client Document type, Client Doc 1–5 No | Free references | No | Read-only after save; hidden by `HIDE_CLIENT_DOC_*`. |
| Company / Branch / Location | Requesting branch and location | Branch, Location required | Branch list limited to the user's read targets; defaults from Default Selection. |
| Purchaser | Employee raising the request (`pic_entity_01`) | No | Picker; name is resolved on save. |
| Transaction Date | Requisition date | Yes (pre-filled) | Picker enabled only with `SHOW_TRANSACTION_DATE`. |
| Credit Terms, Due Date | Copied to the later PO | No | — |
| Reference, Remarks, Permit No, Tracking ID | Free text | No | — |
| Base Currency, Currency, Currency Rate, forex source | Document currency | Currency defaults to the supplier's | Rate locked by `CANNOT_EDIT_CURRENCY_RATE`. |
| Workflow Status, Workflow Resolution | Status from the company workflow process | No | Only when *Workflow Settings* has a process for the company. |
| Delivery Branch / Location | Header delivery target, copied to every line on CREATE | No | Hidden by `HIDE_DELIVERY_BRANCH` / `HIDE_DELIVERY_LOCATION`. |
| Created / Modified by and dates | Audit | — | Read-only; `HIDE_CREATED_BY_DETAILS`. |

**Account** — Entity Details (Entity Id **required**, Entity Name, Status, Entity Type, Identity Type, ID Number, Currency, Description, Email, Phone Number — all read-only from the supplier), **Bill To** and **Ship To** address and contact blocks.

**Lines** (Item Details) — Item Code / Name (picker; grouped, serial, batch and bin items open their sub-tab), Quantity Base (**required, ≥ 1**), Quantity by UOM, UOM to Base Ratio, Unit Price STD excl. / incl. tax, by UOM, Unit Discount (by UOM), Unit Price Net, STD Amount, Discount Amount, Amount Net (**required**), SST/GST/VAT code and Tax Amount, WHT code and amount, Unit Price Transaction incl. tax, Txn Amount (**required**), Remarks, Last Purchase Price; reference fields Jobsheet / Purchase Quotation / Purchase GRN / Purchase Order / Purchase Requisition / Supplier Delivery Order No. Sub-tabs: Grouped Item, Serial / Batch / Bin Number, Costing Details, Pricing Details, Issue Link, Delivery Details, Delivery Instructions (stored as a `REQUESTED_DELIVERY_DATE` extension), Department, Doc Link. Prices are `min(0)`; a requisition may carry zero prices.

**Delivery Details** — Tracking ID, Shipping Branch, Delivery Type, Shipping Location.

**Department Hdr** — Segment, G/L Dimension, Profit Centre, Project (copied to lines).

**Payment** — settlement lines (method, amount, date). Present because the form is cloned from the invoice family; a requisition has no ARAP balance, so these lines have no accounting effect.

**Generic Doc Approval › Create Approval** — Select Submitter (employee entity, **required** by the backend), Submitter Designation / Code / Name (filled from the approval setting and employee), Doc No, Doc Type, Amount Txn (from the document), Approval Setting (**required**; only settings whose server doc type is `INTERNAL_PURCHASE_REQUISITION`), Total Required Approval Levels (from the setting).

## Lifecycle and effects

**Statuses.** `status` TEMP → ACTIVE on CREATE; `posting_status` DRAFT → FINAL (listing or edit-screen FINAL, or the last approval) → VOID (listing, FINAL + ACTIVE rows only). DISCARD (edit screen; ACTIVE + DRAFT only, backend `/{docType}/discard/backoffice-ep/{guid}` refuses FINAL) removes a never-finalised requisition. Only ACTIVE documents can be edited (intranet #3738).

**Posting proof block**

| Item | Value |
|---|---|
| Server document type | `INTERNAL_PURCHASE_REQUISITION` (`PURREQ`), handler key `internal-purchase-requisitions` |
| Amount signum | **0** — `InternalPurhaseRequisitionDataConsistencyObject.correctAmountSignum = ZERO`, checked on create and update (`GENERIC_DOC_INVALID_SIGNUM` otherwise); the applet sends 0 (`AppletConstants.amount_signum = 0`), so create and save agree with the backend. `ServerDocTypes.INTERNAL_PURCHASE_REQUISITION(0,0)`. |
| Quantity signum | **0** — filled on every line by the DCO; no inventory transaction lines are generated. |
| Dr / Cr equation | none — no `JournalPostingTypeHandler` entry, no journal on FINAL. |
| GL precedence | not applicable. |
| Stock processor | none. Serial numbers on lines are still validated on FINAL when the request asks for signum-zero validation (`purchaseDocTypeSignumZero` list in `GenericDocumentService`). |
| What FINAL does | Assigns running numbers, locks the document, and — when the company Knock Off Configuration has an enabled PR → PO row — creates `bl_fi_generic_doc_line_open_queue` rows (`GenericDocLineOpenQueueProcessor`) that the Purchase Order applet consumes. `FISCAL_PERIOD_LOCKED` applies. |
| What VOID reverses | The open-queue rows; nothing else. The backend refuses VOID (`Generic Document cannot be changed to VOID because it has already been linked with the following documents: …`) when an ACTIVE link has this requisition as source — i.e. after a PO has knocked it off. |

**Knock-off.** KO For › Jobsheet lists open-queue rows `INTERNAL_JOBSHEET → INTERNAL_PURCHASE_REQUISITION`, copies the selected lines into the draft and creates `bl_fi_generic_doc_link` rows on CREATE (`createGenDocLink$`, links posted as ACTIVE after the header PUT). Selecting a jobsheet also copies its header details into Main Details (`updateMainOnKOImport`); the delivery branch does not follow the branch (intranet #4453, open). In panel (vertical) view the Jobsheet panel is additionally gated by the company flow config, but the query the applet issues asks for rows whose target is `INTERNAL_SALES_INVOICE` and then filters on source `INTERNAL_JOBSHEET` — a copy-paste error: the panel's visibility follows the *Jobsheet → Sales Invoice* row, not *Jobsheet → Purchase Requisition*.

**Approval workflow** (the part that is enforced by the backend):

1. **Create approval** (Generic Doc Approval tab, **+**, Save) — `POST …/generic-doc/approvals/backoffice-ep` with the document, submitter entity and approval setting. Fails with `GENERIC_DOC_APPROVAL_OBJECT_GENERIC_DOC_HDR_GUID_DOES_NOT_EXIST` / `…_ALREADY_EXISTS` from the approval DCO.
2. **Submit For Approval** — `PUT …/approvals/processors/submission/backoffice-ep`. `GenericDocApprovalSubmissionService.validateApprovalData` **rejects** the submission (HTTP 400, `ERROR_TO_SHOW_IN_UI`) when: the submitter entity is missing (`SUBMITTER_ENTITY_HDR_GUID_IS_NULL`); the approval setting is missing (`APPROVAL_SETTING_GUID_IS_NULL`); no branch designation with the submitter's designation code exists for that approval setting (*Submitter designation_code is not created in bl_fi_mst_branch_designation*); that designation has no approver links (*There is no approver assigned…*); the approvers cover fewer distinct levels than Total Required Approval Levels (`EmployeeBranchDesignationLink_IS_NOT_FULLY_CONFIGURED`); or the submitter has a resign date in the past (`SUBMITTER_IS_RESIGNED`). On success the header becomes `PENDING_APPROVAL` and an event goes to the `GENERIC_DOC_APPROVAL_PRIMARY_PROCESSOR` queue (`bl_fi_generic_doc_approval_hdr_queue`).
3. **Primary processor** builds `bl_fi_generic_doc_approval_sequence` rows — one per approver per level up to the required levels, quorum = min(approvers at that level, configured quorum) — writes a SUBMITTED / RESUBMITTED history row, and hands over to the **sequence processor**, which creates `bl_fi_generic_doc_approval_request` rows for the lowest level and e-mails each approver (template `GENERIC_DOC_APPROVAL_PENDING_APPROVAL_NOTIFICATION`; the mail contains a Thymeleaf decision form link, `approval-requests/thymeleaf-forms/{tenant}/{guid}`). Failures are recorded on the header as `approval_processor_posting_status` / `approval_sequence_posting_status` (`PROCESSOR_FAIL_APPROVAL_SETTING_NOT_FOUND`, `PROCESSOR_FAIL_APPROVAL_SEQUENCE_IS_EMPTY`, `FAILED_TO_INSERT_TO_QUEUE`, …) and are visible as columns on the Generic Doc Approval tab.
4. **Approve / Reject** (Approval Request menu or the e-mail form) — `PUT …/approval-requests/processors/login-entity-primary-ep` with the request guid, the acting login and remarks; queued to the **request processor**. *Approve* marks the same-level sequence rows APPROVED, bumps the quorum count, deletes the acting request and re-runs the sequence processor: when the quorum is met the current level's remaining requests are deleted and the next level's requests are created; when every level is approved and the required level count is reached, the header gets `date_final_approval`, status APPROVED and the remarks are concatenated. *Reject* sets the header REJECTED with `date_rejection` and `rejection_remarks`, deletes the sequence rows and all requests, and e-mails the submitter. **Resubmit** (`…/processors/resubmission/backoffice-ep`) restarts from step 3 — the applet keeps the *Withdraw* button commented out, though the `…/withdrawals/backoffice-ep` endpoint exists.
5. **Auto-FINAL.** After an approval is recorded the request processor calls `GenericDocumentService.updatePostingStatusWithChecks(posting_status = FINAL)` on the requisition itself — the normal FINAL path, with its validations. At the read commit the condition is `date_final_approval != null || request.approval_status == APPROVED`, and the second operand is always true inside the approve branch, so **the requisition is finalised at the first approval action, not only at the last level**. Later levels still run for the record.

What the workflow does **not** do: nothing stops a user from clicking **FINAL** on the listing or edit screen without any approval — `GenericDocumentService` never reads the approval tables. Hide the FINAL button from requesters (`HIDE_GENDOC_FINAL_BUTTON`, with `SHOW_GENDOC_FINAL_BUTTON` unseeded nobody can re-enable it) if approval is meant to be mandatory; this is the design in intranet #744.

**Line Items Queue › APPROVE** sets `approval_status = APPROVED` on the selected open-queue rows (`batch-approve`, permission `…_LINE_OPEN_QUEUE_APPROVE`). No reader of that flag exists in the backend or in the Purchase Order applet at the read commit — the PO can knock off unapproved rows just the same. It is a marker, not a gate.

**PR → PO conversion (backend).** `PurchaseRequisitionToPurchaseOrderConverter` maps a FINAL requisition to a new `INTERNAL_PURCHASE_ORDER` (amount signum 0; DRAFT, or FINAL with running numbers and posting when the flow config's `doc_2_posting_status` says FINAL) and syncs the links. It runs from `POST …/gen-doc/convert-documents/backoffice-ep` (refuses non-FINAL sources — `SOURCE_DOCUMENT_NOT_FINAL` — and already-converted ones — `SOURCE_DOCUMENT_ALREADY_KO`), from `POST …/generic-document-conversion/backoffice-ep/{guid}` (every enabled AUTO / `KO_DOC` flow row of the company), and from the `GENERIC_DOCUMENT_CONVERSION_PROCESSOR` job when a tenant subscribes to it. This applet exposes none of these; the PO applet's KO For is the normal path.

## Related applets

- [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) — the next document; knocks requisition lines off, carries the Approval Monitor rule and its own approval flow.
- [Purchase Quotation (Internal)](/applets/purchase-workflow/internal-purchase-quotation-applet/) — can be raised from requisition lines before the order.
- [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/) — optional line-level knock-off target for a requisition.
- [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/) — end of the chain; the requisition number is carried on PO and invoice lines as a reference.
- [Stock Requisition (Internal)](/applets/inventory-workflow/internal-stock-requisition-applet/) — the inventory-side request; same signums, Approval Settings screen present but no way to submit against it there.
- [Purchase Report](/applets/purchase-workflow/purchase-report-applet/) — reporting.
- [Supplier](/applets/master-data/supplier-applet-1/), [Employee](/applets/master-data/employee-applet/), [Organisation](/applets/master-data/organisation-applet/), [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/), [Tax Configuration](/applets/master-data/tax-configuration-applet/) — master data the form depends on.
- [Workflow Design](/applets/master-data/workflow-design-applet/) — designs the process whose statuses appear in Workflow Status.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| Submit For Approval returns *Submitter designation code … is yet to be created* | No branch designation with that code exists for the chosen approval setting. | *Branch Designation* → branch → Submitter Designation: create one whose Code equals the setting's Submitter Designation Code and whose Approval Setting is the same setting. |
| *There is no approver assigned…* or `EmployeeBranchDesignationLink_IS_NOT_FULLY_CONFIGURED` | The designation has no Approver rows, or the approvers' levels cover fewer levels than Total Required Approval Levels. | Add approvers to the designation with levels 1…N. |
| Submitted, but nobody sees it in Approval Request | The primary / sequence processor failed; check the *Sequence Posting Status* and *Processor Posting Status* columns on the Generic Doc Approval tab (`PROCESSOR_FAIL_APPROVAL_SEQUENCE_IS_EMPTY` = approvers' designation code does not match the submitter's). | Align the designation code on the approver links with the setting's submitter designation code. |
| Approver was not e-mailed; *Email Notification Error* shows *Cannot get AppletTemplateMessage…* | The tenant has no `GENERIC_DOC_APPROVAL_PENDING_APPROVAL_NOTIFICATION` template. | Create the template message (and `NO_REPLY_EMAIL_ADDRESS`). The request still appears in Approval Request. |
| Requisition went FINAL after the first of two approvals | Behaviour of the request processor at the read commit (see Lifecycle step 5). | Treat level 1 as the effective gate, or ask for the condition to be fixed. |
| Requester finalised without approval | FINAL is never blocked by approval status. | Turn on `HIDE_GENDOC_FINAL_BUTTON`; route everyone through Generic Doc Approval. |
| *Generic Doc Approval* tab errors on tenants that do not use approvals | The tab was added for all tenants (intranet #1527). | Turn on `HIDE_GENERIC_DOC_APPROVAL_TAB`; grant `SHOW_GENERIC_DOC_APPROVAL_TAB` to the roles that need it. |
| Purchase Order cannot find a FINAL requisition | No enabled Knock Off Configuration row *Purchase Requisition → Purchase Order* when it was finalised, so no open-queue rows were created. | Add the row; re-run the queue repair (`data-fix-missing-queue`) or void and re-finalise. |
| KO For › Jobsheet is empty | No *Jobsheet → Purchase Requisition* row, or the jobsheet is not FINAL / already fully knocked off. | Add the row; check the jobsheet's open quantities. |
| Print says success but no PDF, or *No Doc to print* | Print needs a default printable format; a role without `SHOW_PRINT_BUTTON` while `HIDE_PRINT_BUTTON` is on cannot print at all (intranet #2700). | Set the default in Printable Format Settings; grant the permission. |
| Cannot VOID: *…already been linked with the following documents* | A PO (or quotation) has knocked the requisition off. | Void the downstream document first. |
| `FISCAL_PERIOD_LOCKED` on FINAL | The transaction date falls in a locked period. | Change the date (needs `SHOW_TRANSACTION_DATE`) or unlock the period. |
| Prices visible to a role that should not see them | The price `HIDE_*` settings are off, or the role holds the matching `SHOW_*` permission / `INTERNAL_PURCHASE_REQUISITION_DISPLAY_PRICING`. | Turn on the `HIDE_UNIT_PRICE_*` / `HIDE_AMOUNT_*` settings and grant the `SHOW_*` codes only to purchasing (intranet #4399). |
| Branch Designation screen shows *SERVER_GENERAL_UNKNOWN_ERROR* on the branch list | Backend branch query bug fixed in intranet #1071. | Update the backend. |
| *Applet not found* after a deployment | Registry / build mismatch fixed in intranet #5727. | Redeploy. |

## Related documentation

- [Purchasing module](/modules-v2/purchasing/)
- [Standard procurement workflow](/guides/purchasing-guides/standard-procurement-workflow/)
- [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) — approval and Approval Monitor on the order side
