---
description: Step-by-step guide to generating, reading, comparing, and closing BigLedger financial reports — Trial Balance, Profit & Loss, Balance Sheet, ad-hoc P&L by dimension, and Month End Processing.
tags:
- user-guide
- accounting
- financial-reports
- month-end
title: Financial Reporting Guide
weight: 30
---

This guide walks a finance user through producing BigLedger's three core financial statements (Trial Balance, Profit & Loss, Balance Sheet) for a given Set of Books and period, drilling down to source journals, comparing periods side-by-side, running the ad-hoc Profit Loss Report by dimension, and using **Month End Processing** to post COGS, Retained Earnings, and CD/BD carry-forward journals before final close. For field-by-field reference, see the [Financial Report Applet](/applets/finance/financial-report-applet/) documentation.

{{< callout type="info" >}}
**A Financial Report is a snapshot, not a live view.**
Generating a report writes aggregated fact lines into the database. Later back-dated transactions are not reflected automatically — you must open the snapshot and click **REGENERATE**.
{{< /callout >}}

## Concepts

| Term | Meaning |
| :--- | :--- |
| **Financial Report (snapshot)** | A persisted record (`txn_type = FINANCIAL_REPORT`) that aggregates debits and credits per GL Section / GL Category / GL Code for the chosen Set of Books and period. Drives the Trial Balance, P&L, and Balance Sheet tabs. |
| **Month End Processing (MEP)** | A separate record (`txn_type = MONTH_END_PROCESSING`) that *posts* journals — COGS, Retained Earnings, CD (closing-day) and BD (brought-down opening) — for every ledger linked to the Set of Books. It is a procedure, not a report. |
| **Set of Books** | The reporting container chosen at the top of every form. Internally links to one or more ledgers; the report covers all of them for the chosen period. |
| **CD / BD entries** | Auto-posted month-end journals. **CD** zeroes the P&L sections into Profit/Loss at end-of-month; **BD** posts the brought-down opening balance on the first day of the next month. |
| **Profit Loss Report (ad-hoc)** | A non-persisted P&L run by Branch, GL Dimension, Profit Center, Segment, or Project, with a selectable Cost Type (MA, WA, FIFO, LIFO, Replacement, Manual). |

## Prerequisites

Before you generate a report, confirm:

- **Chart of Account is fully wired.** Every active GL Code is linked to a GL Category, and every Category is linked to a GL Section. Codes without that full chain are silently excluded from Trial Balance, P&L, and Balance Sheet output. See the [Chart of Accounts Setup Guide](/guides/accounting-guides/chart-of-accounts-setup/).
- **At least one Set of Books exists** and has at least one ledger linked under its **Ledgers** tab. Month End Processing will fail with *"Ledger does not exist"* if no ledger is linked.
- **Default GL Codes are mapped on the Company** — at minimum Purchase, Purchase Return, Inventory (GR/IR), COGS, and Retained Earnings. Without these, Month End Processing fails with *"Company guid not exist"*.
- **Source documents are posted.** Sales invoices, purchase invoices, receipts, payments, and manual journals must be in posted status — only posted journal lines roll into the general ledger.
- **User has at least one of these tenant permissions**: `API_TNT_DM_ERP_FI_FINANCIAL_REPORT_OWNER`, `_ADMIN`, plus `_CREATE` / `_READ` / `_UPDATE` / `_DELETE` as appropriate. Without one, write actions return 401 silently.
- **Dimension master data** (Branch, Profit Center, Segment, Project, GL Dimension) is set up if you plan to use the ad-hoc Profit Loss Report by dimension.

The applet is at **Sidebar → Financial Report**, with the related screens at **Sidebar → Month End Processing** and **Sidebar → Profit Loss Report**.

## Step 1: Confirm the period is ready

Before generating, make sure every source document for the period is posted and reconciliations (bank, AR, AP, stock) are complete. The report only aggregates journal rows whose status is not `DELETED`; nothing in draft state will appear.

{{< callout type="tip" >}}
Use **Sidebar → Error Checking → Trace Document** and **Stock Flow Report** to chase any document that should have posted but didn't. Fixing these before generating saves a regenerate cycle later.
{{< /callout >}}

## Step 2: Create the Financial Report snapshot

*Sidebar → Financial Report → click the + (New) button*

Fill the create form. All five fields are required.

| Field | Notes |
| :--- | :--- |
| **Set of Books** | Required. Dropdown lists active Set of Books only. |
| **Start Year** | Required. Picker covers 2020 through current year + 5. |
| **Start Month** | Required. 1–12. |
| **End Year** | Required. Same range as Start Year. |
| **End Month** | Required. 1–12. |

There is no Branch, dimension, or Cost Type slicer on this form — those belong to the ad-hoc Profit Loss Report (Step 12).

Click **Save**. The system computes `date_start` as the first day of Start Month at 00:00 and `date_end` as the last second of End Month.

## Step 3: Let the system aggregate

Save fires `POST /financial-reports/create`. The backend runs three SQL aggregations against the general ledger (period totals, CD closing posting, BD opening for Retained Earnings), unions them, drops any line where debit minus credit is zero, and persists the result as fact lines tied to the new report header.

Generation can take several seconds on large tenants because every general-ledger row is read and grouped in SQL. When it completes, the listing refreshes with the new row at the top.

## Step 4: Review the Trial Balance tab

Open the new row from the listing. The **Financial Report Details** screen opens with five tabs: **Main**, **Trial Balance**, **Profit And Loss**, **Balance Sheet**, **MITRS**.

Switch to **Trial Balance**. Columns:

| Column | Meaning |
| :--- | :--- |
| **GL Section** | Top-level grouping (Assets, Liabilities, Revenue, etc.) |
| **GL Category** | Subgroup |
| **GL Code** | The transactional account |
| **Name** | GL Code name |
| **Debit / Credit** | Aggregated totals for the period |

The grid footer shows total Debit and total Credit. **They must be equal.** Click any row to drill into the GL Listing for that GL Code in the period; click again to open the source journal.

## Step 5: Review the Profit And Loss tab

Switch to **Profit And Loss**. Rows are grouped by GL Section and GL Category. The front-end injects computed rows:

- **Net Sales**
- **Total Cost of Goods Sold**
- **GROSS PROFIT / (LOSS)** and **GROSS MARGIN** (= Gross Profit / Net Sales × 100)
- **PROFIT BEFORE TAXES**
- **NET PROFIT / (LOSS)** and **PROFIT MARGIN** (= Net Profit / Net Sales × 100)

The two **MARGIN** rows print as percentages. Computed rows are intentionally **not clickable** — drill-down only works on real GL Code rows.

{{< callout type="tip" >}}
If COGS looks wrong or empty, the most common causes are (a) Month End Processing has not yet been run for the period, or (b) stock flows have unbalanced rows — check **Error Checking → Stock Flow Report**.
{{< /callout >}}

## Step 6: Review the Balance Sheet tab

Switch to **Balance Sheet**. Rows are grouped by GL Section then GL Category. Injected total rows:

- **TOTAL ASSETS**
- **TOTAL LIABILITIES**
- **TOTAL SHAREHOLDERS' EQUITY**
- **TOTAL LIABILITIES AND SHAREHOLDERS' EQUITY**

Any row whose section name contains *TOTAL* renders bold and non-expandable.

`TOTAL LIABILITIES + TOTAL SHAREHOLDERS' EQUITY` must equal `TOTAL ASSETS`. If it does not, the most common cause is missing Retained Earnings — see **Step 11** to run Month End Processing.

## Step 7: Export the report

On any statement tab, click **REPORT** (top right) to switch to full-width export mode, then use the grid's status-bar export menu (**PDF / Excel / CSV / Excel (Analysis)**).

The export auto-fills title and subtitle (`<Set of Books name>` / `<Statement>` / `<date_start> to <date_end>`), preserves bold totals, hides the auto group column header, and uses landscape orientation for P&L (portrait for Trial Balance).

## Step 8: Drill down to investigate variances

Click any non-total GL Code row on Trial Balance, P&L, or Balance Sheet. The **GL Listing** panel opens for that GL Code in the period, with columns:

| Column | Drill behaviour |
| :--- | :--- |
| **Date** | — |
| **Journal Ledger No** | Click to open the full journal |
| **Entity** | — |
| **Description / Reference** | — |
| **Doc Type / Doc No** | Click **Doc No** to open the source document (invoice, GRN, etc.) |
| **Debit / Credit** | — |

Use the **Back** button at the top of each column to return without losing the current tab.

## Step 9: Compare multiple periods

Back on the Financial Report listing, tick two or more rows using the header / row checkboxes, then click the blue **Reports** button. A **Multi View** opens with three tabs — Trial Balance, Profit and Loss, Balance Sheet — showing the snapshots side by side. The title bar lists the Set of Books names of the selected snapshots.

There is no on-screen variance calculation. For deltas, export each tab to Excel and subtract.

## Step 10: Regenerate after back-dated transactions

If anyone posts a back-dated transaction into a period that already has a snapshot, open the snapshot and click **REGENERATE** (top right).

The backend deletes every fact line for that header GUID and re-runs the three aggregation SQLs. The header (Set of Books, year/month range) is preserved.

{{< callout type="warning" >}}
**REGENERATE only works on Financial Report records, not on Month End Processing records.** Regenerate does *not* re-run COGS or Retained Earnings — those are Month End Processing concerns (Step 11).
{{< /callout >}}

## Step 11: Run Month End Processing

*Sidebar → Month End Processing → + (New)*

| Field | Notes |
| :--- | :--- |
| **Set of Books** | Required. |
| **Year** | Required. |
| **Month** | Required. |

Click **Save**. The endpoint `POST /create-month-end-processing` runs three procedures in order:

1. **Create COGS journals** — posts COGS based on stock movement.
2. **Create Retained Earnings journals** — closes prior P&L into Retained Earnings.
3. **For every ledger linked to the Set of Books** — deletes any prior CD / BD / general-ledger summary rows for the period, then re-posts a **CD** journal at end-of-month, a **BD** journal at start-of-next-month, and the matching general-ledger summary row.

### Re-running after late entries

Open the saved MEP record and switch to the **Processor** tab. Three independent buttons:

| Button | Endpoint | What it does |
| :--- | :--- | :--- |
| **Cost of Goods Sold** | `POST /create-cost-of-goods-sold` | Regenerates COGS journals only. |
| **General Ledger** | `POST /regenerate-month-end-processing/{guid}` | Re-posts CD/BD journals and the general-ledger summary. |
| **Retained Earnings** | `POST /create-retained-earnings` | Regenerates the Retained Earnings posting. |

Run them in the same order (COGS → General Ledger → Retained Earnings) after every batch of back-dated entries, then **Regenerate** the affected Financial Report snapshots.

## Step 12: Run the ad-hoc Profit Loss Report

*Sidebar → Profit Loss Report*

This screen produces a non-persisted P&L sliced by a dimension.

| Field | Notes |
| :--- | :--- |
| **Group By** | Required, single-select. Branch / GL Dimension / Profit Center / Segment / Project. |
| **Dimension multi-select** | Required. Only the picker matching Group By is shown. |
| **Date From** | Required. Defaults to today. |
| **Date To** | Required. Defaults to today. |
| **Cost Type** | Required. MA (default) / WA / FIFO / LIFO / Replacement / Manual. |

Click **SEARCH**. The grid pivots in the browser and computes **GROSS MARGIN** and **PROFIT MARGIN** as percentage rows. Branch and dimension visibility is filtered server-side by the caller's permissions.

{{< callout type="tip" >}}
The ad-hoc report's COGS can differ from a Financial Report snapshot when you pick a Cost Type other than MA — the snapshot reflects whatever was actually posted by Month End Processing.
{{< /callout >}}

## Step 13: Delete a snapshot (if mis-created)

Open the snapshot → **Main** tab → **DELETE** → **CLICK AGAIN TO CONFIRM**.

| Record type | What delete removes |
| :--- | :--- |
| **Financial Report** | Header + fact lines (soft delete). Source journals are untouched. |
| **Month End Processing** | Header **plus** every CD, BD, COGS, and Retained-Earnings journal that the run posted, across every ledger linked to the Set of Books. |

The MEP cascade is irreversible — only do it if you intend to fully redo month-end.

## What the system enforces

| Rule | Where enforced |
| :--- | :--- |
| `set_of_books_guid` must exist and not be `DELETED` | UI (`Validators.required`), Java validator, DB `NOT NULL` + FK |
| Start/end year and start/end month are mandatory integers | UI, Java validator, DB `NOT NULL` constraints |
| `date_start` / `date_end` are derived, not user-entered | Computed in the Angular API service from start/end month |
| `txn_type` is set by the endpoint, not the user (`FINANCIAL_REPORT` vs `MONTH_END_PROCESSING`) | Backend service; listing filters by `txn_type` |
| **REGENERATE** only works on `FINANCIAL_REPORT` records | Backend `regenerateFinancialReportWithGeneralLedger` |
| Only GL Codes with a full Section → Category → Code chain appear in reports | Inner joins through `bl_fi_report_section_gl_category_link` |
| Lines where `debit − credit = 0` are dropped from the persisted snapshot | Backend filter at create time |
| Month End Processing is idempotent — prior CD/BD/GL rows are deleted before re-posting | `deleteMonthEndProcessing(ledgerGuid, ...)` |
| MEP requires every ledger's company to have default GL Codes mapped | Backend reads `bl_fi_mst_company_glcode_link` |
| Every write endpoint requires `OWNER` / `ADMIN` / matching `_CREATE` / `_UPDATE` / `_DELETE` permission | Per-endpoint permission check in the controller |
| Ad-hoc Profit Loss Report filters branches and dimensions by the caller's permissions | `targetPermissionProcessing` on the controller |

## Closing and adjustments

A typical month-end sequence:

1. Confirm all operational documents for the month are posted and reconciled.
2. **Run Month End Processing** for the month (Step 11). COGS, Retained Earnings, CD and BD journals are posted.
3. **Generate the Financial Report** for the month (Step 2). Review Trial Balance, P&L, Balance Sheet.
4. Investigate variances by drill-down (Step 8) and via **Error Checking** if needed.
5. If late entries arrive, repost MEP via the Processor tab (Step 11) and **Regenerate** the Financial Report (Step 10).
6. Lock the fiscal period (`LOCK_GL`, then `LOCK_ALL` at year-end) — see the [Chart of Accounts Setup Guide](/guides/accounting-guides/chart-of-accounts-setup/#step-7-create-the-fiscal-year).

## Gotchas / troubleshooting

| Symptom | Fix |
| :--- | :--- |
| Some GL Codes are missing from the report even though journals exist and are posted | Their GL Category is not linked to a GL Section. Open the [Chart of Account Applet](/applets/master-data/chart-of-account-applet/) → GL Category → **GL Section** tab and add the link. Regenerate. |
| Back-dated transactions don't show on an existing snapshot | The snapshot is frozen at create time. Open it and click **REGENERATE**. |
| Balance Sheet doesn't balance | Usually missing Retained Earnings BD. Run Month End Processing for the period (Step 11), then Regenerate the snapshot. |
| Month End Processing fails with *"Company guid not exist"* | The ledger's company has no row in default GL Code mapping. Open Companies → Default GL Codes and map at least COGS, INVENTORY_NOT_INVOICED, PURCHASE, PURCHASE_RETURN, RETAINED_EARNING. |
| REGENERATE returns *"GUID does not exist"* on a Month End Processing record | REGENERATE only accepts `FINANCIAL_REPORT` records. Use the MEP record's **Processor** tab buttons instead. |
| Trial Balance Debit ≠ Credit | Almost always a journal posted with only one leg, typically from an import script. Drill into the suspect GL Code and inspect the journal. |
| **SEARCH** on Profit Loss Report stays disabled | The dimension multi-select matching Group By is mandatory. Pick at least one Branch / Project / Segment / Profit Center / GL Dimension. |
| Excel export drops totals or collapses groups | Click **REPORT** (top right) to switch to full-width export mode before exporting. |
| A newly added GL Code doesn't appear even after Regenerate | Confirm the code's Status is ACTIVE, its GL Category is active, and that Category has an active GL Section link. Inactive joins are filtered at every step. |
| Drill-down on a P&L row does nothing | Computed rows (Net Sales, GROSS PROFIT, GROSS MARGIN, PROFIT BEFORE TAXES, NET PROFIT, PROFIT MARGIN) and Balance Sheet TOTAL rows have no GL Code and are intentionally non-clickable. |
| Profit Loss Report COGS differs from snapshot P&L COGS | Expected when the ad-hoc report uses a Cost Type other than MA. The snapshot reflects what Month End Processing actually posted. |
| **Reports** (multi-period compare) button does nothing | You must tick at least one row first. The view only opens when the selection is non-empty. |
| MITRS tab is empty | MITRS is lazy-loaded. Hit the tab once to trigger generation. If still empty, MITRS-tagged categories aren't set up on the Chart of Account. |
| Permission denied silently on Save or Reports | Confirm the role grants `_OWNER`, `_ADMIN`, or the matching `_CREATE` / `_READ`. The API returns 401 with no toast. |

## Related documentation

- [Financial Report Applet](/applets/finance/financial-report-applet/) — full field reference and screen layout
- [Chart of Accounts Setup Guide](/guides/accounting-guides/chart-of-accounts-setup/) — get the Section → Category → Code chain right before generating
- [Chart of Account Applet](/applets/master-data/chart-of-account-applet/) — manage Sections, Categories, Codes, Companies, Set of Books
- [Ledger and Journal Applet](/applets/finance/ledger-and-journal-applet/) — the journals the report aggregates from
- [General Ledger Applet](/applets/finance/general-ledger-applet/) — the GL summary table the snapshot reads
- [Journal Entries Guide](/guides/accounting-guides/journal-entries/) — post manual adjustments and opening balances
- [Bank Reconciliation Guide](/guides/accounting-guides/bank-reconciliation-guide/) — reconcile cash before generating
- [Tax Configuration Applet](/applets/master-data/tax-configuration-applet/) — input/output tax setup
