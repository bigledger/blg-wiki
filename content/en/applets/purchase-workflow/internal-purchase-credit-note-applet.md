---
title: "Purchase Credit Note (Internal)"
description: "Reference for the Purchase Credit Note (Internal) applet: the purchase-side note that credits a supplier's account (amount signum −1, same posting side as a purchase invoice), its screens, every configuration switch, fields, posting rules and known failure modes."
applet_code: "internal_purchase_credit_note_applet"
applet_repo: "blg-applet-wavelet-internal-purchase-credit-note-applet"
modules: [purchasing, financial-accounting, e-invoice]
related_applets:
  - internal-purchase-invoice-applet
  - internal-purchase-debit-note-applet
  - internal-purchase-return-applet
  - internal-purchase-refund-note-applet
  - internal-purchase-order-applet
  - internal-purchase-grn-applet
  - supplier-delivery-order-applet
  - internal-payment-voucher-applet
  - internal-sales-credit-note-applet
  - internal-purchase-credit-note-supplier-access-applet
  - creditor-report-applet
  - chart-of-account-applet
  - doc-item-maintenance-applet
  - tax-configuration-applet
  - supplier-applet-1
  - organisation-applet
  - my-e-invoice-admin-applet
guides:
  - /guides/einvoice-guides/myinvois-setup/
  - /guides/einvoice-guides/einvoice-validation/
sources:
  - blg-applet-wavelet-internal-purchase-credit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-credit-note-applet/src/app/app.routing.ts
  - blg-applet-wavelet-internal-purchase-credit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-credit-note-applet/src/app/models/menu-items.ts
  - blg-applet-wavelet-internal-purchase-credit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-credit-note-applet/src/app/models/applet-settings.model.ts
  - blg-applet-wavelet-internal-purchase-credit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-credit-note-applet/src/app/models/constants/applet-constants.ts
  - blg-applet-wavelet-internal-purchase-credit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-credit-note-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
  - blg-applet-wavelet-internal-purchase-credit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-credit-note-applet/src/app/components/settings-container/branch-settings/branch/branch.component.html
  - blg-applet-wavelet-internal-purchase-credit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-credit-note-applet/src/app/components/purchase-credit-note-container/purchase-credit-note-listing/purchase-credit-note-listing.component.ts
  - blg-applet-wavelet-internal-purchase-credit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-credit-note-applet/src/app/components/purchase-credit-note-container/purchase-credit-note-edit/purchase-credit-note-edit.component.ts
  - blg-applet-wavelet-internal-purchase-credit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-credit-note-applet/src/app/components/purchase-credit-note-container/purchase-credit-note-create/main-details/main-details.component.ts
  - blg-applet-wavelet-internal-purchase-credit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-credit-note-applet/src/app/components/purchase-credit-note-container/purchase-credit-note-create/import-knock-off/
  - blg-applet-wavelet-internal-purchase-credit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-credit-note-applet/src/app/app.component.ts
  - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalPurchaseCreditNoteDataConsistencyObject.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingTypeHandler.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/intercompany/IntercompanyProcessingService.java
  - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dto/erp/eInvoice/EInvoiceConstants.java
  - akaun_master.bl_applet_client_side_perm_dfn (applet code internal_purchase_credit_note_applet)
tags:
  - purchase-workflow
  - purchase-credit-note
  - internal-purchase
  - e-invoice
  - procurement
  - file-import
weight: 80
date: 2026-04-06
lastmod: 2026-09-05
draft: false
---

## Overview

The **Purchase Credit Note (Internal)** applet records a credit note on the purchase side: a document that **credits the supplier's account** in your books. Its engine document type is `INTERNAL_PURCHASE_CREDIT_NOTE` with amount signum **−1** — the same sign as a purchase invoice — so finalising one posts **Dr Purchase / Cr Creditor** and increases the supplier's outstanding balance. Accounts-payable staff use it for a supplier's additional charge that arrives after the invoice, or wherever a posted purchase invoice must be topped up without raising a second invoice.

The document carries amounts only; quantity signum is 0, so stock never moves. It can be keyed manually, built from open lines on a purchase order, purchase GRN or supplier delivery order (**KO For**), uploaded from a CSV (**File Import**), or generated by intercompany processing when a related company in the tenant finalises a **Sales Credit Note (Internal)** against your company.

{{< callout type="warning" >}}
**Direction of the posting.** In this platform the *Purchase* Credit Note sits on the **same side as a purchase invoice** (Cr Creditor — you owe more). To record a reduction of what you owe a supplier — a return credit, an overcharge, a rebate — use the [Purchase Debit Note (Internal)](/applets/purchase-workflow/internal-purchase-debit-note-applet/) (amount signum +1, Dr Creditor), or a [Purchase Return (Internal)](/applets/purchase-workflow/internal-purchase-return-applet/) when goods go back. Check the Dr/Cr table under *Lifecycle and posting* before choosing.
{{< /callout >}}

## Where it fits

| Position | Document / applet | Why |
|---|---|---|
| Module | [Purchasing](/modules/purchasing/), [Financial Accounting](/modules/financial-accounting/), [E-Invoice](/modules/e-invoice/) | Posts to the General Ledger; `INTERNAL_PURCHASE_CREDIT_NOTE` is in the platform's e-Invoice purchase-document set. |
| Upstream (knock-off) | [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/), [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/), [Supplier Delivery Order](/applets/purchase-workflow/supplier-delivery-order-applet/) | The create screen's **KO For** tab imports open lines from these three document types (`INTERNAL_PURCHASE_ORDER`, `INTERNAL_PURCHASE_GOODS_RECEIVED_NOTE`, `INTERNAL_OUTBOUND_DELIVERY_ORDER`). |
| Upstream (reference) | [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/) | The invoice the credit note relates to; link it on **Doc Link**. There is no *Search Document* tab in this applet. |
| Upstream (intercompany) | [Sales Credit Note (Internal)](/applets/sales-workflow/internal-sales-credit-note-applet/) | Intercompany processing pairs the seller's Sales Credit Note with a Purchase Credit Note in the buying company (amount signum −1, quantity signum 0). |
| Downstream | [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/) | A FINAL credit note has a negative ARAP balance, like an invoice, and is settled or contra'd by payment vouchers and purchase debit notes. |
| Downstream | [Creditor Report](/applets/finance/creditor-report-applet/) | Shows the credit note's outstanding balance against the supplier. |
| Downstream | [My E-Invoice Admin](/applets/e-invoice/my-e-invoice-admin-applet/) | Submission queue and portal status. |
| External | [Purchase Credit Note Supplier Access (Internal)](/applets/purchase-workflow/internal-purchase-credit-note-supplier-access-applet/) | The supplier-facing view of the same document type. |
| Siblings | [Purchase Debit Note (Internal)](/applets/purchase-workflow/internal-purchase-debit-note-applet/), [Purchase Return (Internal)](/applets/purchase-workflow/internal-purchase-return-applet/), [Purchase Refund Note (Internal)](/applets/purchase-workflow/internal-purchase-refund-note-applet/) | The other purchase adjustment documents. |

## Screens and menus

| Menu | Route | What it is |
|---|---|---|
| **Internal Purchase Credit Note** | `internal-purchase-credit-note` | The listing with create / edit and the FINAL, DISCARD, VOID bulk actions. |
| **Line Items** | `line-items` | A cross-document grid of every credit-note line; opens **Edit Item** with Item Details, Costing Details, Issue Link and (when the item needs them) serial, batch and bin sub-tabs. |
| **File Import** | `file-import` | CSV upload. Hidden when the `HIDE_FILE_IMPORT_MENU` setting is on and the user lacks the `SHOW_FILE_IMPORT_MENU` client-side permission. |
| **Audit Trail** | `audit-trail` | Change log of documents in this applet. |
| **Settings** | `settings/…` | Application Settings, Default Selection, Printable Format Settings, Branch Settings, Webhook, Feature Visibility, Client Side Permission, Role Pricing Scheme Link, Permission Wizard / Permission Set / User / Team / Role Permission, Release Notes, Applet Log. |
| **Personalization** | `personalization/personal-default-selection` | Per-user Default Selection. |

### Listing

{{< figure src="/images/internal-purchase-credit-note-applet/1.png" alt="Purchase Credit Note (Internal) listing with search and Create control" caption="Listing: search, filter, open a row, or start a new document." >}}

Columns include the three document numbers, external references, custom document number, posting status, branch, currency, **Self Billed ?**, supplier code and name, purchaser, reference, amount, the five ARAP figures, dates, e-Invoice billing period, client documents and the four accounting dimensions. The search box also scans line item code and item name (fixed in a 2026 change after the listing query moved lines into a sub-query). Bulk **FINAL**, **DISCARD** and **VOID** apply to the selected rows and are disabled when the selection contains a row in the wrong status. There is no bulk print, self-billed or send-email action in this applet.

### Create screen

{{< youtube dkRuP79Xa9E >}}

{{< figure src="/images/internal-purchase-credit-note-applet/2.png" alt="Create Purchase Credit Note screen showing Main Details or Account tab with header and supplier fields" caption="Create: Main Details and Account, then Line Items." >}}

{{< figure src="/images/internal-purchase-credit-note-applet/3.png" alt="Create Purchase Credit Note Line Items tab with credit lines in the grid" caption="Line Items on create." >}}

Create tabs: **Main Details**, **Account**, **Line Items**, **Payment**, **Department Hdr**, **Contra** and **KO For** (hidden by `HIDE_KO_FOR_TAB`). **KO For** has three sub-tabs — KO For Purchase GRN, KO For Purchase Order, KO For Supplier Delivery Order — each searching that document type and importing its open lines. **CREATE** saves a DRAFT; **RESET** clears the form.

### Edit screen

{{< figure src="/images/internal-purchase-credit-note-applet/4.png" alt="Open purchase credit note in edit mode with SAVE and FINAL in the header" caption="Edit: SAVE while drafting; FINAL posts." >}}

The tabs (or stacked panels when `VERTICAL_ORIENTATION` is on; **CHANGE VIEW** toggles per user) are ordered by *Settings → Default Selection → Details Tab Ordering*:

| Tab | Purpose |
|---|---|
| **Main Details** | Header, with DISCARD (draft) and VOID (FINAL) buttons. |
| **E-Invoice** | Sub-tabs Submission (with the **Skip E-Invoice** switch), Progress, Notification, Cancellation, Matched History and, when `ENABLE_IMPORT_EXPORT` is on, Import/Export. |
| **Account** | Supplier entity, Bill To, Ship To. |
| **Lines** | Same grid as Line Items on create. |
| **ARAP** | PNS, settlement, document-open, contra and balance figures. |
| **Payment** | Settlement lines. |
| **Department Hdr** | Header segment, dimension, profit centre, project. |
| **Trace Document** | Journal, cashbook, tax and inventory transactions behind a FINAL document. |
| **Contra** | Offset against the supplier's other open documents. |
| **Doc Link** | Links to and from other documents (the way to tie the note to its purchase invoice). |
| **Attachment** | Supporting files. |
| **Export** | Print with a printable format. |

{{< figure src="/images/internal-purchase-credit-note-applet/tab-main-details.png" alt="Main Details tab on an open purchase credit note showing header fields, branch, dates, and references" caption="Main Details." >}}

{{< figure src="/images/internal-purchase-credit-note-applet/tab-e-invoice.png" alt="E-Invoice tab on purchase credit note after posting" caption="E-Invoice tab after FINAL." >}}

{{< figure src="/images/internal-purchase-credit-note-applet/tab-account.png" alt="Account tab showing supplier entity details and bill-to or ship-to addresses" caption="Account — supplier, Bill To, Ship To." >}}

{{< youtube 5GJvJrqqheA >}}

{{< figure src="/images/internal-purchase-credit-note-applet/tab-lines.png" alt="Lines tab showing credit line items with item code, quantity, unit price, and amounts" caption="Lines." >}}

{{< figure src="/images/internal-purchase-credit-note-applet/tab-arap.png" alt="ARAP tab on purchase credit note for payables settlement" caption="ARAP." >}}

{{< figure src="/images/internal-purchase-credit-note-applet/tab-payment.png" alt="Payment tab on purchase credit note" caption="Payment." >}}

{{< figure src="/images/internal-purchase-credit-note-applet/tab-department-hdr.png" alt="Department Hdr tab on purchase credit note" caption="Department Hdr." >}}

{{< figure src="/images/internal-purchase-credit-note-applet/tab-trace-document.png" alt="Trace Document tab showing posting trace on purchase credit note" caption="Trace Document." >}}

{{< figure src="/images/internal-purchase-credit-note-applet/tab-contra.png" alt="Contra tab on purchase credit note" caption="Contra." >}}

{{< figure src="/images/internal-purchase-credit-note-applet/tab-doc-link.png" alt="Doc Link tab on purchase credit note for linking related documents" caption="Doc Link." >}}

{{< figure src="/images/internal-purchase-credit-note-applet/tab-attachment.png" alt="Attachment tab on purchase credit note for uploading evidence files" caption="Attachment." >}}

{{< figure src="/images/internal-purchase-credit-note-applet/tab-export.png" alt="Export tab on purchase credit note for data extracts" caption="Export." >}}

### File Import

{{< figure src="/images/internal-purchase-credit-note-applet/file-import.png" alt="File Import upload screen titled Upload The Data with Delimeter, file upload area, Sample Format, and SUBMIT" caption="File Import: choose the delimiter (COMMA or PIPE), attach the CSV, download Sample Format, SUBMIT." >}}

**Sample Format** opens a column picker: the **target fields** are always in the template and must be filled on every row; **source fields** are optional.

{{< figure src="/images/internal-purchase-credit-note-applet/file-import-sample-format-dialog.png" alt="Sample Format dialog showing source fields and target fields for CSV import" caption="Sample Format: target fields (right) are mandatory; source fields (left) are optional." >}}

| Mandatory column | Purpose |
|---|---|
| `BRANCH_CODE`, `LOCATION_CODE` | Owning branch and location. |
| `DOC_CURRENCY` | Document currency. |
| `TXN_DATE` | Transaction date, in the template's format. |
| `HDR_REF_NO` | Header reference. |
| `SETTLEMENT_OR_ITEM_CODE` | Item code (or settlement-method code for a settlement line). |
| `QTY` | Line quantity. |
| `AMOUNT_INCL_TAX` | Line amount including tax. |

Optional column groups: header (`PURCHASE_AGENT`, `CREDIT_TERMS`, `CREDIT_LIMIT`, `HDR_DESCRIPTION`, `HDR_REMARKS`, `TRACKING_ID`, `Client Doc Type`, `Client Doc 1`–`5`, `BASE_DOC_X_RATE`, `POSTING_STATUS`); supplier (`ENTITY_CODE`, `ENTITY_NAME`, `ENTITY_TYPE`, `ENTITY_ARAP_TYPE`, identity and tax numbers, `ENTITY_SKIP_EINVOICE`, `ENTITY_UPSERT`, `ENTITY_BRANCH_CODE` and its five external mapping values); billing and shipping name/email/phone/address; line detail (`ITEM_NAME`, `ITEM_DESCRIPTION`, `LINE_ITEM_NAME`, `LINE_ITEM_REMARKS`, `LINE_BRANCH_CODE`, `ITEM_TXN_TYPE`, `ITEM_TXN_CLASS`, `ITEM_SUB_ITEM_TYPE`, `ITEM_CCY_CODE`, `UOM`, `UNIT_PRICE_INCL_TAX`, `DISCOUNT_AMOUNT`, `TAX_CODE`, `TAX_AMOUNT`, `AMOUNT_TAX_GST`, serial / batch / tracking, `GL_CODE`, the four dimension codes, `LINE_TXN_DATE`, `SORT_CODE`, `ITEM_REF_NO`, `TXN_TYPE_PNS_STL_MTHD`, `STL_AMOUNT`, `TRANSACTION_NO`, `STL_REMARKS`); e-Invoice (item classification, tax type and UOM codes, `EINVOICE_SUBMISSION_TYPE`, supplier TIN / ID / SST / name / contact / address, `EINVOICE_SELF_BILLED`, billing frequency and period, `ORIGINAL_EINVOICE_REF_UUID`, and the header/line tax-exemption details and amounts added in 2026).

After **SUBMIT**, the import listing shows File Name, File Size, Format, Status, **Process Status** (DONE / FAILED), Error Message and audit columns. Open the record: **Details** has file metadata; **Checking** has one row per CSV line with **Processed** (true/false), **Validation Error** and the parsed values.

{{< figure src="/images/internal-purchase-credit-note-applet/file-import-listing-status.png" alt="File Import listing showing Process Status and Error Message columns" caption="Import listing — Process Status and Error Message." >}}

{{< figure src="/images/internal-purchase-credit-note-applet/file-import-checking-tab.png" alt="File Details Checking tab with Processed and Validation Error columns" caption="Checking tab — row-level result." >}}

## Configuration

### Before you can use it

| Prerequisite | Where | Why |
|---|---|---|
| Company, branch, location | [Organisation](/applets/master-data/organisation-applet/) | Three required header fields; the branch's `MAIN_LOCATION` fills the default location. |
| Supplier entity | [Supplier](/applets/master-data/supplier-applet-1/) | Account tab; the entity's AR/AP object type selects `CREDITOR` or `CREDITOR_NON_TRADE`. Selecting a supplier copies its currency to the header and (since mid-2026) fetches the rate. |
| Company default GL codes | [Chart of Account](/applets/master-data/chart-of-account-applet/) → company GL-code links | `CREDITOR` / `CREDITOR_NON_TRADE` mandatory; `PURCHASE` for lines without their own GL code; `INPUT_TAX` for tax lines. Missing creditor mapping → `MISSING_DEFAULT_GL_CODE`. |
| Items with a purchase GL code | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) | Line GL code → header GL code → item-company `PURCHASE` link → company default `PURCHASE` (`JournalPostingService.java` L139–L190). |
| Tax codes | [Tax Configuration](/applets/master-data/tax-configuration-applet/) | GST/SST and WHT on lines. |
| Cashbook / settlement methods | [Cashbook](/applets/master-data/cashbook-applet/) | Only for Payment-tab settlements; a settlement item without a cashbook GL fails FINAL with `MISSING_CASHBOOK` / `MISSING_GL_CODE`. |
| Fiscal period open | [General Ledger](/applets/finance/general-ledger-applet/) | FINAL refused in a `LOCK_ALL` / `LOCK_TXN` period. |
| Forex rates | [Forex](/applets/master-data/forex-applet/) | A foreign-currency document must carry a non-zero rate; SAVE is blocked at rate 0 and FINAL validates the rate against the source. |
| e-Invoice setup | [My E-Invoice Admin](/applets/e-invoice/my-e-invoice-admin-applet/) | Only when the document must be submitted; skip flags on document, branch or supplier bypass it. |
| Permissions | This applet → Settings → Permission Wizard / Client Side Permission | Server-side create/read/update/delete on `INTERNAL_PURCHASE_CREDIT_NOTE`; client-side switches below. |

### Applet settings

**Settings → Default Selection** (`default-selection`):

| Setting | What it controls | Default | Effect when changed | Who can change it |
|---|---|---|---|---|
| `DEFAULT_BRANCH` | Branch pre-selected on new documents; also stores `DEFAULT_COMPANY` and `DEFAULT_LOCATION` (branch `MAIN_LOCATION`). | none | New documents open with it; personal defaults override. | Tenant admin with the applet's Settings menu |
| `DEFAULT_LOCATION` | Location pre-selected on new documents. | none | As above. | Same |
| `PURCHASE_CREDIT_NOTE_DETAILS_TAB_ORDER` | Drag-and-drop order of the edit tabs (added in 2026, mirroring the debit-note applet). | code order | Re-orders tabs for everyone; new tabs append. | Same |

**Settings → Application Settings** (`field-settings`) is the shared field-configuration screen; toggles are labelled by key and default to *off*. Keys this applet reads:

| Group | Keys | What they control |
|---|---|---|
| Listing defaults | `DEFAULT_POSTING_STATUS`, `DEFAULT_STATUS`, `DEFAULT_TRANSACTION_DATE` (`1_day` / `1_week`), `SORT_ORDER`, `FUZZY_SEARCH_COLUMNS`, `DISABLE_GEN_DOC_LISTING` | Which documents load by default, sort column, fuzzy-search columns; `DISABLE_GEN_DOC_LISTING` stops the auto-load. |
| Menus and buttons | `HIDE_FILE_IMPORT_MENU`, `HIDE_CLONE_BUTTON`, `HIDE_GENDOC_FINAL_BUTTON`, `HIDE_GENDOC_VOID_BUTTON`, `HIDE_GENDOC_DISCARD_BUTTON`, `HIDE_GENDOC_SAVE_BUTTON`, `ENABLE_AUTO_POPUP`, `PRINTABLE` | Hide a menu or button unless a `SHOW_…` client-side permission restores it. `ENABLE_AUTO_POPUP` opens the printable PDF after FINAL and needs `PRINTABLE` (default printable-format GUID). |
| Header fields | `HIDE_TRACKING_ID`, `HIDE_PERMIT_NO`, `HIDE_CURRENCY`, `HIDE_BASE_CURRENCY`, `HIDE_CREDIT_TERMS`, `HIDE_REMARKS`, `HIDE_REFERENCE`, `HIDE_SERVER_DOC_2`, `HIDE_SERVER_DOC_3`, `HIDE_CLIENT_DOC_TYPE`, `HIDE_CLIENT_DOC_1..5`, `HIDE_EXTERNAL_QUOTATION`, `HIDE_EXTERNAL_ORDER`, `HIDE_EXTERNAL_DELIVERY_ORDER`, `HIDE_EXTERNAL_INVOICE`, `HIDE_EXTERNAL_OTHERS`, `SHOW_CUSTOM_DOC_NO`, `SHOW_FOREX_DATA_SOURCE`, `CANNOT_EDIT_CURRENCY_RATE`, `ENABLE_DUPLICATE_REFERENCE_CHECK`, `ENABLE_EMPLOYEE_LOGIN_AUTO_DETECTION`, `DEFAULT_DECIMAL_PRECISION` | Main Details visibility and behaviour: forex-source selector instead of free rate, locked rate, duplicate-reference warning, purchaser auto-fill, amount precision. The external document references are hide-only here (no mandatory flags in this applet). |
| Account tab | `HIDE_ACCOUNT_BILLING_CONTACT`, `HIDE_ACCOUNT_SHIPPING_CONTACT`, `HIDE_SUPPLIER_CODE`, `HIDE_PHONE_NUMBER`, `HIDE_EMAIL`, `HIDE_SIC_CODE_AND_BUSINESS_ACTIVITY_DESCRIPTION`, `HIDE_E_INVOICE_TAB`, `DEFAULT_CURRENCY` | Supplier picker and inline supplier edit. |
| Line fields | `HIDE_QTY_BASE`, `HIDE_QTY_UOM`, `HIDE_UOM_TO_BASE_RATIO`, `HIDE_UNIT_PRICE_STD_*`, `HIDE_UNIT_PRICE_NET_*`, `HIDE_UNIT_PRICE_TXN`, `HIDE_UNIT_PRICE_TXN_UOM_INCL_TAX`, `HIDE_UNIT_DISCOUNT`, `HIDE_UNIT_DISCOUNT_UOM_EXCL_TAX`, `HIDE_MULTI_DISCOUNT`, `HIDE_AMOUNT_STD_EXCL_TAX`, `HIDE_DISCOUNT_AMOUNT_EXCL_TAX`, `HIDE_AMOUNT_NET_EXCL_TAX`, `HIDE_AMOUNT_TXN`, `HIDE_LAST_PURCHASE_PRICE`, `HIDE_TAX_CONFIG_SELECTION`, `HIDE_WHT_CONFIG_SELECTION`, `HIDE_LINE_ITEMS_GL_CODE`, `HIDE_COSTING_DETAILS`, `HIDE_PRICING_DETAILS`, `HIDE_DELIVERY_DETAILS`, `HIDE_DELIVERY_INSTRUCTION`, `HIDE_ISSUE_LINK`, `HIDE_DOC_LINK`, `HIDE_BATCH_NUMBER`, `HIDE_BIN_NUMBER`, `HIDE_SERIAL_NUMBER`, `HIDE_DEPARTMENT`, `ENABLE_EDITING_UNIT_PRICE_STD`, `DISABLE_EDITING_AMOUNT_TXN`, `ENABLE_ITEM_NAME_MAX_LIMIT` + `ITEM_NAME_MAX_LIMIT`, `DISABLE_ITEM_LISTING` | Which price, quantity, tax and sub-panel controls appear on a line; editable standard price; locked transaction amount; item-name length cap; no auto-load of the item picker. |
| Knock-off | `HIDE_KO_FOR_TAB` | Removes the KO For tab from the create screen. |
| Department tags | `HIDE_SEGMENT`, `HIDE_DIMENSION`, `HIDE_PROFIT_CENTER`, `HIDE_PROJECT`, `MANDATORY_SEGMENT`, `MANDATORY_DIMENSION`, `MANDATORY_PROFIT_CENTER`, `MANDATORY_PROJECT` | Show or require each accounting dimension. |
| Tabs | `HIDE_DELIVERY_DETAILS_TAB`, `HIDE_MAIN_PAYMENT_TAB`, `HIDE_DEPARTMENT_HDR_TAB`, `HIDE_SETTLEMENT_TAB`, `HIDE_ARAP_PNS`, `HIDE_ARAP_SETTLEMENT`, `HIDE_ARAP_DOC_OPEN`, `HIDE_ARAP_CONTRA`, `HIDE_ARAP_BAL` | Remove tabs or individual ARAP figures. |
| Layout | `VERTICAL_ORIENTATION`, `DEFAULT_ORIENTATION`, `EXPAND_DELIVERY_DETAILS` | Tabs versus stacked panels and which panel opens expanded. |
| Payment | `ENABLE_EDIT_PAYMENT_DATE` | Settlement date may differ from the document date. |
| e-Invoice | `ENABLE_IMPORT_EXPORT` | Adds the Import/Export sub-tab to the E-Invoice tab. |

The settings interface in the applet also declares keys that the current code never reads (for example `ENABLE_PRINT_FINAL_GEN_DOC_ONLY`, `LOCK_PURCHASER_TO_CURRENT_USER`, `DISALLOW_LINE_ITEM_EDIT`, `SHOW_ITEM_STOCK_BALANCE`, `MANDATORY_REMARKS_FIELD`, `REQUIRE_VALIDITY_DATE`, `SHOW_BUDGET`); switching them has no effect in this applet.

{{< figure src="/images/internal-purchase-credit-note-applet/settings-application-gen-doc-listing.png" alt="Application Settings Gen Doc Listing tab" caption="Application Settings — Gen Doc Listing group." >}}

{{< figure src="/images/internal-purchase-credit-note-applet/settings-application-main-details.png" alt="Application Settings Main Details tab" caption="Application Settings — Main Details group." >}}

{{< figure src="/images/internal-purchase-credit-note-applet/change-view-toggle.png" alt="CHANGE VIEW toggle between horizontal tabs and vertical expansion panels" caption="CHANGE VIEW — per-user switch between tabs and expansion panels." >}}

### Document behaviour settings

| Behaviour | Where it is set | Notes |
|---|---|---|
| Posting status on create | Not configurable — new documents are DRAFT. | `DEFAULT_POSTING_STATUS` only filters the listing. |
| Transaction date on FINAL | The FINAL request's `date_txn_logic` (`USE_FINAL` / `USE_CREATED` / `USE_UPDATED`) applies when the header's *use transaction date* flag is off. | Backend rule. |
| Printable formats | *Settings → Printable Format Settings* — Format Code, Format Name, uploaded template; one marked default becomes `PRINTABLE`. *Branch Settings → Printable Format* overrides per branch. | Needed for Export and `ENABLE_AUTO_POPUP`. |
| Email templates | Not available — this applet has no Email Template settings page or SEND EMAIL action. | |
| Approval workflow | Not configurable in this applet. | |
| e-Invoice submission | E-Invoice → Submission tab; **Skip E-Invoice** switch on the document; `skip_einvoice` on branch or supplier. | Skip switch added mid-2026. |
| Webhooks | *Settings → Webhook* (shared). | |

{{< figure src="/images/internal-purchase-credit-note-applet/settings-printable-format.png" alt="Printable Format Settings for purchase credit note layout" caption="Settings → Printable Format Settings." >}}

### Branch settings

| Sub-tab | What it controls |
|---|---|
| **Branch Details** | Read-only Branch Name, Branch Code, Company; **Sales Agent** (default purchaser); **Rounding Five Cent** with rounding item; **Group Discount Item**. |
| **Default Settlement Method** | Settlement method pre-selected on the Payment tab. |
| **Item Category Filter** | Item categories the line picker offers at this branch. |
| **Menu List** | Sidebar menus shown to users at this branch. |
| **Pricing Scheme** | Pricing schemes used to derive line prices at this branch. |
| **Printable Format** | Branch default printable format. |

### Feature visibility / permissions

Server-side: `INTERNAL_PURCHASE_CREDIT_NOTE` create / read / update / delete with a target, assigned through *Permission Wizard* or *Permission Set*.

{{< youtube iitlqsVyH5g >}}

Client-side permissions defined for this applet in the platform registry:

| Permission code | Effect |
|---|---|
| `SHOW_DOC_NO_TENANT`, `SHOW_DOC_NO_COMPANY`, `SHOW_DOC_NO_BRANCH` | Show the three document numbers. |
| `SHOW_TRANSACTION_DATE` | Show the transaction date. |
| `SHOW_CLIENT_DOC_TYPE`, `SHOW_CLIENT_DOC_1..5` | Client document type and references. |
| `IPCN_HIDE_TRACKING_ID_AND_PERMIT_NO` | Hide Tracking ID and Permit No for the holder. |
| `INTERNAL_PURCHASE_CREDIT_NOTE_DISPLAY_PRICING` | Show pricing details on lines. |
| `SHOW_QTY_BASE`, `SHOW_QTY_UOM`, `SHOW_UOM_TO_BASE_RATIO` | Quantity columns. |
| `SHOW_UNIT_PRICE_STD_PRICING_SCHEME`, `SHOW_UNIT_PRICE_STD_INCL_TAX`, `SHOW_UNIT_PRICE_STD_EXCL_TAX`, `SHOW_UNIT_PRICE_STD_UOM_INCL_TAX`, `SHOW_UNIT_PRICE_STD_UOM_EXCL_TAX`, `SHOW_UNIT_PRICE_NET_EXCL_TAX`, `SHOW_UNIT_PRICE_NET_UOM_EXCL_TAX`, `SHOW_UNIT_PRICE_TXN`, `SHOW_UNIT_PRICE_TXN_UOM_INCL_TAX` | Unit-price columns. |
| `SHOW_UNIT_DISCOUNT`, `SHOW_UNIT_DISCOUNT_UOM_EXCL_TAX`, `SHOW_DISCOUNT_AMOUNT_EXCL_TAX` | Discount columns. |
| `SHOW_AMOUNT_STD_EXCL_TAX`, `SHOW_AMOUNT_NET_EXCL_TAX`, `SHOW_AMOUNT_TXN` | Amount columns. |
| `SHOW_TAX_CONFIG_SELECTION`, `SHOW_WHT_CONFIG_SELECTION` | Tax and WHT selectors. |
| `SHOW_COSTING_DETAILS` | Costing sub-panel. |
| `SHOW_DISABLE_EDITING_AMOUNT_TXN_SETTING` | Lets the holder see the *Disable editing amount* switch. |

The code additionally checks `SHOW_GENDOC_FINAL_BUTTON`, `SHOW_GENDOC_DISCARD_BUTTON`, `SHOW_GENDOC_VOID_BUTTON`, `SHOW_CLONE_BUTTON`, `SHOW_FILE_IMPORT_MENU`, `SHOW_LAST_PURCHASE_PRICE` and `SHOW_ARAP_PNS` / `SHOW_ARAP_SETTLEMENT` / `SHOW_ARAP_DOC_OPEN` / `SHOW_ARAP_CONTRA` / `SHOW_ARAP_BAL` — each restores something a `HIDE_…` setting removed. These are not seeded in the registry for this applet; create them under *Client Side Permission* before assigning.

### Personalization

*Personalization → Default Selection* stores a per-user default branch and location (within the user's permitted branches) and the single/double column preference (`DEFAULT_TOGGLE_COLUMN`); it overrides the tenant defaults for that user only.

{{< figure src="/images/internal-purchase-credit-note-applet/personalization-default-selection.png" alt="Personalization Default Selection screen" caption="Personalization → Default Selection." >}}

## Fields

### Main Details

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Company, Branch, Location | Owning entity, branch and location. | Yes | Location defaults to the branch's `MAIN_LOCATION`. No stock is posted. |
| Purchaser | Responsible employee. | No | Auto-filled with `ENABLE_EMPLOYEE_LOGIN_AUTO_DETECTION`; branch default from *Sales Agent*. |
| Doc Short Code, Doc No (Tenant / Company / Branch) | Document type and running numbers. | System | Assigned on save; shown per `SHOW_DOC_NO_*`. `SHOW_CUSTOM_DOC_NO` adds a custom number. |
| Transaction Date | Accounting date. | Yes | Open fiscal period at FINAL. |
| Credit Terms | Supplier terms in days. | No | |
| Reference, Remarks | Free text. | No | Duplicate-reference warning with `ENABLE_DUPLICATE_REFERENCE_CHECK`. |
| Permit No, Tracking ID | References. | No | Hidden by settings or `IPCN_HIDE_TRACKING_ID_AND_PERMIT_NO`. |
| Currency, Base Currency, Currency Rate, Forex Source | Document currency and rate. | Currency yes | Currency copied from the supplier; rate fetched from the forex source on selection and locked by `CANNOT_EDIT_CURRENCY_RATE`; a live/custom-rate warning is shown; SAVE is blocked when a foreign-currency rate is 0. |
| Client Doc Type, Client Doc 1–5 | Supplier's document references. | No | Per `SHOW_CLIENT_DOC_*`. |
| External Quotation / Order / Delivery Order / Invoice / Others (+ dates) | Cross-references. | No | Hide-only via `HIDE_EXTERNAL_*`. |
| Posting Status, Status | DRAFT / FINAL / VOID / DISCARDED; ACTIVE. | System | |

### Account

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Entity (Supplier) | Supplier whose account is credited. | Yes at FINAL | Must be flagged `is_supplier`; AR/AP type selects the creditor GL. Entity `skip_einvoice` bypasses submission. |
| Entity name, type, status, ID number, identity type, email, phone, currency | Supplier master data. | No | Editable inline; `HIDE_SUPPLIER_CODE`, `HIDE_PHONE_NUMBER`, `HIDE_EMAIL` hide individual fields. |
| Bill To / Ship To | Name, email, phone, address, country, state, city, postcode. | No | |

### Lines

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Item | Item or GL-code item. | Yes | GL-code items skip the numeric validators. |
| Quantity | Units. | Yes | Minimum 1; quantity signum 0 — no stock movement. |
| UOM, UOM ratio | Unit of measure. | No | |
| Unit price (std / txn / net, incl. and excl. tax) | Pricing. | Net and transaction amounts required for non-GL items | Minimum 0; standard price editable only with `ENABLE_EDITING_UNIT_PRICE_STD`; transaction amount locked by `DISABLE_EDITING_AMOUNT_TXN`. |
| Unit discount, discount amount, multi-discount | Line discounts. | No | |
| Tax code, %, amount; WHT code, %, amount | Taxes. | No | Percentages ≥ 0; tax posts to `INPUT_TAX`. |
| Branch (line) | Journal-line branch. | Yes | Defaults to header. |
| Segment, Dimension, Profit Centre, Project | Accounting tags. | Per `MANDATORY_…` | Fall back to header values. |
| GL code (line) | Overrides the purchase GL code. | No | |
| Serial, batch, bin, tracking ID | Stock references. | No | Quantity consistency validated at FINAL. |
| e-Invoice classification, tax type, UOM, tariff code, country of origin | e-Invoice line data. | For e-Invoice | |
| Remarks | Line text. | No | Journal-line description. |

### Payment, Department Hdr, Contra

| Tab | Fields | Notes |
|---|---|---|
| Payment | Settlement method, amount, date, remarks. | Date editable only with `ENABLE_EDIT_PAYMENT_DATE`. |
| Department Hdr | Segment, Dimension, Profit Centre, Project. | Header defaults for every journal line. |
| Contra | Target document, contra amount, date. | Offsets against the supplier's open documents of the opposite sign. |

## Lifecycle and posting

| Status | Meaning | Allowed next |
|---|---|---|
| **DRAFT** | Editable; no journal, no ARAP. | FINAL, DISCARDED |
| **FINAL** | Posted; header locked. | VOID |
| **VOID** | Reversed; `void_reason` stored. | none |
| **DISCARDED** | Abandoned draft. | none |

**On FINAL** the backend refuses an already-FINAL document, validates the forex rate, serial / batch / bin quantities and the fiscal period (`FISCAL_PERIOD_LOCKED`), creates a base-currency **shadow** document for foreign-currency notes, fills ARAP (`arap_pns_amount = −amount` per `PNS` line — the payable side), posts the journal and queues the generic-document, message-template and (unless skipped) e-Invoice processors.

Journal per line (amount signum **−1**, `PURCHASE` handler):

| Account | Dr | Cr | Source of GL code |
|---|---|---|---|
| Purchase / expense (`PURCHASE`) | Line net amount | | Line GL code → header GL code → item-company `PURCHASE` link → company default `PURCHASE`. |
| Input tax (`INPUT_TAX`) | Line tax amount | | Company default `INPUT_TAX`. |
| Creditor (`CREDITOR` or `CREDITOR_NON_TRADE`) | | Net of all lines | Company default for the supplier's AR/AP type — mandatory. |
| Settlement method (cashbook GL) | Payment amount | | Cashbook of the settlement item (Payment tab only). |

Stock: none (quantity signum 0).

**On VOID** the void processor posts the reverse journal (shadow included), removes the document from the e-Invoice queue and from historical aging, and stores the reason. A FINAL document that other documents link *from* is not convertible to VOID; void the downstream document first.

## Related applets

- [Purchase Debit Note (Internal)](/applets/purchase-workflow/internal-purchase-debit-note-applet/) — the opposite-sign note (+1, Dr Creditor); use it to reduce a supplier balance.
- [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/) — same posting side; link the two on Doc Link.
- [Purchase Return (Internal)](/applets/purchase-workflow/internal-purchase-return-applet/) and [Purchase Refund Note (Internal)](/applets/purchase-workflow/internal-purchase-refund-note-applet/) — the stock-moving and cash-refund adjustments.
- [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/), [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/), [Supplier Delivery Order](/applets/purchase-workflow/supplier-delivery-order-applet/) — KO For sources.
- [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/) — settles or contras the balance.
- [Sales Credit Note (Internal)](/applets/sales-workflow/internal-sales-credit-note-applet/) — intercompany source.
- [Purchase Credit Note Supplier Access (Internal)](/applets/purchase-workflow/internal-purchase-credit-note-supplier-access-applet/) — supplier-facing counterpart.
- [Creditor Report](/applets/finance/creditor-report-applet/) — balances.
- [Chart of Account](/applets/master-data/chart-of-account-applet/), [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/), [Tax Configuration](/applets/master-data/tax-configuration-applet/), [Supplier](/applets/master-data/supplier-applet-1/), [Organisation](/applets/master-data/organisation-applet/) — master data.
- [My E-Invoice Admin](/applets/e-invoice/my-e-invoice-admin-applet/) — e-Invoice queue.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| FINAL fails with `MISSING_DEFAULT_GL_CODE: CREDITOR` (or `CREDITOR_NON_TRADE`) | No company default GL-code link for the supplier's AR/AP type. | Add the link in Chart of Account, then FINAL again. |
| FINAL fails with `MISSING_CASHBOOK` / `MISSING_GL_CODE: STL_MTHD [code]` | A Payment line uses a settlement item with no cashbook or GL. | Map the settlement item, or remove the line. |
| *The selected date falls within a locked fiscal period* | Date in a locked period. | Change the date or reopen the period. |
| SAVE blocked on a foreign-currency document | Currency rate is 0. | Refresh the rate from the forex source or key a rate; the header shows whether a live or custom rate is in use. |
| Currency changed after picking the supplier but the rate did not | Older builds required a manual refresh. | Update the applet (auto-fetch on supplier selection added 2026) or click the refresh icon. |
| Line total shows a negative amount | The listing and grids display amounts multiplied by the −1 signum. | Display-only; a 2026 fix removed the sign from the Lines total. |
| Supplier balance went **up** after FINAL | Expected — amount signum −1 (Cr Creditor). | For a reduction, use a Purchase Debit Note (Internal) or a Purchase Return. |
| FINAL from the edit screen posted stale values | Older builds did not save before FINAL. | Update the applet; on old builds SAVE then FINAL. |
| No PDF after FINAL with `ENABLE_AUTO_POPUP` on | No default printable format — *No Default Printable Selected*. | Mark a format default in Printable Format Settings. |
| Listing search cannot find a document by item code or GL code | Fixed in 2026 when the line sub-query was made searchable. | Update the backend; search by header fields meanwhile. |
| File Import menu missing | `HIDE_FILE_IMPORT_MENU` on and no `SHOW_FILE_IMPORT_MENU` permission. | Turn the setting off or grant the permission. |
| Export from the import menu was named like a sales invoice | Naming bug in an older build. | Fixed in a 2025 release; rename the file meanwhile. |
| Import rows rejected on `AMOUNT_TAX_GST` or the tax-exemption columns; whole file rejected for an unknown column | Template changed in 2026; wrong-column check added. | Download the current Sample Format and re-map. |
| Document submitted to the tax authority although it should not be | No skip flag. | Switch **Skip E-Invoice** on the Submission tab, or set `skip_einvoice` on branch or supplier. |
| KO For tab missing on create | `HIDE_KO_FOR_TAB` on. | Turn it off in Application Settings. |

## Related documentation

- [Purchasing module](/modules/purchasing/) and its [related applets](/modules/purchasing/related-applets/)
- [MyInvois setup](/guides/einvoice-guides/myinvois-setup/) and [e-Invoice validation](/guides/einvoice-guides/einvoice-validation/)
- [Purchase Debit Note (Internal)](/applets/purchase-workflow/internal-purchase-debit-note-applet/) — the companion reference page
