---
title: "Purchase Order Supplier Access (Internal)"
description: "Reference for the supplier-facing copy of the Purchase Order applet: a login linked to a supplier entity reads the FINAL purchase orders raised on it, advances the order's workflow status, exports a PDF, imports orders from a CSV file, and runs a PO-versus-GRN report."
applet_code: "internal-purchase-order-supplier-access-applet"
page_type: applet
applet_repo: "blg-applet-wavelet-internal-purchase-order-supplier-access-applet"
modules: [purchasing]
related_applets:
  - internal-purchase-order-applet
  - internal-purchase-grn-supplier-access-applet
  - internal-purchase-invoice-supplier-access-applet
  - blanket-purchase-order-applet-supplier-access-applet
  - supplier-applet-1
  - organisation-applet
guides: []
sources:
  configuration:
    - blg-applet-wavelet-internal-purchase-order-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-order-supplier-access-applet/src/app/app.routing.ts
    - blg-applet-wavelet-internal-purchase-order-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-order-supplier-access-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-internal-purchase-order-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-order-supplier-access-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-internal-purchase-order-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-order-supplier-access-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-internal-purchase-order-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-order-supplier-access-applet/src/app/components/settings-container/workflow-settings-container/workflow-settings-container.component.ts
    - blg-applet-wavelet-internal-purchase-order-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-order-supplier-access-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-wavelet-internal-purchase-order-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-order-supplier-access-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-applet-wavelet-internal-purchase-order-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-order-supplier-access-applet/src/app/components/line-items-container/line-item-view/line-item-view.component.html
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts
    - planning/lanes/lane-3/perm-dfn (akaun_master.bl_applet_client_side_perm_dfn, 19 ACTIVE codes)
  fields:
    - blg-applet-wavelet-internal-purchase-order-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-order-supplier-access-applet/src/app/components/purchase-order-container/purchase-order-listing/purchase-order-listing.component.ts
    - blg-applet-wavelet-internal-purchase-order-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-order-supplier-access-applet/src/app/components/purchase-order-container/purchase-order-view/purchase-order-view.component.html
    - blg-applet-wavelet-internal-purchase-order-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-order-supplier-access-applet/src/app/components/purchase-order-container/purchase-order-view/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-purchase-order-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-order-supplier-access-applet/src/app/components/purchase-order-container/purchase-order-detailed-report/purchase-order-detailed-report.component.ts
    - blg-applet-wavelet-internal-purchase-order-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-order-supplier-access-applet/src/app/components/file-import-container/file-import-listing/file-import-listing.component.ts
    - blg-applet-wavelet-internal-purchase-order-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-order-supplier-access-applet/src/app/components/file-import-container/file-import-create/file-import-create.component.html
    - blg-applet-wavelet-internal-purchase-order-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-order-supplier-access-applet/src/app/components/line-items-container/line-items-listing/line-items-listing.component.ts
  lifecycle:
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/generic-document-services/internal-purchase-order-supplier-access.service.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/generic-document-services/internal-purchase-order-supplier-access-printable.service.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/generic-document-services/gen-doc-xtn-process.service.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/generic-document-services/purchase-order-supplier-access-dashboard-by-login.service.ts
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/genericDocument/GenericDocumentController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/genericDocument/InternalPurchaseOrderImportFileController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/genericDocument/BlanketPurchaseOrderReportController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/InternalPurchaseOrder/InternalPurchaseOrderImportFileHelperProcessor.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/GenericDocXtnProcessDCO.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalPurchaseOrderDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/BlanketPurchaseOrderReportUow.java
  troubleshooting:
    - blg-applet-wavelet-internal-purchase-order-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-order-supplier-access-applet/src/app/state-controllers/purchase-order-controller/store/effects/purchase-order.effects.ts
    - blg-applet-wavelet-internal-purchase-order-supplier-access-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-order-supplier-access-applet/src/app/components/purchase-order-container/purchase-order-view/main-details/main-details.component.ts
tags:
  - supplier-portal
  - purchase-orders
  - procurement-transparency
  - order-acknowledgement
  - vendor-management
weight: 270
lastmod: 2026-09-06
---

## Overview

**Purchase Order Supplier Access (Internal)** is the supplier-facing copy of the [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) applet. A login linked to a supplier entity opens it inside the buyer's tenant to read the purchase orders raised on that supplier, and — uniquely in the supplier-access family — to **change the order's workflow status** (the acknowledgement step), export a PDF, and upload a CSV file that creates purchase orders.

It cannot edit the order itself: there is no create form for the document, no save on the header or lines, and no delete. The listing defaults to `posting_statuses = FINAL`, but unlike the other supplier-access applets that default is replaced when the advanced search sets the same criterion.

## Where it fits

| Position | Document / applet | Why |
|---|---|---|
| Module | [Purchasing](/modules/purchasing/) | The order itself. |
| The document | [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) | Same rows; the buyer creates and finalises there. |
| Upstream (access) | [Supplier](/applets/master-data/supplier-applet-1/) | The login must be linked to the supplier entity (`bl_fi_mst_entity_login_subject_link`, `ACTIVE`). |
| Upstream (agreement) | [Blanket Purchase Order Supplier Access](/applets/purchase-workflow/blanket-purchase-order-applet-supplier-access-applet/) | Where the order was drawn down from an agreement, if one exists. |
| Downstream | [Purchase GRN Supplier Access (Internal)](/applets/purchase-workflow/internal-purchase-grn-supplier-access-applet/), [Purchase Invoice Supplier Access (Internal)](/applets/purchase-workflow/internal-purchase-invoice-supplier-access-applet/) | Receipt and invoice; the PO Detailed Report shows received-versus-ordered quantities. |

## Screens and menus

| Menu | Route | What it is |
|---|---|---|
| **Purchase Order** | `internal-purchase-order-supplier-access` | The listing and the document view behind it. |
| **Line Items** | `line-items` | A flat listing of order lines across the supplier's orders. |
| **PO Detailed Report** | `purchase-order-detailed-report` | Ordered versus received, by date range. |
| **File Import** | `file-import` | Upload a CSV that creates purchase orders, and review what each row did. |
| **Settings** | `settings/…` | Field Settings, Default Selection, Printable Format Settings, Workflow Settings (menu), plus Webhook, Feature Visibility, Client Side Permission and the permission listings (routes). |
| **Personalization** | `personalization/…` | Personal Default Selection (including column toggle and orientation) and sidebar order. |

### Listing

Columns: **Purchase Order No, Branch Code, Branch Name, Description, Purchaser Name, Created Date, Created by**. Sorted by `updated_date` descending. The default criteria include `posting_statuses = FINAL`; a criterion set in the advanced search **replaces** the default carrying the same name, so a supplier can search for DRAFT orders here — unlike the credit-note, GRN and invoice portals, where the FINAL filter is unconditional.

### Document view

Nine read-only tabs — **Main Details**, **Account**, **Lines**, **Payment**, **Department Hdr**, **Contra**, **Doc Link**, **Attachments**, **Export** — plus one action button in the header, **Update Status**.

**Main Details** shows *Workflow Status*, *Workflow Resolution*, Branch, Location, Transaction Date, Credit Terms, Due Date, Reference, Remarks, Permit No, Currency and Tracking ID. The Workflow Status drop-down is filled from the workflow process configured for the applet (`WORKFLOW_PROCESS_GUID`, or the process already stamped on the document) and offers only the statuses reachable from the document's current status. Choosing one resolves the matching resolution and stages the change; **Update Status** sends it.

**Export** offers a printable-format picker (loaded through the applet-login endpoint) and **EXPORT AS PDF**. This is the one export in the supplier-access family that calls the login-entity print endpoint with the document's own print service, so it works with the supplier link alone.

### Line Items

Columns: **Purchase Order No, Branch, Supplier Name, Project, Shipping Address, Item Code, Item Name, Ordered Qty, Open Qty, Amount TXN, Creation Date, Requested Delivery Date, Delivery Status, Remarks**. Opening a line shows **Item Details**, **Serial Number**, **Costing Details**, **Pricing Details** and **Issue Link**.

### PO Detailed Report

Set **Start Date** and **End Date** and press **Generate Report**. The rows are grouped by PO Number, Item, Date and Qty, with **Unit Price, Total Amount, GRN Qty, GRN Amount, Outstanding Qty, Outstanding Amount** as values: GRN Qty is the quantity already received against the line (`bl_fi_generic_doc_link.quantity_contra`) and Outstanding is ordered minus received. The range defaults to the start of the month two months back through today; the backend caps the result at 500 orders per run and applies the same supplier-link filter as everything else.

### File Import

The **File Import** listing shows **File Name, File Size, Format, Status, Process Status, Error Message, Created Date**. The create screen takes a **Delimiter**, an optional supplier, and one uploaded file, then **SUBMIT**. Opening an imported file shows three helper grids — every row, the rows that failed, and a resubmit view — so a supplier can see exactly which CSV line was rejected.

A second tab, **API Upload**, appears only when the `SHOW_API_UPLOAD` setting is on.

What happens after SUBMIT (`InternalPurchaseOrderImportFileHelperProcessor`):

1. Process status **VALIDATING_DATA**; the file's rows are parsed and their GUIDs resolved.
2. Columns are validated. Any row error ⇒ process status **FAILED** and nothing is created.
3. No errors ⇒ purchase orders are created from the rows; if some rows remain unprocessed the file ends **FAILED**, otherwise it goes **PARTIALLY_DONE**, the created document GUIDs are written back to the helper rows, totals are calculated, and the file ends **DONE**.

## Configuration

### Before you can use it

| Prerequisite | Where it is set | Why it matters |
|---|---|---|
| The supplier's login is linked to the supplier entity | [Supplier](/applets/master-data/supplier-applet-1/) → Login (`bl_fi_mst_entity_login_subject_link`, `ACTIVE`) | Every read is filtered by that link, and **Update Status** is authorised by it. |
| The applet is installed for that login | [Tenant Admin](/applets/external-tenant-admin/tenant-admin-applet/) | Applet token, plus the `appletGuid` used by the printable-format picker. |
| A workflow process for the company | **Settings → Workflow Settings** (Company Workflow listing / create / edit) and `WORKFLOW_PROCESS_GUID` in Field Settings | Without a process the Workflow Status drop-down is empty and **Update Status** has nothing to send. |
| A printable format for `INTERNAL_PURCHASE_ORDER` | [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) → Printable Format Settings, or this applet's own | The Export tab lists formats for this document type. |

### Applet settings

Settings live on the **shared** `FieldConfigurationComponent` from `blg-shared-utilities` (route `settings/field-settings`), gated by `sessionStorage.appletCode`. The applet also contains its own `field-configuration` component carrying a Workflow drop-down, but no route points at it — it is dead code; the shared screen is where `WORKFLOW_PROCESS_GUID` is set.

**22 keys pass all four proofs** at the shared-utilities commit this applet pins (`f9e5782`); re-checking at HEAD adds nothing. Nineteen of them are the line-field hides shared with the rest of the family; three are specific to this applet.

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| `WORKFLOW_PROCESS_GUID` | The workflow process whose statuses appear in the Main Details drop-down | Unset | The document's own `xtn_process_hdr_guid` wins when the buyer already stamped one; otherwise this value seeds the drop-down. Unset ⇒ no statuses to choose. |
| `SHOW_API_UPLOAD` | The **API Upload** tab on the File Import listing | Off (`?? false`) | Shows the second import grid. |
| `VERTICAL_ORIENTATION` | Whether the File Import screens honour the personal orientation setting | Off | With it on, `DEFAULT_ORIENTATION` / `DEFAULT_TOGGLE_COLUMN` decide single- or double-column layout on the import screens. |
| `HIDE_QTY_BASE`, `HIDE_QTY_UOM`, `HIDE_UOM_TO_BASE_RATIO`, `HIDE_UNIT_PRICE_STD_EXCL_TAX`, `HIDE_UNIT_PRICE_STD_INCL_TAX`, `HIDE_UNIT_PRICE_STD_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_STD_UOM_INCL_TAX`, `HIDE_UNIT_PRICE_NET_EXCL_TAX`, `HIDE_UNIT_PRICE_NET_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_TXN_UOM_INCL_TAX`, `HIDE_UNIT_DISCOUNT`, `HIDE_UNIT_DISCOUNT_UOM_EXCL_TAX`, `HIDE_DISCOUNT_AMOUNT_EXCL_TAX`, `HIDE_AMOUNT_STD_EXCL_TAX`, `HIDE_AMOUNT_NET_EXCL_TAX`, `HIDE_AMOUNT_TXN`, `HIDE_TAX_CONFIG_SELECTION`, `HIDE_WHT_CONFIG_SELECTION` | One line field each on the line detail | Off | Hidden unless the role holds the matching `SHOW_*` client-side permission. |
| `HIDE_COSTING_DETAILS` | The **Costing Details** tab on a line | Off | Hides the tab. The code also accepts `SHOW_COSTING_DETAILS` as an override, but that permission is **not seeded for this applet** (see below), so in practice this setting is all-or-nothing. |

**Read outside the shared screen:** `DEFAULT_BRANCH` and `DEFAULT_LOCATION` (applet-local Default Selection screen — saved, but nothing here reads them, since the applet has no document create form); `PRINTABLE` (Printable Format Settings, and it pre-selects the format on the Export tab); `DEFAULT_ORIENTATION` and `DEFAULT_TOGGLE_COLUMN` (Personalization → Default Selection, consumed by the File Import screens).

### Document behaviour settings

The only document behaviour this applet controls is the workflow status, and it is configured in two places: **Settings → Workflow Settings**, which maintains the company's workflow processes, and `WORKFLOW_PROCESS_GUID` on the shared Field Settings screen, which says which process this applet offers. Posting, FINAL, VOID and knock-off remain buyer-side.

### Feature visibility and permissions

The registry seeds **19 client-side permission codes** for this applet, all `ACTIVE` as of 2026-09-06 — the `SHOW_*` half of the line-field pairs above. `SHOW_COSTING_DETAILS` is checked in this applet's code but has no definition row for this applet code, so it cannot be granted from **Role Permission Listing**.

Server-side:

| Path | Endpoint | Check |
|---|---|---|
| Listing, Line Items, open a document | `…/gen-doc/internal-purchase-orders/login-entity-ep[/query]` | Entity-filtered by the supplier link; no permission check. |
| **Update Status** | `POST …/gen-doc/login-entity-ep/xtn-process` | `UserPermissionService.isUserLoginEntity(login, entity_hdr_guid)` — the login must be linked to the entity on the document, otherwise `CLIENT_AUTH_USER_NOT_AUTHORIZED`. |
| Export PDF | `GET …/internal-purchase-orders/print-jasper-pdf/login-entity-ep/{guid}` | Entity-filtered; no permission needed. |
| PO Detailed Report | `POST …/gen-doc/blanket-purchase-report/po/login-entity-ep` | Entity-filtered in the report SQL; capped at 500 rows. |
| File Import listing / open | `…/internal-purchase-order/import-file-hdr/login-entity-ep[/query]` | Filtered to files created by this login. |
| File Import submit | `POST …/internal-purchase-order/import-file-hdr/login-entity-ep` (multipart) | Any authenticated login with the applet; the import is attributed to that login. |

## Fields

The document tabs are read-only apart from the workflow drop-down; the tables above list what each shows. The File Import create form has three inputs — Delimiter, an optional supplier, and the file itself — and **SUBMIT** stays disabled until a file is attached.

## Lifecycle and effects

The document's own posting behaviour belongs to the buyer-side applet:

| Property | Value |
|---|---|
| Server document type | `INTERNAL_PURCHASE_ORDER` |
| Amount signum | 0 (`InternalPurchaseOrderDataConsistencyObject`) |
| Quantity signum | 0 — an order moves no stock and posts no journal |
| Dr/Cr equation | None. |
| GL precedence | Not applicable. |
| Stock processor | None; the order only creates open-queue rows that the GRN and invoice knock off. |
| What VOID reverses | The buyer-side void processor releases the knock-off queue. |

What this applet writes:

| Write | Table / column | Notes |
|---|---|---|
| **Update Status** | `bl_fi_generic_doc_hdr.xtn_process_hdr_guid`, `xtn_process_status_guid`, `xtn_process_status_code`, `xtn_process_resolution_guid`, `xtn_process_resolution_code`, and the same columns on any lines sent with the request | `GenericDocumentService.updateXtnProcess` validates through `GenericDocXtnProcessDCO` and updates in one transaction; the payload is merged onto the existing row, so no other field changes. The DCO rejects a null or unknown header GUID, entity GUID, process GUID, status GUID or resolution GUID with `GENERIC_DOC_HDR_OBJECT_GUID_…`, `GENERIC_DOC_HDR_DOC_ENTITY_HDR_…`, `GENERIC_DOC_HDR_XTN_PROCESS_STATUS_GUID_…`, `GENERIC_DOC_HDR_XTN_PROCESS_RESOLUTION_GUID_…` and `WF_PROCESS_HDR_OBJECT_GUID_…` errors. A line GUID that does not exist fails with `LINE_GUID_DOES_NOT_EXIST`. |
| **File Import** | `bl_fi_internal_purchase_order_import_file_hdr` / `…_helper`, then new purchase orders | See *File Import* above for the status sequence. |

## Related applets

- [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) — the buyer-side applet.
- [Purchase GRN Supplier Access (Internal)](/applets/purchase-workflow/internal-purchase-grn-supplier-access-applet/) — the receipt against this order.
- [Purchase Invoice Supplier Access (Internal)](/applets/purchase-workflow/internal-purchase-invoice-supplier-access-applet/) — the invoice that follows.
- [Blanket Purchase Order Supplier Access](/applets/purchase-workflow/blanket-purchase-order-applet-supplier-access-applet/) — the agreement the order may draw down.
- [Supplier](/applets/master-data/supplier-applet-1/) — where the login link is created.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| The listing is empty | No `ACTIVE` supplier link for the login, or the buyer's orders are still DRAFT (the default criterion is `posting_statuses = FINAL`) | Check the link in the [Supplier](/applets/master-data/supplier-applet-1/) applet; to see drafts, set Posting Status in the advanced search — here the search replaces the default. |
| The **Workflow Status** drop-down is empty | No workflow process is configured (`WORKFLOW_PROCESS_GUID` unset and none stamped on the document), or the current status has no onward transitions | Configure the process in **Settings → Workflow Settings** and select it in **Settings → Field Settings**. |
| **Update Status** returns *not authorised* | The backend checks that the login is linked to the entity on the document; a link that exists for a different entity is not enough | Link the login to the exact supplier entity named on the order. |
| **Update Status** fails with a `…_GUID_IS_NULL_OR_EMPTY` error | The status was selected but its resolution had not been resolved yet — the resolution is fetched asynchronously after the drop-down changes | Wait a moment after choosing the status, then press Update Status; re-select the status if it happens again. |
| The status list takes several seconds to appear | The screen deliberately waits three seconds before patching the current status into the control | Expected. |
| **EXPORT AS PDF** fails | The chosen printable format does not exist for `INTERNAL_PURCHASE_ORDER`, or none was selected | Pick a format in the Export tab, or set a default in Printable Format Settings. |
| A CSV import ends **FAILED** with nothing created | One or more rows failed column validation; the processor creates nothing unless every row passes | Open the file and read the *error* helper grid, fix those rows and resubmit. |
| A CSV import ends **FAILED** after some orders were created | Rows remained unprocessed after creation | Check the helper grids for the rows without a document number, and import them again. |
| The **API Upload** tab is missing | `SHOW_API_UPLOAD` is off | Turn it on in **Settings → Field Settings**. |
| **Costing Details** is missing for everyone | `HIDE_COSTING_DETAILS` is on and `SHOW_COSTING_DETAILS` is not seeded for this applet, so no role can re-open it | Turn the setting off, or ask for the permission definition to be registered. |
| Changing Default Selection has no effect | The applet has no document create form; `DEFAULT_BRANCH` and `DEFAULT_LOCATION` are saved but never read | Expected. |

## Related documentation

- [Purchase Order (Internal) applet](/applets/purchase-workflow/internal-purchase-order-applet/)
- [Purchasing module](/modules/purchasing/)
- [Supplier applet](/applets/master-data/supplier-applet-1/)
