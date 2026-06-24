---
title: Financial Reporting Guide
description: Close the month, generate a balanced Trial Balance, Profit and Loss, and Balance Sheet, and export everything to Excel for your external accountant.
tags:
- user-guide
- accounting
- month-end
weight: 40
---

By the end of this guide, you will have closed March 2026, generated a balanced Trial Balance, a Profit and Loss statement broken down by branch, a Balance Sheet that balances, and exported all three to Excel for your external accountant ahead of the quarterly Sales and Service Tax (SST) filing. Plan for about 60 minutes the first month you do this on your own; once the rhythm sticks, you will be in and out in 20.

## Meet GadgetSphere

You work in the GadgetSphere Sdn Bhd finance team. The group has three companies (the retail company GS, the e-commerce company GSO, and the wholesale company GSD) trading across 22 branches in Klang Valley, Penang, Johor Bahru, Kota Kinabalu, and Kuching. Quarter-end falls on 31 March 2026, your external accountant needs the Excel files by next Tuesday for the SST filing, and your finance manager wants to see how branch GS-KV-01 compared to GS-KV-05 over the quarter before they sign off. BigLedger does not produce a single true consolidated statement in this applet — you generate one set of reports per company (GS, GSO, GSD) and combine them in Excel for the group view your accountant signs off on.

{{< callout type="info" >}}
A Financial Report in BigLedger is a **frozen snapshot**. The moment you generate it, the numbers are saved as they stood at that instant. If a back-dated journal lands later, you must reopen the snapshot and click **Regenerate** — it will not refresh on its own.
{{< /callout >}}

## Concepts you will meet

**Set of Books** — the reporting container that groups all the ledgers belonging to one company. GadgetSphere has three: GS-Books, GSO-Books, and GSD-Books. You pick one Set of Books per report run; for a group-level view, generate one report per company and combine the figures in Excel.

**Month-End Processing** — a one-click routine that posts three sets of journals for the month you are closing: Cost of Goods Sold for everything you sold, the Retained Earnings roll-forward (last month's profit moved into accumulated profit), and the closing-day / opening-day balance carry. Run this **before** you generate the Financial Report or the Balance Sheet will not balance.

**Financial Report snapshot** — when you generate a Trial Balance, Profit and Loss, or Balance Sheet, BigLedger saves a snapshot of the numbers at that moment. Frozen unless you regenerate.

**Profit and Loss Report (ad-hoc)** (the on-screen menu label reads "Profit Loss Report") — a separate screen that runs a Profit and Loss view on demand without saving a snapshot. This is where you compare branches, cost centres, or projects side by side.

## Before you start

Run through this checklist once before you open the reporting screens. Five minutes here saves an hour of chasing later.

- Your Chart of Accounts is fully wired — every active GL Code (for example `SALES-SMARTPHONE-KV01`, `COST-LAPTOP`, `EXPENSE-RENTAL`) sits under a GL Category, and every Category sits under a GL Section (Assets, Liabilities, Revenue, Cost of Sales, Expenses, Equity). Anything missing that chain quietly drops out of the reports.
- Each of the three companies (GS, GSO, GSD) has its own Set of Books with at least one ledger linked.
- Default GL Codes are filled in on every company — at minimum **Purchase**, **Purchase Return**, **Inventory awaiting invoice** (the Goods Received / Invoice Received holding account, often written GR/IR), **Cost of Goods Sold**, and **Retained Earnings**. Without these, Month-End Processing will refuse to run.
- Every sales invoice, purchase invoice, receipt, payment, and manual adjustment for March 2026 is posted (not still in draft). Anything in draft will not appear in your reports.
- Bank reconciliations for all 28 cashbooks are complete to 31 March 2026 — see the [Bank Reconciliation Guide](/guides/accounting-guides/bank-reconciliation-guide/).
- You sign in as a Finance Manager (or as an Accounts Executive with reporting rights). Junior cashier roles can read reports but cannot create or regenerate them.

## Step 1: Confirm March 2026 is ready to close

*Main menu > Tools > Trace Document, and Main menu > Reports > Stock Flow Report*

Before you press a single button in the reporting screens, walk through your March 2026 checklist for each of the three companies (GS, GSO, GSD). Open **Trace Document** and filter on the date range 1 March 2026 to 31 March 2026 — every sales invoice, purchase invoice, receipt voucher, payment voucher, and manual journal should show **Posted**, not **Draft**. A single draft document will pull its amount out of your Trial Balance.

Next, open **Stock Flow Report** for March 2026 and confirm there are no unbalanced stock rows (red lines at the bottom). These usually mean a goods-received note has not been matched to its purchase invoice, and they will throw your Cost of Goods Sold off by thousands of ringgit. Finally, glance at the bank reconciliation listing for all 28 cashbooks and confirm a March 2026 reconciliation exists for each.

Watch out: if Trace Document shows even one draft purchase invoice in March, stop and post it first — your Trial Balance will not balance otherwise, and you will waste 20 minutes hunting the gap.

## Step 2: Run Month-End Processing for March 2026

*Main menu > Financial Reports > Month-End Processing > click the + (New) button*

Open **Month-End Processing** and create one new record for **GS-Books** with Year 2026 and Month March, then click **Save**. BigLedger posts three things in sequence: Cost of Goods Sold (debiting the `COST-SMARTPHONE` / `COST-LAPTOP` / `COST-ACCESSORY` accounts and crediting inventory), the prior month's profit into Retained Earnings, and a closing-day journal at end-of-March plus an opening-day journal at 1 April. On a tenant your size this takes 20-40 seconds — wait for the spinner to clear.

Repeat the same three-field create for **GSO-Books** and again for **GSD-Books**. After all three runs you should see three new rows in the Month-End Processing listing, each tagged March 2026. Skip this step and your Balance Sheet will be out by your March profit (often tens of thousands of ringgit at GadgetSphere's scale) and your Profit and Loss will show zero Cost of Goods Sold.

Watch out: if the create fails with a message about a missing company reference, one of your three companies has not had its default GL Codes mapped — go to **Companies > Default GL Codes** and at minimum map Purchase, Inventory awaiting invoice, Cost of Goods Sold, Purchase Return, and Retained Earnings, then re-run.

## Step 3: Generate the Financial Report snapshot for the quarter

*Main menu > Financial Reports > Financial Report > click the + (New) button*

Open **Financial Report** and click **New**. Pick **GS-Books** as the Set of Books, **Start Year** 2026, **Start Month** 1, **End Year** 2026, **End Month** 3. Click **Save**. BigLedger reads every general-ledger entry in the quarter, groups them by GL Section, GL Category, and GL Code, and writes the totals into a new snapshot row. On a tenant your size this normally takes 5-20 seconds.

Repeat for **GSO-Books** (Q1 2026) and **GSD-Books** (Q1 2026). You now have three Q1 2026 snapshots in the listing, each with its own Trial Balance, Profit And Loss, Balance Sheet, and Malaysian Income Tax Reporting Standard (MITRS) tab. Remember the snapshot is frozen at this moment in time — if your finance manager posts a back-dated correction tomorrow, you will need to come back and click **Regenerate** on the affected snapshot (covered in Step 8).

Watch out: if the snapshot saves but the Trial Balance tab is empty, you almost certainly picked the wrong Set of Books — a Sales Order Books, for example, will produce a blank report. Delete and re-create with the correct Set of Books.

## Step 4: Check the Trial Balance balances

*Main menu > Financial Reports > Financial Report > open the GS-Books Q1 2026 row > Trial Balance tab*

Open the GS-Books Q1 2026 row from the listing and switch to the **Trial Balance** tab. You will see every GL Code that had any movement in the quarter — `CASH-PRI-KV01` (cash, primary bank, KV branch 01), `DEBTOR-TRADE-RETAIL` (customers who owe you money), `INV-SMARTPHONE` (smartphone stock on hand), `SALES-SMARTPHONE-KV01` (smartphone revenue from KV branch 01), `COST-SMARTPHONE` (cost of smartphone sales), `EXPENSE-RENTAL`, `LIAB-SST-OUTPUT` (Output SST you owe the tax authority), and so on — grouped by GL Section and GL Category.

Scroll to the footer. The total **Debit** and total **Credit** columns must match to the cent. For GadgetSphere's Q1 2026 you should see something like **Debit RM 47,238,901.22 = Credit RM 47,238,901.22** — typically in the tens of millions of ringgit at this scale; the two numbers must be identical. If they are off by even RM 0.01 the cause is almost always a journal posted with only one leg (often from a CSV import), and you can find it by sorting the grid by GL Code and looking for an odd one out. Repeat the check for **GSO-Books** and **GSD-Books**.

Watch out: a GL Code that you know had transactions (for example a freshly added `SALES-GAMING-KV12`) is missing — its GL Category is not linked to a GL Section. Go to **Chart of Account**, add the link, then come back and click **Regenerate**.

## Step 5: Read the per-company Profit and Loss for the quarter

*Main menu > Financial Reports > Financial Report > open the GS-Books Q1 2026 row > Profit And Loss tab*

On the same GS-Books Q1 2026 snapshot, switch to the **Profit And Loss** tab. Rows are grouped by GL Section — Revenue first (sales of smartphones, laptops, accessories across branches), then Cost of Sales (`COST-SMARTPHONE`, `COST-LAPTOP`, `COST-ACCESSORY`), then Operating Expenses (rental, wages, marketing). BigLedger injects calculated rows in bold: **Net Sales**, **Total Cost of Goods Sold**, **Gross Profit (Loss)**, **Gross Margin**, **Profit Before Taxes**, and **Net Profit (Loss)** with Profit Margin.

Those bold calculated rows are not clickable — drill-down only works on real GL Code rows. For GadgetSphere's Q1, expect numbers in this ballpark: **Net Sales RM 12.4 million**, **Total Cost of Goods Sold RM 10.6 million**, **Gross Profit RM 1.82 million**, **Gross Margin 14.6%**, **Net Profit RM 0.46 million**. Sanity check that Gross Margin for GS-Books sits in the 12-18% range you would expect for a multi-brand consumer electronics retailer; if it comes out at 3% or 60%, something is wrong with Cost of Goods Sold (revisit Step 2). Repeat the check for **GSO-Books** (e-commerce typically a touch lower margin) and **GSD-Books** (wholesale typically lower still).

Watch out: if Cost of Goods Sold looks empty or far too small, Month-End Processing did not run successfully — go back to Step 2 and confirm the March 2026 record exists for that Set of Books, then click **Regenerate** on the snapshot.

## Step 6: Read the Balance Sheet and confirm it balances

*Main menu > Financial Reports > Financial Report > open the GS-Books Q1 2026 row > Balance Sheet tab*

Switch to the **Balance Sheet** tab. The view groups every GL Code at its 31 March 2026 balance under **Assets** (`CASH-PRI-KV01` through `KV12`, `DEBTOR-TRADE-RETAIL` (customers who owe you money), `INV-SMARTPHONE`, `INV-LAPTOP`), **Liabilities** (`LIAB-SUPPLIER-TRADE` (suppliers you owe money to), `LIAB-SST-OUTPUT` (Output SST you owe the tax authority)), and **Equity** (`EQUITY-CAPITAL` (shareholders' paid-in capital), `EQUITY-RETAINED` (accumulated profits the business has retained)). BigLedger injects four bold totals: **Total Assets**, **Total Liabilities**, **Total Shareholders' Equity**, and **Total Liabilities and Shareholders' Equity**.

The arithmetic test is simple: **Total Assets must equal Total Liabilities + Total Shareholders' Equity**. If it does not, the most common cause at month-end is that Retained Earnings was not rolled forward — meaning Month-End Processing did not complete for the prior period. Go back to Step 2, run Month-End Processing for any unclosed prior month (December 2025, January 2026, February 2026), then come back here and click **Regenerate**. Once GS, GSO, and GSD all balance, you are ready to compare branches.

Watch out: if the Balance Sheet is off by exactly your March profit number, the Retained Earnings roll-forward did not post — re-run Month-End Processing for March and Regenerate the snapshot.

## Step 7: Run the ad-hoc Profit and Loss Report comparing branch GS-KV-01 against GS-KV-05

*Main menu > Financial Reports > Profit Loss Report*

Open the ad-hoc **Profit and Loss Report** (the menu label reads "Profit Loss Report") — a separate screen from the Financial Report snapshot you have been working in. Set **Group By** to **Branch**, then in the **Branch** picker tick **GS-KV-01** and **GS-KV-05**. Set **Date From** to 1 January 2026, **Date To** to 31 March 2026, and leave **Cost Type** on **Moving Average** (MA) — that matches what Month-End Processing posted in Step 2, so your numbers reconcile.

Click **Search**. The grid pivots in your browser to show both branches side by side, with calculated Gross Margin and Profit Margin rows. This is the report your finance manager actually wants when they ask "how is KV-01 doing versus KV-05" — you can see in one screen whether KV-01's higher footfall is producing higher margin or just higher cost. Nothing is saved; if you want a permanent record, export to Excel from the grid's status bar.

Watch out: if the **Search** button stays greyed out on the Profit and Loss Report, you forgot to tick a branch in the Branch picker — Group By alone is not enough, you must also select at least one specific branch.

## Step 8: Regenerate any snapshot if a back-dated entry lands

*Main menu > Financial Reports > Financial Report > open the affected row > REGENERATE button (top right)*

Snapshots are frozen at the moment you created them. If any back-dated journal posts into Q1 2026 after Step 3 (a common scenario: your accountant spots a misclassified RM 38,000 rental accrual a week later and corrects it), the original snapshot will still show the old numbers.

Open the affected snapshot (say **GS-Books Q1 2026**), click **REGENERATE** in the top right, and confirm. BigLedger throws away every line in that snapshot and re-aggregates from scratch — the header (Set of Books, period) is preserved, so all your links and exports still point to the same record. If the correction also touches Cost of Goods Sold or Retained Earnings, you must first re-run Month-End Processing for March: open the March 2026 Month-End Processing record, go to the **Processor** tab, and click **Cost of Goods Sold**, then **General Ledger**, then **Retained Earnings**, in that order. Only then come back here and click **Regenerate**.

Watch out: clicking Regenerate on a Month-End Processing record does nothing — Regenerate only works on Financial Report snapshots. To re-run a month-end, use the three buttons on the Month-End Processing record's Processor tab instead.

## Step 9: Export the three statements to Excel for the external accountant

*Main menu > Financial Reports > Financial Report > open each row > REPORT button > Excel export*

On the GS-Books Q1 2026 snapshot, switch to the **Trial Balance** tab and click the **REPORT** button at the top right — this swaps to a full-width printable layout. Then use the grid's export menu at the bottom of the screen and choose **Excel (Analysis)**. BigLedger pre-fills the workbook title (GS-Books / Trial Balance / 1 January 2026 to 31 March 2026), keeps the bold subtotals as Excel bold, and lays the sheet out in portrait.

Repeat for **Profit And Loss** (lands in landscape) and **Balance Sheet**. Do the same three exports for **GSO-Books Q1 2026** and **GSD-Books Q1 2026**. You now have nine files — name them with the convention you use with your external accountant (for example `GS-TB-Q1-2026.xlsx`, `GS-PL-Q1-2026.xlsx`, `GS-BS-Q1-2026.xlsx`) and email them. Use the same approach for the GS-KV-01-versus-GS-KV-05 comparison from Step 7 if your manager wants it attached.

Watch out: if the Excel file comes out with collapsed groups or missing totals, you skipped the **REPORT** button before exporting — close the file, click **REPORT**, and export again.

## Step 10: Lock March 2026 so nothing slips back in

*Main menu > Master Data > Chart of Account > Fiscal Year > March 2026 > set status to Lock GL*

Once the external accountant has confirmed they have the files, set the March 2026 fiscal period status to **Lock General Ledger (Lock GL)**. This stops anyone in the team from posting a fresh journal back into March — a common cause of "why does my Q1 number keep changing" panic. Do this for each of the three companies (GS, GSO, GSD).

**Lock GL** is the realistic month-end habit; you reserve the stricter **Lock Everything (Lock All)** status for year-end (December 2026), when even authorised users should be blocked from any change. If you discover a genuine adjustment is needed after locking, a senior accountant can temporarily switch the period back to **Open**, post the correction, run Month-End Processing again, Regenerate the snapshot (Step 8), and re-lock. Doing it this way means every adjustment is deliberate, traceable, and signed off — not an accidental Friday-afternoon typo.

Watch out: if you cannot find the **Lock GL** option, your role does not have permission to change the period status — ask a Finance Manager to do it for you.

## What success looks like

Open the **GS-Books Q1 2026** snapshot.

- Trial Balance footer shows total **Debit RM 47,238,901.22 = Credit RM 47,238,901.22** (your actual number will differ — what matters is the two values are identical).
- Profit And Loss shows a non-zero **Cost of Goods Sold** (around RM 10.6 million for GS-Books) and a **Gross Margin** in the 12-18% range (around 14.6%).
- Balance Sheet shows **Total Assets** equal to **Total Liabilities + Shareholders' Equity** (both around RM 18-22 million for GS-Books at this scale).
- You have nine Excel files saved (Trial Balance, Profit and Loss, Balance Sheet for each of GS, GSO, GSD).
- The March 2026 fiscal period for all three companies shows status **Lock General Ledger (Lock GL)**.

If all five tick, you are done — email the files and close the laptop.

## Common mistakes

| Symptom | Cause | Fix |
|---|---|---|
| Balance Sheet does not balance — Total Assets is off from Total Liabilities + Equity by roughly your March net profit. | Month-End Processing was skipped or failed for March, so Retained Earnings was never rolled forward. | Open Month-End Processing for March 2026 for that Set of Books, click the **Processor** tab, run **Cost of Goods Sold**, then **General Ledger**, then **Retained Earnings** in order. Then reopen the Financial Report snapshot and click **Regenerate**. |
| Profit and Loss shows Cost of Goods Sold as zero or impossibly small even though plenty of sales are posted. | Month-End Processing has not run for the period yet, or your stock flow has unbalanced rows from an unmatched goods-received note. | Run Month-End Processing for the month (Step 2). If Cost of Goods Sold is still off, open the **Stock Flow Report** for that month and fix any unbalanced rows, then re-run. |
| A GL Code you know had movement (for example `SALES-GAMING-KV12`) is completely missing from the Trial Balance. | Its GL Category is not linked to a GL Section, so the report's grouping drops it. | Open **Chart of Account**, find that GL Category, attach it to the correct GL Section (Revenue, Cost of Sales, etc.), come back to the snapshot, and click **Regenerate**. |
| A back-dated correction your accountant posted yesterday is not showing in the snapshot you generated last week. | Snapshots are frozen photographs — they do not refresh by themselves. | Open the snapshot and click **Regenerate**. If the correction affects Cost of Goods Sold or Retained Earnings, also re-run the three buttons on the March 2026 Month-End Processing record's **Processor** tab first. |
| Profit Loss Report **Search** button stays greyed out and the screen will not run. | **Group By** is set (for example to **Branch**) but no specific branch has been ticked in the picker. | Tick at least one branch (or project, segment, cost centre) in the dimension picker matching your Group By, then **Search** will become clickable. |

## Related documentation

{{< cards >}}
  {{< card link="/applets/finance/financial-report-applet/" title="Financial Report Applet" subtitle="Field-by-field reference for the Financial Report screen" >}}
  {{< card link="/guides/accounting-guides/chart-of-accounts-setup/" title="Chart of Accounts Setup Guide" subtitle="Wire GL Codes, Categories, and Sections so reports pick everything up" >}}
  {{< card link="/guides/accounting-guides/journal-entries/" title="Journal Entries Guide" subtitle="Post the manual adjustments that show up in your Trial Balance" >}}
  {{< card link="/guides/accounting-guides/bank-reconciliation-guide/" title="Bank Reconciliation Guide" subtitle="Tick off all 28 cashbooks before you close the month" >}}
  {{< card link="/applets/finance/general-ledger-applet/" title="General Ledger Applet" subtitle="Drill into individual GL Code movements behind the reports" >}}
  {{< card link="/applets/finance/ledger-and-journal-applet/" title="Ledger and Journal Applet" subtitle="Reference for the underlying ledger and journal records" >}}
{{< /cards >}}
