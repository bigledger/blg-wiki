---
title: Chart of Accounts Setup Guide
description: Set up your chart of accounts in BigLedger so your first sales invoice posts cleanly and your trial balance balances to the cent.
tags:
- user-guide
- accounting
- chart-of-accounts
weight: 10
---

You are setting up GadgetSphere's chart of accounts in BigLedger for the first time, migrating from a previous accounting system. By the end of this guide, your first sales invoice will post without error and your trial balance will balance to the cent. Set aside about 45 minutes of focused time — that is enough to get the chart live, with room left to test a posting before lunch.

## Meet GadgetSphere

GadgetSphere Sdn Bhd is a Malaysian consumer electronics retailer with 22 branches across the Klang Valley, Penang, Johor Bahru, Kota Kinabalu, and Kuching. You are doing this setup for GadgetSphere Sdn Bhd (entity code `GS`) — the main retail company. Two sister companies, GadgetSphere Online (`GSO`) and GadgetSphere Distribution (`GSD`), will be added later, but you are starting with the operating retailer. You have around 5,200 stock-keeping units (SKUs), 28 cashbooks across three banks, Sales and Service Tax (SST) registration at 6%, and a finance manager who wants the chart ready by Friday so the next month-end posts cleanly.

{{< callout type="info" >}}
**The one rule that prevents almost every go-live failure**: every transaction must land in a GL Code, every GL Code must belong to a GL Category, and every GL Category must be linked to a GL Section. If any link is missing, postings fail or balances vanish from your financial reports. Do steps 3 and 4 in order — never skip the section link.
{{< /callout >}}

## Three concepts to know first

**The three-level filing system — GL Section, GL Category, GL Code.** Every transaction lands in a GL Code (the account, e.g. `CASH-PRI-KV01`). Every code lives inside a GL Category (e.g. Current Assets). Every category rolls up to a GL Section (e.g. Assets), which is the line on your financial statements.

**The system's shortcuts — Default GL Codes.** When you save a sales invoice, BigLedger does not ask "which account should this sale go to?" — it looks up the Default GL Codes mapping on the company record. You map each system role (Trade Debtor, Sales, Output SST, Cost of Goods Sold, Retained Earnings, and so on) to one of your GL Codes once, and the system uses it from then on.

**The binder that holds your ledger — Set of Books.** A Set of Books is a container that links one or more ledgers together for a reporting purpose, for example a statutory Set of Books for tax filing and a management Set of Books for internal profit and loss. Most single-entity setups start with one Set of Books containing one Primary Ledger.

## Before you start

- Your tenant exists and the company shell for GadgetSphere Sdn Bhd has been created in the Organisation applet (Company Code `GS`, Currency MYR).
- You know your reporting currency (MYR for GadgetSphere) and your fiscal year boundaries (1 January to 31 December for this example).
- You have your existing chart of accounts exported from the previous system as a spreadsheet, ready to convert to CSV.
- You have a one-page list of which existing GL Codes will play which system role (which one is Trade Debtors, which one is Retained Earnings, which one is Output SST, and so on).
- You are signed in with a Finance Manager role — this gives you Chart of Account create, edit, and Default GL Code mapping rights.
- You have agreed a GL Code naming convention with your finance manager. GadgetSphere uses mnemonic codes like `CASH-PRI-KV01`, `SALES-SMARTPHONE-KV01`, `EXPENSE-RENTAL` rather than numeric ranges.

## Step 1: Confirm GadgetSphere's company record and currency

*Master Data > Chart of Account Applet > Companies*

Open the Chart of Account applet and click Companies in the sidebar. You should see GadgetSphere Sdn Bhd in the listing — the Organisation applet creates this shell when the tenant is provisioned. Click the row to open the Main tab. Check four fields: Company Code (`GS`), Company Name (GadgetSphere Sdn Bhd), Company Registration No. (your SSM number), and Currency (MYR). If any of those is wrong, fix it here and save — the Company Code is the only field you cannot change after creation. Also enter your SST ID now if GadgetSphere is registered. Do not touch the Chart of Account or Inventory Cost Base dropdowns yet; you will come back to those after the chart exists. If GadgetSphere Sdn Bhd is missing entirely, stop and create it in the Organisation applet first, then come back. Do not try to create a second `GS` record here — duplicates will cause downstream posting confusion.

{{< figure src="/images/chart-of-account-applet/screenshots/company-main-tab.png" alt="Companies > Main tab showing Company Code, Name, Registration No. and Currency for GadgetSphere Sdn Bhd" >}}

Watch out: if you save the Company Code as `GADGETSPHERE` because that is what the previous system used, you are stuck with it forever — the Company Code is immutable. Use a short stable mnemonic like `GS`.

## Step 2: Review your GL Sections

*Master Data > Chart of Account Applet > GL Section*

Click GL Section in the sidebar. A fresh tenant ships with the standard set: Assets, Liabilities, Equity, Revenue, and Expenses. For a retail business like GadgetSphere, that is all you need — do not split Assets into Current and Fixed at this level. The split happens one level down at GL Category. Scan the list and make two small edits if needed: rename `Long Term Liabilities` to `Liabilities` if you prefer it grouped, and verify that Revenue (not Income) matches how your finance manager talks about the top line. To rename, click the row, change the Name, click Save. The Account No. field on each section is only used by certain printable report layouts — leave it blank unless your accountant has asked for a specific number. You should not need to create new sections from scratch; if you do, keep the total under eight. Sections are the chapter headings of your financial statements, not subdivisions.

{{< figure src="/images/chart-of-account-applet/screenshots/coa-listing.png" alt="Chart of Account tree view showing the standard GL Sections: Assets, Liabilities, Equity, Revenue, Expenses" >}}

Watch out: if you rename a section while there are already linked categories, the rename flows through correctly — but a typo in `Equty` will appear on every balance sheet from now on. Spell-check before saving.

## Step 3: Bulk import your GL Categories

*Master Data > Chart of Account Applet > Import GL Category*

For 22 branches and around 5,200 SKUs, you will end up with around 30 categories. Typing them one by one is slow — use the bulk import. Open Import GL Category and click the `*Sample Format` link to download the CSV template. Open it in your spreadsheet. For GadgetSphere, your categories will look like: Current Assets, Cash and Bank, Trade Receivables, Inventory, Fixed Assets, Current Liabilities, Tax Liabilities, Trade Payables, Equity, Sales Revenue, Cost of Sales, Operating Expenses, Marketing Expenses, Wages and Salaries, Rental, Utilities, Bank Charges, Depreciation. Fill in the GL Category Code (e.g. `CAT-CASH-BANK`), the GL Category Name (Cash and Bank), and optionally a Description. Save as CSV, drag it onto the upload area, review the green/red preview, then click ADD to commit. The GL Category Code is immutable after import — if you typo it, you cannot rename it later, only deactivate. If you have fewer than 10 categories, just create them manually under GL Category > New rather than bothering with the import.

{{< figure src="/images/chart-of-account-applet/screenshots/gl-category-listing.png" alt="GL Category listing after bulk import showing around 30 retail categories" >}}

Watch out: if a row imports with no Category Code, the system rejects it with a red flag and skips the row — your file will appear to import successfully but you will be missing categories. Always check the import preview count matches your CSV row count.

## Step 4: Link each category to its parent section

*Master Data > Chart of Account Applet > GL Category > (open category) > GL Section tab*

This is the step most setups forget, and it is the reason categories vanish from financial statements. The bulk import creates the categories but does not link them to a section. You need to do that one at a time. Open the first category — say, Current Assets. Switch to the GL Section tab. Click Add, pick `Assets` from the dropdown, save. Repeat for every category: Current Assets, Cash and Bank, Trade Receivables, Inventory all link to Assets; Current Liabilities, Tax Liabilities, Trade Payables to Liabilities; Equity to Equity; Sales Revenue to Revenue; Cost of Sales, Operating Expenses, Marketing Expenses, Wages, Rental, Utilities, Bank Charges, Depreciation to Expenses. For 30 categories you are looking at roughly seven minutes of clicking. When you are done, open the Chart of Account tree view (sidebar > Chart of Account) and expand each section. Every category should be visible underneath its section. If a category is missing from the tree, it is not linked yet — go back and link it.

{{< figure src="/images/chart-of-account-applet/screenshots/gl-category-edit.png" alt="GL Category edit view with the GL Section tab open and Assets selected as parent" >}}

Watch out: if you link the same category to two different sections (for example Cash and Bank under both Assets and Liabilities), your trial balance will double-count. The GL Section tab allows multiple links by design; only add one section per category unless you really know why.

## Step 5: Bulk import your GL Codes

*Master Data > Chart of Account Applet > Import GL Code*

For GadgetSphere with 22 branches, 28 cashbooks, and multiple product categories you will end up with roughly 400 GL Codes. Open Import GL Code and download the `*Sample Format` CSV. The columns are CHART_OF_ACC, GL_CATEGORY, GL_CODE, GL_NAME, DESC. Go back to your exported chart from the previous system, map each old code to its new GadgetSphere code, and paste into the template. A typical block will look like: row 1, `COA-GS`, `CAT-CASH-BANK`, `CASH-PRI-KV01`, `Cash - Primary Bank - KV Branch 01`, blank; row 2, `COA-GS`, `CAT-CASH-BANK`, `CASH-PRI-KV02`, `Cash - Primary Bank - KV Branch 02`, blank; and so on for all 28 cashbooks. Then the inventory codes (`INV-SMARTPHONE`, `INV-LAPTOP`, `INV-TABLET`, `INV-GAMING`, `INV-ACCESSORY`), then the sales codes per branch (`SALES-SMARTPHONE-KV01`, `SALES-LAPTOP-KV01`, etc.), then the cost-of-sales codes (`COST-SMARTPHONE`, `COST-LAPTOP`), then the expenses (`EXPENSE-RENTAL`, `EXPENSE-WAGES`, `EXPENSE-MARKETING`, `EXPENSE-UTILITIES`), then the liabilities (`LIAB-SST-OUTPUT`, `LIAB-SUPPLIER-TRADE`), then equity (`EQUITY-CAPITAL`, `EQUITY-RETAINED`). Save as CSV, upload, watch for red flags in the preview. The most common red flag is a `GL_CATEGORY` value that does not exactly match what you imported in Step 3 — copy-paste category names rather than retyping. Click ADD to commit.

{{< figure src="/images/chart-of-account-applet/screenshots/gl-code-listing.png" alt="GL Code listing after bulk import showing around 400 GadgetSphere codes" >}}

Watch out: GL Codes are immutable after save — if you import `CASH-PRI-KVO1` (letter O) instead of `CASH-PRI-KV01` (zero), the only way out is to deactivate and re-import. Get one row right manually first, confirm the format, then run the full import.

## Step 6: Create the primary ledger and Set of Books

*Master Data > Chart of Account Applet > Companies > (open `GS`) > Ledgers tab, then sidebar > Set Of Books*

Open GadgetSphere Sdn Bhd in Companies and switch to the Ledgers tab. Click New and fill in: Ledger Code `LED-GS-PRI`, Ledger Name `GadgetSphere Primary Ledger`, Ledger Type Primary, Currency MYR. Save. For now you only need one Primary ledger — secondary or consolidated ledgers come later when you bring in `GSO` and `GSD`. Next, go to sidebar > Set Of Books > New. Name it `SOB-GS-MAIN` (or `Main Books FY2026` if your finance manager prefers a more human name) and save. Open the new Set of Books, switch to the Ledgers tab, click Add, and select `LED-GS-PRI`. Save. This is the wiring that lets Trial Balance, Profit and Loss, and Balance Sheet reports find your data. Without a Set of Books linked to a Ledger, your financial reports will run but return zero rows even though postings exist — an easy hour-long wild goose chase to avoid.

{{< figure src="/images/chart-of-account-applet/screenshots/company-ledgers.png" alt="Companies > Ledgers tab with the GadgetSphere Primary Ledger created" >}}

Watch out: if you accidentally create the ledger as Secondary instead of Primary, opening balances cannot be entered against it later. Delete and recreate as Primary before saving any transactions.

## Step 7: Map the Default GL Codes (the critical 17 plus SST)

*Master Data > Chart of Account Applet > Companies > (open `GS`) > Default GL Codes tab*

This is the step that prevents the biggest class of go-live failures. Open GadgetSphere in Companies and switch to the Default GL Codes tab. Work through the sub-tabs and map every role that applies to a retailer.

| Sub-tab | Role | Map to |
|---|---|---|
| General | Retained Earnings | `EQUITY-RETAINED` |
| General | Profit / Loss | `EQUITY-RETAINED` |
| General | Rounding | `EXPENSE-ROUNDING` |
| General | Settlement Charges | `EXPENSE-BANK-CHARGES` |
| Entity | Trade Debtor | `DEBTOR-TRADE-RETAIL` |
| Entity | Trade Creditor | `LIAB-SUPPLIER-TRADE` |
| Entity | Non-Trade Debtor | `DEBTOR-NON-TRADE` |
| Entity | Non-Trade Creditor | `LIAB-NON-TRADE` |
| Sales | Sales | `SALES-DEFAULT` |
| Sales | Sales Return | `SALES-RETURN` |
| Sales | Sales Discount | `SALES-DISCOUNT` |
| Sales | Output Tax (Output SST) | `LIAB-SST-OUTPUT` |
| Purchase | Purchase | `EXPENSE-PURCHASES` |
| Purchase | Purchase Return | `EXPENSE-PURCHASE-RETURN` |
| Purchase | Input Tax (Input SST) | `ASSET-SST-INPUT` |
| Stock | Stock Balance | `INV-STOCK-CONTROL` |
| Stock | Cost of Goods Sold | `COST-DEFAULT` |
| Stock | Stock Adjustment | `EXPENSE-STOCK-ADJUSTMENT` |
| Stock | Reset Moving Average (MA) | `EXPENSE-STOCK-ADJUSTMENT` |
| Stock | Inventory Not Invoiced (Goods Received / Invoice Received, GR/IR) | `LIAB-GRIR` |

On Forex: only if GadgetSphere imports in USD — set Forex Gain and Forex Loss to your forex accounts. Skip the Consignment and the Raw / Work In Progress (WIP) / Finished Goods (FG) variants — GadgetSphere is a retailer, not a manufacturer. Save each tab as you go. Missing mappings here will surface as red posting errors days or weeks later, often during your first month-end SST filing.

{{< figure src="/images/chart-of-account-applet/screenshots/coa-edit-tabs.png" alt="Companies > Default GL Codes tab showing the role-to-account mapping for GadgetSphere" >}}

Watch out: if you map Output Tax to an Expense code by mistake (e.g. `EXPENSE-SST` instead of `LIAB-SST-OUTPUT`), your SST return will show negative output tax. Double-check that every tax mapping points to a Liability code for Output and an Asset code for Input.

## Step 8: Open the fiscal year and set the period status

*Master Data > Chart of Account Applet > Fiscal Year > New*

Click Fiscal Year in the sidebar and then New. Select GadgetSphere Sdn Bhd as the Company. Name the year `FY 2026`. Set Date Start to 1 January 2026 and Date End to 31 December 2026. Save. BigLedger auto-generates 12 monthly periods (January 2026 through December 2026). Open the new fiscal year and switch to the Fiscal Period tab. Confirm every period exists and that each one has Closing Status set to OPEN. If the migration cutover is mid-year (say you are going live on 1 April), set January through March to LOCK_TXN — this prevents anyone from accidentally back-dating an invoice into a closed period that was managed in the old system. Leave April through December as OPEN. Avoid LOCK_ALL during setup; that is the hard close used only at year-end after audit sign-off, and it cannot be undone without administrator intervention. The other two statuses — LOCK_GL (blocks manual journals but allows automatic posting) and LOCK_TXN (blocks new operational documents from being dated into the period) — are what you will use month by month once GadgetSphere is live.

{{< figure src="/images/chart-of-account-applet/screenshots/fiscal-year-listing.png" alt="Fiscal Year listing with FY 2026 and its 12 monthly periods" >}}

Watch out: if you accidentally save a fiscal year that overlaps an existing one, the system rejects it but the error message is generic. Check the Date Start of FY 2026 is exactly the day after the Date End of FY 2025.

## Step 9: Verify with a trial balance and a test invoice

*Financial Reports > Trial Balance, then Sales > Sales Invoice > New*

Two checks, five minutes. First, post your migration opening balances as a manual journal through the Ledger and Journal applet — dated 31 December 2025 (the day before FY 2026 starts), debits equal credits, every line referencing one of your new GL Codes. The opening balance journal for GadgetSphere will typically run RM 4-8 million in total: cash across 28 cashbooks, inventory of around RM 2 million in smartphones and laptops, trade debtors, fixed assets net of depreciation, supplier payables, SST liabilities, share capital, retained earnings. Then run Financial Reports > Trial Balance for 31 December 2025. Total debits must equal total credits — if they don't, your opening journal is unbalanced.

Second, create one test sales invoice: customer = a test debtor, line = one smartphone at RM 1,000 + 6% SST, branch = `GS-KV-01`. Save. Open the journal that BigLedger auto-posted from the invoice. It should debit `DEBTOR-TRADE-RETAIL` RM 1,060, credit `SALES-SMARTPHONE-KV01` (or `SALES-DEFAULT` if you did not create per-branch sales codes) RM 1,000, and credit `LIAB-SST-OUTPUT` RM 60. If any of those credits or debits is missing, a Default GL Code mapping in Step 7 is wrong — go back and fix it. Once both checks pass, void the test invoice and you are live.

{{< figure src="/images/chart-of-account-applet/screenshots/coa-listing.png" alt="Chart of Account tree view with all sections, categories and codes visible" >}}

Watch out: if the test invoice posts but Output SST goes to the wrong account, you have mis-mapped Output Tax in Default GL Codes. Symptom is correct totals but the SST line lands in an Expense account instead of a Liability — fixable in one click, but you have to spot it before you do real invoices.

## What success looks like

Open Financial Reports > Trial Balance and run it for 31 December 2025 (your migration cutoff). The Total Debit and Total Credit columns at the bottom of the report should match to the cent, equal to the totals from your old accounting system. Then open the test sales invoice you posted in Step 9 and click View Journal — you should see one debit row to your trade debtor code and two credit rows (one to a sales code, one to your Output SST liability code), summing to RM 1,060. If both of those are true, the chart is wired correctly and GadgetSphere can start invoicing.

## Common mistakes

| Symptom | Cause | Fix |
|---|---|---|
| A new GL Category does not appear under any section in the Chart of Account tree view, even though you can see it in the GL Category listing. | You created the category but did not link it to a GL Section. The bulk import does not link categories to sections — that is a separate step per category. | Open the category, switch to the GL Section tab, click Add, pick the parent section (Assets, Liabilities, Equity, Revenue, or Expenses), save. Repeat for every orphan category. |
| Your first sales invoice fails to save with an error like "no GL Code mapped for SALES" or "no GL Code mapped for Output Tax". | A Default GL Code role was left blank in Companies > Default GL Codes. | Open the `GS` company, go to the Default GL Codes tab, find the relevant sub-tab (Sales for the Sales role; Sales for the Output Tax role), pick the correct GL Code from the dropdown, save. Retry the invoice. |
| You imported a GL Code with a typo (`CASH-PRI-KVO1` with a letter O instead of zero) and now you cannot rename it. | GL Codes are immutable after save — only Name and Description can be edited, not the Code itself. | Set the wrong code to INACTIVE. Create the correct code (`CASH-PRI-KV01`) as a new GL Code. If you already posted to the wrong code, use GL Code Merge to move history from the typo'd code to the correct one. |
| Trial Balance runs but returns zero rows even though you can see opening balances on individual accounts. | Your Primary Ledger is not linked to a Set of Books. Financial reports read from Sets of Books, not from ledgers directly. | Open Set Of Books, click your Set of Books, switch to the Ledgers tab, click Add, pick the Primary Ledger you created in Step 6, save. Re-run the Trial Balance. |
| Trial Balance debit and credit totals do not match — out by a small amount (e.g. RM 0.05) or a large amount (e.g. RM 50,000). | Small differences usually come from rounding in the opening balance journal; large differences usually come from forgetting to post the contra entry to Retained Earnings (`EQUITY-RETAINED`) when migrating mid-year. | Re-open the opening balance journal in the Ledger and Journal applet. Confirm total debits equals total credits. If you migrated mid-year, the difference between Asset balances and Liability + Equity balances should be plugged to Retained Earnings. |

## Related documentation

{{< cards >}}
  {{< card link="/applets/master-data/chart-of-account-applet" title="Chart of Account Applet" subtitle="Field-by-field reference for every form used in this guide" >}}
  {{< card link="/guides/accounting-guides/journal-entries" title="Journal Entries Guide" subtitle="Post opening balances and month-end adjustments" >}}
  {{< card link="/guides/accounting-guides/bank-reconciliation-guide" title="Bank Reconciliation Guide" subtitle="Match bank activity once you start posting" >}}
  {{< card link="/guides/accounting-guides/financial-reporting" title="Financial Reporting Guide" subtitle="Trial Balance, Profit and Loss, Balance Sheet" >}}
  {{< card link="/applets/finance/tax-config-applet" title="Tax Config Applet" subtitle="SST setup and input / output tax mapping" >}}
  {{< card link="/applets/master-data/organisation-applet" title="Organisation Applet" subtitle="The company and branch master that feeds Chart of Account" >}}
{{< /cards >}}
