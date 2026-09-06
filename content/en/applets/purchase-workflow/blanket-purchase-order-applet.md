---
title: "Blanket Purchase Order Applet"
description: "Reference for the Blanket Purchase Order applet, used by procurement staff and finance administrators: the long-term supplier agreement whose lines are drawn down by Purchase Orders (Internal), its screens, the settings that actually exist, its fields, what FINAL and VOID do in the backend, and known failure modes."
applet_code: "blanketPurchaseOrderApplet"
applet_repo: "blg-applet-wavelet-blanket-purchase-order-applet"
modules: [purchasing]
related_applets:
  - internal-purchase-order-applet
  - blanket-purchase-order-applet-supplier-access-applet
  - internal-purchase-grn-applet
  - internal-purchase-quotation-applet
  - supplier-applet-1
  - organisation-applet
  - doc-item-maintenance-applet
  - tax-configuration-applet
  - pricebook-applet
guides: []
sources:
  configuration:
    - blg-applet-wavelet-blanket-purchase-order-applet/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet/src/app/app.routing.ts
    - blg-applet-wavelet-blanket-purchase-order-applet/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-blanket-purchase-order-applet/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-blanket-purchase-order-applet/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet/src/app/models/personal-settings.model.ts
    - blg-applet-wavelet-blanket-purchase-order-applet/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet/src/app/models/constants/applet-constants.ts
    - blg-applet-wavelet-blanket-purchase-order-applet/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-blanket-purchase-order-applet/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-blanket-purchase-order-applet/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.html
    - blg-applet-wavelet-blanket-purchase-order-applet/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet/src/app/components/blanket-purchase-order-container/blanket-purchase-order-container.component.ts
    - blg-applet-wavelet-blanket-purchase-order-applet/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet/src/app/components/blanket-purchase-order-container/blanket-purchase-order-listing/blanket-purchase-order-listing.component.ts
    - blg-applet-wavelet-blanket-purchase-order-applet/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet/src/app/components/blanket-purchase-order-container/blanket-purchase-order-listing/blanket-purchase-order-listing.component.html
    - blg-applet-wavelet-blanket-purchase-order-applet/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet/src/app/components/blanket-purchase-order-container/blanket-purchase-order-view/blanket-purchase-order-view.component.ts
    - blg-applet-wavelet-blanket-purchase-order-applet/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet/src/app/components/blanket-purchase-order-container/blanket-purchase-order-view-edit-line-item/blanket-purchase-order-view-edit-line-item.component.html
    - blg-applet-wavelet-blanket-purchase-order-applet/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet/src/app/components/blanket-purchase-order-container/blanket-purchase-order-view-add-line-item/blanket-purchase-order-view-add-line-item-main/blanket-purchase-order-view-add-line-item-main.component.ts
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
    - blg-shared-utilities/modules/settings/applet-settings-toggle/applet-settings-toggle.component.ts
    - blg-applet-wavelet-internal-purchase-order-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-order-applet/src/app/components/purchase-order-container/purchase-order-create/line-item/line-item-create/line-item-create.component.ts
    - blg-applet-wavelet-internal-purchase-order-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-order-applet/src/app/components/purchase-order-container/purchase-order-create/import-knock-off/knock-off-blanket-purchase-order/knock-off-blanket-purchase-order.component.ts
    - planning/lanes/lane-3/perm-dfn/blanketPurchaseOrderApplet.tsv
  fields:
    - blg-applet-wavelet-blanket-purchase-order-applet/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet/src/app/components/blanket-purchase-order-container/blanket-purchase-order-create/blanket-purchase-order-create.component.html
    - blg-applet-wavelet-blanket-purchase-order-applet/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet/src/app/components/blanket-purchase-order-container/blanket-purchase-order-create/blanket-purchase-order-create-main/blanket-purchase-order-create-main.component.ts
    - blg-applet-wavelet-blanket-purchase-order-applet/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet/src/app/components/blanket-purchase-order-container/blanket-purchase-order-create/blanket-purchase-order-create-main/blanket-purchase-order-create-main.component.html
    - blg-applet-wavelet-blanket-purchase-order-applet/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet/src/app/components/blanket-purchase-order-container/blanket-purchase-order-create/blanket-purchase-order-create-account/account-entity-details/account-entity-details.component.ts
    - blg-applet-wavelet-blanket-purchase-order-applet/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet/src/app/components/blanket-purchase-order-container/blanket-purchase-order-edit-line-item/blanket-purchase-order-edit-line-item-main/blanket-purchase-order-edit-line-item-main.component.ts
    - blg-applet-wavelet-blanket-purchase-order-applet/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet/src/app/components/blanket-purchase-order-container/blanket-purchase-order-edit-line-item/blanket-purchase-order-edit-line-item-main/blanket-purchase-order-edit-line-item-main.component.html
    - blg-applet-wavelet-blanket-purchase-order-applet/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet/src/app/components/blanket-purchase-order-container/blanket-purchase-order-edit-line-item-purchase-order-item/line-blanket-purchase-order-listing.component.ts
    - blg-applet-wavelet-blanket-purchase-order-applet/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet/src/app/components/blanket-purchase-order-container/blanket-purchase-order-report/blanket-purchase-order-report.component.ts
    - blg-applet-wavelet-blanket-purchase-order-applet/micro-fe/projects/wavelet-erp/applets/blanket-purchase-order-applet/src/app/services/blanket-purchase-order-pages.service.ts
  lifecycle:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalCustomInternalBlanketPurchaseOrderDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentTypeHandler.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingTypeHandler.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/inventory/InventoryTransactionLineProcessorService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/GenericDocLineOpenQueueProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/VoidKnockOffProcessor.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/BlanketPurchaseOrderReportUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/print/PrintServiceClassName.java
  troubleshooting:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - blg-applet-wavelet-internal-purchase-order-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-order-applet/src/app/components/purchase-order-container/purchase-order-create/line-item/line-item-create/line-item-create.component.ts
    - gh:bigledger/blg-applet-wavelet-blanket-purchase-order-applet#4
    - gh:bigledger/blg-wiki#39
tags:
- procurement
- purchase-agreements
- supplier-management
- contract-purchasing
- cost-control
weight: 200
aliases:
- /applets/blanket-purchase-order-applet/
---

## Overview

The **Blanket Purchase Order** applet records a long-term purchase agreement with one supplier: a validity window, the items covered and their agreed prices and quantities. It does not order anything by itself. Once the agreement is FINAL, buyers draw it down from the [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) applet, whose **KO For → Blanket Purchase Order** tab knocks quantities off the agreement's lines; the agreement's **Report** and each line's **Purchase Order** tab then show what has been drawn and what remains. Procurement staff create and finalise agreements; finance and procurement managers read the Report.

A Blanket Purchase Order carries no money movement: its backend document type (`INTERNAL_BLANKET_PURCHASE_ORDER`) has amount signum 0 and quantity signum 0, so FINAL posts no journal and moves no stock — it only makes the lines available for knock-off.

## Where it fits

| Position | Document / applet | Why |
|---|---|---|
| Module | [Purchasing](/modules/purchasing/) | Front end of the procurement chain for recurring purchases. |
| Upstream | [Supplier](/applets/master-data/supplier-applet-1/), [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/), [Pricebook](/applets/master-data/pricebook-applet/) | The agreement names one supplier entity and a set of items with agreed unit prices; pricing schemes seed the line prices. |
| Downstream | [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) | The only consumer. Its create screen's **KO For → Blanket Purchase Order** tab lists open blanket-order lines (line open queue, pair `INTERNAL_BLANKET_PURCHASE_ORDER → INTERNAL_PURCHASE_ORDER`) and copies them into the PO. |
| Downstream (drill-down) | [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/) | The backend report follows each drawn-down PO line to its GRN quantities (`BlanketPurchaseOrderReportUow`). |
| Supplier-facing copy | [Blanket Purchase Order Supplier Access](/applets/purchase-workflow/blanket-purchase-order-applet-supplier-access-applet/) | Lets a supplier's own login see the agreements raised on them. |
| Sibling | [Purchase Quotation (Internal)](/applets/purchase-workflow/internal-purchase-quotation-applet/) | The other pre-order document the PO can knock off from (`koPQ` next to `koBPO` in the PO applet). |

## Screens and menus

The sidebar has two working menus plus **Settings** and **Personalization** (`menu-items.ts`, `app.routing.ts`):

| Menu | Route | What it is |
|---|---|---|
| **Blanket Purchase Order** | `blanket-purchase-order` | The listing, with create / view / bulk actions. |
| **Report** | `blanket-purchase-order-report` | A read-only grid of agreements by date window (see *Report* below). |
| **Settings** | `settings/…` | Application Settings (`field-settings`), Default Selection, Printable Format Settings, Branch Settings, Webhook, Feature Visibility, Client Side Permission, Role Pricing Scheme Link, Permission Wizard / Permission Set / User / Team / Role Permission. |
| **Personalization** | `personalization/personal-default-selection` | Per-user Default Selection (branch, location, inline configuration). |

No menu is hidden by a setting: `app.component.ts` renders `menuItems` as-is.

### Listing

{{< figure src="/images/blanket-purchase-order-applet/main-listing.png" alt="Blanket Purchase Order listing grid with agreement rows" caption="Blanket Purchase Order listing." >}}

Columns: **BPO No, Posting Status, Company, Supplier Name, Purchaser, Amount, Updated Date, Creation Date, Transaction Date, Created By, Status** (`blanket-purchase-order-listing.component.ts`). The grid loads the user's branches for the last month by default and sorts by `updated_date` descending. **Advanced Search** narrows by supplier, branch, creation date and transaction date.

Bulk actions above the grid (`blanket-purchase-order-listing.component.html`):

| Button | What it does | Shown when |
|---|---|---|
| **FINAL** | Posts every selected DRAFT. | `HIDE_GENDOC_FINAL_BUTTON` is off, or the user holds `SHOW_GENDOC_FINAL_BUTTON` (`isShowColumn`, L849–L854). |
| **DISCARD** | Sets every selected DRAFT to DISCARDED. | Same rule with `HIDE_GENDOC_DISCARD_BUTTON` / `SHOW_GENDOC_DISCARD_BUTTON`. |
| **VOID** | Voids every selected FINAL document. | Same rule with `HIDE_GENDOC_VOID_BUTTON` / `SHOW_GENDOC_VOID_BUTTON`. |

There is no print, e-mail or export bulk action on this listing.

### Create screen

The **+** button opens **Create Blanket Purchase Order** with three tabs — **Main**, **Supplier Info**, **Line Items** (`blanket-purchase-order-create.component.html`). A **Settlement** tab and a **Department Hdr** tab exist in the template but are commented out (L38–L43), so department tags are entered on the view screen after the first save. **CREATE** is enabled only when the Main form and the supplier entity are valid.

### View screen

Opening a saved document shows **View Blanket Purchase Order** as tabs — or stacked panels when `VERTICAL_ORIENTATION` is on — in the order set under *Default Selection → Details Tab Ordering* (`blanket-purchase-order-view.component.ts` L146–L152):

| Tab | Purpose | Hidden by |
|---|---|---|
| **Main Details** | Dates, validity, status, references, purchase agent. | — |
| **Account** | The supplier entity, branch, addresses and contacts (the create screen's *Supplier Info*). | — |
| **Lines** | The agreement lines; add, edit, and per-line sub-tabs (below). | — |
| **Doc Link** | *Copied From* / *Copied To* grids of linked documents (Doc No, Branch, Server Doc Type, Status, Date). | `HIDE_DOC_LINK_TAB`; `HIDE_DOC_LINK_FROM` / `HIDE_DOC_LINK_TO` hide one grid |
| **Department Hdr** | Header segment, dimension, profit centre, project. | `HIDE_DEPARTMENT_HDR_TAB` |
| **Export** | Print with a printable format (**EXPORT AS PDF**). | `HIDE_EXPORT_TAB`; `HIDE_EXPORT_AS_PDF_BUTTON` hides the button |
| **Attachments** | Uploaded files. | `HIDE_ATTACHMENT_TAB` |

Header buttons: **SAVE**, **FINAL** (shown while the record is ACTIVE and DRAFT, L623–L626), **DISCARD** (same condition, with a confirmation dialog, L574–L580), **VOID** (shown only for FINAL documents, L590–L593; clicking it on anything else toasts *This document has not been finalized yet*), **RESET**, and **DELETE** — shown only when the master setting `SHOW_DOCUMENT_DELETE_BUTTON` is on and the document is not FINAL, VOID or DISCARDED (L226–L240, L665–L670).

Each line opens with sub-tabs **Main, Serial Number, Batch Number, Bin Number, Purchase Order, Doc Link, Department** (`blanket-purchase-order-view-edit-line-item.component.html`). The **Purchase Order** sub-tab (hidden by `HIDE_PURCHASE_ORDER_TAB`) lists the POs that drew this line down: *Purchase Order No., Item Code, Item Name, Purchase Order Qty, Delivered Qty, Open Qty, UOM, Unit Price, Status*.

### Report

{{< figure src="/images/blanket-purchase-order-applet/REPORT-BPO.png" alt="Blanket Purchase Order Report listing" caption="Report menu — agreements by company, supplier, amount, created date and status." >}}

Columns: **BPO No, Company, Supplier Name, Amount, Created Date, Created By, Status** (`blanket-purchase-order-report.component.ts` L68–L74). Filters: document number, creation-date range, transaction-date range. Clicking a row opens the agreement in the view screen (L132–L140). The backend query behind it (`BlanketPurchaseOrderReportUow`) returns, per agreement line, the linked PO quantity (`quantity_contra`), the outstanding quantity (`quantity_base − quantity_contra`) and amounts, and — for each PO line — the GRN quantities; it filters on the transaction-date window and `status != 'DELETED'` only, so DRAFT and VOID agreements appear in the report as well as FINAL ones.

A page titled **Batch No Booking** is registered in the applet's page list (`blanket-purchase-order-pages.service.ts` L105, fields Batch No, Quantity, Unit Price, amounts, tax, Packing Date, Delivery Date, Remarks) but no screen navigates to it at commit `a9d1f494`.

### Drawing down from a Purchase Order

The release step lives in the Purchase Order (Internal) applet, not here:

{{< figure src="/images/blanket-purchase-order-applet/IPO-KO-FOR-TAB.png" alt="Purchase Order (Internal) create screen with the KO For tab and the Blanket Purchase Order sub-tab" caption="Purchase Order (Internal) → Create → KO For → Blanket Purchase Order → KNOCK OFF." >}}

{{< figure src="/images/blanket-purchase-order-applet/IPO-LINES-TAB.png" alt="Purchase Order (Internal) Lines tab showing the lines imported from the blanket order" caption="The imported lines on the PO before CREATE and FINAL." >}}

1. Purchase Order (Internal) → **+** → complete **Main Details** and **Account**.
2. Open **KO For → Blanket Purchase Order**, select the agreement row(s), click **KNOCK OFF**.
3. Check **Lines**, click **CREATE**, then **FINAL** the PO from its listing.

The tab appears only when the company's document-flow configuration has the pair `INTERNAL_BLANKET_PURCHASE_ORDER → INTERNAL_PURCHASE_ORDER` enabled with `flow_type = LINE` (`line-item-create.component.ts` L120–L131, `koBPO`), and it lists rows from the line open queue for that pair (`knock-off-blanket-purchase-order.component.ts` L346–L356). Only agreements whose lines have open-queue rows — i.e. FINAL agreements — can be selected.

## Configuration

### Before you can use it

| Prerequisite | Where | Why |
|---|---|---|
| Company, branch, location | [Organisation](/applets/master-data/organisation-applet/) | Company, branch and location are required on Main (`blanket-purchase-order-create-main.component.ts` L150–L152). Branch `MAIN_LOCATION` fills the default location. |
| Supplier entity | [Supplier](/applets/master-data/supplier-applet-1/) | The Supplier Info / Account tab requires an entity (`entityId` required validator). |
| Items | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) | Every agreement line is an item; unit prices can be seeded from a pricing scheme ([Pricebook](/applets/master-data/pricebook-applet/), linkable per branch or role under *Branch Settings → Pricing Scheme* / *Role Pricing Scheme Link*). |
| Tax codes | [Tax Configuration](/applets/master-data/tax-configuration-applet/) | Optional SST/GST and WHT codes on lines. No GL mapping is needed — nothing posts. |
| Fiscal period open | [Chart of Account](/applets/master-data/chart-of-account-applet/) → fiscal years | FINAL is refused with `FISCAL_PERIOD_LOCKED` when the transaction date is in a `LOCK_ALL` / `LOCK_TXN` period (`GenericDocumentService.java` L1681–L1696) — this generic check applies although no journal is created. |
| Document-flow configuration | Company generic-document flow configuration (`bl_fi_comp_gendoc_flow_config`) | The pair `INTERNAL_BLANKET_PURCHASE_ORDER → INTERNAL_PURCHASE_ORDER`, `flow_type = LINE`, `is_enabled`, is what creates open-queue rows on FINAL (`GenericDocLineOpenQueueProcessor.java` L65–L70) and what shows the PO applet's Blanket Purchase Order knock-off tab. Without it, FINAL succeeds but nothing can draw the agreement down. |
| Permissions | This applet → Settings → Permission Wizard / Client Side Permission | Server-side create / read / update / delete on the document; client-side switches below. |

### Applet settings

Settings live in four places (`app.routing.ts`): **Default Selection** and **Branch Settings** are applet-local components; **Application Settings** (`field-settings`) is the *shared* `FieldConfigurationComponent` from `blg-shared-utilities`; and the **inline gear** (`app-applet-settings-toggle`) is embedded in 15 of this applet's screens, each passing its own `appletSettingsKeys` list. The shared screen has **no section gated for this applet's code** (`field-configuration.component.ts` never mentions `blanketPurchaseOrderApplet`), so it shows only its ungated sections; the gear is therefore the only place several keys can be switched. The gear appears when `ENABLE_INLINE_APPLET_CONFIG` is on — either tenant-wide (first toggle on the Application Settings screen) or per user (*Personalization → Default Selection → Enable Inline Configuration*); Owners and Admins can save through it to the tenant-wide master settings or to their personal overlay, other users to their personal overlay only (`applet-settings-toggle.component.ts` L92–L99, L133, L250–L275). Anyone with access to the Settings menu can change the master settings.

Every key below passes four checks — declared in `applet-settings.model.ts`, rendered as a control (shared screen, applet-local screen or gear), saved, and read by the applet's code. Keys that fail one are listed separately at the end.

**Settings → Default Selection** (`default-selection`):

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| `DEFAULT_BRANCH` | Branch pre-selected on new agreements; choosing it also stores `DEFAULT_COMPANY` and `DEFAULT_LOCATION` (branch `MAIN_LOCATION`). | Empty — patched from the saved value, `null` when nothing was saved. | New agreements open with these values; a personal default overrides them. |
| `DEFAULT_LOCATION` | Location pre-selected on new agreements. | Empty. | As above. |
| `DEFAULT_TOGGLE_COLUMN` | `SINGLE` or `DOUBLE` column layout of the create / view forms. | Empty (single). | Two-column layout. |
| `DEFAULT_ORIENTATION` | `HORIZONTAL` (tabs) or `VERTICAL` (stacked panels) for the view screen. | Empty (tabs). | Panels; the `EXPAND_*` keys below decide which open. |
| `BLANKET_PURCHASE_ORDER_DETAILS_TAB_ORDER` | Drag-and-drop order of the view tabs (Main, Account, Lines, Doc Link, Department Hdr, Export, Attachments). | Code order. | Tabs re-order for everyone. |

**Settings → Application Settings** (shared screen, ungated sections) and the **inline gear**. Every toggle starts *off* (the form is built empty and patched from saved values). Where a key has a control only in the gear, the *Control* column says so.

| Setting | What it controls | Default | Control | Effect when changed |
|---|---|---|---|---|
| `DEFAULT_TRANSACTION_DATE` | The transaction-date window the listing loads on open. | Unset → last month to today (`blanket-purchase-order-listing.component.ts` L155). | Shared | `1_month`, `1_week`, `1_day` set the window explicitly (`blanket-purchase-order-container.component.ts` L150–L166). |
| `SORT_ORDER` | Listing sort column. | Unset → `updated_date` (L414–L420). | Shared | Sorts by the chosen column, descending. |
| `DISABLE_GEN_DOC_LISTING` | Stops the listing auto-loading. | Off. | Shared, gear | Users must search first. |
| `HIDE_GENDOC_FINAL_BUTTON`, `HIDE_GENDOC_DISCARD_BUTTON`, `HIDE_GENDOC_VOID_BUTTON`, `HIDE_GENDOC_SAVE_BUTTON` | Remove FINAL / DISCARD / VOID / SAVE from the listing and view screens. | Off. | Shared, gear | Hidden for everyone; the matching `SHOW_GENDOC_*_BUTTON` client-side permission reopens the button on the listing (`isShowColumn`) and the view. |
| `HIDE_EXPORT_AS_PDF_BUTTON` | Remove EXPORT AS PDF from the Export tab. | Off. | Shared, gear | Button hidden. |
| `HIDE_SERVER_DOC_1`, `HIDE_SERVER_DOC_2`, `HIDE_SERVER_DOC_3` | Hide the tenant / company / branch document numbers. | Off. | Shared, gear | Hidden unless the user holds `SHOW_DOC_NO_*`. |
| `HIDE_TRANSACTION_DATE`, `HIDE_CREATED_DATE`, `HIDE_UPDATED_DATE` | Hide the date columns on the listing. | Off. | Shared, gear | Column removed (`SHOW_TRANSACTION_DATE` reopens the first). |
| `HIDE_CLIENT_DOC_TYPE` | Hide the client document type. | Off. | Shared, gear | Field hidden. |
| `HIDE_AMOUNT_MAIN_LISTING`, `HIDE_LISTING_BRANCH` | Hide the Amount / Branch listing columns. | Off. | Gear only | Column removed. |
| `HIDE_LOCATION`, `HIDE_PURCHASER`, `HIDE_REMARKS`, `HIDE_REFERENCE` | Hide the named Main field. | Off. | `HIDE_LOCATION` shared + gear; the other three gear only | Field removed. |
| `HIDE_ENTITY_DETAILS_TYPE`, `HIDE_ENTITY_DETAILS_EMAIL`, `HIDE_ENTITY_DETAILS_PHONE_NUMBER` | Hide supplier type / e-mail / phone on the Account tab. | Off. | Shared, gear | Field removed. |
| `HIDE_BILL_TO_TAB`, `HIDE_SHIP_FROM_TAB`, `HIDE_INTERCOMPANY_TAB` | Hide Account sub-tabs. | Off. | Shared, gear | Sub-tab removed. |
| `HIDE_DOC_LINK_TAB`, `HIDE_DOC_LINK_FROM`, `HIDE_DOC_LINK_TO`, `HIDE_DEPARTMENT_HDR_TAB`, `HIDE_EXPORT_TAB`, `HIDE_ATTACHMENT_TAB` | Remove view tabs or one Doc Link grid. | Off. | `HIDE_ATTACHMENT_TAB` shared + gear; the rest gear only | Tab / grid removed. |
| `HIDE_PURCHASE_ORDER_TAB` | Remove the line-level Purchase Order sub-tab. | Off. | Gear only | Draw-down history per line no longer visible. |
| `VERTICAL_ORIENTATION` | Stacked panels instead of tabs on the view screen. | Off. | Shared | Panels; `EXPAND_MAIN_DETAILS`, `EXPAND_ACCOUNT`, `EXPAND_LINE_ITEMS`, `EXPAND_DOC_LINK`, `EXPAND_DEPARTMENT_HDR`, `EXPAND_EXPORT`, `EXPAND_ATTACHMENT` open the named panel by default (L146–L152). |
| `HIDE_QTY_BASE`, `HIDE_QTY_UOM`, `HIDE_UOM_TO_BASE_RATIO` | Quantity columns on lines. | Off. | Shared, gear | Hidden unless the matching `SHOW_QTY_*` permission is held. |
| `HIDE_UNIT_PRICE_STD_PRICING_SCHEME`, `HIDE_UNIT_PRICE_STD_INCL_TAX`, `HIDE_UNIT_PRICE_STD_EXCL_TAX`, `HIDE_UNIT_PRICE_STD_UOM_INCL_TAX`, `HIDE_UNIT_PRICE_STD_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_NET_EXCL_TAX`, `HIDE_UNIT_PRICE_NET_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_TXN`, `HIDE_UNIT_PRICE_TXN_UOM_INCL_TAX`, `HIDE_LAST_PURCHASE_PRICE` | Unit-price columns on lines. | Off. | Shared, gear | Hidden unless the matching `SHOW_UNIT_PRICE_*` / `SHOW_LAST_PURCHASE_PRICE` permission is held. |
| `HIDE_UNIT_DISCOUNT`, `HIDE_UNIT_DISCOUNT_UOM_EXCL_TAX`, `HIDE_DISCOUNT_AMOUNT_EXCL_TAX`, `HIDE_AMOUNT_STD_EXCL_TAX`, `HIDE_AMOUNT_NET_EXCL_TAX`, `HIDE_AMOUNT_TXN` | Discount and amount columns on lines. | Off. | Shared, gear | As above, with `SHOW_UNIT_DISCOUNT*` / `SHOW_AMOUNT_*`. |
| `HIDE_LINE_ITEM_LISTING_TXN_AMOUNT`, `HIDE_LINE_ITEM_LISTING_UOM` | Hide the transaction amount / UOM columns in the Lines grid. | Off. | Gear only | Column removed. |
| `HIDE_TAX_CONFIG_SELECTION`, `HIDE_WHT_CONFIG_SELECTION` | Tax and WHT selectors on lines. | Off. | Shared, gear | Hidden unless `SHOW_TAX_CONFIG_SELECTION` / `SHOW_WHT_CONFIG_SELECTION` is held. |
| `HIDE_BATCH_NUMBER`, `HIDE_BIN_NUMBER`, `HIDE_SERIAL_NUMBER` | Line sub-tabs for batch, bin and serial numbers. | Off. | Shared, gear | Sub-tab removed. |
| `HIDE_SEGMENT`, `HIDE_DIMENSION`, `HIDE_PROFIT_CENTER`, `HIDE_PROJECT`; `MANDATORY_SEGMENT`, `MANDATORY_DIMENSION`, `MANDATORY_PROFIT_CENTER`, `MANDATORY_PROJECT` | Hide or require each accounting dimension. | Off. | `HIDE_*` shared + gear; `MANDATORY_*` shared | Hidden, or required at save. |

**Read at runtime without a model declaration** (rendered and read, but absent from `applet-settings.model.ts`):

| Setting | What it controls | Default |
|---|---|---|
| `ENABLE_INLINE_APPLET_CONFIG` | Show the in-page gear icon. | Off — opt-in (`applet-settings-toggle.component.ts` L92–L99). |
| `SHOW_DOCUMENT_DELETE_BUTTON` | Show the DELETE button on the view screen for non-FINAL documents. | Off (`blanket-purchase-order-view.component.ts` L226–L240; read from the applet's `APPLET_SETTINGS` ext, i.e. the same master settings store). |
| `HIDE_TRACKING_ID`, `HIDE_PERMIT_NO` | Hide the tracking ID / permit number fields. | Off. |

**Read but with no control anywhere:** `ENABLE_FILTER_BY_TODAYS_TXN` (declared and read, never rendered). `PRINTABLE` is written by *Printable Format Settings* when a format is marked default and read by the Export tab.

**Declared but never read** (present in the model only — not documented as settings): `ENABLE_CUSTOM_STATUS_1..5`, `ENABLE_CUSTOM_STATUS_HDR_1..5`, `ENABLE_CUSTOM_STATUS_LINE_1..5`, `LIST_CUSTOM_STATUS_*`, `NAME_CUSTOM_STATUS_*`, `ENABLE_SEGMENT` / `ENABLE_DIMENSION` / `ENABLE_PROFIT_CENTER` / `ENABLE_PROJECT`, `ENABLE_SST`, `ENABLE_WHT`, `SUBJECT_GUID`, `HIDE_ACCOUNT_BILLING_CONTACT`, `HIDE_ACCOUNT_SHIPPING_CONTACT`, `HIDE_PRINT_BUTTON`, `HIDE_SEND_EMAIL_BUTTON`, `EXPAND_DELIVERY_DETAILS`, `EXPAND_DELIVERY_TRIPS`, `EXPAND_KO_FOR`, `EXPAND_MAIN_ARAP`, `EXPAND_MAIN_CONTRA`, `EXPAND_POSTING`, `EXPAND_SETTLEMENT`, `EXPAND_TRACE_DOCUMENT`. Several have a toggle on the shared screen; switching it changes nothing in this applet (there is no print, e-mail, ARAP, contra, settlement or trace-document screen here).

### Document behaviour settings

| Behaviour | Where it is set | Notes |
|---|---|---|
| Posting status on create | No control — new agreements are DRAFT. | |
| Validity dates | Main tab: **Start Date** + **Validity in Day(s)** compute **Valid Date** (`blanket-purchase-order-create-main.component.ts` L244–L258); stored as document ext parameters `VALIDITY_DATE_START`, `VALIDITY_DATE_END`, `VALIDITY`. | The dates are recorded and reported; no exposed control found that blocks knock-off after the valid date (PO knock-off, `knock-off-blanket-purchase-order.component.ts` L346–L356, filters on open-queue rows only). |
| Spending or quantity cap | No exposed control found (create/view forms and settings checked at commit `a9d1f494`). | The only limit is the line quantity: the open queue records what remains after each PO knock-off. |
| Printable formats | *Settings → Printable Format Settings*; the backend print service is `BLANKET_PURCHASE_ORDER_JASPER_PRINT_SERVICE` (`PrintServiceClassName.java` L15). *Branch Settings → Printable Format* overrides per branch. | Used by the Export tab's EXPORT AS PDF. |
| Approval workflow | No exposed control found (routes and settings components checked at commit `a9d1f494`). | |
| Webhooks | *Settings → Webhook* (shared component). | Fires on document events. |

### Branch settings

*Settings → Branch Settings* — pick a branch on the left. Sub-tabs: **Branch Details** (read-only name, code, company; the **Sales Agent** picker, **Rounding Five Cent** with a rounding item, **Group Discount Item**), **Default Settlement Method**, **Item Category Filter**, **Menu List**, **Pricing Scheme**, **Printable Format**. The Sales Agent control writes the branch's `default_sales_entity_hdr_guid`; the create screen's **Purchase Agent** field is not pre-filled from it.

### Feature visibility / permissions

**Server-side.** Every API call on the document is gated by `TNT_API_DOC_INTERNAL_CUSTOM_INTERNAL_BLANKET_PURCHASE_ORDER_{CREATE,READ,UPDATE,DELETE}_TGT_GUID` (`GenericDocumentTypeHandler.java` L542–L550), each assignable with a target of type **Company, Branch, Location or Entity** through *Permission Wizard* or *Permission Set* (registry extract: `planning/lanes/lane-3/perm-dfn/blanketPurchaseOrderApplet.tsv`).

**Client-side** permissions seeded for this applet in the registry (`bl_applet_client_side_perm_dfn`, assign under *Settings → Client Side Permission*):

| Permission code | Effect |
|---|---|
| `SHOW_TRANSACTION_DATE` | Show the transaction date even when `HIDE_TRANSACTION_DATE` is on. |
| `HIDE_PRICE` | Hides the standard unit price (excl. and incl. tax) and unit discount fields on the view screen's add-line form for the holder (`blanket-purchase-order-view-add-line-item-main.component.ts` L214–L222). |
| `BLANKET_PURCHASE_ORDER_DISPLAY_PRICING` | Seeded, but not checked anywhere in the applet code at commit `a9d1f494`. |

The applet code also checks `SHOW_DOC_NO_TENANT` / `SHOW_DOC_NO_COMPANY` / `SHOW_DOC_NO_BRANCH`, `SHOW_GENDOC_FINAL_BUTTON` / `SHOW_GENDOC_DISCARD_BUTTON` / `SHOW_GENDOC_VOID_BUTTON` / `SHOW_GENDOC_SAVE_BUTTON`, `SHOW_QTY_*`, `SHOW_UNIT_PRICE_*`, `SHOW_UNIT_DISCOUNT*`, `SHOW_DISCOUNT_AMOUNT_EXCL_TAX`, `SHOW_AMOUNT_*`, `SHOW_LAST_PURCHASE_PRICE`, `SHOW_UOM_TO_BASE_RATIO`, `SHOW_TAX_CONFIG_SELECTION` and `SHOW_WHT_CONFIG_SELECTION` — each reopens a column or button that the matching `HIDE_*` setting removed. None of these is seeded for this applet; create them under *Client Side Permission* before assigning.

*Settings → Feature Visibility* (shared) can hide menus per team.

## Fields

### Main (create) / Main Details (view)

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Document type | Fixed: Blanket Purchase Order. | System | |
| Doc No (Tenant / Company / Branch) | Running numbers. | System | Generated when the document goes FINAL; shown per `SHOW_DOC_NO_*`. |
| Company, Branch, Location | Owning company, branch and location. | Yes | Defaults from Default Selection / personal defaults. |
| Start Date | First day of the agreement. | Yes | Stored as ext `VALIDITY_DATE_START`; on an existing document it falls back to the transaction date (L221). |
| Validity in Day(s) | Length of the agreement. | Yes | Changing it, or the start date, recomputes Valid Date (L244–L258). |
| Valid Date | Last day of the agreement. | Yes | Auto-computed; ext `VALIDITY_DATE_END`. |
| Status | `ACTIVE` / `INACTIVE`. | Yes | Default `ACTIVE`. FINAL and DISCARD buttons appear only while ACTIVE. |
| Reference No. | Free text. | No | |
| Purchase Agent | Employee responsible (entity picker). | No | Not pre-filled from Branch Settings. |
| Remarks | Free text. | No | |

### Supplier Info (create) / Account (view)

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Entity (Supplier) | The supplier the agreement is with. | Yes | `entityId` required validator; a new supplier can be created inline (name, type, AR/AP type and currency required). |
| Entity branch, contacts, Bill To / Ship From addresses | Supplier branch, contact person, addresses. | No | Contact creation requires a contact name; addresses require type, city, state, country and postal code. |

### Lines

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Item Code / Item Name | The item covered. | Yes | |
| Quantity Base, Quantity by UOM, UOM to Base Ratio | Agreed quantity — this is what the PO knock-off draws down. | Quantity yes | |
| Unit Price STD (excl. / incl. tax), by UOM | Agreed unit price. | No | Editable per line; seeded from the pricing scheme. Hidden for holders of `HIDE_PRICE`. |
| Unit Discount, Discount Amount | Line discount. | No | |
| Unit Price Net, STD Amount, Amount Net | Derived amounts. | `netAmt`, `netAmtWithTax`, `txnAmt` required | |
| SST/GST code, %, amount; WHT code, %, amount | Tax lines. | No | |
| Remarks | Line text. | No | |
| Serial / Batch / Bin sub-tabs | Stock references. | No | Batch requires batch number, issue and expiry date, quantity; bin requires bin code, container measure and quantity. |
| Department sub-tab | Segment, dimension, profit centre, project. | Per `MANDATORY_*` | Header values default. |

## Lifecycle and effects

| Status | Meaning | Allowed next |
|---|---|---|
| **DRAFT** | Editable. Lines not yet available for knock-off. | FINAL, DISCARDED |
| **FINAL** | Locked. Lines have open-queue rows that Purchase Orders can draw down. | VOID |
| **VOID** | Reversed. Reason stored in `void_reason`. | none |
| **DISCARDED** | Abandoned draft. | none |

**Backend checks on FINAL** (`GenericDocumentService.java`): the document must not already be FINAL (HTTP 403 *Generic Document has already been posted to FINAL*, L361–L364), and the transaction date must not fall in a `LOCK_ALL` / `LOCK_TXN` fiscal period (`FISCAL_PERIOD_LOCKED`, L1681–L1696). The applet's own DISCARD dialog and the VOID toast are client-side.

**What FINAL does:** applies `date_txn_logic` (L371–L385), generates the running numbers (L638), and queues the Generic Document Primary Processor (L644) and the message-template queue (L653). The line-open-queue processor then reads the company's document-flow configuration and, for the enabled pair `INTERNAL_BLANKET_PURCHASE_ORDER → INTERNAL_PURCHASE_ORDER`, writes one open-queue row per line (`GenericDocLineOpenQueueProcessor.java` L65–L70). Those rows are what the PO applet's knock-off tab lists and decrements.

**Posting proof block**

| Item | Value | Source |
|---|---|---|
| Server document type | `INTERNAL_BLANKET_PURCHASE_ORDER` | `InternalCustomInternalBlanketPurchaseOrderDataConsistencyObject.java` L16 |
| Amount signum | **0** (checked on create and update) | same, L18, L24–L36 |
| Quantity signum | **0** (filled on every line) | same, L19, L41–L46 |
| Dr/Cr equation | None. `JournalPostingService` builds a journal line only when `amount_signum ≠ 0` (L99), so no line qualifies and no journal is created. | `JournalPostingService.java` L99 |
| Handler | No entry in `JournalPostingTypeHandler` for this type; the fallback `contains("PURCHASE")` handler would select `CREDITOR` / `PURCHASE` / `INPUT_TAX`, but no line reaches it. | `JournalPostingTypeHandler.java` L53–L60; `JournalPostingService.java` L76–L84 |
| GL precedence | Not applicable — no GL line is built; no default GL mapping is required for FINAL. | — |
| Hard stops in posting | None from posting. `FISCAL_PERIOD_LOCKED` and the already-FINAL check are the only backend refusals. | `GenericDocumentService.java` L361–L364, L1681–L1696 |
| Stock processor | None. `InventoryTransactionLineProcessorService` skips every line whose quantity signum is 0 (L39–L40, L74–L75). | `InventoryTransactionLineProcessorService.java` |
| Open queue | One row per line for each enabled flow pair whose `server_doc_type_1` is this type; the PO knock-off decrements `quantity_contra` on the row. | `GenericDocLineOpenQueueProcessor.java` L65–L70, L100–L182 |
| What VOID reverses | `updatePostingStatusToNonFinal` (L662–L710) sets `VOID` and the reason and queues `BLG_ERP_VOID_GENERIC_DOCUMENT_PRIMARY_PROCESSOR` (L698–L699). Among the subscribed processors, `VOID_KNOCK_OFF_PROCESSOR` marks the document's open-queue knock-offs DELETED (`VoidKnockOffProcessor.java`, `updateKO(genDoc, DELETED)`), so the lines can no longer be drawn down. There is no journal to reverse. | `GenericDocumentService.java`, `VoidKnockOffProcessor.java` |
| Back to DRAFT | Not offered by this applet's UI; the backend path (`BLG_ERP_UNDO_GENERIC_DOCUMENT_PRIMARY_PROCESSOR`, L702–L704) exists for other callers. | `GenericDocumentService.java` |

Voiding an agreement does not touch the Purchase Orders already created from it; they keep their lines and their document links.

## Related applets

- [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) — the only document that draws the agreement down (KO For → Blanket Purchase Order).
- [Blanket Purchase Order Supplier Access](/applets/purchase-workflow/blanket-purchase-order-applet-supplier-access-applet/) — the supplier-facing view of the same documents.
- [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/) — the backend report follows PO lines to GRN quantities.
- [Purchase Quotation (Internal)](/applets/purchase-workflow/internal-purchase-quotation-applet/) — the other pre-order document the PO can knock off.
- [Supplier](/applets/master-data/supplier-applet-1/), [Organisation](/applets/master-data/organisation-applet/), [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/), [Tax Configuration](/applets/master-data/tax-configuration-applet/), [Pricebook](/applets/master-data/pricebook-applet/) — master data it depends on.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| The **Blanket Purchase Order** tab is missing under **KO For** in Purchase Order (Internal) | The company's document-flow configuration has no enabled `INTERNAL_BLANKET_PURCHASE_ORDER → INTERNAL_PURCHASE_ORDER` pair with `flow_type = LINE` (`koBPO`, `line-item-create.component.ts` L120–L131). | Enable the pair in the company document-flow configuration; the tab appears on the next load. |
| The agreement is FINAL but does not appear in the knock-off list | No open-queue rows were written for it: the flow pair was enabled *after* the agreement went FINAL, or the lines have been fully drawn down (`quantity_contra` = quantity). | Void and re-create the agreement after enabling the pair, or check the line's Purchase Order sub-tab for remaining Open Qty. |
| **KNOCK OFF** imports nothing | The selected agreement lines have no open quantity, or the PO's supplier / branch differ from the agreement's (the multi-PO knock-off keeps only rows with the same supplier and branch as the first selected document). | Pick an agreement for the same supplier and branch with open lines. |
| FINAL refused with *The selected date falls within a locked fiscal period* | Transaction date in a `LOCK_ALL` / `LOCK_TXN` period — the check applies even though nothing posts. | Change the date or reopen the period. |
| *Generic Document has already been posted to FINAL* | Two users (or bulk FINAL plus the view screen) finalised the same draft. | Refresh; no action needed. |
| VOID toasts *This document has not been finalized yet* | The view screen's VOID runs only on FINAL documents. | Use DISCARD for a draft. |
| FINAL / DISCARD / VOID button missing for one user only | `HIDE_GENDOC_*_BUTTON` is on and the user lacks the `SHOW_GENDOC_*_BUTTON` permission (not seeded). | Create the permission under Client Side Permission and assign it, or turn the setting off. |
| A setting toggle in Application Settings does nothing | It is one of the keys listed under *Declared but never read*. | No fix needed; it has no effect in this applet. |
| A `HIDE_*` toggle you need is not on the Application Settings screen | It is gear-only for this applet (see the *Control* column). | Turn on `ENABLE_INLINE_APPLET_CONFIG`, open the gear on the relevant screen, and save it there. |
| The Report shows VOID or DRAFT agreements | The report query filters on date window and `status != 'DELETED'` only, not on posting status. | Read the Status column, or use the listing's Advanced Search for a posting-status filter. |
| Unit-price fields are missing on the add-line form for one user | The user holds the `HIDE_PRICE` client-side permission. | Remove the permission if the user should see prices. |
| DELETE button missing on a draft | `SHOW_DOCUMENT_DELETE_BUTTON` is off, or the document is FINAL / VOID / DISCARDED. | Turn the setting on; use DISCARD or VOID for posted documents. |

## Related documentation

- [Purchasing module](/modules/purchasing/) and its [related applets](/modules/purchasing/related-applets/)
- [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) — the knock-off side of the release step
