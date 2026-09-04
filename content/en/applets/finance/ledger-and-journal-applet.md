---
title: "Ledger And Journal"
description: "Review every journal the system posts, key manual journals, maintain ledgers and sub-ledgers, import journals in bulk, and run error checks on the General Ledger."
applet_code: "LedgerAndJournal"
applet_repo: "blg-applet-wavelet-ledger-and-journal-applet"
modules: [financial-accounting]
related_applets:
  - chart-of-account-applet
  - financial-report-applet
  - organisation-applet
  - cashbook-applet
  - internal-sales-invoice-applet
  - internal-purchase-invoice-applet
  - internal-receipt-voucher-applet
  - internal-payment-voucher-applet
  - bank-reconciliation-applet
  - fixed-asset-applet
guides:
  - /guides/accounting-guides/journal-entries/
  - /guides/accounting-guides/chart-of-accounts-setup/
  - /guides/accounting-guides/financial-reporting/
sources:
  - blg-applet-wavelet-ledger-and-journal-applet/micro-fe/projects/wavelet-erp/applets/ledger-and-journal-applet/src/app/models/menu-items.ts
  - blg-applet-wavelet-ledger-and-journal-applet/micro-fe/projects/wavelet-erp/applets/ledger-and-journal-applet/src/app/models/applet-settings.model.ts
  - blg-applet-wavelet-ledger-and-journal-applet/micro-fe/projects/wavelet-erp/applets/ledger-and-journal-applet/src/app/app.routing.ts
  - blg-applet-wavelet-ledger-and-journal-applet/micro-fe/projects/wavelet-erp/applets/ledger-and-journal-applet/src/app/components/settings-container/application-settings/application-settings.component.ts
  - blg-applet-wavelet-ledger-and-journal-applet/micro-fe/projects/wavelet-erp/applets/ledger-and-journal-applet/src/app/components/settings-container/default-settings/default-settings.component.html
  - blg-applet-wavelet-ledger-and-journal-applet/micro-fe/projects/wavelet-erp/applets/ledger-and-journal-applet/src/app/components/journal-container/journal-create/journal-create.component.ts
  - blg-applet-wavelet-ledger-and-journal-applet/micro-fe/projects/wavelet-erp/applets/ledger-and-journal-applet/src/app/components/journal-container/journal-listing/journal-listing.component.ts
  - blg-applet-wavelet-ledger-and-journal-applet/micro-fe/projects/wavelet-erp/applets/ledger-and-journal-applet/src/app/components/journal-container/journal-view/journal-view.component.ts
  - blg-applet-wavelet-ledger-and-journal-applet/micro-fe/projects/wavelet-erp/applets/ledger-and-journal-applet/src/app/components/ledger-container/ledger-view/ledger-view.component.ts
  - blg-applet-wavelet-ledger-and-journal-applet/micro-fe/projects/wavelet-erp/applets/ledger-and-journal-applet/src/app/components/error-checking-container/
  - blg-applet-wavelet-ledger-and-journal-applet/micro-fe/projects/wavelet-erp/applets/ledger-and-journal-applet/src/app/components/settings-container/release-notes/release-notes.component.html
  - blg-applet-wavelet-ledger-and-journal-applet/micro-fe/projects/wavelet-erp/applets/ledger-and-journal-applet/src/app/state-controllers/journal-controller/store/effects/journal.effects.ts
  - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/journal-services/journal.service.ts
  - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/journal/JournalController.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/JournalUow.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/JournalDataConsistencyObject.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
  - akaun_master.bl_applet_client_side_perm_dfn (applet code LedgerAndJournal)
tags:
- accounting-module
- financial-accounting
- general-ledger
- transaction-processing
- journal
- ledger
weight: 60
---

## Overview

The **Ledger And Journal** applet is where the General Ledger lives. Every document that reaches FINAL elsewhere — sales invoices, purchase invoices, receipts, payments, stock adjustments — writes a journal here automatically (`AUTO`), and accountants key their own adjustments, accruals and opening balances as manual journals (`MANUAL`). The applet also maintains the ledgers (primary and secondary books per company), the sub-ledgers (the account-level detail under each GL code), a bulk journal importer, and an Error Checking workspace that finds unbalanced journals, documents with no journal, and missing forex or card-charge entries.

A short introduction:

{{< youtube gfeKHc7R70w >}}

## Where it fits

| Direction | Applet | Relationship |
|---|---|---|
| Upstream (master data) | [Chart of Account Applet](/applets/master-data/chart-of-account-applet/) | GL sections, categories and codes that every journal line must use; company default GL codes that automatic posting relies on |
| Upstream (master data) | [Organisation Applet](/applets/master-data/organisation-applet/) | Companies and branches; each company needs a primary ledger before any journal can be created |
| Upstream (master data) | [Cashbook Applet](/applets/master-data/cashbook-applet/) | Cashbooks that journal lines can be tagged with |
| Upstream (documents) | [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/), [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/), [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/), POS, returns, credit/debit notes, stock adjustments, [Fixed Asset](/applets/finance/fixed-asset-applet/) | FINAL on these documents creates an `AUTO` journal here |
| Downstream | [Financial Report](/applets/finance/financial-report-applet/) | Reads the posted balances (after month-end processing) for Trial Balance, P&L and Balance Sheet |
| Downstream | [Bank Reconciliation](/applets/finance/bank-reconciliation-applet/) | Uses the cashbook lines that accompany settlement journals |

Module: [Financial Accounting](/modules-v2/financial-accounting/).

## Screens and menus

| Menu item | Route | What it is |
|---|---|---|
| **Journal Transaction** | `journal` | Listing of every journal (auto and manual); create, view, clone, delete manual journals |
| **Sub Ledger** | `subledger` | Account-level detail under each GL code, with its journal lines |
| **Ledger** | `ledger` | The books of accounts per company (Primary, Secondary, Consolidated) |
| **Import Journal** | `file-import` | Bulk upload of manual journals from the CSV template |
| **Error Checking** | `error-checking` | Diagnostic tabs: Journal Not Balance, Missing Journal, Missing Journal Forex Gain Loss, Update Journal Remarks, Missing Credit Card Charge |

### Journal Transaction

{{< figure src="/images/lnj-applet/9c696aae-37d9-4adc-8807-3ff1692e29cc.png" caption="Journal Transaction listing" >}}

Listing columns: Journal No (tenant running number), Journal No By Company (company running number, shown when `DISPLAY_JOURNAL_TRANSACTION_RUNNING_NUMBER` is on or the user holds that permission), Document Type and Document No (the source document — `INTERNAL_SALES_INVOICE`, `INTERNAL_PAYMENT_VOUCHER` …), Branch, Entity, Status, Posting.

{{< callout type="info" >}}
**Auto vs. manual.** `AUTO` journals are written by other applets when a document reaches FINAL; they are read-only unless `ALLOW_USER_TO_EDIT_AUTO_POSTED_JOURNAL` is on. `MANUAL` journals are keyed or imported here and can be edited while balanced.
{{< /callout >}}

**Create Journal Transaction** opens a two-part form:

{{< figure src="/images/lnj-applet/3c13c12b-6576-45ef-9231-fef212d302ba.png" caption="Create Journal Transaction" >}}
{{< figure src="/images/lnj-applet/16e77d8a-d199-4f75-a4d6-4201c0b24dcb.png" caption="Main tab" >}}

- **Main** — Company, Ledger, Currency, Transaction Date, Reference Number, Description, Server Doc Type / Server Doc No (filled automatically for `AUTO` journals; left blank for manual ones).
- **Lines** — one row per account affected: Branch, GL Code, Cashbook (optional), Entity (optional), Amount Debit *or* Amount Credit, Description, and on the **Categories** sub-tab Segment, Dimension, Project and Profit Center.

{{< figure src="/images/lnj-applet/b04e1f29-f1f5-444e-a673-5a7e346c7f04.png" caption="Lines tab" >}}
{{< figure src="/images/lnj-applet/f3af1441-372f-44a4-83ed-2335cd557e67.png" caption="Add Line Item — Main" >}}
{{< figure src="/images/lnj-applet/69c70ccd-dc14-44a2-b76e-db99384f4262.png" caption="Add Line Item — Categories" >}}

The **Create** button stays disabled until Company, Currency, Ledger and Transaction Date are filled, at least one line exists, total debits equal total credits, and the total is not zero — hovering the button lists which condition is unmet.

**View Journal Transaction** shows Main, Line Items and Export tabs. Actions: **CLONE** (copies the journal into a new draft — the usual way to reverse or repeat an entry; swap the debit and credit amounts to reverse) and, on the listing, a tick-box **delete** for manual journals.

### Sub Ledger

{{< figure src="/images/lnj-applet/65bd3c8f-9b12-40d7-9514-e9ae40d0ab7a.png" caption="Sub Ledger listing" >}}

A sub-ledger is the account-level record under a GL code: one per customer, supplier, cashbook, fixed asset, expense account and so on. The listing shows Name, GL Code, GL Section, GL Category and Account No; the view has Main (only **Description** and **Remarks** are editable — Company, Ledger, Name and GL Code are fixed once created), Journal Lines (every posted line hitting this sub-ledger; void transactions hidden by default; the opening balance is shown instead of the balance brought-down and carried-down rows), Line Items, Posting and Count tabs.

{{< figure src="/images/lnj-applet/98b54577-f889-48f3-8983-0a0da744e11e.png" caption="Edit Sub Ledger — Main" >}}
{{< figure src="/images/lnj-applet/565c7702-aff2-40b8-a13f-e21544b58c74.png" caption="Journal Lines tab" >}}

Sub-ledgers are created automatically: automatic posting and manual journal creation both create a sub-ledger for a GL code (or for a cashbook) if none exists yet in that company and ledger. If a sub-ledger is mapped to the wrong GL code and already has transactions, create a new one under the right code and transfer the balance by journal.

### Ledger

{{< figure src="/images/lnj-applet/2b662f69-b66e-48ed-b728-fdf88f5f596d.png" caption="Ledger listing" >}}
{{< figure src="/images/lnj-applet/203a9621-6b58-4b88-addf-ee22de76a7bf.png" caption="Ledger details" >}}

A ledger is a book of accounts for a company: **PRM** (Primary — statutory reporting in base currency), **SEC** (Secondary — an alternative view such as another currency or standard) or **CONSOLIDATED**. Fields: Ledger Code, Ledger Name, Currency, Ledger Type. The primary ledger is protected; only secondary ledgers can be deleted. A company must have a primary ledger before any journal — automatic or manual — can be created; the backend refuses with `PRIMARY_LEDGER_NOT_EXIST` otherwise.

### Import Journal

Download the sample `MasterData_Upload_Ledger_&_Journal.csv`, fill one row per journal line and upload it; the listing shows each file's Process Status (`VALIDATING_DATA`, `DONE`, `FAILED`). Columns: `COMPANY_CODE`, `HDR_BRANCH_CODE`, `LEDGER_CODE`, `REFERENCE_NUMBER`, `CURRENCY_CODE`, `HDR_DESCRIPTION`, `DATE_TXN`, `LINE_BRANCH_CODE`, `LINE_GL_CODE`, `LINE_CASHBOOK_CODE`, `LINE_ENTITY_CODE`, `LINE_AMOUNT_DEBIT`, `LINE_AMOUNT_CREDIT`, `LINE_DESCRIPTION`. Rows sharing the same header values form one journal; each journal must balance.

### Error Checking

| Tab | What it finds | Filters |
|---|---|---|
| Journal Not Balance | Journals whose debit total differs from the credit total | Date From / Date To |
| Missing Journal | FINAL documents of a chosen Server Doc Type that have no journal (or whose journal was deleted); a button re-creates the journal | Date From / Date To, Server Doc Type |
| Missing Journal Forex Gain Loss | Settled foreign-currency documents without a forex gain/loss journal | Date range |
| Update Journal Remarks | Re-syncs journal descriptions from the source document's reference and remarks | Date range, doc type |
| Missing Credit Card Charge | Card settlements whose bank-charge journal is absent | Date range |

## Configuration

### Before you can use it

| Prerequisite | Where | Why |
|---|---|---|
| Company with a primary (`PRM`) ledger | *Ledger* menu of this applet, or created with the company in [Organisation Applet](/applets/master-data/organisation-applet/) | Journal creation looks up the company's `PRM` ledger and fails with `PRIMARY_LEDGER_NOT_EXIST` |
| GL codes, sections and categories | [Chart of Account Applet](/applets/master-data/chart-of-account-applet/) | Every line needs a GL code; the section/category decide where the balance appears on reports |
| Company default GL codes | Chart of Account applet (company GL-code links: `DEBTOR`, `CREDITOR`, `SALES`, `PURCHASE`, `INPUT_TAX`, `OUTPUT_TAX`, …) | Automatic posting from documents needs them; missing ones surface as `MISSING_DEFAULT_GL_CODE` on the source document, and the document then shows up in *Missing Journal* |
| Cashbooks | [Cashbook Applet](/applets/master-data/cashbook-applet/) | Lines tagged with a cashbook feed Bank Reconciliation |
| Branches | Organisation Applet | Header and line branch; the branch dropdown lists only branches the user may read |
| Permissions | *Settings > Permission Set / User / Team / Role Permission* | Journal read/create/update/delete are branch- and company-targeted; a user without read for a company sees an empty listing |

### Applet settings

Settings (gear icon) → *System Configuration*: **Application Settings**, **Default Selection**, **Printable Format Settings**, plus Webhook, Feature Visibility, the permission screens, Release Notes and Applet Log. *Personalization* holds a per-user Default Selection and Sidebar.

#### Application Settings

| Setting | What it controls | Default |
|---|---|---|
| `ALLOW_USER_TO_EDIT_AUTO_POSTED_JOURNAL` | Lets users edit lines of `AUTO` journals (those written by other applets). Off: auto journals are read-only; edit them by correcting the source document | Off |
| `DISPLAY_JOURNAL_TRANSACTION_RUNNING_NUMBER` (label *DISPLAY RUNNING NUMBER*) | Shows the *Journal No By Company* column in the listing | Off |

#### Default Selection

| Setting | What it controls |
|---|---|
| Default Company (`DEFAULT_COMPANY`) | Company pre-selected on a new journal |
| Default Ledger (`DEFAULT_LEDGER`) | Ledger pre-selected on a new journal |
| Default Currency (`DEFAULT_CURRENCY`) | Currency pre-selected on a new journal |
| Default Branch (`DEFAULT_BRANCH`) | Branch pre-selected on header and lines |

#### Printable Format Settings

Create a format (Format Code, Format Name) for the journal voucher printout used by the Export tab and batch print. `PRINTABLE` stores the default.

### Document behaviour settings

Not configurable in this applet beyond the two Application Settings above: there is no approval workflow, no posting-status flow on manual journals, and no period lock here (period closing is done by month-end processing).

### Feature visibility / permissions

| Permission (`bl_applet_client_side_perm_dfn`, applet `LedgerAndJournal`) | Effect |
|---|---|
| `ALLOW_USER_TO_EDIT_AUTO_POSTED_JOURNAL` | Same effect as the setting, for one user, team or role |
| `DISPLAY_JOURNAL_TRANSACTION_RUNNING_NUMBER` (permission of the same name used by the listing) | Shows the company running-number column for that user |

Server-side access is through the journal API permissions targeted by company and branch, managed in the permission screens under Settings.

## Fields

### Journal — Main

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Company | Owning company | Yes | Decides the ledger list and running numbers |
| Ledger | Book the journal posts to | Yes | Defaults to the company's primary ledger |
| Currency | Journal currency | Yes | |
| Transaction Date | Posting date | Yes | |
| Reference Number | Free text reference | No | Text (was numeric in older builds) |
| Description | Journal narrative | No | Also shown as the sub-ledger line description |
| Server Doc Type / Server Doc No | Source document | Auto only | Read-only link back to the document |
| Journal No / Journal No By Company | Running numbers | Generated | Assigned at create |

### Journal — Line

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Branch | Branch the line belongs to | Yes | |
| GL Code | Account debited or credited | Yes | Picked by object search; a sub-ledger is created under it if none exists |
| Cashbook | Cashbook the line represents | No | Tag bank/cash lines so they reach Bank Reconciliation |
| Entity | Customer, supplier or employee | No | Required in practice for debtor/creditor control accounts |
| Amount Debit / Amount Credit | One of the two | Yes | Both default to 0; fill exactly one |
| Description | Line narrative | No | |
| Segment, Dimension, Project, Profit Center | Reporting categories | No | Categories sub-tab |

### Ledger

Ledger Code, Ledger Name, Currency, Ledger Type (`PRM` / `SEC` / `CONSOLIDATED`); type and code are fixed after creation for the primary ledger.

### Sub Ledger

Name, GL Code, Company, Ledger (fixed); Description, Remarks (editable).

## Lifecycle and posting

Journals are not documents with a DRAFT/FINAL flow. What happens is:

| Event | Effect |
|---|---|
| **Create** (manual) | Validated — balanced (*Journal not balanced: debit X != credit Y*), non-zero, every line with a GL code — then written with status `ACTIVE`, running numbers assigned, sub-ledgers created as needed. The balances are live immediately. |
| **Update** (manual, or auto with the setting on) | Same validation; soft-deleted lines are ignored in the balance check |
| **Delete** from the listing | Soft-deletes the journal header and its lines (status `DELETED`). No reversing journal is created — to reverse an entry that must stay on record, clone it and swap the amounts. |
| **Clone** | Copies header and lines into a new journal with new numbers |
| **Document FINAL** elsewhere | `JournalPostingService` builds the lines from the document's type handler (for example a purchase invoice: Dr `PURCHASE` / `INPUT_TAX`, Cr `CREDITOR`) and creates an `AUTO` journal; `VOID` of the document creates the reversing journal |
| **Re-post** (Missing Journal tab) | Deletes any existing journal for the document and rebuilds it from the document as it stands |

Balances shown in the Ledger, Sub Ledger and Financial Report applets are derived from `ACTIVE` journal lines; month-end processing adds depreciation, stock valuation, retained-earnings and reversal entries on top before the Financial Report reads them.

## Related applets

- [Chart of Account Applet](/applets/master-data/chart-of-account-applet/) — defines the GL codes and the default GL mappings automatic posting depends on.
- [Financial Report](/applets/finance/financial-report-applet/) — reports on the balances this applet holds, by Set of Books and ledger.
- [Organisation Applet](/applets/master-data/organisation-applet/) — companies, branches and the primary ledger.
- [Cashbook Applet](/applets/master-data/cashbook-applet/) and [Bank Reconciliation](/applets/finance/bank-reconciliation-applet/) — cashbook-tagged lines and their reconciliation.
- [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/), [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/), [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/), [Fixed Asset](/applets/finance/fixed-asset-applet/) — the main sources of `AUTO` journals.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| **Create** button stays disabled although the form looks complete | Debits and credits differ (rounding), total is zero, a line has no GL code, or a header field is empty | Hover the button — the tooltip lists the unmet condition |
| `PRIMARY_LEDGER_NOT_EXIST` on create | The company has no `PRM` ledger | Create the primary ledger under *Ledger* |
| Journal creation fails: *Journal not balanced: debit X != credit Y* | Server-side balance check | Correct the line amounts |
| Clone or update fails on an old journal | A line has a null debit or credit amount (legacy data) | Set the null side to 0 on that line, then retry |
| Cannot change the entity on a journal | Auto journals are read-only unless `ALLOW_USER_TO_EDIT_AUTO_POSTED_JOURNAL`; correct the source document instead | Enable the setting for the accountant, or fix the document and re-post |
| Branch dropdown missing branches | User lacks branch-targeted read permission | Grant it under Permission Set |
| A FINAL document has no journal | Posting failed at FINAL (typically a missing default GL code) | Fix the mapping, then re-post from *Error Checking > Missing Journal* |
| Same document appears twice in the journal, or a foreign-currency document is posted twice | Both the foreign-currency document and its base-currency shadow were posted (defect under investigation) | Report the pair; delete the duplicate `AUTO` journal only on instruction |
| Sub Ledger listing empty for a GL code that has transactions | The GL code's sub-ledger belongs to a different ledger/company, or the listing filter excludes it | Search by GL code with the advanced search; check the ledger selected |
| "bd" / "cd" rows in a sub-ledger | Balance brought down / carried down for the period | Informational; newer builds show the opening balance instead |
| Imported journals not reflected in monthly closing | Import processed after month-end ran, or rows failed validation (`FAILED`) | Check the import status; re-run month-end for the period |
| *Update Journal Remarks* shows nothing for a document | The document's journal does not exist | Re-create it from *Missing Journal* first |
| Void of a payment voucher not visible here | The reversal journal is created at void time with the void date; if absent the void did not complete | Check the document's Trace Document tab; report if missing |

## Related documentation

- [Journal entries guide](/guides/accounting-guides/journal-entries/)
- [Chart of accounts setup](/guides/accounting-guides/chart-of-accounts-setup/)
- [Financial reporting guide](/guides/accounting-guides/financial-reporting/)
- [Financial Accounting module](/modules-v2/financial-accounting/)
