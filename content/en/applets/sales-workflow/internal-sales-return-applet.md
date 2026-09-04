---
title: "Sales Return (Internal)"
description: "Reference for the Sales Return (Internal) applet: bring goods back into stock, reverse the sale and the receivable, refund or contra, and link the return to the original e-Invoice."
applet_code: "internalSalesReturnApplet"
applet_repo: "blg-applet-wavelet-internal-sales-return-applet"
modules: [inventory, financial-accounting, e-invoice, pos]
related_applets: [internal-sales-invoice-applet, pos-general-applet, internal-sales-credit-note-applet, internal-sales-refund-note-applet, internal-receipt-voucher-applet, internal-purchase-return-applet, my-e-invoice-portal-applet, my-e-invoice-admin-applet, customer-applet, chart-of-account-applet, cashbook-applet, stock-balance-applet, workflow-design-applet]
guides: [/guides/sales-guides/returns-exchanges-workflow/]
sources:
  - blg-applet-wavelet-internal-sales-return-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-return-applet/src/app/app.routing.ts
  - blg-applet-wavelet-internal-sales-return-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-return-applet/src/app/app.component.ts
  - blg-applet-wavelet-internal-sales-return-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-return-applet/src/app/models/menu-items.ts
  - blg-applet-wavelet-internal-sales-return-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-return-applet/src/app/models/applet-settings.model.ts
  - blg-applet-wavelet-internal-sales-return-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-return-applet/src/app/models/constants/applet-constants.ts
  - blg-applet-wavelet-internal-sales-return-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-return-applet/src/app/components/settings-container/default-settings/default-settings.component.html
  - blg-applet-wavelet-internal-sales-return-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-return-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
  - blg-applet-wavelet-internal-sales-return-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-return-applet/src/app/components/settings-container/reason-settings-container/
  - blg-applet-wavelet-internal-sales-return-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-return-applet/src/app/components/sales-return-container/sales-return-create/ (account, line-item validators, search tabs)
  - blg-applet-wavelet-internal-sales-return-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-return-applet/src/app/components/line-items-container/line-items-edit/ (batch, bin, main-details validators)
  - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
  - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalSalesReturnDataConsistencyObject.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentTypeHandler.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingTypeHandler.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/intercompany/IntercompanyProcessingService.java
  - akaun_master.bl_applet_client_side_perm_dfn (applet code internalSalesReturnApplet)
tags:
- sales-return
- customer-returns
- refund-management
- inventory-adjustment
- workflow-approval
weight: 60
date: 2026-04-06
lastmod: 2026-09-05
draft: false
---

## Overview

The **Sales Return (Internal)** applet records goods a customer brings back after a Sales Invoice or POS cash bill. Sales or customer-service staff create it, the warehouse receives the goods against it, and finance settles it — by refund on the Payment tab, by contra against the customer's open invoices, or by a separate Sales Refund Note. On FINAL the return puts the quantity back into stock at moving-average cost, reverses the sale to the *Sales Return* account and reduces what the customer owes. If nothing physical comes back, use [Sales Credit Note (Internal)](/applets/sales-workflow/internal-sales-credit-note-applet/) instead.

{{< callout type="info" >}}
Server document type `INTERNAL_SALES_RETURN`. Amount signum **−1**, quantity signum **+1** (stock *in*). The backend names it as the return document for both `INTERNAL_SALES_INVOICE` and `INTERNAL_SALES_CASHBILL`.
{{< /callout >}}

{{< figure src="/images/internal-sales-return-applet/internal-sales-return-overview-infographic.png" alt="Sales Return (Internal) overview infographic" caption="One return document shared by sales, warehouse and finance." >}}

{{< figure src="/images/internal-sales-return-applet/the-return-journey.png" alt="The return journey from invoice to settlement" caption="The return journey." >}}

## Where it fits

| Direction | Document / applet | How it connects |
|---|---|---|
| Upstream | [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [POS General](/applets/sales-workflow/pos-general-applet/) cash bills | Searched in the **Search** tab (by customer, invoice, cash bill or serial number); lines and customer copied in; the entity is then locked |
| Upstream | [Customer](/applets/master-data/customer-applet/), [Chart of Account](/applets/master-data/chart-of-account-applet/), [Cashbook](/applets/master-data/cashbook-applet/) | Customer AR type, `SALES_RETURN` / `DEBTOR` / `OUTPUT_TAX` / `COGS` default GL codes, settlement methods |
| Downstream | Payment tab, Contra tab, [Sales Refund Note (Internal)](/applets/sales-workflow/internal-sales-refund-note-applet/), [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/) | Refund, offset or later settlement of the credit balance |
| Downstream | [My E-Invoice Portal](/applets/e-invoice/my-e-invoice-portal-applet/), [My E-Invoice Admin](/applets/e-invoice/my-e-invoice-admin-applet/) | Submission of the return against the original e-Invoice |
| Downstream | [Stock Balance](/applets/inventory-workflow/stock-balance-applet/) | Returned quantity is back at the location |
| Sibling | [Purchase Return (Internal)](/applets/purchase-workflow/internal-purchase-return-applet/) | Intercompany mirror in the buying company |

## Screens and menus

Route root: `applets/tnt/wavelet/erp/internal-sales-return-applet/`.

| Menu item | Route | What it shows |
|---|---|---|
| **Internal Sales Return** | `internal-sales-return` | Listing; create, edit, print, email, void |
| **Line Items** | `line-items` | One row per return line, with footer totals that follow the filter |
| **Intercompany** | `intercompany` | Intercompany queue (return → purchase return in another company) |
| **File Export** | `file-export` | Field-mapped exports |
| **File Import** | `file-import` | Bulk create returns from a delimited file |
| **Swap Serial Number** | `swap-serial` | Replace a serial number on a FINAL return without voiding |
| **Settings** / **Personalization** | `settings/…`, `personalization/…` | Configuration |

### The create / edit form

Tabs, in the default order (re-orderable under Default Selection): **Search**, **Main Details**, **E-Invoice**, **Account**, **Lines**, **ARAP**, **Delivery Details**, **Payment**, **Payment Adjustment**, **Department Hdr**, **TraceDocument**, **Contra**, **Doc Link**, **Attachments**, **Export**. Search is available on create; E-Invoice, ARAP, Payment Adjustment, TraceDocument, Contra and Doc Link appear once the document is saved.

| Tab | Purpose |
|---|---|
| Search | **Search By Customer**, **Search By Invoice**, **Search By Cashbill**, **Search By Serial Number**, **Search Item**. *Add Selected* / *Add All* copy the invoice lines with amounts apportioned to the returned quantity |
| Main Details | Branch, location, delivery branch/location (warns when they differ from the header), transaction date, **Reason** (from Return Reasons settings), reference, remarks, currency and rate (an inverse-rate field is shown for foreign currency) |
| Account | Entity Details, Bill To, Ship To, Intercompany; the entity is locked once lines are linked to a sales invoice |
| Lines | Returned items, quantities, prices, tax, serial / batch / bin, costing, swap serial |
| Payment | Settlement lines (refund). *Create* is available only while the document is not FINAL, VOID or DISCARDED and not locked; `ENABLE_EDIT_SETTLEMENT_FINAL` plus the `SHOW_EDIT_SETTLEMENT_FINAL` permission allow edits after FINAL |
| Contra | Select open receivable documents to offset, with totals and optional auto-settle |
| E-Invoice | Submission, Progress, Notification, Cancellation; original e-Invoice reference and UUID picker; Skip E-Invoice |

{{< figure src="/images/internal-sales-return-applet/sales-main-details-tab.png" alt="Main Details Tab - showing Branch, Location, Transaction Date, and other header fields" caption="Main Details." >}}

{{< figure src="/images/internal-sales-return-applet/sales-account-tab.png" alt="Account Tab - Entity Details showing Entity ID, Status, Entity Type, Currency, and other customer fields" caption="Account: entity details." >}}

{{< figure src="/images/internal-sales-return-applet/sales-lines-iteam-add-1.png" alt="Lines Tab - showing plus button to add line items and existing items list" caption="Lines: Create (+) to add a returned item." >}}

{{< figure src="/images/internal-sales-return-applet/sales-lines-iteam-add-2.png" alt="Select Item dialog - showing searchable list of items with Item Code, Item Name, and UOM columns" caption="Select Item." >}}

{{< figure src="/images/internal-sales-return-applet/sales-lines-iteam-add-3.png" alt="Add Item screen - Item Details showing Item Code, Item Name, Sales Agent, UOM, Pricing Scheme, Unit Price" caption="Add Item: item details, quantity, pricing and tax." >}}

{{< figure src="/images/internal-sales-return-applet/warehouse-access-finalized-returns.png" alt="Listing filtered to FINAL returns for warehouse receiving" caption="Warehouse: filter the listing to FINAL to receive goods." >}}

{{< figure src="/images/internal-sales-return-applet/finance-process-settlement-1.png" alt="Payment tab with Create button" caption="Payment tab: add a settlement line before FINAL." >}}

{{< figure src="/images/internal-sales-return-applet/finance-process-settlement-2-settelment-methods.png" alt="Add Payment dialog showing settlement groups and methods" caption="Settlement groups and methods come from the Cashbook applet." >}}

### Settings menu

| Settings entry | Route | Purpose |
|---|---|---|
| Application Settings | `settings/field-settings` | Shared Field Configuration screen (134 toggles apply) |
| Default Selection | `settings/default-selection` | Default branch, default location, tab order |
| Return Reasons | `settings/return-reasons-settings` | The **Reason** list on Main Details (Reason Code, Reason Name) |
| Printable Format Settings | `settings/printable-format-settings` | Printable formats for `INTERNAL_SALES_RETURN` |
| Branch Settings | `settings/branch-settings` | Per-branch header/footer, images, PIN |
| Workflow Settings | `settings/workflow-settings` | Company ↔ workflow process |
| Email Template | `settings/email-template` | Template used when emailing |
| Custom Resource Bundle Configuration, Custom Field Placement | `settings/translation-settings`, `settings/custom-field-placement` | Relabel; place tenant custom fields |
| Webhook, Feature Visibility | `settings/webhook`, `settings/feature-visibility` | Event subscriptions; team access |
| Permission listings, Client-Side Permission, Permission Wizard | `settings/*-listing` | Access control |
| Release Notes, Applet Log | `settings/release-notes`, `settings/applet-log` | History |

## Configuration

### Before you can use it

| Prerequisite | Where | Why |
|---|---|---|
| Company, branch, location | [Organisation](/applets/master-data/organisation-applet/) | Header requires branch and location; goods go back to the header (or delivery) location |
| Company default GL codes `SALES_RETURN`, `DEBTOR` / `DEBTOR_NON_TRADE`, `OUTPUT_TAX`, `SALES_DISCOUNT`, `COGS`, `FOREX_GAIN`, `FOREX_LOSS` | [Chart of Account](/applets/master-data/chart-of-account-applet/) | The return uses the `SALES` posting handler but its PNS lines are mapped to `SALES_RETURN`; a missing code stops posting with `MISSING_DEFAULT_GL_CODE: <code>` |
| Return reasons | Settings → Return Reasons | The Reason dropdown is empty until you add codes |
| Customer with AR type | [Customer](/applets/master-data/customer-applet/) | Decides `DEBTOR` vs `DEBTOR_NON_TRADE` |
| Settlement methods with cashbook and GL (for refunds on the Payment tab) | [Cashbook](/applets/master-data/cashbook-applet/) | Otherwise `MISSING_CASHBOOK` / `MISSING_GL_CODE: STL_MTHD [code]` |
| Serial / batch / bin tracking on the items being returned | [Inventory Item Maintenance](/applets/inventory-workflow/inv-item-maintenance-applet/) | Tracked items need matching allocations at FINAL |
| API permissions `TNT_API_DOC_INTERNAL_SALES_RETURN_{CREATE,READ,UPDATE,DELETE}_TGT_GUID` | Settings → permission listings | Branch targets scope the listing |
| E-Invoice profile (optional) | [My E-Invoice Admin](/applets/e-invoice/my-e-invoice-admin-applet/) | `skip_einvoice` is copied from the customer at FINAL; the return references the original e-Invoice |

### Applet settings

**Default Selection** (`settings/default-selection`)

| Setting | Key | What it controls | Default |
|---|---|---|---|
| Default Branch / Default Location | `DEFAULT_BRANCH`, `DEFAULT_LOCATION` | Pre-filled header | none |
| Details tab ordering | tab-order key | Order of the 15 form tabs | as listed above |

**Application Settings** (`settings/field-settings`) — behaviour toggles this applet reads (off unless stated):

| Section | Setting | Effect when on |
|---|---|---|
| Gen Doc Listing | `DISABLE_GEN_DOC_LISTING`, `DEFAULT_TRANSACTION_DATE`, `DEFAULT_POSTING_STATUS`, `SORT_ORDER` | Listing loads on search only; default date range, status filter and sort |
| Gen Doc Listing | `SEND_EMAIL_TO_FINAL_GEN_DOCS_ONLY` | Email refuses drafts |
| Gen Doc Listing | `SALES_RETURN_WITH_PAYMENT` | Return is expected to carry a settlement (refund) line; the Payment tab drives the document's open amount |
| Create & Print | `ENABLE_AUTO_POPUP` | Opens the printable after save |
| Selection Settings | `WARN_EXCESS_RETURN_QUANTITY` | Warns when the returned quantity exceeds what the source invoice line sold |
| Selection Settings | `SHOW_INVOICES_FROM` | Default *date from* filter of Search By Invoice / Cashbill |
| Doc Settings | `ENABLE_SALES_AGENT_AUTOFILL`, `ENABLE_EMPLOYEE_LOGIN_AUTO_DETECTION`, `CANNOT_EDIT_CURRENCY_RATE`, `SHOW_FOREX_DATA_SOURCE` | As in the Sales Invoice applet |
| Workflow Selection | `FINAL_STATUS_GUID` | Workflow status set by the Final button |
| Entity Details | `ENABLE_BRANCH_FILTER` | Customer search scoped by branch |
| Lines | `ENABLE_EDITING_UNIT_PRICE_STD`, `ENABLE_ITEM_NAME_MAX_LIMIT` + `ITEM_NAME_MAX_LIMIT` | Line editing rules |
| Line Permission | `WARN_ZERO_UNIT_PRICE_BEFORE_ADD`, `DISABLE_EDITING_AMOUNT_TXN` | Zero-price prompt; locked transaction amount |
| Payment | `ENABLE_EDIT_PAYMENT_DATE`, `ENABLE_EDIT_SETTLEMENT_FINAL`, `ENABLE_EDIT_SETTLEMENT_DATE` | Settlement lines editable, including after FINAL (total unchanged) |
| Contra | `EDIT_CONTRA_TXN_DATE`, `CONTRA_DATE_SAME_AS_DOC_DATE_TXN` | Contra date editable / forced to the return's transaction date instead of the latest document date |
| Credit Card | `MANDATORY_CARD_NO`, `MANDATORY_NAME`, `MANDATORY_CARD_ISSUER`, `MANDATORY_CARD_EXPIRY`, `MANDATORY_APPROVAL_CODE`, `MANDATORY_BATCH`, `MANDATORY_CARD_TYPE`, `MANDATORY_CVV` | Card fields required on a card refund line |
| Menus | `HIDE_INTERCOMPANY_MENU`, `HIDE_FILE_EXPORT_MENU`, `HIDE_SWAP_SERIAL_NUMBER_MENU` | Remove the sidebar item unless the user holds `SHOW_INTERCOMPANY_MENU` / `SHOW_FILE_EXPORT_MENU` / `SHOW_SWAP_SERIAL_NUMBER` |

*Hide / show and expand toggles* (cosmetic; `HIDE_…` unless stated):

| Section | Toggles |
|---|---|
| Gen Doc Listing | `GENDOC_FINAL_BUTTON`, `GENDOC_DISCARD_BUTTON`, `GENDOC_VOID_BUTTON`, `GENDOC_SAVE_BUTTON` |
| Gen Doc Fields | `SERVER_DOC_1/2/3`, `CLIENT_DOC_TYPE`, `CLIENT_DOC_1…5`, `DESCRIPTION`, `ARAP_PNS`, `ARAP_SETTLEMENT`, `ARAP_DOC_OPEN`, `ARAP_CONTRA`, `ARAP_BAL` |
| Vertical UI | `VERTICAL_ORIENTATION`, `EXPAND_*` per tab |
| Doc Settings | `TRACKING_ID`, `PERMIT_NO`, `REASON`, `CREATED_BY_DETAILS`, `LOCATION`, `DELIVERY_BRANCH`, `DELIVERY_LOCATION`, `MAIN_DETAILS_SALES_AGENT`, `BASE_CURRENCY`, `CURRENCY`, `CREDIT_TERMS`, `CREDIT_LIMIT`, `DUE_DATE`, `REMARKS`, `REFERENCE`, `MEMBER_CARD` |
| Search | `SEARCH_TAB`, `SEARCH_BY_CUSTOMER`, `SEARCH_BY_CASHBILL` |
| Lines | `SALES_AGENT`, all `UNIT_PRICE_*` and `UNIT_DISCOUNT*` columns, `QTY_BASE`, `QTY_UOM`, `UOM_TO_BASE_RATIO`, `AMOUNT_STD_EXCL_TAX`, `DISCOUNT_AMOUNT_EXCL_TAX`, `AMOUNT_NET_EXCL_TAX`, `AMOUNT_TXN`, `TAX_CONFIG_SELECTION`, `WHT_CONFIG_SELECTION`, `TOTAL_DISCOUNT_AMOUNT` |
| Line item tabs | `BIN_NUMBER`, `BATCH_NUMBER`, `BATCH_ISSUE_DATE`, `BATCH_EXPIRY_DATE`, `COSTING_DETAILS`, `SWAP_SERIAL_NUMBER`, `DOC_LINK`, `RELATED_DOCUMENTS`, `ATTACHMENT_TAB` |
| Header tabs | `DELIVERY_DETAILS_TAB`, `TRACE_DOCUMENT_TAB`, `DOC_LINK_TAB`, `EXPORT_TAB`, `SETTLEMENT_TAB` |
| Credit Card | `CARD_NO`, `NAME`, `CARD_ISSUER`, `CARD_EXPIRY`, `APPROVAL_CODE`, `BATCH`, `CARD_TYPE`, `CVV` |

Keys in the model with no UI: `DEFAULT_DELIVERY_BRANCH`, `DEFAULT_DELIVERY_LOCATION`, `DEFAULT_ORIENTATION`, `DEFAULT_TOGGLE_COLUMN`, `ENABLE_CUSTOM_STATUS_*`, department/tax `INCLUDE_*` / `ENABLE_*` flags, `WORKFLOW_PROCESS_GUID`, `PRINTABLE`.

### Document behaviour settings

| Area | How it is configured |
|---|---|
| Status flow | DRAFT → FINAL → VOID; Discard on a draft. |
| Posting at FINAL | Company `posting_final_json` include/exclude list via the Generic Document Primary Processor. |
| Workflow | Settings → Workflow Settings for `INTERNAL_SALES_RETURN`; `FINAL_STATUS_GUID`. |
| Printables | Settings → Printable Format Settings. |
| Email | Settings → Email Template; `SEND_EMAIL_TO_FINAL_GEN_DOCS_ONLY`. For intercompany returns the recipient billing/shipping email is filled from the target company. |
| e-Invoice | `INTERNAL_SALES_RETURN` is an e-Invoice document type. On the saved return, E-Invoice → Submission holds **Original E-invoice Ref No**, **Original E-invoice Ref UUID** (picker *Select E-invoice Main Doc Ref No*) and **Document Date**; **Skip E-Invoice** is available. TIN validation follows the API response. Queues, validation and cancellation run in My E-Invoice Admin / Portal. |
| Intercompany | Intercompany menu; mapping `INTERNAL_SALES_RETURN` ↔ `INTERNAL_PURCHASE_RETURN`. |

### Feature visibility / permissions

API: `TNT_API_DOC_INTERNAL_SALES_RETURN_{CREATE,READ,UPDATE,DELETE}_TGT_GUID`.

Client-side permissions registered for this applet (45):

| Group | Codes |
|---|---|
| Buttons | `SHOW_GENDOC_FINAL_BUTTON`, `SHOW_GENDOC_VOID_BUTTON`, `SHOW_GENDOC_DISCARD_BUTTON`, `SHOW_EDIT_SETTLEMENT_FINAL` (edit payment after FINAL), `SHOW_SWAP_SERIAL_NUMBER` (Swap Serial tab in the line listing) |
| Pricing and amounts | `SHOW_UNIT_PRICE_STD_PRICING_SCHEME`, `SHOW_UNIT_PRICE_STD_INCL_TAX`, `SHOW_UNIT_PRICE_STD_EXCL_TAX`, `SHOW_UNIT_PRICE_STD_UOM_INCL_TAX`, `SHOW_UNIT_PRICE_STD_UOM_EXCL_TAX`, `SHOW_UNIT_PRICE_NET_EXCL_TAX`, `SHOW_UNIT_PRICE_NET_UOM_EXCL_TAX`, `SHOW_UNIT_PRICE_TXN`, `SHOW_UNIT_PRICE_TXN_UOM_INCL_TAX`, `SHOW_UNIT_DISCOUNT`, `SHOW_UNIT_DISCOUNT_UOM_EXCL_TAX`, `SHOW_AMOUNT_STD_EXCL_TAX`, `SHOW_DISCOUNT_AMOUNT_EXCL_TAX`, `SHOW_AMOUNT_NET_EXCL_TAX`, `SHOW_AMOUNT_TXN`, `SHOW_QTY_BASE`, `SHOW_QTY_UOM`, `SHOW_UOM_TO_BASE_RATIO`, `SHOW_TAX_CONFIG_SELECTION`, `SHOW_WHT_CONFIG_SELECTION`, `SHOW_COSTING_DETAILS`, `SALES_RETURN_DISPLAY_PRICING`, `SHOW_DISABLE_EDITING_AMOUNT_TXN_SETTING` |
| ARAP columns | `SHOW_ARAP_PNS`, `SHOW_ARAP_SETTLEMENT`, `SHOW_ARAP_DOC_OPEN`, `SHOW_ARAP_CONTRA`, `SHOW_ARAP_BAL` |
| Document numbers | `SHOW_DOC_NO_TENANT`, `SHOW_DOC_NO_COMPANY`, `SHOW_DOC_NO_BRANCH`, `SHOW_CLIENT_DOC_TYPE`, `SHOW_CLIENT_DOC_1…5`, `SHOW_DESCRIPTION`, `SHOW_TRANSACTION_DATE` |

The app also reads `SHOW_INTERCOMPANY_MENU` and `SHOW_FILE_EXPORT_MENU`, which are not registered for this applet (see Troubleshooting).

## Fields

**Main Details**

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Company, Branch, Location | Receiving branch and stock location | Yes | Delivery Branch / Location shown when enabled; a warning appears if they differ from the header |
| Transaction Date | Return date | Yes | Locked-period check at FINAL |
| Reason | Return reason code | No | List maintained under Settings → Return Reasons |
| Currency, Currency Rate, Inverse Rate | Document currency | Currency yes | Rate copied from the source invoice on knock-off; lockable |
| Sales Agent | Employee credited | No | Autofill from customer |
| Reference, Remarks, Credit Terms, Credit Limit, Due Date, Tracking ID, Permit No, Member Card | Header attributes | No | Use Reference for the original invoice number when Search is not used |

**Account**: Entity ID (required); billing and shipping contacts and addresses (edits persist on save); Intercompany. The entity cannot be changed once lines are linked to a sales invoice.

**Lines** (`txn_type = PNS`)

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Item | Returned item | Yes | From the source invoice line or item search |
| Quantity, UOM | Returned quantity | Yes | Quantity signum +1 is filled by the backend; `WARN_EXCESS_RETURN_QUANTITY` compares with the sold quantity |
| Unit Price STD / Net, discount, Net Amount, Net Amount with Tax, Transaction Amount | Value credited | Net and transaction amounts required | A manually changed price is kept on edit (no longer reset to the pricing scheme) |
| Tax Code, Tax Amount | Tax reversal | From item or scheme | Posts to `OUTPUT_TAX` |
| Serial Number, Batch Number (batch no, qty, issue and expiry date), Bin Number (bin code, container measure / qty, qty) | Allocations for tracked items | Match line quantity at FINAL | Swap Serial available on FINAL documents |
| Costing Details | MA cost used for the stock-in | Read-only | |

**Payment**: settlement group and method, date, amount (≥ 0.01), plus type-specific references and any card fields marked mandatory. **Contra**: select open receivable documents; contra date is the latest document date unless `CONTRA_DATE_SAME_AS_DOC_DATE_TXN` is on.

## Lifecycle and posting

| Status | Meaning | Allowed next |
|---|---|---|
| **DRAFT** | Editable; no stock or GL effect | FINAL, Discard |
| **FINAL** | Numbered; stock received; journal and AR posted; Payment editable only with `ENABLE_EDIT_SETTLEMENT_FINAL` + permission | VOID |
| **VOID** | Reversed with a void reason | none |

**FINAL validation** (backend): exchange rate when currencies differ; serial, bin and batch quantities match the line quantity; transaction date and company present; date not in a locked fiscal period. (Blacklist and stock-balance checks do not apply — the movement is inbound.)

**What FINAL does**: generates running numbers; copies `skip_einvoice` from the customer; queues the primary processor (inventory, journal, AR, cashbook per company `posting_final_json`); queues the message-template (email) processor.

**Journal** — `SALES` handler, amount signum −1, PNS lines mapped to `SALES_RETURN`:

| Dr | Cr | Amount | GL code source |
|---|---|---|---|
| Sales Return (`SALES_RETURN`), or the line's own GL code | | Net amount per line | Line `glcode_guid` → item-company GL link → company default |
| Output tax (`OUTPUT_TAX`) | | Tax amount | Company default GL |
| | Debtor (`DEBTOR` / `DEBTOR_NON_TRADE`) | Total including tax | Company default GL by customer AR type |
| Stock | Cost of goods sold (`COGS`) | Moving-average cost × quantity | Item stock account and company default `COGS` |
| Debtor | Cashbook GL | Each Payment-tab (refund) line | Settlement method |

**Stock**: each PNS line writes an inventory transaction with quantity × +1 at the return's branch and location; serial numbers and batches are re-activated at that location.

**VOID** sets the status and reason, queues the void primary processor (reverses stock, journal and AR) and removes the return from the e-Invoice queue; the void error message names the e-Invoice state when a submitted return cannot be voided.

## Related applets

- [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [POS General](/applets/sales-workflow/pos-general-applet/) — the documents being returned against.
- [Sales Credit Note (Internal)](/applets/sales-workflow/internal-sales-credit-note-applet/) — financial-only correction without stock.
- [Sales Refund Note (Internal)](/applets/sales-workflow/internal-sales-refund-note-applet/), [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/) — settle the credit balance later.
- [Purchase Return (Internal)](/applets/purchase-workflow/internal-purchase-return-applet/) — intercompany mirror.
- [My E-Invoice Portal](/applets/e-invoice/my-e-invoice-portal-applet/), [My E-Invoice Admin](/applets/e-invoice/my-e-invoice-admin-applet/) — submission against the original e-Invoice; cancellation windows.
- [Stock Balance](/applets/inventory-workflow/stock-balance-applet/) — where the returned quantity reappears.
- [Customer](/applets/master-data/customer-applet/), [Chart of Account](/applets/master-data/chart-of-account-applet/), [Cashbook](/applets/master-data/cashbook-applet/), [Workflow Design](/applets/master-data/workflow-design-applet/) — master data and workflow.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| Final fails with `MISSING_DEFAULT_GL_CODE: SALES_RETURN` (or `DEBTOR`, `OUTPUT_TAX`, `COGS`) | Company default GL codes missing | Set them in [Chart of Account](/applets/master-data/chart-of-account-applet/) |
| Reason dropdown is empty | No return reasons configured | Settings → Return Reasons |
| Lines copied from Search By Invoice show zero amounts | The source invoice line was saved with a zero standard amount, or an older build did not apportion amounts | Fixed: Add Selected / Add All now copy and apportion amounts; check the source invoice line |
| Cannot select the invoice: entity or branch does not match | Search By Invoice checks that the invoice's customer and branch match the return header | Set the header branch and customer to match, or start from Search |
| Entity ID cannot be changed | Lines are linked to a sales invoice | Remove the linked lines first, or create a new return |
| Edit line resets the price you typed | Older build bug | Fixed; upgrade |
| Customer name blank on the listing | Older build bug | Fixed |
| Contra date not what you expected | Contra uses the latest document date unless `CONTRA_DATE_SAME_AS_DOC_DATE_TXN` | Set the toggle, or `EDIT_CONTRA_TXN_DATE` |
| Cannot add a Payment line | Document is FINAL/VOID/DISCARDED or locked | Add settlement before FINAL, or enable `ENABLE_EDIT_SETTLEMENT_FINAL` and grant `SHOW_EDIT_SETTLEMENT_FINAL` |
| Void refused with an e-Invoice message | The return has already been submitted to LHDN | Cancel through [My E-Invoice Admin](/applets/e-invoice/my-e-invoice-admin-applet/) within the allowed window, then void |
| Intercompany or File Export menu missing for one user | `HIDE_*_MENU` on and the `SHOW_*_MENU` codes are not registered for this applet | Turn the hide off or request the codes |
| Batch Issue / Expiry date required on the batch tab | Tenant does not track batch dates | Hide them with `HIDE_BATCH_ISSUE_DATE` / `HIDE_BATCH_EXPIRY_DATE` (added for this applet) |
| Returned quantity larger than sold | `WARN_EXCESS_RETURN_QUANTITY` off | Turn it on; the warning is advisory |

## Related documentation

- [Returns and Exchanges Workflow](/guides/sales-guides/returns-exchanges-workflow/)
- [Inventory module](/modules-v2/inventory/), [Financial Accounting module](/modules-v2/financial-accounting/), [E-Invoice module](/modules-v2/e-invoice/), [POS module](/modules-v2/pos/)
- [Sales Workflow applets](/applets/sales-workflow/)
