---
title: "Purchase Return (Internal)"
description: "Reference for the Purchase Return (Internal) applet: the document that sends goods back to a supplier, takes them out of stock and debits the supplier's account, with its screens, every configuration switch, fields, posting rules and known failure modes."
applet_code: "internal_purchase_return_applet"
applet_repo: "blg-applet-wavelet-internal-purchase-return-applet"
modules: [purchasing, inventory, financial-accounting, e-invoice]
related_applets:
  - internal-purchase-invoice-applet
  - internal-purchase-invoice-no-stock-in-applet
  - internal-purchase-grn-applet
  - internal-purchase-order-applet
  - internal-purchase-debit-note-applet
  - internal-purchase-credit-note-applet
  - internal-purchase-refund-note-applet
  - internal-purchase-return-supplier-access-applet
  - internal-sales-return-applet
  - internal-payment-voucher-applet
  - creditor-report-applet
  - chart-of-account-applet
  - doc-item-maintenance-applet
  - inv-item-maintenance-applet
  - tax-configuration-applet
  - supplier-applet-1
  - organisation-applet
  - my-e-invoice-admin-applet
guides:
  - /guides/einvoice-guides/myinvois-setup/
  - /guides/einvoice-guides/einvoice-validation/
sources:
  - blg-applet-wavelet-internal-purchase-return-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-return-applet/src/app/app.routing.ts
  - blg-applet-wavelet-internal-purchase-return-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-return-applet/src/app/models/menu-items.ts
  - blg-applet-wavelet-internal-purchase-return-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-return-applet/src/app/models/constants/applet-constants.ts
  - blg-applet-wavelet-internal-purchase-return-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-return-applet/src/app/app.component.ts
  - blg-applet-wavelet-internal-purchase-return-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-return-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
  - blg-applet-wavelet-internal-purchase-return-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-return-applet/src/app/components/settings-container/reason-settings-container/
  - blg-applet-wavelet-internal-purchase-return-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-return-applet/src/app/components/settings-container/branch-settings/
  - blg-applet-wavelet-internal-purchase-return-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-return-applet/src/app/components/purchase-return-container/purchase-return-create/main-details/main-details.component.ts
  - blg-applet-wavelet-internal-purchase-return-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-return-applet/src/app/components/purchase-return-container/purchase-return-create/search-invoices/
  - blg-applet-wavelet-internal-purchase-return-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-return-applet/src/app/components/purchase-return-container/purchase-return-edit/purchase-return-edit.component.html
  - blg-applet-wavelet-internal-purchase-return-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-return-applet/src/app/components/utilities/utility-functions/purchase-return-price-functions.ts
  - blg-shared-utilities/models/return-pricing-constants.model.ts
  - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalPurchaseReturnDataConsistencyObject.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingTypeHandler.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/intercompany/IntercompanyProcessingService.java
  - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dto/erp/eInvoice/EInvoiceConstants.java
  - akaun_master.bl_applet_client_side_perm_dfn (applet code internal_purchase_return_applet)
tags:
- purchase-management
- supplier-returns
- inventory-adjustment
- financial-posting
- document-tracing
weight: 60
date: 2026-02-20
lastmod: 2026-09-05
draft: false
---

## Overview

The **Purchase Return (Internal)** applet records goods going back to a supplier. Finalising one does three things at once: it takes the returned quantity **out of stock** at the chosen location, posts **Dr Creditor / Cr Purchase Return** so the supplier's balance falls, and leaves a positive ARAP balance that finance closes by **contra** against the supplier's invoices or by a **settlement** when the supplier refunds cash. Warehouse and procurement staff create it, usually by pulling lines from the original purchase invoice or GRN; finance closes it.

Engine document type `INTERNAL_PURCHASE_RETURN`, amount signum **+1**, quantity signum **−1**. It is the stock-moving counterpart of the [Purchase Debit Note (Internal)](/applets/purchase-workflow/internal-purchase-debit-note-applet/), which has the same amount sign but never touches stock.

## Where it fits

| Position | Document / applet | Why |
|---|---|---|
| Module | [Purchasing](/modules-v2/purchasing/), [Inventory](/modules-v2/inventory/), [Financial Accounting](/modules-v2/financial-accounting/), [E-Invoice](/modules-v2/e-invoice/) | Stock out, GL posting, and an e-Invoice purchase document type. |
| Upstream | [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/), [Purchase Invoice No Stock In (Internal)](/applets/purchase-workflow/internal-purchase-invoice-no-stock-in-applet/), [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/) | The **Search** tab (Search By Supplier / By Invoice / By GRN / By Purchase Invoice No Stock In / By Serial Number) copies their lines, links the documents, and caps the return quantity at the source line. |
| Upstream (knock-off) | [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) | The create screen's **KO For** tab. |
| Downstream | [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/), the **Contra** and **Settlement** tabs | Close the return's ARAP balance. |
| Downstream | [Purchase Refund Note (Internal)](/applets/purchase-workflow/internal-purchase-refund-note-applet/) | Cash refund from the supplier recorded as its own document. |
| Downstream | [Creditor Report](/applets/finance/creditor-report-applet/) | Shows the return's balance against the supplier. |
| Downstream | [My E-Invoice Admin](/applets/e-invoice/my-e-invoice-admin-applet/) | `INTERNAL_PURCHASE_RETURN` is in the e-Invoice purchase-document set. |
| Intercompany | [Sales Return (Internal)](/applets/sales-workflow/internal-sales-return-applet/) | Intercompany processing pairs `INTERNAL_PURCHASE_RETURN` → `INTERNAL_SALES_RETURN` (and the reverse); the **Intercompany** menu is the manual confirmation queue. |
| External | [Purchase Return Supplier Access (Internal)](/applets/purchase-workflow/internal-purchase-return-supplier-access-applet/) | Supplier-facing view. |

## Screens and menus

| Menu | Route | What it is |
|---|---|---|
| **Purchase Return** | `purchase-return` | Listing, create, edit. Bulk **FINAL**, **DISCARD**, **VOID**, **SINGLE/MULTIPLE PRINT** and **SELF-BILLED** (sets `einvoice_self_billed`). |
| **Line Items** | `line-items` | Cross-document line grid (Edit Item with Item Details, Costing Details, Issue Link, Related Documents). |
| **File Export** | `file-export` | Download the filtered listing. Hidden when `HIDE_FILE_EXPORT_MENU` is on and the user lacks `SHOW_FILE_EXPORT_MENU`. |
| **Intercompany** | `intercompany` | Manual intercompany transaction queue. |
| **Audit Trail** | `audit-trail` | Change log. |
| **Settings** | `settings/…` | Application Settings, Default Selection, Printable Format Settings, Return Reasons Settings, Branch Settings, Workflow Settings, Webhook, Feature Visibility, Client Side Permission, Role Pricing Scheme Link, Permission Wizard / Set / User / Team / Role Permission, Release Notes, Applet Log. |
| **Personalization** | `personalization/…` | Per-user Default Selection and Sidebar. |

There is no File Import menu in this applet (the backend importer exists; the UI does not expose it).

{{< figure src="/images/internal-purchase-return-applet/purchase-return-listing.png" alt="Purchase Return (Internal) main listing" caption="Listing." >}}

{{< figure src="/images/internal-purchase-return-applet/purchase-return-filter.png" alt="Advanced filtering options" caption="Advanced Search." >}}

{{< figure src="/images/internal-purchase-return-applet/purchase-return-file-export.png" alt="File Export options" caption="File Export." >}}

### Create screen

Tabs: **Search**, **Main Details**, **Account**, **Lines**, **KO For** (hidden by `HIDE_KO_FOR_TAB`), **Delivery Details**, **Settlement**, **Department Hdr**, **Contra**. **CREATE** saves a DRAFT.

The **Search** tab is the recommended starting point. Its sub-tabs are Search By Supplier, Search By Invoice, Search By GRN (`HIDE_SEARCH_BY_GRN`), Search By Purchase Invoice No Stock In (shown only with `SHOW_SEARCH_BY_PURCHASE_INVOICE_NO_STOCK_IN`) and Search By Serial Number. Selecting a source line copies it, creates a document link and — with `WARN_EXCESS_RETURN_QUANTITY` — refuses a return quantity above the source line's quantity (*Total return quantity is greater that the invoice qty*). **Add All** returns every remaining line.

{{< figure src="/images/internal-purchase-return-applet/purchase-return-create.png" alt="Purchase Return creation form" caption="Create screen." >}}

{{< figure src="/images/internal-purchase-return-applet/search-by-supplier.png" alt="Search tab — Search By Supplier" caption="Search By Supplier." >}}

{{< figure src="/images/internal-purchase-return-applet/search-by-invoice.png" alt="Search tab — Search By Invoice" caption="Search By Invoice." >}}

{{< figure src="/images/internal-purchase-return-applet/search-invoice-selected.png" alt="Search tab — invoice selected" caption="Invoice selected, lines ready to return." >}}

{{< figure src="/images/internal-purchase-return-applet/main-details-tab.png" alt="Main Details tab" caption="Main Details — branch, location, purchaser, credit terms, reason, reference, remarks." >}}

{{< figure src="/images/internal-purchase-return-applet/account-tab.png" alt="Account tab — entity details" caption="Account — supplier entity." >}}

{{< figure src="/images/internal-purchase-return-applet/line-items-tab.png" alt="Line Items tab — select item" caption="Lines — items and return quantities." >}}

### Edit screen

Header buttons **SAVE**, **FINAL**, **DISCARD**, **VOID**. Tabs, ordered by *Default Selection → Details Tab Ordering*: **Search**, **Main Details**, **E-Invoice**, **Account**, **Lines**, **ARAP**, **Delivery Details**, **Settlement**, **Department Hdr**, **Trace Document**, **Contra**, **Doc Link**, **Export**, **Attachments**.

{{< figure src="/images/internal-purchase-return-applet/purchase-return-edit.png" alt="Purchase Return edit mode" caption="Edit screen." >}}

{{< figure src="/images/internal-purchase-return-applet/e-invoice-tab.png" alt="E-Invoice tab" caption="E-Invoice — submission type, document number and supplier e-Invoice identity." >}}

{{< figure src="/images/internal-purchase-return-applet/settlement-tab.png" alt="Settlement tab" caption="Settlement — total settlement, document open amount and ARAP balance." >}}

{{< figure src="/images/internal-purchase-return-applet/arap-tab.png" alt="ARAP tab" caption="ARAP — contra and outstanding amounts." >}}

{{< figure src="/images/internal-purchase-return-applet/attachments-tab.png" alt="Attachments tab" caption="Attachments." >}}

{{< figure src="/images/internal-purchase-return-applet/export-tab.png" alt="Export tab" caption="Export — pick a printable format (typically a debit-note layout) and download the PDF." >}}

{{< figure src="/images/internal-purchase-return-applet/purchase-return-line-item-listing.png" alt="Purchase Return line item listing" caption="Line Items menu — one row per return line." >}}

## Configuration

### Before you can use it

| Prerequisite | Where | Why |
|---|---|---|
| Company, branch, location | [Organisation](/applets/master-data/organisation-applet/) | Branch and location are required; the location is where stock is deducted. Use a dedicated returns location if you want returned stock separated. |
| Supplier entity | [Supplier](/applets/master-data/supplier-applet-1/) | The AR/AP object type selects `CREDITOR` or `CREDITOR_NON_TRADE`. A supplier not linked to the branch is rejected (*Supplier not linked to branch*) when `ENABLE_BRANCH_FILTER` is on. |
| Stock on hand at the location | [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) and the receiving documents | FINAL validates stock balance per item, batch, bin and serial at the return location; *There's not enough stock for item …* stops it. |
| Company default GL codes | [Chart of Account](/applets/master-data/chart-of-account-applet/) → company GL-code links | `CREDITOR` / `CREDITOR_NON_TRADE` (mandatory), `PURCHASE_RETURN` for lines without their own GL code, `INPUT_TAX`. |
| Items with purchase-return GL links | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) | Line GL code: header GL code → item-company `PURCHASE_RETURN` link → company default. |
| Return reasons | This applet → *Settings → Return Reasons Settings* (Reason Code, Reason Name) | The **Reason** field on Main Details. |
| Tax codes | [Tax Configuration](/applets/master-data/tax-configuration-applet/) | Line tax and WHT. |
| Cashbook / settlement methods | [Cashbook](/applets/master-data/cashbook-applet/) | Only for Settlement-tab refunds; a settlement item without a cashbook GL fails FINAL (`MISSING_CASHBOOK` / `MISSING_GL_CODE`). |
| Fiscal period open | [General Ledger](/applets/finance/general-ledger-applet/) | FINAL refused in a locked period. |
| Workflow (optional) | *Settings → Workflow Settings* (Process Code, Server Doc Type, Company) and `WORKFLOW_PROCESS_GUID` | Attaches a workflow process and status to new documents. |
| e-Invoice setup | [My E-Invoice Admin](/applets/e-invoice/my-e-invoice-admin-applet/) | Only if returns must be submitted; skip flags on document, branch or supplier bypass it. |
| Permissions | *Permission Wizard / Set*, *Client Side Permission* | Server-side create / read / update / delete on `INTERNAL_PURCHASE_RETURN` with targets. |

### Applet settings

**Settings → Default Selection**:

| Setting | What it controls | Default | Effect when changed | Who can change it |
|---|---|---|---|---|
| `DEFAULT_BRANCH`, `DEFAULT_LOCATION` (derived `DEFAULT_COMPANY`) | Branch and location pre-selected on new returns. | none | New returns open with them; personal defaults override. | Tenant admin with the applet's Settings menu |
| `DEFAULT_PURCHASE_RETURN_PRICING_OPTION` — "Purchase Return Pricing Option" | Which price a returned line takes: `LAST_PURCHASE_PRICE`, `MA_COST` (moving-average cost) or `PURCHASE_INVOICE_PRICE`; *None* lets the user choose per line. | none | Lines created from a search or by hand price themselves by this rule. | Same |
| `PURCHASE_RETURN_PRICE_FILTER_BY_SUPPLIER` | When looking up the last purchase price, restrict to invoices of the same supplier. | on (unset = filter) | Off: any supplier's last price is used. | Same |
| `DATE_TXN_LOGIC` — "Transaction Date Logic" | Which date becomes the transaction date at FINAL: `USE_FINAL` (Finalized Date), `USE_CREATED`, `USE_UPDATED`, `USE_DATE_TXN` (keep the keyed date). | `ADJUSTED` (stored default; behaves as keyed date) | Sent with the FINAL request; only applies when the header's *use transaction date* flag is off. | Same |
| `PURCHASE_RETURN_DETAILS_TAB_ORDER` | Drag-and-drop order of the 14 edit tabs. | code order | Re-orders for everyone. | Same |

{{< figure src="/images/internal-purchase-return-applet/settings-default-selection.png" alt="Default Selection settings" caption="Settings → Default Selection." >}}

**Settings → Application Settings** (shared field-configuration screen; toggles labelled by key, default off). Keys this applet reads:

| Group | Keys | What they control |
|---|---|---|
| Listing | `DEFAULT_POSTING_STATUS`, `DEFAULT_STATUS`, `DEFAULT_TRANSACTION_DATE`, `SORT_ORDER`, `FUZZY_SEARCH_COLUMNS`, `DISABLE_GEN_DOC_LISTING`, `PRINTABLE`, `ENABLE_AUTO_POPUP` | Default filters, sort, fuzzy search, default printable format, PDF pop-up after FINAL. |
| Menus and buttons | `HIDE_FILE_EXPORT_MENU`, `HIDE_GENDOC_FINAL_BUTTON`, `HIDE_GENDOC_VOID_BUTTON`, `HIDE_GENDOC_DISCARD_BUTTON`, `HIDE_GENDOC_SAVE_BUTTON` | Restored per user by `SHOW_FILE_EXPORT_MENU`, `SHOW_GENDOC_FINAL_BUTTON`, `SHOW_GENDOC_VOID_BUTTON`, `SHOW_GENDOC_DISCARD_BUTTON`. |
| Search tab | `HIDE_SEARCH_BY_SUPPLIER`, `HIDE_SEARCH_BY_GRN`, `SHOW_SEARCH_BY_PURCHASE_INVOICE_NO_STOCK_IN`, `SHOW_INVOICES_FROM`, `HIDE_PRICE_LISTING`, `HIDE_RETURN_PRICE_LISTING`, `WARN_EXCESS_RETURN_QUANTITY` | Which search sub-tabs appear, how far back invoices are listed, whether price columns show in the source-line grids, and whether over-returning is blocked. |
| Header fields | `HIDE_SERVER_DOC_1..3`, `HIDE_CLIENT_DOC_TYPE`, `HIDE_CLIENT_DOC_1..5`, `HIDE_LOCATION`, `HIDE_CREDIT_TERMS`, `HIDE_REASON`, `HIDE_REFERENCE`, `HIDE_REMARKS`, `MANDATORY_REMARKS_FIELD`, `HIDE_CURRENCY`, `HIDE_BASE_CURRENCY`, `SHOW_FOREX_DATA_SOURCE`, `CANNOT_EDIT_CURRENCY_RATE`, `HIDE_CREATED_BY_DETAILS`, `HIDE_EXTERNAL_QUOTATION`, `HIDE_EXTERNAL_ORDER`, `HIDE_EXTERNAL_DELIVERY_ORDER`, `HIDE_EXTERNAL_INVOICE`, `HIDE_EXTERNAL_OTHERS`, `ENABLE_EMPLOYEE_LOGIN_AUTO_DETECTION`, `WORKFLOW_PROCESS_GUID`, `DEFAULT_CURRENCY`, `DEFAULT_DECIMAL_PRECISION` | Main Details visibility; mandatory remarks; purchaser auto-fill; workflow attached to new documents. |
| Account tab | `ENABLE_SELECT_MODE`, `ENABLE_BRANCH_FILTER`, `HIDE_SUPPLIER_CODE`, `HIDE_PHONE_NUMBER`, `HIDE_EMAIL`, `HIDE_SIC_CODE_AND_BUSINESS_ACTIVITY_DESCRIPTION`, `HIDE_E_INVOICE_TAB` | Supplier picker (create/edit inline needs `ALLOW_TO_CREATE_EDIT_ACCOUNT`) and supplier sub-tabs. |
| Lines | `HIDE_QTY_BASE`, `HIDE_QTY_UOM`, `HIDE_UOM_TO_BASE_RATIO`, `HIDE_UNIT_PRICE_STD_*`, `HIDE_UNIT_PRICE_NET_*`, `HIDE_UNIT_PRICE_TXN`, `HIDE_UNIT_PRICE_TXN_UOM_INCL_TAX`, `HIDE_UNIT_DISCOUNT`, `HIDE_UNIT_DISCOUNT_UOM_EXCL_TAX`, `HIDE_AMOUNT_STD_EXCL_TAX`, `HIDE_DISCOUNT_AMOUNT_EXCL_TAX`, `HIDE_AMOUNT_NET_EXCL_TAX`, `HIDE_AMOUNT_TXN`, `HIDE_SST_VAT_GST_AMOUNT`, `HIDE_TOTAL_SST_VAT_GST_AMOUNT`, `HIDE_TOTAL_TXN_AMOUNT`, `HIDE_TAX_CONFIG_SELECTION`, `HIDE_WHT_CONFIG_SELECTION`, `HIDE_COSTING_DETAILS`, `HIDE_PRICING_DETAILS`, `HIDE_DELIVERY_DETAILS`, `HIDE_DELIVERY_INSTRUCTION`, `HIDE_ISSUE_LINK`, `HIDE_RELATED_DOCUMENTS`, `HIDE_BATCH_NUMBER`, `HIDE_BATCH_EXPIRY_DATE`, `HIDE_BATCH_ISSUE_DATE`, `HIDE_BIN_NUMBER`, `HIDE_SERIAL_NUMBER`, `HIDE_DEPARTMENT`, `ENABLE_EDITING_UNIT_PRICE_STD`, `DISABLE_EDITING_AMOUNT_TXN`, `ENABLE_ITEM_NAME_MAX_LIMIT` + `ITEM_NAME_MAX_LIMIT`, `DISABLE_ITEM_LISTING`, `SHOW_ITEM_STOCK_BALANCE` | Line grid columns and sub-panels; stock balance column in the item picker. |
| Delivery / settlement / tabs | `HIDE_DELIVERY_DETAILS_TAB`, `HIDE_DELIVERY_BRANCH`, `HIDE_DELIVERY_LOCATION`, `HIDE_SETTLEMENT_TAB`, `ENABLE_EDIT_SETTLEMENT_DATE`, `HIDE_KO_FOR_TAB`, `HIDE_DEPARTMENT_HDR_TAB`, `HIDE_ARAP_PNS`, `HIDE_ARAP_SETTLEMENT`, `HIDE_ARAP_DOC_OPEN`, `HIDE_ARAP_CONTRA`, `HIDE_ARAP_BAL` | Tab and ARAP-figure visibility; settlement date editable. |
| Layout | `VERTICAL_ORIENTATION`, `DEFAULT_ORIENTATION` | Tabs vs stacked panels. |

{{< figure src="/images/internal-purchase-return-applet/settings-application-gen-doc.png" alt="Application Settings — Gen Doc Listing" caption="Application Settings — Gen Doc Listing group." >}}

{{< figure src="/images/internal-purchase-return-applet/settings-application-search-invoices.png" alt="Application Settings — Search Invoices" caption="Application Settings — Search Invoices group (the Search-tab keys above)." >}}

{{< figure src="/images/internal-purchase-return-applet/settings-application-main-details.png" alt="Application Settings — Main Details" caption="Application Settings — Main Details group." >}}

### Document behaviour settings

| Behaviour | Where it is set | Notes |
|---|---|---|
| Return pricing | `DEFAULT_PURCHASE_RETURN_PRICING_OPTION`, `PURCHASE_RETURN_PRICE_FILTER_BY_SUPPLIER`. | Lines pulled from an invoice carry the invoice price; a known rounding case (unit price × quantity ≠ invoice line amount) can make **Add All** post a few sen less than the invoice — check the total against the source. |
| Over-return guard | `WARN_EXCESS_RETURN_QUANTITY`. | Blocks a return line whose quantity (plus serials already selected) exceeds the source line. |
| Transaction date | `DATE_TXN_LOGIC`. | See Default Selection. |
| Return reasons | *Settings → Return Reasons Settings* — Reason Code, Reason Name. | Feeds the Reason field; hide with `HIDE_REASON`. |
| Printables | *Printable Format Settings*; `PRINTABLE`; *Branch Settings → Printable Format*. | The Export tab and bulk print; the usual layout is a debit note to the supplier. |
| Workflow | *Workflow Settings* + `WORKFLOW_PROCESS_GUID`. | New documents get the process; status and resolution shown on Main Details. |
| e-Invoice | E-Invoice tab; **SELF-BILLED** bulk action; skip flags. | Purchase return is a purchase document type for e-Invoice; self-billed applies when the supplier does not issue e-Invoices. |
| Email templates | Not available in this applet (no Email Template settings page). | |
| File import | Not exposed in this applet's UI. | |
| Webhooks | *Settings → Webhook*. | |

{{< figure src="/images/internal-purchase-return-applet/settings-return-reasons.png" alt="Return Reasons Settings" caption="Settings → Return Reasons Settings." >}}

{{< figure src="/images/internal-purchase-return-applet/settings-printable-format.png" alt="Printable Format Settings" caption="Settings → Printable Format Settings." >}}

{{< figure src="/images/internal-purchase-return-applet/settings-workflow.png" alt="Workflow Settings" caption="Settings → Workflow Settings — company workflow link (Process Code, Server Doc Type, Company)." >}}

### Branch settings

| Sub-tab | What it controls |
|---|---|
| **Branch Details** | Read-only Branch Name / Code / Company; **Sales Agent** (default purchaser); **Rounding Five Cent** + rounding item; **Group Discount Item**. |
| **Default Settlement Method** | Pre-selected settlement method on the Settlement tab. |
| **Item Category Filter** | Item categories offered at this branch. |
| **Menu List** | Sidebar menus per branch. |
| **Pricing Scheme** | Branch pricing schemes. |
| **Printable Format** | Branch default printable format. |

### Feature visibility / permissions

Server-side: `INTERNAL_PURCHASE_RETURN` create / read / update / delete with targets. A role scoped to one branch must also carry the branch target, or the listing filter shows every branch (a 2026 support case).

Client-side permissions seeded for this applet:

| Group | Permission codes |
|---|---|
| Buttons / menus | `SHOW_GENDOC_FINAL_BUTTON` (seeded); `SHOW_GENDOC_DISCARD_BUTTON`, `SHOW_GENDOC_VOID_BUTTON`, `SHOW_FILE_EXPORT_MENU` are checked in code but not seeded — create them under *Client Side Permission* if needed. |
| Header | `SHOW_DOC_NO_TENANT`, `SHOW_DOC_NO_COMPANY`, `SHOW_DOC_NO_BRANCH`, `SHOW_TRANSACTION_DATE`, `SHOW_CLIENT_DOC_TYPE`, `SHOW_CLIENT_DOC_1..5` |
| Lines and pricing | `SHOW_QTY_BASE`, `SHOW_QTY_UOM`, `SHOW_UOM_TO_BASE_RATIO`, the `SHOW_UNIT_PRICE_*` set, `SHOW_UNIT_DISCOUNT`, `SHOW_UNIT_DISCOUNT_UOM_EXCL_TAX`, `SHOW_DISCOUNT_AMOUNT_EXCL_TAX`, `SHOW_AMOUNT_STD_EXCL_TAX`, `SHOW_AMOUNT_NET_EXCL_TAX`, `SHOW_AMOUNT_TXN`, `SHOW_AMOUNT_TXN_MAIN_LISTING`, `SHOW_TOTAL_TXN_AMOUNT`, `SHOW_TOTAL_SST_VAT_GST_AMOUNT`, `SHOW_TAX_CONFIG_SELECTION`, `SHOW_WHT_CONFIG_SELECTION`, `SHOW_LAST_PURCHASE_PRICE`, `SHOW_COSTING_DETAILS` |
| Account | `ALLOW_TO_CREATE_EDIT_ACCOUNT` |
| Also checked in code, not seeded | `SHOW_SERIAL_NUMBER`, `SHOW_ARAP_PNS`, `SHOW_ARAP_SETTLEMENT`, `SHOW_ARAP_DOC_OPEN`, `SHOW_ARAP_CONTRA`, `SHOW_ARAP_BAL`, `EXCLUDE_ACCOUNT_CODE_ITEM_TYPE_AT_ITEM_SEARCH` |

## Fields

### Main Details

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Branch, Location | Branch and the stock location the goods leave. | Yes | Stock balance is validated at this location. |
| Company | Owning company. | System | From the branch. |
| Purchaser | Responsible employee. | No | Auto-fill with `ENABLE_EMPLOYEE_LOGIN_AUTO_DETECTION`; branch default *Sales Agent*. |
| Doc No (Tenant / Company / Branch) | Running numbers. | System | Per `SHOW_DOC_NO_*`. |
| Transaction Date | Return date. | Yes | May be replaced at FINAL per `DATE_TXN_LOGIC`; must be in an open fiscal period. |
| Credit Terms | Supplier terms. | No | |
| Reason | Return reason from Return Reasons Settings. | No | `HIDE_REASON`. |
| Reference, Remarks | Free text. | Remarks with `MANDATORY_REMARKS_FIELD` | |
| Currency, Base Currency, Currency Rate, Forex Source | Document currency. | Currency yes | Returns keep the source invoice's currency; rate locked by `CANNOT_EDIT_CURRENCY_RATE`. |
| Client Doc Type, Client Doc 1–5; External Quotation / Order / Delivery Order / Invoice / Others | References. | No | |
| Workflow Status, Workflow Resolution | Workflow fields. | System | Shown when a workflow is attached. |

### Account

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Supplier | Entity flagged as supplier. | Yes at FINAL | Copied from the source document when the Search tab is used. |
| Entity branch, Bill To, Ship To, e-Invoice identity | Supplier details. | No | |

### Lines

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Item | Returned item. | Yes | Copied from the source line with a document link. |
| Quantity (return qty) | Units going back. | Yes | *Please Enter a valid Return Qty*; capped by the source line with `WARN_EXCESS_RETURN_QUANTITY`; FINAL checks stock at the location. |
| Serial number, batch, bin | Stock identifiers. | When the item is serialised / batched | *Please Select Serial Number*; the batch must exist at the return location. Missing serials are not highlighted in older builds. |
| Unit price, discounts, amounts | Value of the return. | Yes for non-GL items | Priced by the pricing option; standard price editable with `ENABLE_EDITING_UNIT_PRICE_STD`. |
| Tax code / %, WHT code / % | Taxes. | No | Tax posts to `INPUT_TAX`. |
| Segment, Dimension, Profit Centre, Project | Tags. | No | |
| GL code | Line GL override. | No | |
| Delivery details / instruction | Per-line delivery. | No | |
| Remarks | Line text. | No | |

### Settlement, Contra, Delivery Details, Department Hdr

| Tab | Fields | Notes |
|---|---|---|
| Settlement | Settlement method (cashbook), amount, date, remarks. | Supplier refund received; date editable with `ENABLE_EDIT_SETTLEMENT_DATE`; total settlement, document open and ARAP balance shown. |
| Contra | Target purchase invoice, amount, date. | Offsets the return against the supplier's outstanding invoices. |
| Delivery Details | Delivery branch, delivery location, address. | |
| Department Hdr | Segment, Dimension, Profit Centre, Project. | Header defaults for the journal. |

## Lifecycle and posting

| Status | Meaning | Allowed next |
|---|---|---|
| **DRAFT** | Editable; no stock, journal or ARAP. | FINAL, DISCARDED |
| **FINAL** | Posted; stock out, journal written, ARAP open. | VOID |
| **VOID** | Reversed; stock restored, reverse journal, `void_reason` stored. | none |
| **DISCARDED** | Abandoned draft. | none |

**On FINAL** the backend refuses an already-FINAL document; validates the forex rate; validates serial, batch and bin quantities and the **stock balance** at the location (*There's not enough stock for item …*); refuses a locked fiscal period; applies `DATE_TXN_LOGIC`; creates a base-currency shadow for foreign-currency returns; posts stock out (quantity signum −1, valued at the line amount); fills ARAP (`arap_pns_amount = +amount`); writes the journal; and queues the generic-document, message-template and (unless skipped) e-Invoice processors. Intercompany rules may queue a mirror Sales Return for manual confirmation.

Journal per line (amount signum **+1**, `PURCHASE` handler, return lines use `PNS_RETURN`):

| Account | Dr | Cr | Source of GL code |
|---|---|---|---|
| Creditor (`CREDITOR` / `CREDITOR_NON_TRADE`) | Net of all lines | | Company default for the supplier's AR/AP type — mandatory. |
| Purchase return (`PURCHASE_RETURN`) | | Line net amount | Header GL code → item-company `PURCHASE_RETURN` link → company default `PURCHASE_RETURN`. |
| Input tax (`INPUT_TAX`) | | Line tax amount | Company default `INPUT_TAX`. |
| Settlement method (cashbook GL) | Refund amount | | Cashbook of the settlement item (Settlement tab). |

Stock: quantity × −1 at the return location; the inventory transaction is visible on **Trace Document**.

**On VOID** the void processor posts the reverse journal and stock movement, removes the document from the e-Invoice queue and from historical aging; a FINAL document with downstream links (contra, settlement) cannot be voided until those are removed.

## Related applets

- [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/), [Purchase Invoice No Stock In (Internal)](/applets/purchase-workflow/internal-purchase-invoice-no-stock-in-applet/), [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/) — source documents for the Search tab.
- [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) — KO For source.
- [Purchase Debit Note (Internal)](/applets/purchase-workflow/internal-purchase-debit-note-applet/) — same amount sign, no stock movement.
- [Purchase Credit Note (Internal)](/applets/purchase-workflow/internal-purchase-credit-note-applet/) — opposite sign.
- [Purchase Refund Note (Internal)](/applets/purchase-workflow/internal-purchase-refund-note-applet/) — the supplier's cash refund as a document.
- [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/), [Creditor Report](/applets/finance/creditor-report-applet/) — settlement and balances.
- [Sales Return (Internal)](/applets/sales-workflow/internal-sales-return-applet/) — intercompany mirror.
- [Purchase Return Supplier Access (Internal)](/applets/purchase-workflow/internal-purchase-return-supplier-access-applet/) — supplier portal view.
- [Chart of Account](/applets/master-data/chart-of-account-applet/), [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/), [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/), [Tax Configuration](/applets/master-data/tax-configuration-applet/), [Supplier](/applets/master-data/supplier-applet-1/), [Organisation](/applets/master-data/organisation-applet/) — master data.
- [My E-Invoice Admin](/applets/e-invoice/my-e-invoice-admin-applet/) — e-Invoice queue.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| *There's not enough stock for item …* on FINAL | The return location holds less than the return quantity (often the goods were received into a different location, or the batch does not exist at this location). | Set Location (and Delivery Location) to where the stock was received, or transfer stock first; check batch / bin at that location. |
| *batch number for this item does not exist at this location* | Batch chosen from the invoice but stock sits in another location. | Same as above. |
| Return quantity refused: *Total return quantity is greater that the invoice qty* | `WARN_EXCESS_RETURN_QUANTITY` and the source line is already partly returned. | Return the remaining quantity only; check earlier returns on Doc Link. |
| Cannot find this year's invoice or item in Search By Invoice | The listing window (`SHOW_INVOICES_FROM`) or the supplier filter excludes it; or the invoice is not FINAL. | Widen the window, confirm supplier and status. |
| An item deleted from an earlier draft return does not reappear in Search | Older build kept the link after deletion. | Update the applet (fixed 2026). |
| Location resets after selecting the supplier | Older build. | Update the applet (fixed 2026 to keep the location). |
| **Add All** total is a few sen below the invoice | Line recomputed as unit price × quantity instead of the invoice line amount (open issue). | Adjust the line amount to the invoice line before FINAL. |
| Serial-number tab not highlighted although serials are missing | Older build. | Update the applet (fixed mid-2026); FINAL still refuses with a serial-quantity error. |
| Zero-priced return line | Pricing option found no price (no last purchase price / MA cost for the item). | Key the price before FINAL so the stock-out and the creditor posting carry a value. |
| Warehouse role sees every branch in the listing filter | Server-side permission target not restricted to the branch. | Fix the role's target in Permission Set / Wizard. |
| Need to change details after FINAL | FINAL locks the document. | VOID and re-create. |
| Intercompany mirror lands in the wrong location / quantity | Branch intercompany configuration maps to a different location. | Review the branch intercompany rule; a 2026 fix corrected location and quantity mapping. |
| *Supplier not linked to branch* | `ENABLE_BRANCH_FILTER` on and the supplier is not assigned to the branch. | Link the supplier to the branch in the Supplier applet. |
| `MISSING_DEFAULT_GL_CODE: CREDITOR` | No company default creditor GL. | Add it in Chart of Account. |

## Related documentation

- [Purchasing module](/modules-v2/purchasing/) and its [related applets](/modules-v2/purchasing/related-applets/)
- [MyInvois setup](/guides/einvoice-guides/myinvois-setup/) and [e-Invoice validation](/guides/einvoice-guides/einvoice-validation/)
- [Purchase Debit Note (Internal)](/applets/purchase-workflow/internal-purchase-debit-note-applet/) — the non-stock counterpart
