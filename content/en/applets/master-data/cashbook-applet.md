---
title: "Cashbook"
description: "Reference for the Cashbook applet, used by finance administrators and accounts clerks to maintain bank and cash accounts (cashbooks), settlement methods with charges and branch access, cash transfers, cash adjustments, post-dated cheques, bank-reconciliation matching weights and the cashbook enquiry screens."
applet_code: "cashbook-applet"
applet_repo: "blg-applet-wavelet-cashbook-v3-applet"
modules: [core, financial-accounting, pos]
related_applets: [chart-of-account-applet, organisation-applet, bank-reconciliation-applet, internal-receipt-voucher-applet, internal-payment-voucher-applet, pos-general-applet, general-ledger-applet, doc-item-maintenance-applet]
guides: [/guides/accounting-guides/bank-reconciliation-guide/]
sources:
  configuration:
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/app.routing.ts
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/app.component.ts
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/settings-container/field-configuration/field-configuration.component.ts
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/settings-container/branch-settings/branch/branch.component.html
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/settings-container/branch-settings/branch/default-settlement-method/default-settlement-method.component.html
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/settings-container/branch-settings/branch/default-cash-transfer/default-cash-transfer.component.html
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/settings-container/branch-settings/branch/default-printable-format/default-printable-format.component.html
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/settings-container/printable-settings-container/printable-settings-create/printable-settings-create.component.html
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/state-controllers/printable-format-controller/store/effects/printable-format.effects.ts
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/cash-transfer-container/cash-transfer-listing/cash-transfer-listing.component.ts
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/cash-transfer-container/cash-transfer-edit/cash-transfer-edit.component.ts
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/cash-transfer-container/cash-transfer-edit/export/export.component.ts
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/cash-transfer-container/cash-transfer-edit/cash-transfer-line-listing/add-cash-transfer-line/simplified-ui/transfer-from-cashbook/transfer-from-cashbook-details.component.ts
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/cash-query-transaction-container/cash-query-transaction-listing/cash-query-transaction-listing.component.ts
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/cash-level-container/cash-level-listing/cash-level-listing.component.ts
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/cashbook-container/cashbook-listing/cashbook-listing.component.ts
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/cashbook-container/cashbook-edit/cashbook-edit.component.html
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/settlement-method-container/settlement-method-edit/settlement-method-edit.component.html
    - blg-applet-wavelet-pos-general-applet/micro-fe/projects/wavelet-erp/applets/pos-general-applet/src/app/components/settlement-container/settlement-adjustment-add/settlement-adjustment-add.component.ts
  fields:
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/cashbook-container/cashbook-create/cashbook-create.component.ts
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/cashbook-container/cashbook-edit/cashbook-edit.component.html
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/cashbook-container/add-member/add-member.component.html
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/cashbook-container/add-member/add-member.component.ts
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/cashbook-container/create-weightage-config/create-weightage-config.component.ts
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/cashbook-container/edit-weightage-config/edit-weightage-config.component.ts
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/cashbook-container/edit-weightage-config/edit-weightage-config.component.html
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/state-controllers/cashbook-controllers/store/effects/cashbook.effects.ts
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/settlement-method-container/settlement-method-create/settlement-method-create.component.ts
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/settlement-method-container/settlement-method-edit/settlement-method-edit.component.html
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/cash-transfer-container/cash-transfer-create/cash-transfer-main-details/cash-transfer-main-details.component.html
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/cash-transfer-container/cash-transfer-create/cash-transfer-main-details/cash-transfer-main-details.component.ts
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/cash-transfer-container/cash-transfer-edit/cash-transfer-line-listing/add-cash-transfer-line/cash-transfer-line-main-details/cash-transfer-line-main-details.component.html
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/cash-transfer-container/cash-transfer-edit/cash-transfer-line-listing/add-cash-transfer-line/add-cash-transfer-line.component.ts
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/cash-adjustment-container/cash-adjustment-create/cash-adjustment-main-details/cash-adjustment-main-details.component.html
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/cash-adjustment-container/cash-adjustment-create/cash-adjustment-main-details/cash-adjustment-main-details.component.ts
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/cash-adjustment-container/cash-adjustment-create/cash-adjustment-line-listing/add-cash-adjustment-line/add-cash-transfer-line/cash-adjustment-line-main-details/cash-adjustment-line-main-details.component.html
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/cash-adjustment-container/cash-adjustment-create/cash-adjustment-line-listing/add-cash-adjustment-line/add-cash-transfer-line/add-cash-adjustment-line.component.ts
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/post-dated-cheque-queue/post-dated-cheque-queue-listing/post-dated-cheque-queue-listing.component.ts
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/post-dated-cheque-queue-history/post-dated-cheque-queue-history-listing/post-dated-cheque-queue-history-listing.component.ts
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/cash-transfer-by-transaction-container/cash-transfer-by-transaction-listing/cash-transfer-by-transaction-listing.component.ts
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/cash-transfer-by-transaction-container/cash-transfer-by-transaction-edit/cash-transfer-by-transaction-edit.component.ts
    - blg-applet-wavelet-cashbook-v3-applet/micro-fe/projects/wavelet-erp/applets/cashbook-v3-applet/src/app/components/cashbook-discrepancy-container/cashbook-discrepancy/cashbook-discrepancy.component.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/cashbook/CashbookDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/cashbook/CashbookReconConfigDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/settlementMethod/SettlementMethodDataConsistencyObject.java
  lifecycle:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/cashTransfer/CashTransferService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/cashTransfer/CashTransferJournalPostingService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/cashTransfer/CashDocumentCashbookTxnLinePostingJobProcessorService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/cashTransfer/CashDocumentPostDatedChequeQueuePostingService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/cashTransfer/PostDatedChequePendingProcessingQueueService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/cashTransfer/CashDocumentJournalPostingJobProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/cashTransfer/CashDocumentPostDatedChequeQueuePostingJobProcessor.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/bankRecon/CashbookTxnStmtReconPossibleLinkService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/BankReconciliationUows/BankReconciliationUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/BankStatementUows/BankStatementUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/CashbookTxnUows/CashbookTxnLineUow.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/GenericDocServerDocTypeEnum.java
  troubleshooting:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/cashTransfer/CashTransferJournalPostingService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/cashTransfer/CashTransferService.java
    - gh:bigledger/blg-int-general-task#9138
    - gh:bigledger/blg-int-general-task#9120
    - gh:bigledger/blg-int-general-task#9119
    - gh:bigledger/blg-int-general-task#7616
    - gh:bigledger/blg-int-general-task#7381
    - gh:bigledger/blg-int-general-task#7289
    - gh:bigledger/blg-int-general-task#5573
    - gh:bigledger/blg-int-general-task#2008
    - gh:bigledger/blg-int-general-task#9787
tags: [core-module, cash-management, bank-accounts, financial-accounting, cash-flow]
weight: 30
aliases:
- /applets/cashbook-applet/
---

## Overview

The Cashbook applet defines every place money is held — bank accounts, cash drawers, card-acquirer and e-wallet accounts — as a **cashbook** tied to a company and a GL code, and every way money moves in or out as a **settlement method** (cash, cheque, bank transfer, card, e-wallet, voucher, points…). Receipt vouchers, payment vouchers, POS and the bank reconciliation all pick from what is set up here.

It also records money moving *between* cashbooks (**Cash Transfer**), corrections to a cashbook balance (**Cash Adjustment**), post-dated cheques waiting to be banked in, and provides the enquiry screens (**Query Cashbook Transaction**, **Cash Level**, **Cashbook Discrepancy Checking**) that finance uses at month-end. Each cashbook also carries the **Weightage Configuration** that the Bank Reconciliation auto-matcher uses. It is set up once by the finance administrator and then used daily by the cashier and the accounts clerk.

## Where it fits

| Direction | Applet / document | Why |
|---|---|---|
| Upstream | [Chart of Account](/applets/master-data/chart-of-account-applet/) | Every cashbook must point at a GL code of its company; cash transfer journals post to the GL codes behind the cashbooks / settlement methods on each line |
| Upstream | [Organisation](/applets/master-data/organisation-applet/) | Company and branch on the cashbook; branch access on settlement methods; branch settings |
| Downstream | [Receipt Voucher](/applets/finance/internal-receipt-voucher-applet/), [Payment Voucher](/applets/finance/internal-payment-voucher-applet/) | Choose a settlement method, which resolves to a cashbook and its GL code; post-dated cheques received there arrive in the PD Cheque queue here |
| Downstream | [POS General](/applets/sales-workflow/pos-general-applet/) | Tenders are settlement methods; the per-branch default settlement method per tender type is set in Branch Settings here and read by POS General's settlement adjustment screen |
| Downstream | [Bank Reconciliation](/applets/finance/bank-reconciliation-applet/) | Reconciles a cashbook's transaction lines against the bank statement; uses the cashbook's Members and Weightage Configuration |
| Downstream | [General Ledger](/applets/finance/general-ledger-applet/) | Journals created when a cash *transfer* is finalised (cash adjustments do not post a journal — see *Lifecycle and effects*) |
| Sibling | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) | A settlement method is stored as a financial item of type `STL_MTHD`; it can therefore surface in item lists |

Modules: Core, Financial Accounting, POS.

## Screens and menus

| Menu | What it is for |
|---|---|
| **Cashbook** | Listing, create and edit of cashbooks (Details, Triggers & Limits, Members, Weightage Configuration tabs) |
| **Settlement Method** | Listing, create and edit of settlement methods |
| **Import Cashbook**, **Import Settlement Method**, **Import Settlement Method Branch** | CSV uploads with a checking step before commit |
| **Cash Transfer** | Move money between two cashbooks (`DRAFT` → `FINAL` → `VOID`) |
| **Cash Transfer By Transaction** | Listing of individual cash-transfer transaction lines; edit moves a line to a different cashbook |
| **Upload Cash Transfer** | CSV upload of transfers |
| **PD Cheque** → **Queue**, **History** | Post-dated cheques waiting to be banked in, and those already banked in |
| **Query Cashbook Transaction** | Opening balance, every line with debit / credit, running balance, drill-down to the source document and its journal |
| **Cash Adjustment** | Correct a cashbook balance with an adjustment document (`DRAFT` → `FINAL`) |
| **Cash Level** | Opening, in/out and closing per cashbook, with GL code and company |
| **Cashbook Discrepancy Checking** | Lines where the document amount and the cashbook amount differ |
| **Audit Trail** | Change history |

Gear (Settings) menu: **Application Settings** (route `settings/field-settings`), **Default Selection**, **Printable Format Settings**, **Branch Settings**, plus the shared permission, webhook, feature-visibility, release-notes and applet-log screens. Personalisation: per-user **Default Selection**.

### Cashbook

Create asks for **Cashbook Code**, **Cashbook Name**, **Account Number**, **Company**, **Currency** and **GL Code**. The edit screen has four tabs:

| Tab | Contents |
|---|---|
| **Details** | Code, name, description, account number, branch, bank, status, default settlement method (only when `ENABLE_SETTLEMENT_METHOD` is on), audit fields |
| **Triggers & Limits** | Low level trigger, high level trigger, facility amount, overdraft limit — numbers stored on the cashbook |
| **Members** | Tenant users (by e-mail) linked to this cashbook, each with rank `MEMBER` and a status |
| **Weightage Configuration** | Named configurations for the bank-reconciliation auto-matcher (see *Fields*) |

### Settlement Method

Create asks for **Code**, **Name**, **Sort Code** (display order) and the **Cashbook** it settles into. The edit screen:

| Tab | Contents |
|---|---|
| **Details** | Settlement type, cashbook, status, external settlement code, payment provider / gateway, PGW payment ID and type code, installment period, membership point currency, min / max threshold amount, settlement limit (amount or percentage), labels |
| **Branch** | Which branches may use this method |
| **Charges** | Charges the bank / provider takes from you (mode `NONE` / `RATIO` / `ABSOLUTE`, rate or absolute value, min / max limit, additional surcharge), separate *sending* charges, and a surcharge passed on to the customer (mode, rate or value, rounding precision, the item code it is billed under) |
| **Tax** | Tax codes applied to the charges |
| **Payment Provider Error Codes** | Error code, description and remarks mapped from the payment gateway |
| **FPX e-Mandate** | Biller, exchange and seller IDs — shown only when the settlement type is `FPX_EMANDATE` |

Settlement types: `BANK_TRANSFER`, `CASH`, `CHEQUE`, `CREDIT_CARD`, `DEBIT_CARD`, `E_WALLET`, `FPX_EMANDATE`, `MEMBERSHIP_POINT_CURRENCY`, `OPEN_CREDIT`, `VOUCHER`, `OTHERS`.

### Cash Transfer

A cash document with a transfer number, transfer type (**Bank In**, **TT**, **Cash**), company, branch, reference number, transaction date, remarks and status, plus transfer lines of three kinds: **Transfer From Cashbook** (stored negative), **Transfer To Cashbook** (positive) and **Transfer Charges** (positive). Lines whose settlement type is `POST_DATED_CHEQUE` also carry a cheque date. Listing buttons: **FINAL**, **VOID**, **SINGLE/MULTIPLE PRINT**; edit buttons: **FINAL**, **SAVE**, **CLONE**.

### Cash Adjustment

A cash document (document type, adjustment number, company, currency, transaction date, remarks) with lines of type **Adjust In** (positive) or **Adjust Out** (negative) against a cashbook. Listing and edit offer **FINAL** and **SAVE** only; there is no VOID button.

### PD Cheque

**Queue** lists post-dated cheques not yet banked in (transfer no., document type and no., transaction date, cheque date, amount). Select rows, choose the receiving cashbook and its bank-in settlement method, and press **BANK IN**. **History** lists what has been banked in, with the origin, from and to cashbooks and the process status.

### Enquiries

- **Query Cashbook Transaction** — one cashbook (or several), one period: an opening-balance row, then each line with document short code and number, branch, payee, reference, remarks, transaction date, cashbook, debit, credit, credit-card details and running balance. Rows drill down to the source document and its journal.
- **Cash Level** — cashbook, GL code, company, opening, in/out, closing; filtered by company and cashbook.
- **Cashbook Discrepancy Checking** — transaction date, company, document short code and number, item code, document amount, cashbook amount and the difference.

## Configuration

### Before you can use it

| Prerequisite | Where | Why |
|---|---|---|
| Company with a chart of accounts, and branches | [Organisation](/applets/master-data/organisation-applet/) | The backend rejects a cashbook whose company is missing or unknown (`CASHBOOK_HDR_OBJECT_COMPANY_GUID_IS_NULL_OR_EMPTY` / `…_DOES_NOT_EXIST`) |
| A GL code per bank / cash account, in that company's chart | [Chart of Account](/applets/master-data/chart-of-account-applet/) | Required on the cashbook (`CASHBOOK_HDR_OBJECT_GLCODE_GUID_IS_NULL_OR_EMPTY`); the GL code must belong to the cashbook's company (`CASHBOOK_HDR_OBJECT_COMPANY_AND_GLCODE_GUID_ARE_INCONGRUENT`) |
| A `PRIMARY` ledger for the company | Chart of Account > Companies > Ledgers | Cash transfer posting creates a sub-ledger on the company ledger for each cashbook GL code it meets for the first time |
| A cashbook before its settlement methods | this applet | Settlement method create requires a cashbook |
| Branches linked on each settlement method | this applet, Settlement Method > Branch | Branch linkage is what the transaction applets filter on |
| A surcharge item, if you surcharge customers | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) | `surchargeToCustomerItemCode` bills the surcharge as an item line |
| A printable format for `INTERNAL_CASH_TRANSFER`, if you print transfers | Settings > Printable Format Settings | The listing's print button is disabled until a default printable is chosen |

### Applet settings

Settings live in **applet-local** components (`settings-container/field-configuration`, `default-settings`, `branch-settings`, `printable-settings-container`); the applet does not use the shared `FieldConfigurationComponent`. Application Settings and Default Selection save through `SessionActions.saveMasterSettingsInit`, so a change applies to every user of the applet; Branch Settings save per branch; Personalisation > Default Selection saves per user. Anyone who can open the gear menu can change them — the applet registers no permission for the settings screens.

**Settings > Application Settings** — six tabs. Every row below is declared in `applet-settings.model.ts`, rendered as a control, saved by the SAVE button and read by the component named in *Effect*.

| Setting (tab) | What it controls | Default | Effect when changed |
|---|---|---|---|
| `HIDE_SETTLEMENT_METHOD`, `HIDE_IMPORT_CASHBOOK_MENU`, `HIDE_IMPORT_SETTLEMENT_METHOD_MENU`, `HIDE_IMPORT_SETTLEMENT_METHOD_BRANCH_MENU`, `HIDE_CASH_TRANSFER`, `HIDE_UPLOAD_CASH_TRANSFER_MENU`, `HIDE_PD_CHEQUE_MENU`, `HIDE_QUERY_CASHBOOK_TRANSACTION_MENU`, `HIDE_CASH_TRANSFER_BY_TRANSACTION_MENU`, `HIDE_CASH_ADJUSTMENT_MENU`, `HIDE_CASH_LEVEL_MENU` (*Sidebar Menu*) | The eleven hideable left-menu entries | off — form control created with no value; an unset key is treated as shown | `app.component.ts` hides the entry for everyone who lacks the matching `SHOW_*` permission (`updateMenuItem(state, !SHOW && HIDE)`). **Cashbook**, **Cashbook Discrepancy Checking** and **Audit Trail** have no switch |
| `HIDE_EXTERNAL_SETTLEMENT_CODE`, `HIDE_INSTALLMENT_PERIOD`, `HIDE_THRESHOLD_AMOUNT`, `HIDE_PGW_PAYMENT_ID`, `HIDE_PGW_PAYMENT_TYPE_CODE` (*Settlement*) | Fields on the settlement method Details tab | off (`false`) | `settlement-method-edit.component.html` drops the field from the form |
| `VERTICAL_ORIENTATION` (*Settlement > Vertical UI Settings*) | Vertical layout of the cash transfer screens | off (no value) | Read by the cash transfer container, edit screen and line dialogs |
| `DISPLAY_CASH_TRANSFER_RUNNING_NUMBER` (*Cashbook Transfer*) | — | off (`false`) | **Rendered but not consumed**: no component reads this key (repository search at commit `57f147b7`) |
| `SAVE_CASH_TRANSFER_DETAILS` (*Cashbook Transfer*) | Keeps the header and unsaved transfer lines of a `DRAFT` transfer in the browser's local storage so they survive leaving the page | off (`false`) | `cash-transfer-edit`, `cash-transfer-line-listing` and `cash-transfer-main-details` restore the cached values when you return |
| `SORT_BY_COLUMN`, `ORDER_BY` (*Cashbook Listing*) | — | none | **Rendered but not consumed**: the cashbook listing always orders by `date_updated` (`cashbook-listing.component.ts`) |
| `ENABLE_SETTLEMENT_METHOD` (*Cashbook Listing > Cashbook Settlement Method*) | Whether a cashbook carries a **default settlement method**, and which way round the cash transfer line dialog works | off (no value) | On: the cashbook edit screen shows a required *Default settlement method* field; the transfer line dialog asks for the cashbook first and pre-fills its default settlement method; Cash Transfer By Transaction applies the default settlement method of the cashbook you move a line to. Off: the line dialog asks for the settlement type first and then the cashbook |
| `ENABLE_AUTO_POPUP` (*Create & Print Documents*) | Opens the generated PDF in a preview instead of downloading it | off (no value) | Read by `cash-transfer-listing.component.ts` when printing |
| `HIDE_VOID_TRANSACTIONS` (*Query Cashbook Txn*) | Removes `VOID` documents from Query Cashbook Transaction and Cash Level | off (no value) | The opening-balance request is sent with `remove_void_posting_status = true` and lines whose generic-document or cash-document posting status is `VOID` are filtered out |

**Settings > Default Selection** — *Default Branch* and *Default Location* pickers (`DEFAULT_BRANCH`, `DEFAULT_LOCATION`). **Rendered but not consumed**: no screen in this applet reads them; they are declared in the model for parity with other applets.

**Personalisation > Default Selection** (per user) — the same two pickers plus `DEFAULT_TOGGLE_COLUMN` (`SINGLE` / `DOUBLE`) and `DEFAULT_ORIENTATION` (`HORIZONTAL` / `VERTICAL`); the last two are read by the cash transfer screens and the audit-trail listing to choose the one- or two-column layout.

**Settings > Printable Format Settings** — upload a printable format (code, name, file). Choosing the default sets `PRINTABLE_CASH_TRANSFER` in the master settings (`printable-format.effects.ts`); that key has no control of its own and is read at runtime by the transfer listing's print button and by the shared cash-document export.

**Settings > Branch Settings** — per branch, six tabs saved to the branch settings record:

| Tab | Keys | Read by |
|---|---|---|
| Branch Details | read-only branch information | — |
| Item Category Filter | `ITEM_CATEGORY_1` … `ITEM_CATEGORY_10` (multi-select category levels) | Nothing in this applet; stored on the branch settings record |
| Pricing Scheme | branch pricing-scheme list | Nothing in this applet |
| Printable Format | default printable for `INTERNAL_CASH_TRANSFER`, header and footer text | `cash-transfer-edit/export`: the branch default is used, falling back to `PRINTABLE_CASH_TRANSFER` |
| Default Settlement Method | `default_settlement_cash`, `_cheque`, `_bank_transfer`, `_credit_card`, `_debit_card`, `_ewallet`, `_voucher`, `_membership_point_currency`, `_others` — one settlement method per tender type | Not read by this applet; POS General reads them on its settlement adjustment screen (`settlement-adjustment-add.component.ts`) |
| Default Cash Transfer | `transferFrom`, `transferTo` — the settlement methods pre-selected on the simplified transfer line dialog | `simplified-ui/transfer-from-cashbook-details` and `transfer-to-cashbook-details` |

### Document behaviour settings

Cash Transfer and Cash Adjustment are cash documents with a posting status, but the applet exposes no per-document behaviour switch beyond `SAVE_CASH_TRANSFER_DETAILS`, `ENABLE_AUTO_POPUP` and the printable settings above. No approval workflow, status-flow option or e-Invoice flag exists in this applet (routes and settings components checked at commit `57f147b7`).

### Feature visibility / permissions

`app.component.ts` checks eleven client-side permission codes, one per hideable menu; a permission holder sees the menu even when the tenant has hidden it. Eight are seeded in the registry (`bl_applet_client_side_perm_dfn`, checked 2026-09-05); three are checked in code but not seeded, so those menus can only be hidden for everyone:

| Permission | Unlocks | Seeded |
|---|---|---|
| `SHOW_CASH_TRANSFER` | Cash Transfer | yes |
| `SHOW_CASH_ADJUSTMENT_MENU` | Cash Adjustment | yes |
| `SHOW_CASH_LEVEL_MENU` | Cash Level | yes |
| `SHOW_PD_CHEQUE_MENU` | PD Cheque queue and history | yes |
| `SHOW_QUERY_CASHBOOK_TRANSACTION_MENU` | Query Cashbook Transaction | yes |
| `SHOW_UPLOAD_CASH_TRANSFER_MENU` | Upload Cash Transfer | yes |
| `SHOW_IMPORT_SETTLEMENT_METHOD_MENU`, `SHOW_IMPORT_SETTLEMENT_METHOD_BRANCH_MENU` | The two settlement-method imports | yes |
| `SHOW_SETTLEMENT_METHOD`, `SHOW_IMPORT_CASHBOOK_MENU`, `SHOW_CASH_TRANSFER_BY_TRANSACTION_MENU` | Settlement Method, Import Cashbook, Cash Transfer By Transaction | no |

The cashbook **Members** tab writes `bl_fi_cashbook_login_subject_link` rows (endpoint `cashbook-login-subject-links`). Nothing in this applet reads them; the backend's bank-reconciliation, bank-statement and cashbook-transaction-line queries that take a login subject join this table (`BankReconciliationUow`, `BankStatementUow`, `CashbookTxnLineUow`), which is how [Bank Reconciliation](/applets/finance/bank-reconciliation-applet/) limits a user to the cashbooks they are a member of. Membership does not restrict any screen in the Cashbook applet itself.

## Fields

### Cashbook — create / Details

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Cashbook Code | Unique code | Yes (form) | Backend enforces uniqueness (`CASHBOOK_HDR_OBJECT_CODE_VIOLATES_UNIQUE_CONSTRAINT`) |
| Cashbook Name | Display name | Yes (form) | — |
| Account Number | Bank account number | Yes on the edit form | — |
| Company | Owning company | Yes (backend) | Must exist |
| Currency | Account currency | No | — |
| GL Code | Bank / cash account in the ledger | Yes (backend) | Must exist and belong to the company's chart |
| Branch, Bank | Owning branch, bank master | No | Branch must exist if given (`CASHBOOK_HDR_OBJECT_BRANCH_GUID_DOES_NOT_EXIST`) |
| Description | Free text | No | — |
| Status | `ACTIVE` / `INACTIVE` | Yes (edit form) | — |
| Default settlement method | Pre-selected method for this cashbook | Yes when shown | Shown only when `ENABLE_SETTLEMENT_METHOD` is on |

### Cashbook — Triggers & Limits

`lowLevelTrigger`, `highLevelTrigger`, `facilityAmount`, `overdraftLimit` — four numbers stored on the cashbook. No component in this applet and no backend service reads them (search of the applet and `blg-akaun-platform-java` at commits `57f147b7` / `871dbf5c`); they are informational.

### Cashbook — Members

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Select Email | One or more tenant users; only users with a confirmed e-mail login are listed | Yes | A user already linked is refused client-side ("already exists") |
| Rank | Fixed value `MEMBER` (read-only) | Yes | — |
| Status | `ACTIVE` / `INACTIVE` | Yes | — |

### Cashbook — Weightage Configuration

A configuration tells the [Bank Reconciliation](/applets/finance/bank-reconciliation-applet/) auto-matcher how much each of four matching dimensions counts when it scores a bank-statement line against a cashbook line. Rows are stored in `bl_fi_mst_cashbook_recon_config` with the weights in `config_json`.

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Configuration Code | Identifier (upper-cased on save) | Yes | Immutable after save |
| Configuration Name | Display name | Yes | — |
| Status | `ACTIVE` / `INACTIVE` | Yes | Only an `ACTIVE` configuration is read by the matcher; edit shows it read-only |
| Object Type | Fixed `MANUAL`, set by the applet | — | Read-only |
| Matching by Amount / Date / Reference / Payee | Tick a dimension and give its **weightage (%)** | No | Unticked dimensions get no weight; a negative weight is refused; the total must not exceed 100 % (client-side check — the backend validator has no weight rule) |
| Auto Matching Threshold (70–100) | The score at which a match is linked automatically | Yes | Whole number 70–100; shown as 100 when the stored value is missing |
| One to One Matching | Restricts the matcher to single-line matches | No | Default off |

How the matcher uses it (`CashbookTxnStmtReconPossibleLinkService`): the weights are taken from the cashbook's active `config_json` (`matching_by_amount/date/reference/payee.weightage`, divided by 100); when there is no configuration each dimension weighs **0.25**; the threshold is `auto_link_threshold / 100` (a value outside 70–100 is logged as a warning); `match_one_to_one = true` skips the one-bank-line-to-many-cashbook-lines grouping. The create form also writes empty `matching_by_approval`, `matching_by_remark` and `matching_by_description` keys, which no screen renders and no service reads.

### Settlement Method — create / Details

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Code, Name | Identity | Yes | Max 255; stored as a financial item of type `STL_MTHD`, so the code must also be unique among items (`ITEM_HDR_OBJECT_CODE_ALREADY_EXIST`) |
| Sort Code | Display order in tender lists | Yes | Max 255 |
| Cashbook | Where settled money lands | Yes | — |
| Settlement Type | One of the types listed under *Screens and menus* | No | — |
| Status | `ACTIVE` / `INACTIVE` | — | — |
| External settlement code | Code used by an external system | No | Hideable |
| Payment provider / gateway, PGW payment ID, PGW payment type code | Gateway integration | No | Hideable |
| Installment period | For instalment tenders | No | Hideable |
| Min / max threshold amount, settlement limit type and amount / percentage | Limits on a single settlement | No | Hideable |
| Membership point currency | For point tenders | No | — |
| Labels | Grouping labels | No | — |
| Charges (mode, rate, absolute value, min / max limit, additional surcharge), Sending charges (same set), Surcharge to customer (mode, rate, absolute value, rounding precision, item code) | Charges tab | No | Charges also drive the amounts of the bank-in transfer created from the PD Cheque queue |

### Cash Transfer

| Field | Meaning | Required |
|---|---|---|
| Cash Transfer No | Read-only number | generated |
| Transfer Type | `Bank In`, `TT`, `Cash` | No |
| Company, Branch | Owning company and branch | Yes |
| Reference No, Remarks | Free text | No |
| Transaction Date | Posting date | Yes |
| Status | `ACTIVE` / `INACTIVE` | No |
| Line: Transfer Line Type | `Transfer From Cashbook`, `Transfer To Cashbook`, `Transfer Charges` | Yes |
| Line: Cashbook and Settlement Method / Type | The account and tender on this side of the movement (order of the two pickers depends on `ENABLE_SETTLEMENT_METHOD`) | Yes |
| Line: Cash Transfer Amount | Entered positive; stored negative for *Transfer From Cashbook*, positive otherwise | Yes |
| Line: Post Dated Cheque Date | Shown and required when the settlement type is `POST_DATED_CHEQUE` | Conditional |
| Line: Remarks | Free text | No |

### Cash Adjustment

| Field | Meaning | Required |
|---|---|---|
| Document Type, Doc No | Read-only (`INTERNAL_CASH_ADJUSTMENT`, generated) | — |
| Company, Currency, Transaction Date | Header | Yes |
| Remarks | Free text | No |
| Line: Adjustment Type | `Adjust In` (stored positive) / `Adjust Out` (stored negative) | Yes |
| Line: Cashbook | The cashbook being corrected | Yes |
| Line: Amount, Remarks | Entered positive | Amount yes |

### Cash Transfer By Transaction

Listing columns: Transfer No, Doc Short Code, Transaction Date, Cashbook, Transfer Line Type, Settlement Method, Txn Amount, Description, Branch, Posting Status. The edit form shows the transfer no, posting status, transfer line type, current cashbook and amount read-only and lets you pick a **new cashbook** (required); SAVE is disabled until the cashbook differs from the current one. Use it to move a line that was posted to the wrong cashbook.

### PD Cheque Queue / History

Queue columns: Cash Transfer No., Doc Type, Doc No., Date Txn, PD Cheque Date, Total Amount, Created / Updated Date. Bank-in inputs: receiving cashbook and its bank-in settlement method. History adds Process Status, Origin / From / To Cashbook.

## Lifecycle and effects

Cashbooks, settlement methods, members and weightage configurations are master records (`ACTIVE` / `INACTIVE`); they do not post. The two cash documents behave differently:

| Document | Server document type | Statuses (UI) | On FINAL | On VOID |
|---|---|---|---|---|
| Cash Transfer | `INTERNAL_CASH_TRANSFER` (short code `CSHTFR`) | `DRAFT` → `FINAL` → `VOID` (FINAL and VOID buttons on the listing, FINAL on the edit screen) | Three job processors are queued to run immediately with 3 retries (`CashTransferService`): **journal posting**, **cashbook transaction lines**, **PD cheque queue** | The same three processors run in reverse: the journal is reversed, the cashbook lines are negated, the PD cheque queue rows are deleted |
| Cash Adjustment | `INTERNAL_CASH_ADJUSTMENT` (`CSHADJ`) | `DRAFT` → `FINAL` (no VOID button in the applet) | **Cashbook transaction lines only** — the journal processor returns without posting for this type (`CashDocumentJournalPostingJobProcessor`), and the manual re-post endpoint rejects it with `NOT_A_CASH_TRANSFER` (`JournalPostingService`) | Not reachable from the applet |

**Posting proof — Cash Transfer** (`CashTransferJournalPostingService`, backend commit `871dbf5c`):

- *Server document type*: `INTERNAL_CASH_TRANSFER`; it is a cash document (`bl_fi_cash_document_hdr`), not a generic document, so it has no `FinancialDocDataConsistencyObject` signums.
- *Amount signum*: carried in the line amount — the applet stores *Transfer From* lines as `−amount`, *Transfer To* and *Transfer Charges* lines as `+amount`. *Quantity signum*: none (no stock).
- *Dr/Cr equation*: one journal line per transfer line; a negative amount becomes **Cr** of its absolute value, a positive amount becomes **Dr**. So **Dr** the *To* cashbook GL (and the charges GL) / **Cr** the *From* cashbook GL. The journal is `AUTO`, type `TXN`, dated on the transfer date.
- *GL precedence*: the sub-ledger for (company, line settlement item) → otherwise the cashbook that owns that settlement item, whose GL code gets a new sub-ledger on the company ledger. There is no header GL and no company default: a settlement item with no cashbook throws `MISSING_CASHBOOK: STL_MTHD [code]`, a cashbook with no GL code throws `MISSING_GL_CODE: STL_MTHD [code]`.
- *Balance check*: the journal is refused with `TOTAL_DEBITS_AND_TOTAL_CREDITS_NOT_BALANCES: Total Debits: …, Total Credits: …` when debits and credits sum to zero, and with `NO_JOURNAL_CREATED` when both sides are zero; posting requires `posting_status = FINAL` (`CASH_DOC_POSTING_STATUS_NOT_FINAL`) and reversal requires `VOID` (`CASH_DOC_POSTING_STATUS_NOT_VOID`).
- *Stock processor*: none.
- *What VOID reverses*: a reversal journal with debit and credit swapped on every line; cashbook transaction lines re-created with the amount negated; PD cheque queue rows deleted.

**Cashbook transaction lines** (`CashDocumentCashbookTxnLinePostingJobProcessorService`): for `FINAL` transfers and adjustments every line except `Transfer_Charges` becomes a `bl_fi_cashbook_txn_line` with `open_amount = txn_amount = amount` (negated on reversal); a line whose settlement type is `POST_DATED_CHEQUE` is flagged `is_post_dated_cheque` with its cheque date and cheque number. Editing a `FINAL` document re-synchronises both the lines and the journal (matched by cash document line; orphans are soft-deleted) instead of creating a second set.

**FINAL edits are blocked once reconciled.** Changing the company, transaction date, transfer lines or amount of a `FINAL` transfer whose cashbook lines have an active bank-reconciliation link is refused by `CashTransferService` with `CASH_DOCUMENT_RECONCILED_TXN_LINES_BLOCK_EDIT` ("Please unreconcile this transaction from bank recon first …"). Remarks- and reference-only edits pass.

**Post-dated cheques.** On `FINAL`, every cashbook line flagged as a post-dated cheque creates a `bl_fi_pd_cheque_pending_processing_queue` row (source document, cashbook, settlement method, amount, cheque date, payee, transaction number). Queue rows also arrive from generic documents (receipt vouchers) that carry a post-dated cheque. **Bank In** on the queue builds a new `INTERNAL_CASH_TRANSFER` with three lines — *from* the cheque's cashbook (negative), *to* the chosen cashbook (the cheque amount less the sending settlement method's charges, applying its absolute / ratio, min and max rules) and a *Transfer Charges* line for the difference — saves it through the normal transfer create path, writes its cashbook lines and a History row, then deletes the queue row. Voiding the source transfer deletes its queue rows.

**Journals in the Chart of Account's fiscal periods.** Cash documents are not generic documents, so the `LOCK_TXN` / `LOCK_ALL` check in `GenericDocumentService` does not apply to them; their journals are `AUTO` and therefore also bypass the `LOCK_GL` check on manual journals (see [Chart of Account](/applets/master-data/chart-of-account-applet/)).

## Related applets

- [Chart of Account](/applets/master-data/chart-of-account-applet/) — the GL code behind every cashbook and the company ledger that receives the cash transfer sub-ledgers.
- [Organisation](/applets/master-data/organisation-applet/) — companies and branches.
- [Bank Reconciliation](/applets/finance/bank-reconciliation-applet/) — matches a cashbook's lines to the bank statement using the Members and Weightage Configuration set here; a reconciled transfer can no longer be re-dated or re-amounted.
- [Receipt Voucher](/applets/finance/internal-receipt-voucher-applet/) and [Payment Voucher](/applets/finance/internal-payment-voucher-applet/) — money in and out through settlement methods; post-dated cheques received there queue here.
- [POS General](/applets/sales-workflow/pos-general-applet/) — tenders are settlement methods; the per-branch defaults per tender type come from Branch Settings here.
- [General Ledger](/applets/finance/general-ledger-applet/) — where cash transfer journals are visible (cash adjustments post none).
- [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) — settlement methods are items of type `STL_MTHD`; the customer surcharge is billed as an item.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| Cannot save a cashbook: GL code / company error | GL code missing, or it belongs to a different company's chart than the cashbook's company | Pick a GL code from the same company's chart; create one in Chart of Account if needed |
| Cash transfer finalised but no journal, error `MISSING_CASHBOOK: STL_MTHD [code]` or `MISSING_GL_CODE: STL_MTHD [code]` | The settlement method on a transfer line is not attached to a cashbook, or that cashbook has no GL code | Attach the settlement method to a cashbook with a GL code and finalise again |
| Finalised cash transfer shows no journal, no error | An earlier journal for the same transfer had been deleted and the idempotency check counted it — backend defect fixed in 2026 (#9120, #9119) | Update the backend; re-post the transfer |
| Editing a FINAL transfer fails with `CASH_DOCUMENT_RECONCILED_TXN_LINES_BLOCK_EDIT` | Its cashbook lines are already matched in Bank Reconciliation | Unreconcile the lines first, then edit |
| Cash adjustment finalised but nothing in the General Ledger | By design — cash adjustments write cashbook transaction lines only, no journal | Post a manual journal if the ledger must move too; the Cashbook Discrepancy screen will otherwise show the difference |
| Query Cashbook Transaction shows nothing for a company that was set up recently | The cash-document processors were not yet enabled for that tenant (#5573) | Ask the platform team to enable the cash document job processors for the tenant |
| Settlement method not offered in Receipt Voucher / POS at a branch | No settlement type set, the branch is not linked on the method's Branch tab, or the branch default for that tender type is unset | Set the type; link the branch; set Branch Settings > Default Settlement Method |
| Settlement method appears in an expense item picker (for example the Payment Voucher expense list) | Settlement methods are financial items of type `STL_MTHD` and some pickers do not filter by type (#7616) | Filter by item type in that applet; report the picker if it lacks the filter |
| Cash Level lists cashbooks from every company | Cashbook filter ignored the company filter — fixed in 2026 (#9138) | Update the applet build |
| Cash bill / receipt number missing on the cashbook line | Source document reference missing on the transaction line — fixed in 2026 (#7381) | Update the build; use the Query Cashbook Transaction drill-down meanwhile |
| Transaction date on the cashbook line or journal differs from the voucher date | Timezone handling defect on the posting path — fixed in 2026 (#7289) | Update the backend; re-post affected documents |
| A receipt landed in the wrong cashbook | Wrong settlement method chosen on the source document (#9787) | Move the line with **Cash Transfer By Transaction** (transfer lines) or re-issue the source document |
| Import Cashbook rejects the file | The checking step needs at least `cashbook_code`, `cashbook_name`, `account_number`, `gl_code`, `company_code` per row (#2008) | Download the sample format and fill those columns |
| Print button on the transfer listing is disabled | No default printable format chosen (`PRINTABLE_CASH_TRANSFER` unset) | Settings > Printable Format Settings, choose a default |

## Related documentation

- [Bank reconciliation guide](/guides/accounting-guides/bank-reconciliation-guide/) — the month-end procedure that starts from a cashbook.
- [Financial Accounting module](/modules-v2/financial-accounting/) and [Opening balances](/modules-v2/financial-accounting/opening-balance/).
- [Core module](/modules-v2/core/).
