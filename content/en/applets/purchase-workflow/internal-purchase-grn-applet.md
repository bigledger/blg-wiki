---
title: "Purchase GRN (Internal)"
description: "Reference for the Purchase GRN (Internal) applet: the goods-received record that knocks off purchase orders and feeds the purchase invoice, its menus, every configuration switch, fields, lifecycle (no stock or GL posting) and known failure modes."
applet_code: "internalPurchaseGRNApplet"
applet_repo: "blg-applet-wavelet-internal-purchase-grn-applet"
modules: [purchasing, inventory]
related_applets:
  - internal-purchase-order-applet
  - internal-purchase-invoice-applet
  - internal-purchase-invoice-no-stock-in-applet
  - internal-purchase-grn-stock-in-applet
  - internal-purchase-grn-supplier-access-applet
  - supplier-delivery-order-applet
  - internal-purchase-return-applet
  - internal-purchase-gin-applet
  - internal-sales-invoice-applet
  - internal-outbound-delivery-order-applet
  - stock-availability-applet
  - purchase-report-applet
  - supplier-applet-1
  - organisation-applet
  - doc-item-maintenance-applet
  - inv-item-maintenance-applet
  - tax-configuration-applet
  - pricebook-applet
guides:
  - /guides/purchasing-guides/standard-procurement-workflow/
  - /guides/purchasing-guides/direct-grn-workflow/
sources:
  - blg-applet-wavelet-internal-purchase-grn-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-applet/src/app/models/menu-items.ts
  - blg-applet-wavelet-internal-purchase-grn-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-applet/src/app/app.routing.ts
  - blg-applet-wavelet-internal-purchase-grn-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-applet/src/app/app.component.ts
  - blg-applet-wavelet-internal-purchase-grn-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-applet/src/app/models/constants/applet-constants.ts
  - blg-applet-wavelet-internal-purchase-grn-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-applet/src/app/models/applet-settings.model.ts
  - blg-applet-wavelet-internal-purchase-grn-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
  - blg-applet-wavelet-internal-purchase-grn-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-applet/src/app/components/settings-container/custom-status/custom-status-settings/custom-status-settings.component.ts
  - blg-applet-wavelet-internal-purchase-grn-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-applet/src/app/components/settings-container/branch-settings/branch/branch.component.html
  - blg-applet-wavelet-internal-purchase-grn-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-applet/src/app/components/internal-purchase-grn-container/internal-purchase-grn-edit/internal-purchase-grn-edit.component.ts
  - blg-applet-wavelet-internal-purchase-grn-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-applet/src/app/components/internal-purchase-grn-container/internal-purchase-grn-edit/internal-purchase-grn-line-items-inline-v2.component.ts
  - blg-applet-wavelet-internal-purchase-grn-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-applet/src/app/components/internal-purchase-grn-container/internal-purchase-grn-edit/search-documents/
  - blg-applet-wavelet-internal-purchase-grn-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-applet/src/app/components/internal-purchase-grn-container/internal-purchase-grn-create/main-details/main-details.component.ts
  - blg-applet-wavelet-internal-purchase-grn-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-applet/src/app/components/internal-purchase-grn-container/internal-purchase-grn-create/import-knock-off/knock-off-purchase-order/knock-off-purchase-order.component.ts
  - blg-applet-wavelet-internal-purchase-grn-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-applet/src/app/components/internal-purchase-grn-container/internal-purchase-grn-create/import/import.component.ts
  - blg-applet-wavelet-internal-purchase-grn-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-applet/src/app/components/internal-purchase-grn-container/internal-purchase-grn-create/search/search-by-intercompany-sales-invoice/
  - blg-applet-wavelet-internal-purchase-grn-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-applet/src/app/components/internal-purchase-grn-container/internal-purchase-grn-listing/internal-purchase-grn-listing.component.ts
  - blg-applet-wavelet-internal-purchase-grn-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-applet/src/app/components/purchase-grn-file-export/
  - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalPurchaseGoodReceivedNoteDataConsistencyObject.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalPurchaseGrnStockInDataConsistencyObject.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalPurchaseInvoiceDataConsistencyObject.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalPurchaseInvoiceNoStockInDataConsistencyObject.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/inventory/InventoryTransactionLineProcessorService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingTypeHandler.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentTypeHandler.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/genericDocument/GenericDocumentLineOpenQueueService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/factory/GenericDocumentConverterFactory.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/genericDocument/genericDocumentConverter/PurchaseGRNToPurchaseInvoiceConverter.java
  - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/GenericDocumentOpenAutoConvertQueueProcessor.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/stock/StockAvailabilityService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/stock/StockAvailabilityUow.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/intercompany/IntercompanyProcessingService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/pmtStmt/IpoXdoIgrnProcessorService.java
  - akaun_master.bl_applet_client_side_perm_dfn (applet code internalPurchaseGRNApplet)
tags:
  - internal-purchase
  - grn-management
  - goods-receipt
  - inventory-control
  - supplier-verification
  - purchase-workflow
weight: 160
lastmod: 2026-09-05
---

## Overview

The **Purchase GRN (Internal)** applet records that goods from a supplier have physically arrived: which items, how many, at which branch and location, against which purchase order, with serial, batch and bin details where the item needs them. Warehouse staff create it when a delivery lands (by hand, by knocking off a finalised purchase order, or by copying a previous GRN); accounts payable then knocks the GRN off with a purchase invoice.

Its engine document type is `INTERNAL_PURCHASE_GOODS_RECEIVED_NOTE` with amount signum **0** and quantity signum **0**. A standard GRN therefore posts **nothing** to stock and **nothing** to the General Ledger; FINAL locks it and opens its lines in the open-queue so the purchase invoice can knock them off. The stock movement and the supplier liability are booked by the [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/) (quantity signum +1, amount signum −1). Tenants that need stock to move at the moment of receipt use the separate [Purchase GRN Stock In (Internal)](/applets/purchase-workflow/internal-purchase-grn-stock-in-applet/) applet instead — see *Lifecycle and posting*.

A short introduction to the applet:

{{< youtube yeurWHR4BpM >}}

## Where it fits

| Position | Document / applet | Why |
|---|---|---|
| Module | [Purchasing](/modules/purchasing/), [Inventory](/modules/inventory/) | Receiving document; its open lines appear in stock availability as "GRN not yet invoiced". |
| Upstream | [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) | **KO For → Purchase Order** (create), **Search Purchase Order** and the **Import** tab (edit) pull open PO lines; the PO applet's *PO Line with GRN KO* report shows ordered versus received. |
| Upstream | [Supplier Delivery Order](/applets/purchase-workflow/supplier-delivery-order-applet/) | The B2B queue (`bl_b2b_ipo_xdo_igrn_queue`) matches a supplier's delivery order to the buyer's PO and GRN. |
| Upstream (copy) | Another Purchase GRN | **Search Purchase GRN** clones the lines of a finalised GRN into a new draft. |
| Intercompany | [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [Outbound Delivery Order](/applets/sales-workflow/internal-outbound-delivery-order-applet/) | Intercompany processing pairs `INTERNAL_SALES_INVOICE` → GRN and `INTERNAL_OUTBOUND_DELIVERY_ORDER` → GRN between two companies of the tenant (signums 0 / 0); the **Search By Intercompany Sales Invoices** tab is the manual confirmation screen. |
| Downstream | [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/) | The invoice knocks off GRN lines (*KO For → Purchase GRN*) or is generated by the GRN-to-invoice converter; it books stock in and the creditor. |
| Downstream | [Purchase Return (Internal)](/applets/purchase-workflow/internal-purchase-return-applet/) | The backend registers the GRN as a previous document for purchase returns. |
| Reporting | [Stock Availability](/applets/inventory-workflow/stock-availability-applet/), [Purchase Report](/applets/purchase-workflow/purchase-report-applet/) | Open GRN → invoice queue rows and DRAFT GRN lines are separate columns in stock availability; purchase analysis joins PO, GRN and invoice. |
| External | [Purchase GRN Supplier Access (Internal)](/applets/purchase-workflow/internal-purchase-grn-supplier-access-applet/) | Supplier-facing view of the same document type. |
| Sibling | [Purchase GRN Stock In (Internal)](/applets/purchase-workflow/internal-purchase-grn-stock-in-applet/), [Purchase GIN (Internal)](/applets/purchase-workflow/internal-purchase-gin-applet/) | The stock-moving receipt and its reversal. |

## Screens and menus

| Menu | Route | What it is | Hidden by |
|---|---|---|---|
| **Internal Purchase GRN** | `internal-purchase-grn` | Listing, create, edit. | — |
| **Line Items** | `line-items` | Cross-document line grid (item details, serial, batch, bin, costing, pricing, issue link). | `HIDE_LINE_ITEMS_MENU` unless `SHOW_LINE_ITEMS_MENU` |
| **File Export** | `file-export` | Generate a CSV for a transaction-date range; listing shows Report Name, Doc Type, Status, Error Message. | `HIDE_FILE_EXPORT_MENU` unless `SHOW_FILE_EXPORT_MENU` |
| **Audit Trail** | `audit-trail` | Change log. | `HIDE_AUDIT_TRAIL_MENU` |
| **Settings** | `settings/…` | Application Settings, Default Selection, Printable Format Settings, Branch Settings, Custom Status, Custom Resource Bundle Configuration, Custom Field Placement, Spreadsheet View configuration; also Webhook, Feature Visibility, Client Side Permission, Role Pricing Scheme Link, Permission Wizard / Set / User / Team / Role Permission, Release Notes, Applet Log. | — |
| **Personalization** | `personalization/personal-default-selection` | Per-user Default Selection (merged over the tenant defaults). | — |

There is no File Import menu, no approval menu and no intercompany queue menu in this applet.

### Listing

{{< figure src="/images/internal-purchase-grn-applet/main-listing.png" alt="Purchase GRN (Internal) main listing with status tabs and document summary" caption="GRN listing: filtered by the default posting status and transaction-date window; Advanced Search for everything else." >}}

Filters by `DEFAULT_POSTING_STATUS`, `DEFAULT_STATUS` and `DEFAULT_TRANSACTION_DATE`; the quick search runs over `server_doc_1` and the client document numbers unless `FUZZY_SEARCH_COLUMNS` lists other columns. Bulk actions: **FINAL**, **DISCARD**, **VOID** and **bulk print** with a printable-format picker (`PRINTABLE`). `ENABLE_AUTO_POPUP` opens the PDF after FINAL (triggered from the FINAL-success effect since 2026). `ENABLE_UNSAVED_ITEM_RECOVERY` recovers lines typed into a form that was left without saving.

### Create screen

{{< figure src="/images/internal-purchase-grn-applet/create-edit-form.png" alt="Purchase GRN (Internal) create form with header details and line item search" caption="Create form: Main Details, Account, Lines, KO For, Delivery Details, Payment, Department Hdr." >}}

Tabs: **Main Details**, **Account**, **Lines**, **KO For** (Purchase Order only; hidden by `HIDE_KO_FOR_TAB`; `ENABLE_MULTIPLE_KO` lets one GRN line knock off several PO lines), **Delivery Details** (`HIDE_DELIVERY_DETAILS_TAB`), **Payment** (`HIDE_MAIN_PAYMENT_TAB`), **Department Hdr** (`HIDE_DEPARTMENT_HDR_TAB`), **Import** (pick ACTIVE purchase orders and their lines from a document grid) and, for users holding `SHOW_INTERCOMPANY_PGRN_SCREEN`, **Search By Intercompany Sales Invoices** with a *Confirm Intercompany Transaction* action.

### Edit screen

Header buttons: **SAVE**, **FINAL**, **DISCARD** (draft), **VOID** (FINAL only), **CLONE** (background job, polls up to three times; `HIDE_CLONE_BUTTON` / `SHOW_CLONE_BUTTON`).

Panels, in the order set by *Default Selection → Details Tab Ordering*: **Search Document** (new documents only; sub-tabs *Search Purchase Order* and *Search Purchase GRN*; `HIDE_SEARCH_BY_DOCUMENT_BUTTON`, `HIDE_SEARCH_PURCHASE_GRN_TAB`, `HIDE_PO_COMPANY_CODE`, `HIDE_PO_SERVER_DOC_TYPE`, `HIDE_ADD_ALL_TO_PURCHASE_GRN`), **Main Details**, **Account**, **Lines** (inline grid with **Standard View** / **Spreadsheet View**, PO order-quantity columns from the open queue, stock-balance column with `SHOW_ITEM_STOCK_BALANCE`), **Delivery Details**, **KO For** (new documents only), **Payment**, **Department Hdr**, **Trace Document**, **Contra**, **Doc Link**, **Export**, **Attachments** and **Status** (custom statuses; `HIDE_STATUS_TAB`). `VERTICAL_ORIENTATION` turns the tabs into expansion panels; the `EXPAND_*` keys choose which open by default. `SIMPLIFIED_UI` collapses the form into a single receiving screen and, together with `HIDE_GENDOC_SAVE_BUTTON`, refuses to leave a draft that has not been finalised.

{{< figure src="/images/internal-purchase-grn-applet/line-items-listing.png" alt="Purchase GRN (Internal) Line Items listing showing item-level receipt data across documents" caption="Line Items menu: every GRN line across documents, with serial, batch and bin detail." >}}

### Settings

{{< figure src="/images/internal-purchase-grn-applet/settings-page.png" alt="Purchase GRN (Internal) settings page showing configuration and permission options" caption="Settings: Application Settings (field configuration), Default Selection, Printable Format Settings, Branch Settings, Custom Status." >}}

## Configuration

### Before you can use it

| Prerequisite | Where | Why |
|---|---|---|
| Company, branch, location | [Organisation](/applets/master-data/organisation-applet/) | Branch and location are required header fields; `DEFAULT_BRANCH` / `DEFAULT_LOCATION` pre-fill them. The location on the GRN is copied to the invoice, so a wrong or later-deactivated location leaves stock "stuck" when the invoice posts. |
| Supplier entities | [Supplier](/applets/master-data/supplier-applet-1/) | Account tab. `ENABLE_SELECT_MODE` and `ALLOW_TO_CREATE_EDIT_ACCOUNT` let receivers create a supplier from the picker. |
| Items with inventory links | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/), [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) | Lines; serial / batch / bin sub-item types decide which line sub-tabs appear. |
| Purchase orders (optional) | [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) | Only FINAL, not CLOSED, not fully knocked-off POs appear in KO For / Search Purchase Order. |
| Tax codes | [Tax Configuration](/applets/master-data/tax-configuration-applet/) | Line tax and withholding tax selectors. |
| Pricing schemes | [Pricebook](/applets/master-data/pricebook-applet/) | *Branch Settings → Pricing Scheme* and *Role Pricing Scheme Link* derive unit prices shown on lines. |
| Document flow configuration | Company (gendoc flow config) | Decides which open-queue rows FINAL creates (GRN → Purchase Invoice) and whether an invoice is auto-generated and in which posting status (see *Lifecycle*). |
| Permissions | *Permission Wizard / Set*, *Client Side Permission* | Server-side create / read / update / delete on `INTERNAL_PURCHASE_GOODS_RECEIVED_NOTE` with targets; client-side switches below. |

### Applet settings

**Settings → Default Selection**:

| Setting | What it controls | Default | Effect when changed | Who can change it |
|---|---|---|---|---|
| `DEFAULT_BRANCH`, `DEFAULT_LOCATION` (and derived `DEFAULT_COMPANY`) | Branch and receiving location pre-selected on new GRNs. | none | New GRNs open with them; personal defaults override. | Tenant admin with the applet's Settings menu |
| `DEFAULT_DECIMAL_PRECISION` (with `DEFAULT_DECIMAL_STEP`) | "Unit Price Decimal Precision" for line price inputs. | none | Line price inputs round and step accordingly. | Same |
| `DATE_TXN_LOGIC` | "Transaction Date Logic": `USE_FINAL` (Finalized Date), `USE_CREATED`, `USE_UPDATED`, `USE_DATE_TXN` (Transaction Date). | none (keyed date) | Which date the backend stamps as the transaction date on FINAL. | Same |
| `DEFAULT_LANGUAGE_CODE` | Resource-bundle language for labels. | none | Works with *Custom Resource Bundle Configuration*. | Same |
| `PURCHASE_GRN_DETAILS_TAB_ORDER` | Drag-and-drop order of the 14 edit panels. | code order | Re-orders for everyone. | Same |

**Settings → Custom Status**: five header and five line custom-status fields, each with `ENABLE_CUSTOM_STATUS_HDR_n` / `…_LINE_n`, a name (`NAME_CUSTOM_STATUS_…`) and a value list (`LIST_CUSTOM_STATUS_…`); shown on the **Status** panel.

**Settings → Application Settings** (shared field-configuration screen; toggles labelled by key, default off). Keys this applet reads, by group:

| Group | Keys | What they control |
|---|---|---|
| Listing | `DEFAULT_POSTING_STATUS`, `DEFAULT_STATUS`, `DEFAULT_TRANSACTION_DATE`, `SORT_ORDER`, `FUZZY_SEARCH_COLUMNS`, `DISABLE_GEN_DOC_LISTING`, `PRINTABLE`, `ENABLE_AUTO_POPUP`, `ENABLE_UNSAVED_ITEM_RECOVERY`, `HIDE_EXPORT_AS_PDF_BUTTON`, `DISABLE_DOC_LINK_PREVIEW_POPUP` | Default filters and sort, quick-search columns, default printable, PDF pop-up after FINAL, unsaved-line recovery, doc-link preview. |
| Menus | `HIDE_LINE_ITEMS_MENU`, `HIDE_FILE_EXPORT_MENU`, `HIDE_AUDIT_TRAIL_MENU` | Sidebar entries (`SHOW_LINE_ITEMS_MENU` / `SHOW_FILE_EXPORT_MENU` permissions reopen the first two). |
| Buttons | `HIDE_GENDOC_SAVE_BUTTON`, `HIDE_GENDOC_FINAL_BUTTON`, `HIDE_GENDOC_DISCARD_BUTTON`, `HIDE_GENDOC_VOID_BUTTON`, `HIDE_CLONE_BUTTON`, `HIDE_SEARCH_BY_DOCUMENT_BUTTON`, `HIDE_ADD_ALL_TO_PURCHASE_GRN` | Edit-screen buttons. Only DISCARD is restored per user by its `SHOW_GENDOC_…` permission; FINAL and VOID follow the setting alone (see *Feature visibility*). |
| Serial numbers | `ENABLE_SERIAL_NUMBER_VALIDATION_FINAL`, `ALLOW_DUPLICATE_SERIAL_NUMBER_ACROSS_DIFFERENT_ITEMS`, `SERIAL_NUMBER_QTY_FOLLOW_BASIC_QTY`, `HIDE_SERIAL_NUMBER` | FINAL re-validates serial and batch quantities; a serial that already appears on another item in the same document is flagged *Duplicate Serial Number* and blocks FINAL unless duplicates across items are allowed; the serial count can drive the line quantity. |
| Header fields | `HIDE_DOC_SHORT_CODE`, `HIDE_DOCUMENT_TYPE`, `HIDE_SERVER_DOC_1..3`, `HIDE_CLIENT_DOC_TYPE`, `HIDE_CLIENT_DOC_1..5`, `EDITABLE_CLIENT_DOC_1..5`, `SHOW_CLIENT_DOC_DATE_1..5`, `HIDE_MAIN_DETAILS_TRANSACTION_DATE`, `HIDE_DOC_REFERENCE_DATE`, `HIDE_PURCHASER`, `ENABLE_EMPLOYEE_LOGIN_AUTO_DETECTION`, `HIDE_TRACKING_ID`, `HIDE_PERMIT_NO`, `HIDE_CURRENCY`, `HIDE_BASE_CURRENCY`, `SHOW_FOREX_DATA_SOURCE`, `CANNOT_EDIT_CURRENCY_RATE`, `HIDE_CREDIT_TERMS`, `HIDE_CREDIT_LIMIT`, `HIDE_REFERENCE`, `HIDE_REMARKS`, `HIDE_DESCRIPTION`, `HIDE_DOC_DESC`, `HIDE_EXTERNAL_REMARKS`, `HIDE_LOCATION`, `HIDE_DELIVERY_BRANCH`, `HIDE_DELIVERY_LOCATION`, `HIDE_CREATED_BY_DETAILS`, `ENABLE_DUPLICATE_REFERENCE_CHECK`, `DISALLOW_DUPLICATE_INVOICE`, `SHOW_BUDGET`, `DISABLE_LINES_FOLLOWING_HDR_BUDGET` | Main Details visibility and behaviour. `ENABLE_DUPLICATE_REFERENCE_CHECK` warns *Duplicate Reference Number PURGRN …* (and the same for quotation, order, delivery-order, invoice and other numbers); `DISALLOW_DUPLICATE_INVOICE` turns the external-invoice warning into a validation error. `SHOW_BUDGET` adds the vote-book / fiscal-period selectors; lines inherit the header budget unless disabled. |
| External documents | `HIDE_EXTERNAL_QUOTATION`, `HIDE_EXTERNAL_ORDER`, `HIDE_EXTERNAL_DELIVERY_ORDER`, `HIDE_EXTERNAL_INVOICE`, `HIDE_EXTERNAL_OTHERS` (and `HIDE_QUOTATION` … `HIDE_OTHERS`, the `HIDE_EXTERNAL_…_DATE` and `MANDATORY_…` / `MANDATORY_…_DATE` pairs) | The five supplier reference / date pairs (quotation, order, delivery order, invoice, others); mandatory flags add required validators. These fields stay editable after FINAL (2026 change). |
| Account tab | `ENABLE_SELECT_MODE`, `HIDE_ENTITY_BRANCH_DROPDOWN`, `HIDE_ENTITY_STATUS`, `HIDE_ACCOUNT_BILLING_CONTACT`, `HIDE_ACCOUNT_SHIPPING_CONTACT`, `HIDE_BILL_TO_TAB`, `HIDE_SHIP_TO_TAB` | Supplier picker and sub-tabs. |
| Lines | `HIDE_QTY_BASE`, `HIDE_QTY_UOM`, `HIDE_UOM_TO_BASE_RATIO`, `HIDE_UNIT_PRICE_STD_*`, `HIDE_UNIT_PRICE_NET_*`, `HIDE_UNIT_PRICE_TXN`, `HIDE_UNIT_PRICE_TXN_UOM_INCL_TAX`, `HIDE_UNIT_DISCOUNT`, `HIDE_UNIT_DISCOUNT_UOM_EXCL_TAX`, `HIDE_MULTI_DISCOUNT`, `HIDE_AMOUNT_STD_EXCL_TAX`, `HIDE_DISCOUNT_AMOUNT_EXCL_TAX`, `HIDE_AMOUNT_NET_EXCL_TAX`, `HIDE_AMOUNT_TXN`, `HIDE_TOTAL_TXN_AMOUNT`, `HIDE_TOTAL_QTY`, `HIDE_SST_VAT_GST_AMOUNT`, `HIDE_TOTAL_SST_VAT_GST_AMOUNT`, `HIDE_TAX_CONFIG_SELECTION`, `HIDE_WHT_CONFIG_SELECTION`, `HIDE_LAST_PURCHASE_PRICE`, `SHOW_REBATE_PRICE`, `HIDE_EAN_CODE`, `HIDE_TARIFF_CODE`, `HIDE_LINE_ITEMS_GL_CODE`, `ENABLE_EDITING_UNIT_PRICE_STD`, `ENABLE_ITEM_NAME_MAX_LIMIT` + `ITEM_NAME_MAX_LIMIT`, `DISABLE_ITEM_LISTING`, `SHOW_ITEM_STOCK_BALANCE`, `HIDE_TRACKING_ID_GEN_DOC`, `HIDE_LINE_ITEM_LISTING_PO_NUMBER`, `HIDE_LINE_ITEM_LISTING_PO_REMARKS`, `HIDE_LINE_ITEM_LISTING_SERIAL_NUMBER`, `HIDE_LINE_ITEM_LISTING_TXN_AMOUNT`, `HIDE_LINE_ITEM_LISTING_TRACKING_ID`, `HIDE_LINE_ITEM_LISTING_REMARKS`, `HIDE_LINE_ITEM_LISTING_UOM` | Line grid columns, price columns and the item picker. |
| Line sub-tabs | `HIDE_BIN_NUMBER`, `MANDATORY_BIN_NUMBER`, `HIDE_BATCH_NUMBER`, `HIDE_COSTING_DETAILS`, `HIDE_PRICING_DETAILS`, `HIDE_ISSUE_LINK`, `HIDE_CHILD_ITEMS_TAB`, `HIDE_DELIVERY_INSTRUCTION`, `HIDE_DELIVERY_DETAILS`, `HIDE_DEPARTMENT`, `HIDE_DOC_LINK`, `HIDE_ATTACHMENT_TAB` | Per-line panels. |
| Knock-off | `HIDE_KO_FOR_TAB`, `ENABLE_MULTIPLE_KO`, `HIDE_SEARCH_PURCHASE_GRN_TAB`, `HIDE_PO_COMPANY_CODE`, `HIDE_PO_SERVER_DOC_TYPE` | KO For on create; one-to-many knock-off; Search Document sub-tabs and columns. |
| Department tags | `HIDE_SEGMENT`, `HIDE_DIMENSION`, `HIDE_PROFIT_CENTER`, `HIDE_PROJECT`, `MANDATORY_SEGMENT`, `MANDATORY_DIMENSION`, `MANDATORY_PROFIT_CENTER`, `MANDATORY_PROJECT`, `HIDE_DEPARTMENT_HDR_TAB` | Accounting dimensions on header and lines. |
| Other panels | `HIDE_DELIVERY_DETAILS_TAB`, `HIDE_MAIN_PAYMENT_TAB`, `HIDE_MAIN_CONTRA_TAB`, `HIDE_MAIN_ARAP_TAB`, `HIDE_TRACE_DOCUMENT_TAB`, `HIDE_DOC_LINK_TAB`, `HIDE_DOC_LINK_FROM`, `HIDE_DOC_LINK_TO` and the `HIDE_DOC_LINK_FROM_*` / `HIDE_DOC_LINK_TO_*` column keys, `HIDE_EXPORT_TAB`, `HIDE_ATTACHMENT_TAB`, `HIDE_STATUS_TAB`, `HIDE_ARAP_PNS`, `HIDE_ARAP_SETTLEMENT`, `HIDE_ARAP_DOC_OPEN`, `HIDE_ARAP_CONTRA`, `HIDE_ARAP_BAL`, `EDIT_CONTRA_TXN_DATE` | Panel visibility, Doc Link columns, ARAP sub-tabs. |
| Layout | `VERTICAL_ORIENTATION`, `DEFAULT_ORIENTATION`, `DEFAULT_TOGGLE_COLUMN`, `EXPAND_MAIN_DETAILS` … `EXPAND_STATUS`, `SIMPLIFIED_UI`, `ENABLE_INLINE_APPLET_CONFIG` | Tabs versus panels, default-expanded panels, the simplified receiving screen, the inline configuration gear on each screen. |

### Document behaviour settings

| Behaviour | Where it is set | Notes |
|---|---|---|
| Stock and GL posting | Not configurable in this applet. | Fixed by the backend signums (0 / 0): no inventory transaction lines, no journal. Use Purchase GRN Stock In for a receipt that moves stock. |
| Open-queue rows created on FINAL | Company document-flow configuration (`server_doc_type_1` = GRN, `server_doc_type_2` = the consuming type). | Stock availability counts GRN → Purchase Invoice rows as *GRN qty* and DRAFT GRN lines as *GRN draft qty*. |
| Automatic purchase invoice | Company document-flow configuration with the auto-convert queue; `doc_2_posting_status` DRAFT or FINAL. | `PurchaseGRNToPurchaseInvoiceConverter` copies the GRN into an `INTERNAL_PURCHASE_INVOICE` (amount signum −1). A GRN that already has an invoice link is skipped. |
| Transaction date | `DATE_TXN_LOGIC` (Default Selection). | See above. The date picker stores the created time rather than midnight UTC (2026 fix), so the day no longer shifts in Malaysian time. |
| Serial validation on FINAL | `ENABLE_SERIAL_NUMBER_VALIDATION_FINAL`, `ALLOW_DUPLICATE_SERIAL_NUMBER_ACROSS_DIFFERENT_ITEMS`. | Backend additionally checks that each serial's count equals the line quantity and that a serial does not already exist in the company (purchase-side check applies to signum-0 documents when requested). |
| Printables | *Printable Format Settings* (Format Code, Format Name, template); `PRINTABLE`; *Branch Settings → Printable Format*; permission `PRINTABLE_FORMAT_WITH_NO_PRICE`. | Bulk print from the listing; Export panel on the document. |
| Custom fields and labels | *Custom Field Placement* (Main Details, Account, Intercompany, line areas …), *Custom Resource Bundle Configuration*, *Spreadsheet View configuration* (Column Label, Line View Mode). | A tenant custom field coded `last_no` on the header is pre-filled with the previous GRN's number on a new document, for reference only. |
| e-Invoice | Not applicable — a GRN is not an e-Invoice document type. | |
| Approval workflow | Not available in this applet. | No approval settings, submit or approval-request screens exist; FINAL is not gated by approval. |
| Webhooks | *Settings → Webhook*. | |

### Branch settings

| Sub-tab | What it controls |
|---|---|
| **Branch Details** | Read-only branch name / code / company; default agent; rounding and group-discount items. |
| **Default Settlement Method** | Pre-selected settlement method on the Payment panel. |
| **Item Category Filter** | Item categories offered at this branch. |
| **Menu List** | Sidebar menus per branch. |
| **Pricing Scheme** | Branch pricing schemes. |
| **Printable Format** | Branch default printable format. |

### Feature visibility / permissions

Server-side: `INTERNAL_PURCHASE_GOODS_RECEIVED_NOTE` create / read / update / delete with targets (company, branch, location, supplier …) via *Permission Wizard* / *Permission Set*.

Client-side permissions seeded for this applet (`internalPurchaseGRNApplet`, 50 codes), grouped:

| Group | Permission codes |
|---|---|
| Buttons and screens | `SHOW_FINAL_BUTTON`, `SHOW_CLONE_BUTTON`, `SHOW_EXPORT_TAB`, `SHOW_INTERCOMPANY_PGRN_SCREEN`, `PRINTABLE_FORMAT_WITH_NO_PRICE` |
| Header fields | `SHOW_DOC_NO_TENANT`, `SHOW_DOC_NO_COMPANY`, `SHOW_DOC_NO_BRANCH`, `SHOW_TRANSACTION_DATE`, `SHOW_CLIENT_DOC_TYPE`, `SHOW_CLIENT_DOC_1..5`, `SHOW_DESCRIPTION`, `IPGRN_HIDE_TRACKING_ID_AND_PERMIT_NO` |
| Lines and pricing | `INTERNAL_PURCHASE_GRN_DISPLAY_PRICING`, `SHOW_QTY_BASE`, `SHOW_QTY_UOM`, `SHOW_UOM_TO_BASE_RATIO`, the `SHOW_UNIT_PRICE_*` set, `SHOW_UNIT_DISCOUNT`, `SHOW_UNIT_DISCOUNT_UOM_EXCL_TAX`, `SHOW_DISCOUNT_AMOUNT_EXCL_TAX`, `SHOW_AMOUNT_STD_EXCL_TAX`, `SHOW_AMOUNT_NET_EXCL_TAX`, `SHOW_AMOUNT_TXN`, `SHOW_AMOUNT_TXN_MAIN_LISTING`, `SHOW_TOTAL_TXN_AMOUNT`, `SHOW_TOTAL_SST_VAT_GST_AMOUNT`, `SHOW_TAX_CONFIG_SELECTION`, `SHOW_WHT_CONFIG_SELECTION`, `SHOW_LAST_PURCHASE_PRICE`, `SHOW_COSTING_DETAILS` |
| Account | `ALLOW_TO_CREATE_EDIT_ACCOUNT` |
| ARAP | `SHOW_ARAP_PNS`, `SHOW_ARAP_SETTLEMENT`, `SHOW_ARAP_DOC_OPEN`, `SHOW_ARAP_CONTRA`, `SHOW_ARAP_BAL` |

Checked in code but **not seeded** in the registry (create them under *Client Side Permission* before assigning): `SHOW_LINE_ITEMS_MENU`, `SHOW_FILE_EXPORT_MENU`, `SHOW_GENDOC_FINAL_BUTTON`, `SHOW_GENDOC_DISCARD_BUTTON`, `SHOW_GENDOC_SAVE_BUTTON`, `SHOW_GENDOC_VOID_BUTTON`, `SHOW_BUDGET`, `SHOW_SEGMENT`, `SHOW_GL_DIMENSION`, `SHOW_PROFIT_CENTER`, `SHOW_PROJECT`, `SHOW_QUOTATION`, `SHOW_ORDER`, `SHOW_DELIVERY_ORDER`, `SHOW_INVOICE`, `SHOW_OTHERS`, `SHOW_REFERENCE_MAIN_LISTING`, `SHOW_REMARKS_MAIN_LISTING`, `SHOW_QTY_MAIN_LISTING`, `SHOW_AMOUNT_MAIN_LISTING`.

Note that the edit screen's FINAL and VOID buttons follow `HIDE_GENDOC_FINAL_BUTTON` / `HIDE_GENDOC_VOID_BUTTON` alone — neither the seeded `SHOW_FINAL_BUTTON` nor the code-side `SHOW_GENDOC_FINAL_BUTTON` restores them per user; only DISCARD honours its `SHOW_GENDOC_DISCARD_BUTTON` override.

*Feature Visibility* (shared) hides menus per team.

## Fields

### Main Details

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Branch, Location | Receiving branch and stock location. | Yes | Defaults from Default Selection / personal defaults; the location is copied to lines and to the invoice created from the GRN. |
| Company | Owning company. | System | Derived from the branch. |
| Purchaser | Buyer / receiver. | No | `HIDE_PURCHASER`; `ENABLE_EMPLOYEE_LOGIN_AUTO_DETECTION` pre-fills the login's employee. |
| Doc Short Code, Doc No (Tenant / Company / Branch) | Type and running numbers. | System | Prefix `PURGRN`; `SHOW_DOC_NO_*` per user. |
| Transaction Date | Receipt date. | Yes | Overridden on FINAL by `DATE_TXN_LOGIC` when set. |
| Reference, Remarks, Description | Free text. | No | `ENABLE_DUPLICATE_REFERENCE_CHECK` warns on a reused reference. |
| Permit No, Tracking ID | References. | No | `IPGRN_HIDE_TRACKING_ID_AND_PERMIT_NO`. |
| Currency, Base Currency, Currency Rate, Forex Source | Document currency. | Currency yes | Rate locked by `CANNOT_EDIT_CURRENCY_RATE`. |
| Credit Terms, Credit Limit | Supplier terms. | No | Display only. |
| Client Doc Type, Client Doc 1–5 (+ dates) | Supplier / customer references. | No | `EDITABLE_CLIENT_DOC_n`, `SHOW_CLIENT_DOC_DATE_n`. |
| External Quotation / Order / Delivery Order / Invoice / Others (+ dates), External Remarks | The supplier's own document numbers, typically the delivery-order and invoice numbers. | Per `MANDATORY_…` | Duplicate warnings per number; `DISALLOW_DUPLICATE_INVOICE` blocks a reused supplier invoice number. Editable after FINAL. |
| Budget (vote book, fiscal period) | Budget consumed by the receipt. | No | Shown with `SHOW_BUDGET`. |
| Custom statuses (header) | Up to five tenant-defined statuses. | No | Status panel. |

### Account

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Supplier | Entity flagged as supplier. | Yes | Picker; create/edit inline with `ALLOW_TO_CREATE_EDIT_ACCOUNT`. |
| Entity branch | Supplier branch. | No | `HIDE_ENTITY_BRANCH_DROPDOWN`. |
| Bill To, Ship To | Address sub-tabs. | No | `HIDE_BILL_TO_TAB`, `HIDE_SHIP_TO_TAB`. |

### Lines

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Item | Item master entry (basic item, alias or group item). | Yes | Group items expand into child items (Child Items tab); GL-code items are allowed but move no stock. |
| Quantity, UOM, ratio | Received quantity. | Yes | For serialised items the quantity is read-only and follows the number of serials entered (`SERIAL_NUMBER_QTY_FOLLOW_BASIC_QTY`); the backend rejects a mismatch. |
| Order Qty columns | Ordered and still-open quantity of the knocked-off PO line. | System | From the PO open queue. |
| Unit price (std / txn / net), discounts, rebate price | Pricing carried from the PO or pricing scheme. | No | Amounts do not post anywhere on a GRN; they are copied to the invoice. |
| Tax code / %, WHT code / % | Taxes. | No | |
| Serial numbers | One per unit; typed, scanned or imported (Serial Number Import). | For serialised items | Duplicates within the document are flagged *Duplicate Serial Number*. |
| Batch (number, expiry, issue date), Bin | Batch and bin references. | Bin with `MANDATORY_BIN_NUMBER` | Bin quantities are validated on FINAL. |
| Delivery branch / location, delivery instruction | Per-line delivery. | No | |
| Segment, Dimension, Profit Centre, Project, Budget | Tags. | Per `MANDATORY_…` | |
| GL code | Line GL code. | No | `HIDE_LINE_ITEMS_GL_CODE`. |
| Remarks, warning | Line text; the warning column carries validation remarks and stays as it was once the document is FINAL. | No | |
| Custom statuses (line) | Up to five tenant-defined statuses. | No | |

### Delivery Details, Payment, Department Hdr, Contra

| Panel | Fields | Notes |
|---|---|---|
| Delivery Details | Delivery Branch, Delivery Location, Delivery Type, Tracking ID. | `HIDE_DELIVERY_BRANCH`, `HIDE_DELIVERY_LOCATION`. |
| Payment | Settlement method, amount, date. | A deposit recorded against the receipt; branch default settlement method. |
| Department Hdr | Segment, Dimension, Profit Centre, Project. | |
| Contra | Contra against the supplier's documents. | `EDIT_CONTRA_TXN_DATE`. |

## Lifecycle and posting

| Status | Meaning | Allowed next |
|---|---|---|
| **DRAFT** | Editable; lines counted as *GRN draft qty* in stock availability. | FINAL, DISCARDED |
| **FINAL** | Locked (external reference numbers and custom statuses stay editable); lines queued for knock-off. | VOID |
| **VOID** | Cancelled (processed by the backend's void queue). | none |
| **DISCARDED** | Abandoned draft. | none |

**FINAL is enabled when** the document is `ACTIVE`, not locked by another process, has at least one line (a zero-amount GRN is allowed) and `HIDE_GENDOC_FINAL_BUTTON` is off. With `ENABLE_SERIAL_NUMBER_VALIDATION_FINAL` the applet first re-checks serial and batch quantities and refuses lines flagged *Duplicate Serial Number*.

**What FINAL does.** The backend validates serial numbers (count equals quantity; purchase-side "already exists in company" check for signum-0 documents when requested), bin quantities and the fiscal period, stamps the transaction date per `DATE_TXN_LOGIC`, and creates open-queue rows for the consuming document types configured for the company (normally GRN → Purchase Invoice). Because both signums are **0**:

| Ledger | Effect of FINAL |
|---|---|
| Stock | **none** — `createInventoryTxnFromGenericDoc` skips every line whose quantity signum is 0, so no `bl_inv_txn_line` is written and stock balances do not change. |
| General Ledger | **none** — there is no journal-posting handler for `INTERNAL_PURCHASE_GOODS_RECEIVED_NOTE`. |
| Open queue | one row per line (GRN → invoice), shown as *GRN qty* in stock availability until the invoice consumes it. |

The receipt becomes stock and a liability when the invoice is finalised:

| Document | Quantity signum | Amount signum | Stock | General Ledger |
|---|---|---|---|---|
| Purchase GRN (Internal) — this applet | 0 | 0 | none | none |
| [Purchase GRN Stock In (Internal)](/applets/purchase-workflow/internal-purchase-grn-stock-in-applet/) | +1 | −1 | stock in at the GRN location | Dr Inventory Not Invoiced / Cr Creditor Not Invoiced (with purchase discount, return and input tax sub-ledgers) |
| [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/) | +1 | −1 | stock in, last purchase cost updated | Dr Purchase (or item GL) + Input Tax / Cr Creditor |
| [Purchase Invoice No Stock In (Internal)](/applets/purchase-workflow/internal-purchase-invoice-no-stock-in-applet/) | 0 | −1 | none | Dr Purchase / Cr Creditor (pairs with GRN Stock In) |

So the two supported receipt-to-bill paths are **GRN (0/0) → Purchase Invoice (+1/−1)** and **GRN Stock In (+1/−1) → Purchase Invoice No Stock In (0/−1)**. Mixing them (a GRN Stock In knocked off by a full Purchase Invoice, or a standard GRN followed by an invoice with no stock in) either double-counts stock or never books it.

**Intercompany.** When a sales invoice or outbound delivery order in one company of the tenant targets another company, intercompany processing can create the mirror GRN (signums 0 / 0); users with `SHOW_INTERCOMPANY_PGRN_SCREEN` confirm it from *Search By Intercompany Sales Invoices*.

**VOID** is offered only on a FINAL document (*This document has not been finalized yet* otherwise) and is processed by the backend's void queue (`BLG_ERP_VOID_GENERIC_DOCUMENT_PRIMARY_PROCESSOR`); for a foreign-currency GRN the base-currency shadow is voided with it. The applet does not check whether an invoice has already knocked the GRN off — review Doc Link before voiding.

## Related applets

- [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) — the order this receipt knocks off; its *PO Line with GRN KO* report and *Purchase Order Queue* show what is still outstanding.
- [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/) — knocks off the GRN and books stock and the creditor; the backend can generate it automatically.
- [Purchase Invoice No Stock In (Internal)](/applets/purchase-workflow/internal-purchase-invoice-no-stock-in-applet/) and [Purchase GRN Stock In (Internal)](/applets/purchase-workflow/internal-purchase-grn-stock-in-applet/) — the alternative pair where the receipt, not the invoice, moves stock.
- [Purchase GIN (Internal)](/applets/purchase-workflow/internal-purchase-gin-applet/) — goods issued back to the supplier.
- [Purchase Return (Internal)](/applets/purchase-workflow/internal-purchase-return-applet/) — return against a received document.
- [Supplier Delivery Order](/applets/purchase-workflow/supplier-delivery-order-applet/) — the supplier's B2B delivery document matched to PO and GRN.
- [Purchase GRN Supplier Access (Internal)](/applets/purchase-workflow/internal-purchase-grn-supplier-access-applet/) — supplier portal view.
- [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [Outbound Delivery Order](/applets/sales-workflow/internal-outbound-delivery-order-applet/) — intercompany sources.
- [Stock Availability](/applets/inventory-workflow/stock-availability-applet/) — shows GRN and GRN-draft quantities as incoming stock.
- [Purchase Report](/applets/purchase-workflow/purchase-report-applet/) — analysis across PO, GRN and invoice.
- [Supplier](/applets/master-data/supplier-applet-1/), [Organisation](/applets/master-data/organisation-applet/), [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/), [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/), [Tax Configuration](/applets/master-data/tax-configuration-applet/), [Pricebook](/applets/master-data/pricebook-applet/) — master data.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| Stock balance did not increase after the GRN was finalised | Expected: the standard GRN has quantity signum 0 and writes no inventory transaction. | Finalise the purchase invoice knocked off from the GRN; or switch the receiving flow to Purchase GRN Stock In + Purchase Invoice No Stock In. |
| Stock still missing after the invoice was finalised | The GRN (and the invoice copied from it) carried a location that was later deactivated or belongs to another branch; the stock-balance refresh could not land. | Correct the location on the documents and ask support to re-queue the current-stock-balance refresh for the affected items and location. |
| Invoice created from the GRN is DRAFT, not FINAL (or the reverse) | Company document-flow configuration `doc_2_posting_status`. | Change the flow configuration; the converter reads it at conversion time. |
| No invoice was generated for a finalised GRN | The GRN already has a document link to an invoice, or the auto-convert validation (stock check) failed and the queue row is being retried. | Check Doc Link on the GRN; look at the auto-convert queue with support. |
| FINAL button missing | No lines yet, document not `ACTIVE`, locked by a running job, or `HIDE_GENDOC_FINAL_BUTTON` on. | Add a line; wait for the lock; turn the setting off — no per-user permission restores FINAL in this applet. |
| *Duplicate Serial Number* remark on a line and FINAL refused | The same serial appears on another item in the document. | Correct the serial, or turn on `ALLOW_DUPLICATE_SERIAL_NUMBER_ACROSS_DIFFERENT_ITEMS` if the tenant genuinely reuses serials across item codes. |
| *Serial number already exists for company* on FINAL | The serial is already in stock in this company (purchase-side check). | Check the earlier receipt; issue the serial out first, or correct the number. |
| *Quantity base and serial number quantity does not match* | Line quantity differs from the number of serials. | Enter one serial per unit; with `SERIAL_NUMBER_QTY_FOLLOW_BASIC_QTY` the quantity follows the serial count. |
| *Duplicate Reference Number PURGRN …* / *Duplicate Invoice Number PURGRN …* | `ENABLE_DUPLICATE_REFERENCE_CHECK` found the same number on another GRN; with `DISALLOW_DUPLICATE_INVOICE` the invoice number is a hard error. | Use the correct supplier number; clear the setting if the numbers legitimately repeat. |
| PO not offered in KO For / Search Purchase Order | The PO is not FINAL, has been CLOSED, its lines are fully knocked off, or a `HIDE_…` key hides the tab. | Check the PO applet's Purchase Order Queue / Closed Queue KO; review `HIDE_KO_FOR_TAB`, `HIDE_SEARCH_BY_DOCUMENT_BUTTON`. |
| Knocked-off lines appear in a different order from the PO | Fixed in 2026 (line ordering consistency). | Update the applet. |
| PDF pop-up after FINAL arrives late or times out | Older builds waited a fixed delay inside FINAL. | Update the applet (pop-up now fires from the FINAL-success effect); needs `ENABLE_AUTO_POPUP` and `PRINTABLE`. |
| Listing shows only ACTIVE documents on first load regardless of settings | Older builds hard-coded the status filter. | Update the applet; set `DEFAULT_STATUS`. |
| A hide toggle in Application Settings has no effect | Two fields could not be hidden before the 2026 fix; other keys may not be read by this applet at all. | Update the applet; only the keys listed above are read. |
| Transaction date shows one day earlier than keyed | Older builds stored the picker value as midnight UTC. | Update the applet. |
| Custom fields placed on the GRN do not appear | The applet did not refresh custom-field placements on start (fixed 2026). | Update the applet; check *Custom Field Placement*. |
| Supplier DO number cannot be edited | The external delivery-order field is hidden by `HIDE_EXTERNAL_DELIVERY_ORDER`, or an older build locked external references after FINAL. | Turn the key off; update the applet (external references are editable after FINAL since 2026). |
| Line Items or File Export menu missing | `HIDE_…_MENU` on and the user lacks the (unseeded) `SHOW_…_MENU` permission. | Turn the setting off, or create and grant the permission. |
| *The selected date falls within a locked fiscal period* | Date in a locked period. | Change the date or reopen the period. |

## Related documentation

- [Purchasing module](/modules/purchasing/) and its [related applets](/modules/purchasing/related-applets/)
- [Standard procurement workflow](/guides/purchasing-guides/standard-procurement-workflow/) — PR → PO → GRN → Purchase Invoice → Payment
- [Direct GRN workflow](/guides/purchasing-guides/direct-grn-workflow/) — receiving without a purchase order
