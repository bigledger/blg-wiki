---
title: "Stock Requisition Applet(Internal)"
description: "Reference for the Stock Requisition (Internal) applet — the Requisition Out document a branch raises to ask for stock from another location: screens, every configurable setting, fields, what FINAL does and does not do, how CREATE ST hands the request to the Stock Transfer applet, and the errors you will meet."
applet_code: "internalStockRequisitionApplet"
applet_repo: "blg-applet-wavelet-internal-stock-requisition-applet"
modules: [inventory]
related_applets: [stock-transfer-applet, internal-purchase-grn-applet, organisation-applet, warehouse-management-applet, inv-item-maintenance-applet, doc-item-maintenance-applet, employee-applet, stock-balance-applet, stock-availability-applet]
guides: []
sources:
  configuration:
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/app.routing.ts
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/app.component.ts
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/models/spreadsheet-view-settings.model.ts
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/models/constants/applet-constants-outbound.ts
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/custom-field-screens.config.ts
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.html
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/components/settings-container/printable-format-settings-container/printable-format-listing/printable-format-listing.component.ts
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/components/settings-container/approval-setting/approval-setting-create/approval-setting-create.component.ts
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/components/settings-container/approval-setting/approval-setting-create/approval-setting-create.component.html
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/components/settings-container/approval-setting/approval-setting-listing/approval-setting-listing.component.ts
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/components/settings-container/branch-container/branch-view/branch-designation/branch-designation-create/branch-designation-create.component.ts
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/components/settings-container/branch-container/branch-view/branch-designation/branch-designation-create/branch-designation-create.component.html
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/components/settings-container/branch-container/branch-view/branch-designation-employee/branch-designation-employee-create/branch-designation-employee-create.component.html
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/components/settings-container/branch-container/branch-view/branch-employee-link/branch-employee-link-create/branch-employee-link-create.component.html
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/components/settings-container/spreadsheet-view-settings/spreadsheet-view-settings.component.ts
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/components/settings-container/spreadsheet-view-settings/spreadsheet-view-settings.component.html
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/components/internal-outbound-stock-requisition-container/internal-outbound-stock-requisition-container.component.ts
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/components/internal-outbound-stock-requisition-container/internal-outbound-stock-requisition-listing/internal-outbound-stock-requisition-listing.component.ts
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/components/internal-outbound-stock-requisition-container/internal-outbound-stock-requisition-listing/internal-outbound-stock-requisition-listing.component.html
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/components/internal-outbound-stock-requisition-container/internal-outbound-stock-requisition-view/internal-outbound-stock-requisition-view.component.ts
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/components/internal-outbound-stock-requisition-container/internal-outbound-stock-requisition-view/internal-outbound-stock-requisition-view.component.html
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/components/internal-outbound-stock-requisition-container/internal-outbound-stock-requisition-create/internal-outbound-stock-requisition-create.component.ts
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/components/internal-outbound-stock-requisition-container/internal-outbound-stock-requisition-create/internal-outbound-stock-requisition-create-line-items-inline-v2/internal-outbound-stock-requisition-create-line-items-inline-v2.component.ts
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/components/internal-outbound-stock-requisition-container/internal-outbound-stock-requisition-create-line-item/line-search-item/line-search-item.component.ts
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/components/file-import-container/file-import-create/file-import-create.component.html
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/permissions/TntErpPermissions.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/permissions/TntErpPermissionsV2.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentTypeHandler.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/ListingController.java
    - akaun_master.bl_applet_hdr (code internalStockRequisitionApplet, read 2026-09-05)
    - akaun_master.bl_applet_client_side_perm_dfn (applet internalStockRequisitionApplet, 24 rows on 2026-09-05)
  fields:
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/components/internal-outbound-stock-requisition-container/internal-outbound-stock-requisition-create/internal-outbound-stock-requisition-create.component.html
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/components/internal-outbound-stock-requisition-container/internal-outbound-stock-requisition-create/internal-outbound-stock-requisition-create-main/internal-outbound-stock-requisition-create-main.component.ts
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/components/internal-outbound-stock-requisition-container/internal-outbound-stock-requisition-create/internal-outbound-stock-requisition-create-main/internal-outbound-stock-requisition-create-main.component.html
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/components/internal-outbound-stock-requisition-container/internal-outbound-stock-requisition-add-line-item/add-line-item-item-details/internal-outbound-stock-requisition-add-line-item-main/internal-outbound-stock-requisition-add-line-item-main.component.ts
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/components/internal-outbound-stock-requisition-container/internal-outbound-stock-requisition-add-line-item/add-line-item-item-details/internal-outbound-stock-requisition-add-line-item-main/internal-outbound-stock-requisition-add-line-item-main.component.html
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/components/internal-outbound-stock-requisition-container/import-knock-off/import-knock-off.component.html
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/components/internal-outbound-stock-requisition-container/import-knock-off/knock-off-grn/knock-off-grn.component.ts
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/components/line-items-container/line-items-listing/line-items-listing.component.ts
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/custom-field-screens.config.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/finance/internalStockRequisitionFileImport/InternalStockRequisitionImportFileColumnNames.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/finance/internalStockRequisitionFileImport/InternalStockRequisitionImportFileHdrService.java
  lifecycle:
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/components/internal-outbound-stock-requisition-container/internal-outbound-stock-requisition-listing/internal-outbound-stock-requisition-listing.component.ts
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/components/internal-outbound-stock-requisition-container/internal-outbound-stock-requisition-view/internal-outbound-stock-requisition-view.component.ts
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/state-controllers/internal-outbound-stock-requisition-controller/store/effects/internal-outbound-stock-requisition.effects.ts
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/services/api-service.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalStockRequisitionDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/GenericDocumentDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/ServerDocShortCodes.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentTypeHandler.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocLinkService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingTypeHandler.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/inventory/InventoryTransactionLineProcessorService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/genericDocument/GenericDocumentController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/GenericDocLineOpenQueueProcessor.java
  troubleshooting:
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/components/internal-outbound-stock-requisition-container/internal-outbound-stock-requisition-listing/internal-outbound-stock-requisition-listing.component.ts
    - blg-applet-wavelet-internal-stock-requisition-applet/micro-fe/projects/wavelet-erp/applets/internal-stock-requisition-applet/src/app/components/internal-outbound-stock-requisition-container/internal-outbound-stock-requisition-create/internal-outbound-stock-requisition-create-main/internal-outbound-stock-requisition-create-main.component.ts
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/genericDocument/GenericDocumentController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocLinkService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/finance/internalStockRequisitionFileImport/InternalStockRequisitionImportFileHdrService.java
    - gh:bigledger/blg-akaun-platform-java#1153
    - gh:bigledger/blg-int-general-task#9561
    - gh:bigledger/blg-intranet#3738
    - gh:bigledger/blg-wiki#112
tags:
  - inventory-workflow
  - stock-requisition
  - internal-stock-transfer
  - outbound-requisition
  - file-import
weight: 10
---

## Overview

The Stock Requisition (Internal) applet records a branch's request for stock from another location: which items, how many, from which location (sending) to which location (receiving). The document it creates is the **Requisition Out** (server document type `INTERNAL_STOCK_REQUISITION`, short code `STKREQ`). It is a **non-posting** document: FINAL neither moves stock nor writes to the general ledger, because both signums are fixed at 0 in the backend (see [Lifecycle and effects](#lifecycle-and-effects)). The stock actually moves when a Transfer Out is raised against the requisition in the [Stock Transfer](/applets/inventory-workflow/stock-transfer-applet/) applet — either by that applet's *Search Document › Stock Requisition* tab or by the **CREATE ST** button here.

The applet also carries a per-line **Line Items** listing, a CSV **File Import**, and a set of settings screens (Branch Designation, Approval Settings, Custom Field Placement, Spreadsheet View) that were added for the optional position-based approval workflow. The backend approval engine does support this document type, but this applet gives you nowhere to submit a requisition against a setting — there is no approval tab on the document, no Approval Request screen and no Approval History screen — so a setting created here has no effect today. See [Configuration](#configuration) and the [Document Approvals](/guides/document-approvals/) guide.

## Where it fits

| Direction | Document / applet | How it connects |
|---|---|---|
| Upstream (optional knock-off) | [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/) | The create screen's **KO For › Purchase GRN** tab lists GRN lines that still have an open quantity toward `INTERNAL_STOCK_REQUISITION` and copies them into the requisition. |
| Downstream | [Stock Transfer](/applets/inventory-workflow/stock-transfer-applet/) — Transfer Out | A Transfer Out fulfils the requisition: either the Stock Transfer applet knocks the requisition off from its own *Search Document* tab, or **CREATE ST** here creates a new Transfer Out pre-filled from the requisition. The transfer is what moves the stock. |
| Master data | [Warehouse Management](/applets/inventory-workflow/warehouse-management-applet/) (locations), [Organisation](/applets/master-data/organisation-applet/) (company, branch, Knock Off Configuration), [Inventory Item Maintenance](/applets/inventory-workflow/inv-item-maintenance-applet/) / [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) (items), [Employee](/applets/master-data/employee-applet/) (Branch Designation employees) | Sending / receiving locations, the company whose Knock Off Configuration decides whether FINAL leaves open-queue rows, the items on the lines, and the employees named in approval designations. |
| Reports | [Stock Balance](/applets/inventory-workflow/stock-balance-applet/), [Stock Availability](/applets/inventory-workflow/stock-availability-applet/) | A requisition changes neither report; only the transfer does. The item picker can show the current balance per location while you add lines (`SHOW_ITEM_STOCK_BALANCE`). |

Module: [Inventory](/modules-v2/inventory/).

## Screens and menus

**Left menu**

- **Requisition Out** — the document listing. Columns (each hideable, see [Configuration](#configuration)): document numbers (tenant / company / branch), branch, transaction date, client document type and references, posting status, quantity ordered / received / outstanding, knock-off document from / to, remarks, reference, created date. Buttons: **+** (create), **FINAL**, **DISCARD**, **VOID**, **DRAFT**, **CREATE ST**, **PRINT**, plus a column toggle and Advanced Search. FINAL acts on every selected row that is not FINAL; DISCARD on selected DRAFT rows; VOID, DRAFT and CREATE ST on selected rows that are FINAL and ACTIVE; PRINT on the selection using the default printable format.
- **Line Items** — a cross-document listing of requisition lines: SQ#, transaction date, item code, item name, location from, location to, qty ordered, qty received, qty outstanding, creation / updated date. Rows open a line editor with Item Details, Costing Details (hideable), Pricing Details, Issue Link and the Serial / Batch / Bin tab that matches the item's sub-type.
- **File Import** — CSV upload of requisitions (see [Fields › File Import](#file-import)) and a listing of import jobs with their process status and error message.

The left-menu entries **Line Items** and **File Import** are removed when the settings `HIDE_LINE_ITEMS_MENU` / `HIDE_FILE_IMPORT_MENU` are on, unless the user holds the matching `SHOW_LINE_ITEMS_MENU` / `SHOW_FILE_IMPORT_MENU` client-side permission.

**Create screen** — pressing **+** first creates a TEMP document on the server (so a document GUID exists before you type anything), then opens the form. Tabs: **Details**, **Line**, **KO For** (only *Purchase GRN*; an *ST-GRN* tab exists in the code but is commented out). With `VERTICAL_ORIENTATION` on, the same three sections render as expansion panels instead of tabs; the personal setting *Tab Orientation* then chooses which of the two layouts the current user sees.

**View / edit screen** — buttons **RESET**, **FINAL**, **DRAFT**, **VOID**, **SAVE**, **CREATE ST**, **DISCARD**, and a **DELETE** button when `SHOW_DOCUMENT_DELETE_BUTTON` is on. Sections: **Details**, **Line** (with sub-tabs *Standard View* and *Spreadsheet View* depending on the Spreadsheet View configuration), **Doc Link**, **Attachment**, **Export**. The order of the sections is what an administrator dragged into place under *Settings › Default Selection*; Doc Link, Attachment and Export can be hidden individually.

**Adding a line** — the item picker (*Search Item*) lists items with or without their stock balance; the line form then shows Item Details, Delivery Instruction, Department, Costing Details, Pricing Details, Issue Link and, by item sub-type, Serial Number / Batch Number / Bin Number.

**Settings menu** (System Configuration): Application Settings, Default Selection, Printable Format Settings, Branch Designation, Approval Settings, Custom Resource Bundle Configuration, Custom Field Placement, Spreadsheet View configuration. The routes additionally expose Webhook, Feature Visibility, Client-Side Permission, Permission Wizard, Permission Set, User / Team / Role Permission, Release Notes and Applet Log screens.

**Personalization menu**: Default Selection (Default Branch, Default Location, Tab Orientation), Sidebar.

No screenshots are available for this applet yet (the previous page had none either).

## Configuration

### Before you can use it

- **Locations** — at least two active stock locations, linked to branches, in [Warehouse Management](/applets/inventory-workflow/warehouse-management-applet/). The sending and receiving drop-downs list the locations of the selected branch; without a branch selection they list every location.
- **Location permission targets** — the create button needs `TNT_API_DOC_INTERNAL_STOCK_REQUISITION_CREATE_TGT_GUID` (or tenant admin / owner). The *Location (Sending)* list is filtered to the locations targeted by the user's `TNT_API_DOC_INTERNAL_STOCK_REQUISITION_READ_TGT_GUID`, the *Location (Receiving)* list to the targets of `TNT_API_DOC_INTERNAL_STOCK_REQUISITION_LOCATION_TO_READ_TGT_GUID`; tenant admins and owners see all locations. Assign these with the Permission Wizard under this applet's Settings.
- **Items** — the items you will request, in [Inventory Item Maintenance](/applets/inventory-workflow/inv-item-maintenance-applet/). Serial-, batch- and bin-tracked items add the corresponding tab on the line, but the backend does not check serial / batch quantities on a requisition (signum 0 — see Lifecycle).
- **Knock Off Configuration** (company level, [Organisation](/applets/master-data/organisation-applet/) › Company) — two rows matter here: *Purchase GRN → Stock Requisition* if you want the **KO For › Purchase GRN** tab to list anything, and *Stock Requisition → Outbound Stock Transfer* if you want the Stock Transfer applet's *Search Document › Stock Requisition* tab to find FINAL requisitions. **CREATE ST** does not need the second row (it copies lines directly), but the transfer queue is only maintained when the row exists.
- **Document numbering** — a running number for `INTERNAL_STOCK_REQUISITION` on the company, otherwise the tenant / company / branch document numbers stay empty after FINAL.
- **A printable format** uploaded under *Settings › Printable Format Settings* and marked as default, otherwise **PRINT** has nothing to render.
- No GL codes, tax codes or cashbooks are involved: the document never posts.

### Applet settings

Settings live in four places. **Application Settings** is the shared `FieldConfigurationComponent` from blg-shared-utilities, keyed by the registry code `internalStockRequisitionApplet` (54 controls for this code, plus the toggles for the Doc Link, Attachment and Export tabs, which the shared screen renders because its tab map lists exactly those three for this code). **Default Selection**, **Printable Format Settings**, **Branch Designation**, **Approval Settings** and **Spreadsheet View configuration** are applet-local screens. **Custom Resource Bundle Configuration** and **Custom Field Placement** are shared screens fed by this applet's label list and screen registry. **Personalization › Default Selection** is per user. Anyone who can open the applet's Settings menu can change tenant-wide settings; personal settings affect only the user who saves them.

Every key below is declared in the applet's settings model, rendered by a control, persisted by the settings save, and read by component code. Defaults are the control's initial value (all toggles start off; a fresh tenant sees everything until Application Settings is saved once).

**Listing and buttons**

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| `DISABLE_GEN_DOC_LISTING` | Stops the listing from loading documents automatically when it opens. | off | On: the grid stays empty until the user runs a search. |
| `HIDE_GENDOC_FINAL_BUTTON`, `HIDE_GENDOC_DISCARD_BUTTON`, `HIDE_GENDOC_VOID_BUTTON` | The FINAL / DISCARD / VOID buttons on the listing and on the view screen. | off | Hidden buttons come back for users holding `SHOW_GENDOC_FINAL_BUTTON` / `SHOW_GENDOC_DISCARD_BUTTON` / `SHOW_GENDOC_VOID_BUTTON` — codes the applet checks but that are not seeded in the permission registry for this applet. |
| `HIDE_GENDOC_SAVE_BUTTON` | The SAVE button on the view screen. | off | On: a DRAFT can be edited but not saved from the view screen. |
| `HIDE_CREATE_STOCK_TRANSFER_BUTTON` | The CREATE ST button on the listing and on the view screen. | off | Hidden button comes back for users with `SHOW_CREATE_STOCK_TRANSFER_BUTTON` (seeded). |
| `SHOW_DRAFT_BUTTON` | The DRAFT button (FINAL → DRAFT) on the listing and the view screen. | off | Off: nobody can revert a FINAL requisition from the UI. No permission override — the view screen reads a `SHOW_DRAFT_BUTTON` permission but the button is also gated on the setting. |
| `DEFAULT_TRANSACTION_DATE` | The default transaction-date range the listing and Line Items queries apply (`1_day`, `1_week`, `1_month`). | empty (no date filter) | Sets the from-date of the initial query to today minus the chosen range. |
| `HIDE_KO_DOC_FROM`, `HIDE_KO_DOC_TO` | The *KO Doc From* / *KO Doc To* listing columns. | off | Per-user override via `SHOW_KO_DOC_FROM` / `SHOW_KO_DOC_TO` (not seeded). |
| `VERTICAL_ORIENTATION` | Enables the expansion-panel layout of the create / view screens and the personal *Tab Orientation* switch. | off | On: users with personal *Tab Orientation* = VERTICAL get panels; others keep tabs. |

**Document header (Details)**

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| `HIDE_MAIN_DETAILS_DOC_NO_TENANT`, `…_COMPANY`, `…_BRANCH` | The three document-number fields at the top of Details. | off | Hidden fields are still populated on FINAL; they are only not shown. |
| `HIDE_STOCK_REQUISITION_GOOD_ISSUE_DATE` | The *Stock Requisition Good Issue Date* field. | off | The field is hidden but its required validator is not removed; the value is pre-filled from the document's transaction date, so a create still works unless that value is empty. |
| `SHOW_DRIVER_CODE` | Adds a *Driver Code* field to Details. | off | Stored on the header. |
| `SHOW_REMARKS` | Adds a *Remarks* field to Details. | off | Stored on the header; also printed on the default requisition printable. |
| `HIDE_TRACKING_ID` | The *Tracking ID* field on Details. | off | Hidden; the value is copied to a Transfer Out created by CREATE ST when present. |
| `HIDE_REFERENCE_NO` | The *Reference #* field on Details. | off | Hidden. |
| `HIDE_DOC_DESCRIPTION_DETAILS` | The *Doc Description* field on Details. | off | Hidden. |

**Lines**

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| `SHOW_ITEM_STOCK_BALANCE` | Switches the item picker and the inline line grid to the stock-balance search endpoint, which shows the balance per location next to each item. | off | Display only. The shared settings screen labels this control *DISALLOW NEGATIVE STOCK FOR BASIC ITEM (VALIDATE STOCK BALANCE)*; in this applet it performs no validation, and the backend ignores stock balance for a signum-0 document anyway. |
| `SHOW_LINE_ITEM_BRANCH_COLUMNS` | Adds branch columns to the line grids. | off | Display only. |
| `HIDE_TRACKING_ID_GEN_DOC` | The *Tracking ID* field on the line form. | off | Hidden. |
| `HIDE_DOC_REFERENCE`, `HIDE_DOC_DESCRIPTION` | The *Doc Reference* / *Doc Description* fields on the line form. | off | Hidden. |
| `HIDE_ITEM_DETAILS_REMARKS` | The *Remarks* field on the line form and the remarks column in the line grid. | off | Hidden. |
| `HIDE_LINE_ITEM_LISTING_TRACKING_ID`, `HIDE_LINE_ITEM_LISTING_UOM` | The tracking-id / UOM columns in the create screen's line grid and the item picker. | off | Hidden. |
| `HIDE_COSTING_DETAILS` | The *Costing Details* tab of the line editor under Line Items. | off | Comes back for users with `SHOW_COSTING_DETAILS` (seeded). |
| `HIDE_UNIT_PRICE_STD_PRICING_SCHEME`, `HIDE_UNIT_PRICE_STD_INCL_TAX`, `HIDE_UNIT_PRICE_STD_EXCL_TAX`, `HIDE_UNIT_PRICE_STD_UOM_INCL_TAX`, `HIDE_UNIT_PRICE_STD_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_NET_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_NET_EXCL_TAX`, `HIDE_UNIT_DISCOUNT`, `HIDE_UNIT_DISCOUNT_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_TXN_UOM_INCL_TAX`, `HIDE_UNIT_PRICE_TXN`, `HIDE_QTY_BASE`, `HIDE_QTY_UOM`, `HIDE_UOM_TO_BASE_RATIO`, `HIDE_AMOUNT_STD_EXCL_TAX`, `HIDE_DISCOUNT_AMOUNT_EXCL_TAX`, `HIDE_AMOUNT_NET_EXCL_TAX`, `HIDE_AMOUNT_TXN`, `HIDE_TAX_CONFIG_SELECTION`, `HIDE_WHT_CONFIG_SELECTION` | Individual price, quantity, discount, amount and tax fields on the *Pricing Details* tab of the line editor. | off | Each has a seeded `SHOW_*` client-side permission that re-enables the field per user. Pricing is informational on a requisition — no amount is posted. |

**Miscellaneous**

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| `HIDE_DOC_LINK_FROM`, `HIDE_DOC_LINK_TO` | The two halves of the *Doc Link* tab on the view screen. | off | Hidden. |
| `PRINTABLE` | The printable format used by PRINT and Export. | none | Set by marking a format as default under *Printable Format Settings*; not on the Application Settings screen. |

**Default Selection** (applet-local) saves `DEFAULT_BRANCH`, `DEFAULT_LOCATION`, `DEFAULT_COMPANY`, `DEFAULT_LANGUAGE_CODE` and the drag-ordered list `OUTBOUND_STOCK_REQUISITION_DETAILS_TAB_ORDER`. Only the tab order and the language are consumed: the view screen sorts its sections by the saved order, and the language code selects the resource bundle. `DEFAULT_BRANCH` / `DEFAULT_LOCATION` are persisted but no create or line component reads them — the Details form always starts with empty locations.

**Personalization › Default Selection** saves the same branch / location keys per user (also unread by the form) and `DEFAULT_ORIENTATION` (*Tab Orientation*), which the create and view screens honour when `VERTICAL_ORIENTATION` is on.

**Spreadsheet View configuration** stores, per line tab, a *Line View Mode* (`standard_only`, `spreadsheet_only`, `both_tabs`; default `standard_only`) and, per column, label, visible, editable and order. The inline line grid on the create and view screens builds its columns from this configuration.

**Custom Field Placement** registers two screens for custom fields (`bl_tnt_custom_field_definition` / `bl_tnt_custom_field_placement`): *Internal Stock Requisition › Details* (12 slots after Doc Short Code, the three document numbers, Good Issue Date, Location (Sending), Driver Code, Tracking ID, Location (Receiving), Remarks, Reference #, Doc Description) and *Line Details* (12 slots after GRN No., ST-GRN ID, Location From / To, Item Code, Tracking ID, Item Name, Quantity, UOM, Doc Reference, Doc Description, Remarks).

**Custom Resource Bundle Configuration** relabels the applet's texts (menu names, *Location From* / *Location To*, *Stock Requisition Good Issue Date*, *Created By*, *Created Date*, button captions such as FINAL).

**Keys read at runtime without a declaration in the applet's settings model** — set on the shared Application Settings screen, saved with it and read by the listing or the shell:

- Listing columns, each paired with a `SHOW_*` permission: `HIDE_SERVER_DOC_1` / `_2` / `_3` (document numbers), `HIDE_TRANSACTION_DATE`, `HIDE_CLIENT_DOC_TYPE`, `HIDE_CLIENT_DOC_1` … `_5`, `HIDE_ARAP_PNS`, `HIDE_ARAP_SETTLEMENT`, `HIDE_ARAP_DOC_OPEN`, `HIDE_ARAP_CONTRA`, `HIDE_ARAP_BAL`, `SHOW_GL_DIMENSION`, `SHOW_SEGMENT`, `SHOW_PROFIT_CENTER`, `SHOW_PROJECT`. The ARAP and dimension columns are always empty on a requisition.
- `DEFAULT_STATUS` — which document statuses the listing loads (`ALL` or on = every status; otherwise the named status; unset = ACTIVE only).
- `HIDE_LINE_ITEMS_MENU` — removes the *Line Items* left-menu entry.
- `SHOW_DOCUMENT_DELETE_BUTTON` — shows DELETE on the view screen.
- `HIDE_DOC_LINK_TAB`, `HIDE_ATTACHMENT_TAB`, `HIDE_EXPORT_TAB` and `EXPAND_DOC_LINK`, `EXPAND_ATTACHMENT`, `EXPAND_EXPORT` — hide or pre-expand those view sections.

**Read by the applet but with no control on any settings screen for this applet code** (they can only be set by editing the applet's `APPLET_SETTINGS` extension directly): `HIDE_FILE_IMPORT_MENU`, `HIDE_LISTING_BRANCH`, `HIDE_QTY_MAIN_LISTING`, `HIDE_AMOUNT_MAIN_LISTING`, `HIDE_QUOTATION`, `HIDE_ORDER`, `HIDE_DELIVERY_ORDER`, `HIDE_INVOICE`, `HIDE_OTHERS`, `SHOW_DESCRIPTION`, `SHOW_REMARKS_MAIN_LISTING`, `SHOW_REFERENCE_MAIN_LISTING`, `ENABLE_FILTER_BY_TODAYS_TXN` (restricts the listing to today's documents), `RELABEL_BRANCH_TO_JOB_GROUP` (Branch Designation screen labels).

Declared in the model but neither rendered nor read (not documented as settings): the `INCLUDE_*` / `ENABLE_*` dimension, project, segment, SST and WHT flags, the custom-status flags, `HIDE_PERMIT_NO`, `HIDE_LAST_PURCHASE_PRICE`, `DISABLE_LINE_ITEM_QUEUE_LISTING`, `HIDE_GENDOC_DRAFT_BUTTON`, `DEFAULT_TOGGLE_COLUMN`.

### Document behaviour settings

- **Status flow** — DRAFT → FINAL → VOID, with FINAL → DRAFT when `SHOW_DRAFT_BUTTON` is on and DISCARD for drafts. There is no `FINAL_STATUS_GUID` or custom-status hook in this applet.
- **Posting** — not configurable; the document never posts (see Lifecycle).
- **Printables** — one default format (`PRINTABLE`) chosen under Printable Format Settings; the same format serves PRINT on the listing and Export on the view screen.
- **Approval** — *Approval Settings* creates rows in `bl_fi_generic_doc_approval_setting` (code, name, submitter designation code, branch and company, server document type fixed to `INTERNAL_STOCK_REQUISITION`, total required approval levels, and per level a quorum, a logic — `ANY_TO_APPROVE` or `ALL_TO_APPROVE` — and an approver designation). *Branch Designation* creates approval designations per branch (`bl_fi_mst_branch_designation`, each bound to one approval setting) and assigns employees to a designation with an approval level, and links employees to the branch with an approval rank. **Nothing in this applet submits a requisition against these rows.** The backend approval engine accepts `INTERNAL_STOCK_REQUISITION` and would run the levels, e-mails and history exactly as it does for a purchase order — but the submission path is reachable only through the approval controller, and unlike the Purchase Order and Purchase Requisition applets this one has no approval tab on the document, no Approval Request screen and no Approval History screen. Separately, and true of every document type: the DRAFT → FINAL path itself contains no approval check, so FINAL never waits for an approval even where the loop is complete.
- **e-Invoice** — not applicable.

### Settings in other applets that control this applet

| Setting | Where it is set | Effect here |
|---|---|---|
| Knock Off Configuration rows *Purchase GRN → Stock Requisition* and *Stock Requisition → Outbound Stock Transfer* | [Organisation](/applets/master-data/organisation-applet/) › Company | Whether FINAL of a GRN leaves open-queue rows for the KO For tab here, and whether FINAL of a requisition leaves open-queue rows for the Stock Transfer applet's *Search Document › Stock Requisition* tab. |
| `SHOW_STOCK_REQUISITION_LOCATION_FROM_AND_TO`, `HIDE_STOCK_REQUISITION_SUPPLIER`, `HIDE_STOCK_REQUISITION_BRANCH`, `HIDE_STOCK_REQUISITION_LOCATION` | [Stock Transfer](/applets/inventory-workflow/stock-transfer-applet/) › Application Settings | Columns of the Stock Requisition knock-off grid in the Stock Transfer applet. |
| Fiscal period lock (`LOCK_TXN` / `LOCK_ALL`) | Financial period settings of the company | FINAL of a requisition dated inside a locked period is rejected (`FISCAL_PERIOD_LOCKED`); unlike stock transfers, requisitions are not exempt. |
| Running number for `INTERNAL_STOCK_REQUISITION` | Company document numbering | Populates the three document-number fields on FINAL. |

### Feature visibility / permissions

Backend (targeted, assigned through the Permission Wizard; targets are locations): `TNT_API_DOC_INTERNAL_STOCK_REQUISITION_CREATE_TGT_GUID`, `…_READ_TGT_GUID`, `…_UPDATE_TGT_GUID`, `…_DELETE_TGT_GUID`, and `TNT_API_DOC_INTERNAL_STOCK_REQUISITION_LOCATION_TO_READ_TGT_GUID` for the receiving-location list. File Import listings additionally require `API_TNT_DM_ERP_INTERNAL_STOCK_REQUISITION_HDR_OWNER` / `_ADMIN` / `_READ`. The **+** button appears only with the create permission (or tenant admin / owner); FINAL, DRAFT and VOID go through the update permission on the backend.

Client-side permissions seeded for this applet (24 rows): `SHOW_CREATE_STOCK_TRANSFER_BUTTON`, `SHOW_TRANSACTION_DATE` (makes the Good Issue Date editable — without it the date picker is disabled for everyone), `SHOW_COSTING_DETAILS`, `HIDE_PRICE`, and the per-field `SHOW_*` counterparts of the pricing toggles listed above (`SHOW_UNIT_PRICE_STD_PRICING_SCHEME`, `SHOW_UNIT_PRICE_STD_INCL_TAX`, `SHOW_UNIT_PRICE_STD_EXCL_TAX`, `SHOW_UNIT_PRICE_STD_UOM_INCL_TAX`, `SHOW_UNIT_PRICE_STD_UOM_EXCL_TAX`, `SHOW_UNIT_PRICE_NET_UOM_EXCL_TAX`, `SHOW_UNIT_PRICE_NET_EXCL_TAX`, `SHOW_UNIT_DISCOUNT`, `SHOW_UNIT_DISCOUNT_UOM_EXCL_TAX`, `SHOW_UNIT_PRICE_TXN_UOM_INCL_TAX`, `SHOW_UNIT_PRICE_TXN`, `SHOW_QTY_BASE`, `SHOW_QTY_UOM`, `SHOW_UOM_TO_BASE_RATIO`, `SHOW_AMOUNT_STD_EXCL_TAX`, `SHOW_DISCOUNT_AMOUNT_EXCL_TAX`, `SHOW_AMOUNT_NET_EXCL_TAX`, `SHOW_AMOUNT_TXN`, `SHOW_TAX_CONFIG_SELECTION`, `SHOW_WHT_CONFIG_SELECTION`).

Checked in code but **not seeded** in the registry for this applet (assigning them is not possible from the Client-Side Permission screen until they are): `SHOW_GENDOC_FINAL_BUTTON`, `SHOW_GENDOC_DISCARD_BUTTON`, `SHOW_GENDOC_VOID_BUTTON`, `SHOW_DRAFT_BUTTON`, `SHOW_LINE_ITEMS_MENU`, `SHOW_FILE_IMPORT_MENU`, `SHOW_KO_DOC_FROM`, `SHOW_KO_DOC_TO`, and the `SHOW_*` partners of the listing-column keys (`SHOW_DOC_NO_TENANT`, `SHOW_TRANSACTION_DATE` is the one exception that is seeded, `SHOW_CLIENT_DOC_TYPE`, `SHOW_ARAP_*`, `SHOW_QTY_MAIN_LISTING`, …).

## Fields

### Details

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Doc Short Code | Server-side short code (`STKREQ`). | — | View only. |
| Doc No (Tenant) / (Company) / (Branch) | Running numbers assigned on FINAL. | — | Read-only; each hideable. |
| Stock Requisition Good Issue Date | The document's transaction date (`date_txn`). | Yes | Pre-filled from the TEMP document; the picker is enabled only with `SHOW_TRANSACTION_DATE`. Hideable, but the validator stays. |
| Location (Sending) | The location that will issue the stock (`guid_store`). | Yes | Drop-down filtered by the user's READ targets; disabled once the document is FINAL. |
| Location (Receiving) | The location that requested the stock (`guid_store_2`). | Yes | Drop-down filtered by the LOCATION_TO READ targets; disabled once FINAL. |
| Driver Code | Free text. | No | Only with `SHOW_DRIVER_CODE`. |
| Tracking ID | Free text (`tracking_id`). | No | Hidden by `HIDE_TRACKING_ID`; copied to a Transfer Out created by CREATE ST. |
| Remarks | Free text (`doc_remarks`). | No | Only with `SHOW_REMARKS`. |
| Reference # | Free text (`doc_reference`). | No | Hidden by `HIDE_REFERENCE_NO`; copied by CREATE ST. |
| Doc Description | Free text. | No | Hidden by `HIDE_DOC_DESCRIPTION_DETAILS`. |
| Created By / Created Date / Modified By / Modified Date | Audit fields. | — | Read-only; labels relabelable. |

### Line (item form)

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| GRN No. / ST-GRN ID | The source document when the line was taken from KO For. | — | Read-only. |
| Location From / Location To | The line's locations, defaulted from the header. | — | Read-only on the form. |
| Item Code | The requested item. | Yes | Chosen from the item picker; `Validators.required`. |
| Item Name | From the item. | — | Read-only. |
| Quantity | Quantity requested in base UOM. | Yes | `Validators.required`, minimum 1. When taken from KO For, defaults to the GRN line's open quantity. |
| UOM | Unit of measure. | — | From the item. |
| Tracking ID | Line tracking id. | No | Hidden by `HIDE_TRACKING_ID_GEN_DOC`. |
| Doc Reference / Doc Description / Remarks | Free text. | No | Hidden by `HIDE_DOC_REFERENCE` / `HIDE_DOC_DESCRIPTION` / `HIDE_ITEM_DETAILS_REMARKS`. |
| Serial Number / Batch Number / Bin Number tabs | Per item sub-type. Batch needs batch no., issue and expiry date; bin needs bin code, container qty and measure. | — | Validated in the browser only; the backend skips serial / batch quantity checks for signum-0 lines. |

### KO For › Purchase GRN

Lists GRN documents that have open-queue rows with source type `INTERNAL_PURCHASE_GOODS_RECEIVED_NOTE` and target type `INTERNAL_STOCK_REQUISITION`; search by keyword, document number, reference, branch and date range. Selecting lines copies them with quantity = open quantity and creates DRAFT-status links back to the GRN lines.

### File Import

CSV only (`accept=".csv"`), with a delimiter selector. The *File Type* drop-down offers a single value whose label reads *Stock Adjustment* — a leftover; the file is processed as stock requisitions. Column headers, in any order: `LOCATION_CODE_FROM`, `LOCATION_CODE_TO`, `HDR_REFERENCE_NO`, `TXN_DATE`, `ITEM_CODE`, `QTY`, `HDR_REMARKS`, `HDR_DESCRIPTION`, `ITEM_NAME`, `ITEM_REF_NO`, `ITEM_REMARKS`, `ITEM_DESCRIPTION`, `UOM`, `POSTING_STATUS`. Rows are grouped into documents with `server_doc_type = INTERNAL_STOCK_REQUISITION`, `doc_source_type = INTERNAL` and posting status from the file (default `DRAFT`). The job records `Wrong Columns: …`, `Mandatory Columns Missing: …` or `Empty CSV File` in the import's error message.

## Lifecycle and effects

**Statuses** — **+** creates a TEMP document (`createTemp`), which becomes DRAFT / ACTIVE on the first save (`PUT`). **FINAL** sends the container with `posting_status: FINAL` (bulk from the listing, single from the view). **VOID** (FINAL and ACTIVE only), **DRAFT** (FINAL → DRAFT, `PUT …/internal-stock-requisition/draft/backoffice-ep/{guid}`) and **DISCARD** (DRAFT and ACTIVE only) are the other transitions. Locations are locked once FINAL.

**Posting proof** (backend commit 871dbf5c96):

| | |
|---|---|
| Server document type | `INTERNAL_STOCK_REQUISITION`, short code `STKREQ` (`ServerDocShortCodes` L40) |
| Amount signum | **0** — `InternalStockRequisitionDataConsistencyObject` L16; the header is rejected with `GENERIC_DOC_INVALID_SIGNUM` if it carries any other value (`GenericDocumentDataConsistencyObject.checkAmountSignum` L1207). |
| Quantity signum | **0** — DCO L17; `fillQuantitySignumAndAmountSignumForLine` (L1215) overwrites every line's signums on create and update, so the `quantity_signum = -1` constant in the applet's `AppletConstants` never reaches the database. |
| Dr / Cr equation | None. There is no `INTERNAL_STOCK_REQUISITION` entry in `JournalPostingTypeHandler`; the name-based fallback finds no handler, signum-0 lines are skipped (`JournalPostingService` L96) and the empty journal throws `NO_JOURNAL_CREATED` (L580). The journal subscriber of the generic-document primary queue is not constrained by document type, so a failed journal job is logged for every FINAL requisition — expected, harmless. |
| GL precedence | Not applicable. |
| Stock processor | `InventoryTransactionLineProcessorService` creates inventory lines only for quantity signum ≠ 0 (L40, L75) — **no stock movement**. |
| Open queue | `GenericDocLineOpenQueueProcessor` creates `bl_fi_generic_doc_line_open_queue` rows on FINAL only for the target types enabled in the company's `bl_fi_comp_gendoc_flow_config` (Knock Off Configuration). |
| What VOID reverses | Nothing was posted; VOID sets the posting status and releases open-queue rows. |

**FINAL validation that applies** (`GenericDocumentService.validateGenericDocumentOnFinal`): `FISCAL_PERIOD_LOCKED` when the date falls in a `LOCK_ALL` / `LOCK_TXN` period (L1681-1695 — only the two stock-transfer types are exempt); a second FINAL is refused with 403 *Generic Document has already been posted to FINAL*; serial, batch and stock-balance checks skip signum-0 lines unless the caller sends the signum-zero validation flags, which this applet does not.

**FINAL → DRAFT and VOID** — `GenericDocumentController.checkcanChangePostingStatusToNonFinal` (L2916) requires the document to be FINAL and throws `GENERIC_DOCUMENT_HAS_TARGET_LINKS` (*"… has already been linked with the following documents: OBDSTF-…"*) when any ACTIVE link has this requisition as its source — i.e. after a Transfer Out was created from it (CREATE ST or the Stock Transfer applet's knock-off). Remove or void the transfer first.

**CREATE ST** (listing: selected FINAL + ACTIVE rows; view screen: the open document, no status check) — the applet creates a TEMP `INTERNAL_OUTBOUND_STOCK_TRANSFER` document and calls the backend knock-off with `targetQuantitySignum: -1`. `GenericDocLinkService.knockOff` requires the target to be TEMP (*Target Gen Doc is not in TEMP status*), copies every ACTIVE requisition line less the quantity already linked (*The quantity to be knocked off exceeds the generic doc line quantity* otherwise), creates one link per line (`quantity_signum -1`, `quantity_contra` = line quantity), copies the header's sending / receiving locations in the same order (the swap applies only to inbound transfers), tracking id, reference and external references, updates the requisition's open-queue rows if the Knock Off Configuration created any, and skips the same-entity-and-branch check for this target type. The result is a new, unfinalised Transfer Out in the [Stock Transfer](/applets/inventory-workflow/stock-transfer-applet/) applet; stock moves when that transfer is finalised there. The success toast is *Stock Transfer Succesfuly Created*.

## Related applets

- [Stock Transfer](/applets/inventory-workflow/stock-transfer-applet/) — the document that fulfils the requisition and moves the stock; its Transfer Out knocks the requisition off (or is created from it by CREATE ST).
- [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/) — the only document the requisition can knock off (KO For › Purchase GRN).
- [Organisation](/applets/master-data/organisation-applet/) — company Knock Off Configuration, branches, document numbering.
- [Warehouse Management](/applets/inventory-workflow/warehouse-management-applet/) — the sending and receiving locations.
- [Inventory Item Maintenance](/applets/inventory-workflow/inv-item-maintenance-applet/) and [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) — the items requested.
- [Employee](/applets/master-data/employee-applet/) — employees assigned to approval designations under Branch Designation.
- [Stock Balance](/applets/inventory-workflow/stock-balance-applet/) and [Stock Availability](/applets/inventory-workflow/stock-availability-applet/) — where to check what the sending location actually holds; the requisition itself changes neither.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| The Stock Transfer applet's *Search Document › Stock Requisition* tab shows nothing although the requisition is FINAL | FINAL creates open-queue rows only for target types enabled in the company's Knock Off Configuration; the *Stock Requisition → Outbound Stock Transfer* row is missing or disabled. | Enable the row in Organisation › Company › Knock Off Configuration, then re-run the queue repair for existing documents (the watchdog / `data-fix-missing-queue` job), or use CREATE ST, which copies lines directly. |
| **KO For › Purchase GRN** lists no documents | Same mechanism on the GRN side: no *Purchase GRN → Stock Requisition* row, or the GRN lines have no open quantity left, or the search branch filter excludes them. | Enable the row; clear the branch filter; check the GRN's open quantity in the Purchase GRN applet. |
| Toast *Link Error: Target Gen Doc is not in TEMP status* or *Creation Error: Failed to create temp document* on CREATE ST | The user lacks the create / update permission for `INTERNAL_OUTBOUND_STOCK_TRANSFER`, or the TEMP transfer was already touched. | Grant the Stock Transfer create permission target for the sending location; retry. |
| Toast *The quantity to be knocked off exceeds the generic doc line quantity* on CREATE ST | Every line of the requisition has already been linked to a transfer for its full quantity (CREATE ST pressed twice, or the Stock Transfer applet already knocked it off). | Open the existing transfer via the requisition's Doc Link tab instead of creating another. |
| DRAFT or VOID fails with *GENERIC_DOCUMENT_HAS_TARGET_LINKS … OBDSTF-nnnn* | An ACTIVE link points from the requisition to a Transfer Out. | Void or discard the transfer first; then revert. |
| DRAFT button not visible | `SHOW_DRAFT_BUTTON` is off (default); the button has no permission override. | Turn the setting on under Application Settings › Gen Doc Listing Settings. |
| FINAL rejected with *The selected date falls within a locked fiscal period* | `FISCAL_PERIOD_LOCKED`: the Good Issue Date is in a `LOCK_TXN` / `LOCK_ALL` period; requisitions are not exempt (stock transfers are). | Change the date (needs `SHOW_TRANSACTION_DATE`) or reopen the period. |
| Good Issue Date cannot be changed | The picker is enabled only for users holding the seeded `SHOW_TRANSACTION_DATE` client-side permission. | Assign the permission to the role; the field then accepts a date. |
| CREATE button stays disabled with no visible error | A required Details field is empty — most often the Good Issue Date hidden by `HIDE_STOCK_REQUISITION_GOOD_ISSUE_DATE` while the TEMP document carried no date, or a location the user is not targeted for. | Unhide the field, or grant the location targets. |
| Location (Sending) / (Receiving) drop-down is empty | The user's `TNT_API_DOC_INTERNAL_STOCK_REQUISITION_READ_TGT_GUID` / `…_LOCATION_TO_READ_TGT_GUID` targets contain no location, or the selected branch has no linked locations. | Add the locations as targets in the Permission Wizard; link locations to the branch in Warehouse Management. |
| A journal-posting job fails with `NO_JOURNAL_CREATED` after every FINAL | Expected for a signum-0 document: no journal handler exists and the journal subscriber is not filtered by document type. | Ignore; nothing is missing from the ledger. |
| Approval Settings and Branch Designation are configured but nothing ever asks for an approval | This applet has no screen for submitting a requisition for approval, so the settings sit unused. Even where the loop is complete (Purchase Order, Purchase Requisition), FINAL never waits for an approval — approvals are optional and set a document to FINAL when they complete rather than blocking it. | Nothing to configure here; see [Document Approvals](/guides/document-approvals/). |
| File import job ends with *Mandatory Columns Missing* / *Wrong Columns* / *Empty CSV File* | Header names do not match the fourteen expected column names, or the file has no data rows. | Use the exact uppercase column names listed under Fields › File Import; save as CSV with the delimiter chosen on the upload screen. |
| Application Settings shows tab toggles only for Doc Link, Attachment and Export | The shared settings screen keys its tab-hide sections by applet code and lists only those three for `internalStockRequisitionApplet`. | Nothing to configure; the Details, Line and KO For sections cannot be hidden. |
| Hidden pricing fields reappear for one user | That user holds the matching seeded `SHOW_*` client-side permission, which overrides the tenant-wide `HIDE_*`. | Remove the permission from the user's role, or accept the override. |
| Remarks are cut off on the printed requisition | The printable format's remarks field is too small for long text. | Edit the uploaded printable template's remarks field width / wrap under Printable Format Settings. |
| The listing shows extra buttons (CREATE ST, PRINT, RESET) that the site does not use | Nothing hides PRINT or RESET; CREATE ST hides with `HIDE_CREATE_STOCK_TRANSFER_BUTTON`. | Hide CREATE ST via the setting; PRINT and RESET have no setting (a request to remove them is open with the product team). |

## Related documentation

- [Stock Transfer](/applets/inventory-workflow/stock-transfer-applet/) — the fulfilment document.
- [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/) — the upstream knock-off source.
- [Organisation](/applets/master-data/organisation-applet/) — Knock Off Configuration.
- [Inventory module](/modules-v2/inventory/).
