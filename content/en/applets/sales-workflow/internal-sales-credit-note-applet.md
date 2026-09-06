---
title: "Sales Credit Note (Internal)"
description: "Reference for the Sales Credit Note (Internal) applet: reduce what a customer owes after invoicing, with contra and settlement, without touching stock."
applet_code: "InternalSalesCreditNote"
applet_repo: "blg-applet-wavelet-internal-sales-credit-note-applet"
modules: [financial-accounting, e-invoice]
related_applets: [internal-sales-invoice-applet, internal-sales-return-applet, internal-sales-debit-note-applet, internal-sales-refund-note-applet, internal-receipt-voucher-applet, internal-purchase-credit-note-applet, my-e-invoice-portal-applet, customer-applet, chart-of-account-applet, cashbook-applet, tax-configuration-applet, workflow-design-applet]
guides: [/guides/sales-guides/returns-exchanges-workflow/, /guides/sales-guides/credit-sales-workflow/]
sources:
  - blg-applet-wavelet-internal-sales-credit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-credit-note-applet/src/app/app.routing.ts
  - blg-applet-wavelet-internal-sales-credit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-credit-note-applet/src/app/app.component.ts
  - blg-applet-wavelet-internal-sales-credit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-credit-note-applet/src/app/models/menu-items.ts
  - blg-applet-wavelet-internal-sales-credit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-credit-note-applet/src/app/models/applet-settings.model.ts
  - blg-applet-wavelet-internal-sales-credit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-credit-note-applet/src/app/models/constants/applet-constants.ts
  - blg-applet-wavelet-internal-sales-credit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-credit-note-applet/src/app/components/settings-container/default-settings/default-settings.component.html
  - blg-applet-wavelet-internal-sales-credit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-credit-note-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
  - blg-applet-wavelet-internal-sales-credit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-credit-note-applet/src/app/components/sales-credit-note-container/sales-credit-note-create/add-line-item/add-line-item.component.ts
  - blg-applet-wavelet-internal-sales-credit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-credit-note-applet/src/app/components/sales-credit-note-container/sales-credit-note-create/add-line-item/item-details/main-details/main-details.component.ts
  - blg-applet-wavelet-internal-sales-credit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-credit-note-applet/src/app/components/sales-credit-note-container/sales-credit-note-create/line-item/line-item-create/search-item/line-search-item-listing.component.ts
  - blg-applet-wavelet-internal-sales-credit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-credit-note-applet/src/app/components/sales-credit-note-container/sales-credit-note-create/search-documents/
  - blg-applet-wavelet-internal-sales-credit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-credit-note-applet/src/app/components/sales-credit-note-container/sales-credit-note-create/settlement/
  - blg-applet-wavelet-internal-sales-credit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-credit-note-applet/src/app/components/sales-credit-note-container/sales-credit-note-edit/ (original_invoice_ref_no handling)
  - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
  - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalSalesCreditNoteDataConsistencyObject.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentTypeHandler.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingTypeHandler.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/intercompany/IntercompanyProcessingService.java
  - akaun_master.bl_applet_client_side_perm_dfn (applet code InternalSalesCreditNote)
tags:
- sales-workflow
- credit-note
- accounts-receivable
- financial-adjustment
- contra-settlement
---

## Overview

The **Sales Credit Note (Internal)** applet reduces what a customer owes after an invoice has been finalised — an overbilling, a post-sale discount, a marketplace fee, a service reversal. It is used by accounts-receivable staff. The credit sits on the customer's account until it is contra'd against an invoice or refunded through a settlement line or a Sales Refund Note. It never moves stock: for returned goods that must come back into inventory, use [Sales Return (Internal)](/applets/sales-workflow/internal-sales-return-applet/).

{{< callout type="info" >}}
Server document type `INTERNAL_SALES_CREDIT_NOTE`. Amount signum **−1**, quantity signum **0** — the backend forces every line's quantity signum to zero, which is why a credit note can carry any item type without an inventory transaction.
{{< /callout >}}

## Where it fits

| Direction | Document / applet | How it connects |
|---|---|---|
| Upstream | [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [Sales Order (Internal)](/applets/sales-workflow/internal-sales-order-applet/), [Delivery Order (Internal)](/applets/sales-workflow/internal-delivery-order-applet/), [Jobsheet (Internal)](/applets/sales-workflow/internal-jobsheet-applet/) | Searched in the **Search Document** tab to copy lines and the customer into the credit note |
| Upstream | [Customer](/applets/master-data/customer-applet/), [Chart of Account](/applets/master-data/chart-of-account-applet/), [Tax Configuration](/applets/master-data/tax-configuration-applet/) | Customer AR type, default GL codes, tax codes |
| Downstream | Contra tab | Offsets the credit against the customer's open sales invoices |
| Downstream | Settlement tab, [Sales Refund Note (Internal)](/applets/sales-workflow/internal-sales-refund-note-applet/) | Pays the credit out in cash, bank, card, cheque, voucher, points or TT |
| Downstream | [My E-Invoice Portal](/applets/e-invoice/my-e-invoice-portal-applet/) | Credit notes are an e-Invoice document type and reference the original invoice |
| Sibling | [Sales Debit Note (Internal)](/applets/sales-workflow/internal-sales-debit-note-applet/) | The opposite adjustment (increases what the customer owes) |
| Sibling | [Purchase Credit Note (Internal)](/applets/purchase-workflow/internal-purchase-credit-note-applet/) | Mirror document created in the buying company for intercompany credit notes |

### Contra vs settlement

| Aspect | Contra | Settlement |
|---|---|---|
| Purpose | Offset against the customer's open invoices | Record money actually paid back |
| Cash movement | No | Yes — posts to the settlement method's cashbook |
| Typical use | Overbilling correction, credit applied to the next invoice | Bank or cash refund, card reversal, marketplace payout |
| Posting date | The latest transaction date among the documents involved | The settlement line date |

## Screens and menus

Route root: `applets/tnt/wavelet/erp/internal-sales-credit-note-applet/`.

| Menu item | Route | What it shows |
|---|---|---|
| **Credit Note** | `internal-sales-credit-note` | Listing with advanced search; create, edit, print, email, clone |
| **Line Items** | `line-items` | One row per credit-note line, with customer columns, for reporting |
| **File Import** | `file-import` | Bulk create credit notes from a delimited file (comma or pipe) with an error-checking listing |
| **Intercompany** | `intercompany` | Queue that mirrors a FINAL credit note as a Purchase Credit Note in another company |
| **Settings** / **Personalization** | `settings/…`, `personalization/…` | Administrator and per-user configuration |

{{< figure src="/images/internal-sales-credit-note-applet/credit-note-listing.png" alt="Sales Credit Note Listing Screen" caption="Listing: status, branch, amounts, with an AG Grid status bar and an Action column for printing." >}}

{{< figure src="/images/internal-sales-credit-note-applet/listing-search-filter.png" alt="Listing Search and Filter Panel" caption="Advanced search: customer, company, branch, sales agent, posting status, date ranges, tenant/company/branch document numbers." >}}

{{< figure src="/images/internal-sales-credit-note-applet/listing-email-options.png" alt="Listing Email Options" caption="Email from the listing: billing and shipping email, billing only, or shipping only (a CC field is available)." >}}

### The create / edit form

Tabs, in the default order (re-orderable under Settings → Default Selection): **Search Document**, **Main Details**, **E-Invoice**, **Account**, **Lines**, **ARAP**, **Settlement**, **Department Hdr**, **TraceDocument**, **Contra**, **Attachments**, **Export**.

{{< figure src="/images/internal-sales-credit-note-applet/create-search-document.png" alt="Create Credit Note - Search Document Tab" caption="Search Document: pick the Sales Invoice, Sales Order, Delivery Order or Jobsheet the credit relates to." >}}

{{< figure src="/images/internal-sales-credit-note-applet/create-main-details.png" alt="Create Credit Note - Main Details Tab" caption="Main Details: branch, location, sales agent, transaction date, currency, credit terms, reference." >}}

{{< figure src="/images/internal-sales-credit-note-applet/create-account-tab.png" alt="Create Credit Note - Account Tab" caption="Account: Entity Details, Bill To, Ship To and Intercompany sub-tabs." >}}

{{< figure src="/images/internal-sales-credit-note-applet/create-select-item.png" alt="Select Item Dialog" caption="Lines: the item search is not filtered by item type; account-code (GL_CODE) items post straight to their linked GL account." >}}

{{< figure src="/images/internal-sales-credit-note-applet/create-contra-tab.png" alt="Contra Tab" caption="Contra: search the customer's open invoices for the same branch and knock the credit off against them." >}}

{{< figure src="/images/internal-sales-credit-note-applet/edit-main-details.png" alt="Edit Credit Note - Main Details" caption="A FINAL credit note: header locked, running numbers assigned." >}}

{{< figure src="/images/internal-sales-credit-note-applet/edit-account-tab.png" alt="Edit Credit Note - Account Tab" caption="A FINAL credit note: the customer entity as posted." >}}

{{< figure src="/images/internal-sales-credit-note-applet/edit-lines-tab.png" alt="Edit Credit Note - Lines Tab" caption="A FINAL credit note: the posted account-code line and transaction amount." >}}

### File import

{{< figure src="/images/internal-sales-credit-note-applet/file-import-listing.png" alt="File Import Listing" caption="File Import: uploaded files with process status; search by created-date range." >}}

{{< figure src="/images/internal-sales-credit-note-applet/file-import-upload.png" alt="File Import Upload Dialog" caption="Upload dialog with a downloadable sample; the delimiter is mandatory." >}}

{{< figure src="/images/internal-sales-credit-note-applet/file-import-details.png" alt="File Import Details" caption="Import detail: file format, process status and the per-row error messages." >}}

### Settings menu

| Settings entry | Route | Purpose |
|---|---|---|
| Application Settings | `settings/field-settings` | Shared Field Configuration screen — all hide/show and behaviour toggles |
| Default Selection | `settings/default-selection` | Default branch, default location, default language, tab order |
| Printable Format Settings | `settings/printable-format-settings` | Printable formats for `INTERNAL_SALES_CREDIT_NOTE` |
| Branch Settings | `settings/branch-settings` | Per-branch header/footer, images and PIN |
| Workflow Settings | `settings/workflow-settings` | Company ↔ workflow process link for this document type |
| Email Template | `settings/email-template` | Template code used when emailing |
| Custom Resource Bundle Configuration | `settings/translation-settings` | Relabel fields and menus (full multi-language support was added in 2026) |
| Webhook, Feature Visibility | `settings/webhook`, `settings/feature-visibility` | Event subscriptions; team access |
| Permission Set / User / Team / Role / Client-Side Permission / Permission Wizard | `settings/*-listing` | Access control |
| Release Notes, Applet Log | `settings/release-notes`, `settings/applet-log` | Version history; audit of settings changes |

{{< figure src="/images/internal-sales-credit-note-applet/settings-gen-doc-listing.png" alt="App Settings - Gen Doc Listing" caption="Application Settings → Gen Doc Listing." >}}

{{< figure src="/images/internal-sales-credit-note-applet/settings-e-invoice.png" alt="App Settings - E-Invoice" caption="Application Settings → E-Invoice: import/export tabs and the original-invoice reference field." >}}

## Configuration

### Before you can use it

| Prerequisite | Where | Why |
|---|---|---|
| Company, branch, location | [Organisation](/applets/master-data/organisation-applet/) | Header requires branch and location; set defaults under Default Selection |
| Company default GL codes `DEBTOR` / `DEBTOR_NON_TRADE`, `SALES`, `SALES_DISCOUNT`, `OUTPUT_TAX`, `FOREX_GAIN`, `FOREX_LOSS` | [Chart of Account](/applets/master-data/chart-of-account-applet/) | The credit note uses the same `SALES` posting handler as the invoice, with the signs reversed; a missing code stops posting with `MISSING_DEFAULT_GL_CODE: <code>` |
| Items to credit — either the original inventory/service items or account-code items (`txn_type = GL_CODE`) linked to the GL account you want to hit (sales discount, marketplace fee, service reversal) | [Inventory Item Maintenance](/applets/inventory-workflow/inv-item-maintenance-applet/) | An account-code item's `glcode_guid` is copied onto the line and overrides the company `SALES` default |
| Customer with AR type and open invoices | [Customer](/applets/master-data/customer-applet/) | AR type decides `DEBTOR` vs `DEBTOR_NON_TRADE`; Contra only finds invoices of the same customer |
| Settlement methods with cashbook and GL code (only if you refund from the Settlement tab) | [Cashbook](/applets/master-data/cashbook-applet/) | Otherwise `MISSING_CASHBOOK` / `MISSING_GL_CODE: STL_MTHD [code]` |
| API permissions `TNT_API_DOC_INTERNAL_SALES_CREDIT_NOTE_{CREATE,READ,UPDATE,DELETE}_TGT_GUID` | Settings → permission listings | Branch/company targets scope what a user sees |
| Workflow process (optional) | [Workflow Design](/applets/master-data/workflow-design-applet/) | Needed before *Final Button Status* means anything |

### Applet settings

**Default Selection** (`settings/default-selection`)

| Setting | Key | What it controls | Default |
|---|---|---|---|
| Default Branch | `DEFAULT_BRANCH` | Pre-fills branch (and company) | none |
| Default Location | `DEFAULT_LOCATION` | Pre-fills location | none |
| Default Language | `DEFAULT_LANGUAGE_CODE` | Language the applet opens in | tenant default |
| Details tab ordering | `SALES_CREDIT_NOTE_DETAILS_TAB_ORDER` | Drag-and-drop order of the form tabs | order listed above |

**Application Settings** (`settings/field-settings`, shared Field Configuration screen). 194 toggles from this applet's settings model appear on the screen. Off unless stated.

*Behaviour toggles*

| Section | Setting | Effect when on |
|---|---|---|
| Gen Doc Listing | `DISABLE_GEN_DOC_LISTING`, `DEFAULT_TRANSACTION_DATE`, `DEFAULT_POSTING_STATUS`, `SORT_ORDER` | Listing loads only on search; default date range, status filter and sort |
| Gen Doc Listing | `SEND_EMAIL_TO_FINAL_GEN_DOCS_ONLY` | Email button refuses drafts |
| Gen Doc Listing | `ENABLE_CREDIT_LIMIT_FILTER` | Shows the customer's available credit |
| Gen Doc Listing | `HIDE_CLONE_BUTTON` | Clone button hidden unless the user has `SHOW_GENDOC_CLONE_BUTTON` |
| Create & Print | `ENABLE_AUTO_POPUP` | Opens the printable after save |
| Doc Settings | `ENABLE_DUPLICATE_REFERENCE_CHECK` | Rejects a second credit note with the same Reference |
| Doc Settings | `ENABLE_SALES_AGENT_AUTOFILL` | Sales agent filled from the customer's default agent when the entity is selected |
| Doc Settings | `ENABLE_EMPLOYEE_LOGIN_AUTO_DETECTION` | Employee resolved from the login |
| Doc Settings | `DISABLE_LINES_FOLLOWING_HDR_SALES_AGENT` / `…_BUDGET` | Lines stop inheriting header sales agent / budget |
| Doc Settings | `CANNOT_EDIT_CURRENCY_RATE`, `SHOW_FOREX_DATA_SOURCE` | Lock the rate; show its source |
| Doc Settings | `SHOW_CUSTOM_DOC_NO` | Custom document number field |
| Workflow Selection | `FINAL_STATUS_GUID` | Workflow status applied by the Final button |
| Workflow Selection | `ENABLE_IMPORT_EXPORT` | Import and Export tabs on the form |
| Workflow Selection (E-Invoice) | `ENABLE_ORIGINAL_INVOICE_REF_FIELDS` + `ORIGINAL_INVOICE_REFERENCE_FIELD` | Shows *Original Invoice Ref No* and its column name on the E-Invoice tab and picks which invoice field is quoted: `server_doc_1` … `server_doc_5` (tenant/company/branch numbers) or `doc_reference` |
| E-Invoice | `SHOW_EMP_REF_NO`, `SHOW_API_UPLOAD` | Extra e-Invoice fields / API upload tab |
| Entity Details | `ENABLE_BRANCH_FILTER`, `ENABLE_VEHICLE_TAB` | Customer search by branch; vehicle number |
| Shipping | `SELECT_SHIPPING_ENTITY` | Ship-to may differ from bill-to |
| Lines | `SHOW_ITEM_STOCK_BALANCE` | Stock column in item search (informational — quantity signum is 0) |
| Lines | `ENABLE_EDITING_UNIT_PRICE_STD`, `DISABLE_LINE_ITEM_NAME_EDIT`, `ENABLE_ITEM_NAME_MAX_LIMIT` + `ITEM_NAME_MAX_LIMIT`, `SHOW_PACKING_DIMENSIONS`, `SHOW_BUDGET` | Line editing rules |
| Line Permission | `DISALLOW_SELL_BELOW_MIN_PRICE` / `…_REPLACEMENT_PRICE` / `…_MA_COST`, `DISALLOW_SELL_ABOVE_UNIT_PRICE_STD_INCL_TAX` | Price-floor checks (relevant when crediting inventory items at a price) |
| Line Permission | `DISABLE_EDITING_AMOUNT_TXN` | Transaction amount locked to price × quantity |
| Line Permission | `RESTRICT_ITEM_PRICE_EDIT_BY_TYPE` | Price editable only with the per-type `ALLOW_<TYPE>_ITEM_PRICE_EDIT` permission (the permission codes are not defined for this applet in the registry — see Troubleshooting) |
| KO For | `ENABLE_MULTIPLE_KO`, `FILTER_ITEMS_BY_REQUIRED_DELIVERY`, `ENABLE_AUTO_FINAL` | Multiple source documents; only undelivered lines; finalise immediately after knock-off |
| KO For | `ENABLE_EDIT_PAYMENT_DATE`, `ENABLE_EDIT_SETTLEMENT_FINAL`, `ENABLE_EDIT_SETTLEMENT_DATE` | Settlement lines editable, including on FINAL documents (total unchanged) |
| Credit Card | `MANDATORY_CARD_NO`, `MANDATORY_NAME`, `MANDATORY_CARD_ISSUER`, `MANDATORY_CARD_EXPIRY`, `MANDATORY_APPROVAL_CODE`, `MANDATORY_BATCH`, `MANDATORY_CARD_TYPE`, `MANDATORY_CVV` | Card fields required on a card settlement line |
| Contra | `EDIT_CONTRA_TXN_DATE`, `HIDE_DELETE_CONTRA` | Contra date editable; delete-contra hidden |
| Menus | `HIDE_FILE_IMPORT_MENU`, `HIDE_INTERCOMPANY_MENU` | Removes the sidebar item unless the user holds `SHOW_FILE_IMPORT_MENU` / `SHOW_INTERCOMPANY_MENU` (the `HIDE_PICK_PACK_QUEUE_MENU`, `HIDE_SALES_INVOICE_TEMPLATE_MENU` and `HIDE_FILE_EXPORT_MENU` toggles are shown but this applet has no such menus) |

*Hide / show and expand toggles* (cosmetic)

| Section | Toggles (`HIDE_…` unless stated) |
|---|---|
| Gen Doc Listing | `SERIAL_NUMBER`, `GENDOC_FINAL_BUTTON`, `GENDOC_DISCARD_BUTTON`, `GENDOC_VOID_BUTTON`, `GENDOC_SAVE_BUTTON`, `SEND_EMAIL_BUTTON` |
| Gen Doc Fields | `SERVER_DOC_1/2/3`, `CLIENT_DOC_TYPE`, `CLIENT_DOC_1…5`, `DESCRIPTION`, `ARAP_PNS`, `ARAP_SETTLEMENT`, `ARAP_DOC_OPEN`, `ARAP_CONTRA`, `ARAP_BAL`, `MARKETPLACE_ORDER_NO` |
| Vertical UI | `VERTICAL_ORIENTATION`, `EXPAND_*` per tab |
| Doc Settings | `PREFIX`, `GENERATE_BUTTON`, `TRACKING_ID`, `PERMIT_NO`, `CREATED_BY_DETAILS`, `SOURCE_DOC_NO`, `LOCATION`, `DELIVERY_BRANCH`, `DELIVERY_LOCATION`, `MAIN_DETAILS_SALES_AGENT`, `CRM_CONTACT`, `BASE_CURRENCY`, `CURRENCY`, `CREDIT_TERMS`, `CREDIT_LIMIT`, `DUE_DATE`, `REMARKS`, `EXTERNAL_REMARKS`, `REFERENCE`, `FOREX_HISTORY`, `MEMBER_CARD`, `SALES_LEAD` |
| E-Invoice | one `HIDE_E_INVOICE_*` per field (submission type, number, UUID, document no/type/date, billing frequency and period, tax exemption, buyer identity and address) |
| Account | `ACCOUNT_BILLING_CONTACT`, `ACCOUNT_SHIPPING_CONTACT` |
| Lines | `SALES_AGENT`, `LINE_ITEM_CLIENT_DOC_1`, all `UNIT_PRICE_*`, `UNIT_DISCOUNT*`, `QTY_BASE`, `QTY_UOM`, `UOM_TO_BASE_RATIO`, `AMOUNT_STD_EXCL_TAX`, `DISCOUNT_AMOUNT_EXCL_TAX`, `AMOUNT_NET_EXCL_TAX`, `AMOUNT_TXN`, `TAX_CONFIG_SELECTION`, `WHT_CONFIG_SELECTION`, `GROUP_DISCOUNT_PERCENTAGE`, `TOTAL_DISCOUNT_AMOUNT`, `LINE_ITEMS_GL_CODE`, `LINE_ITEMS_BRANCH`, `LINE_LISTING_TOTAL_AMOUNT`, `LINE_LISTING_TOTAL_QTY`, `LINE_LISTING_TAX_AMOUNT` |
| Department | `SEGMENT`, `DIMENSION`, `PROFIT_CENTER`, `PROJECT` |
| Line item tabs | `BIN_NUMBER`, `BATCH_NUMBER`, `COSTING_DETAILS`, `PRICING_DETAILS`, `ISSUE_LINK`, `SALES_HISTORY`, `SWAP_SERIAL_NUMBER`, `MULTI_DISCOUNT`, `DELIVERY_INSTRUCTION`, `DEPARTMENT`, `DOC_LINK`, `RELATED_DOCUMENTS`, `DELIVERY_DETAILS`, `DELIVERY_TRIPS`, `ATTACHMENT_TAB` |
| Header tabs | `SERVER_DOC_TYPE`, `DOC_SHORT_CODE_PREFIX`, `SEARCH_BY_DOCUMENT_BUTTON`, `DELIVERY_DETAILS_TAB`, `TRACE_DOCUMENT_TAB`, `DOC_LINK_TAB`, `EXPORT_TAB`, `SETTLEMENT_TAB`, `POSTING_TAB`, `DELIVERY_TRIPS_TAB`, `GROSS_PROFIT_TAB`, `SEARCH_TAB`, `COLLECTION_TAB`, `STATUS_TAB`, `EXPENSES_TAB`, `SALES_COMMISSION_TAB`, `CONVERT_TAB` |
| Credit Card | `CARD_NO`, `NAME`, `CARD_ISSUER`, `CARD_EXPIRY`, `APPROVAL_CODE`, `BATCH`, `CARD_TYPE`, `CVV` |

{{< callout type="warning" >}}
As with the Sales Invoice applet, the shared screen defaults the detailed pricing columns, tax/WHT code selection, line GL code and the four department fields to **hidden** for this applet until saved otherwise.
{{< /callout >}}

Keys in the settings model with **no UI** (ignore them): `ENABLE_CUSTOM_STATUS_*`, `INCLUDE_*` / `ENABLE_*` department and tax flags, `MANDATORY_*` department flags, `HIDE_KO_BY_*` / `HIDE_KO_FOR_*`, `SHOW_REFERENCE_MAIN_LISTING`, `SHOW_REMARKS_MAIN_LISTING`, `WORKFLOW_PROCESS_GUID`, `PRINTABLE`.

### Document behaviour settings

| Area | How it is configured |
|---|---|
| Status flow | Fixed DRAFT → FINAL → VOID; Discard deletes a draft. No custom statuses. |
| Posting at FINAL | Company `posting_final_json` include/exclude list, via the Generic Document Primary Processor — not an applet setting. |
| Workflow | Settings → Workflow Settings (Company, Process, Description) for `INTERNAL_SALES_CREDIT_NOTE`. |
| Printables | Settings → Printable Format Settings; the listing's Action column prints with the format resolved per company/branch. |
| Email | Settings → Email Template; `SEND_EMAIL_TO_FINAL_GEN_DOCS_ONLY` blocks drafts; CC supported. |
| e-Invoice | `INTERNAL_SALES_CREDIT_NOTE` is an e-Invoice document type; `skip_einvoice` follows the customer entity at FINAL; the original invoice reference is carried in `original_invoice_ref_no` / `original_invoice_ref_no_column_name` (see `ENABLE_ORIGINAL_INVOICE_REF_FIELDS`). |
| Intercompany | Intercompany menu; the processor maps `INTERNAL_SALES_CREDIT_NOTE` → `INTERNAL_PURCHASE_CREDIT_NOTE` in the target company. |

### Feature visibility / permissions

API: `TNT_API_DOC_INTERNAL_SALES_CREDIT_NOTE_{CREATE,READ,UPDATE,DELETE}_TGT_GUID`.

Client-side permissions defined for this applet (38, all `CLIENT_SIDE_PERM`):

| Group | Codes |
|---|---|
| Buttons | `SHOW_GENDOC_FINAL_BUTTON`, `SHOW_GENDOC_VOID_BUTTON`, `SHOW_GENDOC_DISCARD_BUTTON`, `SHOW_CONTRA_ADD_BUTTON` |
| Pricing and amounts | `SHOW_UNIT_PRICE_STD_PRICING_SCHEME`, `SHOW_UNIT_PRICE_STD_INCL_TAX`, `SHOW_UNIT_PRICE_STD_EXCL_TAX`, `SHOW_UNIT_PRICE_STD_UOM_INCL_TAX`, `SHOW_UNIT_PRICE_STD_UOM_EXCL_TAX`, `SHOW_UNIT_PRICE_NET_EXCL_TAX`, `SHOW_UNIT_PRICE_NET_UOM_EXCL_TAX`, `SHOW_UNIT_PRICE_TXN`, `SHOW_UNIT_PRICE_TXN_UOM_INCL_TAX`, `SHOW_UNIT_DISCOUNT`, `SHOW_UNIT_DISCOUNT_UOM_EXCL_TAX`, `SHOW_AMOUNT_STD_EXCL_TAX`, `SHOW_DISCOUNT_AMOUNT_EXCL_TAX`, `SHOW_AMOUNT_NET_EXCL_TAX`, `SHOW_AMOUNT_TXN`, `SHOW_QTY_BASE`, `SHOW_QTY_UOM`, `SHOW_UOM_TO_BASE_RATIO`, `SHOW_TAX_CONFIG_SELECTION`, `SHOW_WHT_CONFIG_SELECTION`, `SHOW_COSTING_DETAILS`, `HIDE_PRICE`, `SALES_CREDIT_NOTE_DISPLAY_PRICING`, `SHOW_DISABLE_EDITING_AMOUNT_TXN_SETTING` |
| Document numbers | `SHOW_DOC_NO_TENANT`, `SHOW_DOC_NO_COMPANY`, `SHOW_DOC_NO_BRANCH`, `SHOW_CLIENT_DOC_TYPE`, `SHOW_CLIENT_DOC_1…5`, `SHOW_TRANSACTION_DATE` |

The app also looks for `SHOW_FILE_IMPORT_MENU`, `SHOW_INTERCOMPANY_MENU` and `SHOW_GENDOC_CLONE_BUTTON` to re-enable hidden menus and the clone button; these codes are read by the code but are **not** in the registry for this applet — see Troubleshooting.

## Fields

**Main Details**

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Company, Branch, Location | Issuing company/branch and location | Yes | Location is carried even though no stock moves |
| Transaction Date | Accounting date | Yes | Must be outside locked fiscal periods; PDF dates are normalised to noon UTC to avoid day shifts |
| Currency, Currency Rate | Document currency | Currency yes | Rate required and non-zero when it differs from base |
| Sales Agent | Employee credited | No | Autofill from customer with `ENABLE_SALES_AGENT_AUTOFILL` |
| Credit Terms, Credit Limit, Due Date, Reference, Remarks, External Remarks | Header attributes | No | Reference can be forced unique |
| Tenant / Company / Branch Doc No, Custom Document Number, Client Doc Type, Client Doc 1–5 | Numbering and customer references | Generated at FINAL | |

**Account**: Entity ID (required); billing and shipping contacts and addresses; Intercompany sub-tab (target company); Vehicle when enabled.

**Lines** (`txn_type = PNS`)

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Item | Any item; account-code (`GL_CODE`) items post to their linked GL account | Yes | Item search is not filtered by type |
| Quantity | Quantity credited | Yes | For `GL_CODE` items no minimum applies; other items require ≥ 0 |
| Unit price / discount / net / transaction amount, Net Amount, Net Amount with Tax | Value credited | Net and transaction amounts required | Quantity signum is forced to 0 on save |
| Tax Code, Tax Amount, WHT | Tax reversal | From item or scheme | Posts to `OUTPUT_TAX` |
| GL Code | Overrides the `SALES` default for this line | No | Filled automatically from a `GL_CODE` item |
| Batch / Bin sub-tabs | Present for parity with other documents | Batch: batch no, qty, issue and expiry date; Bin: bin code, container measure/qty, qty | No inventory effect |
| Segment, Dimension, Profit Center, Project | Department analysis | No | Hidden by default |

**E-Invoice**: as the Sales Invoice, plus **Original Invoice Ref No** and **Original Invoice Ref No Col Name** when `ENABLE_ORIGINAL_INVOICE_REF_FIELDS` is on.

**Settlement**: one line per refund — Bank Transfer, Cash, Cheque, Credit Card, Membership Point Currency, Voucher, TT Payment; date and amount (≥ 0.01) always required, plus the type-specific reference and any card fields marked mandatory.

**Contra**: select open sales invoices of the same customer and branch; the total contra is read from the header (`bl_fi_generic_doc_hdr`) rather than recomputed.

## Lifecycle and posting

| Status | Meaning | Allowed next |
|---|---|---|
| **DRAFT** | Editable, no posting | FINAL, Discard |
| **FINAL** | Numbered, posted to GL and AR; settlement editable only if the total is unchanged | VOID |
| **VOID** | Reversed with a void reason | none |

**FINAL validation** (backend, same routine as the invoice): exchange rate present when currencies differ; serial/bin/batch quantities consistent (no-ops when quantity signum is 0); transaction date and company present; date not in a locked fiscal period. Blacklist and stock-balance checks do **not** run for credit notes.

**Journal** — `SALES` posting handler with amount signum −1, so every invoice entry is reversed:

| Dr | Cr | Amount | GL code source |
|---|---|---|---|
| Sales, or the line's own GL code (account-code item) | | Net amount per line | Line `glcode_guid` → item-company GL link → company default `SALES` |
| Output tax (`OUTPUT_TAX`) | | Tax amount | Company default GL |
| | Debtor (`DEBTOR` / `DEBTOR_NON_TRADE`) | Total including tax | Company default GL, chosen by the customer's AR type |
| | Sales discount (`SALES_DISCOUNT`) | Discount lines | Company default GL |
| Debtor | Cashbook GL | Each settlement line (refund paid out) | Settlement method |

No inventory transaction is written (quantity signum 0) and no COGS entry is made.

**VOID** sets the status and reason, queues the void primary processor (reverses journal and AR), and removes the document from the e-Invoice queue.

## Related applets

- [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/) — the document being corrected; searched in Search Document and offset in Contra.
- [Sales Return (Internal)](/applets/sales-workflow/internal-sales-return-applet/) — use instead when goods physically come back.
- [Sales Debit Note (Internal)](/applets/sales-workflow/internal-sales-debit-note-applet/) — the opposite adjustment.
- [Sales Refund Note (Internal)](/applets/sales-workflow/internal-sales-refund-note-applet/) — pays out a credit balance as a separate document.
- [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/) — credit notes appear as settlement candidates when receipting.
- [Purchase Credit Note (Internal)](/applets/purchase-workflow/internal-purchase-credit-note-applet/) — intercompany mirror.
- [My E-Invoice Portal](/applets/e-invoice/my-e-invoice-portal-applet/) — submission of the credit note with its original-invoice reference.
- [Customer](/applets/master-data/customer-applet/), [Chart of Account](/applets/master-data/chart-of-account-applet/), [Cashbook](/applets/master-data/cashbook-applet/), [Tax Configuration](/applets/master-data/tax-configuration-applet/) — master data.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| Final fails with `MISSING_DEFAULT_GL_CODE: DEBTOR` (or `SALES`, `OUTPUT_TAX`) | Company default GL codes missing | Set them in [Chart of Account](/applets/master-data/chart-of-account-applet/) |
| Credit posted to the generic Sales account instead of a discount/fee account | Line used an ordinary item without a GL override | Use an account-code item linked to the right GL, or set the line GL Code (unhide `HIDE_LINE_ITEMS_GL_CODE`) |
| "The selected date falls within a locked fiscal period." | Transaction date in a closed period | Change the date or reopen the period (message text was aligned with the Sales Invoice applet) |
| Contra date resets to today after saving | Older build bug | Fixed; `EDIT_CONTRA_TXN_DATE` allows a deliberate change; the date picker enforces a configurable minimum date |
| Contra tab shows a wrong total | Older build recomputed it | Fixed: Total Contra is read from the document header |
| Line-item edit form opens empty | Race condition in price rounding on older builds | Fixed; upgrade |
| Refund line rejected with `MISSING_CASHBOOK` / `MISSING_GL_CODE: STL_MTHD [code]` | Settlement method lacks cashbook or GL | Complete it in [Cashbook](/applets/master-data/cashbook-applet/) |
| Import rows fail with a sales-agent error | Agent column value does not match an employee code | Check the sample file's column names; the error-checking listing names the offending column |
| File Import / Intercompany menu missing for one user | `HIDE_FILE_IMPORT_MENU` / `HIDE_INTERCOMPANY_MENU` on, and the `SHOW_*_MENU` client-side codes are not defined for this applet in the registry | Turn the hide setting off, or ask BigLedger to register `SHOW_FILE_IMPORT_MENU`, `SHOW_INTERCOMPANY_MENU` and `SHOW_GENDOC_CLONE_BUTTON` for `InternalSalesCreditNote` |
| `RESTRICT_ITEM_PRICE_EDIT_BY_TYPE` locks every price | The per-type `ALLOW_<TYPE>_ITEM_PRICE_EDIT` codes are not registered for this applet | Leave the toggle off, or request the codes |
| Second credit note with the same Reference rejected | `ENABLE_DUPLICATE_REFERENCE_CHECK` | Use a unique reference or turn the check off |
| PDF shows the previous day's date | Older builds converted dates at midnight | Fixed: transaction dates are forced to noon UTC for printing |

## Related documentation

- [Returns and Exchanges Workflow](/guides/sales-guides/returns-exchanges-workflow/), [Credit Sales Workflow](/guides/sales-guides/credit-sales-workflow/)
- [Financial Accounting module](/modules/financial-accounting/), [E-Invoice module](/modules/e-invoice/)
- [Sales Workflow applets](/applets/sales-workflow/)
