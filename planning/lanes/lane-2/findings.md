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

## Run 5 (2026-09-05) — Purchase Invoice (Internal) rework; Tax Configuration skipped

(Run 4 was killed by a rate limit while gathering evidence; nothing was written in run 4.)

### What changed on `content/en/applets/finance/internal-purchase-invoice-applet.md`

- Applied the codex review verbatim: `aliases: []` added; `## Video overview` H2 removed (video now under Related documentation); description names the operator; tutorial block ("Click +", "Record a payment", …) deleted and its screenshots kept under Screens and menus with factual captions; the `1000001` numbering/collision story removed (no source); `sources:` converted to the per-section map (configuration / fields / lifecycle / troubleshooting) listing only existing files plus issue ids — the database citation is gone (the permission-seed check is recorded in the ledger shard instead).
- **Configuration rebuilt on the four-proof classification** in `pi-rework-settings.txt`, with three corrections found while verifying the file's caveats: (a) `MANDATORY_REFERENCE` and the ten `MANDATORY_QUOTATION/ORDER/DELIVERY_ORDER/INVOICE/OTHERS` (+`_DATE`) keys **are** rendered for this applet — as `mat-checkbox` controls nested inside the PI-gated `HIDE_EXTERNAL_*` `<li>` blocks (shared template lines 1181-1265, 1898-1905) — and are consumed by `setControlValidator` in `main-details.component.ts`; they were wrongly in "declared only". (b) the fifteen `EXPAND_*` keys **are** consumed (`initializeExpandedPanels()` in `purchase-invoice-edit.component.ts`); the scan's "rendered, not consumed" verdict was wrong. (c) `PRINTABLE` is set by the Printable Format listing's Default Selection column (persisted by `printable-format.effects.ts`) and read by print / export / bulk print — four proofs via a different screen. Model-only keys (`ENABLE_SST`, `ENABLE_WHT`, `INCLUDE_*`, `ENABLE_CUSTOM_STATUS_*`, `ENABLE_DIMENSION`, …) are named once as "not documented". `HIDE_RELATED_DOCUMENTS` / `HIDE_DELIVERY_TRIPS` are called out as rendered-but-inert; `HIDE_PRINT_BUTTON` and `ENABLE_BRANCH_FILTER` turned out to be rendered only for other applet codes and were dropped.
- **Defaults** now cite the shared form's null-patch logic: `shouldHideSetting()` pre-selects 17 line-item columns as hidden for `internal_purchase_invoice_applet`; `HIDE_EXTERNAL_*`, `HIDE_QUOTATION…OTHERS`, `HIDE_DOCUMENT_LINKS`, `HIDE_ACCOUNT_*_CONTACT`, `ENABLE_EDITING_UNIT_PRICE_STD` default On; `DEFAULT_STATUS` defaults ALL. The page explains that a key never saved behaves as Off in the document form until the first Save of Application Settings persists the screen's values.
- **Posting proof block** added in the fixed form: `INTERNAL_PURCHASE_INVOICE`, amount −1, quantity +1 (`InternalPurchaseInvoiceDataConsistencyObject`:15-17, 38-44), Dr Purchase / Dr Input Tax, Cr Creditor (`JournalPostingService`:122-128, 257-263, 322-353), GL precedence **line GL → header GL → item-company `PURCHASE` link → company default** (`JournalPostingService`:139-190), stock processor `INVENTORY_TRANSACTION_LINE_PROCESSOR` + `StockBalanceHelper` last-purchase-cost update, VOID reversal set (`VoidJournalPostingProcessor` → `createJournalGenDocReversePosting`, `VoidInventoryTransactionLineProcessor`, `VoidKnockOffProcessor`, …).
- **Client confirm ≠ backend rejection**: the purchase-return VOID refusal is documented as an applet-side toast; the backend `update-posting-status` path has no downstream-link check (`checkIsGenDocConvertibletoVoid` is used only by the e-Invoice cancellation queue). Backend throws cited for FINAL: already-FINAL (403), `FISCAL_PERIOD_LOCKED`, serial-number errors, `MISSING_DEFAULT_GL_CODE`, `MISSING_CASHBOOK` / `MISSING_GL_CODE: STL_MTHD`.
- **Removed wrong permission claims**: `EDIT_CURRENCY_RATE` (does not override `CANNOT_EDIT_CURRENCY_RATE`), `DISABLE_EMPLOYEE_LOGIN_AUTO_DETECTION`, `SHOW_DISABLE_EDITING_AMOUNT_TXN_SETTING`, `IPI_HIDE_TRACKING_ID_AND_PERMIT_NO`, `SHOW_REFERENCE`, `SHOW_REMARKS`, `SHOW_CURRENCY` — seeded in the registry but read by no code in the applet or `blg-shared-utilities`. The page lists them as "granting them has no effect".
- Troubleshooting: "re-post the journal (support task)" now says the backend has `createJournalGenDocRePosting` and the applet does not expose it; "never finalise at 0.00" replaced by the code-grounded options (void and re-key where permitted, or Purchase Debit Note); added `FISCAL_PERIOD_LOCKED`, already-FINAL, `MISSING_CASHBOOK`, and "price columns missing for everyone" (persisted hidden defaults).
- Kept: all 13 screenshots, the video, the Where-it-fits table, the tabs and buttons tables, Branch Settings / Printable Format sections, the Fields tables.

### Cross-lane link requests (run 5)

- **Purchase Debit Note (Internal)** (`content/en/applets/purchase-workflow/internal-purchase-debit-note-applet.md`, Lifecycle): "A FINAL document that other documents link from … is not convertible to VOID (`checkIsGenDocConvertibletoVoid`)" — per `GenericDocumentService` that guard is called only from `MyEInvoiceGenDocToIrbCancellationQueueService`, not from the applet's VOID request. Please re-verify on that page.
- **Purchase GRN (Internal) / standard-procurement guide** — unchanged request from run 1 (GRN quantity signum 0, invoice +1); the rewritten PI page states it with the DCO citations, awaiting Vincent's answer to question 1.
- Closed: `content/en/modules-v2/purchasing/_index.md` already links the Purchase Invoice to `/applets/finance/internal-purchase-invoice-applet/` (verified 2026-09-05).

### Registry / naming mismatches (run 5)

- `taxConfiguration` ("Tax Configuration", ACTIVE, `documentation_url` `/applets/tax-config-applet/`): the finance page `tax-config-applet.md` carries that alias, the master-data page `tax-configuration-applet.md` has the same title. **Skipped** (F-0040) — not enhanced until Vincent decides which is canonical.

### Notes (run 5)

- Method: for the shared `FieldConfigurationComponent`, the scan's "declared only" bucket must be re-checked for **nested controls** — `mat-checkbox`es inside a gated `<li>` (the `MANDATORY_*` pattern) inherit the gate of the enclosing block, and the scan's nearest-`*ngIf` heuristic misses them. Walk up to the enclosing `<li|ul|div *ngIf="…appletCode…">` instead.
- Method: `EXPAND_*` keys are consumed through `panel.expandSetting` indirection (`this.appletSettings[panel.expandSetting]`), so a plain grep for the key name in `.ts` finds nothing — grep for `expandSetting` too. Other document applets built from the same edit-component pattern will show the same false negative.
- Method: settings defaults for the shared screen are per-applet (`shouldHideSetting()` list of 21 applet codes) — for the applets in that list a fresh tenant's first Save hides most line-item price/discount/tax columns. Worth a one-line warning on every page in the family.
- Pace: the rework took the full run (~90 min). Next: `content/en/applets/integrations/90-ecomsync-related-applets.md`.

## Run 6 (2026-09-05) — EcomSync Related Applets (restructured as an index page)

### What changed on `content/en/applets/integrations/90-ecomsync-related-applets.md`

- The page was an 11-line stub of Confluence how-to titles with no links. It has **no single registry row**: it describes a capability that spans Organisation (marketplace branch), Doc Item Maintenance (listings, Ecomsync Management, Scheduler) and Sales Order (Internal) (orders, dashboards, bulk status update), plus the backend job set. Per the run-6 instruction it was **restructured as an index page**, not forced into the single-applet standard: Overview · Where it fits (7 applets, all linked) · Marketplaces supported (per-marketplace matrix of which processors exist) · Setup order (the stub's eleven how-tos as 14 numbered steps, each pointing at the owning applet and the backend columns it writes) · Background jobs (every processor class in `jobProcessor/custom/ecomSync`, `jobProcessor/ecomsync`, `controller/tenant/custom/ecomSync`) · Troubleshooting (code-grounded: the two bulk-update toasts, "Please select the branch", TEMP orders, TikTok/Shopify not schedulable from the UI) · Related documentation.
- Front matter: no `applet_code` / `applet_repo` (none exists); `modules`, `related_applets`, `guides` and a per-section `sources:` map added (keys `where-it-fits`, `data-model`, `background-jobs`, `troubleshooting` — not the standard's `configuration/fields/lifecycle` keys, because the page has no such sections). **Alias `/applets/90-ecomsync-related-applets/` added** — `content/en/applets/_index.md:115` and `applet-catalog.md:344` (and the zh copies) link that URL, which did not resolve because the page lives under `integrations/` and had no alias.
- Deep anchors were deliberately not used (the stale `public/` build carries no heading ids to verify against); links go to page tops with the tab/screen named in text.

### Registry / naming mismatches (run 6)

- `ecomSyncApplet` "Ecom Sync" (TNT-APPLET, ACTIVE, 2021-12-06) and `ecomSyncOrganisationApplet` "Ecom Sync Organisation" (ROOT-USER, ACTIVE, 2025-09-26): **neither code appears in any cloned repo** (bounded grep over refs/ *.ts/*.json/*.java/*.html excluding node_modules/dist/target — zero hits). The org repo `wavelet-Ecomsync` exists on GitHub but has no commits; the only other marketplace repo is customer-named (excluded). Not documented as applet pages; the index page says "no separate EcomSync user interface exists in the current source code".
- `shopee_sales_order_applet` is ACTIVE under the **name "Tiktok Sales Order Applet"** (code says Shopee, name and `app.component.ts` say Tiktok; the repo counts 657 "SHOPEE" strings vs 2 "Tiktok"). Repo `blg-applet-wavelet-shopee-sales-order-applet` is a trimmed Sales Order (Internal) build split from the monorepo on 2025-11-01. No wiki page; not in the exclusion list. Mentioned on the index page without a link.
- The page keeps its non-registry title "EcomSync Related Applets" (index page). The audit's "no registry match" entry for it is expected and should be treated as an index, not a phantom — please allowlist it in the parity check.

### Cross-lane link requests (run 6)

- **modules-v2/ecommerce/related-applets (Lane owning `modules-v2/`)**: add a card or bullet for `/applets/integrations/90-ecomsync-related-applets/` (marketplace synchronisation index); its Doc Item / Pricebook / Sales Order bullets do not mention the marketplace angle.
- **organisation-applet (Lane owning `master-data/`)**: add `90-ecomsync-related-applets` (and `internal-sales-order-applet`, `stock-availability-applet`) to `related_applets`; the Marketplace → Stock Configuration row could name the columns it writes (`mode_config`, `sales_order_config`, `buffer_config`, `qty_buffer`, `percentage`, `stock_mode`, `override_item_stock_config` on `bl_fi_mst_ecomsync_branch`). The page's Marketplace Type list names a customer-specific option verbatim — consider generalising it.
- **doc-item-maintenance-applet (Lane owning `master-data/`)**: add `90-ecomsync-related-applets` to `related_applets`; the Scheduler section says "e.g." — the screen offers exactly the twelve Lazada/Shopee codes listed on the index page (`scheduler-create.component.ts`), and the Ecomsync Management gear item could say what it does (four branch-scoped pulls: Lazada category tree / brands, Shopee category tree / logistics).
- **internal-sales-order-applet (Lane owning `sales-workflow/`)**: add `90-ecomsync-related-applets` to `related_applets`; the Bulk Update listing (route from `internal-sales-order-pages.service.ts`, view column 21) and its three modes are not on the page yet — the "Update marketplace order status" step lives there.
- **stock-availability-applet (Lane owning `inventory-workflow/`)**: add `90-ecomsync-related-applets`; the `mkp_seller_*` quantities and `StockAvailabilityProcessor` are the marketplace side of that applet.
- **Own lane, next pass**: `internal-receipt-voucher-applet.md` — one line that the Shopee payout, TikTok settlement and Lazada receipt processors create receipt vouchers on the marketplace branch, plus the index page in Related applets.

### Undocumented applets encountered (run 6)

- `shopee_sales_order_applet` "Tiktok Sales Order Applet" — ACTIVE, has a repo, no page (see above). If it is a generic product (not customer-specific), it belongs in `sales-workflow/` (another lane) as a short page pointing at Sales Order (Internal).

### Questions for Vincent (run 6)

10. **"Ecom Sync" / "Ecom Sync Organisation" registry rows.** Both are ACTIVE with no code in any cloned repo and an empty `wavelet-Ecomsync` repo. Are they live products with a UI hosted elsewhere (then Lane 2 needs the repo), or leftovers to mark DELETED / add to the exclusion list? The index page currently states that no separate EcomSync UI exists in the source code.
11. **"Tiktok Sales Order Applet"** (`shopee_sales_order_applet`): generic product or customer-specific? Decides whether it gets a page and which lane.
12. **Index pages vs the applet standard.** This page is the first index/hub page in an applets folder. Should the parity check allowlist a `page_type: index` front-matter key (not added — not in the standard), or should hub pages move out of `content/en/applets/`?

### Notes (run 6)

- Method: for a "related applets" hub, the useful code evidence is the backend **table columns** (`client-sdk/.../dal/table/financial/bl_fi_mst_ecomsync_*.java`) and the **processor class list** — they give a complete, invention-free map of what each applet writes and what runs unattended, without needing a settings component.
- Method: `find refs -iname "*ecom*"` misses the marketplace code — it lives under the *owning* applets' repos and the backend's `domain/tenant/{lazada,shopee,tiktok,shopify,magento,selluseller}` packages. Grep the backend first when a registry row has no obvious repo.
- The built `public/` directory is stale relative to the rewritten applet pages (no heading ids, older content) — do not use it to verify anchors; verify link *targets* only.
- Pace: the hub took roughly one focused hour (survey of 3 applet repos + backend). content-lint passes. **Next: `content/en/applets/finance/accounts-receivable-applet.md`** — note it is on the audit's "no registry match" list; resolve the registry row first (likely a debtor/AR report or the Ledger side) before enhancing.

### Registry / naming mismatches (run 6, queue triage)

Resolved the registry rows for the next pages in the queue before starting them; four have no row and were marked **skipped** in state.json (not enhanced, per ADR-0002):

- `finance/accounts-receivable-applet.md` "Accounts Receivable Applet" — no row under receivable / debtor / AR; the AR-side applets in the registry are `debtor_report_applet`, `debtor-and-creditor-report-applet` and `creditor_report_applet`, each with its own queue page. 53-line TODO placeholder. Inbound links from `modules/financial-accounting/_index.md`, `modules-v2/financial-accounting/_index.md`, `user-guide/industry-solutions/professional-services.md` will need re-pointing if the page is removed.
- `human-resources/admin-time-attendance-applet.md` "Admin Time & Attendance Applet" — no row under attendance / time / roster / HR (the only HR row is `employeeApplet` "Employee Maintenance"). 165-line work-in-progress stub. Inbound links from five `modules-v2/hr-payroll/*` pages.
- `crm/ai-customer-analytics-applet.md` "AI Customer Analytics Applet" — no row under analytics / insight / AI / customer. 53-line TODO placeholder. Inbound link from `modules-v2/crm-digital/reports/_index.md`.
- `finance/budget-applet.md` "Budget Applet" (1,495 lines) vs `finance/budgetary-applet.md` "Budgetary Applet" (10-line placeholder): the registry row is `budgetaryApplet` "Budgetary Applet" (TNT-ADMIN, ACTIVE) and its `documentation_url` is `/applets/finance/budgetary-applet/`. Skipped `budget-applet.md`; `budgetary-applet.md` stays at the head of the queue and should absorb the Budget page's content under the registry name with `/applets/finance/budget-applet/` as an alias — pending question 13.

### Questions for Vincent (run 6, continued)

13. **Budget vs Budgetary.** May Lane 2 rewrite `budgetary-applet.md` under the registry name "Budgetary Applet", fold in whatever of `budget-applet.md` survives the code check, add the alias, and delete `budget-applet.md`? (Deletion is outside the "edit only" rule, so it needs your go-ahead; otherwise the phantom stays and the modules pages keep linking it.)
14. **Three placeholder pages with no registry row** (Accounts Receivable, Admin Time & Attendance, AI Customer Analytics): delete, or keep as stubs? None has code to derive from; the modules-v2 pages that link them describe features that do not exist as applets.

### Notes (run 6, continued)

- Triage first, then write: resolving the registry row for the *next five* queue pages took five minutes and removed four dead pages from the queue. Worth doing at the start of every run.
- **Next: `content/en/applets/finance/budgetary-applet.md`** (registry `budgetaryApplet`), using `budget-applet.md` only as a list of claims to verify against the repo — expect one full run.
- Repo for the next page: `refs/blg-applet-wavelet-budgetary-applet` (confirmed present 2026-09-05).

## Run 7 — 2026-09-05 — `finance/budgetary-applet.md` (registry `budgetaryApplet` "Budgetary Applet")

Rewritten from the 10-line placeholder under the registry name. `budget-applet.md` was **not** deleted and no alias was added — both await F-0079. Repo `blg-applet-wavelet-budgetary-applet` at `2bd6097` (2026-07-22), backend `871dbf5c96`, shared-utilities `af523eb`. content-lint passes.

### What would be carried over from `budget-applet.md` (for F-0079)

Almost nothing survives the code check; the page is a narrative written before the applet existed in its current shape.

- **Keep (already re-expressed in the new page):** the who / what / how framing (profit centre → votebook → item → category → register); the fact that categories are up to eleven slots bound to category groups in Field Settings; the description of Virement vs Adjustment; the Budget Report vs Txn Line Report split; the July-2026 bug list; the five screenshots it references (see the screenshot section below — only two of them are usable).
- **Drop (contradicted by code):** "Allocating Initial Budget Amounts — enter the annual amount once and the system distributes it equally across periods, with manual per-period override" (no such screen: the votebook *Budget* tab is commented out, nothing creates an `OPENING` transaction, the initial allocation is an Adjust In per register); "the system checks the register and validates sufficient balance" / "Cannot finalize virement — insufficient source register balance" (no balance check on client or server; the sub-line editor only colours the cell); "Approval Workflows: define approval routing rules" and "Validation Rules: set budget tolerance thresholds" under Field Settings (the screen has category-group slots and a `Mandatory` flag that nothing reads); "Mandatory fields — mark which category groups are required" (flag stored, never enforced); "Category Groups: enable up to 10 category levels" (eleven slots, 0–10); "Amount Reserved" as a live figure (never written); quarterly fiscal structures (periods are always monthly); the "Security & Access Control — user roles" section (no client-side permission definitions exist); the *Integration → External Systems* and *Best Practices* sections (marketing, no code basis).
- **Redirect:** the page links `/modules/budgetary/#budget-virement-management`, `#budget-reports`, `#budget-utilization-and-validation`, `#troubleshooting` — the module page carries the same "validated at line level / blocks overspend" claims and needs the same correction.
- **Broken asset:** it references `/images/budgetary-module/budgetary-module-01.png`, which does not exist in `static/`.
- **Inbound links to re-point when it goes:** `modules-v2/financial-accounting/_index.md` (line 129, also says "Vote Book Applet … blocks overspend before a PV is approved") and `user-guide/industry-solutions/professional-services.md` (line 83, "overspend blocking"). Both should point at `/applets/finance/budgetary-applet/` and drop the blocking claim.

### Screenshots with personal data (`static/images/budgetary-module/`)

Opened all twelve images. Offenders — **not referenced** by the new page:

- `budgetary-module-06.png` — Category Group Edit: *Created By* / *Modified By* show two staff e-mail addresses.
- `budgetary-module-11.png` — Edit Item: *Created By* / *Modified By* show two staff e-mail addresses.
- `budgetary-module-04.png` — Edit Item → Votebook tab + Add Votebooks: votebook names are staff first names (three of them).
- `figure-1-1.png` — Edit Item → Votebook tab: same votebook names.

Borderline, kept: `budgetary-module-03.png`, `-05.png`, `-07.png`, `-08.png` show test category groups named after university faculties in Malay (no company, person or branch name; tenant shown as "TESTING"). Only `-05` and `-08` are embedded. Clean and embedded: `-02.png`, `-10.png`. Clean, not embedded: `-09.png`, `budget-workflow.png` (diagram; its "Budget validated at line or header level" label overstates — the code only warns). `budgetary-module-01.png` is referenced by the old page but missing.

Recommendation: delete `-04`, `-06`, `-11` and `figure-1-1` from `static/` (none is referenced by any page after this rewrite) — outside my edit scope, so left in place.

### Inversions / false claims found in existing wiki text (for the guides and module pages)

1. **"BigLedger blocks overspend" is false everywhere it appears** (`modules/budgetary.md`, `modules-v2/financial-accounting/_index.md` lines 15/32/130, `user-guide/industry-solutions/professional-services.md` lines 73/83, old `budget-applet.md`). Code: no validator on virement amount, `GenericDocumentBudgetSubLineDataConsistencyObject` checks keys/nulls only, the shared sub-line editor colours the cell and shows a tooltip. Registers can go negative.
2. **Purchase orders do not commit budget.** `FiGenDocBudgetRegisterTxnLineProcessor` filters to `INTERNAL_SALES_INVOICE` and `INTERNAL_PURCHASE_INVOICE`; the PO applet shows the budget fields but nothing is written. Any "commitment register" wording for POs is wrong.
3. **Initial allocation** is an Adjust In on a zero register, not an "initial amount distributed across periods". `OPENING` is handled by the register-update job but never produced.
4. **VOID reverses nothing** (only FINAL queues the processor), and there is no VOID button in the applet.

### Cross-lane link requests

- **internal-purchase-invoice-applet (own lane, done in run 5)** — add `budgetary-applet` to `related_applets`; document `SHOW_BUDGET` (Budget Votebook / Fiscal Period / Item / Register on the line, *Budget Sub Line* tab with amount or percentage split) and the FINAL effect (`FI_GEN_DOC_BUDGET_REGISTER_TRANSACTION_LINE_PROCESSOR` → register `actual_used_amt`, header `posting_budget = POSTED`, no balance check). Next pass of my lane.
- **internal-sales-invoice-applet (lane owning `sales-workflow/`)** — same two additions as above for the sales side.
- **internal-purchase-order-applet (lane owning `purchase-workflow/`)** — add `budgetary-applet` to `related_applets`; state that the budget fields shown under `SHOW_BUDGET` are informational: the backend processor skips `INTERNAL_PURCHASE_ORDER`, so no register moves.
- **developer-sysadmin-applet (own lane, in queue)** — when written, name the three budget processors (`BUDGET_GEN_DOC_PRIMARY_PROCESSOR` → `BUDGET_GEN_DOC_TRANSACTION_LINE_PROCESSOR` → `BUDGET_TXN_LINE_UPDATE_REGISTER_PROCESSOR`, plus `FI_GEN_DOC_BUDGET_REGISTER_TRANSACTION_LINE_PROCESSOR` and `BUDGET_FISCAL_YEAR_REGISTER_PROCESSOR`) as subscriptions configured through applet-trigger templates/configuration (`JobProcessorService.getSubscriberJobProcessors`); no seed exists in the backend repo.
- **organisation-applet (lane owning `master-data/`)** — add `budgetary-applet` to `related_applets` only if that page owns profit centres; the Organisation v3 applet repo has no profit-centre screen (question 16 below).

### Registry / naming mismatches (queue triage, run 7)

- `finance/vote-book-applet.md` — **no registry row** contains "vote" (checked `registry-applets-2026-09-05.tsv`, case-insensitive). The "Vote Book" that `modules-v2/financial-accounting` and `professional-services` describe is the Budgetary Applet's votebook. Expect to skip it (ADR-0002) and to fold its inbound links into `budgetary-applet.md` — flagging now so F-0079 can cover it in the same decision.
- Next queue pages (`creditor-report-applet`, `debtor-and-creditor-report-applet`, `debtor-report-applet`) have rows (`creditor_report_applet`, `debtor-and-creditor-report-applet`, `debtor_report_applet`) per the run-6 triage.

### Questions for Vincent (run 7)

15. **F-0079 follow-through.** The new `budgetary-applet.md` is live-ready. May I (a) add `aliases: [/applets/finance/budget-applet/]`, (b) delete `budget-applet.md`, (c) re-point the two inbound links, and (d) delete the four screenshots with staff e-mails/names from `static/images/budgetary-module/`? (b)–(d) are outside my edit scope.
16. **Who owns profit centres?** This applet creates `bl_fi_mst_profit_center` rows (Profit Center menu) and the permission resolver targets them; the Organisation v3 applet repo has no profit-centre screen. Which page should be the reference for profit centres — this one, or a master-data page?
17. **Vote Book Applet page** (`finance/vote-book-applet.md`): no registry row; the concept is the Budgetary Applet's votebook. Delete/redirect to `budgetary-applet.md`?
18. **Backend-only budget features.** `bl_fi_budget_register_approval_*` (approval header/request/sequence/setting, e-mail notifications) and `BudgetReservationHdr` / `reserved_amt` exist in the backend but no applet UI references them. Roadmap, dead code, or driven by another (customer-specific) applet? The page currently says `reserved_amt` is never written and omits approvals.

### Notes (run 7)

- Method: for an applet with its own `settings-container`, the four proofs collapse quickly — grep `selectMasterSettings` (consumers) and `saveMasterSettingsInit` (persist) in the applet, then intersect with the one field-configuration template. The other three "settings" screens here (Default Selection ×2, General Settings) fail the persist or consume proof and were documented as such rather than as settings.
- Method: for register/ledger-style applets with no journal, the "posting proof block" still works — fill amount signum from the txn-line mapper, the Dr/Cr and GL rows with "none", and put the register-update arithmetic in its own row. The processor's `txn_type` switch (`OPENING` / `VIREMENT|ADJUSTMENT|TRANSFER` / else) is the whole lifecycle.
- Method: the `AG_GRID` report column list is the fastest way to see what a report actually reads (`report-listing.component.ts` — both "Initial" and "Latest" bound to `latest_allocated_amt` was found this way).
- Pace: one large master-data + document applet in roughly 80 minutes including the backend job chain and twelve screenshots. **Next: `content/en/applets/finance/creditor-report-applet.md`** (registry `creditor_report_applet`); it and the two debtor reports are read-only report applets and should go faster — check whether they share one repo before starting.

## Run 8 — 2026-09-05 — `finance/creditor-report-applet.md` (registry `creditor_report_applet` "Creditor Report Applet")

Rewritten to the standard from `blg-applet-wavelet-creditor-report-applet-V2` (main `8992c124`, 2026-08-24), backend `871dbf5c96`, shared-utilities `af523eb`. content-lint passes. Existing intro prose and the YouTube walkthrough kept; the Glossary, FAQ, "Who benefits", "What problems" and role quick-starts were dropped (user-guide voice, no code basis) — the accurate parts were folded into Screens, Fields and Troubleshooting.

### F-0042 resolution (registry doc URL vs separate page)

The three report applets are **three distinct products**, each with its own ACTIVE registry row and its own repo, not aliases of one another:

| Registry code | Name | Repo (live) | Menu |
|---|---|---|---|
| `creditor_report_applet` | Creditor Report Applet | `blg-applet-wavelet-creditor-report-applet-V2` (76 commits, last 2026-08-24) | 8 AP reports |
| `debtor_report_applet` | Debtor Report Applet | `blg-applet-wavelet-debtor-report-applet-V2` (157 commits, last 2026-09-02) | 7 AR reports incl. Collection Invoice with Aging |
| `debtor-and-creditor-report-applet` | Debtor and Creditor Report | `blg-applet-wavelet-debtor-and-creditor-report-applet` (25 commits, last 2026-08-26) | 15 reports (both sides, incl. Historical for each) |

So neither page should be marked skipped/merged; each is documented once under its registry name. What is wrong is only the **registry row**: `creditor_report_applet.documentation_url` = `https://wiki.bigledger.com/applets/debtor-and-creditor-report-applet/` should be `https://wiki.bigledger.com/applets/finance/creditor-report-applet/` (the page's alias `/applets/creditor-report-applet/` also resolves). That is a DB change in akaun_master — Vincent's decision (question 19 below).

Note also: the un-suffixed repos `blg-applet-wavelet-creditor-report-applet` and `blg-applet-wavelet-debtor-report-applet` are the frozen 2025-11-02 monorepo splits (2–3 commits, `appletCode` still `internalPackingOrderApplet` in `environment.ts`). Always use the `-V2` repos; the combined applet has no V2.

### Screenshots with personal data (`static/images/creditor-report-applet/`)

Opened all six images. The five real screenshots all show identifiable names in the grid and are **not referenced** by the new page:

static/images/creditor-report-applet/aging-report.png
static/images/creditor-report-applet/outstanding-document-report.png
static/images/creditor-report-applet/statement-of-account.png
static/images/creditor-report-applet/historical-transaction-aging.png
static/images/creditor-report-applet/purchase-invoice-with-settlement-details.png

- `aging-report.png` — a Company column value is a real retail customer's company name (also on the exclusion list).
- `outstanding-document-report.png` — Entity Name column shows two real company/brand names; Company column shows a customer's abbreviation.
- `statement-of-account.png` — Entity Name column shows a person's name.
- `historical-transaction-aging.png` — branch, company and entity names are staff first names ("… Branch Test", "… Company Test", "… Customer", "… SUPPLIER") plus a real company code.
- `purchase-invoice-with-settlement-details.png` — Entity Name column shows two staff first names.

`creditor-report-applet-overview.png` (5.4 MB, NotebookLM infographic) has no data but is marketing copy ("Replaces manual spreadsheets…", "Enhanced data integrity"); not embedded — the page has no images now. Recommendation: retake the five screens on the staging tenant with synthetic suppliers (GadgetSphere-style codes) and delete the infographic; outside my edit scope.

### Inversions / false claims found in the old page (carry to the debtor pages, which share the text)

1. **"Printable formats affect how PDF exports look when you click PRINT or Export to PDF from any report"** (debtor page, and implied on the creditor page) — false. The applet's Printable Format Settings only accept `STATEMENT_OF_ACCOUNT_TRANSACTION` / `STATEMENT_OF_ACCOUNT_AGING` templates and only drive the two SOA tabs' *Export to PDF* / *Preview*. The document **PRINT** button uses the document type's own templates; grid exports use AG Grid.
2. **"Aging Period Settings — e.g. 30/60/90/120+ days, or month-based ranges"** — half true: DAY periods are ranges; MONTH periods are just a number of months. And ticking a period **overwrites `AGING_PERIOD_TYPE`** (shared listing L360–L365), which the old page never says.
3. **"Personal Default Selection overrides the applet-wide defaults for that user"** — false in this applet: the screen never loads or saves (`personal-default-settings.component.ts`: subscription commented out, SAVE emits to nobody).
4. **"Aging Period Type: Month (default)"** — the control is empty by default; month behaviour is the fallback of `settings?.AGING_PERIOD_TYPE === 'DAY'`. Same outcome, different mechanism — the DAY type without a DAY period gives **no bucket columns**, which the old page could not explain.
5. The old page called the applet read-only ("Drill-down capability" etc.) and never mentioned **Contra** — the applet creates `bl_fi_generic_doc_arap_contra` rows from the Contra tab, with no server-side over-contra check (`GenericDocumentArapContraDco` validates nulls/existence only).
6. **Statement of Account listing and Historical Creditor Report are served by *debtor*-named backend permissions** (`API_TNT_DM_ERP_ENTITY_AR_AP_REPORT_DEBTOR_OUTSTANDING_ENTITY_READ`, `API_TNT_DM_ERP_ENTITY_AR_AP_HISTORICAL_DEBTOR_READ`). An AP-only role built from `CREDITOR_*` permissions gets 403 on those two menus. The applet's start-up permission inquiry asks for the first but not the second.
7. The combined-applet page states "does **not** expose an As of Date filter" and "no separate Debtor/Creditor aging menus" — the current combined repo has 15 menu items including Debtor/Creditor Historical Transaction Aging Analysis (As Of Date) and separate aging reports. That page needs a full rewrite from its repo (next in queue).

### Cross-lane link requests

- **internal-payment-voucher-applet (own lane, done in run 1)** — add one sentence that contras can also be created from the Creditor Report Applet (Contra tab of View Outstanding Document → `gen-doc/arap-contras/multi/backoffice-ep`) and that those contras change the balances the PV settlement picker shows. Next pass of my lane.
- **internal-purchase-invoice-no-stock-in-applet, internal-purchase-grn-stock-in-applet, internal-purchase-debit-note-applet, internal-purchase-credit-note-applet, internal-purchase-return-applet (lane owning `purchase-workflow/`)** — add `creditor-report-applet` to `related_applets` where missing (debit/credit note, return and purchase-report already have it); state that only FINAL documents appear in the creditor reports and that a GRN stock-in converted to a purchase invoice shows twice unless `INTERNAL_PURCHASE_GRN_STOCK_IN` is excluded in the Creditor Report's Field Settings.
- **entity-applet (lane owning `master-data/`)** — add `creditor-report-applet` / `debtor-report-applet` to `related_applets`; the AR/AP type (`default_arap_type` on the entity and on `bl_fi_mst_comp_branch_location_entity_link`) decides whether an entity appears in the creditor (`AP_*`) or debtor (`AR_*`) reports — worth one sentence on the entity page.
- **financial-report-applet (own lane, done run 1)** — already links both report pages; add the reconciliation note (document balances vs GL) when next touched.
- **debtor-report-applet (own lane, next)** — fix its link `/applets/creditor-report-applet/` → `/applets/finance/creditor-report-applet/`; apply corrections 1–4 above.

### Undocumented / registry notes

- The `historical-ageing` snapshot (`bl_fi_generic_doc_historical_ageing`, `GenericDocumentHistoricalAgeingController` + `…QueueController`) has no wiki page; both historical reports in the three report applets depend on it. Candidate for a short backend-concept page or a section in Developer SysAdmin (job queue).
- Client-side permission definitions: **0 rows** for all three report applets (`bl_applet_client_side_perm_dfn`, 2026-09-05) — consistent with F-0044.

### Questions for Vincent (run 8)

19. **F-0042 — fix the registry row, not the wiki.** May the `documentation_url` of `creditor_report_applet` in akaun_master be changed to `https://wiki.bigledger.com/applets/finance/creditor-report-applet/`? The wiki side is done; both pages stay.
20. **Screenshots.** All five creditor screenshots show real company/person names and were dropped. Should Lane 2 (a) leave the page image-less, (b) request retakes from the staging tenant with synthetic suppliers, or (c) crop/blur the existing ones? The same problem will recur on the debtor pages (same tenant, same test data).
21. **Contra from a report applet.** The Creditor Report Applet writes contras with no server-side check against the open balance (client guard only). Document as-is (done) or flag as a product issue to the backend team?

### Notes (run 8)

- Method: for report applets, "four proofs" reduce to: form controls in the applet-local field-configuration template (rendered), `saveMasterSettingsInit` (persisted), and a grep for `settings?.KEY` / `resolve?.KEY` across listings (consumed). `applet-settings.model.ts` is copy-pasted from the document applets and lists ~35 keys that nothing here renders — trust the template, not the model.
- Method: the report's real behaviour is in the backend **Uow where-clauses** (`EntityReportUow`, `EntityOutstandingDocumentUow`, `EntityStatementOfAccountUowHelper`, `TransactionHistoryReportUow`): FINAL-only, `NOT IN (:exclude_server_doc_types)`, `arap_types` via entity or company link, forex division by `base_doc_xrate`, historical = snapshot table with `date_txn < month end + 1`. Grep `posting_status` and `exclude_server_doc_types` in the Uow before writing any "what it reads" sentence. Avoid `grep -r` over the whole `javasdk` tree — it times out; target the `dal/uow/...` directory.
- Method: the `blg-akaun-ts-lib` endpoints are only visible in the frozen V1 repo's `node_modules/blg-akaun-ts-lib/fesm2015/*.js` (the V2 repos have no node_modules) — useful for `EntityReportService` (`entity-reports/entity|aging/backoffice-ep`).
- Pace: one 8-report applet with a write path took the full run (~90 min) including six screenshots and backend Uows. **Next: `content/en/applets/finance/debtor-and-creditor-report-applet.md`** (registry `debtor-and-creditor-report-applet`, repo `blg-applet-wavelet-debtor-and-creditor-report-applet`, 15 menu items; its field-configuration component uses a different form style — grep `form.addControl`/`FormGroup({` rather than `FormControl(`). Then `debtor-report-applet.md` (V2 repo; Field Settings has 10 keys). Both share ~80 % of the creditor structure, so expect both in one run. Open the debtor screenshots (`static/images/debtor-report-applet/`, 8 files) before keeping any — same test tenant.

### Registry / naming mismatches (run 8, queue triage)

- `finance/vote-book-applet.md` — marked **skipped** in state.json per the run-8 instruction (F-0089: no registry row; the concept is the Budgetary Applet's votebook). Inbound links from `modules-v2/financial-accounting/_index.md` and `user-guide/industry-solutions/professional-services.md` should be re-pointed to `/applets/finance/budgetary-applet/` when F-0079 is decided.
