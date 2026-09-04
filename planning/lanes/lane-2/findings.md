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

## Run 3 (2026-09-05) — Bank Reconciliation

### Cross-lane link requests (run 3)

- **Bank Reconciliation ↔ guide (Lane owning `guides/`)** — `content/en/guides/accounting-guides/bank-reconciliation-guide.md` needs four corrections from code: (a) Step 6 — the button is **Run Automatching**, the five buttons grey out and the flag is re-checked after 60 s and every 30 s; the "screen will tell you how many lines auto-matched" comes from the Summary / Matched / Open panel, not from the Run button. (b) Step 7 — possible matches are reviewed on the **Auto Matching** result screens (Matched/Unmatched Txn Lines, Matched/Unmatched Cash Stmt Lines → Reconcile / Add), not "beside each line" on the Manual Matching Reconcile grid; the Reconcile grid opens a per-line screen (Detail / Matched Bank Statement Lines / Unmatched Adjustment). (c) Step 8 — a **manual journal does not create a cashbook transaction line** (only FINAL vouchers, POS settlements and cash transfers do), so the RM 450 bank charge must be entered as a Payment Voucher (or cash transfer) on the cashbook, not "posted as an adjustment journal", before it can be matched. (d) Step 10 — the Status field offers **ACTIVE / CLOSE**; there is no "Reconciled" value, the initial value is "Processing", and CLOSE locks nothing (links can still be undone; the permission-error sentence is speculative — the form has no separate finalise permission). Also Step 1's "strict generic setting" is correct: with no configuration the auto-link rule is exact amount **and** payee similarity ≥ 0.85.
- **Bank Reconciliation ↔ cashbook-applet (Lane owning `master-data/`)** — the "Weightage Configuration" row (line 77) should say what it configures: four matching dimensions (amount, date, reference, payee) each with a checkbox and a weightage totalling ≤ 100, an auto-link threshold 70–100, and an optional match-one-to-one flag; only the ACTIVE configuration is read, by the Bank Reconciliation auto-matcher (`bl_fi_mst_cashbook_recon_config.config_json`). `bank-reconciliation-applet` is already in its `related_applets` — OK.
- **Bank Reconciliation ↔ internal-receipt-voucher-applet / internal-payment-voucher-applet (own lane, done pages)** — both should mention the reconciled-line guard: amount / transfer-detail edits on a FINAL document whose cashbook lines are linked in a bank reconciliation throw `CASH_DOCUMENT_RECONCILED_TXN_LINES_BLOCK_EDIT` ("Cashbook txn lines are bank-reconciled. Unreconcile them…"). Lane 2 will add this on its next pass over those pages (not done this run to keep the budget).
- **Bank Reconciliation ↔ pos-general-applet, organisation-applet (other lanes)** — add `bank-reconciliation-applet` to `related_applets` (POS settlements are a cashbook-line source; company `default_timezone` drives every date window in the applet).
- **Bank Reconciliation ↔ ledger-and-journal-applet (own lane)** — add a one-line note that manual journals against a bank GL code do not create cashbook transaction lines and therefore never appear in Bank Reconciliation. Lane 2 will add on next pass.

### Registry / naming mismatches (run 3)

- `bankReconApplet`: registry `name` is `"Bank Reconciliation "` **with a trailing space**. The page title is set to `Bank Reconciliation` (trimmed). If the parity check compares exact strings it will flag this; the registry value should be trimmed.
- Repo slug is `blg-applet-wavelet-bank-recon-applet` (not `…-bank-reconciliation-applet`); `applet_repo:` uses the real slug.

### Removed claims (old Bank Reconciliation page → not in code)

"Reconcile and Unreconcile actions should be restricted by role" (no permission gates them; the three seeded DELETE_BUTTON_* codes are read by nothing); "Application Settings … delete controls" (HIDE_DELETE_BUTTON is inert); the Key Concepts / Who Benefits / FAQ / Summary marketing sections. All 23 screenshots and the video were kept.

### Questions for Vincent (run 3)

7. **Bank names on the applet page.** The Import Format drop-down lists Malaysian bank names (the product's own parser labels). The rewritten page lists them verbatim as the supported statement formats, since a reader picking a format needs the exact label. CLAUDE.md's "do not name real banks" rule was written for the running example, not for product feature lists — please confirm this reading, or the list will be replaced by "22 formats covering the major Malaysian banks plus Default Format".
8. **Dead settings.** `HIDE_DELETE_BUTTON` and the four Department Settings toggles are rendered but read by nothing (repo issue #6 already reports "four hide/show toggles not working"); the three seeded client-side permission codes `DELETE_BUTTON_FOR_*` are read by nothing either. Should the page keep saying so (current), or should these be filed as product bugs and left out of the wiki?
9. **Auto-matcher date window.** The job considers cashbook lines from 90 days before the Opening Date to 90 days **after** the Closing Date, while the Reconcile grid is capped at the Closing Date — so an auto-link can be created for a line dated after the period. Intended (early-cleared items) or a bug? The page states the code behaviour.

### Notes (run 3)

- Bank Reconciliation: settings live in an **applet-local** `FieldConfigurationComponent` (as the run-2 note predicted for report-style applets). `applet-scan.sh` reported 0 shared-screen toggles and 66 "keys not on screen" — the model over-declares (dimension/tax/custom-status/PRINTABLE keys with no control) while 23 real toggles are rendered and read **without** a model declaration. Four-proof classification: 3 declared+rendered+persisted+consumed; 23 rendered+persisted+consumed only; 5 rendered+persisted only (inert); ~60 declared only.
- Bank Reconciliation: the client-side permission facts (3 seeded codes, none read; `SHOW_REFERENCEn_COLUMN` read, not seeded) come from a read-only `akaun_master.bl_applet_client_side_perm_dfn` query on 2026-09-05; the new standard forbids citing the database in `sources:`, so the citation is recorded here and in the ledger shard instead.
- Bank Reconciliation: the customer-specific CSV endpoint for Imported External Cashbook carries a customer name in its path; the page describes it only as "CSV import".
- Lifecycle proof block: this is not a document applet — the page states explicitly that there is no server document type, signum, journal, stock processor or VOID reversal, and lists the tables written/updated instead.
- Pace: Bank Reconciliation took the whole run (~90 min: 30k-line applet, 2,200-line auto-matching service, 5 screen families, 22 import formats). Stopped cleanly. **Next: the `rework` item `internal-purchase-invoice-applet.md`** now at the head of the queue (codex review) — not started this run.
- **PI rework (queue head) — prepared, not executed.** `planning/lanes/lane-2/pi-rework-settings.txt` holds the four-proof classification for Purchase Invoice (Internal): 171 keys pass all four proofs, 19 are rendered but read by nothing (`ENABLE_BRANCH_FILTER`, `HIDE_PRINT_BUTTON`, `HIDE_RELATED_DOCUMENTS`, `HIDE_DELIVERY_TRIPS`, all `EXPAND_*`), 73 are declared with no control on the shared screen (incl. the confirmed model-only `ENABLE_SST/WHT`, `INCLUDE_*`, `ENABLE_CUSTOM_STATUS_*`; see caveats in the file for keys that live on Default Selection / Knock Off instead). Remaining rework steps from the codex review: add `aliases:`; move the video under Related documentation; delete the tutorial block (page lines 161–180) and the `1000001` numbering/collision story (196, 469); add the posting proof block (server doc type `INTERNAL_PURCHASE_INVOICE`, amount −1, quantity +1, Dr Purchase / Input Tax, Cr Creditor; GL precedence line GL → header GL → item-company `PURCHASE` → company default, `JournalPostingService.java:139-190`; stock processor; VOID reversal) citing `InternalPurchaseInvoiceDataConsistencyObject.java:15-17,38-44`; convert `sources:` to the per-section map and drop the database citation; add Effect column to every settings table; reword the "re-post the journal" and "never finalise at 0.00" advice or drop it. Estimated one focused run.
