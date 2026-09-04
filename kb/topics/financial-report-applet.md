---
topic: financial-report-applet
aliases: [financial report, month end processing, month-end closing, trial balance, profit and loss snapshot, balance sheet snapshot, profit loss report by branch, stock flow report, trace document, MITRS report]
applets: [FinancialReport, chartOfAccountApplet, LedgerAndJournal]
modules: [financial-accounting]
related: [chart-of-accounts, ledger-and-journal-applet, internal-sales-invoice-applet, internal-purchase-invoice-applet, stock-availability, cashbook, internal-receipt-voucher-applet, internal-payment-voucher-applet]
wiki:
  - content/en/applets/finance/financial-report-applet.md
  - content/en/guides/accounting-guides/financial-reporting.md
  - content/en/tutorials/month-end-closing.md
  - content/en/modules-v2/financial-accounting/_index.md
status: growing
updated: 2026-09-05
---

# Financial Report applet (month-end close and statements)

The Financial Report applet closes a month per Set of Books (Month End Processing), freezes Trial Balance / P&L / Balance Sheet / MITRS snapshots for a range of closed months (Financial Report), runs an ad-hoc P&L from posted journals grouped by branch or dimension (Profit Loss Report), and diagnoses posting gaps (Stock Flow Report, Trace Document).

## Facts

- 2026-09-05 — Registry: code `FinancialReport`, name "Financial Report", type TNT-USER, ACTIVE; documentation_url `/applets/financial-report-applet/` (page lives under `finance/` with that alias). [src:planning/private/registry-applets-2026-09-05.tsv]
- 2026-09-05 — Menu: Financial Report, Month End Processing, Profit Loss Report, Error Checking; a fifth route `mep` (MEP with CheckList / Trial Balance / P&L / Balance Sheet tabs) is routed but its menu entry is commented out. [src:blg-applet-wavelet-financial-report-applet/…/models/menu-items.ts] [src:…/app.routing.ts]
- 2026-09-05 — Month End Processing create (`POST financial-reports/create-month-end-processing`) runs immediately: per ledger of the Set of Books it deletes prior CD/BD journals and GL summary rows, reads the month's journal lines (excluding CD journals) grouped by sub-ledger + GL code with report section, posts a `CD` journal dated month-end (reverses every account; P&L lines described "POSTING TO PROFIT AND LOSS"), posts a `BD` journal dated first of next month re-opening balance-sheet accounts only, and writes `bl_fi_general_ledger_hdr` summary rows with debit/credit/bd/cd per GL code. Header saved with `txn_type = MONTH_END_PROCESSING`. [src:blg-akaun-platform-java/javasdk/…/FinancialReportService.java#createMonthEndProcessing,createJournalLedger,createGeneralLedger]
- 2026-09-05 — P&L section codes hard-coded in the engine: SalesRevenue, SalesExpenses, CostOfGoodsSold, CostOfGoodsSold-Gains, CostOfGoodsSold-Expenses, GeneralExpenses, OtherRevenues, OtherExpenses, TaxExpenses, Dividend, ProfitLoss. Balance Sheet retained-earnings line reads section `RetainedEarnings`. [src:FinancialReportService.java#pnlSections] [src:FinancialReportUow.java#getFinancialReportRetainedEarningsBD]
- 2026-09-05 — Financial Report snapshot (`POST financial-reports/create`) reads `bl_fi_general_ledger_hdr` rows (not journals) for the Set of Books' ledgers between start YYYYMM and end YYYYMM, plus end-month CD amounts and the RetainedEarnings BD amount; zero-net rows dropped; stored as `bl_fi_financial_report_fact_line`. REGENERATE deletes fact lines and re-reads. Therefore a snapshot over unprocessed months is empty. [src:FinancialReportUow.java#getFinancialReportGeneralLedger,getFinancialReportGeneralLedgerCD] [src:FinancialReportService.java#createFinancialReportWithGeneralLedger,regenerateFinancialReportWithGeneralLedger]
- 2026-09-05 — All report SQL inner-joins glcode → gl_category → `bl_fi_report_section_gl_category_link` → `bl_fi_report_section_hdr`; a category without a section link disappears from month-end and every statement. [src:FinancialReportUow.java#getMonthEndProcessing,getProfitLossReport]
- 2026-09-05 — Processor tab in the UI has ONE button ("Month End Processing" → PROCESS → `regenerate-month-end-processing/{guid}`). The "Cost Of Goods Sold" and "Retained Earnings" buttons are commented out of the template (since the 2025-11 repo split at least); endpoints `/create-cost-of-goods-sold` and `/create-retained-earnings` still exist. [src:…/month-end-processing-view-processors.component.html] [src:FinancialReportController.java]
- 2026-09-05 — COGS processor: COGS = opening stock + purchases + purchase returns (negative net) − closing stock; posts journal `txn_type = COGS` ("AUTO CREATED FROM COGS PROCESSING") against company default GL codes COGS / STOCK_BALANCE / PURCHASE / PURCHASE_RETURN, plus per-type COGS_RAW/WIP/FG/NSTI vs STOCK_BALANCE_* when a Month End Closing Stock record exists; closing stock valued from `bl_inv_txn_line` (PNS / RESET_MA, latest per item) by the company's `inventory_closing_base_on` (MA_COST default, WA, FIFO, LIFO, REPLACEMENT, MANUAL). [src:FinancialReportService.java#createCostOfGoodsSold,getClosingStock]
- 2026-09-05 — Retained-earnings processor: sums P&L-section lines for the period excluding CD/BD, posts `RETAINED_EARNINGS` journal Dr RETAINED_EARNING / Cr PROFIT_LOSS default GL codes (loss reverses). [src:FinancialReportService.java#createRetainedEarnings] [src:FinancialReportUow.java#getRetainedEarnings]
- 2026-09-05 — Profit Loss Report reads journal lines with `hdr.txn_type = 'TXN'` only (auto CD/BD/COGS/RE journals excluded), `date_txn >= from AND < to`, grouped by branch / GL dimension / segment / profit centre / project; the COGS row is computed live from INTERNAL_SALES_INVOICE / INTERNAL_SALES_CASHBILL / INTERNAL_SALES_RETURN lines using the chosen cost column (cogs=MA, cogs_wa, cogs_fifo, cogs_lifo, cogs_replacement, cogs_manual). Branch and company are filtered against `API_TNT_DM_ERP_FI_FINANCIAL_REPORT_READ` targets; an empty result after filtering returns not-authorised. [src:FinancialReportUow.java#getProfitLossReport,getCostOfGoodsSold] [src:FinancialReportInputDto.java] [src:FinancialReportService.java#targetPermissionProcessing] [src:FinancialReportController.java#getProfitLossReport]
- 2026-09-05 — Error Checking: Stock Flow Report rows Purchases, Purchase Returns, Sales, Sales Returns, Purchase Consignment, Reset MA; Inventory vs Accounting vs Difference; Difference listing statuses OK / MISSING_INVENTORY / MISSING_ACCOUNTING / WRONG_AMOUNT with CREATE = create journal or repost. Trace Document checks: Missing Journal, Wrong Journal, Missing Reversal Journal, Missing Cashbook, Missing Reversal Queue, Missing Shadow Document, each with Resolve; Repost when POSTED. Cashbook Discrepancy tab commented out. [src:…/stock-flow-report.component.ts] [src:…/error-checking-difference-listing.component.ts] [src:…/trace-document.component.ts] [src:…/error-checking-listing.component.html]
- 2026-09-05 — Settings: Default Selection = DEFAULT_BRANCH, DEFAULT_LOCATION, DEFAULT_TIMEZONE (listing uses the timezone). Field Settings = the applet's own 8 HIDE_* toggles (not the shared FieldConfigurationComponent); nothing in the applet reads them. Personalization: per-user Default Branch / Location. [src:…/default-settings.component.html] [src:…/field-configuration.component.html] [src:…/financial-report-listing.component.ts]
- 2026-09-05 — Permissions: backend family `API_TNT_DM_ERP_FI_FINANCIAL_REPORT_{OWNER,ADMIN,MEMBER,CREATE,UPDATE,DELETE,READ}`; no `bl_applet_client_side_perm_dfn` rows for applet FinancialReport. [src:AkaunTenantPermissionsV2.java] [src:akaun_master.bl_applet_client_side_perm_dfn]
- 2026-09-05 — MITRS tab restricts to GL categories with `bl_fi_mst_gl_category_list_hdr.mitrs_enabled = 'YES'` (`generate-mitrs-report/{guid}`). [src:FinancialReportService.java#generateFinancialReportWithMitrsGLCategory]
- 2026-09-05 — Validation on create: set_of_books, start_year, end_year, start_month, end_month must be non-null (`API_TNT_DM_ERP_FI_FINANCIAL_REPORT_HDR_OBJECT_*_IS_NULL`); date_start/date_end checks are commented out. Runtime errors: "Set of Books is missing primary ledger configuration.", "Ledger with guid … does not exist or has no permission.", "Set of Books guid cannot be empty or has no permission.", "Journal Line is empty.", "Company guid not exist". [src:FinancialReportDataConsistencyObject.java] [src:FinancialReportService.java]
- 2026-09-05 — Repo issues are only housekeeping (#1, #4, #6, #9 Angular 14 migration); functional history is in commit subjects referencing customer support repos (anonymised): P&L zero-amount fix 2026-08, capital sign fix on Balance Sheet 2026-08, Trace Document checks added Apr–Jul 2026, Stock Flow Report added Apr 2026, MITRS tab Apr 2026, REPORT button Jan 2026. [src:gh:bigledger/blg-applet-wavelet-financial-report-applet#9] [src:git log blg-applet-wavelet-financial-report-applet]

## How it connects

- **chart-of-accounts** — report sections and the section↔category link are the grouping key; Sets of Books and ledgers are the iteration unit; company default GL codes and `inventory_closing_base_on` drive the COGS processor; MITRS flag drives the MITRS tab.
- **ledger-and-journal-applet** — month-end writes CD/BD (and optionally COGS/RETAINED_EARNINGS) journals into the ledger; drill-down from a report line ends at the journal and generic document.
- **internal-sales-invoice-applet / internal-purchase-invoice-applet** — their generic-doc lines feed the live COGS row and the Stock Flow Report's inventory side; Trace Document verifies their journals, cashbook lines and shadow documents.
- **stock-availability** — closing stock valuation reads `bl_inv_txn_line` cost columns.
- **cashbook / receipt & payment vouchers** — Trace Document's Missing Cashbook check.

## Open questions

- Are the COGS and Retained Earnings processors intentionally hidden (are customers expected to journal COGS via document posting instead), or is this a regression from the repo split? Affects the financial-reporting guide, which tells readers to click three buttons.
- `blg-applet-wavelet-month-end-processing-applet` (active repo, 2026-08) has no ACTIVE registry row under any "month end" name — is it an unreleased split of this applet?
- `blg-applet-MITRS-applet` repo exists; no registry row matches "MITRS".

## Wiki impact

- `content/en/guides/accounting-guides/financial-reporting.md` — Step 2, Step 8 and the troubleshooting table describe three Processor buttons (COGS, General Ledger, Retained Earnings); the UI has one (PROCESS). Also says MEP "posts COGS + retained earnings + CD/BD"; it posts CD/BD + summaries only. "Regenerate on MEP does nothing" is wrong — PROCESS on the Processor tab *is* the regenerate.
- `content/en/modules-v2/financial-accounting/_index.md` — lists a Cash Flow Statement, "Row Definitions" and "report templates" for this applet; none exist in code.
- `content/en/applets/master-data/chart-of-account-applet.md` — should name the Report Section ↔ GL Category link, the fixed P&L section codes, `Inventory Closing Base On`, and the default GL codes COGS / STOCK_BALANCE / PURCHASE / PURCHASE_RETURN / PROFIT_LOSS / RETAINED_EARNING (+ COGS_* / STOCK_BALANCE_* per stock type) as what the Financial Report depends on.
