---
title: "Payment Voucher (Internal)"
description: "Record money paid out to suppliers and other payees, settle open purchase invoices by contra, capture expenses paid directly, and post the cashbook and creditor entries."
applet_code: "internal-payment-voucher-applet"
applet_repo: "blg-applet-wavelet-internal-payment-voucher-applet"
modules: [financial-accounting, purchasing]
related_applets:
  - internal-purchase-invoice-applet
  - internal-purchase-debit-note-applet
  - internal-purchase-credit-note-applet
  - internal-receipt-voucher-applet
  - bank-reconciliation-applet
  - cashbook-applet
  - supplier-applet-1
  - chart-of-account-applet
  - organisation-applet
  - ledger-and-journal-applet
  - creditor-report-applet
  - statement-of-account-applet
guides:
  - /guides/purchasing-guides/standard-procurement-workflow/
  - /guides/accounting-guides/bank-reconciliation-guide/
sources:
  - blg-applet-wavelet-internal-payment-voucher-applet/micro-fe/projects/wavelet-erp/applets/internal-payment-voucher-applet/src/app/models/applet-settings.model.ts
  - blg-applet-wavelet-internal-payment-voucher-applet/micro-fe/projects/wavelet-erp/applets/internal-payment-voucher-applet/src/app/models/menu-items.ts
  - blg-applet-wavelet-internal-payment-voucher-applet/micro-fe/projects/wavelet-erp/applets/internal-payment-voucher-applet/src/app/models/constants/applet-constants.ts
  - blg-applet-wavelet-internal-payment-voucher-applet/micro-fe/projects/wavelet-erp/applets/internal-payment-voucher-applet/src/app/app.routing.ts
  - blg-applet-wavelet-internal-payment-voucher-applet/micro-fe/projects/wavelet-erp/applets/internal-payment-voucher-applet/src/app/app.component.ts
  - blg-applet-wavelet-internal-payment-voucher-applet/micro-fe/projects/wavelet-erp/applets/internal-payment-voucher-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
  - blg-applet-wavelet-internal-payment-voucher-applet/micro-fe/projects/wavelet-erp/applets/internal-payment-voucher-applet/src/app/components/internal-payment-voucher-container/internal-payment-voucher-create/main-details/main-details.component.ts
  - blg-applet-wavelet-internal-payment-voucher-applet/micro-fe/projects/wavelet-erp/applets/internal-payment-voucher-applet/src/app/components/internal-payment-voucher-container/internal-payment-voucher-edit/internal-payment-voucher-edit.component.ts
  - blg-applet-wavelet-internal-payment-voucher-applet/micro-fe/projects/wavelet-erp/applets/internal-payment-voucher-applet/src/app/components/internal-payment-voucher-container/internal-payment-voucher-listing/internal-payment-voucher-listing.component.ts
  - blg-shared-utilities/modules/branch-settings/branch-settings-container/
  - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingTypeHandler.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/bankRecon/CashbookTxnLinePostingService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/GenericDocumentDataConsistencyObject.java
  - akaun_master.bl_applet_client_side_perm_dfn (applet code internal-payment-voucher-applet)
tags:
- payment-voucher
- internal-payment
- accounts-payable
- settlement
- contra
- intercompany
- file-import
- file-export
weight: 20
---

## Overview

The **Payment Voucher (Internal)** applet records money going out: paying a supplier's invoices, paying an expense directly (rent, road tax, a utility bill), or refunding a customer. An accounts-payable clerk creates the voucher for the payee, adds the expense lines being paid (if any), adds one or more payment lines (cheque, bank transfer, cash, card), contra-links the purchase invoices being settled, and finalises. FINAL posts one cashbook transaction per payment line — the lines Bank Reconciliation later matches — and the creditor journal. Settlement Adjustment and Expenses Adjustment screens let authorised users correct a finalised voucher without voiding it.

{{< callout type="info" >}}
**Core concept.** The applet links **who** is paid (the payee entity), **what** is paid (expense lines or contra'd purchase invoices) and **how** it is settled (payment lines). If the expense total already equals the payment total the voucher balances on its own; contra is only for applying the payment to existing open documents.
{{< /callout >}}

{{< figure src="/images/internal-payment-voucher-applet/internal-payment-voucher-overview.png" alt="Payment Voucher (Internal) overview infographic" caption="Payment voucher processing, settlement control and traceability." >}}

## Where it fits

| Direction | Document / applet | Relationship |
|---|---|---|
| Upstream | [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/), [Purchase Debit Note (Internal)](/applets/purchase-workflow/internal-purchase-debit-note-applet/) | Open supplier documents the payment is contra'd against |
| Upstream | [Purchase Credit Note (Internal)](/applets/purchase-workflow/internal-purchase-credit-note-applet/) | Reduces what you owe before paying |
| Master data | [Supplier Applet](/applets/master-data/supplier-applet-1/) | Payee entity and its AP type |
| Master data | [Cashbook Applet](/applets/master-data/cashbook-applet/) | Each settlement method is an item linked to a cashbook; the cashbook's GL code is the credit side |
| Downstream | [Bank Reconciliation](/applets/finance/bank-reconciliation-applet/) | Matches the cashbook lines FINAL creates |
| Downstream | [Ledger And Journal](/applets/finance/ledger-and-journal-applet/) | Shows the journal |
| Downstream | [Creditor Report](/applets/finance/creditor-report-applet/), [Statement of Account](/applets/finance/statement-of-account-applet/) | Ageing and statements reflect contra'd payments |
| Mirror | [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/) | The same document for money coming in |
| Sibling | Reimbursement Payment Voucher (Internal) | A separate applet for staff claims (no wiki page yet) |

Modules: [Financial Accounting](/modules/financial-accounting/) and [Purchasing](/modules/purchasing/).

## Screens and menus

| Menu item | Route | What it is | Hidden by |
|---|---|---|---|
| **Internal Payment Voucher** | `internal-payment-voucher` | Listing and create/edit form | — |
| **File Import** | `file-import` | Bulk upload with a Checking tab | `HIDE_FILE_IMPORT_MENU` (unless `SHOW_FILE_IMPORT_MENU`) |
| **Intercompany** | `intercompany` | Unprocessed / Processed queues of vouchers between companies of the tenant | `HIDE_INTERCOMPANY_MENU` (unless `SHOW_INTERCOMPANY_MENU`) |
| **File Export** | `file-export` | Generate a CSV of vouchers for a date range (bank payment files) | `HIDE_FILE_EXPORT_MENU` (unless `SHOW_FILE_EXPORT_MENU`) |
| **Settlement Adjustment** | `settlement-adjustment` | Correct payment lines of finalised vouchers | Shown only when `ENABLE_EDIT_SETTLEMENT_FINAL` is on and the user has `SHOW_EDIT_SETTLEMENT_FINAL` |
| **Expenses Adjustment** | `expenses-adjustment` | Correct expense lines of finalised vouchers | When `ALLOW_EXPENSES_EDITING_AFTER_FINAL` is on, only users with `ALLOW_EDIT_EXPENSES_AFTER_FINAL` see it |
| **Audit Trail** | `audit-trail` | Change history | `HIDE_AUDIT_TRAIL_MENU` |

{{< figure src="/images/internal-payment-voucher-applet/pv.png" alt="Payment Voucher listing" caption="Listing with actions and filters." >}}
{{< figure src="/images/internal-payment-voucher-applet/pv-add.png" alt="Add payment voucher" caption="Create a new voucher with the plus button." >}}

### Edit form tabs

Default order (changeable under *Settings > Default Selection > Details Tab Ordering*):

| Tab | Purpose | Hidden by |
|---|---|---|
| Main Details | Company, branch, location, date, currency, references | — |
| Account | Payee (Entity Details, Payee, Intercompany) | — |
| Expenses | Lines paid directly, with item/GL, tax and department | `HIDE_EXPENSES_TAB` |
| ARAP | Product & Services, Settlement, Contra, Outstanding (read-only) | `HIDE_MAIN_ARAP_TAB` |
| Payment | The money paid out: settlement method, amount, date, reference | `HIDE_MAIN_PAYMENT_TAB` |
| Payment Adjustment | Post-FINAL corrections to payment lines | `HIDE_MAIN_PAYMENT_TAB` |
| Department Hdr | Dimension, Profit Centre, Project, Segment | `HIDE_DEPARTMENT_HDR_TAB` |
| Trace Document | Journal Txn, Cashbook Txn, Tax Txn, Points Txn, Inv Txn created by FINAL | `HIDE_TRACE_DOCUMENT_TAB` |
| Contra | Apply the payment to open supplier documents | `HIDE_MAIN_CONTRA_TAB` |
| Doc Link | Links to other documents | `HIDE_DOC_LINK_TAB` |
| Attachments | Supporting files | `HIDE_ATTACHMENT_TAB` |
| Export | Print with a printable format | `HIDE_EXPORT_TAB` |
| Sales Commission | Link the payment to a sales-commission run | `HIDE_SALES_COMMISSION_TAB` |
| Expenses Adjustment | Post-FINAL corrections to expense lines | `HIDE_EXPENSES_TAB` |

{{< figure src="/images/internal-payment-voucher-applet/pv-entity.png" alt="Account tab entity details" caption="Account tab: payee details." >}}
{{< figure src="/images/internal-payment-voucher-applet/pv-expenses.png" alt="Expenses tab" caption="Expenses tab." >}}
{{< figure src="/images/internal-payment-voucher-applet/pv-payment.png" alt="Payment tab" caption="Payment tab." >}}
{{< figure src="/images/internal-payment-voucher-applet/pv-arap.png" alt="ARAP tab" caption="ARAP: settlement, contra and outstanding." >}}
{{< figure src="/images/internal-payment-voucher-applet/pv-contra.png" alt="Contra tab" caption="Contra tab." >}}
{{< figure src="/images/internal-payment-voucher-applet/pv-trace-doc.png" alt="Trace document tabs" caption="Trace Document: journal, cashbook, points and tax postings." >}}

### Top action buttons

| Button | Enabled when |
|---|---|
| **Create / SAVE** | Draft; Company, Branch, Location and Currency filled; rate not zero (*The currency rate cannot be ZERO.*) |
| **FINAL** | `ACTIVE` + posting `DRAFT`, at least one payment line; `HIDE_GENDOC_FINAL_BUTTON` off or user has `SHOW_GENDOC_FINAL_BUTTON` |
| **DISCARD** | `ACTIVE` + `DRAFT`; `HIDE_GENDOC_DISCARD_BUTTON` off or `SHOW_GENDOC_DISCARD_BUTTON` |
| **VOID** | Posting `FINAL`; `HIDE_GENDOC_VOID_BUTTON` off or `SHOW_GENDOC_VOID_BUTTON` |
| **CLONE** | Any, unless `HIDE_CLONE_BUTTON` |
| **SEND EMAIL** | Listing action; sends the printable using the Email Template; hidden by `HIDE_SEND_EMAIL_BUTTON`. It is not an approval step. |

{{< figure src="/images/internal-payment-voucher-applet/pv-filter-final.png" alt="Filter final vouchers" caption="Filter the listing by posting status FINAL before voiding." >}}
{{< figure src="/images/internal-payment-voucher-applet/pv-void.png" alt="Void action" caption="Void from the listing toolbar." >}}
{{< figure src="/images/internal-payment-voucher-applet/pv-void-confirm.png" alt="Void confirmation" caption="Confirm the void." >}}

### Intercompany

A voucher whose Account tab carries intercompany data lands, after FINAL, in the **Intercompany** queue as *Unprocessed*; processing it creates the mirror receipt voucher in the other company (the backend maps the payment line's settlement method across). Processed entries move to the *Processed* tab.

{{< figure src="/images/internal-payment-voucher-applet/pv-intercompany.png" alt="Intercompany listing" caption="Intercompany queue: Unprocessed and Processed." >}}

### File Import and File Export

**File Import**: upload the CSV/Excel, review the **Checking** tab, fix rows or re-upload. **File Export**: choose a transaction date range, click **Generate CSV**, download from the generated row.

{{< figure src="/images/internal-payment-voucher-applet/pv-file-import.png" alt="File import listing" caption="File Import listing." >}}
{{< figure src="/images/internal-payment-voucher-applet/pv-adjust-set.png" alt="Settlement adjustment listing" caption="Settlement Adjustment listing." >}}

## Configuration

### Before you can use it

| Prerequisite | Where | Why |
|---|---|---|
| Company, branch, location | [Organisation Applet](/applets/master-data/organisation-applet/) | Company, Branch, Location and Currency are the required header fields |
| Payee entity with an AP type | [Supplier Applet](/applets/master-data/supplier-applet-1/) | The creditor journal line uses `CREDITOR` for `AP_TRADE`, `CREDITOR_NON_TRADE` for `AP_OTHER`, `EMPLOYEE_OTHER_PAYABLE` for `AP_EMPLOYEE`. A payee set up as a customer only will post to the debtor side and appear on debtor statements — a common cause of "payment voucher missing from creditor SOA". |
| Cashbook per bank / till, with a GL code | [Cashbook Applet](/applets/master-data/cashbook-applet/) | FINAL fails with `MISSING_CASHBOOK: STL_MTHD [code]` if the settlement method has no cashbook, `MISSING_GL_CODE: STL_MTHD [code]` if the cashbook has no GL code |
| Settlement methods assigned to the branch | *Settings > Branch Settings > Default Settlement Method* | The Payment tab's settlement dropdown lists only methods assigned to the voucher's branch — an empty dropdown means none are assigned |
| Company default GL codes | [Chart of Account Applet](/applets/master-data/chart-of-account-applet/) | `CREDITOR` (or the non-trade / employee variants), `PURCHASE`, `INPUT_TAX`, `PURCHASE_DISCOUNT` for expense lines; `SETTLEMENT_CHARGES`; `FOREX_GAIN` / `FOREX_LOSS` |
| Expense items or GL codes | Item maintenance / Chart of Account | Expense lines are items; the *Search GL Code* tab lets you pick a GL account directly |
| Document numbering | [Organisation Applet](/applets/master-data/organisation-applet/) | Doc No (Tenant / Company / Branch) |
| Printable format and email template | *Settings > Printable Format Settings*, *Email Template* | Needed for PRINT, auto-print and SEND EMAIL (*No Default Printable Selected* otherwise) |
| Permissions | *Settings > Permission Set / User / Team / Role Permission* | Server-side `TNT_API_DOC_INTERNAL_PAYMENT_VOUCHER_READ/CREATE/UPDATE/DELETE_TGT_GUID`, branch-targeted |

### Applet settings

Settings (gear icon) → *System Configuration*: **Application Settings**, **Default Selection**, **Printable Format Settings**, **Branch Settings**, **Email Template**, **Custom Resource Bundle Configuration** (relabel fields), **Custom Field Placement**, plus Webhook, Feature Visibility, the permission screens, Release Notes and Applet Log. *Personalization* holds a per-user Default Selection and Sidebar.

{{< figure src="/images/internal-payment-voucher-applet/pv-app-setting.png" alt="Application settings" caption="Application Settings." >}}
{{< figure src="/images/internal-payment-voucher-applet/pv-deff-setting.png" alt="Default selection settings" caption="Default Selection." >}}
{{< figure src="/images/internal-payment-voucher-applet/pv-print-format.png" alt="Printable format settings" caption="Printable Format Settings." >}}
{{< figure src="/images/internal-payment-voucher-applet/pv-email.png" alt="Email template settings" caption="Email Template." >}}
{{< figure src="/images/internal-payment-voucher-applet/pv-perm-setting.png" alt="Permission settings" caption="Permission screens." >}}

#### Default Selection

| Setting | What it controls | Default |
|---|---|---|
| Default Branch / Default Location | Pre-selected on new vouchers | none |
| Default Pricing Scheme | Pricing scheme used to price expense items | none |
| Details Tab Ordering | Order of the edit-form tabs | Main Details, Account, Expenses, ARAP, Payment, Payment Adjustment, Department Hdr, TraceDocument, Contra, Doc Link, Attachments, Export, Sales Commission |

#### Application Settings

| Setting | What it controls | Default |
|---|---|---|
| `HIDE_FILE_IMPORT_MENU`, `HIDE_FILE_EXPORT_MENU`, `HIDE_INTERCOMPANY_MENU`, `HIDE_AUDIT_TRAIL_MENU` | Remove menu items (the first three are restorable per user by `SHOW_..._MENU`) | Off |
| `ENABLE_EDIT_SETTLEMENT_FINAL` | Turns on the Settlement Adjustment menu and Payment Adjustment tab for users holding `SHOW_EDIT_SETTLEMENT_FINAL` | Off |
| `ALLOW_EXPENSES_EDITING_AFTER_FINAL` | Restricts the Expenses Adjustment menu to users holding `ALLOW_EDIT_EXPENSES_AFTER_FINAL` | Off |
| `VIEW_OWN_CREATED_TXN_ONLY` | Listing shows only vouchers the user created, unless the user has `VIEW_PAYMENT_VOUCHER_ALL_USER_CREATE` | Off |
| `DISABLE_GEN_DOC_LISTING`, `DEFAULT_POSTING_STATUS`, `DEFAULT_TRANSACTION_DATE`, `SORT_ORDER`, `ENABLE_FILTER_BY_TODAYS_TXN` | Listing behaviour and default filters | none |
| `HIDE_GENDOC_SAVE_BUTTON`, `HIDE_GENDOC_FINAL_BUTTON`, `HIDE_GENDOC_DISCARD_BUTTON`, `HIDE_GENDOC_VOID_BUTTON`, `HIDE_CLONE_BUTTON`, `HIDE_SEND_EMAIL_BUTTON` | Hide action buttons | Off |
| `HIDE_SERVER_DOC_1/2/3`, `HIDE_CLIENT_DOC_TYPE`, `HIDE_CLIENT_DOC_1..5` | Hide document-number and client-reference fields | Off |
| `HIDE_REFERENCE`, `HIDE_REFERENCE_DATE`, `HIDE_REMARKS`, `HIDE_DESCRIPTION`, `HIDE_DESC` | Hide reference and text fields | Off |
| `HIDE_TRACKING_ID`, `HIDE_PERMIT_NO`, `HIDE_VALIDITY_DATE`, `VALIDITY_DATE_REQUIRED` | Hide or require logistics/validity fields | Off |
| `HIDE_CURRENCY`, `HIDE_BASE_CURRENCY`, `CANNOT_EDIT_CURRENCY_RATE`, `SHOW_FOREX_DATA_SOURCE` | Currency controls | Off |
| `ALLOW_DIFFERENT_PAYEE_THAN_SELECTED_ENTITY` | The Payee sub-tab may name a different party from the entity being settled | Off |
| `HIDE_ACCOUNT_BILLING_CONTACT` | Hide the billing contact block | Off |
| `HIDE_SEGMENT`, `HIDE_DIMENSION`, `HIDE_PROFIT_CENTER`, `HIDE_PROJECT`, `MANDATORY_...`, `ENABLE_...` | Department header fields | Off |
| `ENABLE_SST`, `ENABLE_WHT` | Tax and withholding tax on expense lines | Off |
| `ENABLE_CUSTOM_STATUS_HDR_1..5`, `ENABLE_CUSTOM_STATUS_LINE_1..5` with `NAME_...`/`LIST_...` | Custom status fields | Off |
| `HIDE_EXPENSES_TAB`, `HIDE_MAIN_PAYMENT_TAB`, `HIDE_MAIN_ARAP_TAB`, `HIDE_DEPARTMENT_HDR_TAB`, `HIDE_TRACE_DOCUMENT_TAB`, `HIDE_MAIN_CONTRA_TAB`, `HIDE_DOC_LINK_TAB`, `HIDE_ATTACHMENT_TAB`, `HIDE_EXPORT_TAB`, `HIDE_SALES_COMMISSION_TAB`, `HIDE_SETTLEMENT_TAB`, `HIDE_KO_FOR_TAB`, `HIDE_DELIVERY_DETAILS_TAB` | Remove tabs | Off |
| `HIDE_ARAP_PNS`, `HIDE_ARAP_SETTLEMENT`, `HIDE_ARAP_DOC_OPEN`, `HIDE_ARAP_CONTRA`, `HIDE_ARAP_BAL` | Hide individual ARAP figures | Off |
| Expense-line columns: `HIDE_UNIT_PRICE_STD_*`, `HIDE_UNIT_PRICE_NET_*`, `HIDE_UNIT_PRICE_TXN*`, `HIDE_UNIT_DISCOUNT*`, `HIDE_DISCOUNT_AMOUNT_EXCL_TAX`, `HIDE_AMOUNT_STD_EXCL_TAX`, `HIDE_AMOUNT_NET_EXCL_TAX`, `HIDE_AMOUNT_TXN`, `HIDE_QTY_BASE`, `HIDE_QTY_UOM`, `HIDE_UOM_TO_BASE_RATIO`, `HIDE_TAX_CONFIG_SELECTION`, `HIDE_WHT_CONFIG_SELECTION`, `HIDE_LAST_PURCHASE_PRICE`, `HIDE_COSTING_DETAILS`, `HIDE_SERIAL_NUMBER`, `HIDE_BIN_NUMBER`, `HIDE_BATCH_NUMBER`, `HIDE_ISSUE_LINK`, `HIDE_DELIVERY_INSTRUCTION`, `HIDE_DELIVERY_DETAILS`, `HIDE_DELIVERY_TRIPS`, `HIDE_DOC_LINK`, `HIDE_DEPARTMENT` | Hide columns and line sub-tabs | Off |
| `ENABLE_EDITING_UNIT_PRICE_STD`, `ENABLE_ITEM_NAME_MAX_LIMIT`, `ITEM_NAME_MAX_LIMIT` | Price override; item-name cap | Off |
| `ENABLE_EDIT_PAYMENT_DATE`, `ENABLE_EDIT_SETTLEMENT_DATE` | Payment line date may differ from the voucher date | Off |
| `HIDE_INVOICE`, `HIDE_INVOICE_DATE` | Hide invoice reference fields on a payment line | Off |
| `HIDE_CARD_NO`, `HIDE_NAME`, `HIDE_CARD_ISSUER`, `HIDE_CARD_EXPIRY`, `HIDE_APPROVAL_CODE`, `HIDE_BATCH`, `HIDE_CARD_TYPE`, `HIDE_CVV` and `MANDATORY_...` | Card settlement fields | Off |
| `HIDE_DELETE_CONTRA`, `EDIT_CONTRA_TXN_DATE` | Hide the delete icon on contra lines (users with `SHOW_DELETE_CONTRA` still see it); allow editing the contra date | Off |
| `VERTICAL_ORIENTATION`, `EXPAND_...` | Vertical layout and which panels open by default | Off |
| `PRINTABLE` | Printable format for auto-print | none |

#### Branch Settings

The shared branch-settings screen: Branch Details (Rounding Five Cent, Group same item code, Disable device validation), Item Category Filter, Employee, Pricing Scheme, Printable Format, Printable Image, **Default Settlement Method** — the last decides which settlement methods (and the default) appear on the Payment tab for that branch.

### Document behaviour settings

| Behaviour | Controlled by |
|---|---|
| Which settlement methods per branch | Branch Settings > Default Settlement Method |
| Payment date follows the voucher date | Default; `ENABLE_EDIT_PAYMENT_DATE` lets it differ |
| Post-FINAL correction of payment lines | `ENABLE_EDIT_SETTLEMENT_FINAL` + `SHOW_EDIT_SETTLEMENT_FINAL` (Payment Adjustment tab / Settlement Adjustment menu; the transaction number and reference are what can be changed) |
| Post-FINAL correction of expense lines | `ALLOW_EXPENSES_EDITING_AFTER_FINAL` + `ALLOW_EDIT_EXPENSES_AFTER_FINAL` |
| Own-transactions-only listing | `VIEW_OWN_CREATED_TXN_ONLY` + `VIEW_PAYMENT_VOUCHER_ALL_USER_CREATE` |
| Email on demand | Email Template; `HIDE_SEND_EMAIL_BUTTON` |
| Intercompany mirroring | Intercompany data on the Account tab; `HIDE_INTERCOMPANY_MENU` / `SHOW_INTERCOMPANY_MENU` |

Approval workflow: not configurable in this applet.

### Feature visibility / permissions

Client-side permissions for `internal-payment-voucher-applet`:

| Permission | Effect |
|---|---|
| `SHOW_GENDOC_FINAL_BUTTON`, `SHOW_GENDOC_VOID_BUTTON`, `SHOW_GENDOC_DISCARD_BUTTON` | Restore a hidden action button |
| `SHOW_EDIT_SETTLEMENT_FINAL` | With `ENABLE_EDIT_SETTLEMENT_FINAL`, unlocks Settlement Adjustment |
| `ALLOW_EDIT_EXPENSES_AFTER_FINAL` | With `ALLOW_EXPENSES_EDITING_AFTER_FINAL`, unlocks Expenses Adjustment |
| `VIEW_PAYMENT_VOUCHER_ALL_USER_CREATE` | See every user's vouchers when `VIEW_OWN_CREATED_TXN_ONLY` is on (`VIEW_CASHBILL_ALL_USER_CREATE` is a legacy twin) |
| `SHOW_DELETE_CONTRA` | Delete contra lines when `HIDE_DELETE_CONTRA` is on |
| `SHOW_FILE_IMPORT_MENU`, `SHOW_FILE_EXPORT_MENU`, `SHOW_INTERCOMPANY_MENU` | Restore hidden menus |
| `INTERNAL_PAYMENT_VOUCHER_DISPLAY_PRICING`, `SHOW_COSTING_DETAILS`, `SHOW_UNIT_PRICE_*`, `SHOW_AMOUNT_*`, `SHOW_QTY_*`, `SHOW_UNIT_DISCOUNT*`, `SHOW_UOM_TO_BASE_RATIO`, `SHOW_TAX_CONFIG_SELECTION`, `SHOW_WHT_CONFIG_SELECTION` | Restore expense-line columns for this user |
| `SHOW_DOC_NO_TENANT/COMPANY/BRANCH`, `SHOW_CLIENT_DOC_TYPE`, `SHOW_CLIENT_DOC_1..5`, `SHOW_TRANSACTION_DATE` | Restore header fields |

## Fields

### Main Details

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Company, Branch, Location | Paying entity and branch | Yes | Branch list limited by branch-targeted read permission |
| Transaction Date | Voucher date | Yes (defaults to today) | Payment lines take this date unless `ENABLE_EDIT_PAYMENT_DATE`; after FINAL the date is locked |
| Doc No (Tenant / Company / Branch), Client Doc fields | Numbers and client references | Generated / No | |
| Reference, Reference Date | Supplier's statement or bill reference | No | |
| Currency, Base Currency, Rate | Transaction currency | Yes | Zero rate rejected |
| Remarks, Description | Free text; Remarks become the journal description | No | |
| Tracking ID, Permit No, Validity Date | Optional references | Per settings | |

### Account

Entity Details (payee code, name, type, identity, currency, status), Payee (bank details / cheque name; may differ from the entity with `ALLOW_DIFFERENT_PAYEE_THAN_SELECTED_ENTITY`), Intercompany (target company).

### Expense line

Item or GL code (via *Search Item* / *Search GL Code*), description, quantity, UOM, unit price, discount, tax code, WHT code, amounts, department codes, costing details, issue link, attachments.

### Payment line

Settlement Type and Method (from the branch's assigned methods), Amount, Date, Remarks, Reference; per method: Cheque No and Cheque Date, Transaction No (bank transfer), Card Type, Voucher No, Points, Cash-back.

### Contra

Search the payee's open documents, tick one or more, enter the contra amount per document. Zero-value documents (for example free-of-charge items) cannot be contra'd — the contra engine requires a positive amount.

## Lifecycle and posting

| Posting status | Meaning |
|---|---|
| `DRAFT` | Saved; nothing posted |
| `FINAL` | Cashbook and journal posted; header and lines locked (adjustment screens for corrections) |
| `VOID` | Reversed — the reversing journal carries the void date, not the original transaction date |
| Discarded | Draft deleted; no posting |

**What FINAL does:**

1. Validates header and payment lines; a settlement method without cashbook or GL code fails with `MISSING_CASHBOOK` / `MISSING_GL_CODE`.
2. Creates one cashbook transaction line (`STL_MTHD`) per payment line in that method's cashbook — these are what Bank Reconciliation matches. A voucher that is not FINAL, or whose method points at a different cashbook, will not appear there.
3. Posts the journal (handler `INTERNAL_PAYMENT_VOUCHER`):

| Journal line | Dr | Cr | GL code from |
|---|---|---|---|
| Payee | Amount paid | | Company default `CREDITOR` (`AP_TRADE`), `CREDITOR_NON_TRADE` (`AP_OTHER`) or `EMPLOYEE_OTHER_PAYABLE` (`AP_EMPLOYEE`) |
| Expense lines | Net amount | | Line GL code → item's `PURCHASE` link → company default `PURCHASE`; tax to `INPUT_TAX` |
| Each payment line | | Amount paid (less charges) | The cashbook's GL code |
| Settlement charges | Charge | | `SETTLEMENT_CHARGES` |
| Forex difference | Loss | Gain | `FOREX_LOSS` / `FOREX_GAIN` |

4. Applies contra links: each linked purchase invoice's open balance and the voucher's own open balance are reduced.
5. Queues the intercompany mirror (if any), webhooks and email.

Changing a finalised payment line whose cashbook line is already reconciled is refused: *Please unreconcile this transaction from bank recon first before changing the amount: Cashbook [name] - Bank Recon [name] (month)*.

**VOID** reverses the journal and cashbook lines and releases the contra so the supplier invoices become outstanding again. It is available on any `FINAL` voucher (no e-Invoice lock on payment vouchers).

## Related applets

- [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/), [Purchase Debit Note (Internal)](/applets/purchase-workflow/internal-purchase-debit-note-applet/), [Purchase Credit Note (Internal)](/applets/purchase-workflow/internal-purchase-credit-note-applet/) — the documents a payment is applied to.
- [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/) — the inbound twin; identical settlement, contra and adjustment mechanics.
- [Cashbook Applet](/applets/master-data/cashbook-applet/) — settlement methods and their GL codes.
- [Bank Reconciliation](/applets/finance/bank-reconciliation-applet/) — consumes and locks the cashbook lines.
- [Supplier Applet](/applets/master-data/supplier-applet-1/) — the payee's AP type decides the creditor account.
- [Chart of Account Applet](/applets/master-data/chart-of-account-applet/), [Organisation Applet](/applets/master-data/organisation-applet/) — default GL codes, branches, numbering.
- [Ledger And Journal](/applets/finance/ledger-and-journal-applet/), [Creditor Report](/applets/finance/creditor-report-applet/), [Statement of Account](/applets/finance/statement-of-account-applet/) — where the posting is reviewed.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| Settlement dropdown on the Payment tab is empty | No settlement methods assigned to the voucher's branch | Branch Settings > Default Settlement Method |
| FINAL fails with `MISSING_CASHBOOK` / `MISSING_GL_CODE: STL_MTHD [code]` | Settlement method not linked to a cashbook, or cashbook has no GL code | Fix in the Cashbook applet |
| Voucher not found in Bank Reconciliation | Not FINAL, or the method's cashbook is not the one being reconciled | Finalise; check the method's cashbook |
| Payment voucher shows on the debtor statement, not the creditor one | Payee entity is typed as a customer (AR) | Set the entity's type to supplier / `AP_TRADE`; re-post |
| Voucher still shows a balance after full contra | Known open-balance defect when `amount_txn` is 0 and settlement is applied only by contra | Report the document number; the fix is in the backend formula |
| Contra disappears after save / not recognised until re-saved | Contra lines saved while the draft was being converted; reported 2026-07/08 and under investigation | Re-open, re-add the contra, FINAL; verify on ARAP |
| Cannot contra a free-of-charge (0.00) document | Contra requires a positive amount | Nothing to settle; leave it |
| Payment date differs from the voucher date | `ENABLE_EDIT_PAYMENT_DATE` on, line date keyed separately | Edit the line date, or turn the setting off so lines follow the header |
| Contra date reverts to today after save | `EDIT_CONTRA_TXN_DATE` off | Enable it, or accept the voucher date |
| Void journal missing from Ledger and Journal / on a different date | The reversal is a separate journal dated at void time; if it is absent the void did not complete | Check Trace Document; if there is no reversal, report the document |
| Settlement Adjustment menu missing | `ENABLE_EDIT_SETTLEMENT_FINAL` off or user lacks `SHOW_EDIT_SETTLEMENT_FINAL` | Enable both |
| Adjusted transaction number not on the printout | Adjustment saved to the settlement line but printable reads the original reference (fixed 2026-08) | Update the applet; re-print |
| Listing does not show colleagues' vouchers | `VIEW_OWN_CREATED_TXN_ONLY` on | Grant `VIEW_PAYMENT_VOUCHER_ALL_USER_CREATE` |
| Transaction date greyed out on a finalised voucher | Locked after FINAL by design | Void and re-create, or use the adjustment screens |
| Printable error / *No Default Printable Selected* | No printable format or no branch default | Printable Format Settings, then Branch Settings > Printable Format |

## Related documentation

- [Standard procurement workflow](/guides/purchasing-guides/standard-procurement-workflow/) — where the payment closes the loop
- [Bank reconciliation guide](/guides/accounting-guides/bank-reconciliation-guide/)
- [Financial Accounting module](/modules/financial-accounting/) and [Purchasing module](/modules/purchasing/)
