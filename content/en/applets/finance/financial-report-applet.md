---
title: "Financial Report"
description: "Close each month per Set of Books, generate frozen Trial Balance / Profit and Loss / Balance Sheet snapshots, run an ad-hoc Profit and Loss by branch or dimension, and find posting errors with the Stock Flow Report and Trace Document."
applet_code: "FinancialReport"
applet_repo: "blg-applet-wavelet-financial-report-applet"
modules: [financial-accounting]
related_applets:
  - chart-of-account-applet
  - ledger-and-journal-applet
  - organisation-applet
  - cashbook-applet
  - internal-sales-invoice-applet
  - internal-sales-return-applet
  - internal-purchase-invoice-applet
  - internal-purchase-return-applet
  - internal-receipt-voucher-applet
  - internal-payment-voucher-applet
  - stock-balance-applet
  - debtor-report-applet
  - creditor-report-applet
guides:
  - /guides/accounting-guides/financial-reporting/
  - /tutorials/month-end-closing/
sources:
  - blg-applet-wavelet-financial-report-applet/micro-fe/projects/wavelet-erp/applets/financial-report-applet/src/app/models/menu-items.ts
  - blg-applet-wavelet-financial-report-applet/micro-fe/projects/wavelet-erp/applets/financial-report-applet/src/app/app.routing.ts
  - blg-applet-wavelet-financial-report-applet/micro-fe/projects/wavelet-erp/applets/financial-report-applet/src/app/models/applet-settings.model.ts
  - blg-applet-wavelet-financial-report-applet/micro-fe/projects/wavelet-erp/applets/financial-report-applet/src/app/components/settings-container/default-settings/default-settings.component.html
  - blg-applet-wavelet-financial-report-applet/micro-fe/projects/wavelet-erp/applets/financial-report-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
  - blg-applet-wavelet-financial-report-applet/micro-fe/projects/wavelet-erp/applets/financial-report-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.html
  - blg-applet-wavelet-financial-report-applet/micro-fe/projects/wavelet-erp/applets/financial-report-applet/src/app/components/financial-report-container/financial-report-create/financial-report-create-main/financial-report-create-main.component.html
  - blg-applet-wavelet-financial-report-applet/micro-fe/projects/wavelet-erp/applets/financial-report-applet/src/app/components/financial-report-container/financial-report-view/financial-report-view.component.html
  - blg-applet-wavelet-financial-report-applet/micro-fe/projects/wavelet-erp/applets/financial-report-applet/src/app/components/financial-report-container/financial-report-view/financial-report-view.component.ts
  - blg-applet-wavelet-financial-report-applet/micro-fe/projects/wavelet-erp/applets/financial-report-applet/src/app/components/financial-report-container/financial-report-listing/financial-report-listing.component.ts
  - blg-applet-wavelet-financial-report-applet/micro-fe/projects/wavelet-erp/applets/financial-report-applet/src/app/components/month-end-processing-container/month-end-processing-create/month-end-processing-create-main/month-end-processing-create-main.component.html
  - blg-applet-wavelet-financial-report-applet/micro-fe/projects/wavelet-erp/applets/financial-report-applet/src/app/components/month-end-processing-container/month-end-processing-view/month-end-processing-view-processors/month-end-processing-view-processors.component.html
  - blg-applet-wavelet-financial-report-applet/micro-fe/projects/wavelet-erp/applets/financial-report-applet/src/app/components/profit-loss-report-container/profit-loss-report/profit-loss-report.component.ts
  - blg-applet-wavelet-financial-report-applet/micro-fe/projects/wavelet-erp/applets/financial-report-applet/src/app/components/error-checking-container/error-checking-listing/error-checking-listing.component.html
  - blg-applet-wavelet-financial-report-applet/micro-fe/projects/wavelet-erp/applets/financial-report-applet/src/app/components/error-checking-container/stock-flow-report/stock-flow-report.component.ts
  - blg-applet-wavelet-financial-report-applet/micro-fe/projects/wavelet-erp/applets/financial-report-applet/src/app/components/error-checking-container/error-checking-difference-listing/error-checking-difference-listing.component.ts
  - blg-applet-wavelet-financial-report-applet/micro-fe/projects/wavelet-erp/applets/financial-report-applet/src/app/components/error-checking-container/trace-document/trace-document.component.ts
  - blg-applet-wavelet-financial-report-applet/micro-fe/projects/wavelet-erp/applets/financial-report-applet/src/app/services/api-service.ts
  - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/financialReport/FinancialReportController.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/FinancialReportService.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/FinancialReportUows/FinancialReportUow.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialReportDataConsistencyObjects/FinancialReportDataConsistencyObject.java
  - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dto/erp/financialReport/FinancialReportInputDto.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/permissions/AkaunTenantPermissionsV2.java
  - akaun_master.bl_applet_client_side_perm_dfn (applet code FinancialReport — no rows)
tags:
- financial-reporting
- month-end
- trial-balance
- profit-and-loss
- balance-sheet
- accounting
- error-checking
weight: 70
aliases:
- /applets/financial-report-applet/
---

## Overview

The **Financial Report** applet is where the accountant closes a month and reads the statements. It has four working screens: **Month End Processing** closes one month for one Set of Books (it writes the closing-day and opening-day journals and the per-account balance summary the reports are built from); **Financial Report** freezes a Trial Balance, Profit and Loss, Balance Sheet and MITRS view for a range of closed months; **Profit Loss Report** is an ad-hoc P&L straight from posted journals, grouped by branch, GL dimension, segment, profit centre or project; and **Error Checking** holds two diagnostic tools — the **Stock Flow Report** (inventory value versus accounting value per module) and **Trace Document** (why a given document did or did not post).

{{< callout type="info" >}}
**Core concept.** A Financial Report snapshot does not read journals directly. It reads the per-account monthly summary rows that Month End Processing writes. Months that have not been processed contribute nothing — an empty Trial Balance almost always means the months in the range were never closed, not that the journals are missing.
{{< /callout >}}

## Video walkthrough

{{< youtube LbSz4ja-Zos >}}

## Where it fits

| Direction | Document / applet | Relationship |
|---|---|---|
| Master data | [Chart of Account](/applets/master-data/chart-of-account-applet/) | GL Sections, GL Categories and the **Report Section ↔ GL Category** links that decide which line of the statement a GL code lands on; Sets of Books and their ledgers; each company's Default GL Codes and *Inventory Closing Base On* |
| Upstream | [Ledger And Journal](/applets/finance/ledger-and-journal-applet/) | Every posted journal (document postings and manual journals) is the raw material for month-end and for the Profit Loss Report |
| Upstream | [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [Sales Return (Internal)](/applets/sales-workflow/internal-sales-return-applet/), [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/), [Purchase Return (Internal)](/applets/purchase-workflow/internal-purchase-return-applet/) | Their document lines feed the Profit Loss Report's live cost-of-goods-sold row and the Stock Flow Report's inventory side |
| Upstream | [Stock Balance](/applets/inventory-workflow/stock-balance-applet/) | Closing stock value (by the company's cost basis) used by the cost-of-goods-sold processor |
| Upstream | [Cashbook](/applets/master-data/cashbook-applet/), [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/), [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/) | Trace Document's *Missing Cashbook* check looks for the cashbook transaction a finalised settlement document should have created |
| Downstream | [Ledger And Journal](/applets/finance/ledger-and-journal-applet/) | Month-end writes `CD` (closing) and `BD` (opening) journals, and the optional `COGS` and `RETAINED_EARNINGS` journals, back into the ledger |
| Sibling reports | [Debtor Report](/applets/finance/debtor-report-applet/), [Creditor Report](/applets/finance/creditor-report-applet/) | Sub-ledger detail behind the trade-debtor and trade-creditor lines of the Balance Sheet |

## Screens and menus

The applet menu has four entries: **Financial Report**, **Month End Processing**, **Profit Loss Report** and **Error Checking**. (A fifth, *MEP*, is routed but hidden from the menu.)

### Financial Report

The listing shows one row per snapshot: **Set of Book**, **Start Date**, **End Date**, Created/Updated By and Date. Tick several rows and click **Reports** to open a side-by-side comparison with **Trial Balance**, **Profit and Loss** and **Balance Sheet** tabs — the normal way to compare periods or Sets of Books.

**+** opens the create form: choose a Set of Books and a Start Year / Start Month / End Year / End Month, then **Create**. The snapshot is built immediately.

{{< figure src="/images/financial-report-applet/edit-form.png" alt="Financial Report create form with Set of Books and year/month range" caption="Creating a Financial Report snapshot: one Set of Books, a start month and an end month." >}}

Opening a snapshot shows five tabs:

| Tab | Columns | Notes |
|---|---|---|
| **Main** | Set of Books, Start Year/Month, End Year/Month | Read-only after creation; **DELETE** (click twice to confirm) removes the snapshot only |
| **Trial Balance** | GL Section, GL Category, GL Code, Name, Description, Debit, Credit | Every account with a non-zero balance in the range |
| **Profit And Loss** | GL Section, GL Category, GL Code, Name, Description, Amount, % | Sections in P&L order with Net Sales, Gross Profit and Net Profit subtotals |
| **Balance Sheet** | GL Section, GL Category, GL Code, Name, Description, Amount, % | Assets, liabilities and equity with totals; the retained-earnings line comes from the opening (`BD`) balance of the *RetainedEarnings* section |
| **MITRS** | Profit and Loss, Balance Sheet sub-tabs | Same figures restricted to GL Categories flagged **MITRS enabled = YES** in the Chart of Account applet |

Two buttons sit above the tabs. **REPORT** opens the printable version of whichever of Trial Balance / Profit And Loss / Balance Sheet is selected. **REGENERATE** throws away the snapshot's lines and rebuilds them from the current month-end summaries — the header (Set of Books and range) is kept.

Clicking a line drills down: **GL listing** (Date, Doc Type, Doc No, Entity, Reference, Description, Journal Ledger, Debit, Credit) → **journal view** (Main, Line Items, Gross Profit) → **document view** (Main, Line Items, Posting).

{{< figure src="/images/financial-report-applet/report-view.png" alt="Financial Report view with drill-down to transactions" caption="Drilling from a report line to the journal transactions behind it." >}}

### Month End Processing

The listing shows one row per processed month (Set of Book, Start Date, End Date, audit columns). **+** opens a three-field form — Set of Books, Year, Month — and **Create** runs the processing straight away for every ledger in that Set of Books.

{{< figure src="/images/financial-report-applet/create-form.png" alt="Month End Processing create form" caption="Month End Processing: pick the Set of Books, the year and the month, then Create." >}}

Opening a record shows **Main** (the three fields plus **DELETE**) and **Processor**, which has a single row — *Month End Processing* with a **PROCESS** button. PROCESS re-runs the close for that month: it deletes the previous closing/opening journals and summary rows and rebuilds them, which is how back-dated postings get picked up. Run it again whenever anyone posts into a month that has already been closed, then **REGENERATE** the Financial Report snapshots that include that month.

### Profit Loss Report

An ad-hoc statement built from posted journals at query time — no month-end needed. Filters: **Group By** (Branch, GL Dimension, Segment, Profit Center, Project — default Branch), **Branch** (multi-select, limited to branches you may read), GL Dimension, Profit Center, Segment, Project, **Date From** / **Date To** (required), and **Cost Type** (MA, WA, FIFO, LIFO, Replacement, Manual). **SEARCH** renders one amount column per group value with the subtotal rows *Net Sales*, *Total Cost of Goods Sold*, *GROSS PROFIT/(LOSS)*, *GROSS MARGIN*, *PROFIT BEFORE TAXES*, *NET PROFIT/(LOSS)* and *PROFIT MARGIN*.

Clicking an amount opens the journal lines behind it; clicking the cost-of-goods-sold amount opens a **Gross Profit** listing by document (Doc Type, Doc No, Date, Entity, Item Code, Item Name, Qty, UOM, Unit Price, Unit Cost, Amount Txn, Amount Tax, Amount Net, Cost Amt, GP, GP%).

### Error Checking

Two tabs (a third, *Cashbook Discrepancy*, is present in code but commented out of the screen):

- **Stock Flow Report** — pick a Company and a date range. One row per module — *Purchases*, *Purchase Returns*, *Sales*, *Sales Returns*, *Purchase Consignment*, *Reset MA* — with **Inventory** (value from stock transactions), **Accounting** (value posted to the module's default GL code / sub-ledger) and **Difference**. Clicking a Difference opens a per-document listing (Date, Doc Type, Doc No, Amount Inv, Amount Acc, Status) where Status is `OK`, `MISSING_ACCOUNTING`, `MISSING_INVENTORY` or `WRONG_AMOUNT`; **CREATE** posts the missing journal or reposts the wrong one for the selected rows and writes the result (`POSTED` or the server error) back into the Status column.
- **Trace Document** — pick a Server Doc Type and type the Server Doc No, then **TRACE**. The screen shows the document's date, amount, posting status, posting journal and posting running number, and runs six checks: *Missing Journal* and *Wrong Journal* and *Missing Cashbook* and *Missing Shadow Document* (for FINAL documents), *Missing Reversal Journal* and *Missing Reversal Queue* (for VOID documents). Each failed check has a **Resolve** button that creates or reposts the missing artefact; a **Repost** button appears when the document is already `POSTED`. If the document has a linked base or forex-shadow document, its number is a link to that document.

### Settings and personalisation

**Settings > System Configuration** has **Field Settings** and **Default Selection**, plus the standard permission, webhook, release-notes and applet-log screens. **Personalization > Default Selection** lets each user set their own Default Branch and Default Location.

## Configuration

### Before you can use it

| Prerequisite | Where | Why it matters |
|---|---|---|
| A **Set of Books** with at least one ledger line | [Chart of Account](/applets/master-data/chart-of-account-applet/) > Set Of Books > Ledgers | Month-end and snapshots iterate the Set of Books' ledgers. A Set of Books with no ledger fails with *Set of Books is missing primary ledger configuration.* |
| Every GL Category linked to a **Report Section** | [Chart of Account](/applets/master-data/chart-of-account-applet/) > GL Category > GL Section tab | All report queries inner-join GL code → category → report section. A category without a section link makes its GL codes disappear from every statement and from month-end itself |
| P&L sections named as the engine expects | Report sections | The engine treats these section codes as profit-and-loss: `SalesRevenue`, `SalesExpenses`, `CostOfGoodsSold`, `CostOfGoodsSold-Gains`, `CostOfGoodsSold-Expenses`, `GeneralExpenses`, `OtherRevenues`, `OtherExpenses`, `TaxExpenses`, `Dividend`, `ProfitLoss`; the Balance Sheet's retained-earnings line reads the `RetainedEarnings` section. Rename these and the close no longer distinguishes P&L from balance-sheet accounts |
| Company **Default GL Codes** for stock and closing | [Chart of Account](/applets/master-data/chart-of-account-applet/) > Company > Default GL Codes | The cost-of-goods-sold processor needs `COGS`, `STOCK_BALANCE`, `PURCHASE`, `PURCHASE_RETURN` (optionally `COGS_RAW` / `COGS_WIP` / `COGS_FG` / `COGS_NSTI` with matching `STOCK_BALANCE_*`); the retained-earnings processor needs `PROFIT_LOSS` and `RETAINED_EARNING`. The Stock Flow Report also uses `PURCHASE`, `PURCHASE_RETURN`, `SALES`, `SALES_RETURN` and `CONSIGNMENT_STOCK` to find the accounting side |
| Company **Inventory Closing Base On** | Company settings | Selects which cost column values closing stock: `MA_COST` (default), `WA_COST`, `FIFO_COST`, `LIFO_COST`, `REPLACEMENT_COST` or `MANUAL_COST` |
| **MITRS enabled** on GL Categories | [Chart of Account](/applets/master-data/chart-of-account-applet/) > GL Category | Only categories flagged YES appear on the MITRS tab |
| Backend permission `API_TNT_DM_ERP_FI_FINANCIAL_REPORT_*` with company and branch targets | Permission wizard | See [Feature visibility / permissions](#feature-visibility--permissions) |

### Applet settings

**Settings > System Configuration > Default Selection** (saved as the applet's master settings):

| Setting | What it controls | Default | Effect when changed | Who can change it |
|---|---|---|---|---|
| Default Branch (`DEFAULT_BRANCH`) | Branch pre-selected in branch pickers | none | New sessions pre-fill the branch | Applet admin |
| Default Location (`DEFAULT_LOCATION`) | Location pre-selected in location pickers | none | New sessions pre-fill the location | Applet admin |
| Default Timezone (`DEFAULT_TIMEZONE`) | Timezone used when the listing renders dates | none | Listing date columns shift to the chosen zone | Applet admin |

**Settings > System Configuration > Field Settings** is the applet's own hide/show screen with eight switches — Lines: *Unit Discount*, *SST/VAT/GST*, *WHT*, *Blanket Order*; Department: *Segment*, *G/L Dimension*, *Profit Center*, *Project* (`HIDE_UNIT_DISCOUNT`, `HIDE_SST_VAT_GST`, `HIDE_WHT`, `HIDE_BLANKET_ORDER`, `HIDE_SEGMENT`, `HIDE_GL_DIMENSION`, `HIDE_PROFIT_CENTER`, `HIDE_PROJECT`; all default off). They are saved, but no screen in this applet reads them — the Profit Loss Report's dimension filters stay visible whatever you set. Treat the screen as inert.

### Document behaviour settings

Not configurable in this applet. What month-end posts, which cost basis values stock and which accounts the processors hit are all fixed by the company's Default GL Codes, its *Inventory Closing Base On*, the report-section links, and the engine (see [Lifecycle and posting](#lifecycle-and-posting)). There is no approval flow, no printable template selection and no e-Invoice involvement.

### Feature visibility / permissions

No client-side permission definitions are seeded for this applet in the registry, so nothing in the UI is hidden per role. Access is enforced by the backend permission family `API_TNT_DM_ERP_FI_FINANCIAL_REPORT_{OWNER, ADMIN, MEMBER, CREATE, UPDATE, DELETE, READ}`:

| Action | Backend permission checked |
|---|---|
| List / open snapshots and month-end records | `READ` (or OWNER / ADMIN) |
| Create a snapshot, run or re-run month-end, run the Profit Loss Report, Stock Flow Report and Trace Document queries, generate the MITRS view | `CREATE` (or OWNER / ADMIN) |
| Regenerate a snapshot | `CREATE` |
| Delete a snapshot or a month-end record | `DELETE` (or OWNER / ADMIN) |

The Profit Loss Report additionally filters the **Branch** and **Company** you ask for against the targets granted on `API_TNT_DM_ERP_FI_FINANCIAL_REPORT_READ`; if none of the requested branches or companies is granted, the request is rejected rather than silently narrowed to nothing. The Set of Books and its ledgers are also read with permission checks, so a user without read rights on a ledger cannot close it.

## Fields

### Financial Report — Main

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Set of Books | Which books (and therefore ledgers) the snapshot covers | Yes | Must exist; server error `SET_OF_BOOKS_IS_NULL` / `SET_OF_BOOKS_GUID_DOES_NOT_EXIST` otherwise |
| Start Year, Start Month | First month in the range | Yes | Compared as `YYYYMM` against month-end summary rows |
| End Year, End Month | Last month in the range | Yes | The end month supplies the closing (`CD`) balances and the retained-earnings opening (`BD`) balance |

Stored on `bl_fi_financial_report_hdr` with `txn_type = FINANCIAL_REPORT`; each report line is a `bl_fi_financial_report_fact_line` (GL section, category, code, total debit, total credit, plus branch / entity / profit centre / segment / project / dimension / sub-ledger keys).

### Month End Processing — Main

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Set of Books | Books whose ledgers are closed | Yes | Every ledger line is processed; a ledger you cannot read aborts the run |
| Year, Month | The month being closed | Yes | One record per Set of Books per month; creating the same month again replaces the previous close |

Stored on the same header table with `txn_type = MONTH_END_PROCESSING`.

### Profit Loss Report — filters

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Group By | Column split: Branch, GL Dimension, Segment, Profit Center or Project | Yes (default Branch) | One amount column per value found in the journals |
| Branch / GL Dimension / Profit Center / Segment / Project | Restrict to selected values | No | Branch list is permission-filtered |
| Date From, Date To | Journal transaction date range | Yes | Only journals with `txn_type = TXN` are read — closing, opening, COGS and retained-earnings journals are excluded |
| Cost Type | Cost basis for the live cost-of-goods-sold row | Yes (default MA) | MA, WA, FIFO, LIFO, Replacement or Manual, taken from each sales line's stored cost columns |

### Stock Flow Report and Trace Document

| Screen | Field | Required | Notes |
|---|---|---|---|
| Stock Flow Report | Company | Yes | Single company; permission-filtered |
| Stock Flow Report | Date From, Date To | Yes | Inventory side reads stock transactions; accounting side reads the module's default GL code / sub-ledger |
| Trace Document | Server Doc Type | Yes | Picker loaded from the tenant's server document-type registry (sorted by code) |
| Trace Document | Server Doc No | Yes | Exact server document number |

## Lifecycle and posting

Neither a snapshot nor a month-end record has a status flow; they are created, regenerated and deleted. What matters is what each action writes to the ledger.

### Creating (or re-processing) a Month End Processing record

For **each ledger** in the Set of Books, inside one transaction:

1. Delete that ledger's existing `CD` journal for the month, its `BD` journal dated the first of the next month, and its summary rows for the month.
2. Read every journal line dated within the month whose journal is not itself a `CD`, grouped by sub-ledger and GL code, with the GL code's report section.
3. Post a **closing-day (`CD`) journal** dated the last day of the month: one line per account, opposite in sign to the account's net movement (P&L lines are described *POSTING TO PROFIT AND LOSS*). Header: `txn_type = CD`, description *AUTO CREATED FROM MONTH END PROCESSING*, `auto_flag = AUTO`, `posting_status = POSTED`, with posting running numbers.
4. Post an **opening-day (`BD`) journal** dated the first day of the next month that re-opens the **balance-sheet** accounts only — lines in the P&L sections listed under *Before you can use it* are skipped.
5. Write one **general ledger summary row** (`bl_fi_general_ledger_hdr`) per sub-ledger + GL code for the month: net debit or credit, opening (`BD`) amount, closing (`CD`) amount, and the year/month keys.

If a ledger has no journal lines in the month the run fails with *Journal Line is empty.* — you cannot close an empty month.

**DELETE** on a month-end record removes the `CD` and `BD` journals and the summary rows for every ledger in the Set of Books; it does not touch the original document journals.

### Cost-of-goods-sold and retained-earnings processors

The backend exposes two further processors on the same record. Their buttons are commented out of the current Processor tab, so they are not reachable from the UI today, but the endpoints exist (`/create-cost-of-goods-sold`, `/create-retained-earnings`) and older records may carry their journals:

| Processor | Journal `txn_type` | Debit | Credit | Amount |
|---|---|---|---|---|
| Cost of goods sold | `COGS` | `COGS` default GL code | `STOCK_BALANCE` (inventory) | Opening stock + purchases (+ purchase returns, which carry a negative net) − closing stock; purchase and purchase-return accounts are cleared against it |
| Closing stock by type (only when a Month End Closing Stock record exists) | `COGS` | `STOCK_BALANCE_WIP` / `_NSTI` / `_RAW` / `_FG` | `COGS_WIP` / `_NSTI` / `_RAW` / `_FG` | The record's manual or system-calculated closing value per stock type |
| Retained earnings | `RETAINED_EARNINGS` | `RETAINED_EARNING` default GL code | `PROFIT_LOSS` default GL code | Net of all P&L-section journal lines in the month (excluding `CD`/`BD`); a loss reverses the sides |

Closing stock for the COGS processor is valued from stock transactions before the period end (`PNS` and `RESET_MA` rows, latest per item) using the cost column chosen by the company's *Inventory Closing Base On*. A Month End Closing Stock record for the month or the prior month overrides opening and closing inventory when its *manual* flags are set. Re-running a processor first deletes the journals it created last time.

### Creating and regenerating a Financial Report snapshot

Creating a snapshot reads three sets of summary rows for the Set of Books' ledgers and stores them as fact lines: the monthly rows from start month to end month (the Trial Balance and P&L movement), the end month's closing amounts, and the end month's opening amount for the `RetainedEarnings` section (the Balance Sheet's retained-earnings line). Rows whose debit equals credit are dropped. **REGENERATE** deletes the fact lines and repeats the read with the same header. **DELETE** removes the snapshot only. Nothing here posts to the ledger.

### Reading order at month-end

1. Post and finalise all documents and manual journals for the month.
2. Create (or PROCESS) the Month End Processing record for each Set of Books.
3. Create the Financial Report snapshot, or REGENERATE existing ones that include the month.
4. If anything is back-dated later: PROCESS the month again, then REGENERATE.

## Related applets

- [Chart of Account](/applets/master-data/chart-of-account-applet/) — owns everything this applet depends on: sections, categories, the section links, Sets of Books, ledgers, companies' default GL codes and inventory closing basis, and the MITRS flag.
- [Ledger And Journal](/applets/finance/ledger-and-journal-applet/) — where you see the `CD`, `BD`, `COGS` and `RETAINED_EARNINGS` journals month-end writes, and where the drill-down from a report line ends up.
- [Organisation](/applets/master-data/organisation-applet/) — branches, profit centres, segments and projects used as Group By dimensions in the Profit Loss Report.
- [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [Sales Return (Internal)](/applets/sales-workflow/internal-sales-return-applet/) — source of the live cost-of-goods-sold and Gross Profit listing.
- [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/), [Purchase Return (Internal)](/applets/purchase-workflow/internal-purchase-return-applet/) — the purchase side of the Stock Flow Report and the COGS processor.
- [Stock Balance](/applets/inventory-workflow/stock-balance-applet/) — the stock-side values the Stock Flow Report compares against accounting.
- [Cashbook](/applets/master-data/cashbook-applet/), [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/), [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/) — settlement documents whose cashbook transactions Trace Document verifies.
- [Debtor Report](/applets/finance/debtor-report-applet/), [Creditor Report](/applets/finance/creditor-report-applet/) — sub-ledger detail behind the receivable and payable lines.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| A new snapshot's Trial Balance / P&L / Balance Sheet tabs are empty | Month End Processing has not been run for the months in the range (the snapshot reads month-end summary rows, not journals), or the wrong Set of Books was chosen | Create a Month End Processing record for each month of that Set of Books, then REGENERATE the snapshot |
| Month-end fails with *Set of Books is missing primary ledger configuration.* | The Set of Books has no ledger lines | Link the company ledger on the Set of Books' Ledgers tab in Chart of Account |
| *Set of Books guid cannot be empty or has no permission.* or *Ledger with guid … does not exist or has no permission.* | The user lacks READ on the Set of Books or on one of its ledgers | Grant the financial-report permission with the right company targets, or run as an admin |
| Month-end fails with *Journal Line is empty.* | One ledger in the Set of Books has no journal activity in that month | Remove the inactive ledger from the Set of Books, or post the month's entries first |
| A GL code with movement is missing from every report and from the drill-down | Its GL Category is not linked to a Report Section, so the inner join drops it | Link the category to a section in Chart of Account, PROCESS the month again, then REGENERATE |
| A back-dated journal is not in the snapshot | Snapshots and month-end summaries are frozen when created | Open the Month End Processing record, Processor tab, PROCESS; then REGENERATE the affected snapshots |
| Balance Sheet does not balance by roughly the period's profit | The end month was closed before later postings, or the `RetainedEarnings` section is missing or renamed | Re-PROCESS the month and REGENERATE; check the section code in Chart of Account |
| Profit Loss Report and the snapshot's P&L show different cost of goods sold | The Profit Loss Report computes COGS live from sales lines at the chosen Cost Type; the snapshot shows whatever was journalled | Match Cost Type to the company's inventory closing basis; run the Stock Flow Report to find unposted or wrongly posted documents |
| Profit Loss Report shows zero for a period you know has sales | Filters exclude the branches or dimensions the journals carry, or the journals are not `TXN` type (auto journals are excluded by design) | Clear the dimension filters and widen the dates; confirm the documents are FINAL and posted |
| Profit Loss Report rejects the query | None of the selected branches or companies is in the user's permission targets | Add branch and company targets to the user's `…FINANCIAL_REPORT_READ` grant |
| Stock Flow Report shows a Difference | Documents with stock movement but no journal (`MISSING_ACCOUNTING`), journals without stock (`MISSING_INVENTORY`), or unequal amounts (`WRONG_AMOUNT`) | Open the Difference listing, select the rows and click CREATE; a row that comes back with a server error (typically a missing default GL code on the item or company) needs the mapping fixed first |
| Trace Document reports *Missing Journal* on a FINAL document | The document was finalised but its journal was never created, or the item's GL code is missing (the check reports *Missing glcode at '<item>'*) | Fix the item / default GL code, then click Resolve (or Repost if the document is already `POSTED`) |
| Trace Document reports *Missing Shadow Document* | A forex document was finalised without its shadow (company-currency) copy | Click Resolve — the applet creates the shadow document and finalises it |
| *Company guid not exist* from the COGS processor | The ledger is not linked to a company | Set the company on the ledger in Chart of Account |

## Related documentation

- [Financial reporting guide](/guides/accounting-guides/financial-reporting/) — the month-end and snapshot walkthrough for the running example.
- [Month-end closing tutorial](/tutorials/month-end-closing/)
- [Financial Accounting module](/modules-v2/financial-accounting/)
- [Chart of Account applet](/applets/master-data/chart-of-account-applet/) — sections, categories, Sets of Books, default GL codes.
