# Lane 2 findings

Folders: finance, crm, integrations, rma, human-resources

## Cross-lane link requests

- **Ledger And Journal ↔ master-data / sales pages**: add `ledger-and-journal-applet` to `related_applets` of chart-of-account-applet, organisation-applet, cashbook-applet, internal-sales-invoice-applet. Also `content/en/guides/accounting-guides/journal-entries.md` says (if it does) that Void creates a contra entry — in the applet the listing action is a soft delete of the manual journal; only document VOIDs create reversing journals.

- **Payment Voucher (Internal) ↔ purchase-workflow / master-data pages**: add `internal-payment-voucher-applet` to `related_applets` of internal-purchase-debit-note-applet, internal-purchase-credit-note-applet, supplier-applet-1, cashbook-applet, chart-of-account-applet, organisation-applet.

- **Receipt Voucher (Internal) ↔ sales-workflow / master-data pages**: add `internal-receipt-voucher-applet` to `related_applets` of internal-sales-invoice-applet, internal-sales-debit-note-applet, internal-sales-credit-note-applet, customer-maintenance-applet, cashbook-applet, chart-of-account-applet, organisation-applet.

- **Purchase Invoice (Internal) ↔ purchase-workflow pages** (Lane owning `purchase-workflow/`): add `internal-purchase-invoice-applet` to `related_applets` of internal-purchase-order-applet, internal-purchase-grn-applet, internal-purchase-requisition-applet, supplier-delivery-order-applet, internal-purchase-return-applet, internal-purchase-credit-note-applet, internal-purchase-debit-note-applet, internal-purchase-invoice-no-stock-in-applet, internal-purchase-invoice-supplier-access-applet.
- **Purchase Invoice (Internal) ↔ master-data / e-invoice pages**: add it to `related_applets` of supplier-applet-1, chart-of-account-applet, tax-configuration-applet, cashbook-applet, organisation-applet, my-e-invoice-portal-applet.
- **Stock-movement claim is inverted in several pages.** Code: Purchase Invoice (Internal) applet constants `quantity_signum = 1` (stock in); standard Purchase GRN (Internal) `quantity_signum = 0` (no stock); GRN Stock In = 1; Purchase Invoice No Stock In = 0. `content/en/applets/purchase-workflow/internal-purchase-grn-applet.md` ("automatic stock-in", "+95 laptops added to stock") and `content/en/guides/purchasing-guides/standard-procurement-workflow.md` should say the GRN records receipt and the invoice books stock, unless the tenant uses the GRN Stock In / Invoice No Stock In pair. (Sources: applet-constants.ts in each repo; GenericDocumentService.purchaseDocTypeSignumZero.)
- `content/en/modules-v2/purchasing/_index.md` lines 19 and 31 link "Purchase Invoice Applet" to `/applets/purchase-workflow/internal-purchase-invoice-no-stock-in-applet/`; should be `/applets/finance/internal-purchase-invoice-applet/`.
- Registry `documentation_url` for `internal-receipt-voucher-applet` is `/applets/internal-receipt-voucher-applet/` while the page lives under `finance/` — check the page has that alias (Lane 2 will add if missing).

## Registry / naming mismatches

- `internal-receipt-voucher-applet`: two repos exist — `blg-applet-wavelet-internal-receipt-voucher-applet` (stale, last commit 2025-11, its environment even points at another applet code) and `blg-applet-wavelet-internal-receipt-voucher-applet-v2` (active, 2026-08). The page cites v2. The wiki page title was "Receipt Voucher (Internal) Applet"; now the registry name "Receipt Voucher (Internal)".

- `internal_purchase_invoice_applet` appears twice in the registry: ACTIVE "Purchase Invoice (Internal)" (2021-12-22) and DELETED "Internal Purchase Invoice" (2021-12-20). Page uses the ACTIVE name. No action needed unless the parity check keys on code only.

## Undocumented applets encountered

- `internalReimbursementPaymentVoucherApplet` — "Reimbursement Payment Voucher Applet (Internal)", ACTIVE since 2025-04-24, repo `blg-applet-wavelet-internal-reimbursement-payment-voucher-applet`; no wiki page. Mentioned as a sibling on the Payment Voucher page without a link.

## Questions for Vincent

1. **Stock movement on the standard purchase pair.** Code says the standard Purchase GRN (Internal) applet posts lines with quantity signum 0 (no stock movement) and the Purchase Invoice (Internal) posts signum +1 (stock in); the GRN Stock In / Purchase Invoice No Stock In pair is the reverse. The old Purchase Invoice page, the GRN page and the standard-procurement guide all say the opposite. The PI page now states the code behaviour. Please confirm this is the intended product behaviour before the GRN page and guides (other lanes) are corrected.
2. **Reimbursement Payment Voucher Applet (Internal)** is ACTIVE in the registry with no wiki page. Should Lane 2 add it to its queue (finance folder)?
3. **Tax Configuration duplicates**: `content/en/applets/finance/tax-config-applet.md` and `content/en/applets/master-data/tax-configuration-applet.md` both exist with title "Tax Configuration Applet"; the registry `documentation_url` for `taxConfiguration` is `/applets/tax-config-applet/`. Which is canonical? (Lane 2 has the finance one in its queue; the pages should be merged with an alias rather than both enhanced.)
4. **Registry URL for `creditor_report_applet`** points at `/applets/debtor-and-creditor-report-applet/`, while `debtor_report_applet` points at its own page. Both the creditor report and the combined report pages are in Lane 2's queue — should the creditor page be merged into the combined one?

## Notes

- Run summary 2026-09-05: 4 pages completed (Purchase Invoice, Receipt Voucher, Payment Voucher, Ledger And Journal). Stopped after ~90 minutes of work so the next page (Financial Report) gets full care in the next run. content-lint passes.
- Method note for the next run: for wavelet-erp document applets the Application Settings screen is `blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html` (8,300 lines, gated by `appletCode`). The scratch script `extract_settings.py` (see this run's scratchpad) parses it against the applet's `applet-settings.model.ts` to list the visible switches; labels are translation fallbacks equal to the identifier.

- Ledger And Journal: the applet has exactly two Application Settings (`ALLOW_USER_TO_EDIT_AUTO_POSTED_JOURNAL`, `DISPLAY_JOURNAL_TRANSACTION_RUNNING_NUMBER`) and one client-side permission; it does not use the shared field-configuration screen. The old page's claim that Void "creates a contra-entry" was wrong for manual journals (JournalUow.delete is a soft delete).

- Purchase Invoice (Internal): the Application Settings screen is the shared `field-configuration` component in `blg-shared-utilities` (a git submodule, cloned separately under refs/). Labels for most switches are translation fallbacks equal to the identifier, so the wiki uses the identifiers with a plain-English "what it controls" column. The Knock Off Settings screen exists as a route but its menu entry is commented out.
- Purchase Invoice (Internal): VOID is hidden in the UI whenever the company's e-Invoice status is ENABLED (reducer `eInvoiceEnabled`), independent of permissions.

## Run 2 (2026-09-05) — Financial Report

### Cross-lane link requests (run 2)

- **Financial Report ↔ guides (Lane owning `guides/`)**: `content/en/guides/accounting-guides/financial-reporting.md` Step 2, Step 8 and the troubleshooting table tell the reader to click **Cost of Goods Sold**, then **General Ledger**, then **Retained Earnings** on the Month End Processing record's Processor tab. In the current applet the Processor tab has **one** button — *Month End Processing → PROCESS* — and the COGS / Retained Earnings buttons are commented out of the template (backend endpoints still exist). Step 2 also says MEP "posts three things: COGS, retained earnings roll-forward, closing/opening carry"; the code posts the closing-day (`CD`) and opening-day (`BD`) journals plus per-account summary rows only. Step 8's "clicking Regenerate on a Month-End Processing record does nothing" is inverted: PROCESS on the Processor tab *is* `regenerate-month-end-processing`. Also, the Profit Loss Report reads only `TXN` journals, so it does not "reconcile with what Month-End Processing posted" — its COGS is computed live from sales lines at the chosen Cost Type.
- **Financial Report ↔ modules (Lane owning `modules-v2/`)**: `content/en/modules-v2/financial-accounting/_index.md` lines 224–227, 287, 290, 466 attribute a **Cash Flow Statement**, **Row Definitions** and **report templates** to this applet. None exist in code; the applet has Trial Balance, Profit And Loss, Balance Sheet and MITRS tabs and an ad-hoc Profit Loss Report. (`content/en/user-guide/reports-analytics-v2/_index.md` links here too — check for the same claims.)
- **Financial Report ↔ chart-of-account-applet (Lane owning `master-data/`)**: add to the COA page (a) the **Report Section ↔ GL Category link** as the thing that decides whether a GL code appears in any statement (inner join — unlinked categories vanish from month-end too), (b) the fixed P&L section codes (`SalesRevenue`, `SalesExpenses`, `CostOfGoodsSold`, `CostOfGoodsSold-Gains`, `CostOfGoodsSold-Expenses`, `GeneralExpenses`, `OtherRevenues`, `OtherExpenses`, `TaxExpenses`, `Dividend`, `ProfitLoss`) and `RetainedEarnings`, (c) the company field **Inventory Closing Base On** (`MA_COST` default / `WA_COST` / `FIFO_COST` / `LIFO_COST` / `REPLACEMENT_COST` / `MANUAL_COST`), (d) the default GL codes the month-end processors need: `COGS`, `STOCK_BALANCE`, `PURCHASE`, `PURCHASE_RETURN`, `PROFIT_LOSS`, `RETAINED_EARNING`, and per-stock-type `COGS_RAW/WIP/FG/NSTI` with `STOCK_BALANCE_RAW/WIP/FG/NSTI`, and (e) `financial-report-applet` in `related_applets` if not already there. The COA page's "closing-stock toggles here decide which stock values appear" should be worded as the Month End Closing Stock record's *manual* flags.
- **Financial Report ↔ organisation-applet, stock-balance-applet, internal-sales-return-applet, internal-purchase-return-applet, internal-sales-invoice-applet** (other lanes): add `financial-report-applet` to their `related_applets` (they are dimension sources / COGS and Stock Flow inputs).
- Own-lane fix applied: `ledger-and-journal-applet.md` line 239 said month-end "adds depreciation, stock valuation, retained-earnings and reversal entries" — corrected to CD/BD journals (+ optional COGS / RETAINED_EARNINGS) and the monthly summaries. No depreciation processing exists in the Financial Report engine.

### Registry / naming mismatches (run 2)

- `FinancialReport`: registry `documentation_url` is `/applets/financial-report-applet/`; page is at `finance/financial-report-applet` with that alias — OK. Title changed from "Financial Report Applet" to registry name "Financial Report".
- `blg-applet-wavelet-month-end-processing-applet` (repo active, last merge 2026-08-13) has **no** ACTIVE registry row under any "month end" / "closing" name. Not documented; flagged as a question.
- `blg-applet-MITRS-applet` repo exists (its issues #24/#25 drove the MITRS tab in the Financial Report applet); no registry row matches "MITRS".

### Removed claims (old Financial Report page → not in code)

Drag-and-drop custom report builder; custom formulas / styling; Cash Flow Statement; GAAP/IFRS templates; "Excel (Analysis)" export with formulas; drill-down to scanned invoice images; `Settings > Access Rights` with Entity Access / Report Access / Field Level Security; "Unmapped Account Code shown under the financial statement" (unlinked categories are dropped by the inner join, not shown). The video, three screenshots and the accurate month-end / regenerate advice were kept.

### Questions for Vincent (run 2)

5. **Hidden COGS / Retained Earnings processors.** The Month End Processing Processor tab exposes only PROCESS (CD/BD + summaries). The COGS and Retained Earnings buttons are commented out but their endpoints work. Is this intentional (customers journal COGS through document posting) or a regression? The financial-reporting guide currently documents the three-button flow and needs a decision before it is corrected.
6. **Month End Processing applet repo** with no registry row — is it an unreleased split from Financial Report, or dead? If it is going live, its page belongs in Lane 2's finance folder.

### Notes (run 2)

- Financial Report: the applet does NOT use the shared `FieldConfigurationComponent`; its Field Settings screen is a local 8-toggle form whose values nothing reads. `applet-scan.sh` reported 4 toggles "on shared screen" because the model over-declares — ignore that for report applets; check the local `settings-container/field-configuration` first.
- Financial Report: repo issues are housekeeping only; functional history lives in commit subjects prefixed with customer support-repo refs (`blg-sd-<customer>#n`) — usable for Troubleshooting after dropping the prefix.
- Pace: Financial Report took the whole run (~90 min: 1,000-line backend service + 1,000-line UoW + 5 screen families). Stopped cleanly; next is `bank-reconciliation-applet.md`.
