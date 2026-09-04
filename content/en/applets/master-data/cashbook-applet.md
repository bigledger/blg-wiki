---
title: "Cashbook"
description: "Reference for the Cashbook applet — bank and cash accounts (cashbooks), settlement methods with charges and branch access, cash transfers, cash adjustments, post-dated cheques and cashbook enquiries."
applet_code: "cashbook-applet"
applet_repo: "blg-applet-wavelet-cashbook-v3-applet"
modules: [core, financial-accounting, pos]
related_applets: [chart-of-account-applet, organisation-applet, bank-reconciliation-applet, internal-receipt-voucher-applet, internal-payment-voucher-applet, pos-general-applet, general-ledger-applet, doc-item-maintenance-applet]
guides: [/guides/accounting-guides/bank-reconciliation-guide/]
sources:
  - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/models/menu-items.ts
  - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
  - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/settings-container/branch-settings/branch/default-settlement-method/default-settlement-method.component.html
  - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/cashbook-container/cashbook-create/cashbook-create.component.ts
  - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/cashbook-container/cashbook-edit/cashbook-edit.component.html
  - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/settlement-method-container/settlement-method-create/settlement-method-create.component.ts
  - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/settlement-method-container/settlement-method-edit/settlement-method-edit.component.html
  - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/cash-transfer-container/cash-transfer-create/cash-transfer-main-details/
  - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/cash-adjustment-container/cash-adjustment-create/cash-adjustment-main-details/
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/cashTransfer/CashTransferJournalPostingService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/cashbook/CashbookDataConsistencyObject.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/settlementMethod/SettlementMethodDataConsistencyObject.java
  - akaun_master.bl_applet_client_side_perm_dfn (applet cashbook-applet)
tags: [core-module, cash-management, bank-accounts, financial-accounting, cash-flow]
weight: 30
aliases:
- /applets/cashbook-applet/
---

## Overview

The Cashbook applet defines every place money is held — bank accounts, cash drawers, card-acquirer and e-wallet accounts — as a **cashbook** tied to a company and a GL code, and every way money moves in or out as a **settlement method** (cash, cheque, bank transfer, card, e-wallet, voucher, points…). Receipt vouchers, payment vouchers, POS and the bank reconciliation all pick from what is set up here.

It also records money moving *between* cashbooks (**Cash Transfer**), corrections to a cashbook balance (**Cash Adjustment**), post-dated cheques, and gives the enquiry screens (**Query Cashbook Transaction**, **Cash Level**, **Cashbook Discrepancy Checking**) that finance uses at month-end. It is set up once by the finance administrator and then used daily by the cashier and the accounts clerk.

## Where it fits

| Direction | Applet / document | Why |
|---|---|---|
| Upstream | [Chart of Account](/applets/master-data/chart-of-account-applet/) | Every cashbook must point at a GL code of its company; cash transfers and adjustments post journals through the company's default GL codes |
| Upstream | [Organisation](/applets/master-data/organisation-applet/) | Company and branch on the cashbook; branch access on settlement methods |
| Downstream | [Receipt Voucher](/applets/finance/internal-receipt-voucher-applet/), [Payment Voucher](/applets/finance/internal-payment-voucher-applet/) | Choose a settlement method, which resolves to a cashbook and its GL code |
| Downstream | [POS General](/applets/sales-workflow/pos-general-applet/) | Tenders are settlement methods; each branch's defaults per tender type are set in Branch Settings here |
| Downstream | [Bank Reconciliation](/applets/finance/bank-reconciliation-applet/) | Reconciles a cashbook's transactions against the bank statement |
| Downstream | [General Ledger](/applets/finance/general-ledger-applet/) | Journals created when a cash transfer or adjustment is finalised |
| Sibling | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) | A settlement method is stored as a financial item of type `STL_MTHD`; it can therefore surface in item lists |

Modules: Core, Financial Accounting, POS.

## Screens and menus

| Menu | What it is for |
|---|---|
| **Cashbook** | Listing, create and edit of cashbooks |
| **Settlement Method** | Listing, create and edit of settlement methods |
| **Import Cashbook**, **Import Settlement Method**, **Import Settlement Method Branch** | CSV uploads |
| **Cash Transfer** | Move money between two cashbooks (draft → final) |
| **Cash Transfer By Transaction** | Transfer built from selected cashbook transactions |
| **Upload Cash Transfer** | CSV upload of transfers |
| **PD Cheque** → **Queue**, **History** | Post-dated cheques waiting to mature, and those already processed |
| **Query Cashbook Transaction** | Opening balance, every line, amount in / out, closing balance, drill-down to source documents — the month-end enquiry |
| **Cash Adjustment** | Correct a cashbook balance with a posted adjustment document |
| **Cash Level** | Summary of balances across cashbooks, grouped by company or currency |
| **Cashbook Discrepancy Checking** | Compare cashbook balances against ledger balances |
| **Audit Trail** | Change history |

Gear (Settings) menu: **Application Settings**, **Default Selection**, **Printable Format Settings**, **Branch Settings**. Personalisation: per-user **Default Selection**.

### Cashbook

Create asks for **Cashbook Code**, **Cashbook Name**, **Account Number**, **Company**, **Currency** and **GL Code**. Once saved, the edit screen has four tabs:

| Tab | Contents |
|---|---|
| **Details** | Code, name, description, account number, bank, branch, status, default settlement method, audit fields |
| **Triggers & Limits** | Low-level and high-level balance triggers, overdraft limit, facility amount |
| **Members** | Users (by e-mail) attached to this cashbook, each with a rank and status |
| **Weightage Configuration** | Named configurations (code, name, object type, status, threshold 70–100) that work with member ranks |

### Settlement Method

Create asks for **Code**, **Name**, **Sort Code** (display order) and the **Cashbook** it settles into. The edit screen:

| Tab | Contents |
|---|---|
| **Details** | Settlement type, cashbook, status, external settlement code, payment provider / gateway, PGW payment ID and type code, installment period, membership point currency, min / max threshold amount, settlement limit (amount or percentage), labels |
| **Branch** | Which branches may use this method (and which are blocked) |
| **Charges** | Charges the bank / provider takes from you (mode `NONE` / `RATIO` / `ABSOLUTE`, rate or absolute value, min / max limit, additional surcharge), separate *sending* charges, and a surcharge passed on to the customer (mode, rate or value, rounding precision, the item code it is billed under) |
| **Tax** | Tax codes applied to the charges |
| **Payment Provider Error Codes** | Error code, description and remarks mapped from the payment gateway |
| **FPX e-Mandate** | Biller, exchange and seller IDs — shown only when the settlement type is `FPX_EMANDATE` |

Settlement types: `BANK_TRANSFER`, `CASH`, `CHEQUE`, `CREDIT_CARD`, `DEBIT_CARD`, `E_WALLET`, `FPX_EMANDATE`, `MEMBERSHIP_POINT_CURRENCY`, `OPEN_CREDIT`, `VOUCHER`, `OTHERS`. A method with no type does not appear as a tender option in the transaction applets.

{{< callout type="tip" >}}
**Automatic bank charges.** For a card-acquirer settlement method, set *Charges* mode to `RATIO` and the rate to the acquirer's merchant discount rate (for example 1.5%). Each receipt settled with that method then posts the fee to the bank-charges account automatically, so the cashbook shows the net amount the bank actually credits.
{{< /callout >}}

### Cash Transfer

A document with a running number (`cashTransferNo`), transaction date, transfer type (**Bank In**, **TT**, **Cash**), reference number, description and status, plus transfer lines: **Transfer From** cashbook (credited), **Transfer To** cashbook (debited), amount, date, remarks. Save as draft, review, then **Finalize**.

Use it for the monthly sweep from a branch's card-acquirer cashbook to the primary bank cashbook, or to move cash-on-hand to the bank.

### Cash Adjustment

A document (`cashAdjustmentNo`, cash document type, transaction date, remarks) with adjustment lines against a cashbook. Use it to correct a cashbook balance that cannot be explained by a source document — for example an opening-balance correction — rather than a manual journal, so that the cashbook and the ledger stay in step.

### Enquiries

- **Query Cashbook Transaction** — one cashbook, one period: opening balance, lines with amount in and amount out, closing balance, drill-down to the receipt, payment, transfer or POS document behind each line.
- **Cash Level** — all cashbooks at once, filtered by company (fixed in 2026 so the cashbook list follows the company filter) and grouped as needed.
- **Cashbook Discrepancy Checking** — lists cashbooks whose transaction total differs from the ledger.

## Configuration

### Before you can use it

| Prerequisite | Where | Why |
|---|---|---|
| Company with a chart of accounts, and branches | [Organisation](/applets/master-data/organisation-applet/) | Cashbook requires a company; the backend rejects a missing or unknown company (`CASHBOOK_HDR_OBJECT_COMPANY_GUID_IS_NULL_OR_EMPTY`) |
| A GL code per bank / cash account, in that company's chart | [Chart of Account](/applets/master-data/chart-of-account-applet/) | Required on the cashbook; the backend rejects a GL code that does not belong to the cashbook's company (`CASHBOOK_HDR_OBJECT_COMPANY_AND_GLCODE_GUID_ARE_INCONGRUENT`) |
| Default GL codes mapped for the company (at least `SETTLEMENT_CHARGES`) | Chart of Account > Companies > Default GL Codes | Charges and transfer journals resolve their accounts through the company GL-code links |
| A cashbook before its settlement methods | this applet | Settlement method create requires a cashbook |
| Branches linked on each settlement method | this applet, Settlement Method > Branch | A method with no branch link is not offered at that branch |
| Bank-charges item, if you surcharge customers | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) | `surchargeToCustomerItemCode` bills the surcharge as an item line |

### Applet settings

**Settings > Application Settings**

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| `HIDE_SETTLEMENT_METHOD`, `HIDE_IMPORT_CASHBOOK_MENU`, `HIDE_IMPORT_SETTLEMENT_METHOD_MENU`, `HIDE_IMPORT_SETTLEMENT_METHOD_BRANCH_MENU`, `HIDE_CASH_TRANSFER`, `HIDE_UPLOAD_CASH_TRANSFER_MENU`, `HIDE_PD_CHEQUE_MENU`, `HIDE_QUERY_CASHBOOK_TRANSACTION_MENU`, `HIDE_CASH_TRANSFER_BY_TRANSACTION_MENU`, `HIDE_CASH_ADJUSTMENT_MENU`, `HIDE_CASH_LEVEL_MENU` | Left-menu entries | off (shown) | Hidden for everyone except holders of the matching `SHOW_*` permission |
| `SORT_BY_COLUMN`, `ORDER_BY` (*Cashbook Listing Sorting Order*) | Default sort of the cashbook listing | — | Presentation |
| `DISPLAY_CASH_TRANSFER_RUNNING_NUMBER` (*Cashbook Transfer Listing*) | Show the running number column | off | Presentation |
| `SAVE_CASH_TRANSFER_DETAILS` | Keep unsaved transfer lines in the browser's local storage so they survive leaving the page | off | Lines are restored when you return to the transfer |
| `VERTICAL_ORIENTATION` (*Vertical UI Settings*) | Vertical tab layout | off | Presentation |
| `ENABLE_AUTO_POPUP` (*Preview File Before Downloading*) | Open printables in a preview before download | off | — |
| `HIDE_VOID_TRANSACTIONS` (*Hide Reverse Transactions*) | Hide voided / reversed lines in Query Cashbook Transaction | off | Enquiry shows net lines only |
| `ENABLE_SETTLEMENT_METHOD` (*Cashbook Settlement Method*) | Show the default settlement method field on the cashbook | off | — |
| `HIDE_EXTERNAL_SETTLEMENT_CODE`, `HIDE_INSTALLMENT_PERIOD`, `HIDE_THRESHOLD_AMOUNT`, `HIDE_PGW_PAYMENT_ID`, `HIDE_PGW_PAYMENT_TYPE_CODE` (*Settlement Method*) | Hide the payment-gateway and threshold fields on the settlement method form | off | Simplifies the form for tenants without gateway integration |

**Settings > Branch Settings** — per branch, the default settlement method for each tender type: `default_settlement_cash`, `default_settlement_cheque`, `default_settlement_bank_transfer`, `default_settlement_credit_card`, `default_settlement_debit_card`, `default_settlement_ewallet`, `default_settlement_voucher`, `default_settlement_membership_point_currency`, `default_settlement_others`. POS and the voucher applets pre-select these when a cashier picks a tender type at that branch.

**Settings > Default Selection** / **Personalisation** — tenant-wide and per-user default selections (company, branch) for the listing filters.

**Settings > Printable Format Settings** — code and name of printable formats for cash transfer and adjustment documents.

### Document behaviour settings

Cash Transfer and Cash Adjustment are documents with `DRAFT` → `FINAL` → `VOID` statuses, but the applet has no per-document behaviour switches beyond `DISPLAY_CASH_TRANSFER_RUNNING_NUMBER` and `SAVE_CASH_TRANSFER_DETAILS` above. No approval workflow or e-Invoice flags apply.

### Feature visibility / permissions

Registered client-side permissions for `cashbook-applet` — each re-enables, for its holder, a menu the tenant has hidden:

| Permission | Unlocks |
|---|---|
| `SHOW_CASH_TRANSFER` | Cash Transfer menu |
| `SHOW_CASH_ADJUSTMENT_MENU` | Cash Adjustment |
| `SHOW_CASH_LEVEL_MENU` | Cash Level |
| `SHOW_PD_CHEQUE_MENU` | PD Cheque queue and history |
| `SHOW_QUERY_CASHBOOK_TRANSACTION_MENU` | Query Cashbook Transaction |
| `SHOW_UPLOAD_CASH_TRANSFER_MENU` | Upload Cash Transfer |
| `SHOW_IMPORT_SETTLEMENT_METHOD_MENU`, `SHOW_IMPORT_SETTLEMENT_METHOD_BRANCH_MENU` | The two settlement-method imports |

Cashbook-level access is additionally controlled by the **Members** tab on each cashbook and by the **Branch** tab on each settlement method.

## Fields

### Cashbook — create / Details

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Cashbook Code | Unique code | Yes | Backend enforces uniqueness (`CASHBOOK_HDR_OBJECT_CODE_VIOLATES_UNIQUE_CONSTRAINT`) |
| Cashbook Name | Display name | Yes | — |
| Account Number | Bank account number | No | — |
| Company | Owning company | Yes (backend) | Must exist |
| Currency | Account currency | No in the form | Set it for foreign-currency accounts |
| GL Code | Bank / cash account in the ledger | Yes (backend) | Must exist and belong to the company's chart |
| Bank, Branch | Bank master and owning branch | No | Branch must exist if given |
| Description, Status | — | No | — |
| Default settlement method | Pre-selected method for this cashbook | No | Shown when `ENABLE_SETTLEMENT_METHOD` is on |

### Cashbook — Triggers & Limits

| Field | Meaning |
|---|---|
| Low level trigger / High level trigger | Balance thresholds for alerts |
| Overdraft limit | Allowed negative balance |
| Facility amount | Credit facility attached to the account |

### Settlement Method — create / Details

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Code, Name | Identity | Yes | Max 255; stored as a financial item of type `STL_MTHD`, so the code must also be unique among items (`ITEM_HDR_OBJECT_CODE_ALREADY_EXIST`) |
| Sort Code | Display order in tender lists | Yes | — |
| Cashbook | Where settled money lands | Yes | — |
| Settlement Type | One of the types listed above | Needed to appear as a tender | — |
| Status | Active / inactive | — | — |
| External settlement code | Code used by an external system | No | Hideable |
| Payment provider / gateway, PGW payment ID, PGW payment type code | Gateway integration | No | Hideable |
| Installment period | For instalment tenders | No | Hideable |
| Min / max threshold amount, settlement limit type and amount / percentage | Limits on a single settlement | No | Hideable |
| Membership point currency | For point tenders | No | — |
| Labels | Grouping labels | No | — |

### Cash Transfer

| Field | Meaning | Required |
|---|---|---|
| Transfer No. | Running number | generated |
| Transaction date | Posting date | Yes |
| Transfer type | `Bank In`, `TT`, `Cash` | Yes |
| Reference no., Description | Free text | No |
| Line: From cashbook, To cashbook, Amount, Date, Remarks | The movement | Yes |

## Lifecycle and posting

| Document | Statuses | On FINAL | On VOID |
|---|---|---|---|
| Cash Transfer | `DRAFT` → `FINAL` → `VOID` | One journal per transfer: **Dr** the *To* cashbook's GL code, **Cr** the *From* cashbook's GL code (a negative line amount is written as the credit). GL codes are resolved from company + cashbook / settlement method → sub-ledger → GL code. Only `FINAL` documents post; the posting service refuses anything else (`CASH_DOC_POSTING_STATUS_NOT_FINAL`) | The document is voided; its lines are hidden from Query Cashbook Transaction when `HIDE_VOID_TRANSACTIONS` is on |
| Cash Adjustment | `DRAFT` → `FINAL` → `VOID` | Posts a journal against the cashbook's GL code through the same cash-document posting service | The document is voided |

A finalised transfer cannot be edited; if a `FINAL` transfer's lines are changed by an administrator, the backend re-resolves the GL codes and rewrites the existing journal rather than creating a second one.

Cashbooks and settlement methods are master records (`ACTIVE` / `INACTIVE`) and do not post by themselves.

## Related applets

- [Chart of Account](/applets/master-data/chart-of-account-applet/) — the GL code behind every cashbook and the default GL codes used for charges and transfers.
- [Organisation](/applets/master-data/organisation-applet/) — companies and branches.
- [Bank Reconciliation](/applets/finance/bank-reconciliation-applet/) — matches a cashbook's lines to the bank statement.
- [Receipt Voucher](/applets/finance/internal-receipt-voucher-applet/) and [Payment Voucher](/applets/finance/internal-payment-voucher-applet/) — money in and out through settlement methods.
- [POS General](/applets/sales-workflow/pos-general-applet/) — tenders are settlement methods; branch defaults come from Branch Settings here.
- [General Ledger](/applets/finance/general-ledger-applet/) — where cash transfer and adjustment journals are visible.
- [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) — settlement methods are items of type `STL_MTHD`; the customer surcharge is billed as an item.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| Cannot save a cashbook: GL code / company error | GL code is missing, or belongs to a different company's chart than the cashbook's company | Pick a GL code from the same company's chart; create one in Chart of Account if needed |
| Settlement method not offered in Receipt Voucher / POS at a branch | No settlement type set, or the branch is not linked on the method's Branch tab, or the branch default for that tender type is unset | Set the type; link the branch; set Branch Settings |
| Cashbook "item" appears in an expense item list (for example the Payment Voucher expense picker) | Settlement methods are stored as financial items of type `STL_MTHD` and some pickers do not filter by type | Filter by item type in that applet; report the picker if it lacks the filter |
| Finalised cash transfer shows no journal | An earlier journal for the same transfer was deleted and the posting idempotency check counted it; fixed in the backend in 2026 by ignoring `DELETED` journals | Update the backend; re-post the transfer |
| Cash Level lists cashbooks from every company | Cashbook filter ignored the company filter; fixed in 2026 | Update the applet build |
| Cash bill / receipt number not shown on the cashbook line | Source document reference missing on the transaction line (defect fixed in 2026) | Update the build; use Query Cashbook Transaction drill-down meanwhile |
| Bank charges not posted on card receipts | Charges mode is `NONE`, or `SETTLEMENT_CHARGES` default GL code is unmapped | Set mode `RATIO` with the rate; map the default GL code in Chart of Account |
| Bank reconciliation cannot find a cashbook | Cashbook is inactive or the user is not a member | Reactivate; add the user on the Members tab |

## Related documentation

- [Bank reconciliation guide](/guides/accounting-guides/bank-reconciliation-guide/) — the month-end procedure that starts from a cashbook.
- [Financial Accounting module](/modules-v2/financial-accounting/) and [Opening balances](/modules-v2/financial-accounting/opening-balance/).
- [Core module](/modules-v2/core/).
