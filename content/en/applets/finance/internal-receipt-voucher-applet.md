---
title: "Receipt Voucher (Internal)"
description: "Record money received from customers, apply it to open invoices by contra, post the cashbook and debtor entries, and adjust settlements after finalisation."
applet_code: "internal-receipt-voucher-applet"
applet_repo: "blg-applet-wavelet-internal-receipt-voucher-applet-v2"
modules: [financial-accounting, sales-crm]
related_applets:
  - internal-sales-invoice-applet
  - internal-sales-debit-note-applet
  - internal-sales-credit-note-applet
  - internal-payment-voucher-applet
  - bank-reconciliation-applet
  - cashbook-applet
  - customer-maintenance-applet
  - chart-of-account-applet
  - organisation-applet
  - ledger-and-journal-applet
  - debtor-report-applet
  - statement-of-account-applet
guides:
  - /guides/sales-guides/standard-sales-workflow/
  - /guides/accounting-guides/bank-reconciliation-guide/
sources:
  - blg-applet-wavelet-internal-receipt-voucher-applet-v2/micro-fe/projects/wavelet-erp/applets/internal-receipt-voucher-applet-v2/src/app/models/applet-settings.model.ts
  - blg-applet-wavelet-internal-receipt-voucher-applet-v2/micro-fe/projects/wavelet-erp/applets/internal-receipt-voucher-applet-v2/src/app/models/menu-items.ts
  - blg-applet-wavelet-internal-receipt-voucher-applet-v2/micro-fe/projects/wavelet-erp/applets/internal-receipt-voucher-applet-v2/src/app/models/constants/applet-constants.ts
  - blg-applet-wavelet-internal-receipt-voucher-applet-v2/micro-fe/projects/wavelet-erp/applets/internal-receipt-voucher-applet-v2/src/app/app.routing.ts
  - blg-applet-wavelet-internal-receipt-voucher-applet-v2/micro-fe/projects/wavelet-erp/applets/internal-receipt-voucher-applet-v2/src/app/ui-navigation/applet-settings/applet-settings-navigation.config.ts
  - blg-applet-wavelet-internal-receipt-voucher-applet-v2/micro-fe/projects/wavelet-erp/applets/internal-receipt-voucher-applet-v2/src/app/components/settings-container/default-settings/default-settings.component.ts
  - blg-applet-wavelet-internal-receipt-voucher-applet-v2/micro-fe/projects/wavelet-erp/applets/internal-receipt-voucher-applet-v2/src/app/components/settings-container/branch-settings/branch/branch.component.html
  - blg-applet-wavelet-internal-receipt-voucher-applet-v2/micro-fe/projects/wavelet-erp/applets/internal-receipt-voucher-applet-v2/src/app/components/internal-receipt-voucher-container/internal-receipt-voucher-create/main-details/main-details.component.ts
  - blg-applet-wavelet-internal-receipt-voucher-applet-v2/micro-fe/projects/wavelet-erp/applets/internal-receipt-voucher-applet-v2/src/app/components/internal-receipt-voucher-container/internal-receipt-voucher-create/internal-receipt-voucher-create.component.html
  - blg-applet-wavelet-internal-receipt-voucher-applet-v2/micro-fe/projects/wavelet-erp/applets/internal-receipt-voucher-applet-v2/src/app/components/internal-receipt-voucher-container/internal-receipt-voucher-create/payment/add-payment/add-payment.component.ts
  - blg-applet-wavelet-internal-receipt-voucher-applet-v2/micro-fe/projects/wavelet-erp/applets/internal-receipt-voucher-applet-v2/src/app/components/internal-receipt-voucher-container/internal-receipt-voucher-create/contra/select-document/contra-select-document.component.ts
  - blg-applet-wavelet-internal-receipt-voucher-applet-v2/micro-fe/projects/wavelet-erp/applets/internal-receipt-voucher-applet-v2/src/app/components/internal-receipt-voucher-container/internal-receipt-voucher-edit/internal-receipt-voucher-edit.component.ts
  - blg-applet-wavelet-internal-receipt-voucher-applet-v2/micro-fe/projects/wavelet-erp/applets/internal-receipt-voucher-applet-v2/src/app/state-controllers/internal-receipt-voucher-controller/store/effects/internal-receipt-voucher.effects.ts
  - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingTypeHandler.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentTypeHandler.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/bankRecon/CashbookTxnLinePostingService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/bankRecon/CashbookTxnLineBankReconGuard.java
  - akaun_master.bl_applet_client_side_perm_dfn (applet code internal-receipt-voucher-applet)
tags:
- internal-receipt-voucher
- finance
- accounts-receivable
- settlement
- payments
- contra
- import
weight: 10
aliases:
- /applets/internal-receipt-voucher-applet/
---

## Overview

The **Receipt Voucher (Internal)** applet records money coming in from a customer — cash, cheque, bank transfer, card or any other settlement method — and applies it to the customer's open documents by contra. An accounts-receivable clerk creates the voucher, adds one or more settlement lines, contra-links the sales invoices being paid, and finalises it. FINAL posts the cashbook transaction (which then appears in Bank Reconciliation) and the debtor journal. The applet also carries optional Revenue and Expense lines for receipts that are not against an invoice, and post-finalisation adjustment screens so a wrong settlement can be corrected without voiding.

{{< callout type="info" >}}
**Core concept.** A receipt voucher moves money; a sales invoice moves goods and revenue. Linking the two by contra is what clears the customer's balance. A receipt that is finalised without a contra stays as an unapplied receipt (a customer credit) until it is contra'd later.
{{< /callout >}}

{{< figure src="/screenshots/internal-receipt-voucher/infograhic.png" alt="Receipt Voucher Internal applet infographic showing manual processing challenges, digital workflow solution, and stakeholder benefits" caption="Receipt Voucher (Internal) overview." >}}

## Video walkthrough

{{< youtube tnTYuYGV6J4 >}}

## Where it fits

| Direction | Document / applet | Relationship |
|---|---|---|
| Upstream | [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [Sales Debit Note (Internal)](/applets/sales-workflow/internal-sales-debit-note-applet/) | Open customer documents the receipt is contra'd against |
| Upstream | [Sales Credit Note (Internal)](/applets/sales-workflow/internal-sales-credit-note-applet/) | Reduces what the customer owes before the receipt is applied |
| Master data | [Customer Maintenance](/applets/master-data/customer-maintenance-applet/) | Customer entity and its AR type |
| Master data | [Cashbook Applet](/applets/master-data/cashbook-applet/) | Every settlement method is an item linked to a cashbook; the cashbook's GL code is the debit side |
| Downstream | [Bank Reconciliation](/applets/finance/bank-reconciliation-applet/) | Cashbook lines created by FINAL are matched to bank statements |
| Downstream | [Ledger And Journal](/applets/finance/ledger-and-journal-applet/) | The journal FINAL creates |
| Downstream | [Debtor Report](/applets/finance/debtor-report-applet/), [Statement of Account](/applets/finance/statement-of-account-applet/) | Ageing and statements reflect contra'd receipts |
| Mirror | [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/) | The same document for money going out to suppliers |

Modules: [Financial Accounting](/modules/financial-accounting/) and Sales.

## Screens and menus

| Menu item | Route | What it is |
|---|---|---|
| **Internal RCT Voucher** | `internal-receipt-voucher` | Listing and the create/edit form |
| **Import Receipt Voucher** | `receipt-voucher-import` | Bulk upload with a Checking tab for row errors |
| **Settlement Adjustment** | `settlement-adjustment` | Post-FINAL corrections to settlement lines |
| **Audit Trail** | `audit-trail` | Change history (hidden by `HIDE_AUDIT_TRAIL_MENU`) |

{{< figure src="/screenshots/internal-receipt-voucher/listing.png" alt="Receipt Voucher (Internal) listing" caption="Voucher listing with filters and actions." >}}

### Create form tabs

Main Details, Account, Revenue, Delivery Details, Expense, Settlement, Department Hdr, Contra, Posting.

### Edit form tabs

Default order (changeable under *Settings > Default Selection > Details Tab Ordering*):

| Tab | Purpose | Hidden by |
|---|---|---|
| Main Details | Branch, location, dates, currency, references, Checked By / Approved By | — |
| Account | Customer (Entity Details, Bill To, Payee) | `HIDE_PAYEE_TAB` for the Payee sub-tab |
| Revenue | Income lines for receipts not tied to an invoice (item, qty, price, tax) | `HIDE_REVENUE_TAB` |
| Expenses | Deductions taken from the receipt (bank charges, etc.) | `HIDE_EXPENSES_TAB` |
| Settlement | The money received: settlement method, amount, date, reference | `HIDE_SETTLEMENT_TAB` |
| Payment Adjustment | Post-FINAL correction of settlement lines | `HIDE_MAIN_PAYMENT_TAB` |
| ARAP | Product & Services, Settlement, Contra, Outstanding (read-only) | `HIDE_MAIN_ARAP_TAB` |
| Department Hdr | Dimension, Profit Centre, Project, Segment | `HIDE_DEPARTMENT_HDR_TAB` |
| TraceDocument | Journal and cashbook rows created by FINAL | `HIDE_TRACE_DOCUMENT_TAB` |
| Contra | Apply the receipt to the customer's open documents | `HIDE_MAIN_CONTRA_TAB` |
| Doc Link | Link other documents | `HIDE_DOC_LINK_TAB` |
| Export | Print with a printable format | `HIDE_EXPORT_TAB` |
| Attachments | Upload scans of cheques or remittance advice | `HIDE_ATTACHMENT_TAB` |

{{< figure src="/screenshots/internal-receipt-voucher/main-details.png" alt="Main details form" caption="Main Details." >}}
{{< figure src="/screenshots/internal-receipt-voucher/entity-details.png" alt="Entity details section" caption="Account tab: entity details." >}}
{{< figure src="/screenshots/internal-receipt-voucher/select-entity.png" alt="Select entity dialog" caption="Select entity dialog." >}}
{{< figure src="/screenshots/internal-receipt-voucher/settlement-tab.png" alt="Settlement tab" caption="Settlement tab." >}}
{{< figure src="/screenshots/internal-receipt-voucher/add-settlement-form.png" alt="Add settlement adjustment" caption="Add settlement adjustment." >}}

### Top action buttons

| Button | Enabled when |
|---|---|
| **Create / SAVE** | Draft; header valid (*Please complete the required fields before saving.*) |
| **FINAL** | Document `ACTIVE`, posting status `DRAFT`, at least one settlement line, no invalid serials on revenue lines, not locked; `HIDE_GENDOC_FINAL_BUTTON` off or user has `SHOW_GENDOC_FINAL_BUTTON` |
| **DISCARD** | `ACTIVE` + `DRAFT`; `HIDE_GENDOC_DISCARD_BUTTON` off or `SHOW_GENDOC_DISCARD_BUTTON` |
| **VOID** | Posting status `FINAL`; `HIDE_GENDOC_VOID_BUTTON` off or `SHOW_GENDOC_VOID_BUTTON` |
| **CLONE** | Any, unless `HIDE_CLONE_BUTTON` |
| **PRINT** | Any, unless `HIDE_PRINT_BUTTON` |

### Import Receipt Voucher

Upload a CSV/Excel file, review the **Checking** tab for row-level errors, fix or re-upload, then process. The menu is removed by `HIDE_IMPORT_RECEIPT_VOUCHER_MENU`.

{{< figure src="/screenshots/internal-receipt-voucher/import-listing.png" alt="Import listing" caption="Import listing." >}}
{{< figure src="/screenshots/internal-receipt-voucher/import-upload-master-data.png" alt="Import upload master data" caption="Upload and master-data mapping." >}}
{{< figure src="/screenshots/internal-receipt-voucher/import-checking-tab.png" alt="Import checking tab" caption="Checking tab." >}}
{{< figure src="/screenshots/internal-receipt-voucher/import-main-tab-status.png" alt="Import main tab status" caption="Import status." >}}

## Configuration

### Before you can use it

| Prerequisite | Where | Why |
|---|---|---|
| Company, branch, location | [Organisation Applet](/applets/master-data/organisation-applet/) | Branch, Location and Transaction Date are the three required header fields |
| Customer entity with an AR type | [Customer Maintenance](/applets/master-data/customer-maintenance-applet/) | The debtor journal line uses the company default `DEBTOR` for `AR_TRADE` customers and `DEBTOR_NON_TRADE` for `AR_OTHER` |
| Cashbook per bank / till, with a GL code | [Cashbook Applet](/applets/master-data/cashbook-applet/) | FINAL fails with `MISSING_CASHBOOK: STL_MTHD [code]` if the settlement method's item has no cashbook, and `MISSING_GL_CODE: STL_MTHD [code]` if the cashbook has no GL code |
| Settlement methods assigned to the branch | *Settings > Branch Settings > Default Settlement Method* | The Settlement tab only lists methods assigned to the voucher's branch |
| Company default GL codes | [Chart of Account Applet](/applets/master-data/chart-of-account-applet/) | `DEBTOR` (or `DEBTOR_NON_TRADE`), and for revenue/expense lines `SALES`, `SALES_DISCOUNT`, `OUTPUT_TAX`; `SETTLEMENT_CHARGES` if the settlement method carries a charge; `FOREX_GAIN` / `FOREX_LOSS` for foreign-currency receipts |
| Document numbering | [Organisation Applet](/applets/master-data/organisation-applet/) | Doc No (Company / Branch) are generated at save |
| Printable format | *Settings > Printable Format Settings* and Branch Settings | Needed for PRINT |
| Permissions | *Settings > Permission Set / User / Team / Role Permission* | Server-side `TNT_API_DOC_INTERNAL_RECEIPT_VOUCHER_READ/CREATE/UPDATE/DELETE_TGT_GUID`, targeted by branch — a user who lacks read for a branch will not see that branch's vouchers or the branch in the dropdown |

### Applet settings

Settings (gear icon) → *System Configuration*: **Application Settings**, **Default Selection**, **Printable Format Settings**, **Branch Settings**, **Email Template**, **Custom Resource Bundle Configuration** (relabel fields), **Custom Field Placement**, plus Webhook, Feature Visibility (team access), the permission screens, Release Notes and Applet Log. *Personalization* holds a per-user Default Selection and Sidebar.

#### Default Selection

| Setting | What it controls | Default |
|---|---|---|
| Default Branch (`DEFAULT_BRANCH`) / Default Location (`DEFAULT_LOCATION`) | Pre-selected branch and location on new vouchers; selecting the branch stores its company | none |
| Details Tab Ordering (`RECEIPT_VOUCHER_DETAILS_TAB_ORDER`) | Order of the 13 edit-form tabs | Main Details, Account, Revenue, Expenses, Settlement, Payment Adjustment, ARAP, Department Hdr, TraceDocument, Contra, Doc Link, Export, Attachments |

#### Application Settings

| Setting | What it controls | Default |
|---|---|---|
| `HIDE_IMPORT_RECEIPT_VOUCHER_MENU`, `HIDE_AUDIT_TRAIL_MENU` | Remove menu items | Off |
| `DISABLE_GEN_DOC_LISTING` | Listing loads only after a search | Off |
| `HIDE_GENDOC_SAVE_BUTTON`, `HIDE_GENDOC_FINAL_BUTTON`, `HIDE_GENDOC_DISCARD_BUTTON`, `HIDE_GENDOC_VOID_BUTTON`, `HIDE_PRINT_BUTTON`, `HIDE_CLONE_BUTTON` | Hide action buttons (overridable per user by the `SHOW_...` permissions) | Off |
| `SEND_EMAIL_TO_FINAL_GEN_DOCS_ONLY` | Email template can only be sent for finalised vouchers | Off |
| `DEFAULT_POSTING_STATUS`, `SORT_ORDER`, `ENABLE_FILTER_BY_TODAYS_TXN` | Listing default filter and sort | none |
| `HIDE_SERVER_DOC_TYPE`, `HIDE_SERVER_DOC_1/2/3`, `HIDE_CLIENT_DOC_TYPE`, `HIDE_CLIENT_DOC_1..5` | Hide document-number and client-reference fields | Off |
| `HIDE_REFERENCE`, `ENABLE_DUPLICATE_REFERENCE_CHECK` | Hide the Reference field; warn when it already exists | Off |
| `HIDE_REMARKS`, `HIDE_DESCRIPTION`, `HIDE_CREATED_BY_DETAILS` | Hide free-text and audit fields | Off |
| `HIDE_MAIN_DETAILS_TRANSACTION_DATE`, `HIDE_LOCATION`, `HIDE_TRACKING_ID`, `HIDE_PERMIT_NO`, `HIDE_VALIDITY_DATE`, `VALIDITY_DATE_REQUIRED` | Hide or require header fields | Off |
| `HIDE_CHECKED_BY`, `HIDE_APPROVED_BY` | Hide the two sign-off fields | Off |
| `HIDE_MAIN_DETAILS_SALES_AGENT`, `MANDATORY_MAIN_DETAILS_SALES_AGENT`, `ENABLE_SALES_AGENT_AUTOFILL`, `ENABLE_EMPLOYEE_LOGIN_AUTO_DETECTION` | Sales agent field: hide, require, or pre-fill from the logged-in employee | Off |
| `HIDE_CURRENCY`, `HIDE_BASE_CURRENCY`, `CANNOT_EDIT_CURRENCY_RATE`, `SHOW_FOREX_DATA_SOURCE` | Currency controls; a zero or negative rate is rejected at save | Off |
| `HIDE_SEGMENT`, `HIDE_DIMENSION`, `HIDE_PROFIT_CENTER`, `HIDE_PROJECT`, `MANDATORY_...`, `ENABLE_...` | Department header fields | Off |
| `ENABLE_SST`, `ENABLE_WHT` | Tax and withholding tax on revenue lines | Off |
| `ENABLE_CUSTOM_STATUS_HDR_1..5`, `ENABLE_CUSTOM_STATUS_LINE_1..5`, with `NAME_...` and `LIST_...` | Custom status fields with their labels and value lists | Off |
| `HIDE_PAYEE_TAB`, `ENABLE_BRANCH_FILTER`, `HIDE_ACCOUNT_BILLING_CONTACT` | Account tab: hide Payee sub-tab, filter customers by branch, hide billing contact | Off |
| `HIDE_REVENUE_TAB`, `HIDE_EXPENSES_TAB` | Remove the Revenue / Expenses tabs (users with `SHOW_REVENUE_TAB` / `SHOW_EXPENSES_TAB` still see them) | Off |
| Line columns: `HIDE_UNIT_PRICE_STD_*`, `HIDE_UNIT_PRICE_NET_*`, `HIDE_UNIT_PRICE_TXN*`, `HIDE_UNIT_DISCOUNT*`, `HIDE_DISCOUNT_AMOUNT_EXCL_TAX`, `HIDE_AMOUNT_STD_EXCL_TAX`, `HIDE_AMOUNT_NET_EXCL_TAX`, `HIDE_AMOUNT_TXN`, `HIDE_QTY_BASE`, `HIDE_QTY_UOM`, `HIDE_UOM_TO_BASE_RATIO`, `HIDE_TAX_CONFIG_SELECTION`, `HIDE_WHT_CONFIG_SELECTION`, `HIDE_LAST_PURCHASE_PRICE`, `HIDE_COSTING_DETAILS`, `HIDE_SALES_AGENT`, `HIDE_DEPARTMENT`, `HIDE_ATTACHMENT_TAB` | Hide columns and sub-tabs on Revenue/Expense lines | Off |
| `ENABLE_EDITING_UNIT_PRICE_STD`, `ENABLE_ITEM_NAME_MAX_LIMIT`, `ITEM_NAME_MAX_LIMIT` | Allow overriding the standard price; cap item-name length | Off |
| `HIDE_SETTLEMENT_TAB`, `HIDE_MAIN_PAYMENT_TAB`, `HIDE_KO_FOR_TAB`, `HIDE_DELIVERY_DETAILS_TAB`, `HIDE_DEPARTMENT_HDR_TAB`, `HIDE_MAIN_ARAP_TAB`, `HIDE_TRACE_DOCUMENT_TAB`, `HIDE_DOC_LINK_TAB`, `HIDE_EXPORT_TAB` | Remove tabs | Off |
| `HIDE_ARAP_PNS`, `HIDE_ARAP_SETTLEMENT`, `HIDE_ARAP_DOC_OPEN`, `HIDE_ARAP_CONTRA`, `HIDE_ARAP_BAL` | Hide individual ARAP figures | Off |
| `ENABLE_EDIT_SETTLEMENT_DATE` | Settlement date may differ from today (also grantable per user) | Off |
| `HIDE_TRANSACTION_NO`, `MANDATORY_TRANSACTION_NO` | Bank-transfer transaction number on a settlement line | Off |
| `HIDE_CARD_NO`, `HIDE_NAME`, `HIDE_CARD_ISSUER`, `HIDE_CARD_EXPIRY`, `HIDE_APPROVAL_CODE`, `HIDE_BATCH`, `HIDE_CARD_TYPE`, `HIDE_CVV` and `MANDATORY_...` | Card settlement fields | Off |
| `HIDE_MAIN_CONTRA_TAB`, `HIDE_DELETE_CONTRA`, `EDIT_CONTRA_TXN_DATE`, `CONTRA_DATE_SAME_AS_DOC_DATE_TXN`, `ALLOW_EXCEED_CONTRA` | Contra tab: hide it; hide the delete icon (user with `SHOW_DELETE_CONTRA` still sees it); allow editing the contra date; force the contra date to equal the voucher date; allow a contra larger than the receipt's open amount | Off |
| `VERTICAL_ORIENTATION`, `DEFAULT_ORIENTATION`, `DEFAULT_TOGGLE_COLUMN` | Vertical scrolling layout instead of tabs | Off |
| `PRINTABLE` | Printable format used for auto-print | none |

#### Branch Settings

Branch Details (Rounding Five Cent), Item Category Filter, Menu List, Pricing Scheme, Printable Format (default with header/footer/remarks), **Default Settlement Method** — the last one decides which settlement methods and which default appear on the Settlement tab for that branch. Branch settings are shared with the POS General applet's branch settings in the current build.

### Document behaviour settings

| Behaviour | Controlled by |
|---|---|
| Which settlement methods and default per branch | Branch Settings > Default Settlement Method |
| Contra larger than the open receipt amount | `ALLOW_EXCEED_CONTRA` (otherwise the dialog blocks it) |
| Contra date | `CONTRA_DATE_SAME_AS_DOC_DATE_TXN`, `EDIT_CONTRA_TXN_DATE` |
| Post-FINAL settlement correction | Payment Adjustment tab / Settlement Adjustment menu; requires the `SHOW_EDIT_SETTLEMENT_FINAL` permission |
| Post-FINAL revenue / expense correction | Revenue and Expenses adjustment, gated by the tab settings and `SHOW_REVENUE_TAB` / `SHOW_EXPENSES_TAB` |
| Email on FINAL | Email Template settings; `SEND_EMAIL_TO_FINAL_GEN_DOCS_ONLY` |
| Field labels | Custom Resource Bundle Configuration |

Approval workflow: not configurable in this applet beyond the *Checked By* / *Approved By* fields, which are informational.

### Feature visibility / permissions

Client-side permissions for `internal-receipt-voucher-applet`:

| Permission | Effect |
|---|---|
| `SHOW_GENDOC_FINAL_BUTTON`, `SHOW_GENDOC_VOID_BUTTON`, `SHOW_GENDOC_DISCARD_BUTTON` | Restore a hidden action button for this user |
| `SHOW_EDIT_SETTLEMENT_FINAL` | Allows editing settlement lines (Payment Adjustment) on a finalised voucher |
| `ENABLE_EDIT_SETTLEMENT_DATE` | Lets this user back-date settlement lines |
| `SHOW_DELETE_CONTRA` | Shows the delete icon on contra lines when `HIDE_DELETE_CONTRA` is on |
| `SHOW_REVENUE_TAB`, `SHOW_EXPENSES_TAB` | Show the tabs when hidden tenant-wide |
| `SHOW_TRACE_DOCUMENT_TAB`, `SHOW_TRANSACTION_DATE`, `SHOW_DOC_NO_TENANT/COMPANY/BRANCH`, `SHOW_CLIENT_DOC_TYPE`, `SHOW_CLIENT_DOC_1..5` | Restore hidden fields |

## Fields

### Main Details

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Branch, Location | Receiving branch and location | Yes | Only branches the user has read permission for are listed |
| Transaction Date | Receipt date | Yes | |
| Document type, Doc No (Company), Doc No (Branch) | System numbers | Generated | A short-code prefix is shown when configured |
| Client Document type, Client Doc 1–5 No | Client-side references | No | |
| Reference | Customer's remittance or cheque reference | No (`MANDATORY` not available; use `ENABLE_DUPLICATE_REFERENCE_CHECK`) | |
| Currency, Base Currency, Rate | Transaction currency | Yes | *The currency rate cannot be ZERO or negative.* |
| Sales Agent | Employee credited with the receipt | Per `MANDATORY_MAIN_DETAILS_SALES_AGENT` | |
| Checked By, Approved By | Sign-off employees | No | Informational |
| Remarks | Free text; becomes the journal description | No | |

### Settlement line

Settlement Method (from the branch's assigned methods), Settlement Type, Amount, Date, Reference, Remarks, Cheque No, Cheque Date, Card Type, Voucher No, Points and Cash-back fields for loyalty settlements, and Month / Year / Settlement Group filters in the picker.

### Revenue and Expense lines

Item code and name, quantity, UOM, unit price (inclusive of tax), tax, transaction amount, and department codes (segment, dimension, profit centre, project). Revenue lines post like sales lines; Expense lines reduce the amount banked.

### Contra

A search dialog over the customer's open documents (filterable by document type) with the amount to apply. The total contra cannot exceed the receipt's open amount unless `ALLOW_EXCEED_CONTRA` is on.

## Lifecycle and posting

| Posting status | Meaning |
|---|---|
| `DRAFT` | Saved; nothing posted. The create form starts as `TEMP` and converts to `ACTIVE` automatically once Branch and Account are filled. |
| `FINAL` | Cashbook and journal posted; settlement lines locked (Payment Adjustment for corrections) |
| `VOID` | Reversed |

**What FINAL does:**

1. Validates the header and settlement lines; a settlement line whose method has no cashbook or GL code fails with `MISSING_CASHBOOK` / `MISSING_GL_CODE`.
2. Creates one cashbook transaction line per settlement line (`txn_type` `STL_MTHD`) in the cashbook behind that settlement method. These are the lines Bank Reconciliation matches.
3. Posts the journal (handler `INTERNAL_RECEIPT_VOUCHER`):

| Journal line | Dr | Cr | GL code from |
|---|---|---|---|
| Each settlement line | Amount received (less settlement charges) | | The cashbook's GL code (a sub-ledger is created per cashbook if missing) |
| Settlement charges | Charge | | Company default `SETTLEMENT_CHARGES` |
| Customer | | Amount received | Company default `DEBTOR` (`AR_TRADE`) or `DEBTOR_NON_TRADE` (`AR_OTHER`) |
| Revenue lines | | Net amount | Line GL → item `SALES` link → company default `SALES`; tax to `OUTPUT_TAX` |
| Forex difference | Loss | Gain | `FOREX_LOSS` / `FOREX_GAIN` |

4. Applies the contra links, reducing the open balance of the linked documents and of the receipt.

Editing a finalised voucher's settlement amount is refused while the cashbook line is reconciled: *Please unreconcile this transaction from bank recon first before changing the amount: Cashbook [name] - Bank Recon [name] (month)*. Un-match it in Bank Reconciliation, adjust, then re-match.

**VOID** reverses the journal and cashbook lines and releases the contra. It is offered on any `FINAL` voucher; there is no e-Invoice lock on receipts.

## Related applets

- [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [Sales Debit Note (Internal)](/applets/sales-workflow/internal-sales-debit-note-applet/), [Sales Credit Note (Internal)](/applets/sales-workflow/internal-sales-credit-note-applet/) — the documents a receipt is applied to.
- [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/) — the outbound twin; both share the settlement, contra and adjustment mechanics.
- [Cashbook Applet](/applets/master-data/cashbook-applet/) — where settlement methods get their cashbook and GL code.
- [Bank Reconciliation](/applets/finance/bank-reconciliation-applet/) — consumes the cashbook lines and locks their amounts once matched.
- [Customer Maintenance](/applets/master-data/customer-maintenance-applet/) — the customer's AR type decides the debtor account.
- [Chart of Account Applet](/applets/master-data/chart-of-account-applet/), [Organisation Applet](/applets/master-data/organisation-applet/) — default GL codes, branches, numbering.
- [Ledger And Journal](/applets/finance/ledger-and-journal-applet/), [Debtor Report](/applets/finance/debtor-report-applet/), [Statement of Account](/applets/finance/statement-of-account-applet/) — where the posting is reviewed.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| FINAL fails with `MISSING_CASHBOOK: STL_MTHD [code]` | The settlement method item is not linked to a cashbook | Link it in the Cashbook applet |
| FINAL fails with `MISSING_GL_CODE: STL_MTHD [code]` | The cashbook has no GL code | Set the cashbook's GL code |
| Settlement tab offers no methods, or the wrong ones | No methods assigned to the voucher's branch | Branch Settings > Default Settlement Method |
| Cannot find the receipt in Bank Reconciliation | Voucher not FINAL, or the settlement method points at a different cashbook than the one being reconciled | Finalise; check which cashbook the method belongs to |
| *Please unreconcile this transaction from bank recon first…* | The cashbook line is already matched to a statement | Un-match in Bank Reconciliation, then adjust |
| Contra dialog refuses the amount | Contra total exceeds the receipt's open amount | Reduce it, or turn on `ALLOW_EXCEED_CONTRA` |
| ARAP balance not updated after contra / voucher still shows a balance after full contra | Known open-balance defect when `amount_txn` is 0 and settlement is applied only by contra | Refresh; if the balance persists report it — the fix is in the backend formula, not the voucher |
| Cannot select a cash-in-bank item on a Revenue line | Revenue lines list sales items; settlement methods belong on the Settlement tab | Record the bank movement as a settlement line |
| Branch or location dropdown missing entries | User lacks `..._READ_TGT_GUID` for that branch | Grant the branch-targeted permission |
| Two vouchers created from one Create click, in different locations | Pressing Create during the automatic TEMP-to-ACTIVE conversion (fixed 2026-08) | Update the applet; discard the duplicate |
| Pressing **+** on Settlement closes the document | Same auto-conversion race (fixed 2026-08) | Update the applet |
| New voucher not in the listing after FINAL | Listing filter (`DEFAULT_POSTING_STATUS`, date range) excludes it | Clear filters |
| Duplicate running number on two vouchers | Concurrent saves under the same sequence (reported 2026-07) | Report with both document numbers; do not renumber manually |

## Related documentation

- [Bank reconciliation guide](/guides/accounting-guides/bank-reconciliation-guide/)
- [Financial Accounting module](/modules/financial-accounting/)
