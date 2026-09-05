# Lane 4 findings

Folders: inventory-workflow, master-data
Run: 2026-09-05 — 6 pages completed (doc-item-maintenance, customer-maintenance, chart-of-account, cashbook, stock-availability, stock-adjustment). 35 left in queue.

## Cross-lane link requests

Add `doc-item-maintenance-applet` to `related_applets` of (with one sentence each):
- content/en/applets/integrations/t2t-admin-applet.md — "T2T Item Mapping on the item needs the tenant permission granted here first."
- content/en/applets/sales-workflow/pos-general-applet.md — "Items, item types, pricing schemes and branch/company visibility come from Doc Item Maintenance; POS settings choose which pricing scheme is retail / min / max."
- content/en/applets/ecommerce/cp-commerce-admin-applet.md — "Categories, category images, attributes, search filters, reviews and pages are maintained on the item in Doc Item Maintenance."
- content/en/applets/membership/voucher-management-applet.md — "Voucher-type items (`COUPON`) are created in Doc Item Maintenance."
- content/en/applets/e-invoice/my-e-invoice-portal-applet.md — "Item classification, taxable type code and e-Invoice UOM are captured per item on the E-Invoice tab of Doc Item Maintenance; tenant defaults `DEFAULT_EINVOICE_*` pre-fill them."

Add `customer-maintenance-applet` to `related_applets` of:
- content/en/applets/sales-workflow/internal-sales-order-applet.md and internal-sales-invoice-applet.md — and state how the customer's credit term / credit limit and `BLACKLISTED` credit status are applied when the customer is selected (lane 4 could NOT find credit-limit enforcement in javasdk domain code for sales documents; only in file-import helpers. Please confirm from the sales-document UI/backend.)
- content/en/applets/finance/accounts-receivable-applet.md, statement-of-account-applet.md — customer master link.
- content/en/applets/e-invoice/my-e-invoice-portal-applet.md — "Buyer block (TIN, ID, SST, address, contact, skip-e-Invoice flag) comes from the customer's E-Invoice tab."

Add `chart-of-account-applet` to `related_applets` of:
- content/en/applets/finance/general-ledger-applet.md and ledger-and-journal-applet.md — state the lock rule: manual journal creation is refused (HTTP 403 `FISCAL_PERIOD_LOCKED`, "The selected date falls within a locked fiscal period") when the period is `LOCK_GL` or `LOCK_ALL`; journals with `auto_flag = AUTO` bypass. `LOCK_TXN` does not stop journals. [akaun-api JournalController.java L123-135]
- content/en/applets/finance/financial-report-applet.md — closing-stock lines are switched by `SHOW_INVENTORY/RAW_MATERIAL/WIP/FINISHED_GOODS/NSTI_STOCK_VALUE` under Chart of Account > Settings > General Settings.

Add `cashbook-applet` to `related_applets` of:
- content/en/applets/finance/bank-reconciliation-applet.md — reconciles one cashbook.
- content/en/applets/finance/internal-receipt-voucher-applet.md, internal-payment-voucher-applet.md — settlement method → cashbook → GL code; bank charges post via the settlement method's Charges tab and the `SETTLEMENT_CHARGES` default GL code.
- content/en/applets/sales-workflow/pos-general-applet.md — per-branch default settlement method per tender type lives in Cashbook > Settings > Branch Settings.
- content/en/applets/finance/general-ledger-applet.md — cash transfer journals are created only for `FINAL` transfers (Dr *to* cashbook GL, Cr *from* cashbook GL).

Add `stock-availability-applet` to `related_applets` of:
- content/en/applets/sales-workflow/internal-sales-order-applet.md, purchase-workflow/internal-purchase-order-applet.md, internal-purchase-grn-applet.md — open documents of these types are the "Adj Qty" that reduce / increase Available Qty (Available = Stock Balance + signed Adj Qty).

Add `stock-adjustment-applet` to `related_applets` of:
- content/en/applets/finance/general-ledger-applet.md — stock adjustment journal rule: Adjust-Out (qty < 0) debits the `STOCK_ADJUSTMENT` account (or the line's own GL code), Adjust-In credits it; stock side via `COGS` / stock balance mapping. [JournalPostingTypeHandler L104-109, JournalPostingService L93-160]

Within lane 4 (to do on later pages): add back-links to the six completed pages from inv-item-maintenance, tax-configuration, organisation, stock-balance, stock-take, stock-reservation, warehouse-management, pricebook, supplier-applet-1, employee, entity, merchant when those pages are processed.

## Registry / naming mismatches

- **Two wiki pages for one registry row.** `customer_applet_v1` "Customer Maintenance" (documentation_url → /applets/customer-maintenance-applet/) is documented by BOTH content/en/applets/master-data/customer-maintenance-applet.md (now rewritten, canonical) and content/en/applets/master-data/customer-applet.md ("Customer Applet"). The latter invents a "front desk vs back office" distinction that does not exist — both describe blg-applet-akaun-platform-customer-applet. Recommendation: merge customer-applet.md into customer-maintenance-applet.md and keep `/applets/master-data/customer-applet/` as an alias. Lane 4 will mark customer-applet.md skipped when it reaches it unless told otherwise.
- `customerprofileapplet` "Customer Profile" (TNT-APPLET, ACTIVE, created 2025-09-25) has no wiki page and no repo found under a matching slug in refs/. Not the customer-specific beauty/CMZ profile applets. Needs a decision: document or exclude.
- `erp_stock_adjustment_applet` has two repos: blg-applet-wavelet-stock-adjustment-applet (current, last commit 2026-08-24) and blg-applet-akaun-platform-stock-adjustment-applet (2025-11 split, dormant). Page uses the wavelet repo.
- `cashbookApplet` "Cashbook Applet" is DELETED; the live row is `cashbook-applet` "Cashbook".
- Titles changed to registry names: "Doc Item Maintenance Applet" → "Doc Item Maintenance"; "Customer Maintenance Applet" → "Customer Maintenance"; "Chart of Account Applet" → "Chart of Account"; "Cashbook Applet" → "Cashbook"; "Stock Availability Applet" → "Stock Availability"; "Stock Adjustment Applet" → "Stock Adjustment (Internal)". Nav labels change accordingly.

## Undocumented applets encountered

- `customerprofileapplet` — Customer Profile (see above).
- `AkaunPriceBookApplet` "Akaun Price Book" (ACTIVE 2025-11-13) — may or may not be what pricebook-applet.md (queued) describes; resolve when that page is processed.

## Questions for Vincent

1. Merge customer-applet.md into customer-maintenance-applet.md (same registry row)? Or is "Customer Applet" meant to describe `customerprofileapplet`?
2. Credit limit enforcement: the old customer pages claim the system "hard-stops" a sales order over the limit. Not found in javasdk domain code for sales documents. Which lane/page should verify and own that statement?
3. Doc Item Maintenance previously embedded a YouTube video via inline-styled `<div><iframe>` (violates the Hextra rule). Replaced with `{{< youtube omcu01BQTFs >}}`. OK to keep the video?
4. Unbound settings screens: Doc Item "Department Settings", Chart of Account "Field Settings", Stock Adjustment "Field Settings" show toggles with no form binding (no effect). Documented as "no effect". Report to the applet team as UI bugs?
5. Stock Adjustment lifecycle: documented DRAFT / FINAL / DISCARDED only. The previous page listed VOID; no VOID path found in GenericDocumentService this pass. Can stock adjustments be voided?

## Notes

- **The HIDE_/SHOW_ pattern is universal.** Every applet in this lane stores a tenant-wide settings JSON of `HIDE_*` switches (menus, tabs, columns, fields) and registers matching `SHOW_*` client-side permissions in `bl_applet_client_side_perm_dfn`; a permission re-enables the feature for its holder (`visible = !HIDE_setting || SHOW_permission`). Doc Item has ~300 keys; Customer 35 permissions; Stock Availability 50; Chart of Account none.
- **Master data is shared across applets more than the wiki implied.** Category groups/categories are shared between Doc Item and Inventory Item Maintenance; customer, supplier, employee and merchant are one entity table; a settlement method is stored as a financial item of type `STL_MTHD` (which is why it can leak into item pickers — gt#7616).
- **Posting rules live in two Java places.** Document-type → sub-ledger mapping in `JournalPostingTypeHandler`; debit/credit direction in `JournalPostingService`; fiscal locks in `JournalController` (LOCK_GL/LOCK_ALL for manual journals, AUTO journals exempt) and `GenericDocumentService` (LOCK_TXN/LOCK_ALL for documents).
- **Defect candidates found while reading code** (recorded in kb/topics, not fixed): customer create form binds phone `[required]="NOT_MANDATORY_PHONE_NO"` (inverted vs the edit form); Stock Availability listing pricing-lateral performance (gt#8633, fixed); cash transfer idempotency counting DELETED journals (gt#9120, fixed).
- Privacy: issues referenced by number only; customer/tenant/person names in issue titles dropped.
- Process: `book.py` (scratchpad) appends the ledger record and moves queue→done; two ledger records initially had empty `sources` because of a cwd slip and were repaired.

---

# Run 2 — 2026-09-05

Pages completed: stock-transfer-applet, stock-report-applet, consignee-stock-transfer-applet. Skipped: master-data/customer-applet.md (duplicate of customer-maintenance; awaiting F-0050). 31 left in queue.

## Cross-lane link requests (run 2)

Add `stock-transfer-applet` to `related_applets` of:
- content/en/applets/purchase-workflow/internal-purchase-grn-applet.md — "A finalised GRN can be knocked off into an Outbound Stock Transfer (Search Document > GRN) to push received goods to branches."
- content/en/applets/purchase-workflow/internal-purchase-invoice-applet.md — same, via the Purchase Invoice knock-off tab (`HIDE_PURCHACE_INVOICE_TAB` / `SHOW_PURCHASE_INVOICE_TAB`).
- content/en/applets/finance/financial-report-applet.md and master-data/chart-of-account-applet.md (lane 4, done — will add on a later pass): fiscal-period lock text must say that `INTERNAL_OUTBOUND/INBOUND_STOCK_TRANSFER` are explicitly exempt from `LOCK_TXN` / `LOCK_ALL` [GenericDocumentService L1681-1696].
- content/en/applets/finance/general-ledger-applet.md — stock transfers and consignee notes post NO journal (amount signum 0, not in JournalPostingTypeHandler); if that page lists "stock transfer journals", remove it.

Add `stock-report-applet` to `related_applets` of:
- content/en/applets/finance/financial-report-applet.md — "Closing stock in the ledger is reconciled against Stock Report > Stock Summary by Location (closing inventory value) and Historical Stock Balance (MA value as at date)."
- content/en/applets/sales-workflow/internal-sales-invoice-applet.md, internal-sales-return-applet.md (and cash bill), purchase-workflow/internal-purchase-invoice-applet.md, internal-purchase-grn-applet.md, internal-purchase-return-applet.md — these are the exact document types the Summary-by-Location report classifies as *Sold* / *Purchase*; everything else is *Others*.

Add `consignee-stock-transfer-applet` to `related_applets` of:
- content/en/applets/sales-workflow/customer-consignment-applet.md — "Quantity is moved to / from the consignee (`CCSG`) location by Consignee Stock Transfer; this applet handles the sale and billing."

Within lane 4 (later pages): organisation-applet must document **Location Class** (`CCSG` = consignee location; codes starting `L-STOCK-IN-TRANSIT` are excluded from stock-transfer Location To); internal-stock-requisition-applet must state fulfilment is by outbound stock transfer knock-off; stock-replenishment-applet must absorb the Template / Events / Runs content that was removed from stock-transfer-applet (the replenishment menu in the transfer applet is commented out); non-stock-and-trade-in-applet should note trade-in stock is not in Historical Stock Balance (gt#1422, open).

## Registry / naming mismatches (run 2)

- Titles changed to registry names: "Stock Transfer Applet" → "Stock Transfer"; "Stock Report Applet" → "Stock Report"; "Consignee Stock Transfer Applet" → "Consignee Stock Transfer".
- `consignee-stock-transfer` has no `documentation_url` in the registry; the page exists at /applets/inventory-workflow/consignee-stock-transfer-applet/. Suggest setting it.
- `stockReport` registry code is camelCase (`stockReport`) unlike the rest; fine, recorded.

## Direction / fact reversals found in old pages (run 2)

- **stock-transfer-applet**: the old page described an approval workflow (Submitted / In Transit / Received / Completed / Rejected, Approve / Reject / Query / Delegate) and "automatic approval for low-value transfers". None of that exists in code. Real flow: outbound DRAFT → FINAL (→ VOID) creates open-queue rows; inbound knocks the queue off (ST-GIN tab) → FINAL. Old FAQ "transfers in transit cannot be cancelled" — an outbound FINAL can be voided; "partial receipts" — correct (qty_open).
- **stock-transfer-applet**: old page embedded the Stock Replenishment Template / Events / Runs guide; that menu is commented out in this applet and belongs to the Stock Replenishment applet page.
- **consignee-stock-transfer-applet**: old page said the Goods Received Note listing has no VOID — both listings have FINAL / DISCARD / VOID / PRINT in code. Old page also framed the two notes as different document types; both are posted through the `internal-customer-consignments-out` endpoint as `INTERNAL_CUSTOMER_CONSIGNMENT_OUT`, and the backend clones a +qty ledger line at Location To (`txn_code_02 = CSG`).
- **stock-report-applet**: old page said the Aging report "looks at remaining quantity of each inbound shipment"; the UOW simply ages ledger lines by txn_date within the searched range. Old page said Stock Balance Report values use "weighted moving average" — it shows MA unit cost and last cost; WA is a separate basis selectable in Advanced Search.

## Questions for Vincent (run 2)

6. **Stock transfer fiscal-lock exemption** — outbound/inbound stock transfers bypass `LOCK_TXN` / `LOCK_ALL` by design (explicit `!equals` in GenericDocumentService). Should the accounting guides / chart-of-account page state this as a feature, or is it a gap the product team should close?
7. **Consignee applet frontend inconsistency** — the issued-note create state still sets `INTERNAL_CUSTOMER_CONSIGNMENT_IN` (signum +1) in `hdr.states.ts` and `add-line-item`, while the only endpoint used is `-out`. Looks like dead code, but if a path posts an IN header it will be rejected by the OUT DCO. Report to the applet team?
8. **Unseeded permissions checked in code** (F-0044 pattern): stock transfer `SHOW_STOCK_TRANSFER_DETAILS_MENU`, `SHOW_ERROR_CHECKING_MENU`; stock report `SHOW_GP`, `SHOW_GP_PERCENTAGE`, `SHOW_LISTING_*` (14); consignee `SHOW_GENDOC_FINAL/DISCARD/VOID_BUTTON`. Seed them or accept "hide for all"?
9. **gt#9562 (open)** asks for inbound stock transfers to be auto-created as drafts when the outbound is finalised. If that ships, the Stock Transfer page's Queue / Inbound sections change. Track?

## Notes (run 2)

- **Stock transfers carry no value.** Both transfer types and both consignee note types have `amount_signum = 0` and are absent from `JournalPostingTypeHandler`; the only "posting" is the stock ledger. Cost at the receiving location comes from the company-level MA/FIFO/LIFO layers.
- **The transfer queue is the in-transit record.** `bl_fi_generic_doc_line_open_queue` rows are created by outbound FINAL, consumed by inbound FINAL (`qty_open`), released by DISCARD (`updateKO`); the Stock Summary by Location report shows the same quantity as *Stock In Transit* (plus DRAFT inbound lines). Locations coded `L-STOCK-IN-TRANSIT*` are excluded from the dropdowns because the queue already plays that role.
- **Stock Report menu gating is generic** (`HIDE_<STATE>_MENU` / `SHOW_<STATE>_MENU` derived from the route) and all 13 SHOW codes are seeded — the cleanest permission model seen in this lane so far. Its Application Settings screen is applet-own (the shared template has zero entries for `stockReport`).
- **Consignee locations are ordinary locations** with `location_class = CCSG`; the applet's "Consignee Listing" is a full location-master editor, so it can create non-consignee locations too.
- Process: `book.py` reused from run 1 (scratchpad); ledger shard now has 9 records, state has 9 done / 1 skipped / 31 queued.

---

# Run 3 — 2026-09-05 (recorded retroactively)

Run 3 reworked master-data/chart-of-account-applet.md (codex review: default-GL behaviour) and recorded it in state.json and the ledger before a rate limit stopped it; no findings section was written. Its content is reflected in the page front matter and kb/topics/chart-of-accounts.md.

# Run 4 — 2026-09-05

Rework completed: master-data/cashbook-applet.md (codex "fix minor" + lane 2's Weightage Configuration request) and inventory-workflow/stock-availability-applet.md (codex "rework": defaults and menu inventory). Both re-derived under the updated standard (four proofs per setting, per-section `sources:` with exact files, posting proof block, runtime-only key list, seeded-vs-unseeded permissions). Queue now starts at inventory-workflow/delivery-installation-applet-V2-applet.md (31 left). customer-applet.md stays skipped (F-0050).

## Direction / fact reversals found (run 4)

- **cashbook-applet: Cash Adjustment does NOT post a journal.** Run 1 said it "posts a journal against the cashbook's GL code". `CashDocumentJournalPostingJobProcessor` L71-74 returns without posting for `INTERNAL_CASH_ADJUSTMENT`; `JournalPostingService` L1637-1639 rejects a manual re-post with `NOT_A_CASH_TRANSFER`. It writes cashbook transaction lines only. The applet also has **no VOID button** for adjustments (listing has FINAL only). The accounting guides must not describe a cash adjustment as a ledger movement.
- **cashbook-applet: the cash transfer GL path has no header GL and no company default.** GL = sub-ledger for (company, line settlement item) → else the cashbook owning that item (new sub-ledger created) → else `MISSING_CASHBOOK: STL_MTHD [code]` / `MISSING_GL_CODE: STL_MTHD [code]`. Run 1's "resolved through the company's default GL codes" and "`SETTLEMENT_CHARGES` default GL code" claims were removed — `SETTLEMENT_CHARGES` is not read by the cash transfer posting service.
- **cashbook-applet: unsupported semantics removed** — Triggers & Limits "alerts / allowed negative balance" (no consumer in applet or Java), "Members controls cashbook access" narrowed to what the code does (bank-recon / bank-statement / cashbook-txn-line UOW queries join `bl_fi_cashbook_login_subject_link` by login subject; nothing in the Cashbook applet reads it), "POS and voucher applets pre-select branch defaults" replaced by the one verified consumer (POS General `settlement-adjustment-add.component.ts`).
- **stock-availability-applet: defaults.** Six Details-tab switches (`HIDE_STOCK_MOVEMENT`, `HIDE_PURCHASE_DOCUMENTS`, `HIDE_PURCHASE_DOCUMENTS_IN_STOCK_MOVEMENT`, `HIDE_INTERNAL_STOCK_ADJUSTMENT`, `HIDE_TOOLTIP_PRICING_DETAILS`, `INCREASE_ITEM_IMAGE_SIZE`) and `HIDE_UNIT_COST_AMOUNT` initialise **true** and a stored null is patched to true; `HIDE_STOCK_CARD_PLANNING_MENU` defaults **on** (`defaultHidden: true`). Because consumers test the stored value, they take effect only after the first save of Application Settings — documented as a warning callout (matches METHOD.md item 7 from lane 2).
- **stock-availability-applet: invented claims removed** — min-level row highlight (getRowStyle styles footer/group rows only), "every hide switch has a matching SHOW_ permission" (8 checked codes are unseeded, 2 seeded codes are unchecked), "typical finance-role pattern", reset-MA re-run prescription, pricing-scheme columns on the main listing (they are on Details only), `HIDE_REPORT_*` on aging/trace reports (they are the Stock Movement pop-up columns).

## Cross-lane link requests (run 4)

- content/en/applets/finance/bank-reconciliation-applet.md (lane 2) — add to the cashbook sentence: a `FINAL` cash transfer whose cashbook lines carry an active recon link can no longer have its company, date, lines or amount changed (`CASH_DOCUMENT_RECONCILED_TXN_LINES_BLOCK_EDIT`, `CashTransferService.validateFinalEditAgainstBankRecon`); membership is enforced by the login-subject UOW queries (`BankReconciliationUow` L353, `BankStatementUow` L339, `CashbookTxnLineUow` L318); auto-matcher weights default to 0.25 each only when the cashbook has no ACTIVE configuration.
- content/en/applets/finance/general-ledger-applet.md and ledger-and-journal-applet.md — if either lists "cash adjustment journals", remove it: cash adjustments post no journal. Cash transfer journals are `AUTO` / `TXN` and therefore bypass `LOCK_GL` (JournalController exempts AUTO).
- content/en/applets/finance/internal-receipt-voucher-applet.md — post-dated cheques received on a receipt voucher land in Cashbook > PD Cheque > Queue (`gen_doc_hdr_guid` on `bl_fi_pd_cheque_pending_processing_queue`) and are banked in from there.
- content/en/applets/sales-workflow/pos-general-applet.md — the branch default settlement methods (`default_settlement_cash` …) are set in Cashbook > Settings > Branch Settings and read by POS General's settlement adjustment screen; POS General's own Branch Settings screen edits the same record.
- content/en/guides/accounting-guides/bank-reconciliation-guide.md (guides lane) — if the guide tells the reader to "use a cash adjustment so the cashbook and ledger stay in step", correct it: the adjustment moves the cashbook only; a manual journal is needed for the ledger.

## Registry / naming mismatches (run 4)

- None new. `stockAvailability` page had no `weight`; set to 130 (between Stock Reservation 120 and Stock Take 135). No alias added — the registry `documentation_url` already points at the current path.

## Questions for Vincent (run 4)

10. **Cash Adjustment has no ledger effect and no VOID.** Is that intended product behaviour (cashbook-only correction) or a gap? The accounting guides currently imply the ledger follows.
11. **Stock Availability init-true switches** hide cost/supplier data for everyone on the first save of Application Settings. Report to the applet team as a UX defect, or document only (done)?
12. **Unseeded permissions checked in code** (F-0044 pattern, this run): cashbook `SHOW_SETTLEMENT_METHOD`, `SHOW_IMPORT_CASHBOOK_MENU`, `SHOW_CASH_TRANSFER_BY_TRANSACTION_MENU`; stock availability `SHOW_STOCK_CARD_PLANNING_MENU`, `SHOW_AUDIT_TRAIL_MENU`, `SHOW_LISTING_COMPANY_AVG_COST`, `SHOW_UOM`, `SHOW_STOCK_BALANCE`, `SHOW_ADJ_QTY`, `SHOW_AVAILABLE_QTY`, `SHOW_REPORT_INVENTORY_VALUE`. Seed them?
13. **Rendered-but-not-consumed settings** found this run (candidates for removal from the UI): cashbook `SORT_BY_COLUMN`, `ORDER_BY`, `DISPLAY_CASH_TRANSFER_RUNNING_NUMBER`, Default Selection branch/location; stock availability `ENABLE_FILTER_BY_TODAYS_TXN`, `HIDE_PURCHASE_GRN_PURCHASE_PRICE`, `HIDE_PURCHASE_GRN_SUPPLIER_NAME`, `HIDE_DOC_POPUP_COST_AMOUNT`, `HIDE_DOC_POPUP_GP`, `ITEM_CATEGORY_GROUP_0..20` (+ hides). Report to the applet team?

## Notes (run 4)

- **Cash documents are a third posting family.** `bl_fi_cash_document_hdr` is neither a generic document nor a journal: no `FinancialDocDataConsistencyObject` signums, no `GenericDocumentService` fiscal-lock check, its own `CashTransferJournalPostingService` (sign carried in the line amount; −→Cr, +→Dr) and three RUN_NOW job processors (journal, cashbook lines, PD cheque) on FINAL/VOID. Bank-in of a post-dated cheque is itself a generated cash transfer with three lines (from, to net of the sending method's charges, charges).
- **Weightage Configuration explained** (lane 2 request): four dimensions amount/date/reference/payee, weights in `config_json`, backend defaults 0.25 each without an ACTIVE config, threshold 70–100 (/100), one-to-one flag; the 100 % cap is client-side only. The create form writes three extra dimension keys (approval, remark, description) that nothing renders or reads.
- **"Not consumed" claims rely on literal + prefix greps** over the micro-fe (`ITEM_CATEGORY_GROUP`, `DOC_POPUP`, `PURCHASE_GRN_`, `TODAYS`, `SORT_BY_COLUMN`, `DISPLAY_CASH_TRANSFER_RUNNING_NUMBER`) plus a check of accessor patterns (`appletSettings.`, `master?.`, `[ '...' ]`). METHOD.md item 7(b) (indirection) was applied to the generated `HIDE_<STATE>_MENU` keys via `menu-visibility.ts`; other indirection would be missed.
- Pace: the two reworks consumed the run (each needed ~60 source files and 15 backend files). Stopping cleanly before delivery-installation-applet-V2 rather than starting a large document applet with reduced care.

---

# Lane 4 — run 5 (2026-09-05)

Resumed from the queue. One page rewritten (inventory-workflow/driver-delivery-order-applet.md), one page skipped as a registry duplicate (inventory-workflow/delivery-installation-applet-V2-applet.md), and the next page (master-data/employee-applet.md) reconnoitred but not rewritten — its verified facts are in kb/topics/employee-applet.md (status: seed) so the next run starts from them. customer-applet.md stays skipped (F-0050). Queue: 29 left, next master-data/employee-applet.md.

## Pages completed (run 5)

- content/en/applets/inventory-workflow/driver-delivery-order-applet.md — rewritten to the standard. Registry `driverDeliveryOrderApplet` "Driver Delivery Order Applet" (title unchanged, matches). Alias `/applets/driver-delivery-order-applet/` added (old URL quoted in wiki#57).

## Registry / naming mismatches (run 5)

- **inventory-workflow/delivery-installation-applet-V2-applet.md — duplicate page, skipped.** The registry has one ACTIVE row for this product, `delivery-installation-applet` "Delivery Installation applet" (route `applet/wavelet/erp/logistic/delivery-installation-applet`); there is no separate "V2" applet code. The canonical page for that row is `delivery-installation/delivery-installation-applet.md`, which lane 3 owns and has queued (with `delivery-installation-driver-applet.md`). Same situation as F-0050. Facts for whoever rewrites it: the current code is repo `blg-applet-wavelet-delivery-installation-applet-V2` (commit 9966d77, 2026-07-26); the older repo `blg-applet-wavelet-delivery-installation-applet` (2025-11-06) contains the same `delivery-installation-applet-V2` project directory but 90 files differ — use the V2 repo. Routes: trip-calendar, trip-listing, shipment-listing, file-import, job-shipment-listing, sales-order-jobs, sales-invoice-jobs, job-delivery-order, delivery-job-line-report, delivery-region-listing, vehicle-listing, logistic-hub, logistic-hub-network, driver-listing; settings: application-settings, app-left-menu-items, default-selection, custom-status-settings, field-settings, return-reasons-settings, printable-format-settings, webhook, feature-visibility, permission-*. The V2 page's 13 screenshots live under `static/images/delivery-installation-applet-V2-applet/` and are worth keeping. GitHub: V2 repo has 0 issues; gt#6485 (Sub Query Remove, 2026-07); wiki#54.
- driver-delivery-order-applet: registry `documentation_url` already points at the current path; no mismatch.
- employee-applet (queued): registry name is **"Employee Maintenance"** (page title currently "Employee Applet") — the rewrite must retitle; the `/applets/employee-maintenance-applet/` alias already exists and matches the registry `documentation_url`.

## Cross-lane link requests (run 5)

- content/en/applets/sales-workflow/internal-delivery-order-applet.md and internal-outbound-delivery-order-applet.md (lane 1) — add `driver-delivery-order-applet` to `related_applets`, and document the **Delivery Driver** header field: `bl_fi_generic_doc_hdr.delivery_driver_guid` (FK to `app_login_subject`) is what the Driver Delivery Order applet filters on (`delivery_driver_guids` IN-filter, `GenericDocumentUow` L684/L2835). Neither current internal-outbound-DO repo has a driver picker; say where it is set if you find it (the Supplier Delivery Order applet has one — `select-delivery-driver` using `EntityDriverLinkService`; conversion copies it via `GenericDocLinkService` L654).
- content/en/applets/purchase-workflow/supplier-delivery-order-applet.md (lane 3) — add `driver-delivery-order-applet` to `related_applets`; note that its Delivery Driver picker is the reference implementation (entity driver link → login subject) and that supplier delivery orders do **not** appear in the Driver Delivery Order applet (which lists `INTERNAL_OUTBOUND_DELIVERY_ORDER` only).
- content/en/applets/delivery-installation/delivery-installation-applet.md and delivery-installation-driver-applet.md (lane 3) — add `driver-delivery-order-applet` to `related_applets` as the lightweight alternative (single driver field on the DO, no trips/jobs); see the registry note above for the V2 repo facts.
- content/en/applets/inventory-workflow/stock-availability-applet.md (lane 4, done) — no change needed; `do_qty` already described as committed quantity.

## Findings for the product team (run 5)

- **driver-delivery-order-applet: dead configuration.** The Custom Status screen saves `ENABLE_CUSTOM_STATUS_*` / `LIST_CUSTOM_STATUS_*` keys that nothing in the applet reads (hdr reducer always writes `custom_status: null`); the settings menu lists **Printable Format Settings** and **Email Template** with no route (404); FINAL/DISCARD/VOID/CLOSE buttons are commented out but their HIDE_/SHOW_ settings and permission checks remain; `onAdd()` and a create page exist but no control calls them. The old wiki page told drivers to "click Add to create a new ad-hoc delivery" and to "select a custom status" — both removed.
- **driver-delivery-order-applet: `HIDE_DELIVERY_LOCATION` side effect.** Turning it on blanks the Account and Delivery time slot fields (they are patched only inside `if(!HIDE_DELIVERY_LOCATION)`, main-details L224-233) and a save then writes the blank time slot back. Documented as a warning.
- **driver-delivery-order-applet: FINAL documents stay editable.** Vehicle No / Delivery Date / time slot remain editable and SAVE submits a PUT on FINAL delivery orders; no backend block found in GenericDocumentService (871dbf5c96). Worth a product decision (see questions).
- **Unseeded client-side permissions (F-0044 pattern):** driverDeliveryOrderApplet has zero rows in `bl_applet_client_side_perm_dfn` although the code checks SHOW_GENDOC_FINAL/DISCARD/VOID_BUTTON and SHOW_TRANSACTION_DATE; employeeApplet also has zero rows.
- **employee-applet (queued):** `HIDE_CLAIMS` hides the **Org Chart** menu (app.component.ts L60) — a mislabelled key; the Application Settings screen binds several keys twice across sections (HIDE_STATUS, HIDE_MODIFIED_DATE, HIDE_COUNTRY, HIDE_EMPLOYEE_NAME, HIDE_EMPLOYEE_TYPE, HIDE_CURRENCY, HIDE_CREATION_DATE), so "Employee Listing › Status" and "Login › Status" are the same switch. The current page's File Import column table and "DRAFT" employee status are not supported by anything read so far.

## Questions for Vincent (run 5)

14. **Delivery & Installation V2 page** — merge `inventory-workflow/delivery-installation-applet-V2-applet.md` into `delivery-installation/delivery-installation-applet.md` (lane 3) with an alias, as recommended for F-0050? If yes, lane 3 should rewrite from the V2 repo and keep the V2 screenshots. Recommended: merge.
15. **Driver Delivery Order on FINAL documents** — is it intended that a driver can change vehicle number / delivery date / time slot after the delivery order is FINAL (code allows it; no backend block found)? Wiki currently states the observed behaviour with a caveat.
16. **Dead settings in Driver Delivery Order** (Custom Status screen, Printable Format Settings, Email Template) — report to the applet team for removal, or document only (done)?

## Notes (run 5)

- The Driver Delivery Order applet is a cut-down copy of the sales-invoice container: the listing/edit/effects files are still named `sales-invoice-*`, the page service labels columns "Sales Invoice Listing/Create/Edit", and the effects carry `SUPPLIER_DELIVERY_ORDER` constants for rounding/discount lines that this applet never creates. Documented only what is reachable.
- `localStorage['guid']` (used as the driver filter) is written by the auth applet at login and equals the login subject guid used by `session.effects.ts` (`app_login_guid`); the FK on `delivery_driver_guid` confirms the target table.
- Pace: ~70 minutes. One small applet done with full four-proof treatment plus a duplicate resolved; stopped before the Employee applet (16+ tabs, file-import processor, org chart) rather than rush it. Its seed topic file should cut the next run's research roughly in half.

---

# Lane 4 — run 6 (2026-09-05)

Resumed from the queue with the run-5 reconnaissance seed. One page rewritten (master-data/employee-applet.md, retitled to the registry name "Employee Maintenance"). Skipped stay skipped: customer-applet.md (F-0050), delivery-installation-applet-V2-applet.md (run 5). Queue: 28 left, next master-data/entity-applet.md.

## Pages completed (run 6)

- content/en/applets/master-data/employee-applet.md — rewritten to the standard. Registry `employeeApplet` "Employee Maintenance" (title changed from "Employee Applet"); the `/applets/employee-maintenance-applet/` alias already matched the registry `documentation_url`. Repo commit 220a282a (2026-08-21); backend 871dbf5c96.

## Screenshots with personal data (run 6)

Every file under `static/images/employee-applet/` was opened. The following show real staff names, e-mail addresses, phone numbers or a person-named org chart (Employee Listing rows, Created By / Modified By columns, Org Chart creators, the User Permission grid) and are **not referenced** by the rewritten page. They should be replaced with captures from a tenant seeded with the GadgetSphere example, or deleted:

- employee-listing.png, employee-create.png, employee-add-details.png, employee-save.png, employee-edit.png, employee-view.png, employee-leave.png, employee-success.png, employee-saved.png, employee-login.png (employee listing with real names in every row)
- employee-org-chart.png, employee-org-chart-struc.png (org chart headers with creator names; charts named after a person)
- employee-set-perm.png (User Permission grid: e-mails, mobile numbers, user names)
- employee-categories.png (category codes that appear to name a real branch; excluded as a precaution)

Not personal data but also dropped: employee-applet-overview.png and employee-applet-quick-start.png are AI-generated infographics with garbled text ("Slow-to-perform compliance") and a footer describing a *different* applet (self-billing) — they misinform.

Kept (no personal data): employee-create-branch.png, employee-report.png, employee-payment.png, employee-tax.png, employee-speending.png, employee-login-create.png, employee-app-setting.png, employee-hide-unhide.png, settings.png, employee-file-import.png. employee-create-leave.png is clean but unused because the Approved Leave form does not save (below).

## Direction / fact reversals found (run 6)

- **employee-applet: "DRAFT" status does not exist.** Entity status is `ACTIVE` / `TEMP` / `INACTIVE` (`entity-constant.model.ts` L44-49). The old page's status table was invented.
- **employee-applet: the File Import column table was invented.** Real columns are the 35 in `EmployeeImportFileColumnNames` (EMPLOYEE_CODE … SHIPPING_POSTCODE, incl. CATALOG_CODE and RANK); only EMPLOYEE_NAME and DOC_CURRENCY are validated as mandatory. There is no Branch Code, Department, Report To, Join Date or Status column.
- **employee-applet: `HIDE_CLAIMS` hides the Org Chart menu**, not a Claims tab (the Claims tab block is commented out). The old FAQ's "Feature Visibility or role permissions may hide the Org Chart" was wrong — Feature Visibility offers only the shared Manage Team Access panel, and there are no client-side permissions for this applet.
- **employee-applet: the Approved Leave tab persists nothing** (`onAdd()` empty, `put` commented out, listing bound to report-to columns). The old page presented it as a working manager feature; the old FAQ told readers to record leave there.
- **employee-applet: the seed's payroll claim was wrong.** Payment Config writes `bl_fi_mst_entity_payment_method`, not `bl_pyrll_employee_bank_link`; nothing in this applet calls the payroll validators. kb/topics/employee-applet.md corrected.

## Findings for the product team (run 6)

- **Settings key mismatches in Employee Maintenance:** the Application Settings screen saves `HIDE_CREATION_DATE` but the edit Main tab reads `HIDE_CREATED_DATE` (Creation Date field can never be hidden); the Modified Date field is bound to `HIDE_MODIFIED_BY` instead of `HIDE_MODIFIED_DATE`; `HIDE_CLAIMS` is labelled "Claims" but hides the Org Chart menu; `REPORT_TO` / `APPROVED_LEAVE` are hide switches without a HIDE_ prefix. Duplicate bindings (HIDE_STATUS, HIDE_MODIFIED_DATE, HIDE_COUNTRY, HIDE_EMPLOYEE_NAME/TYPE, HIDE_CURRENCY, HIDE_CREATION_DATE appear in two sections) mean one switch changes two screens.
- **Hide switches apply to the edit form, not the create form** — the create Main tab reads only nine of the 43 Main-Details keys. A tenant that hides, say, Date of Birth still collects it on create.
- **Rendered but not consumed:** Personalisation › Default Selection (Default Branch / Default Location) saves keys nothing reads; `MAX_QTY` is patched but has no control and its field is permanently hidden.
- **Approved Leave tab** — dead UI (see above). Either remove or finish.
- **File Import can silently turn an existing customer/supplier into an employee**: without EMPLOYEE_CODE the row is matched by ID number → tax registration number → e-mail → phone across all entities and the match is updated with `is_employee = true`.
- **Unseeded permissions (F-0044 pattern):** employeeApplet has zero rows in `bl_applet_client_side_perm_dfn` and checks no SHOW_* codes, so the HIDE_* settings cannot be reopened per role at all.

## Cross-lane link requests (run 6)

- content/en/applets/claims/claim-applet.md and claim-cycle-applet.md (claims lane) — link text "Employee Applet" → "Employee Maintenance"; the claimant is resolved from the login e-mail on the employee header, so say "e-mail on the Main tab **or** a Login-tab link" as the prerequisite; do not point readers at the Approved Leave tab for leave-related claim rules (it does not save).
- content/en/applets/e-invoice/my-e-invoice-portal-applet.md and mypeppol-admin-applet.md (e-invoice lane) — add `employee-applet` to `related_applets`; the employee E-Invoice tab (self-billed switch, TIN, ID type/number, SST and tourism-tax numbers, MSIC / SIC, address) and Peppol Config tab are the supplier-side party data for self-billed e-Invoices to employees.
- content/en/applets/external-tenant-admin/tenant-admin-applet.md — add `employee-applet` to `related_applets`; the Login tab's invitation carries `postRegistrationRequest.add_user_to_tenant: true` and, with `INSTALL_ALL_APPLETS_ON_INVITE`, `catalog_config[{catalog_guid, install_all_applets: true}]`.
- content/en/modules/hr-payroll/_index.md, modules-v2/core/_index.md, applets/_index.md, applets/applet-catalog.md, applets/integrations/t2t-admin-applet.md, applets/purchase-workflow/internal-purchase-order-applet.md (various lanes) — rename link text "Employee Applet" → "Employee Maintenance" where it appears; the URL is unchanged.
- content/en/applets/master-data/merchant-applet.md (lane 4, queued) — will fix its "Employee Applet" link when reached.

## Registry / naming mismatches (run 6)

- None new. Title corrected to the registry name; alias already present.

## Questions for Vincent (run 6)

17. **Employee screenshots** — 14 of the 27 images carry real staff names / e-mails / phones (list above). Delete them from `static/images/employee-applet/` now, or keep them on disk unreferenced until replacements are captured? Recommended: delete; nothing links to them any more.
18. **Approved Leave tab** — report to the applet team as dead UI (recommended), or leave documented-only?
19. **File Import cross-type matching** (customer → employee by e-mail/phone) — intended behaviour or a defect to report? The wiki states it as observed behaviour with a warning.

## Notes (run 6)

- The seed topic file cut research roughly in half as hoped; the remaining time went into verifying consumers key-by-key (three of the 40-odd HIDE_ keys turned out to be mis-wired) and opening all 27 screenshots.
- `entity-constant.model.ts` in the applet's own `projects/shared-utilities` copy is the option source (status, gender, marital, employment status, ranks) — the same file exists in the other entity applets, so Entity / Merchant / Supplier pages can cite it directly.
- Pace: ~75 minutes for one large master-data applet (18 edit tabs, 3 menus, import processor). Stopping before entity-applet rather than starting another entity applet with reduced care; its option constants and backend validators are already identified above.

---

# Lane 4 — run 7 (2026-09-05)

Resumed from the queue. One page rewritten (master-data/entity-applet.md, retitled to the registry name "Entity Maintenance"). Skipped stay skipped: customer-applet.md (F-0050), delivery-installation-applet-V2-applet.md (run 5). Queue: 27 left, next master-data/forex-applet.md.

## Pages completed (run 7)

- content/en/applets/master-data/entity-applet.md — rewritten to the standard. Registry `entity-maintenance-applet` "Entity Maintenance" (title changed from "Entity Maintenance Applet"). Repo commit 71162733 (2026-09-02); backend 871dbf5c96. No alias added: the registry `documentation_url` for this row is an Atlassian Confluence page, not a wiki URL (see mismatches).

## Screenshots with personal data (run 7)

Every file under `static/images/entity-applet/` was opened. The following show real staff names, e-mail addresses, phone numbers, a real customer-name fragment in a category code, or a logged-in user's name and e-mail, and are **not referenced** by the rewritten page:

static/images/entity-applet/customer-category-listing.png
static/images/entity-applet/entity-category-listing.png
static/images/entity-applet/entity-category-report.png
static/images/entity-applet/entity-create-form.png
static/images/entity-applet/entity-edit-form.png
static/images/entity-applet/entity-listing-main.png
static/images/entity-applet/entity-payment-config-tab.png
static/images/entity-applet/entity-personalization-default-selection.png
static/images/entity-applet/entity-settings-default-selection.png
static/images/entity-applet/supplier-category-listing.png

Not personal data but also dropped: static/images/entity-applet/entity-create-overview.png is an AI-generated infographic ("Automated workflows… approvals", "Complete Audit Trail") describing features the applet does not have.

Kept (no personal data): employee-category-listing.png (test category codes on a staging tenant).

## Direction / fact reversals found (run 7)

- **entity-applet: "Settings > Field Settings" and "Default Selection" were documented as working configuration.** Field Settings is a static template (eight unbound toggles, SAVE with no handler, empty component class); Default Selection and Personalisation write into an applet container that is never loaded (subscription commented out) and emit a `save` output nothing listens to. The old page's "Tenant behavior note: request tenant admin/role permission updates" was invented — there is no permission involved. No component in the applet reads any applet setting.
- **entity-applet: Credit Term and Credit Limit were presented as working credit controls.** Both `onSave()` handlers discard the input; the listings read `CREDIT_TERMS` / `CREDIT_LIMITS` extensions nothing writes.
- **entity-applet: the Login tab cannot work.** The listing filters on a hard-coded entity guid (`entity-login.component.ts` L73) and the create panel posts an empty `entity_hdr_guid` (`login-create.component.ts` L62/L149), which the backend rejects (`EntitySubjectLinkDataConsistencyObject` L64).
- **entity-applet: the Entity Category tab on the edit form persists nothing** — its action (`[Item Applet] Get Item Category Container`, actions L96) has no reducer and Update does not send it. The old page told readers to "assign the correct Entity Category" as step 5 of onboarding.
- **entity-applet: currency is stored as an extension, not on the header**, and cannot be changed after create (Update never writes the `CURRENCY` ext). The old page's "Fill required header fields … Currency" was right for create only.
- **entity-applet: the old "Advanced Governance Routes (Tenant Dependent)" paragraph** described Webhook / Feature Visibility / permission routes as tenant-configurable menu items; they are registered routes not shown in the settings menu (reachable by URL only), on every tenant.

## Findings for the product team (run 7)

- **entity-applet is largely dead UI.** Four edit tabs (Entity Category, Login, Credit Term, Credit Limit) and all three settings screens do nothing; the Login tab is actively misleading (shows another entity's logins). The sibling applets cover every feature. Recommend either removing the dead tabs/screens or retiring the applet (question 20).
- **Payment Config bank list** is a hard-coded list of Malaysian banks with typos ("AGRROBANK", "HSBS BANK MALAYSIA") and UOB mapped to the CITYBANK value — the stored `bank_name` for UOB is wrong.
- **Login listing "Modified Date" column** is bound to `entity_hdr_guid`.
- **Success toast on delete says "The Supplier has been deleted"** (unreachable — Remove is commented out) — copy-paste residue from the supplier applet.
- **Label code uniqueness is tenant-wide** (`LabelHdrDataConsistencyObject` L56-66 uses `LabelQueryCriteria().withCode()` without a list/type filter): an entity category cannot reuse a code already used by an item category. Worth confirming this is intended.
- **Unseeded permissions (F-0044 pattern):** entity-maintenance-applet has zero rows in `bl_applet_client_side_perm_dfn`; the code checks none, so nothing can be gated per role.

## Cross-lane link requests (run 7)

- content/en/applets/finance/debtor-report-applet.md (finance lane) — the related-applets row "Entity Applet … Customer master data" should link [Customer Maintenance](/applets/master-data/customer-maintenance-applet/) (the customer master); if a link to this page stays, its text is "Entity Maintenance".
- content/en/applets/sales-workflow/commission-scheme-applet.md (lane 1) — "Entity Applet" → "Entity Maintenance"; for employee entities point at Employee Maintenance and for customers at Customer Maintenance.
- content/en/modules-v2/claims/related-applets/_index.md, modules-v2/hr-payroll/configuration/_index.md, modules-v2/hr-payroll/related-applets/_index.md (modules owner) — these describe "Entity Maintenance Applet" as holding employee profiles, job grades and bank details; that is [Employee Maintenance](/applets/master-data/employee-applet/). Re-point the links.
- content/en/modules-v2/purchasing/configuration/_index.md (modules owner) — "Supplier Master Profiles & Payment Terms → Entity Maintenance Applet" should point at the [Supplier applet](/applets/master-data/supplier-applet-1/); Entity Maintenance has no credit/payment terms that save.
- content/en/applets/master-data/customer-maintenance-applet.md (lane 4, done) — no change needed; its sibling row already says "the Entity applet edits any type". Consider adding a clause "but its category, login and credit tabs do not save" when next touched.
- content/en/applets/master-data/supplier-applet-1.md and merchant-applet.md (lane 4, queued) — will add `entity-applet` to `related_applets` and note that Supplier Category / Customer Category trees can also be maintained from Entity Maintenance when reached.
- content/en/applets/master-data/cashbook-applet.md (lane 4, done) — add `entity-applet` to `related_applets`: settlement methods are the Payment Type list on entity Payment Config (same as the customer/employee applets). Will do when the cashbook page is next touched; not edited this run to keep the change set to one page.

## Registry / naming mismatches (run 7)

- **entity-maintenance-applet `documentation_url`** is `https://bigledger.atlassian.net/wiki/spaces/AKAUN/pages/3406929429/Entity+Maintenance+Applet` (Confluence), not a wiki.bigledger.com URL. The wiki page is `/applets/master-data/entity-applet/`. Registry update needed (Vincent / product) — the wiki cannot fix this with an alias.
- The applet's own `EntityConstants.appletMainRouter` says `applets/wavelet/erp/entity-applet` but the routing serves `applets/wavelet/erp/entity/…` (with a redirect from `applets/wavelet/erp/entity`); the constant is unused. Noted only.

## Questions for Vincent (run 7)

20. **Entity Maintenance** — with four dead tabs and no working settings, should the wiki page carry a prominent "use the type-specific applets instead" note (done, as a warning callout), or should the applet be reported for retirement / clean-up? Recommended: report to the applet team; keep the page (the four category trees and Company Linking / Intercompany Branch are genuinely only here for some tenants).
21. **Entity screenshots** — 10 of 12 carry personal data (list above) and one is an AI infographic. Delete from `static/images/entity-applet/` now, or keep unreferenced until replacements are captured? Recommended: delete.
22. **Registry documentation_url for entity-maintenance-applet** points at Confluence — update it to the wiki URL?

## Notes (run 7)

- Settings classification for this applet: *applet-local* components exist (`FieldConfigurationComponent`, `DefaultSettingsComponent`, `PersonalDefaultSettingsComponent`) but none is wired; the shared blg-shared-utilities screen is not used. The four-proof test therefore documents zero settings. Per standard §4 the page carries the "No exposed control found … checked at commit 71162733" sentence plus a table explaining what the visible-but-dead screens do, so readers stop looking for permissions.
- The "dead tab" verdicts rest on: no reducer for `itemCategory` (grep of reducers + actions), `onSave()` bodies of credit-terms / credit-limits, the hard-coded guid and unpatched `entity_hdr_guid` in the login components, and `onSave()` of entity-edit not touching `CURRENCY`. Each is cited on the page.
- Pace: ~70 minutes for one medium master-data applet (11 edit tabs, 4 category modules, 6 backend validators, 12 screenshots). Stopping before forex-applet rather than starting a second applet with reduced care.

---

# Lane 4 — run 8 (2026-09-05)

Resumed from the queue. One page rewritten (master-data/forex-applet.md). Skipped stay skipped: customer-applet.md (F-0050), delivery-installation-applet-V2-applet.md (F-0082 / run 5). Queue: 26 left, next master-data/group-maintenance-V2-applet.md.

## Pages completed (run 8)

- content/en/applets/master-data/forex-applet.md — rewritten to the standard. Registry `forexApplet` "Forex Applet" (title unchanged). Repo commit aa5850e (2026-09-02); blg-shared-utilities af523eb (2026-09-03); backend 871dbf5c96. The old page (1,091 lines) was almost entirely invented — "automated rate feeds", "revaluation processing", "realized/unrealized gain-loss engine", "multi-currency reporting", "Settings > Base Currency / Forex Accounts / Revaluation" — none of which exists in the applet. Replaced with what the code does: currency pairs + dated sell/buy/mid rows + a reference chart.

## Screenshots with personal data (run 8)

None — the page had no images and `static/images/` has no forex folder.

## Direction / fact reversals found (run 8)

- **forex-applet: the whole feature list was fiction.** No rate feed configuration, no revaluation, no gain/loss calculation, no base-currency setting, no "Forex Accounts" screen, no multi-currency reports. The applet writes two tables (`bl_fi_forex_data_source_hdr`, `_history`) and reads a third-party feed from the browser.
- **forex-applet: "Settings" screens documented as working are dead.** Field Settings is a static template; Default Selection / Personal Default Selection never receive an applet container (a change throws) and emit a `save` nobody handles. Same pattern as entity-applet (run 7).
- **forex-applet: headers cannot be edited.** No update action; the View tab's editable-looking Name/Descriptions persist nothing. Delete is a soft delete and does not cascade to history rows.
- **Documents do not read the rate for the document date.** The shared drop-down takes the newest history row (`orderBy date_txn desc, limit 1`), sell rate for purchase (`isSales=false`), buy rate for sales — and never stores `forex_source_history_guid`. Old prose on several document pages says "rate comes from the source" as if it were date-aware.

## Findings for the product team (run 8)

- **Third-party market-data API key is compiled into the front end** (forex applet `finance-service.service.ts` and blg-shared-utilities `services/forex.service.ts`), shared by every tenant on a free tier, and called directly from the browser. The wiki says "shared key, free tier, rate-limited" without printing it. Recommend moving the call behind the backend and making the provider/key a tenant setting.
- **Forex Live queries the provider's equity `TIME_SERIES_DAILY` with `MYRUSD`-style concatenated symbols** rather than its FX daily function; in our reading the chart cannot populate for currency pairs. `onChange`/`onKeyup` reference `chartData[1]` which does not exist.
- **View "Details" binds `resolve.descriptions`** (column is `description`) — Descriptions always blank on view.
- **No uniqueness on data-source `code`** (no DCO check, plain index) while the document drop-down shows only the code.
- **`gen-doc-simplified-ui` passes `isSales=false` on its "Sales Forex Source" slot** (L876–L886) — sales documents built on the simplified UI would take the sell rate.
- **`HIDE_FOREX_HISTORY`** is rendered (Sales Invoice only) and persisted but nothing reads it.
- **`bl_fi_forex_data_source_config`** has a full controller, listing endpoint and DCO but no UI writes it.
- **Dead settings screens + 50-key unread `AppletSettings` model** — copy of a document-applet template; recommend removing Field Settings / Default Selection from the menu.
- **Unseeded permissions (F-0044 pattern):** forexApplet has zero rows in `bl_applet_client_side_perm_dfn`; the applet checks none.

## Cross-lane link requests (run 8)

- content/en/applets/purchase-workflow/internal-purchase-order-applet.md, internal-purchase-credit-note-applet.md, internal-purchase-grn-applet.md, internal-purchase-grn-stock-in-applet.md, internal-purchase-debit-note-applet.md, internal-purchase-return-applet.md, internal-purchase-invoice-no-stock-in-applet.md (lane 2) and content/en/applets/finance/internal-purchase-invoice-applet.md (finance lane) — add `forex-applet` to `related_applets` where missing; in the `SHOW_FOREX_DATA_SOURCE` row say: "lists Forex data sources whose base = document base currency; on select sets currency = source foreign currency and copies the **newest** history row's **sell rate**; no date matching; `forex_source_history_guid` is never set". The debit-note page's "Replace the free currency / rate pair with a forex-source selector" is right; add "the rate box stays (locked only by `CANNOT_EDIT_CURRENCY_RATE`)".
- content/en/applets/sales-workflow/internal-sales-invoice-applet.md (lane 1) — add `forex-applet` to `related_applets`; `SHOW_FOREX_DATA_SOURCE` copies the newest history row's **buy rate**; note `HIDE_FOREX_HISTORY` (rendered + persisted for this applet only, no consumer found at commit efcad942) as "rendered but not consumed".
- content/en/applets/sales-workflow/internal-sales-quotation-applet.md (lane 1) — its `SHOW_FOREX_DATA_SOURCE` row says "Shows where the exchange rate came from / extra label next to the rate"; the shared control is a selector that sets currency and rate, not a label. Re-check against that applet's template.
- content/en/applets/finance/internal-receipt-voucher-applet.md (finance lane) — the v2 receipt voucher repos embed the forex drop-down with `isSales=true` (buy rate); add `forex-applet` to `related_applets` and a Configuration row if the page covers v2.
- content/en/applets/claims/claim-applet.md (claims lane) — already links here (good). Its stated default **true** for `SHOW_FOREX_DATA_SOURCE` differs from the shared screen's `?? false`; confirm the claim applet has a local settings screen with its own null-patch. Add: "the backend rejects a claim line whose `forex_source_hdr_guid` no longer exists (`ClaimDocumentLineDataConsistencyObject` L153–L159) — deleting a pair in the Forex applet breaks such lines".
- content/en/applets/master-data/organisation-applet.md (lane 4, queued) — will add `forex-applet` to `related_applets` (company base currency = the drop-down filter) when reached.
- content/en/applets/master-data/chart-of-account-applet.md (lane 4, done) — add `forex-applet` to `related_applets` next time it is touched (FOREX_GAIN / FOREX_LOSS default GL codes).
- content/en/applets/finance/ledger-and-journal-applet.md (finance lane) — add `forex-applet` to `related_applets` next to the *Missing Journal Forex Gain Loss* check.
- content/en/applets-workflows.md (site owner) — the "Forex Applet - Multi-currency operations and exchange rate management" blurb is fine; the registry `documentation_url` points at this anchor, see mismatches.

## Registry / naming mismatches (run 8)

- **forexApplet `documentation_url`** is `https://wiki.bigledger.com/applets-workflows/#-forex-applets` — an anchor on the catalogue page, not the applet page `/applets/master-data/forex-applet/`. An alias cannot fix an anchor; the registry should be updated to the applet page URL.
- Registry name "Forex Applet" already matched the page title; no alias needed.

## Questions for Vincent (run 8)

23. **Third-party API key in the front-end source** (forex applet and shared utilities) — report to the platform team as a security/ops item? The wiki describes the mechanism without the key. Recommended: yes, and ask for a backend proxy + tenant setting.
24. **Newest-row rate semantics** — should the wiki simply document "newest row wins" (done), or should this be raised as a product change request (pick the row on/before the document date)? Recommended: raise; back-dated foreign-currency invoices are common at month-end.
25. **Dead settings screens in Forex** (same pattern as Entity Maintenance, q.20) — same recommendation: report for clean-up, keep the page.

## Notes (run 8)

- Settings classification: *applet-local* components exist but none is wired; the four-proof test documents zero settings for this applet. The page therefore carries the standard's "No exposed control found … checked at commit aa5850e" sentence, a table explaining the dead screens, and — because the applet's usefulness is entirely decided by settings in *other* applets — a separate "Settings in other applets that control this applet's use" table (`SHOW_FOREX_DATA_SOURCE`, `CANNOT_EDIT_CURRENCY_RATE`, `HIDE_FOREX_HISTORY`) with the shared-screen line citations. Standard §4 does not have a slot for this; suggest adding "settings elsewhere that gate this applet" as an optional sub-section for master-data applets.
- The consumer list was verified per repo (PO, SI, PI, PI-no-stock-in, GRN, GRN stock-in, PCN, RV v2, claims) rather than from a single repo-wide grep, which timed out.
- Lateral pass: 12 issues read, 12 `lateral` lines in the ledger record.
- Pace: ~65 minutes for one small master-data applet with a large downstream (nine consumer applets checked, backend delete semantics traced, shared drop-down read). Stopping before group-maintenance-V2-applet rather than starting a second applet with reduced care.

## Pages completed (run 9 → verified and recorded in run 10)

- content/en/applets/inventory-workflow/internal-consignment-gin-applet.md — rewritten to the standard in run 9 (committed by the loop as 9ecab61d before the run was killed; ledger, topic and state were not recorded). Run 10 re-verified every load-bearing claim against backend 871dbf5c96, repo 04acb95 and blg-shared-utilities: signums −1 qty / +1 amt (`InternalPurchaseConsignmentGinDataConsistencyObject` L15–L17, `ServerDocTypes` L40); the GIN is **not** in `isConsignmentStockIn` and falls back to the generic `PURCHASE` handler (`JournalPostingService` L64–L81); `validate_stock_balance` defaults to `true` (`GenericDocumentService` L390–L392); the shared field-configuration screen has no branch for `internalConsignmentGINApplet` (0 hits in html/ts); `SHOW_DOCUMENT_DELETE_BUTTON` read from the extension without a model key (edit ts L104–L112); Default Selection dead (`appletContainer` never bound). Nothing short of the standard; ledger record (8 issues, 8 lateral lines), `kb/topics/internal-consignment-gin-applet.md` and state.json written in run 10. Registry `internalConsignmentGINApplet` "Consignment GIN Applet (Internal)" — title unchanged.

## Screenshots with personal data (run 9/10)

Every file under `static/images/internal-consignment-gin-applet/` was opened. Dropped from the page as a precaution (same rule as run 6): `main-listing.png` and `create-edit-form.png` — staging-tenant listing whose Purchaser / Supplier / Branch cells carry what look like tester first-name fragments and a branch label that may be a real store name. Kept: `line-items.png`, `settings-page.png` (test item codes only). Not referenced: `internal-consignment-gin-overview-infographic.png` (AI infographic).

## Direction / fact reversals found (run 9/10)

- **internal-consignment-gin-applet: the GIN does not post to the consignment accounts.** The old page (and the consignment guide) imply GRN/GIN are symmetric. Backend: GRN and Return are in the consignment list and post `CONSIGNMENT_LIABILITY` / `CONSIGNMENT_STOCK`; the GIN is not, so if the company runs the journal processor for it the journal is Cr Purchase / Dr Creditor via the generic PURCHASE handler. Guide needs the same correction.
- **No VOID on the GIN.** The old page described VOID; the code has no VOID action — the only reversal is a compensating Consignment GRN.
- **Knock-off tabs on the GIN are commented out** — a consignment GIN is always keyed from the item master; the old page listed KO paths.

## Findings for the product team (run 9/10)

- `INTERNAL_PURCHASE_CONSIGNMENT_GIN` missing from `isConsignmentStockIn` (`JournalPostingService` L64–L66) while GRN and RETURN are present — likely oversight; a posted GIN credits Purchase and debits Creditor for stock that was never invoiced.
- FINAL error handler passes two arguments to `String.includes()` (`internal-consignment-gin.effects.ts` L544); harmless today because later clauses catch the serial codes.
- `HIDE_CURRENCY` is read by the GIN's Main Details but the shared screen's toggle is fenced to other applet codes (shared html L1775, L6136) — matches a customer UAT complaint that Currency (and Credit Terms) cannot be hidden on this applet.
- Default Selection / Personal Default Selection dead (same pattern as Entity, Forex).
- 0 rows in `bl_applet_client_side_perm_dfn` for `internalConsignmentGINApplet`; ~21 `SHOW_*` codes checked in code (F-0044 pattern).

## Cross-lane link requests (run 9/10)

- content/en/guides/purchasing-guides/consignment-purchasing.md (guides owner) — say: GIN has no knock-off, no VOID (reverse with a GRN); a posted GIN hits ordinary creditor / purchase accounts, not the consignment accounts; the item must carry the Consignment Item flag.
- content/en/applets/purchase-workflow/internal-consignment-return-applet.md, internal-consignment-purchase-order-applet.md, internal-consignor-purchase-billing-applet.md (lane 2) and content/en/applets/sales-workflow/internal-consignment-billing-applet.md (lane 1) — add `internal-consignment-gin-applet` to `related_applets`; the Return page should state it posts via `PURCHASE_CONSIGNMENT` (in the consignment list) whereas the GIN does not.
- content/en/applets/finance/creditor-report-applet.md, debtor-and-creditor-report-applet.md (finance lane) — add `internal-consignment-gin-applet` to `related_applets` (selectable for contra; excluded from the debtor side).
- content/en/applets/master-data/doc-item-maintenance-applet.md, supplier-applet-1.md, employee-applet.md, organisation-applet.md, tax-configuration-applet.md, chart-of-account-applet.md (lane 4) — add `internal-consignment-gin-applet` to `related_applets` when next touched.

## Registry / naming mismatches (run 9/10)

- **Group Maintenance (three pages: master-data/group-maintenance-applet.md, group-maintenance-V2-applet.md, installation-of-group-maintenance-applet.md)** — no ACTIVE registry row under any plausible name: `GroupApplet` "Groups" (ROOT-USER) and `newTeamMaintenanceApplet` "Team Maintenance" (TNT-APPLET) are both DELETED. Per ADR-0002 the three pages were not rewritten (skipped in state.json, run 9). Decision needed: delete/redirect the pages, or confirm a live applet code that replaced them.
- `internalConsignmentGINApplet` name matched the page title; no alias needed.

## Notes (run 9/10)

- Run 10 spent its first ~20 minutes re-verifying run 9's page rather than trusting it; every cited line held. Lateral pass: 8 issues, 8 lines (two customer-repo UAT threads read for anonymised patterns — the useful ones are the hide-setting gaps on the GRN and the 'add item does nothing' GRN bug, both to check on the GRN page next).

## Pages completed (run 10)

- content/en/applets/inventory-workflow/internal-consignment-grn-applet.md — rewritten to the standard. Registry `internalconsignmentGRNApplet` "Consignment GRN Applet (Internal)" (title unchanged; note the lower-case `c` in the code). Repo commit 67e355a (2026-08-27, Angular 14); blg-shared-utilities af523eb; backend 871dbf5c96. The old page was a generic user-guide draft (roles, FAQ, glossary) with no settings, no signums and a journal description symmetric with the GIN; replaced with the four-proof Configuration section (67 shared-screen toggles from the scan + 9 tab hides the scan misses + the delete button + applet-local Default Selection / Custom Status / Printable), the posting proof block and a VOID section.
- content/en/applets/inventory-workflow/internal-consignment-gin-applet.md — **corrected** (see reversals): the Payment / Department Hdr / Doc Link / Export tab toggles are not rendered for the live applet code.

## Screenshots with personal data (run 10)

Every file under `static/images/internal-consignment-grn-applet/` was opened. Dropped from the page as a precaution: `1.png` (branch / location codes that look like a real company abbreviation), `1.3.png` and `3.png` (item names carrying what looks like a tester's first name and a real product brand). Kept: `1.2.png` (Lines tab, no data). Not referenced: `internal-consignment-grn-overview.png` (4.6 MB AI infographic). Replacements should be captured from a GadgetSphere-seeded tenant.

## Direction / fact reversals found (run 10)

- **internal-consignment-gin-applet (our own run-9 page): the shared settings screen's tab map is keyed by the dev-only applet code.** The platform shell stores the registry code (`applet-loader.component.ts` L195: `sessionStorage.setItem('appletCode', applet_code)`); the shared `FieldConfigurationComponent.getTabValue()` map has `'internal-consignment-gin-applet'` (what the GIN's `main.ts` sets in non-production builds) but not `internalConsignmentGINApplet`. Result: on a live tenant the Payment, Department Hdr, Doc Link and Export tab toggles never render for the GIN (their sections are gated by `showPaymentTab` etc., default false). The run-9 page listed them as rendered; fixed in run 10 (moved to "read without control", troubleshooting row added). This is exactly the customer UAT complaint recorded in the lateral pass. The GRN's entry (`internalconsignmentGRNApplet`) matches the registry, so the GRN is unaffected.
- **internal-consignment-grn-applet: journal is NOT symmetric with the GIN.** GRN → `PURCHASE_CONSIGNMENT` handler (Dr CONSIGNMENT_STOCK / Cr CONSIGNMENT_LIABILITY, supplier AR/AP type ignored, line GL code ignored); GIN → generic PURCHASE handler. The guide must say so.
- **internal-consignment-grn-applet: VOID exists but only from the listing** — the edit form's VOID button is commented out; the old page implied both.
- **Stock-balance validation cannot fail for a receipt** — the check only errors when the remaining balance would go negative; the old page's "FINAL validates stock" is meaningless for the GRN.

## Findings for the product team (run 10)

- **Shared settings tab map keyed by dev-only applet codes.** `getTabValue()` in blg-shared-utilities keys `'internal-consignment-gin-applet'`; the registry / shell code is `internalConsignmentGINApplet`. Other entries look suspicious for the same reason (e.g. `'internal-purchase-grn-applet'` vs registry `internalPurchaseGRNApplet` — both exist, so someone already noticed once). Recommend keying the map by registry code only and adding the GIN's.
- `SORT_ORDER` is rendered as a free-text "Sorting Order" box and used verbatim as the listing's `orderBy` column — a typo silently breaks the listing query.
- `ENABLE_AUTO_POPUP` prints the GRN through `INTERNAL_PURCHASE_ORDER_PRINT_SERVICE` (edit ts L319).
- `ENABLE_CUSTOM_STATUS_LINE_n` / `NAME_/LIST_CUSTOM_STATUS_LINE_n` are saved by the Custom Status screen but nothing in the applet reads them.
- `SHOW_VOID_BUTTON` is declared in the settings model but is used as a client-side permission code (and is not seeded).
- Only 2 of ~42 client-side permission codes checked by the GRN are seeded (`SHOW_TRANSACTION_DATE`, `HIDE_RETIRE_APPLET`); the seeded `SHOW_TRANSACTION_DATE` means every role without it cannot change the transaction date — worth stating in the consignment guide.
- Both consignment applets' FINAL error handlers call `String.includes(a, b)` with two arguments (GRN effects L1406, GIN effects L544).
- A consignment GRN at RM 0 dilutes the item's moving-average cost (MA_WA list includes CSGGRN); product decision whether zero-priced consignment receipts should be excluded from the pool.

## Cross-lane link requests (run 10)

- content/en/guides/purchasing-guides/consignment-purchasing.md (guides owner) — GRN journal = Dr Consignment Stock / Cr Consignment Liability, no creditor; the supplier's AR/AP type does not matter; CONSIGNMENT_STOCK and CONSIGNMENT_LIABILITY default GL codes are the prerequisite; VOID from the listing only and blocked once billed; back-dating needs the `SHOW_TRANSACTION_DATE` permission; KO tabs depend on the company document-flow configuration.
- content/en/applets/purchase-workflow/internal-consignment-purchase-order-applet.md (lane 2) — add `internal-consignment-grn-applet` to `related_applets`; say its open lines are consumed by the GRN's KO For tab (`line_open_queue` CSGPO → CSGGRN) and reopened when the GRN is voided.
- content/en/applets/purchase-workflow/internal-consignment-return-applet.md (lane 2) — add `internal-consignment-grn-applet`; it shares the `isConsignmentStockIn` branch (line GL ignored, `PNS_RETURN` → CONSIGNMENT_STOCK).
- content/en/applets/purchase-workflow/internal-purchase-grn-stock-in-applet.md (lane 2) — its journal also runs through the `isConsignmentStockIn` branch (`JournalPostingService` L64–L66, L139): line GL code ignored, `resolveArap` skipped; check that page's GL-precedence row.
- content/en/applets/purchase-workflow/internal-purchase-requisition-applet.md and content/en/applets/finance/internal-purchase-invoice-applet.md (lane 2 / finance lane) — add `internal-consignment-grn-applet` as an optional KO target (line-level flow).
- content/en/applets/sales-workflow/internal-consignment-billing-applet.md (lane 1) and purchase-workflow/internal-consignor-purchase-billing-applet.md (lane 2) — add `internal-consignment-grn-applet`; state that billing knocks off the GRN and thereby blocks its VOID (`GENERIC_DOCUMENT_HAS_TARGET_LINKS`).
- content/en/applets/finance/creditor-report-applet.md (finance lane) — add `internal-consignment-grn-applet`.
- content/en/applets/master-data/chart-of-account-applet.md (lane 4, done) — add CONSIGNMENT_STOCK / CONSIGNMENT_LIABILITY to the default-GL-code list and `internal-consignment-grn-applet` to `related_applets` next time it is touched.
- content/en/applets/master-data/organisation-applet.md (lane 4, queued) — document the document-flow configuration (`bl_fi_comp_gendoc_flow_config`) and the branch `MAIN_LOCATION` extension when reached.
- content/en/applets/master-data/doc-item-maintenance-applet.md, supplier-applet-1.md, employee-applet.md, tax-configuration-applet.md, inventory-workflow/stock-balance-applet.md, stock-report-applet.md (lane 4) — add `internal-consignment-grn-applet` to `related_applets` when next touched.

## Registry / naming mismatches (run 10)

- **internalconsignmentGRNApplet `documentation_url`** points at a Confluence page (`bigledger.atlassian.net/.../Internal+Consignment+GRN+Applet`), not the wiki; should be updated to `/applets/inventory-workflow/internal-consignment-grn-applet/`.
- Registry name "Consignment GRN Applet (Internal)" already matched the page title; no alias needed.

## Questions for Vincent (run 10)

26. **Shared tab map keyed by dev-only codes** (GIN affected; other applets may be) — report to the platform team as a bug, or document per applet as we go? Recommended: report; the wiki now states the consequence on the GIN page.
27. **Screenshot replacements for the consignment pair** — five of the nine images were dropped for privacy; capture new ones from the GadgetSphere staging tenant, or leave the pages with one/two images each? Recommended: capture (listing + create form + Lines tab for each).

## Notes (run 10)

- Settings classification for the GRN: *shared* screen (with a matching tab-map entry — the first applet in this lane where the map matches the live code), *applet-local* Default Selection that actually saves (unlike GIN / Entity / Forex), *applet-local* Custom Status, *personal* defaults. The scan tool's "67 toggles" misses every tab-hide toggle gated by a `show*Tab` flag; for shared-family applets add the tab map entry's sections by hand (METHOD.md item 7/8 should mention `getTabValue()`).
- Lateral pass: 12 issues, 12 `lateral` lines in the GRN record; the GIN record was amended in place (same run, not yet committed) with the corrected hash and note.
- Pace: ~80 minutes for the GRN (large document applet: 80-key model, KO, VOID, custom status, intercompany tab) after ~25 minutes verifying and correcting the GIN. Stopping before internal-goods-dispatch-note-applet rather than starting a third document applet with reduced care.

## Pages completed (run 11)

- content/en/applets/inventory-workflow/internal-goods-delivery-note-applet.md — **new file**, rewritten to the standard under the registry name `InternalGoodsDeliveryNote` "Goods Delivery Note (Internal)". The former content/en/applets/inventory-workflow/internal-goods-dispatch-note-applet.md ("Goods Dispatch Note (Internal) Applet", a generic AI draft with invented vehicle/courier fields and a "Settings" section that does not exist) was **deleted** and its URL kept as `aliases: [/applets/inventory-workflow/internal-goods-dispatch-note-applet/]`. Repo commit 0f242a9 (2026-04-06, Angular 14); blg-shared-utilities af523eb; backend 871dbf5c96. No screenshots exist for this applet (none in static/images either); none were invented.

## Direction / fact reversals found (run 11)

- **The old page described the wrong document and invented its content.** It called the applet a "gate pass" capturing transport provider, vehicle number and driver; none of those fields exist. The real form is a customer delivery note cloned from the Sales Credit Note applet (customer, sales agent, member card, credit terms, lines, Settlement / Contra tabs). The old FAQ said "creating a GDN may reduce inventory depending on configuration" — it never does (quantity signum 0, inventory processor skips every line), and "GDNs are immutable after finalization" — the SAVE button stays enabled after FINAL and the backend delete has no FINAL guard (only the UI hides the button).
- **"Goods Dispatch Note" is not a misnaming but a second, unregistered artefact.** Backend has both `INTERNAL_GOODS_DISPATCH_NOTE` (`GDSPNT`) and `INTERNAL_GOODS_DELIVERY_NOTE` (`GDLYNT`) with separate DCOs and REST paths, and two near-identical repos exist. Only the Delivery Note has a registry row (its `es_module_url` points at the delivery-note build). The wiki now documents the registered one and states in a callout that the dispatch variant cannot be installed.

## Findings for the product team (run 11)

- **Third applet in this lane with no `getTabValue()` entry** (after consignment GIN): `InternalGoodsDeliveryNote` renders none of the Payment / KO / Delivery Details / Department Hdr / ARAP / Trace / Doc Link / Export tab toggles. Same root cause as run 10 (map keyed by dev-only codes; this applet's dev code `internal-goods-delivery-note-applet` is not in the map either).
- **Journal-posting job fails on every FINAL Goods Delivery Note.** The `JOURNAL_POSTING_JOB_PROCESSOR` subscriber of the generic-document primary queue has no `serverDocTypes` constraint (akaun_master), so it runs for signum-0 document types and throws `NO_JOURNAL_CREATED` (JournalPostingService L580) because no journal line is built. Presumably the same for Sales Order, Sales Quotation, Jobsheet and Outbound DO. Either constrain the subscriber or short-circuit on all-zero amount signum before `createJournalContainer`.
- **Member Card is `Validators.required` on the delivery-note Main tab** (main-details.component.ts L58) and CREATE is disabled while the form is invalid — a leftover from the credit-note clone that forces a member card on every delivery. Verify on a tenant; if confirmed, relax the validator.
- **Default Selection (applet and personal) is dead code** — same pattern as GIN / Entity / Forex: no load subscription, `save` output unhandled, keys read by nothing; changing a value throws on the undefined container.
- **116 of 138 rendered Application Settings controls are never read by this applet** (only the 22 line-level `HIDE_*` keys, `HIDE_COSTING_DETAILS`, `PRINTABLE`, `SHOW_DOCUMENT_DELETE_BUTTON`). `SHOW_LAST_PURCHASE_PRICE` is seeded as a client-side permission but checked by nothing.
- Cosmetic clone leftovers: toast "Sales CreditNote created successfully"; Purchase Requisition / Quotation / Order / Invoice No. fields on the line form; Settlement and Contra tabs on a document with no ARAP; print service code `CP_COMMERCE_INTERNAL_SALES_ORDERS_JASPER_PRINT_SERVICE`.
- The two repos (delivery vs dispatch note) are diverging: the dispatch copy received i18n and SubQueryService removal (2026-07) that the registered delivery-note repo did not.
- Registry `documentation_url` for `InternalGoodsDeliveryNote` points at Confluence; should become `/applets/inventory-workflow/internal-goods-delivery-note-applet/`.

## Cross-lane link requests (run 11)

- content/en/applets/sales-workflow/internal-sales-order-applet.md, internal-jobsheet-applet.md, internal-outbound-delivery-order-applet.md (lane 1) — add `internal-goods-delivery-note-applet` to `related_applets`; say their open lines are consumed by the Goods Delivery Note's KO For tabs, and that this requires an enabled source → `INTERNAL_GOODS_DELIVERY_NOTE` row in the company Knock Off Configuration. Also worth checking there: the same `NO_JOURNAL_CREATED` job failure on FINAL for these signum-0 types.
- content/en/applets/sales-workflow/internal-delivery-order-applet.md and internal-sales-gin-stock-out-applet.md (lane 1) — add `internal-goods-delivery-note-applet`; "the delivery note is the customer-facing paper; this document moves the stock".
- content/en/applets/membership/membership-admin-applet.md (membership lane) — add `internal-goods-delivery-note-applet`; the delivery-note form requires a member card.
- content/en/guides/sales-guides/standard-sales-workflow.md and partial-delivery-workflow.md (guides owner) — mention the Goods Delivery Note as the customer delivery record that does not move stock and knocks off the order; the guides currently do not cover it (`guides: []` on the page).
- Within lane 4 (later pages): organisation-applet.md — document Knock Off Configuration rows incl. `INTERNAL_GOODS_DELIVERY_NOTE`; customer-maintenance-applet.md, employee-applet.md, doc-item-maintenance-applet.md, tax-configuration-applet.md, warehouse-management-applet.md — add `internal-goods-delivery-note-applet` to `related_applets` when next touched.

## Registry / naming mismatches (run 11)

- **Renamed page.** `internal-goods-dispatch-note-applet.md` → `internal-goods-delivery-note-applet.md`; title "Goods Dispatch Note (Internal) Applet" → "Goods Delivery Note (Internal)" (registry name). Alias `/applets/inventory-workflow/internal-goods-dispatch-note-applet/` added so the old URL (and wiki issue #70's slug) keeps resolving. Nav label changes accordingly. No other content page linked to the old slug.
- **No registry row for the Goods Dispatch Note** (`INTERNAL_GOODS_DISPATCH_NOTE`, repo blg-applet-wavelet-internal-goods-dispatch-note-applet, last commit 2026-07-28) — not ACTIVE, not DELETED, simply absent. Per ADR-0002 it gets no page. Decision needed: register it (then it needs its own page) or archive the repo.
- Wiki issue #69 `[internal-goods-delivery-note-applet] User Guide Documentation` (open) is satisfied by this page; can be closed on deploy.

## Questions for Vincent (run 11)

28. **Goods Dispatch Note** — register it as an applet (it is being maintained) or archive the repo? Until decided the wiki says it cannot be installed.
29. **Member Card required on the delivery note** — confirm on a tenant; if it really blocks CREATE for non-member customers, file it as a bug rather than documenting it as intended behaviour.
30. **Journal job failure on signum-0 documents** — should the wiki keep saying "expected, ignore" (as this page does), or is there a job-queue screen where users see these failures and need guidance?

## Notes (run 11)

- Settings classification: *shared* screen (no tab-map entry), *applet-local* Default Selection (dead), *applet-local* Printable Format Settings (works, writes `PRINTABLE`), *personal* Default Selection (dead). The scan's 148 → 138 after removing the ten tab-gated toggles; a depth-aware parse of the shared template (tracking `*ngIf="show…Tab"` element extents and both `formControlName` and `controls['X']` bindings) was needed because the tab-gated sections bind controls differently from the rest — worth folding into `applet-scan.sh`.
- Consumption check done by grepping every model key across the applet's ts/html (excluding the model file) and by resolving every `<app-…>` / `<blg-…>` selector used in the templates to its component (shared or local) and grepping those for setting keys — none of the shared components used here read settings.
- Backend proof chain for "no posting" needed four hops: DCO signums → JournalPostingService fallback + line skip + NO_JOURNAL_CREATED → InventoryTransactionLineProcessorService filters → subscriber constraints in akaun_master. Recording it in METHOD.md would save the next lane the hour.
- Lateral pass: 7 issues, 7 `lateral` lines in the ledger record.
- Pace: ~95 minutes on one page because the registry/naming question, the two-repo comparison and the posting proof for a signum-0 document all had to be settled from scratch. Stopping here rather than starting internal-inbound-delivery-order-applet with reduced care.

# Run 12 (2026-09-05)

## Pages

- content/en/applets/inventory-workflow/internal-stock-requisition-applet.md — rewritten to the standard. Registry `internalStockRequisitionApplet` "Stock Requisition Applet(Internal)" (title changed from "Stock Requisition (Internal) Applet" to the registry spelling, no space before the parenthesis); the registry `documentation_url` already points at this page. Repo commit ef3b07b (2026-08-11); blg-shared-utilities af523eb (2026-09-03); backend 871dbf5c96 (2026-09-04). No screenshots exist for this applet (the old page had none; `static/images/` has no requisition folder) — a capture set from a GadgetSphere-seeded tenant is needed: listing, Details, Line, KO For › Purchase GRN, view with CREATE ST, Application Settings, Approval Settings, Branch Designation, Spreadsheet View configuration.
- content/en/applets/inventory-workflow/internal-inbound-delivery-order-applet.md — **skipped** (see mismatches).

## Registry / naming mismatches (run 12)

- **Inbound Delivery Order (Internal) — no registry row.** Live `bl_applet_hdr` (2026-09-05) has no row whose code or name contains "inbound"; the six "delivery order" rows are `InternalDeliveryApplet` (the sales-workflow Delivery Order), `driverDeliveryOrderApplet`, `supplierDeliveryOrderApplet`, and three CORE1-revision placeholders ("Buyer - Delivery Order", "Supplier - Delivery Order", "Transporter Outbound Delivery Order") whose `property_json` carries a customer project name and a router link into that customer's own app — customer-specific, not this repo, and absent from `applet-exclusions.tsv` (they should be added). The backend does know the type: `INTERNAL_INBOUND_DELIVERY_ORDER`, short code `IBDODR`, DCO signums 0/0, four `TNT_API_DOC_INTERNAL_INBOUND_DELIVERY_ORDER_*` permissions, handler path `internal-inbound-delivery-orders`; the repo `blg-applet-wavelet-internal-inbound-delivery-order-applet` (route `applet/tnt/wavelet/erp/internal-inbound-delivery-order-applet`, last commit cec920e 2026-07-30) is maintained and its create screen searches Intercompany Sales Invoices. Same situation as the Goods Dispatch Note (run 11): a working code base with no installable applet. Per ADR-0002 the page was not enhanced; the existing page stays as is. Wiki issue #71 (closed) tracked a user guide for it.
- `applet-exclusions.tsv` should gain the three placeholder rows above (`Buyer - Delivery Order`, `Supplier - Delivery Order`, `Transporter- Delivery Order`, reason customer-specific) so no lane tries to document them.

## Cross-lane link requests (run 12)

- content/en/applets/purchase-workflow/internal-purchase-grn-applet.md (purchase lane) — add `internal-stock-requisition-applet` to `related_applets`; say a Stock Requisition can knock off GRN lines through its *KO For › Purchase GRN* tab, which needs the company Knock Off Configuration row *Purchase GRN → Stock Requisition* (open-queue types `INTERNAL_PURCHASE_GOODS_RECEIVED_NOTE` → `INTERNAL_STOCK_REQUISITION`).
- content/en/applets/purchase-workflow/internal-purchase-requisition-applet.md (purchase lane) — the shared tab map gives `internal_purchase_requisition` a `showGenericDocApprovalTab`; the backend approval submission service (`GenericDocApprovalController`) may be wired there. Worth stating on that page whether approval is enforced, because the Stock Requisition page now says it is not for stock requisitions.
- Lanes 1 and 2 (sales / purchase document applets on the shared Application Settings screen) — the control `SHOW_ITEM_STOCK_BALANCE` is labelled *DISALLOW NEGATIVE STOCK FOR BASIC ITEM (VALIDATE STOCK BALANCE)* on the shared screen. In the Stock Requisition applet it only switches the item search to the stock-balance endpoint. Check what it does per applet before documenting the label as a validation.
- Within lane 4 (later pass): stock-transfer-applet.md — add that **CREATE ST** on a requisition creates an unfinalised TEMP Transfer Out that shows up in the Transfer Out listing with the requisition's lines, locations, tracking id and reference, and cite gh:bigledger/blg-akaun-platform-java#1153 (the Transfer Out's Stock Requisition search grid still lists requisitions already used and lacks location columns). organisation-applet.md — Knock Off Configuration rows for `INTERNAL_STOCK_REQUISITION` as source (→ Outbound Stock Transfer) and as target (Purchase GRN →). employee-applet.md, warehouse-management-applet.md, inv-item-maintenance-applet.md, doc-item-maintenance-applet.md, stock-balance-applet.md, stock-availability-applet.md — add `internal-stock-requisition-applet` to `related_applets` when next touched.

## Direction / fact reversals found (run 12)

- **internal-stock-requisition-applet**: the old page was largely right in outline (DRAFT/FINAL/VOID, KO For Purchase GRN only, CREATE ST creates a draft transfer, FINAL → DRAFT blocked by downstream links). Corrections: the old text called the Line Items quantities "ordered / received / outstanding" without saying the requisition itself never moves stock (now stated with the signum proof); it said settings "availability depends on tenant policy" — replaced with the actual four-proof list; it did not mention the Approval Settings, Branch Designation, Custom Field Placement, Custom Resource Bundle or Spreadsheet View screens at all; its FAQ said access to locations "may be constrained by tenant permission targets" — now the exact two permission definitions are named, including `…_LOCATION_TO_READ_TGT_GUID` for the receiving list. The applet's own constant `quantity_signum = -1` is misleading: the backend overwrites it with 0.
- The upload screen's *File Type* drop-down reads "Stock Adjustment" — a copy-paste leftover; the import is a stock-requisition import.

## Screenshots with personal data (run 12)

None — the page has no images and `static/images/` has no requisition folder.

## Questions for Vincent (run 12)

31. **Inbound Delivery Order (Internal)** — register the applet (the repo and backend type are live) or archive the repo? Until then the wiki page describes something no tenant can install; recommend hiding it (draft: true) or adding the same callout the Goods Delivery Note page carries.
32. **Approval Settings / Branch Designation on the Stock Requisition page** — the page states plainly that the screens store configuration that nothing enforces (backend approval controller not called by the applet; generic-document FINAL path does not read approval settings). Confirm with the developer on the open customer request before this goes live, or should the wiki omit those two screens until they work?
33. **`HIDE_FILE_IMPORT_MENU` has no control for `internalStockRequisitionApplet`** on the shared Application Settings screen although `app.component.ts` reads it — file a bug to add the code to the shared screen's applet list (same pattern as the tab-hide map problem in run 10)?
34. Add the three customer placeholder "… - Delivery Order" rows to `applet-exclusions.tsv`?

## Notes (run 12)

- Settings classification for this applet: *shared* Application Settings (54 model keys + 3 tab toggles + ~20 model-less listing keys), *applet-local* Default Selection (branch/location dead, tab order + language live), Printable Format Settings (writes `PRINTABLE`), Approval Settings, Branch Designation, Spreadsheet View configuration; *shared-fed-by-applet* Custom Field Placement (screen registry in `custom-field-screens.config.ts`) and Custom Resource Bundle Configuration; *personal* Default Selection (orientation live, branch/location dead).
- For METHOD.md: **a configuration screen is not proof of enforcement.** Trace the document's create/FINAL effects and the backend FINAL path for a consumer before describing an approval workflow. Here the approval tables are written by the applet and readable only through a separate backend controller the applet never calls.
- For METHOD.md: the "rendered" proof for model-less keys needs the enclosing-`*ngIf` walk (run 11's parser) run over the *listing's* `showColumns` pairs and the shell's `updateMenuItem` keys as well as the model — 14 of this applet's runtime-read keys have no control for its code and would otherwise have been documented as settings.
- CREATE ST does not depend on the company Knock Off Configuration (it copies lines and creates links directly); only the Stock Transfer applet's *Search Document › Stock Requisition* path needs the queue row. Worth a sentence on the Organisation page when it is rewritten.
- Lateral pass: 35 issues read, 33 `lateral` lines in the ledger record (plus 2 on the skipped record). Three new customer-repo pseudonyms added to kb/private/repo-pseudonyms.tsv.
- Pace: ~85 minutes for one large document applet plus the registry investigation for the skipped page. Stopping here; the next page (introduction-to-stock-take-applet) is a second page for the Stock Take applet and should be assessed against `stock-take-applet.md` (also queued) before either is rewritten.

# Run 13 (2026-09-05)

## Pages

- content/en/applets/inventory-workflow/stock-take-applet.md — rewritten to the standard under the registry name **Stock Take** (`StockTakev2`; title changed from "Stock Take Applet"). Repo `blg-applet-wavelet-stock-take-applet` (monorepo split: `micro-fe/projects/wavelet-erp/applets/stock-take-applet`, shared-utilities submodule; commit 5d08307, 2026-08-12); blg-shared-utilities af523eb; blg-akaun-ts-lib; backend 871dbf5c96 (2026-09-04); Android companion `akn-kotlin-mobile-stocktake` f78be9d. The "Work in progress" callout is gone. Six of the eighteen referenced screenshots kept; see "Screenshots with personal data".
- content/en/applets/inventory-workflow/introduction-to-stock-take-applet.md — **skipped (merged)**. It is a second page for the same registry row: a marketing-style intro ("one-stop solution", "Smart Stocking") with no fact the canonical page lacks, no screenshots, and no inbound links anywhere in content/en. Resolved to `stock-take-applet.md`; the file itself is untouched (skipped stay skipped). Recommend deleting it and adding `/applets/inventory-workflow/introduction-to-stock-take-applet/` to the canonical page's `aliases` — same pattern as F-0050 (Customer) and the delivery-installation V2 page.

## Registry / naming mismatches (run 13)

- **Two ACTIVE rows named "Stock Take".** `StockTakev2` (2021-07-06) has `es_module_url` under the org `wavelet-erp/stock-take-applet` build and custom element `stock-take-elements-` — that is this repo (its `main.ts` dev code is `StockTakev2`, so the dev code matches the registry for once). `DigistockTake` (2025-09-21) points at a customer-specific build and is already in `applet-exclusions.tsv`. Both rows' `documentation_url` is `/applets/stock-take-applet/`, which is the canonical page's alias — correct, no change needed.
- **`stockTakehq` "Stock Take HQ" and `st_staff` "Stock Take Staff"** (both ACTIVE, created 2025-09-21) point at the same customer-specific build prefix as `DigistockTake` (`…-hq-applet`, `…-staff-applet`) and share its `routerLink`. They are **not** in `applet-exclusions.tsv` and have no wiki page. They should be added to the exclusions (customer-specific) — otherwise the applet audit will keep reporting two ACTIVE applets without pages.
- The old page's title "Stock Take Applet" is also the name of the DELETED `stockTakeV2` TNT-USER row; the ACTIVE row's name is plain "Stock Take".

## Direction / fact reversals found (run 13)

- **`STOCK_DURING_OPENING_SHOP` is a backend setting, not a "count timing policy".** The old page said it "allows configuration for count timing policy while the store is operating"; the FAQ told users to "follow your operating policy". In fact no frontend code reads it: `StockTakeSessionHdrService.updateReport` reads it from the applet's stored `APPLET_SETTINGS` when a session is saved CLOSED and picks the variance rule (Min–Max band vs straight EMP comparison) for `status_variance`. If Field Settings were never saved the close throws `Applet Settings Not Found!` after the status has already been committed.
- **`SERIALIZED_ITEM_EXT` does nothing** ("reads serialized behaviour from item extension" on the old page). Both entry screens compute `item_is_serialized` from the item ext and then immediately overwrite it with `sub_item_type === 'SERIAL_NUMBER'`; the toggle is never read.
- **`HIDE_ADD_BUTTON` does more than hide.** It makes the Scan Form add a validated scan automatically; the old page only said it hides the button.
- **Report generation is not gated by session status on the server.** The old page: "Report generation is available only while the session is OPEN". The button is disabled client-side when not OPEN; the backend accepts OPEN, CLOSED and COMPLETED. Conversely the old page's "closing locks operational edits" is UI-only — the record DCOs never look at the parent session's status, and the mobile app / API can write records to a Closed session.
- **`Variance` and `Variance 2` were described correctly**, and the old page's "EMP Quantity = system ending balance" is right; kept. Added what it omitted: the report covers every non-deleted item in the tenant (not just scanned ones — the Report Type filter is a display filter), the opening balance is taken at `date_start` and movements strictly between `date_start` and `date_end`, quantities are shown divided by the largest UOM conversion, cost is MA only, reasons survive REGENERATE but uploaded quantities do not.
- **Settings › Default Selection and Personalization › Default Selection are dead** (routed without the container / no route at all); the old page listed them as working "applet-level defaults" and "user-level overrides".
- **`status_variance` is computed from the first report line only** (every branch of the loop `break`s after one row). The Report listing's Status Variance column is therefore unreliable; documented as such.
- The old page's "Settings route also exposes … webhook setup, permission wizard" was right; the Field Settings list was right except for the two toggles above and the missing `QTY_DELIMITER` (declared, control commented out; the Scan Form splits `qty*code` on a hard-coded `*`).

## Findings for the product team (run 13)

- **`status_variance` evaluates one row** (`StockTakeSessionHdrService.updateReport`, both branches `break` on the first line). Either loop over all lines or drop the column from the Report listing.
- **Close throws after commit.** `updateReport` runs after `StockTakeSessionHdrService.update` has committed the CLOSED status; a missing `STOCK_DURING_OPENING_SHOP` key surfaces as an error toast while the session is already closed and `status_variance` stays NA. Default the key when absent instead of throwing.
- **Record DCO does not require `guid_session_device`** (customer-repo-ce5219#184, open) — root cause of the orphan-record incidents (#533, #532) where the report counts records the Records tab cannot show. Either require the device or make the session Records tab list device-less records.
- **No server-side lock on CLOSED sessions** — records and devices can still be created/updated by API or the mobile app after close.
- **Report generation endpoint is anonymous** (`EndpointMethod.AnonymousTenantEndpoint` in the custom report-line controller): any tenant user can regenerate any session and overwrite uploaded quantities.
- **Dead settings UI**: `Settings › Default Selection` (unbound container, throws on change) and `Personalization › Default Selection` (no route; falls through to the session listing). Same family as GIN / Entity / Forex / Goods Delivery Note.
- **`SERIALIZED_ITEM_EXT` toggle is a no-op**; `QTY_DELIMITER` has no control; the "Workfloww Settings" heading has a typo; internationalisation not implemented (gh:bigledger/blg-intranet#5150).
- **`COST_COLUMN_VIEW` client-side permission is seeded but never checked** — Cost Value / Total Cost always render.
- **Cost Value is MA-only** (`unit_cost_method` hard-coded `'MA'`); FIFO tenants get 0 or a misleading figure (customer-repo-ce5219#181/#201).
- **`date_start` / `date_end` are stamped by the web applet's NgRx effects**, not by the backend, so any other client (mobile, ETL) can leave them null and break GENERATE (`STOCK_TAKE_SESSION_HDR_START_DATE_IS_NULL_OR_EMPTY`; gh:bigledger/blg-intranet#3449). Move the stamping server-side.
- The `action_adjust_*` report-line columns and `status_adjustment` header column exist but nothing reads or writes them — the "stock take creates an adjustment" feature was never built; the module pages currently promise it.
- `static/images/stock-take-applet/stock-take-main-overview.png` is an infographic for the Internal Purchase Self-Billed Invoice applet, not the stock take — wrong file in this folder.

## Cross-lane link requests (run 13)

- content/en/modules-v2/inventory/_index.md, content/en/modules-v2/inventory/reports/_index.md, content/en/modules-v2/inventory/configuration/_index.md (modules owner) — they say the Stock Take applet does "variance posting", "adjusts system balance to match physical count", "Debits/Credits Inventory Shrinkage/Variance GL" and "verify variance write-offs post accurately to GL". None of that happens: the stock take has no signums, no journal and writes no stock line. Reword to "measures the variance; post it with a Stock Adjustment".
- content/en/applets/master-data/inv-item-maintenance-applet.md (lane 4, queued next) — when rewritten: state which scan-code field the stock take (and POS) match, that items hold two scan codes (financial vs inventory) that can diverge (customer-repo-ce5219#512/#513), and that `MULTI_UOM` line barcodes are matched as UOM-specific EANs; add `stock-take-applet` to `related_applets` (the existing link uses the alias `/applets/stock-take-applet/` — change to the canonical path).
- content/en/applets/inventory-workflow/warehouse-management-applet.md (lane 4, queued) — the WMS build bundles `stock-take-applet` (`elements-build-scripts/wavelet-erp/stock-take-applet` in the WMS repo; customer-repo-ce5219#191); add `stock-take-applet` to `related_applets` and a sentence on counting inside the WMS.
- content/en/applets/master-data/workflow-design-applet.md and organisation-applet.md (lane 4, queued) — add `stock-take-applet` to `related_applets`; Workflow Design: the stock take stamps the process's default status/resolution and offers `WfMdAvailableStatusService` transitions but enforces nothing.
- content/en/applets/inventory-workflow/stock-adjustment-applet.md, stock-balance-applet.md, stock-availability-applet.md, stock-report-applet.md (lane 4, done) — already list `stock-take-applet`; no change. Stock Adjustment could add one line: "a stock take report line is not converted automatically — raise the adjustment by hand".
- Data Fix applet page (whichever lane owns utilities) — a "sync inventory scan code from financial scan code" fix exists or was requested (customer-repo-ce5219#513); troubleshooting entry.
- API reference (developer-docs lane) — the offline sync endpoints `…/stocktake/offline/{inv-items, inv-items/query, device-stocktake-info/{device_code}}` and the two generate-report routes (`/{guid}` with `app_hdr_guid` using the EMP fact table vs `/session/{guid}` using `bl_inv_txn_line`) are undocumented.

## Screenshots with personal data (run 13)

Eighteen images were referenced by the old page (all exist in `static/images/stock-take-applet/`). Kept six that show only staging-tenant structure: `auto-scan.png`, `stock-take-settings-page.png`, `session-report-tab.png`, `session-report.png`, `session-report-search.png`, `stock-take-upload-reason-1.png`. Dropped twelve: `stock-take-session-listing.png`, `stock-take-session-create-form.png`, `stock-take-session-edit-form.png`, `stock-take-session-report-details.png` (a real customer's name as session name plus three real company names), `stock-take-report-listing.png`, `stock-take-upload-reason.png` (a staff member's name in a session name), `stock-take-device-listing.png`, `stock-take-device-create-form.png`, `stock-take-device-edit-form.png`, `device-tab.png`, `session-record.png` (staff names as device names; a full staff name in Created By), and `stock-take-main-overview.png` (wrong applet). All kept images still show the logged-in user's avatar photo top-right and the left panel of some shows staging test locations ("AKS LOCATION", "JC LOCATION (PUCHONG)") — please confirm those are acceptable; if not, recapture from a GadgetSphere-seeded tenant: Session listing, Create Session, Edit Session › Details / Devices / Records, Device master, Add Item form, Scan Form with the camera block, Report tab with variance columns, Report listing with Status Variance. The dropped files are still on disk (not deleted — outside this lane's write scope).

## Questions for Vincent (run 13)

35. **Delete `introduction-to-stock-take-applet.md`** and add its URL as an alias on `stock-take-applet.md`? (Recommended; nothing links to it.)
36. **Add `stockTakehq` and `st_staff` to `applet-exclusions.tsv`** as customer-specific (same build family as the excluded `DigistockTake`)? Otherwise they are ACTIVE applets with no page.
37. **Screenshots** — keep the six staging captures (avatar photo, test location names) or recapture?
38. **Module pages promise variance posting** that the applet does not do (cross-lane request above) — fix the module pages, or is "stock take → adjustment" a planned feature that should stay described as such?

## Notes (run 13)

- Settings classification: *applet-local* Field Settings only (8 form controls: 6 toggles + workflow drop-down + a commented-out text input); persisted by the shared session effects as `APPLET_SETTINGS`. The "consumed" proof for `STOCK_DURING_OPENING_SHOP` is in the **backend** — grep the Java side for applet-setting keys (`getValue_json().containsKey(`) before declaring a rendered key unread. Worth a METHOD.md line: backend consumption of `bl_applet_ext` keys exists (first case seen in this lane).
- The "not a generic document" check (METHOD.md item 12) settled the lifecycle section quickly: ts-lib `endpoint_path` = `stocktake-hdr` etc., own tables, own DCOs, no signum, no `JournalPostingTypeHandler`. The posting proof block is written as "none / none / none" with the evidence.
- The digi-prefixed backend controller and the applet's `Core2Config.DIGI_PREFIX` URL are an org-repo artefact (the report generator lives under a customer-named package but serves the org applet); cited by file path only, no customer name in the page body.
- Lateral pass: 34 issues read, 33 `lateral` lines in the applied record (customer repo cited as `customer-repo-ce5219`, already in kb/private/repo-pseudonyms.tsv); one skipped record for the intro page.
- Pace: ~100 minutes for one applet (registry disambiguation across four rows, a monorepo-split repo, a 700-line SQL report service, 18 screenshots to triage, 30+ issues). Stopping here; next is inventory-workflow/inv-item-maintenance-applet.md — note it is queued twice (inventory-workflow and master-data copies), which needs the same one-page resolution before either is rewritten.

# Run 14 (2026-09-05)

## Pages

- content/en/applets/master-data/inv-item-maintenance-applet.md — rewritten to the standard under the registry name **Inventory Item Maintenance** (`InvItemMaintenanceApplet`, TNT-USER; title changed from "Inventory Item Maintenance Applet"). Repo `blg-applet-wavelet-inv-item-maintenance-applet` (monorepo split: `micro-fe/projects/wavelet-erp/applets/inv-item-maintenance-applet`; commit 06aebbc, 2026-08-04); blg-shared-utilities af523eb; blg-akaun-ng-lib 2307797; blg-akaun-ts-lib 7d1616a9e; backend 871dbf5c96. The old master-data page was almost entirely invented (FIFO/LIFO/Average cost method per item, ABC analysis, safety stock, "up to 1,000,000 products", "50 custom fields", "20 images per product", cross-docking, PLM/EDI integrations) — none of it exists in the applet; all dropped. The YouTube intro is kept.
- content/en/applets/inventory-workflow/inv-item-maintenance-applet.md — **skipped (merged, F-0007)**. Second page for the same registry row. Its 13 screenshots were the only asset worth keeping — 10 re-used on the canonical page (see "Screenshots"). Its own facts were partly right (255-char limit, upper-casing on create, mandatory fields, tabs) and partly wrong (see "Direction / fact reversals"). File untouched; recommend delete + alias (question 39).

## Registry / naming mismatches (run 14)

- The registry `documentation_url` is `https://wiki.bigledger.com/applets/inv-item-maintenance-applet/`, which is the canonical page's alias — correct, no change needed. The applet's own `app.component.ts` still calls itself "Inv Item Maintenance Applet" in the header bar (the screenshots show that name); the registry name is "Inventory Item Maintenance". No second ACTIVE row.

## Direction / fact reversals found (run 14)

- **The Item Edit Main-tab Save is permanently disabled.** `resetForm()` declares `currentGlCode` with `Validators.required`; nothing ever patches it; the Save button is `[disabled]="!form.valid"`. Everything that saves through that button (category links, GL code, abbreviation, EAN, currency, status, dimensions) cannot be saved from the UI at commit 06aebbc. The old inventory-workflow page's "Item Details: Access and update granular information" is therefore only true for the tabs with their own save paths (Multi UOM, Manage Image, Location min/max, Company). Verified from source only — see question 40.
- **"Case Sensitivity: Item Code and Item Name are automatically converted to UPPERCASE upon saving"** — true on Create; on Edit only the CSS upper-cases the display, the save stores the typed name.
- **"Available Pricing Fields: List Price, Wholesale Price, Discounted Price, Price Brackets"** (old inventory-workflow page) — these belong to the doc item; the inventory record has no price fields. The `ItemCode` class carrying them in `inv-item-options.ts` is dead legacy.
- **"Trace Serial No … Check Current Status: Is it in stock? Sold? Under repair?"** — the trace shows movements (document, location, quantity × signum); there is no status column.
- **"Stock Aging … Filter by Location, Category, or Date Range"** — the filter is *Date As* (a single balance date), locations, item type/status, *Calculate Base On* and ten category levels. The **Aging** column is the item header's `plm_display_text` (a product-aging-cycle text set by the item file import), not a computed age; the age is expressed by the per-month Qty/Amount column groups built from FIFO layers.
- **"Multi-UOM: the system handles the conversion automatically"** — the applet stores UOM lines with a ratio and an EAN; conversion happens in the document applets, not here.
- **"Bulk deletion is restricted … deactivate items individually"** — there is no delete or deactivate action in the UI at all; the backend DELETE endpoint (physical delete, permission `TNT_API_INVENTORY_ITEM_DELETE`) has no transaction check.
- **Status is two fields.** Header `status` (ACTIVE/INACTIVE/DELETED, synced from the doc item by `FiItemToInventoryItemUpdateService`) vs the Main-tab *Status* drop-down, which writes the `ITEM_STATUS` extension (ACTIVE/INACTIVE/OBSOLETE). The old pages conflated them.

## Findings for the product team (run 14)

- **Item Edit Save dead** (`item-edit.component.ts` L144: `currentGlCode` required, never populated; `item-edit.component.html` L8). Present since the monorepo split (c3ccf6e, 2025-11-02). Drop the validator or patch the control.
- **`HIDE_ITEM_CATEGORY`** is rendered and persisted but never read (the Item Category tab has no `*ngIf`).
- **Department Settings** panel: four unbound toggles (Segment, G/L Dimension, Profit Center, Project) — not saved.
- **Default Selection** (Settings and Personalization) is dead: `appletContainer` never assigned, `appletSettings$` input never bound; a change throws; `DEFAULT_BRANCH` / `DEFAULT_LOCATION` are read by nothing. Same family as GIN / Entity / Forex / Goods Delivery Note / Stock Take.
- **`models/applet-settings.model.ts`** is a document-applet copy; none of its keys is used by this applet.
- **Settings menu** lists *Attribute* / *Attribute Set* with no route.
- **EAN Code cannot be cleared** from the Main tab (`scan_code` written only when non-empty).
- **Company tab** column "Stock Bal Qty" is bound to `bl_fi_mst_comp.name`.
- **No transaction guard on delete** server-side (`InventoryItemController.deleteInventoryItemByGuid`); the UI guard is commented out.
- **Scan-code drift** between doc item and inventory item is a recurring customer incident (customer-repo-ce5219#512/#513/#515/#174); auto-creation copies `scan_code` once and nothing keeps them aligned. Consider syncing on doc-item update (as status already is) rather than a data-fix.
- **Trace Serial No** keyword search is case-sensitive `LIKE`; serials with whitespace are unreachable (gh:bigledger/blg-intranet#4324).
- Min-Max menu entry has no `HIDE_*` toggle unlike the other five.

## Cross-lane link requests (run 14)

- content/en/applets/inventory-workflow/stock-take-applet.md (lane 4, done) — add: scan lookups resolve the inventory record's `scan_code` and the multi-UOM line EANs; "EAN not found while the full code works" = inventory/doc-item scan-code divergence; link the data-fix endpoint (`…/inv-items/data-fix/scan-code-mismatch/query` and `/align/backoffice-ep`). Change its `/applets/inv-item-maintenance-applet/` link to the canonical `/applets/master-data/inv-item-maintenance-applet/`.
- content/en/applets/master-data/doc-item-maintenance-applet.md (lane 4, done) — state that the inventory twin is created **asynchronously** by `FinancialToInventoryItemAutoCreationProcessor` (queue), copies code/name/descr/uom/type/sub-type/currency/scan code/dimensions once, and that afterwards only **status** is pushed across; add the scan-code data-fix note.
- content/en/applets/inventory-workflow/stock-balance-applet.md, stock-availability-applet.md (lane 4, done / reworked) — say Min Qty / Max Qty are maintained on the inventory item's Location tab or by the Min-Max Quantity Import, and that a daily "Min/Max Qty Stock Balance Alert" e-mail can be scheduled from this applet's Settings › Email Notification.
- content/en/applets/inventory-workflow/warehouse-management-applet.md, content/en/applets/master-data/organisation-applet.md (lane 4, queued) — add `inv-item-maintenance-applet` to `related_applets` when rewritten.
- content/en/applets/manufacturing/process-maintenance-applet.md (manufacturing lane) — add `inv-item-maintenance-applet` to `related_applets`; the inventory item's Process Template tab lists `bl_mrp_process_template_bom` rows and offers a *Replace* (swap item) action.
- content/en/applets/sales-workflow/{internal-sales-invoice,internal-sales-order,internal-sales-credit-note,internal-sales-quotation,internal-sales-return}-applet.md, content/en/applets/membership/commission-scheme-applet.md, content/en/applets/inventory-workflow/internal-stock-requisition-applet.md — they link `/applets/inventory-workflow/inv-item-maintenance-applet/`; if the duplicate is deleted (question 39) either add that URL as an alias on the canonical page or repoint the seven links to `/applets/master-data/inv-item-maintenance-applet/`.
- Data Fix applet page (utilities owner) — document the scan-code mismatch query/align feature (delivered for customer-repo-ce5219#513).
- content/en/modules-v2/inventory/*, modules/inventory*/_index.md (modules owner) — remove any "ABC analysis / safety stock / per-item cost method" claims inherited from the old inv-item page.
- API reference (developer-docs lane) — `PUT …/current-location-stock-balance/update-min-max-qty/backoffice-ep`, `POST …/erp/trace-serial-number/backoffice-ep`, `POST core2/tnt/dm/erp/reports/stock/stock-aging-report`, and the two `…/inv-items/data-fix/scan-code-mismatch/*` routes are undocumented.

## Screenshots (run 14)

Thirteen images exist in `static/images/inv-item-maintenance-applet/`. Kept ten staging-tenant captures (tenant shown as "STAGING_TENANT", test item codes, the logged-in user's avatar photo top-right — same caveat as run 13): `item-listing.png`, `item-create.png`, `item-edit.png`, `category-groups-listing.png`, `category-groups-create.png`, `categories-create.png`, `trace-serial-no.png`, `import-file.png`, `stock-aging-report.png`, `settings-page.png`. Dropped three: `categories-listing.png` (a real electronics brand appears as a category name), and the two marketing infographics `inv-item-maintenance-applet-overview-infographic.png` / `quick-start-guide-infographic.png` (not screenshots; "From Inventory Chaos to Precision Control" voice). Files left on disk. Missing captures that would help: Item Edit › Location tab with editable Min/Max, Multi Uom create, the Field Settings screen itself (the old `settings-page.png` shows the Teams landing panel, not Field Settings), Email Notification create.

## Questions for Vincent (run 14)

39. **Delete `inventory-workflow/inv-item-maintenance-applet.md`** and add `/applets/inventory-workflow/inv-item-maintenance-applet/` to the canonical page's `aliases`? Seven pages link to that URL today (list above). Recommended; same pattern as F-0050.
40. **Item Edit Save is dead in source** (unpopulated required `currentGlCode`). Should the page say so as plainly as it now does (Troubleshooting row 1), or is the deployed build known to differ from `main`? If a fix ships, the row and the Fields note must be removed.
41. **Screenshots** — keep the ten staging captures (avatar photo, "STAGING_TENANT") or recapture from a GadgetSphere-seeded tenant?
42. The two `SHOW_SN_*` client-side permissions are the only registry permissions for this applet; the `HIDE_*` toggles have no `SHOW_*` counterparts. Fine as documented, or should the applet audit flag applets whose hide toggles cannot be reopened per role?

## Notes (run 14)

- Settings classification: *applet-local* Field Settings (13 working keys + 1 dead + 4 unbound), persisted by the shared session effect; the shared `FieldConfigurationComponent` is not routed, so `gates.py` does not apply — ran it only to confirm the applet code has no `tabMappings` entry. Worth a METHOD.md line: for master-data applets with a local settings component, the "rendered" proof is the local HTML plus `app.component.ts` (menu filter) and the edit template's `*ngIf`s; the model file can be a document-applet copy and must not be trusted for the key list.
- Master-data lifecycle written as "what it writes / what it only reads" with the DCO throws; no signum, no journal, no queue (METHOD.md item 12 check: ts-lib `endpoint_path` = `erp/inv/inv-items`, own container, own DCO).
- Issue mining: the applet repo has one issue; the real failure modes came from blg-intranet (14 issues) and the customer repo (7 issues, cited as customer-repo-ce5219). 27 issues read, 27 `lateral` lines.
- Pace: ~95 minutes for one large master-data applet (9 edit tabs, 4 extra menus, 3 imports/reports, 2 pages to reconcile). Stopping here; next is master-data/merchant-applet.md.

# Runs 15–16 (2026-09-05)

Run 15 wrote content/en/applets/master-data/merchant-applet.md and was killed by a rate limit before recording it (the loop committed the page). Run 16 verified the page against the standard, corrected it, and did the bookkeeping.

## Pages

- content/en/applets/master-data/merchant-applet.md — rewritten to the standard under the registry name **Merchant Admin** (`MerchantAdminApplet`, TNT-USER; title changed from "Merchant Applet"). Repo `blg-applet-akaun-platform-merchant-applet` (commit cd6ac3e1, 2026-08-18; it bundles its **own** copy of shared-utilities under `micro-fe/projects/shared-utilities`, not refs/blg-shared-utilities); ts-lib 7d1616a9e; backend 871dbf5c96. Run 16 verification: all nine H2 sections in order, front matter complete, 13 images present, 15 internal links resolve, no BOM (none before either), lint clean. Spot-checked the strongest claims against source: Remove has no confirmation dialog (`onRemove()` → `delete` directly, template L137), Verify Email really calls `tenantUserService.addUser`, `HIDE_E_TYPE` is the only bound toggle, `EntityController` sets `is_merchant` via the `merchants` handler. **One row removed**: the troubleshooting entry "Contract *Merchant Name* shows `[object Object]`" — all three contract editors patch the field from `resp.data.bl_fi_mst_entity_hdr.name`, a string; the claim had no support. **Added**: a Merchant Access sibling line in *Where it fits* and *Related applets* (no link — no page exists).

## Registry / naming mismatches (runs 15–16)

- **`MerchantAccessApplet` "Merchant Access"** — TNT-USER, ACTIVE, route `applets/wavelet/erp/entity/merchant-access-applet`, build `akaun-platform/merchant-access-applet`, `documentation_url` → Confluence. **No repo** in refs/ (find over all clones) nor in `gh repo list bigledger` (only `blg-applet-akaun-platform-merchant-applet` matches "merchant"); **no wiki page**; no client-side permission rows. How it relates to Merchant Admin: same entity family (a customer enhancement request treats "Employee, Merchant Access & Merchant Admin" as the three entity views that should copy Customer Maintenance's Login-tab catalogue picker — customer-repo-a2de10#76), so it is most plausibly the merchant-side/self-service counterpart of the administrator view; marketing recorded a webinar in 2025 but withheld it because the applet kept crashing and "features will be fully available" later (gh:bigledger/blg-int-marketing#601, #604), while it already has an applet-store logo (#90). Nothing about its behaviour can be documented without source. Question 43.
- `MerchantAdminApplet.documentation_url` still points at Confluence (`…/3422748683/Merchant+Admin+Applet`); should become `https://wiki.bigledger.com/applets/master-data/merchant-applet/` (applet-audit item).
- The applet's own banner/route still say "Merchant Applet"; the registry name is "Merchant Admin" (page title follows the registry).

## Direction / fact reversals found (runs 15–16)

Against the old page (git 6dfc7517):
- **"Default Selection sets Default Branch / Default Location pre-populated on new documents"** — the screen is dead (undefined container, unbound output) and nothing reads the keys; the applet has no documents. Same family as GIN / Entity / Forex / Goods Delivery Note / Stock Take / Inv Item.
- **"Personal Default Settings override the system-wide defaults for this user"** — same dead code; **"Sidebar Configuration … users can hide menu items"** — a route exists but no menu entry links to it.
- **"Entity Type … affects financial posting, applet visibility, AR/AP categorization"** and the FAQ **"a merchant tagged CUSTOMER generates AR entries, SUPPLIER generates AP"** — Entity Type sets the `is_customer/is_supplier/is_employee/is_merchant` flags, which decide which sibling applet lists the row; posting direction comes from the document type and its signums, not from the entity flag. `default_arap_type` is a default the documents copy, not a posting rule.
- **"Setting the Status to DEACTIVATE disables the merchant's access and transactions"** — merchant status values are ACTIVE / TEMP / INACTIVE (DEACTIVATE is the *contract* status); the `merchants` listing and downstream lookups filter on `is_merchant`, not on status, and the monthly report job does not read contract status. Neither status disables anything.
- **"Changing a Merchant Key … is logged in the Audit Trail"** — the audit trail records the *action* (`EDIT_MERCHANT`), not the field; and the change affects new transactions only (callbacks verify against the key copied onto the transaction header).
- **"Merchant ID … uniquely identifies the merchant"** — the typed Merchant ID is the `ID_INFO` extension and is never uniqueness-checked; the unique key is the generated `merchant_code`, which the applet never shows.
- **"Contract … Validity Period"** in the lifecycle diagram — the contract form has no validity dates (backend DCO requires `date_start`/`date_end` presence but the UI sets them silently).
- **"Multi-currency … merchant-level currency settings drive how settlements are calculated"** — nothing in the applet or job reads a merchant currency; the credit-limit row has a currency field and that is all.
- Related-applet links to `/applets/finance/general-ledger-applet/` and `/applets/finance/accounts-receivable-applet/` (non-existent pages) replaced by Chart of Account; `/applets/master-data/customer-applet/` replaced by the canonical customer-maintenance page (F-0050).

## Findings for the product team (runs 15–16)

- **Remove deletes physically without confirmation** and without checking contracts, payment transactions or documents (`EntityUow.delete`); contracts survive with a dangling `merchant_guid` and are then shown as TEMPLATE type.
- **Merchant ID (`ID_INFO`) is not unique-checked**; the real key `merchant_code` is generated and never displayed. Show it in the listing.
- **Contract Code is computed client-side (max + 1)** with no backend uniqueness check → duplicates under concurrent creation.
- **Verify Email creates a tenant user as a side effect** (`addUser` with an empty body) and `if (resp.code = 'OK_RESPONSE')` is an assignment (always true).
- **Field Settings**: 8 unbound Lines/Department toggles (document-applet copy); **Default Selection** (Settings + Personalization) dead; Settings menu lists Permission Wizard / Audit Trail / Reset Applet State without routes; Personalization › Field Settings has no route.
- **Report menu has no way to run the job**; `PGW_MERCHANT_MONTHLY_REPORT_PROCESSOR` needs explicit `months`/`years` properties from the scheduler.
- The applet bundles a **private copy of shared-utilities** — fixes to refs/blg-shared-utilities (e.g. the session effects) do not reach it.
- The published walkthrough video is titled "Tenant-to-Tenant Integration & Data Mapping Management" — no such feature exists in the applet (gh:bigledger/blg-int-marketing#710).

## Cross-lane link requests (runs 15–16)

- content/en/applets/master-data/{entity-applet,customer-maintenance-applet,supplier-applet-1,employee-applet,organisation-applet,tax-configuration-applet,cashbook-applet,chart-of-account-applet}.md (lane 4; done pages get the back-link on the next touch, queued pages when reached) — add `merchant-applet` to `related_applets`.
- content/en/applets/e-invoice/mypeppol-admin-applet.md, my-e-invoice-admin-applet.md (e-invoice lane) — add `merchant-applet` to `related_applets`; say that a merchant's Peppol participant IDs (`bl_fi_entity_peppol_id`, with *Verify Participant ID*) and `einvoice_notification_methods_json` are maintained on Merchant Admin › Peppol Config as well as on the customer/supplier views.
- content/en/applets/ecommerce/seller-admin-applet.md (e-commerce lane) — add `merchant-applet` to `related_applets`; the seller identity is the merchant entity row.
- content/en/applets/external-tenant-admin/tenant-admin-applet.md (admin lane) — add `merchant-applet`; note that the entity Login tabs' *Verify Email* adds the address as a tenant user and *Send Invite* sends an invitation with `create_entity: true`.
- content/en/applets/master-data/customer-maintenance-applet.md and employee-applet.md (lane 4, done) — on next touch: Customer's Login tab has a "Select catalogs for the applets installation" picker; state whether Employee's has it (a customer asked for it on Employee, Merchant Access and Merchant Admin — customer-repo-a2de10#76; Merchant Admin does not have it at cd6ac3e1).
- Payment-gateway / e-commerce module pages (modules owner) — the merchant contract → rate card → payment channel → charge rate hierarchy and the monthly merchant transaction summary job are documented on the Merchant Admin page; link there instead of describing MDR handling independently.
- applet-audit — `MerchantAdminApplet.documentation_url` → wiki URL; `MerchantAccessApplet` is ACTIVE with no page (question 43).

## Screenshots (runs 15–16)

Thirteen existing captures under `static/images/merchant-applet-applet/` kept (create form, Peppol Config, Notification Config, Return URL, Tax & Billing, Payment Config, Address, Contact, Company Linking, Credit Limit, Logo, Contract create, Settings); they show a staging tenant with test data. Dropped from the page: `merchant-applet-onboarding-infographic.png` (marketing infographic, not a screenshot). Files left on disk. Missing captures that would help: Merchant listing, Login tab with Verify Email / Send Invite, Merchant Branch panel, Rate Card › payment channel › charge rate screens, Report listing, Audit Trail listing.

## Questions for Vincent (runs 15–16)

43. **Merchant Access** (`MerchantAccessApplet`, ACTIVE, no repo found, no page, webinar withheld as unstable): add to `applet-exclusions.tsv` as `stub` / not shipped, or locate the source (it is not in the org's GitHub) so a page can be written? Until decided the Merchant Admin page mentions it in one sentence without a link.
44. The `[object Object]` troubleshooting row was removed as unsupported by source. If it was observed on a live tenant (run 15's transcript is lost), it should come back as a feedback item with a screenshot rather than a code citation.

## Notes (runs 15–16)

- Method: a run killed mid-bookkeeping is cheap to recover when the page carries its `sources:` map — re-derivation took ~25 minutes (re-read the cited files, re-fetch the cited issues, spot-check the five strongest claims). Worth a METHOD.md line: **verify a recovered page by re-checking every "no dialog / side effect / dead code / `[object Object]`" claim against the cited line numbers** — the one unsupported row was exactly such a claim.
- Registry note for the applet-audit: this applet's repo is an `akaun-platform` (not `wavelet`) applet whose `micro-fe/projects/shared-utilities` copy predates the shared `FieldConfigurationComponent`; `applet-scan.sh` and `gates.py` do not apply — the settings classification was done by reading the local `field-configuration.component.html` (one bound control) and the create form's `disabled:` expression.
- Lateral pass: 8 issues read (2 applet repo, 4 marketing, 1 wiki, 1 customer repo cited as customer-repo-a2de10 — new pseudonym added to kb/private/repo-pseudonyms.tsv), 8 `lateral` lines in the applied record.

## Pages (run 16, continued)

- content/en/applets/inventory-workflow/non-stock-and-trade-in-applet.md — rewritten to the standard under the registry name **Non Stock and Trade In Applet** (`nonStockAndTradeInApplet`, TNT-APPLET; title unchanged). Repo `blg-applet-wavelet-non-stock-and-trade-in-applet` (monorepo split; commit 209aafd, 2026-08-03); ts-lib 7d1616a9e; backend 871dbf5c96. The old page (git 1bd4ae12) was a marketing guide with invented configuration; everything from "Purpose" to "FAQ" was replaced. Kept: the tags, two screenshots. 26 issues read, 26 `lateral` lines.

## Registry / naming mismatches (run 16, NSTI)

- `documentation_url` still points at Confluence (`…/4588011547/Non-Stock+Trade-In+NSTI+Applet`); should become the wiki URL (applet-audit item). No second ACTIVE row.

## Direction / fact reversals found (run 16, NSTI)

- **"Configuration & Settings: `DEFAULT_NSTI_GL_CODE` and `ALLOW_NESTED_NSTI_CATEGORIES` in the Organization Applet"** — neither key exists anywhere (applet, ts-lib, backend). The real settings are the applet's own Field Settings (27 working keys, see the page); the NSTI GL is the company default GL code `NSTI` in Chart of Account.
- **"If these mappings are missing, the system will error out during the posting of any invoice containing NSTI items"** — inverted: the backend **creates** the "Non-Stock and Trade-In" GL code, the company link and a subledger when the `NSTI` link is missing or invalid (`createTradeInStock` L108-160, `ensureNSTIGLCode` L298-425).
- **"Category Hierarchy … Parent Category for nested organization (Electronic → Handheld → Phone)"** — categories are flat; the create form has Code, Name, Description, Status only.
- **"Import … Upload and click Add to populate your stock list instantly"** — the import writes helper rows only; no code creates `bl_fi_nsti_stock_hdr` rows from them (the open applet issues #8/#10 are this).
- **"Posting Status: DRAFT, TEMP, or POSTAL"** — values are `DRAFT` / `FINAL` (`TEMP` is the header *status* of an unsaved create). FINAL is a UI lock, not a posting.
- **"Sales rep … records the serial number … valuation applied as a credit in the sales applet"** — units are created *by* the POS trade-in line, not typed in first; and the FINAL cash bill, not this applet, carries the credit.
- **"Stock codes must be unique across the system"** — no backend uniqueness check on code, serial or category code; only the browser checks its generated code against loaded rows.
- **"Track serial numbers … in the Serial Number or Code field"** — the serial is part of the unit's identity (item + serial + location); putting it in Code makes the unit invisible to documents.

## Findings for the product team (run 16, NSTI)

- **Import is a dead end**: `readCSV` stores helper rows and stops; nothing creates units (#8, #10, #11). Issue #11 is closed but `main` shows no backend change to the import since 2024-11-16 — either an unmerged branch or a wrong closure.
- **Manual transaction lines never update `qty_base`** (only the balance processor does, and only for document-generated lines). Either trigger `processTxnLine` on manual create/update/delete or drop the "Add Transaction" panel.
- **Financial Item picker is unfiltered** — lets users create units on non-NSTI items that documents will never move.
- **Header delete leaves txn lines and attachments orphaned** (`NonStockTradeInHdrUow.delete` deletes the header row only).
- **No uniqueness checks** on unit code, serial number or category code; the browser-side random code is checked against the loaded page only.
- **Field Settings**: `STOCK_HIDE_COMPANY` rendered but unread; `SHOW_API_UPLOAD` declared and saved with no toggle; six `STOCK_HIDE_*` column keys read but not rendered; `DEFAULT_TOGGLE_COLUMN` / `DEFAULT_ORIENTATION` read but not rendered; Default Selection (Settings and Personalization) dead; Personalization › Field Settings has no route.
- **Import failure has no user message** (`user_error_message` never written; #9).
- **Foreign-currency documents are skipped silently** by the NSTI processor (`createAndPostNstiTxnLines` L255-265) — a USD trade-in never creates a unit and nothing tells the user.
- **`serial-validation/backoffice-ep`** exists twice in the controller (one commented, one live) — fine, but the live one is undocumented; API reference item.
- Legacy `bl_fi_tradein_stock_hdr` / `TRADE_IN_STOCK_PROCESSOR` still in the backend with `posting_trade_in` shared between the two paths — if both are subscribed, the second is skipped by `checkCanBePosted`.

## Cross-lane link requests (run 16, NSTI)

- content/en/applets/sales-workflow/pos-general-applet.md (lane 1) — add: a trade-in line creates an NSTI unit only when the item is `NSTI`-typed **and the line carries a serial number** (one unit per serial, `quantity_base 1`); selling an NSTI serial is refused with `STOCK_BALANCE_OBJECT_NO_STOCK_AT_LOCATION` when it has no balance at the line's location; forex bills skip NSTI posting. Its `related_applets` already lists this page.
- content/en/applets/sales-workflow/internal-sales-invoice-applet.md, internal-sales-credit-note-applet.md (lane 1) — add `non-stock-and-trade-in-applet` to `related_applets`; credit note: NSTI lines are forced to quantity signum +1 by `NonStockTradeInTxnLineFactory` L117-118.
- content/en/applets/master-data/doc-item-maintenance-applet.md (lane 4, done) — on next touch: the `NSTI` transaction type is what the NSTI processors key on; add `non-stock-and-trade-in-applet` to `related_applets`.
- content/en/applets/inventory-workflow/stock-transfer-applet.md (lane 4, done) — one line: NSTI units move on transfer documents through stock-in-transit counter-lines (`createStockInTransitTxns`); add `non-stock-and-trade-in-applet`.
- content/en/applets/inventory-workflow/stock-availability-applet.md, stock-balance-applet.md, stock-report-applet.md (lane 4) — Stock Availability: say it unions `bl_fi_nsti_stock_hdr` (cost = purchase price incl. tax); Stock Balance / Stock Report: NSTI excluded (gt#1422 open). Add `non-stock-and-trade-in-applet` to `related_applets`.
- content/en/applets/master-data/chart-of-account-applet.md (lane 4, reworked) — note that the `NSTI` default GL is auto-created ("Non-Stock and Trade-In") by the first trade-in when absent; add `non-stock-and-trade-in-applet`.
- content/en/applets/finance/financial-report-applet.md (lane 2) — add `non-stock-and-trade-in-applet` to `related_applets` (NSTI closing-stock journal between `COGS_NSTI` and `STOCK_BALANCE_NSTI`).
- content/en/applets/master-data/organisation-applet.md, tax-configuration-applet.md, employee-applet.md (lane 4) — add `non-stock-and-trade-in-applet` to `related_applets` when touched.
- API reference (developer-docs lane) — `POST …/non-stock-trade-in/txn-lines/posting/{docGuid}` (manual re-run), `POST …/stock-hdrs/serial-validation/backoffice-ep`, `GET …/stock-import-file-hdrs/backoffice-ep/download-master-data-template` are undocumented.
- Modules pages (modules owner) — any "trade-in inventory is tracked in the stock ledger" wording should say NSTI units are a separate table shown only in Stock Availability.

## Screenshots (run 16, NSTI)

Seven images exist in `static/images/non-stock-and-trade-in-applet/`. Kept two: `settings.png` (Settings landing) and `import-add.png` (upload panel; the listing behind it shows file names and statuses only). Dropped five: `stock-listing.png`, `stock-create.png`, `category-listing.png`, `category-create.png` (staff first names as branch / category test data and a real phone brand as a category name — same rule as runs 13/14), `import-listing.png` (a staff member's full name in *Created by*), and the marketing infographic `non-stock-and-trade-in-applet-overview-infographic.png`. Files left on disk. Recapture wanted from a GadgetSphere-seeded tenant: NSTI Stock listing, Create NSTI Stock (with SCAN), Edit › Details / Txn Line / Attachment, Add Transaction, NSTI Category listing + create, Import listing, Field Settings screen.

## Questions for Vincent (run 16, NSTI)

45. **Import**: the page now says plainly that Import NSTI fills a staging table and creates no units (issues #8/#10 open, #11 closed without a visible backend change). Keep that wording, or is a fix deployed from a branch that is not on `main`?
46. **Manual transaction lines do not move the balance** — documented as a limitation in Fields and Troubleshooting. Confirm this is not a deployed-build difference.
47. **Screenshots** — five dropped for staff names / brand test data; recapture list above.

## Notes (run 16, NSTI)

- Settings classification: applet-local `FieldConfigurationComponent` (four panels); `applet-scan.sh` picked the repo's `testApplet` directory first (the real applet is under `micro-fe/projects/wavelet-erp/applets/`), so the applet dir must be checked by hand whenever a repo carries a testApplet — worth a METHOD.md line. Plain-grep second pass found the eight read-without-control keys and the two dead ones.
- Lifecycle: METHOD.md §12 check settled it (ts-lib `endpoint_path = non-stock-trade-in/...`, own tables, own DCOs, no signum) — but this applet has a *document-driven* lifecycle behind it (two queue processors keyed on `txn_type = NSTI` + serial numbers), so "master data: writes / reads" needed a fourth block: "how documents create and move units". Same shape may apply to Fixed Asset Register.
- New METHOD.md candidates: (a) **queue subscription is tenant configuration** — when a processor is a `TenantQueue.EventHandler` fed by `getSubscriberJobProcessors`, say so in "Before you can use it" and lead the "FINAL left no trace" troubleshooting row with it (this is §11's cousin for non-knock-off processors); (b) **auto-created GL codes** exist (`createDefaultGLCode` for NSTI) — check before writing any "missing default GL → error" claim.
- Pace: ~80 minutes for the NSTI applet (a 600-line header service, two processors, a factory, an import path and 26 issues). Stopping after this page; next in queue is master-data/organisation-applet.md (large; several cross-lane requests already queued against it in earlier runs).

## Pages (run 17, Organization)

- content/en/applets/master-data/organisation-applet.md — rewritten to the standard from `blg-applet-core-akaun-platform-akaun-organisation-applet-v3` (commit 54c1086, 2026-08-18) and backend 871dbf5c96. Title changed from "Organisation Applet" to the registry name **Organization** (`bl_applet_hdr.name` is literally `"Organization "` with a trailing space — trimmed on the page). `applet_code: Organization_Applet`. Kept the four clean screenshots and the existing tab tables; dropped the marketing infographic, the FAQ and the "Golden Chain" quick-start prose. `related_applets` now carries every cross-lane request found in lanes 1–4 findings (53 slugs) except `budgetary-applet` (see questions).

## Registry / naming mismatches (run 17)

- `Organization_Applet` name has a trailing space in `bl_applet_hdr.name` ("Organization "). Page title uses "Organization". `documentation_url` points at `/applets/organization-applet/`, which is kept as an alias of the page. The DELETED row `Organization Applet` (TNT-USER, CORE1) is the pre-v3 applet; the older repo `blg-applet-core-akaun-platform-akaun-organisation-applet` (last commit 2025-11-18) builds the same `akaun-organisation-applet-elements.js` name as v3 — the v3 repo is the newer one and was used.
- `ecomSyncOrganisationApplet` "Ecom Sync Organisation" (ROOT-USER, ACTIVE) is unrelated to this page (lane 2 already reported no repo for it).

## Direction / fact reversals found (run 17, Organization)

- Old page: "Default Selection — Default Branch / Default Location preselect a branch and location in the applet." Nothing in the applet reads `DEFAULT_BRANCH` / `DEFAULT_LOCATION`; only `ORGANISATION_DETAILS_TAB_ORDER` from that screen is consumed (Company Edit tab order). Personalization Default Branch / Location are dead (`appletContainer` never initialised). Corrected.
- Old page: "Pick Pack — affects whether those internal transaction flows enforce a delivery quantity balance rule before the document can be completed." The three checkboxes are written to branch extension `PICK_PACK_QUEUE`; no reader exists in the backend or in the sales order / sales invoice / outbound DO applets. Now stated as "stored; no reader found".
- Old page: "The applet prevents conflicting active KO rules … Conflicting rules are blocked to prevent duplicate knock-offs" — the GRN-family conflict is a client-side toast only; the backend blocks exact duplicates and cyclic AUTO chains, and does not block source = target. Corrected with the DCO citation.
- Old page: "E-Invoice tab is only visible when e-invoice is enabled in the current deployment." It is hidden only by the `HIDE_E_INVOICE_TAB` key in `APPLET_SETTINGS` (no toggle exists). Corrected.
- Old page listed a customer-specific Marketplace Type value verbatim (lane 2 request) — replaced by "plus one customer-specific value".
- Old page's Location Class explanation ("consignment-specific document types … Customer/Supplier Consignment In/Out") described document types that are not keyed off the class; the backend only stores/filters `location_class` (`BASIC` / `CCSG`). Corrected.

## Findings for the product team (run 17, Organization)

- `TimeZoneHandler.getTimeZone()` L28 reads `if (branchGuid.isBlank())` before the branch-timezone lookup — inverted: the branch `default_timezone` is never used by the report row generators (and `getByGuid("")` is attempted when there is no branch). Company timezone → tenant `DEFAULT_TIMEZONE` → `Asia/Kuala_Lumpur` is the effective chain.
- `HIDE_SIC_CODE_AND_BUSINESS_ACTIVITY_DESCRIPTION` is rendered and saved but read by nothing; `HIDE_E_INVOICE_TAB` is read but has no toggle. `DEFAULT_COMPANY` is patched onto a form that has no such control (never saved).
- Personalization › Default Selection: Default Branch / Location throw on change (`this.appletContainer` undefined); the Personalization "Field Settings" menu entry and the Settings "Audit Trail" entry (`./applet-log`) have no route → 404.
- Location Edit offers a third Location Class option labelled `TESTTTT` with value `CCSG` (`location-edit.component.html` L176).
- Branch `tax_applicable` and the Pick Pack `PICK_PACK_QUEUE` extension have no consumer anywhere in refs/ or the backend.
- `member_point_award_doc_in` / `member_point_in_doc_status` and `posting_final_json` have no UI in this applet nor in the membership admin repo — API/support only.
- Company delete is a soft delete with no reference check (`CompanyUow.delete`); the Company Edit delete button is commented out, branch/location delete buttons are live.
- `checkTabValidity()` in Company Edit is dead code; the "Invalid tab(s)" banner can never show.
- Knock Off Configuration: `config_mode` and `property_json.doc_2_posting_status` have no control; the Copy From (`CP`) tab is commented out although its code and actions still exist.

## Cross-lane link requests (run 17, Organization)

Back-links: please add `organisation-applet` to `related_applets` of every page listed in this page's `related_applets` that does not already carry it (lane 1: sales-workflow, membership, claims; lane 2: finance, e-invoice, integrations; lane 3: purchase-workflow, ecommerce, delivery-installation). Specific content requests:
- content/en/applets/master-data/chart-of-account-applet.md (lane 4, done page — on next touch): add a sentence that the company Knock Off Configuration lives on the Organization page; cite `CompanyGlcodeLinkController` (`company-glcode-links`) as the Default GL Codes endpoint.
- content/en/applets/finance/bank-reconciliation-applet.md, content/en/applets/finance/financial-report-applet.md (lane 2): the timezone the windows use is the **company** `default_timezone` (branch value is not consulted by `TimeZoneHandler` — inverted guard); fallback `Asia/Kuala_Lumpur`.
- content/en/applets/e-invoice/my-e-invoice-admin-applet.md, my-e-invoice-portal-applet.md (lane 2/3): the company on/off switch is **E-Invoice Status** on Company › E-Invoice (default `DISABLED` at creation); documents finalised before enabling are never queued (`GenericDocEInvoicePostingQueueService` L95-98, #5618); `einvoice_forex_gendoc_posting_logic` has no UI (#5803 open) and defaults to `POST_FOREX_DOC`; branch and entity **Skip E-Invoice** are OR-ed with the document flag at FINAL (`isSkipEInvoice` L3239-3244).
- content/en/applets/sales-workflow/pos-general-applet.md (lane 1): the cash-bill check reads `bl_fi_mst_branch.location_guid` (the Main Location field), not the `MAIN_LOCATION` extension; branches with only the extension fail until Main Location is saved (#3380/#3381).
- content/en/applets/sales-workflow/internal-sales-return-applet.md, purchase-workflow/internal-purchase-return-applet.md (lanes 1/3): #5579 (open) — return stock intermittently posted to the branch default store instead of the line location.
- content/en/applets/purchase-workflow/blanket-purchase-order-applet.md, internal-consignment-purchase-order-applet.md, internal-purchase-grn-applet.md, internal-purchase-order-applet.md (lane 3): may now link "downstream cannot find the document" to `/applets/master-data/organisation-applet/#knock-off-configuration-company--knock-off-config--knock-off`.
- content/en/applets/membership/membership-admin-applet.md, commission-scheme-applet.md (lane 1): state that `member_point_award_doc_in` / `member_point_in_doc_status` have no screen (Organization page says so).
- content/en/applets/integrations/90-ecomsync-related-applets.md (lane 2): the branch Marketplace › Stock Configuration columns are now listed on the Organization page; #4080 / #4081 open.
- content/en/guides/purchasing-guides/consignment-purchasing/, procurement guides (F-0080 / F-0137): point at Company › Knock Off Config on the Organization page.
- content/en/guides/einvoice-guides/myinvois-setup.md (F-0124): the per-company switch already exists (E-Invoice Status); the "processor schedule" part is not in this applet.

## Screenshots with personal data (run 17, Organization)

Twelve files exist under `static/images/organisation-applet/`. Kept four: `edit-company.png`, `edit-branch.png`, `notification-template.png`, `field-settings.png` (staging tenant, generic test names). Dropped from the page (files left on disk, to be quarantined): `company-listing.png`, `create-company.png`, `branch-listing.png`, `create-branch.png`, `location-listing.png`, `create-location.png` (listing rows include a person's first name as a company name, a real telco / social-media brand as test data, and a ceramics-business name that may be a real customer), `edit-location.png` (a four-letter company abbreviation that may identify a real customer), and the marketing infographic `organisation-applet-infographic.jpg`. Note for Vincent: every capture shows the staff login e-mail in the top bar — earlier runs kept such captures; confirm that is acceptable or all four kept ones need recapture too. Recapture wanted from a GadgetSphere-seeded tenant: Company / Branch / Location listings, Create Company, Create Branch (with the default-location radio), Create Location (Location Class), Location Edit, Company › Knock Off Config grid + add dialog, Company › E-Invoice tab, Company › Peppol Config, Branch › Marketplace › Stock Configuration, Branch › Pick Pack, Settings › Default Selection (tab ordering).

## Questions for Vincent (run 17, Organization)

1. `budgetary-applet` was **not** added to `related_applets` (lane 2's conditional request): the v3 applet has no profit-centre screen (F-0091). Confirm that profit centres stay on the Budgetary page.
2. Four `einvoice_settings_json` keys (`einvoice_issuer_type`, `einvoice_forex_gendoc_posting_logic`, `einvoice_running_no_config`, `einvoice_line_item_desc_config`) are read by the backend and have no control anywhere. The page says "set through the API or by support". Is that the intended wording until #5803 ships?
3. `TimeZoneHandler` L28 inverted guard — file as a backend bug?
4. Registry name "Organization " (trailing space): fix the row, or keep trimming on the page?
5. Screenshot header e-mail (see above).

## Notes (run 17, Organization)

- Pace: ~95 minutes for the Organization applet (690-file monorepo applet; four parallel read-only census agents for company tabs, branch/location/notification screens, backend rules and issues; settings four-proof done by hand). Stopping after this page; next in queue is master-data/pricebook-applet.md.
- Method: for monorepo applets (`micro-fe/projects/<family>/applets/<name>/src/app`) `kb/tools/applet-scan.sh` does not resolve paths and `gates.py` is irrelevant when `settings/field-settings` routes to an applet-local component — say so in `sources`/notes instead of reporting "0 toggles".
- Backend-consumed branch flag proof pattern reused from METHOD §15: `isSkipEInvoice` reads branch `skip_einvoice` (Java), while `tax_applicable` and `PICK_PACK_QUEUE` have no Java or applet reader — bounded `git grep` per applet repo (tracked files only) is the fast way to check across refs/ (a plain recursive grep over refs/ times out).

## Pages (run 18, Pricebook)

- content/en/applets/master-data/pricebook-applet.md — rewritten to the standard from `blg-applet-wavelet-pricebook-applet` (commit 7a8d6a7, 2026-09-03; applet at `micro-fe/projects/wavelet-erp/applets/pricebook-applet`), `blg-shared-utilities` a8c38a2 (the `PricebookCalculator` that actually evaluates price books), consumer repos (POS General 4fb19b6, Sales Invoice efcad942, Sales Order v2 36f287d, Sales Quotation e6a99a4, Purchase Order 37f8ad3) and backend 353fa9a0e4. Title changed from "Pricebook Applet" to the registry name **Pricebook**; `applet_code: PricebookApplet`; alias `/applets/pricebook-applet/` kept (it is the registry `documentation_url`). Kept nothing of the old body — it was a marketing page (Golden Triangle, Quick Start, invented "Draft/Active/Expired" state machine and "priority ranking within the settings") with no product facts; the one image was an AI infographic and was dropped.

## Registry / naming mismatches (run 18)

- `AkaunPriceBookApplet` "Akaun Price Book" (TNT-APPLET, ACTIVE, created 2025-11-13, route `applet/tnt/blg/b2b/akaun-price-book-applet`, own `es_module_url` under `akaun-platform/akaun-price-book-applet`) has no wiki page; the only repo in refs/ is `blg-applet-akaun-platform-akaun-price-book-applet-deprecated` (single commit "Initial split from monorepo", 2025-11-18). Not documented in this run — an ACTIVE row whose build source is marked deprecated needs Vincent's call (new page vs. registry cleanup).
- `main.ts` dev-only `sessionStorage.appletCode = 'PricebookApplet2'` ≠ registry `PricebookApplet`; harmless here because the applet does not use the shared `FieldConfigurationComponent` (METHOD §10 case does not arise).

## Direction / fact reversals found (run 18, Pricebook)

- Old page: price sets have a Draft → Active → Expired lifecycle and "automatically expire". Actual statuses are ACTIVE / INACTIVE / DELETED on `bl_fi_mst_price_book_line`; expiry is a Valid Date Range rule evaluated at line-add time, and only the *Absolute* form is evaluated on the client.
- Old page: "the administrator must define the priority ranking within the settings so the system knows whether to stack discounts or apply the best price". There is no such setting: the client calculator takes the highest `priority_line` first, first match wins, and never reads the Price Book's Calculation Logic; Calculation Logic is honoured only by the OCR processor (four of nine values).
- Old page: "Customer Segments" as a first-class object linked to the customer file. The equivalents are the Entity Type, Member Class, Member Label and Customer / Employee Category rules on a price set; nothing is set on the customer record except its category labels / member class.
- Old page: "Purchase with Purchase (PWP)" with Condition and Benefit items and a Max Quantity cap. Nothing in the applet or the calculator implements a condition/benefit pair; free gifts are `PO_FREE_GIFT` / `POS_FREE_GIFT` price books maintained in the PO and POS applets and hidden here (#4). `maxQty` exists only on the Price Book → Pricing Set editor's item/category rules and caps the qualifying line quantity.
- Old page listed the Internal Sales Quotation, POS General and Customer Maintenance applets as integration points; the actual consumers are POS General, Sales Invoice, Sales Order v2 and Sales Quotation (client) and the OCR membership-points processor (server). Customer Maintenance does not read price books.
- content/en/modules-v2/membership/configuration/rewards-setup/pricebook-configuration.md says "Core → Member Class link — assign the pricebook to the correct member class". Inverted: the price set carries a Member Class rule; no pricebook link exists on the member class (checked `blg-applet-wavelet-membership-admin-applet`, only commented-out `savePricebookState` calls).

## Findings for the product team (run 18, Pricebook)

- Client/server divergence in rule evaluation (`pricebook-calculator.ts`): `multi_line_doc_filter` is never read; header `top_level_logic` OR is not applied (always AND); `COMPANY`, `MEMBER_LABEL`, `OCR_COMPANY`, `CURRENCY`, `SETTLEMENT_METHOD` header rules are ignored (treated as satisfied); a RELATIVE Valid Date Range stores null dates and never matches; `ITEM_CATEGORY`, `ITEM_NAME_REG_EX` and the category-regex line rules never match; `calculation_logic` is never read. The backend engine (`PriceBookOcrGenDocMatchingService`) honours logic/negation and multi-line rules but is only invoked for OCR generic documents and only applies POINT treatments.
- Two editors for the same price set with different rule menus: Price Set menu (`priceset-edit`: + Currency, Settlement Method; Sales Treatment behind `SHOW_SALES_TREATMENT`) vs Price Book → Pricing Set (`pricebook-edit-priceset`: + Employee/Customer Category, Category 0..10, Max Quantity; never shows Sales Treatment). A rule created in one editor is displayed in the other only if that editor knows the type.
- Price Book **Status** is an extension (`PRICE_BOOK_STATUS`) that no consumer reads; an Inactive price book keeps applying while it is a document applet's Default Pricebook.
- Rule types with no effect anywhere: `MEMBER_LABEL`, `OCR_COMPANY`, `CURRENCY`, `SETTLEMENT_METHOD`, `COMPANY` (client ignores; server generic node — I did not verify what `PriceBookOcrGenDocGenericRuleNode` does with them).
- `SHOW_SALES_TREATMENT` toggle is labelled with its raw key on the Field Settings screen.
- Personalization › Default Selection is dead (`appletContainer` never initialised) — same defect as Organization (run 17); Settings lands on `feature-visibility` although the menu does not list it; `webhook` and the four permission listings are reachable only by URL.
- `DEFAULT_BRANCH` / `DEFAULT_LOCATION` / `DEFAULT_COMPANY` are saved and never read; `PRICEBOOK_POINTS_AUTO_APPLY` in POS General is saved and never read (4fb19b6).
- Treatment formulas (`FORMULA` operator) are evaluated with JavaScript `eval` on the client (`pricebook-calculator.ts` L544-556, L1018-1024, L1074-1080) — worth a security note for the shared-utilities owners.
- `PriceBookLineDataConsistencyObject` does not enforce unique price set codes; only the header code is unique.
- The Price Set create action posts a `PRICING_SET_CREATED` event row, but delete/update of a price set post no event (only price-book-level events exist).

## Cross-lane link requests (run 18, Pricebook)

Back-links (`related_applets` += `pricebook-applet`): content/en/applets/membership/membership-admin-applet.md and content/en/applets/membership/ocr-cash-bill-applet.md (lane 1); already present on pos-general, internal-sales-invoice, internal-sales-order, internal-sales-quotation, internal-purchase-order, doc-item-maintenance, organisation. Lane 4 own pages on next touch: customer-maintenance-applet, employee-applet, entity-applet, inv-item-maintenance-applet, shipping-pricebook-applet (next in queue — will add there).
- content/en/applets/sales-workflow/pos-general-applet.md (lane 1): `PRICEBOOK_POINTS_AUTO_APPLY` has no reader; Troubleshooting should carry the calculator limitations (multi-line rules and OR logic ignored, relative date rules never match, Company/Currency/Settlement/Member Label/OCR Company rules ignored, price book Inactive status ignored); the pricing-scheme filter on a treatment applies only in the POS path (`calculateUnitDiscountWithParent`).
- content/en/applets/sales-workflow/internal-sales-invoice-applet.md, internal-sales-order-applet.md, internal-sales-quotation-applet.md (lane 1): *Default Pricebook* loads one price book at start-up (`app.component.ts` L95-96 in SI); the matched DISCOUNT writes Unit Discount and the price set name as description (`main-details.component.ts` L800-830); a SALES treatment with lower priority suppresses the discount.
- content/en/applets/membership/ocr-cash-bill-applet.md (lane 1): the price book is chosen by the OCR job template `priceBookHdrGuid` (`OcrGenericDocPrimaryProcessor` L84); processor `BLG_OCR_GENERIC_DOCUMENT_MEMBERSHIP_POINTS_PRICE_BOOK_PROCESSOR` is a secondary processor of the primary; only POINT treatments; Calculation Logic honoured for POINTS_REWARD_HIGHEST/LOWEST and PRICESET_PRIORITY_ASC/DESC; throws `PRICE_BOOK_HDR_GUID_IS_NULL` / `INVALID_PRICE_BOOK_HDR_GUID`.
- content/en/applets/membership/membership-admin-applet.md (lane 1): member class / member label / points currency are referenced by price-set rules and Point treatments; no pricebook link on the member class.
- content/en/applets/purchase-workflow/internal-purchase-order-applet.md (lane 3): PO Free Gift = price book with `price_book_type PO_FREE_GIFT`, code assigned by the backend running-number generator (`PriceBookService.createPriceBook` L27-35), listed through `pricebook-hdr/backoffice-ep`, hidden from the Pricebook applet (#2, #4).
- content/en/modules-v2/membership/configuration/rewards-setup/pricebook-configuration.md (module owner): fix the inverted "assign the pricebook to the member class" sentence (see reversals).
- content/en/guides/sales-guides/standard-sales-workflow.md and guides/sales-guides/_index.md (F-0032 / blg-wiki#128): a Pricebook guide should lead with *Default Pricebook* in the consuming applet and use only the rule types the client evaluates.

## Screenshots (run 18, Pricebook)

No product screenshots existed; the single image `static/images/master-data/pricebook-overview-landscape.png` is an AI marketing infographic (JPEG, 640×640, no personal data) and was dropped from the page (file left on disk). Nothing to classify under F-0167 ("login e-mail only") for this page. Recapture wanted from a GadgetSphere-seeded tenant: Price Book listing, Price Book edit › Details (Calculation Logic), Price Set listing, Price Set edit › Rules - Doc Hdr with one Branch rule, Add Rule › Valid Date Range (Absolute), Add Rule › Item with Min Quantity / Min Amount, Treatment tab with Discount + Point, Settings › Field Settings (the `SHOW_SALES_TREATMENT` toggle).

## Questions for Vincent (run 18, Pricebook)

1. `AkaunPriceBookApplet` "Akaun Price Book" — ACTIVE row, only a `*-deprecated` repo, no page: document, or clean the registry row?
2. The client/server evaluation divergence is documented as fact on the page (Troubleshooting rows). File bugs against blg-shared-utilities, or is the client calculator the intended behaviour?
3. `PRICE_BOOK_STATUS` not being read by any consumer is documented as "Inactive does not stop it applying". Confirm this should stay on the page rather than be treated as a bug to hide.
4. F-0032 / blg-wiki#128 asks for a Pricebook user guide — should lane 4 draft one after the applet pages, or is that a guide-writer task?

## Notes (run 18, Pricebook)

- Pace: ~85 minutes for the Pricebook applet — small settings surface (one toggle) but the evaluation semantics live in three other repos (`blg-shared-utilities` calculator, four consumer applets, backend OCR engine) and had to be read to say what a rule does. Stopping after this page; next in queue is inventory-workflow/related-applets-stock-balance.md.
- Method (METHOD.md candidate): **for master-data applets whose data is evaluated elsewhere, the "consumed" proof for each field is a grep of the consumer engine, not of the applet** — half the rule types and one of three rule tabs exist in the editor but are never read by the client calculator; documenting the editor alone would have produced a page that is wrong for every sales document.
- The applet ships as a 792-file monorepo with `example-applet` / `testApplet` siblings; `applet-scan.sh` does not resolve the monorepo path and `gates.py` is irrelevant (applet-local settings) — both recorded in `sources` notes rather than as "0 toggles".

## Pages (run 19, Related Applets - Stock Balance)

- content/en/applets/inventory-workflow/related-applets-stock-balance.md — **restructured as an index page**, not a single-applet page (run-19 instruction; lane 2's EcomSync precedent). The page has no registry row: it is an overview of the applets around the stock balance, whose own row is `erp_stock_balance_applet` "Stock Balance" (page stock-balance-applet.md, next in queue). Title kept ("Related Applets - Stock Balance"); no `applet_code` / `applet_repo`; `modules`, `related_applets` (34 slugs), `guides: []` and a per-section `sources:` map keyed `where-it-fits` / `data-model` / `background-jobs` / `troubleshooting` added; `weight` 140 and tags kept. Sections: Overview · Where it fits (15 applets, all linked) · What a stock balance is (the two current tables, which columns are live, applied-marker, chain tip, CBAL/HBAL) · Which documents move the balance (the 25 non-zero quantity-signum types from the 137 DCOs, 17 rows linked to pages, the rest named; a warning callout listing the types that do NOT move stock) · How a FINAL reaches the balance (five-step processor chain incl. backdated and VOID) · Which applets read the balance (from a bounded git grep over 49 applet repos) · Background jobs (12 queue codes) · Troubleshooting (8 rows, code- and issue-grounded) · Related documentation. Every internal link checked to resolve. Sources: backend 353fa9a0e4, stock-balance applet 429dba9 (2025-12-02), inv-item-maintenance applet, ts-lib.

## Registry / naming mismatches (run 19)

- None new. The page is an index (no registry row expected) — please **allowlist it in the applet-audit parity check** together with lane 2's `integrations/90-ecomsync-related-applets.md` (lane 2 asked the same in its run 6, question 12). Its `sources:` keys are not the standard's `configuration/fields/lifecycle` set for the same reason.
- `stockLevelMonitoringApplet` "Stock Level Monitoring Applet" (TNT-APPLET, ACTIVE, created 2026-08-15) has a repo (`blg-applet-wavelet-stock-level-monitoring-applet`, reads the balance) and **no wiki page**; not in the exclusion list. Noted for Vincent — new page candidate for lane 4 after the queue.

## Direction / fact reversals found (run 19, Stock Balance index)

- Old page: "The stock balance applet can import Lines from … Organisation Applet, Item (inv) Maintenance, Doc Item Maintenance, Sales Invoice, Purchase Invoice, Sales Return, Purchase Return, Stock Adjustment, Sales/Purchase Credit Note, Sales/Purchase Debit Note, Internal Sales/Purchase GRN, Internal Sales/Purchase GIN". The applet has **no import feature** (one menu item, empty settings, data from `inventory-items` GET); balances are written only by the backend processors from documents with a non-zero quantity signum. Organisation and the item-maintenance applets supply master data, they write no balance.
- Old page listed Sales Credit Note, Sales Debit Note, Purchase Credit Note, Purchase Debit Note, Internal Sales GRN, Internal Purchase GRN, Internal Sales GIN and Internal Purchase GIN as feeding the balance. All eight have **quantity signum 0** in their DCOs (`correctQuantitySignum = BigDecimal.ZERO`) — FINAL creates no `bl_inv_txn_line` (`InventoryTransactionLineProcessorService` L26-29 filters signum ≠ 0). The stock-moving GRN/GIN are the separate *GRN Stock In* / *GIN Stock Out* types. Corrected with a warning callout.
- Old page: "used by … Packing Order, Delivery Order, Purchase Requisition, Quotation" — these read the balance (line stock-balance column) but were listed next to writers without distinction; now split into "documents that move the balance" and "applets that read it".
- Old page's "Inventory Admin Applet" — no such registry row or repo; dropped.
- Verified positive: Stock Adjustment's DCO fixes quantity signum **+1** (`InternalStockAdjustmentDco` L17), direction comes from the line's Adjust-In/Out sign — consistent with the adjustment page.

## Findings for the product team (run 19, Stock Balance index)

- Ten quantity columns on `bl_inv_current_location_stock_balance` / `_company_` are dead: `qty_physical`, `qty_available`, `qty_damaged`, `qty_rma`, `qty_ecom_buffer`, `qty_sales_order_open`, `qty_purchase_order_open`, `qty_work_order_open`, `qty_jobsheet_open`, `qty_reorder_level` are only ever initialised to 0 (`StockBalanceHelper` L413-425); no service, processor or SQL writes them (the Uow only filters on them, L277-279). The historical snapshot copies the zeros every night.
- `INTERNAL_SUPPLIER_RTV` DCO carries quantity signum **+1** and amount +1 (same as `INTERNAL_SUPPLIER_CONSIGNMENT_IN`). If RTV is a return *to* the vendor from the buyer's side the sign is inverted; if it is the supplier-tenant mirror it is fine. Needs a product answer before any RTV page is written.
- `ServerDocTypes` enum and the DCOs overlap but neither is complete: the enum lacks GRN Stock In / GIN Stock Out / No Stock In-Out / consignment / trade-in / refund types; the DCO directory lacks INTERNAL_PRODUCTION_ORDER / PLANNED_ORDER / SALARY_ADVICE / membership point types. Two sources of truth for signums.
- `InventoryCurrentStockBalanceQueueProcessor` has a `dataFixPurchaseInvoices` property that rewrites `bl_inv_txn_line.server_doc_type` from GRN to PI for `ETL_SYNC_STOCK_DELTA_REPLICATION` lines — a data-fix switch living inside the regular queue drainer.
- The min/max alert job (`MIN_MAX_QTY_STOCK_BALANCE_CRON_NOTIFICATION_PROCESSOR`) silently returns when `location_guids` or `recipient_emails` is missing (log.warn only) — a mis-configured job looks like "no violations".
- `RefreshStockBalanceController` has the `historical-stock-balance/backoffice-ep` endpoint commented out (L121) — no on-demand snapshot; the nightly SYSTEM processor is the only source of HBAL rows.
- Stock Balance applet still posts a `bl_inv_mst_location` subquery for its location filter (`sqService.post({subquery, table})`) although gt#6943 / gt#6577 ("Sub Query Remove") are closed — worth a check when the applet page is written.

## Cross-lane link requests (run 19, Stock Balance index)

Back-links (`related_applets` += `related-applets-stock-balance`) on: internal-sales-invoice-applet, pos-general-applet, internal-sales-return-applet, internal-sales-refund-note-applet, internal-sales-gin-stock-out-applet, internal-sales-order-applet, internal-outbound-delivery-order-applet, customer-consignment-applet (lane 1); internal-purchase-invoice-applet (finance, lane 2); internal-purchase-grn-stock-in-applet, internal-purchase-return-applet, internal-purchase-refund-note-applet, internal-purchase-order-applet, internal-purchase-grn-applet, internal-purchase-requisition-applet (lane 3); 90-ecomsync-related-applets (lane 2). Lane 4 own pages on next touch: stock-balance-applet (next), stock-availability, stock-report, stock-take, stock-adjustment, stock-transfer, stock-conversion, stock-reservation, stock-replenishment, internal-stock-requisition, consignee-stock-transfer, internal-consignment-grn/gin, non-stock-and-trade-in, warehouse-management, inv-item-maintenance, doc-item-maintenance, organisation.
- content/en/applets/sales-workflow/internal-sales-credit-note-applet.md, internal-sales-debit-note-applet.md, internal-sales-grn-applet.md, internal-sales-gin-applet.md (lane 1) and purchase-workflow/internal-purchase-credit-note-applet.md, internal-purchase-debit-note-applet.md, internal-purchase-grn-applet.md, internal-purchase-gin-applet.md (lane 3): state explicitly that FINAL does **not** move stock (quantity signum 0) and link the index page's warning callout; any "reduces/increases stock" sentence is wrong (METHOD §14 already says so for Purchase GIN).
- content/en/applets/sales-workflow/internal-sales-return-applet.md and purchase-workflow/internal-purchase-return-applet.md (lanes 1/3): Troubleshooting row for intercompany return pairs booking quantity at the counterpart's store (gt#9555; compare `guid_store` / `delivery_location_guid` on header and lines) — same family as open #5579 already requested in run 17.
- content/en/applets/master-data/organisation-applet.md (lane 4, own, next touch): location deactivation does not stop documents that still carry the location from posting there (gt#9080: 26 transactions stuck in a deactivated bucket location); add to the Location section.
- content/en/applets/inventory-workflow/stock-report-applet.md (lane 4, own, next touch): Historical Stock Balance = nightly HBAL snapshot of the current rows vs Stock Summary by Location = ledger-line sum by date; they can differ after a backdated / voided / refreshed line (gt#4807). Also: trade-in stock is not in either (gt#1422 open).
- content/en/applets/inventory-workflow/non-stock-and-trade-in-applet.md (lane 4, own, next touch): add that trade-in units are excluded from every inventory balance report and that gt#1422 (open) asks for a combined view.
- content/en/applets/inventory-workflow/stock-replenishment-applet.md and master-data/inv-item-maintenance-applet.md (lane 4, own): min/max per location live on the balance row (`update-min-max-qty`, Location tab; Stock Min Max Import; replenishment run seeding) and feed the min/max e-mail job — say so on both pages.
- content/en/modules-v2/inventory/_index.md (module owner): the "Stock Balance & Valuation Engine" row should link `/applets/inventory-workflow/related-applets-stock-balance/`; the checklist "opening stock balances uploaded" should point at Stock Adjustment (the Stock Balance applet has no upload).
- content/en/applets/_index.md L97 and applet-catalog.md L317 link `/applets/stock-balance-applet/` (alias, resolves) — fine; consider adding the index page under the inventory group.

## Screenshots (run 19, Stock Balance index)

The old page had no images and none were added (the page is an index; the applet's screens belong on stock-balance-applet.md). Nothing to classify as "login e-mail only" (F-0167). Recapture wanted for the next page, from a GadgetSphere-seeded tenant: Stock Balance Listing (item × company × location with qty_balance / MA cost / last purchase cost), Stock Balance View › Main / Batch / Scrap tabs, Batch No History.

## Questions for Vincent (run 19)

1. Allowlist `inventory-workflow/related-applets-stock-balance.md` (and lane 2's EcomSync index) in the applet-audit parity check as index pages, or introduce a `page_type: index` key in the standard (lane 2 asked the same; not added because it is not in the standard)?
2. `stockLevelMonitoringApplet` "Stock Level Monitoring Applet" is ACTIVE (2026-08-15) with a repo and no page — add to lane 4's queue?
3. `INTERNAL_SUPPLIER_RTV` quantity signum +1 — intended (supplier-tenant mirror) or inverted? Affects any future RTV page and the "stock out" wording on the purchase-return page.
4. The ten dead quantity columns on the balance tables are documented as "present but never written". Keep that on a public page, or move it to the product-team findings only?

## Notes (run 19, Stock Balance index)

- Pace: ~70 minutes. Index pages go faster than applet pages because there is no four-proof settings census; the time went into extracting signums from all 137 DCOs (the `ServerDocTypes` enum alone is incomplete — see findings) and into the bounded consumer grep.
- Method (METHOD.md candidate): **for "related applets" hubs, the invention-free evidence is (a) the DCO `correctQuantitySignum` / `correctAmountSignum` constants across the whole directory — not the `ServerDocTypes` enum, which lacks a third of the stock-moving types — (b) the queue codes of the job processors that write the table, and (c) a bounded `git grep` per applet repo for the read endpoints.** A page built from those three lists cannot repeat the old page's mistake of listing zero-signum documents as stock movers.
- kb/topics: created `stock-balance.md` (the topic slug that six existing topics already point to via `related:`), not `related-applets-stock-balance.md`; the stock-balance-applet page (next) extends the same topic.
- `kb/tools/gates.py` and `applet-scan.sh` were not applicable (no shared FieldConfigurationComponent on an index page; the Stock Balance applet has an empty settings menu) — recorded here rather than as "0 toggles". Plain-grep second pass done for every `qty_*` column and every queue code.

---

# Run 20 — 2026-09-05 — master-data/shipping-pricebook-applet.md

## Pages completed (run 20)

- `content/en/applets/master-data/shipping-pricebook-applet.md` — rewritten to the standard. Registry `ShippingPricebookApplet` "Shipping Pricebook" (TNT-USER, ACTIVE, 2021-07-29; `documentation_url` = this page). Title changed from "Shipping Pricebook Applet" to "Shipping Pricebook"; `page_type: applet`; `applet_code`, `applet_repo`, `modules: [ecommerce, core]`, `related_applets` (8), `guides`, per-section `sources:`; `weight` 150 and tags kept; no BOM (file had none). Old marketing body (Golden Triangle, Quick Start, FAQ, infographic) replaced by Overview · Where it fits · Screens and menus · Configuration · Fields (Pricebook create / edit, Priceset create, Rules tabs, Treatment tab) · Lifecycle and effects (what the applet writes, backend validation, no posting, the six-step storefront evaluation, rule-coverage table) · Related applets · Troubleshooting (12 rows) · Related documentation. Sources: applet 7894b78 (2026-09-02), storefront wavelet-cp-commerce 247243251 (2026-09-03), CP Commerce Admin 813f007c8, backend 20fbeede40, ts-lib 7d1616a9e, shared-utilities a8c38a2. Topic `kb/topics/shipping-pricebook-applet.md` created.

## Registry / naming mismatches (run 20)

- None. One registry row, one repo, one page.

## Direction / fact reversals found (run 20)

- Old page: "Multiple pricebooks can coexist, with the system intelligently selecting the most relevant one" and a Priority explanation where "Priority 1 overrides Priority 100" is presented as a tie-breaker among matching rules. Actual: the shopper picks **one** price book at checkout (or the website default); within it the storefront walks price sets by `priority_line` **ascending** and takes the **first** whose Doc Hdr and Multi Line rules pass. Lower number = evaluated first, which is consistent with the old page's example but not with "the system selects the most relevant pricebook".
- Old page: Single-Line rules "apply individually to each specific item … a single order can generate multiple fee entries". Actual: `ShippingManager` never calls `evaluateSingleLineHdrRules`; the Single Line tab is stored but ignored, and there is exactly one fee line per cart.
- Old page: "Valid Date Range: trigger specific rates only during promotional periods". Actual: the storefront maps the rule to a node with null start/end dates — it always passes (Negation Enabled → never passes).
- Old page: Delivery Region "supports three levels of geographic granularity (State, Postcode, Zone)". Actual: only the shipping address **state** is compared (case-insensitive) with the selected regions' State.
- Old page: each of the three fees uses its own Price Source; "Pricing Scheme — complex weight-based logic reading from a dynamic Tier Scheme"; "Price Unit Cost — the cost price of the item (what you paid the supplier)". Actual: all three operators are applied to the aggregate of the **Standard Shipping Fee** price source; `pricing_scheme` reads a field that does not exist on the cart line; `price_unit_cost` maps to `unit_price_std` (the selling unit price), not a supplier cost.
- Old page FAQ: "If two pricesets have the same priority the system selects the first one created". Actual: ties keep API (created-date ascending) order — coincidentally the same outcome, but the mechanism is the mapper's `originalIndex`, not a rule.
- Old page FAQ: "Shipping fees inherit the tax settings from the G/L Account and Financial Item they are mapped to in the Finance module" — kept in substance: the fee is a line of the website's shipping-fee SERVICE item and posts by that item's configuration; there is no mapping inside this applet.
- Old page "Applet Integration & Permissions": webhooks "push shipping fee calculations to external 3PL systems in real time", "Field Settings: customise the mandatory/optional status of form fields". Actual: the Webhook screen is the generic shared one (events are applet-level audit rows `PRICE_BOOK_UPDATED` etc.), and Field Settings is an unbound stub. Removed.
- Old page "Distance-Based Support: calculate fees based on warehouse-to-destination distance" — no such feature anywhere in the applet or storefront. Removed.

## Findings for the product team (run 20)

- **No working applet setting.** `FieldConfigurationComponent` in this applet is a static template (8 `mat-slide-toggle`s without `formControl`, SAVE without a handler). `DefaultSettingsComponent` (Settings) and `PersonalDefaultSettingsComponent` (Personalization) both write into `this.appletContainer`, which is never assigned: no `appletSettings$` subscription, and the shared `<app-settings>` host neither binds the input nor listens to `save` (`SettingsComponent.onSaveDefault` is commented out). Changing Branch/Location throws a TypeError in the console. Compare the Pricebook applet, whose Default Selection subscribes to `SessionSelectors.selectMasterSettings` and works.
- **Applet Status is an extension, storefront filters the column.** The applet stores Active/Inactive as `bl_fi_mst_shipping_price_book_ext` `PRICE_BOOK_STATUS` and never touches `hdr.status`; the storefront asks the website endpoint for `status = ACTIVE` (header column) and never reads the extension. An Inactive price book is still offered as a shipping method. (Same shape as the Pricebook finding in run 18, different consumer.)
- **Storefront evaluation diverges from the applet UI in five ways** (wavelet-cp-commerce 247243251): Single Line rules never evaluated; Valid Date Range always true (rule mapped to `RuleRelDateTimeNode` with `start_date`/`end_date` null and an `issue_date` the applet never writes); Delivery Region compares state only; `FIRST_MATCH` / Calculation Logic read but every value behaves as sequential (`calculationLogicAlgorithm` returns `[0]`); Handling Fee and Fuel Surcharge ignore their own `price_source` and reuse the Standard Shipping Fee aggregate. The applet still offers `POINTS_REWARD_*` / `POINTS_REDEEM_*` calculation-logic options that are meaningless for shipping.
- **`PRICE_BOOK_CREATED` audit event is never written**: `createPricebook$` builds `this.pricebookService.post(...).pipe(map(post event))` inside a `map` and never subscribes; the actual POST is the later `mergeMap`. Update/delete/price set events are written.
- **No code-uniqueness validation** in `ShippingPriceBookDataConsistencyObject` (the Pricebook DCO has `PRICEBOOK_HDR_OBJECT_CODE_ALREADY_EXIST`); two shipping price books with the same code can coexist.
- **Dead backend family**: `bl_fi_mst_shipping_price_book_rule_hdr/_line/_ext`, their DCOs, Uows and controllers exist; no applet, storefront or CP Commerce Admin code references them (bounded grep across refs/).
- **Anonymous read endpoint**: `shipping-pricebooks/website-ep/{websiteHdrGuid}/query` is an `AnonymousTenantEndpoint` that only checks the website guid exists — every price book of the tenant (all rules, all member-class guids) is readable without login given a website guid. Probably intended (the storefront is anonymous before login) but worth a look.
- **Price Source = Pricing Scheme is unusable at checkout** (`Number(genDoc.pricing_scheme)` on a generic doc line → NaN/0); the Treatment tab still offers it and loads the scheme list.
- **Second UI for the same data**: the storefront's Website Builder has a Shipping Management screen (gh:bigledger/wavelet-cp-commerce#190) that creates/updates shipping price books through the same service and extension — it sets `PRICE_BOOK_STATUS`, name, icon and description but has no rule/treatment editing. Not documented anywhere on the wiki.
- **Empty item rule kills the price set**: documented in the storefront mapper as a deliberate known gap ("dropping such rules would re-enable pricesets that are currently dead … going from shipping is free to shipping is charged"). Users must delete empty rules in the applet.

## Cross-lane link requests (run 20)

- `content/en/applets/ecommerce/cp-commerce-admin-applet.md` (lane 2): add `shipping-pricebook-applet` is already in its `related_applets` — fine. Its *Shipping Fee Options* row (L204) should say the *Shipping Pricebook* option is evaluated client-side by the storefront (sequential match on Doc Hdr + Multi Line rules) and link `/applets/master-data/shipping-pricebook-applet/#lifecycle-and-effects`; its Troubleshooting row "Shipping options do not appear at checkout" (L1084) should add "no *Item Code for Shipping Fee* → the storefront adds no line and shows RM 0.00" and "an Inactive shipping price book is still offered (Status is an extension)".
- `content/en/applets/ecommerce/shopping-cart-applet.md` (lane 2): `related_applets` += `shipping-pricebook-applet`; state that the shipping fee on a DRAFT cart is a quantity-1 line of the website's shipping-fee SERVICE item, computed by the storefront from the selected shipping price book and re-discountable by coupons (free-shipping label).
- `content/en/applets/ecommerce/website-builder/_index.md` or a new page (lane 2): document the Website Builder → Shipping Management screen (gh:bigledger/wavelet-cp-commerce#190, #148) as a second editor of shipping price books (header fields and status only).
- `content/en/applets/master-data/doc-item-maintenance-applet.md` (lane 4, own, next touch): `related_applets` += `shipping-pricebook-applet`; note that item weight / width / length / height feed the shipping weight and volumetric bands, and that the shipping-fee item must be `txn_type` SERVICE.
- `content/en/applets/master-data/organisation-applet.md`, `membership-admin-applet.md` (lane 4 own / membership lane): back-link `shipping-pricebook-applet` in `related_applets` (Company / Branch rules; member class / label rules).
- `content/en/applets/master-data/customer-maintenance-applet.md` (lane 4, own): back-link; Entity Type rules match the cart entity's types.
- `content/en/applets/sales-workflow/internal-sales-order-applet.md` (lane 1): back-link; a cart converted from the storefront carries the shipping fee as a service line — nothing in the SO applet recomputes it.
- `content/en/applets/master-data/pricebook-applet.md` (lane 4, own): already links here; on next touch add one sentence that the Shipping Pricebook's consumer is the storefront only (no POS / SI / SO / OCR evaluation).
- `content/en/modules-v2/core/_index.md` L86 and `content/en/applets/_index.md` L86 (module owner): link text "Shipping Pricebook Applet" → "Shipping Pricebook"; description "Define shipping and delivery rate cards" is fine, "Automated shipping fee calculations" should say "for the CP Commerce storefront".

## Screenshots with personal data (run 20)

Dropped from the page (references removed; files to quarantine):
- `static/images/shipping-pricebook-applet/shipping-pricebook-applet-pricebook-listing.png` — sidebar shows a real tenant code (customer staging tenant) and a listing row whose name may be a person's given name.
- `static/images/shipping-pricebook-applet/shipping-pricebook-applet-pricebook-create.png` — same listing rows visible in the left column.
- `static/images/shipping-pricebook-applet/shipping-pricebook-applet-pricebook-edit-details.png` — same listing rows visible in the left column.
- `static/images/shipping-pricebook-applet/shipping-pricebook-applet-priceset-listing.png` — sidebar shows the same real tenant code.
- `static/images/shipping-pricebook-applet/shipping-pricebook-applet-overview-infographic.png` — AI marketing infographic, does not show the product (same decision as the Pricebook page, run 18).

Kept (7): `pricebook-edit-add-priceset`, `priceset-add`, `priceset-edit-details`, `priceset-edit-rules-doc-hdr`, `priceset-edit-rules-multi-line`, `priceset-edit-rules-single-line`, `priceset-edit-treatment` — test data only (TESTING / PRICEBOOK-1 / TESTING-SET-2), no tenant code, Created By / Modified By blank.

"Login e-mail only" captures: none (every Created By / Modified By field in the kept and dropped captures is blank).

Recapture wanted from a GadgetSphere-seeded tenant: Shipping Pricebook Listing, Create Shipping Pricebook, Shipping Pricebook Edit › Details (shows Calculation Logic), Shipping Priceset Listing, one Add Rule form each for Delivery Region (grid Code · Delivery Region · State · Country) and Item (Min Quantity / Min Amount / weight bands), and the storefront checkout "Shipping method" block with the fee line.

## Questions for Vincent (run 20)

1. The five storefront divergences (single-line ignored, date range always true, region = state only, calculation logic ignored, handling/fuel reuse the shipping aggregate) are documented on the page as behaviour. File them as issues against `wavelet-cp-commerce`, or leave as documentation only?
2. Should the applet's Status also set `hdr.status` (so Inactive books stop appearing at checkout)? If yes this is a one-line applet change plus a storefront-side no-op; if no, the page's advice ("delete instead of deactivate") stands.
3. The applet's Settings › Field Settings and Default Selection are dead. Hide the Settings menu entries, or fix the wiring (Pricebook applet has the working pattern)?
4. Website Builder › Shipping Management (storefront repo) is a second editor for this master data — who documents it (lane 2 ecommerce, or a section on this page)?

## Notes (run 20)

- Pace: ~95 minutes. Time went into the consumer trace (three repos: storefront, CP Commerce Admin, backend) because the applet itself has no evaluation logic; the four-proof census was short (no working settings).
- Method (METHOD.md candidate, extends §21): **when the consumer is a storefront rather than a back-office applet, the "consumed" proof lives in `wavelet-cp-commerce` (`src/app/models/**-manager.ts`, `utils/mappers/**`, `models/rule-conditional-nodes/**`)** — and it is anonymous-endpoint driven (`*/website-ep/{websiteHdrGuid}/*`), so permission sections must say the storefront needs none of the tenant permissions.
- Method: the Pricebook (run 18) and Shipping Pricebook applets share the copy-pasted settings scaffolding; whether Default Selection works depends only on whether the component subscribes to `selectMasterSettings`. Check that one line before documenting any `DEFAULT_*` key in this applet family.
- `gates.py` / `applet-scan.sh` not applicable (shared `FieldConfigurationComponent` not routed); plain-grep second pass done for `DEFAULT_BRANCH`, `DEFAULT_LOCATION`, `APPLET_SETTINGS`, `FIRST_MATCH`, `PRICE_BOOK_STATUS`, every treatment key and every rule key.
- Customer-specific repos that also contain shipping-price-book code (four storefront forks and two platform forks found by the bounded grep) were not opened; the org-wide `wavelet-cp-commerce` is the canonical storefront and is cited by name.

## Pages completed (runs 21–22, Stock Balance)

- `content/en/applets/inventory-workflow/stock-balance-applet.md` — written in run 21 (the run was killed by a rate limit after the page was committed but before the ledger / topic / state were recorded); run 22 re-verified every cited line against the code and recorded it. Registry `erp_stock_balance_applet` "Stock Balance" (TNT-USER, ACTIVE; `documentation_url` = `/applets/stock-balance-applet/`, kept as alias). Title changed from "Stock Balance Applet" to "Stock Balance"; `page_type: applet`; `applet_code`, `applet_repo`, `modules: [inventory, purchasing, pos, manufacturing]`, `related_applets` (11), per-section `sources:` (screens, configuration, fields, lifecycle, troubleshooting); `weight` 185 and tags kept; no BOM (file had none). Body: Overview · Where it fits · Screens and menus (listing, advanced search, unreachable pages) · Configuration (prerequisites; "No exposed control found (commit `429dba9`)"; keys read without a control; settings in other applets; server-side permission with targets) · Fields (search → DTO table; listing columns → DTO / backend column) · Lifecycle and effects (reads only; query shape; no posting proof block applies) · Related applets · Troubleshooting (11 rows) · Related documentation. Sources: applet 429dba9 (2025-12-02), backend 20fbeede40, shared-utilities a8c38a2. Topic `kb/topics/stock-balance.md` extended (run 19's applet fact corrected: the listing reads `inv/stock-availability`, not `InventoryItemService.getByCriteria`).

## Registry / naming mismatches (runs 21–22)

- None. One registry row, one repo, one page (plus the index page `related-applets-stock-balance.md`, run 19).

## Direction / fact reversals found (runs 21–22, Stock Balance)

- Old page: "drill down into bin and scrap-bin balances" and "view the batch / movement history of an item". Actual: the Stock Balance View (Main / Bin / Scrap Bins) and Batch No History pages are registered but unreachable — nothing navigates to them, the bin grids bind to `[]`, and Batch No History queries the item master. Removed.
- Old page: the grid "shows available quantity" / "reserved quantity". Actual: the endpoint returns `qty_reserved`, `qty_adjustment`, `qty_available`, FIFO / LIFO cost, but the listing defines columns only for item code, EAN, company, location, `qty_balance` (= `qty_ledger`), `ma_cost`, `company_last_purchase_cost`. Nothing else is reachable through the Columns panel.
- Old page: the Companies filter "restricts the grid to the selected companies". Actual: the shared search emits `companyGuids` but `onSearch` never reads it (assignment commented out). The Company column filter is the working alternative.
- Old page: "Item Code — exact match". Actual: Item Code is sent as the fuzzy `keyword` (space-split `ILIKE` over code, name, description, scan code, alternate codes, remarks).
- Old page: "the applet's Field Settings hide the cost columns". Actual: no settings pages exist (`settingItems = []`); the `HIDE_LISTING_*` keys live in an unused tooltip component and have no effect.
- Old page: opening-stock upload / import from the applet. Actual: none; opening stock is a Stock Adjustment (already corrected on the index page in run 19; kept consistent here).

## Findings for the product team (runs 21–22, Stock Balance)

- **Dead scaffolding shipped in the build**: `StockBalanceView` (3 tabs) and `BatchNoHistory` pages, `AppletSettings` model with document-applet keys, `CustomTooltip` reading `HIDE_LISTING_{AVG,LAST_PURCHASE,FIFO,LIFO}_COST` — none reachable. Either wire them (the tooltip would be a cheap per-role cost-hiding feature if the `SHOW_LISTING_*` permissions were seeded) or delete them.
- **Companies filter is a no-op** (`stockBalSearchDto.company_guids` commented out in `onSearch`). With READ targets scoped to companies only, the backend derives companies from the requested locations, so the result is still correct — but the control misleads.
- **Location drop-down is unpermissioned** (`DropDownController` L153–L156 commented out): any authenticated user of the tenant can list every location code / name via `POST .../drop-down/location`. The stock figures themselves are still gated by the stock-availability READ targets.
- **No location-status filter** in `StockAvailabilityUow` — a deactivated location with a residual balance keeps appearing (gt#9080 pattern). Consider blocking deactivation while `qty_ledger <> 0`, or filtering `loc.status`.
- **Item Code filter is fuzzy**: `SM-` matches every code containing `SM-` and also names / remarks. An exact-code option would remove a recurring confusion.
- **`qty_available` is computed client-side but never shown**; the grid re-implements Stock Availability's merge (`removeDuplicate`) for nothing. Either show it or drop the computation.

## Cross-lane link requests (runs 21–22, Stock Balance)

- `content/en/applets/inventory-workflow/stock-availability-applet.md` (lane 4, own, next touch): state that the Stock Balance applet calls the same `inv/stock-availability` endpoint and that its *Balance* column equals this grid's *Bal*; `related_applets` already contains `stock-balance-applet`? — verify and add.
- `content/en/applets/inventory-workflow/stock-report-applet.md` (lane 4, own, next touch): Troubleshooting row for "Historical Stock Balance ≠ Stock Balance applet" (nightly HBAL snapshot vs live chain tip; gt#4807) — same request as run 19, not yet applied.
- `content/en/applets/master-data/organisation-applet.md` (lane 4, own, next touch): Location section — "empty the location (transfer / adjust out) before deactivating; a deactivated location with stock still shows in Stock Balance / Stock Availability" (gt#9080).
- `content/en/applets/inventory-workflow/non-stock-and-trade-in-applet.md` (lane 4, own, next touch): state which enquiry screens include trade-in stock (Stock Balance and Stock Availability via the NSTI UNION; not Stock Report's historical / summary reports — gt#1422 open).
- `content/en/applets/inventory-workflow/stock-reservation-applet.md` (lane 4, own, in queue): back-link `stock-balance-applet`; note that `qty_reserved` is returned by the endpoint but not shown in the Stock Balance grid.
- `content/en/modules-v2/inventory/_index.md` (module owner): "Stock Balance & Valuation Engine" row → link both `/applets/inventory-workflow/stock-balance-applet/` (the applet) and the index page; link text "Stock Balance Applet" → "Stock Balance".
- `content/en/modules/manufacturing.md`, `content/en/modules/manufacturing/_index.md`, `content/en/modules/inventory/_index.md`, `content/en/modules/inventory-warehouse/_index.md`, `content/en/modules-v2/inventory/reports/_index.md`, `content/en/modules-v2/inventory/use-cases/_index.md`, `content/en/modules-v2/ecommerce/use-cases/_index.md`, `content/en/modules-v2/manufacturing/use-cases/_index.md` (module owners): links to `/applets/stock-balance-applet/` resolve via the alias; link text "Stock Balance Applet" → "Stock Balance" on next touch.

## Screenshots (runs 21–22, Stock Balance)

Kept (3): `sb-setting.png` (Settings page: only the generic `STAGING_TENANT` label and the shared permission menu), `sb-column.png` (Columns tool panel), `sb-search.png` (Advanced Search panel) — no rows, no names, no tenant-identifying data.

Dropped from the page (references removed; files to quarantine, 14):
- `sb-listing.png`, `sb-listing-1.png`, `sb-wo-pivot.png` — listing rows with test items that include people's first names (e.g. "… TEST 1", "… wavelet"), a consumer-electronics brand in an item name, and company labels of the staging tenant.
- `sb-chart.png`, `sb-chart-pie.png`, `sb-chart-donut.png`, `sb-export.png`, `sb-export-csv.png`, `sb-export-excel.png`, `sb-export-download.png` — ag-grid chart / export menus captured over the same listing rows (same names visible in the background), and they document ag-grid, not the applet.
- `sb-role-perm.png`, `sb-user-perm.png` — shared permission screens showing role / user names of the staging tenant.
- `sb-quick-guide.png`, `stock-balance-overview.png` — AI marketing infographics (2.2 MB and 2.8 MB), do not show the product (same decision as the Pricebook / Shipping Pricebook pages).

Recapture wanted from a GadgetSphere-seeded tenant: the default pivot listing (Item Code rows × `GS-KV-01`, `GS-KV-02`, `GS-PEN-01` … columns with a total footer), the flat listing with Pivot Mode off, and the right-click context menu showing Export → CSV / Excel.

## Questions for Vincent (runs 21–22)

1. The Location drop-down endpoint's permission check is commented out in the backend (`DropDownController` L153–L156). Documented as behaviour on the page; file as an issue against `blg-akaun-platform-java`?
2. Should the unreachable Stock Balance View / Batch No History pages and the dead `HIDE_LISTING_*` tooltip be filed as a cleanup issue on `blg-applet-wavelet-stock-balance-applet`, or left?

## Notes (runs 21–22)

- Run 21 lost only bookkeeping, not content: the page in commit 78cdaed4 matched the standard (all nine H2s in order, per-section `sources:`, four-proof census, no posting block by design) and passed `tests/content-lint.sh`; run 22 re-verified 12 cited backend / applet line ranges — all correct — and changed nothing on the page.
- Method (METHOD.md candidate): **for an enquiry applet, the "consumed" proof of a permission is the target-filter branch in the controller, not the `hasPermission()` line** — `_READ` with `getCompanyLocationTargetMap()` behaves differently from `_ADMIN`/`_OWNER` and the "empty result vs not authorised" symptom depends on whether the intersection survives.
- `gates.py` / `applet-scan.sh` not applicable (no settings routes). Plain-grep second pass done for every key in `applet-settings.model.ts`, `HIDE_LISTING_*`, `SHOW_LISTING_*`, `DEFAULT_*`, `tooltipComponent`, `company_guids`.

## Pages completed (run 22, Stock Conversion)

- `content/en/applets/inventory-workflow/stock-conversion-applet.md` — rewritten to the standard. Registry `stock_conversion_applet` "Stock Conversion" (TNT-USER, ACTIVE, 2024-01-29; `documentation_url` = this page path). Title changed from "Stock Conversion Applet" to "Stock Conversion"; `page_type: applet`; `applet_code`, `applet_repo`, `modules: [inventory, manufacturing]`, `related_applets` (10), `guides`, per-section `sources:` (screens, configuration, fields, lifecycle, troubleshooting); `weight` 170 and tags kept; no BOM (file had none); no aliases (registry URL already equals the page path). Old marketing body (analogies, Quick Start, scenarios, FAQ, invented settings) replaced by Overview · Where it fits · Screens and menus · Configuration (prerequisites; applet-local settings table; stub Field Settings; read-without-control keys; settings elsewhere; server/client permissions) · Fields (Main Details; line panel; Job Order Link) · Lifecycle and effects (transition table with backend throws; full posting proof block; printing) · Related applets · Troubleshooting (10 rows) · Related documentation. Sources: applet 9a9d22f (2026-08-06), backend 1ff620ef0e (2026-09-05), ts-lib 7d1616a9e, shared-utilities a8c38a2. Topic `kb/topics/stock-conversion-applet.md` created; `kb/topics/stock-balance.md` given a stock-conversion edge.

## Registry / naming mismatches (run 22)

- None for this page. Observation: repo `blg-applet-wavelet-internal-kitting-applet` exists (gt#6084, gt#6598) with **no ACTIVE registry row under any kitting name** and no wiki page — not documented per ADR-0002; listed here so nobody creates a page for it by mistake.

## Direction / fact reversals found (run 22, Stock Conversion)

- **Old page: "Upon Finalization, stock is deducted from inputs and added to outputs."** Actual: Input lines are stored `+quantity_base`, Output lines `−quantity_base`, `quantity_signum = 1`, and the balance is `prev + signum × base` — **an Input line increases stock, an Output line decreases it**. Serial-number create/delete and bin create/update follow the same sign. Documented as behaviour; whether the tab names or the constants are wrong is a product question (below).
- Old page: "The system calculates the total value of inputs and assigns it to the outputs." Actual: `amount_signum = 0`, no price control on the line panel, no value logic anywhere; MA cost is recomputed per ledger line from a line `amount_txn` that the applet never sets.
- Old page: "Bin: specific location within the warehouse … Strict Bin Validation: prevent finalization if items are not in the selected Bin." Actual: no such setting; bins are a JSON list on the line, validated only by the balance processor after FINAL.
- Old page: "Insufficient Stock error prevents finalization." Actual: no stock-on-hand check anywhere (DCO is header-only; the ledger allows negatives).
- Old page: Settings › Application Settings "Enable Auto-Reference", "Strict Bin Validation"; Default Selection "Default Bin". Actual: Application Settings is an unbound stub; Default Selection has Default Branch and Default Location only.
- Old page: "Batch Actions: select multiple records for finalization or printing"; "Printable Documentation". Actual: batch FINAL exists; no print action exists in the applet (backend endpoint only).
- Old page: "To correct a mistake you must create a Reverse Conversion." Partly right — there is no VOID button, but the backend VOID endpoint exists and reverses the ledger lines.
- Old page: Conversion Code "auto-generated". Actual: free text, required, not unique; the backend running number `stock_conversion_no` is generated but never shown.

## Findings for the product team (run 22, Stock Conversion)

- **Tab semantics vs constants** (the reversal above). If Input is meant to be *consumed*, `AppletConstants.amount_signum_input/output` (and the four `quantity_base` assignments in input/output add/edit) are inverted. If Input is meant to be *into stock*, the tab labels and the old documentation misled users. Either way the listing/guides need one sentence saying which.
- **`DEFAULT_BRANCH` is silently mandatory**: the branch drop-down is commented out of Main Details but the `branch` control keeps `Validators.required`; with no applet-level Default Branch, SAVE can never be enabled and nothing tells the user why.
- **Personal Default Selection is stored but never applied** (no `selectPersonalSettings` subscriber); **Field Settings is a stub** (unbound toggles, SAVE without handler) — same copy-paste family as Shipping Pricebook (run 20).
- **Zero-cost stock-in**: Input lines enter the ledger with no `amount_txn`, diluting the location's moving-average cost on every conversion.
- **No line validation**: no code uniqueness, no quantity/serial-count cross-check, no stock check; lines saved without `guid_comp`.
- **VOID endpoint has no permission check** (`/backoffice-ep/void/{guid}` checks only authentication); FINAL needs only `_READ`.
- **Dead surface**: `process_type_code` options, `job_order_hdr_guid` / `process_guid` / `machine_guid` DCO checks, `PRINTABLE` setting and the Jasper print endpoint, `HIDE_*` keys read by templates with no settings control.
- **Unreachable batch-FINAL error**: the listing filters out FINAL rows client-side, but a stale grid can still send a second FINAL and surface the 403 text as a toast.

## Cross-lane link requests (run 22, Stock Conversion)

- `content/en/applets/inventory-workflow/related-applets-stock-balance.md` (lane 4, own, next touch): the two Stock Conversion rows (L82, L127) — state that the ledger `server_doc_type` is the literal `Stock Conversion Applet` (not a `ServerDocTypes` value, hence outside the 25-type DCO sweep) and that Input adds / Output removes.
- `content/en/applets/inventory-workflow/stock-report-applet.md` (lane 4, own, next touch): mention that conversion lines appear under document type `Stock Conversion Applet` in movement reports.
- `content/en/applets/inventory-workflow/stock-adjustment-applet.md` (lane 4, own, next touch): `related_applets` += `stock-conversion-applet`; one sentence "for many-to-one / one-to-many item changes use Stock Conversion (no journal, no reason code)".
- `content/en/applets/manufacturing/internal-packing-order-applet.md` (lane 3): `related_applets` += `stock-conversion-applet`; say which tool does kitting — Packing Order (packing list, production side) vs Stock Conversion (ad-hoc, no BOM) — and that an internal-kitting applet repo exists without a registry row.
- `content/en/applets/master-data/inv-item-maintenance-applet.md`, `doc-item-maintenance-applet.md`, `organisation-applet.md` (lane 4, own): back-link `stock-conversion-applet` (inventory link / PACKAGE ratio decide whether a line posts; branch `MAIN_LOCATION` is the fallback store and the Default Selection auto-fill).
- `content/en/modules-v2/inventory/_index.md` L58, `content/en/modules-v2/inventory/related-applets/_index.md` L22, `content/en/modules-v2/inventory/use-cases/_index.md` L32, `content/en/modules-v2/manufacturing/related-applets/_index.md` L22, `content/en/modules-v2/manufacturing/use-cases/_index.md` L32 (module owners): link text "Stock Conversion Applet" → "Stock Conversion"; add "no bill of materials, no costing".

## Screenshots (run 22, Stock Conversion)

Kept (1): `static/images/stock-conversion-applet/stock-conversion-settings.png` — Settings menu only (generic `STAGING_TENANT` label, no data).

Dropped from the page (references removed; files to quarantine, 3):
- `stock-conversion-listing.png`, `stock-conversion-create-form.png` — listing rows include a person's first name as test data ("… test 2") and a location label that may be a product/brand name.
- `stock-conversion-overview-infographic.png` — AI marketing infographic (same decision as Pricebook / Shipping Pricebook / Stock Balance).

"Login e-mail only" captures: none.

Recapture wanted from a GadgetSphere-seeded tenant: the listing with two DRAFT and one FINAL row (codes like `SC-KV01-0001`), the create form on Main Details, the Input tab with one accessory line and the Output tab with one bundle line, and the line panel's Item Details tab showing the five controls.

## Questions for Vincent (run 22)

1. **Input / Output direction.** Code: Input adds stock, Output removes it. Is that the intended meaning of the tabs (into / out of stock), or should the constants be flipped so that Input = consumed? The page documents the code; a one-line product decision would let the guide say it without hedging.
2. Should the Stock Conversion applet get a VOID button (backend endpoint exists, no UI), or keep "post a reversing conversion" as the documented correction path?
3. File issues for (a) the silently mandatory `DEFAULT_BRANCH`, (b) the un-permissioned VOID endpoint, (c) dead Field Settings / personal defaults — or leave as documentation?

## Notes (run 22)

- Pace: Stock Balance verification + bookkeeping ~20 min; Stock Conversion ~55 min (own tables and two processor chains, plus the direction proof). Stopped before Stock Replenishment deliberately — see the handover below.
- Method (METHOD.md candidate, extends §12 and §22): **for a non-generic document, the direction proof is not a DCO signum — it is the applet's own constants × the factory copy × `calculateResultBalance`.** Grep `quantity_base =` in the applet (all four add/edit components), then `setQuantity_signum` / `setQuantity_base` in the factory method for that document, then confirm the arithmetic in `StockBalanceHelper.calculateResultBalance`. The serial create/delete branch (`signum × base > 0`) is an independent second witness.
- Method: a required form control whose template control is commented out is a hidden prerequisite — grep `Validators.required` and diff against the template's rendered controls before writing "Before you can use it".
- `gates.py` / `applet-scan.sh` not applicable (settings are applet-local, no shared screen). Plain-grep second pass done for every key in `applet-settings.model.ts`, `HIDE_BIN`, `SHOW_COSTING_DETAILS`, `selectPersonalSettings`, `PRINTABLE`, `print`, `void`, `discard`, `delete`.

## Handover: Stock Replenishment (next in queue, not started — run 23)

Read but not written up (registry `stockReplenishmentApplet` "Stock Replenishment Applet", TNT-ADMIN, ACTIVE; `documentation_url` points at Confluence, so the page will need an alias decision only if Vincent wants the registry updated; repo `blg-applet-wavelet-stock-replenishment-applet` commit 7169e01, 2026-09-02):
- Menus: Replenishment Runs, Replenishment Events, Replenishment Template, Order Qty Reports, Audit Trail. Settings: Field Settings (**stub** — same unbound template, component has no form at all), Default Selection (`DEFAULT_BRANCH`, `DEFAULT_LOCATION`, `STOCK_REPLENISHMENT_DETAILS_TAB_ORDER` — drag-and-drop tab order over nine Run-view tabs; a Reset that nulls the defaults), Printable Format Settings, **Email Template** (applet-level notification templates with placeholders); Personalization: Field Settings + Default Selection.
- The applet's `api-service.ts` posts to `inv/stock-availability` (same endpoint as Stock Balance / Availability) for the item list; run/template/event data go through ts-lib `StockReplenishment*` services (`inv-stock-replenishment-algos`, template/event/run fulfillment-strategy and -strategy-location services).
- **Fulfillment Strategy** component (shared by template / event / run, later level overrides earlier): Fulfillment Type (`PURCHASE_ORDER_ONLY` default, `INTERNAL_STOCK_TRANSFER_ONLY`, `INTER_COMPANY_TRANSFER_ONLY`, …), Stock Control strategy, Document Status for generated POs, *Block existing open PO*, Transfer Scope / Minimum Transfer Qty / Source Priority / Target Scope, surplus handling (`AUTO_LOWEST_STOCK_LOCATION` default, surplus transfer scope, min surplus qty, surplus doc type `INTERNAL_OUTBOUND_STOCK_TRANSFER`), e-mail notification (recipients; on success / failure / partial / blocked). Filters on template / event / run have AND/OR logic and a negation toggle per group (item, location, supplier, category).
- Backend: 43 repo issues, most July–August 2026 (fulfillment strategies #5–#19, PO fulfillment processor #16, internal stock transfer processor #20, MAX surplus redistribution processor #21, e-mail service #22/#39–#41, rules & negation #29/#36, recurring events #45, inter-company transfer #10/#31/#33/#34 and Organisation intercompany setting #30, supplier priority from Doc Item entity pricing #47, run save error #37). Backend file list is in the run-22 tool output (grep `replenish` under akaun-api / javasdk / client-sdk) — start from the processors and `StockBalanceHelper.generateCurrentLocationStockBalanceContainerFromCustomDto` (min/max seeding, run 19 topic).
- Screenshots: two AI infographics only (`Stock Replenishment-applet/…-overview-infographic.png`, `stock-replenishment/quick-start-guide.png`) — both to drop; no product captures exist.
- Estimate: a full run (large document-family applet with four sub-entities and ~10 processors).

## Pages completed (run 23, Stock Replenishment)

- `content/en/applets/inventory-workflow/stock-replenishment-applet.md` — rewritten to the standard. Registry `stockReplenishmentApplet` "Stock Replenishment Applet" (TNT-ADMIN, ACTIVE, 2023-05-08; `documentation_url` = a Confluence page, so no alias). Title unchanged; `page_type: applet`; `applet_code`, `applet_repo`, `modules: [inventory, purchasing]`, `related_applets` (10), `guides: []`, per-section `sources:` (screens, configuration, fields, lifecycle, troubleshooting + 9 issue ids); `weight` 170 and tags kept; no BOM. Old marketing body (personas, quick start, scenarios, FAQ, invented "Field Settings controls column visibility") replaced by Overview · Where it fits · Screens and menus · Configuration (prerequisites; applet-local settings table; Field Settings stub; printable / e-mail template; read-without-control keys; the Fulfillment Strategy control by control with defaults and backend consumption; filter logic; settings elsewhere; permissions) · Fields (template, event, run, Min/Max grid, Order Fulfillments grid) · Lifecycle and effects (queueing → run processor → fulfillment processor → document service; posting proof block) · Related applets · Troubleshooting (20 rows) · Related documentation. Sources: applet 7169e01 (2026-09-02), backend 1ff620ef0e (2026-09-05), ts-lib 7d1616a9e, Organisation v3 54c1086, blg-shared-utilities (select-email-template, recurrence-editor). Topic `kb/topics/stock-replenishment.md` created (slug already referenced by the stock-transfer, internal-purchase-order and stock-balance topics); `kb/topics/stock-balance.md` given a `stock-replenishment` edge.

## Registry / naming mismatches (run 23)

- None. Note only: the registry `documentation_url` for `stockReplenishmentApplet` is `https://bigledger.atlassian.net/wiki/spaces/AKAUN/pages/3422748931/...` (Confluence), not the wiki page — Vincent may want the registry row updated to `/applets/inventory-workflow/stock-replenishment-applet/` (applet-audit "broken documentation_url" class).

## Direction / fact reversals found (run 23, Stock Replenishment)

- Old page: "Field Settings — control field visibility and behaviour across the applet grids, choose which columns (like `ma_cost`) are visible". Actual: an unbound stub (eight toggles, SAVE without a handler); nothing is saved or read.
- Old page: "Default Branch / Default Location pre-select the branch and location for new templates and runs". Actual: saved to `APPLET_SETTINGS` but no create/view component reads either key (plain-grep second pass).
- Old page: "Personal Default Selection overrides the company-wide defaults". Actual: the component's `appletSettings$` input is never bound by the shared personalization container, so selecting a branch throws (`this.appletContainer` undefined) and nothing is saved.
- Old page: "Templates define categories … the system pulls all matching items into the run". Actual: Category filter rows are cloned template → event but the run processor never reads them; only Items and Locations define the item × location grid.
- Old page: "Order Qty tab — system-calculated order suggestions based on demand and balance"; FAQ: "qty_available inherently considers open POs … reduces its suggested order quantity". Actual: reorder qty = `max(0, level − qty_ledger)` where level is the location min (or max under the MAX strategy); open PO, in-transit, reserved and sales-order-open quantities are snapshotted onto the line (`loc_qty_stock_balance_adjusted`) but do not change the reorder quantity.
- Old page: "Compare current vs previous run data to spot demand trends". Actual: `prev_run_guid` is set for event-created runs and shown read-only; the processor does not compare runs.
- Old page: "Generate POs — the system clusters them by supplier". Actual: merged per **branch and supplier** (`mergeGenDocContainersWithSameSupplier`); and PO lines start with Quantity To Approve = 0, so an unedited line yields a zero-quantity PO line.
- Old page: "Export — download the run data to Excel". Actual: EXPORT AS PDF has an empty handler; CSV / DOCX / ZIP are disabled.
- Old page: "Events are just for automation; they don't block manual runs" — true, but incomplete: a run created **without** a template is never queued; it needs the run's own Items / Locations tabs filled and Auto-Fill All.
- Stock Transfer page (run 4) said "Replenishment runs generate outbound transfers" — now true (issue #20, July 2026); previously only PO generation existed.

## Findings for the product team (run 23, Stock Replenishment)

- **`Target Scope = Selected companies only` cannot be used**: the strategy form renders no company picker (the backend supports `…_fulfillment_strategy_company` rows), so the allowed set is always empty and every inter-company line is left "No suitable inter-company source location found".
- **Category filters are dead** at processing time (cloned, never used); **Rules Logic AND/OR** is stored and cloned but has no effect (code comment acknowledges it).
- **`DEFAULT_BRANCH` / `DEFAULT_LOCATION`** are saved but never read; **`email_format`** is saved (default `SUMMARY_PER_RUN`) with no control and no backend reader.
- **Personal Default Selection throws** on first selection (unbound input) — same copy-paste family as Stock Conversion / Shipping Pricebook.
- **Re-running a run appends** a full new set of order-quantity and fulfillment lines (no delete of the previous set); duplicates accumulate after every Auto-Fill / GENERATE ORDER FULFILMENTS.
- **PO fulfillment lines start with `qty_to_approve = 0`** (transfer lines get the computed quantity); GENERATE PO on an unedited line creates a zero-quantity PO line.
- **Generated PO lines hard-code UOM `PCS`**, `uom_to_base_ratio 1`, no tax code, no GL code, no discount; the price is the entity-pricing purchase price or 0.
- **Open-PO block is supplier + item only** (any location, any quantity, DRAFT / FINAL / EDITED) — one open PO at one branch blocks replenishment of the same item at every other branch.
- **Silent stops**: empty effective location / item sets, or a template without location / item filters, end the processor with a log line and no toast; the Order Fulfillments tab just stays empty.
- **Tab-order default list** (nine entries) predates the Fulfillment Strategy and Min/Max Qty/Loc tabs — they always sort last until Default Selection is re-saved.
- **Printable formats** are uploaded and starred but nothing renders them (Export as PDF handler empty).
- **Event-driven runs** auto-create POs and internal transfers with exceptions swallowed (no notification when creation itself throws before the notification code — e.g. `SUPPLIER_GUID_IS_NULL`).
- **Manual run needs only `_RUN_READ`**; all three generate buttons share one V2 permission `…_ORDER_FULFILLMENT_LINE_GENERATE_PO`.
- **Recurring events** materialise at most 100 occurrences of an infinite rule, each with its own copy of filters and strategy — editing "All events" rewrites them all.

## Cross-lane link requests (run 23, Stock Replenishment)

- `content/en/applets/purchase-workflow/internal-purchase-order-applet.md` (lane 2): already lists `stock-replenishment` in `related_applets`; in **PO Replenishment** add one sentence that min/max-driven PO generation lives in the [Stock Replenishment](/applets/inventory-workflow/stock-replenishment-applet/) applet (the PO applet's own Replenishment menus are the older screen family), and in Lifecycle note that replenishment-generated POs arrive with UOM `PCS`, no GL / tax code, unit price from Entity Pricing, and DRAFT or FINAL per the run's *Document Status*.
- `content/en/applets/inventory-workflow/stock-transfer-applet.md` (lane 4, own, next touch): keep the upstream row; add that replenishment transfers are created with posting status DRAFT or **FINAL** (stock moves at creation) and that inter-company lines carry `intercompany_settings_json` so AUTO mode creates the inbound leg in the counterpart company.
- `content/en/applets/master-data/doc-item-maintenance-applet.md` (lane 4, own): Entity Pricing tab — name **Supplier Priority** (`supplier_priority`, added for replenishment, issue #47), Purchase Qty Min / Max Order and Lead Time (days) and say Stock Replenishment consumes them; `related_applets` += `stock-replenishment-applet`.
- `content/en/applets/master-data/inv-item-maintenance-applet.md` (lane 4, own): per-location min / max — add that the Stock Replenishment run's Min/Max Qty/Loc tab edits the same balance row (`update-min-max-qty` endpoint); `related_applets` += `stock-replenishment-applet`.
- `content/en/applets/master-data/organisation-applet.md` (lane 4, own): Branch → Intercompany Configuration — add the 12th pairing *Internal Outbound Stock Transfer to Internal Inbound Stock Transfer* and the relabelled *Transfer Counterpart Entity / Branch* picker (Organisation v3 54c1086, issue #30); `related_applets` += `stock-replenishment-applet`.
- `content/en/applets/master-data/supplier-applet-1.md` (lane 4, own, in queue): note that replenishment drops pricing links whose entity is inactive or not of type supplier; `related_applets` += `stock-replenishment-applet`.
- `content/en/applets/master-data/chart-of-account-applet.md` (lane 4, reworked): one line that inter-company stock transfers from replenishment are blocked until the inter-company GL mapping resolves for both companies; `related_applets` += `stock-replenishment-applet`.
- `content/en/applets/inventory-workflow/related-applets-stock-balance.md` (lane 4, own): the Stock Replenishment row (L84) — say the run reads `qty_min_level` / `qty_max_level` / `qty_ledger` / `qty_purchase_order_open` from the location row and `qty_reserved` / `qty_sales_order_open` from the company row, and that the Min/Max tab writes the location row.
- `content/en/applets/inventory-workflow/stock-balance-applet.md`, `stock-availability-applet.md` (lane 4, own): `related_applets` += `stock-replenishment-applet` (back-link only).
- `content/en/modules-v2/inventory/` and `content/en/modules-v2/purchasing/` (module owners): link this page as the min/max → PO / transfer generator.

## Screenshots (run 23, Stock Replenishment)

Kept: none — no product capture exists.

Dropped from the page (references removed):
- `static/images/Stock Replenishment-applet/Stock Replenishment-overview-infographic.png` — AI marketing infographic (same decision as Pricebook / Stock Balance / Stock Conversion); file to quarantine.
- `/images/stock-replenishment/quick-start-guide.png` — referenced but the file does not exist in `static/` (broken image on the live page).

Recapture wanted from a GadgetSphere-seeded tenant: the run listing; the run view on Fulfillment Strategy (PO type, showing Document Status and Block existing open PO); the Min/Max Qty/Loc grid with three accessory items at `GS-KV-01`; the Order Fulfillments grid with one PENDING, one BLOCKED (open PO) and one GENERATED line; the event Details tab with Recurring ticked; Settings → Email Template create with the placeholder chips.

## Questions for Vincent (run 23)

1. Registry `documentation_url` for `stockReplenishmentApplet` points at Confluence — update it to the wiki page, or leave and add no alias (current choice)?
2. File issues for (a) the missing company picker behind *Target Scope = Selected companies only*, (b) Category filters and AND/OR logic having no effect, (c) PO lines generated at quantity 0 unless edited, (d) re-runs appending duplicate lines — or leave as documentation?
3. `kb/topics/stock-replenishment.md` uses the slug three neighbouring topics already reference rather than the page slug `stock-replenishment-applet` — keep, or rename and fix the three edges?

## Notes (run 23)

- Pace: ~95 minutes for one page — four sub-entities (template / event / run / strategy), two queue processors, a 1,200-line document service, 43 issues. As estimated in the run-22 handover, a full run.
- Method (METHOD.md candidate, extends §12 and §21): **for a "generator" applet, the configuration section is the strategy record, not the applet settings** — classify every control by *which level's row it writes* and *which level's row the processor reads* (here: cloned template → event → run at creation; processors read the run row only). Grep the clone service and the processor's strategy lookup before writing any precedence sentence.
- Method: **a filter tab is not consumed until the processor reads it** — Category filters here pass every UI proof (rendered, saved, cloned) and still do nothing; grep the processor for each filter table before claiming an effect.
- Method: when a generated document's quantity comes from an editable grid column, state its initial value (0 here) — "generate" on unedited rows is the failure mode.
- `gates.py` / `applet-scan.sh` not applicable (no shared settings screen). Plain-grep second pass done for every key in `applet-settings.model.ts`, every `formControlName` in the strategy template, `email_format`, `PRINTABLE`, `selectPersonalSettings`, `print`, `category`/`Category` (processor), `delete` (processor), `prev_run`.
- Live DB read: `bl_applet_client_side_perm_dfn` for `stockReplenishmentApplet` — 0 rows (no tenant data copied).

## Pages completed (run 24, Stock Reservation)

- `content/en/applets/inventory-workflow/stock-reservation-applet.md` — rewritten to the standard. Registry `stock-reservation-applet` "Stock Reservation Applet" (TNT-USER, ACTIVE, 2024-01-26; `documentation_url` = Confluence). Title unchanged; `page_type: applet`; `applet_code`, `applet_repo`, `modules: [inventory, manufacturing]`, `related_applets` (11), `guides: []`, per-section `sources:` (screens, configuration, fields, lifecycle, troubleshooting + issue #1); `weight` 120 and tags kept; no BOM. **Alias added:** `/applets/stock-reservation-applet/` — the legacy `content/en/modules/inventory/_index.md` card links there and the page had no alias (harmless, fixes a dead link). Old marketing body (personas, "Golden Triangle", quick-start, invented statuses Active/Expired/Fulfilled/Voided, invented "Reservation Logic" toggle / "default hold period" / "Reservation Manager" role, FAQ) replaced by Overview · Where it fits · Screens and menus · Configuration (prerequisites; shared-vs-local classification; the rendered-but-unconsumed table; document behaviour; background-job settings; permissions) · Fields (Main Details, Account, Bin Number, standalone Bin Reservation) · Lifecycle and effects (status table with the exact endpoints; posting proof block; readers; expiry / TMP jobs) · Related applets · Troubleshooting (19 rows) · Related documentation. Sources: applet b09dca7 (2026-07-27), shared-utilities pinned 0614ae3 (2026-01-19) and HEAD a8c38a2, backend 1ff620ef0e (2026-09-05), ts-lib HEAD, job-order and packing-order applets for the callers. Topic `kb/topics/stock-reservation.md` created (slug already referenced by the stock-availability and internal-sales-order topics); `kb/topics/stock-balance.md` given a `stock-reservation` edge.

## Registry / naming mismatches (run 24)

- None for this page. Notes: (a) `documentation_url` for `stock-reservation-applet` is a Confluence page — same class as Stock Replenishment; (b) the **Job Order** applet (repo `blg-applet-wavelet-internal-job-order-applet`, a writer of reservations) has **no wiki page** under `content/en/applets/manufacturing/` and no registry row matching 'job order' in registry-applets-2026-09-05.tsv (it may be registered under an MRP / production name — lane 3 to resolve) — the Stock Reservation page names it without a link; (c) `schedulerApplet` "Scheduler" is ACTIVE with **no wiki page** — the expiry job on this page can only be configured there, so the page names it without a link (undocumented applet, for the applet-audit list).

## Direction / fact reversals found (run 24, Stock Reservation)

- Old page: statuses "Draft / Active / Expired / Fulfilled / Voided". Actual: `TMP / DRAFT / RESERVED / RELEASED` (`StockReservationStatusColumn`); RELEASED is terminal (403 on further status updates); there is no Expired or Fulfilled status.
- Old page: "At midnight of the expiry date the status changes to Expired and the quantity is automatically restored to Available." Actual: the expiry job (only if a crontab exists) soft-deletes the header (`status = DELETED`) **without** releasing; `qty_reserved` on the balance keeps its value. Availability on the balance row stays reduced.
- Old page: "Settings → Applet Settings: toggle Reservation Logic to enable system-wide stock locking"; "Default Selection: define the default hold period"; "Field Settings: set up Reservation Types and make Reason Codes mandatory"; "assign Reservation Manager for release override". None exist. The shared Application Settings screen renders 208/297 generic document controls that nothing in the applet reads; Default Selection has Branch/Location only and is never read; there are no reason codes, reservation types (other than the bin link's FULL/PARTIAL) or release permissions beyond UPDATE.
- Old page: "Field Settings — hide `HIDE_UNIT_PRICE_STD_EXCL_TAX` … to restrict sales reps from seeing profit margins"; "custom statuses". The reservation form has no prices, lines or custom statuses; those keys are declared in `applet-settings.model.ts` and rendered by the shared screen but never consumed.
- Old page: "Webhook: trigger notifications when a reservation changes status". The webhook screen is the shared one; no reservation code emits events (not verified beyond the applet — noted, not asserted on the page).
- Old page: "Q1 … by default you cannot reserve more than physical on-hand". Actual: no backend check for plain reservations; only bin-pinned reservations are validated against bin availability.
- Old page: "Q2 … if a Sales Order is cancelled the linked reservation is released instantly". Nothing in `GenericDocumentService` or the SO applet releases reservation headers on VOID/DISCARD (grep `reserv` in GenericDocumentService: only the signum-zero availability rule). Removed.
- Old page: "Convert this reservation straight into a Sales Order" / "Allocation tab of the SO". No such conversion or tab in the reservation applet; the SO side links via `gen_doc_hdr_guid` when it creates the reservation.
- Old page: "Bin Reservation — required fields Bin Header Code, Bin Line Code". Actual standalone form also requires Customer, Branch, Location, Item Code, Reserved Base Qty and Start Date; and it writes only the link table (no header, no `qty_reserved` effect).
- Stock Availability page (lane 4, run 4): says reserved/locked come from Stock Reservation — true for the balance column; the details view sums RESERVED headers directly (two sources, can diverge). Cross-lane request below.

## Findings for the product team (run 24, Stock Reservation)

- **Expiry soft-deletes without releasing** (`ExpiredStockReservationRemovalProcessor` → `updateReservationStatusAndBinLink(guid,"status","DELETED")`): an expired RESERVED reservation disappears from the listing and from the availability details sum but `qty_reserved` on the balance rows is never decremented — availability stays understated until a data fix.
- **Bin path bypasses the balance**: `validateAndReserveBin` sets RESERVED by direct SQL and never queues `INVENTORY_STOCK_RESERVATION_PROCESSOR`; RELEASE later goes through the processor and subtracts → `qty_reserved` goes negative for every bin-pinned reservation that is released.
- **`TEMPORARY_RESERVED_STOCK_REMOVAL_PROCESSOR` filter is inverted** (`created + ttl isAfter now` keeps the *unexpired* rows) and it subtracts from `qty_reserved` for TMP rows that never added; status stays TMP. Should not be scheduled as is.
- **No availability check on plain reservations** — any quantity is accepted; nothing compares with `qty_ledger`/`qty_available`.
- **DCO null checks never fire**: `StringUtils.isBlank(String.valueOf(null))` is false, so `INV_STOCK_RESERVATION_HDR_OBJECT_QUANTITY_BASE_IS_NULL_OR_EMPTY` and `…AMOUNT_STD…` are unreachable.
- **Processor silently no-ops** when no balance row exists for the company/location/item (`Objects.nonNull(guid)` guards) — reserve "succeeds" with no effect.
- **Every applet setting is dead**: shared Application Settings (208/297 controls), Default Selection, personal Default Selection and Printable Format are saved and never read; Personalization → Field Settings links to a route that does not exist (404); an unrouted local field-configuration component with unbound toggles is left in the repo.
- **Form fields not persisted**: CRM Contract (no reducer mapping), Bill To / Ship To (outputs unbound, no columns).
- **Listing advanced search is inert** (`onSearch(){}`) and its model is a receipt-voucher copy (`INTERNAL_RECEIPT_VOUCHER` condition, labels "Reservation Code/Name" filtering customer/branch name).
- **RELEASED is the only guarded transition**; the endpoints allow DRAFT→RELEASED (subtract without add) and DELETE of a RESERVED reservation (UI hides both) — no backend guard.
- **No reserve/release permission**: `…_HDR_UPDATE` covers edit, reserve, release and validate-with-bin.
- **Expiry job also DISCARDs documents**: the same job discards the generic document linked to an expired MRP job-order temp reservation — a cross-module side effect with no notification.
- **Scheduler applet undocumented**: `schedulerApplet` ACTIVE, no wiki page; the only way to configure the expiry job.
- `es_module_url` is not a column of `bl_applet_hdr` in akaun_master (query error, no data read) — earlier run notes that cite it may have used a different column name.

## Cross-lane link requests (run 24, Stock Reservation)

- `content/en/applets/inventory-workflow/stock-availability-applet.md` (lane 4, own, next touch): state that the grid's reserved figure comes from the balance column (`qty_reserved`, written only by RESERVED/RELEASED through the processor) while the details view sums RESERVED headers from `bl_inv_stock_reservation_hdr` (`stk_reserve` CTE) — and that the two diverge after the expiry job or for bin-pinned reservations.
- `content/en/applets/inventory-workflow/related-applets-stock-balance.md` (lane 4, own, next touch): Stock Reservation row (L83) — "RESERVED adds / RELEASED subtracts `qty_reserved` on both balance rows via `INVENTORY_STOCK_RESERVATION_PROCESSOR`; bin-pinned reservations bypass it; expiry soft-deletes without releasing".
- `content/en/applets/inventory-workflow/stock-balance-applet.md` (lane 4, own): L202 back-link sentence — add "(only through the processor; bin-pinned holds do not write it)".
- `content/en/applets/inventory-workflow/warehouse-management-applet.md` (lane 4, own, in queue): `related_applets` += `stock-reservation-applet`; in bin availability say available = qty − reserved (bin links with posting status RESERVED) − locked, and that standalone Bin Reservation writes only the link table.
- `content/en/applets/sales-workflow/internal-sales-order-applet.md` (lane 2): distinguish (a) the reservation header created from the SO (`gen_doc_hdr_guid`, availability-by-job dialog) from (b) the `validateStockBalanceForSignumZero` rule in `GenericDocumentService` L2178 that treats open sales-order lines as outbound when validating stock on FINAL; and drop any claim that voiding an SO releases its reservation (no code does).
- **Job Order applet — no wiki page exists** (`content/en/applets/manufacturing/` has no job-order page; registry row noted under Registry / naming mismatches). When one is written (lane 3): production-request stock planning creates a DRAFT reservation linked to the SO line, sets it RESERVED via `update-posting-status`, and creates PARTIAL bin links expiring start + 24 h; the MRP stock-transfer auto-bin-reservation endpoint also increments `mrp_produced_qty` on the SO line; the expiry job DISCARDs the document behind an expired job-order temp reservation. `related_applets` += `stock-reservation-applet`.
- `content/en/applets/manufacturing/internal-packing-order-applet.md` (lane 3): the pick queue loads RESERVED bin links for the location + item and sets link and header to RELEASED when it consumes them (the release goes through the processor, so a bin-pinned hold reserved by SQL ends negative). `related_applets` += `stock-reservation-applet`.
- `content/en/applets/inventory-workflow/stock-replenishment-applet.md` (lane 4, own): `related_applets` += `stock-reservation-applet` (back-link only; it already says company `qty_reserved` is snapshotted).
- `content/en/applets/master-data/inv-item-maintenance-applet.md`, `customer-maintenance-applet.md`, `organisation-applet.md` (lane 4, own): back-link `stock-reservation-applet`; on the item page note that the reservation item picker needs ledger qty > 0 at the location and sub-type `BIN_NUMBER` for bin holds.
- `content/en/modules/inventory/_index.md` L68 (legacy modules tree, owner?): the card link `/applets/stock-reservation-applet/` now resolves via the new alias; the subtitle "Precision inventory allocation and reservation management" is marketing copy — suggest "Hold stock for a customer until a date".
- `content/en/modules-v2/inventory/related-applets/_index.md` (module owners): add a Stock Reservation entry; L20's "stock reservation breakdown" under Stock Availability is fine.
- A **Scheduler** applet page (no lane owns it): needed to link the crontab configuration for `EXPIRED_STOCK_RESERVATION_REMOVAL_PROCESSOR` (and every other processor page that says "if scheduled").

## Screenshots (run 24, Stock Reservation)

Kept (2): `static/images/stock-reservation-applet/reservation-listing.png` (listing; generic "B COMPANY" branch/location labels, a cable-specification item name, no person or tenant name) and `reservation-details.png` (edit form, same data, RELEASED).

Dropped from the page (references removed; files to quarantine, 3):
- `reservation-select-customer.png` — Select Customer grid shows a person's username and phone numbers as test data.
- `reservation-create-branch.png`, `reservation-create-location.png` — branch / location drop-downs list codes with a prefix that reads as a company abbreviation (possible customer identification; same call as run 20).
- `stock-reservation-overview-infographic.png` — AI marketing infographic (same decision as Pricebook / Stock Balance / Stock Conversion / Stock Replenishment).

"Login e-mail only" captures: none.

Recapture wanted from a GadgetSphere-seeded tenant: the listing with one DRAFT, one RESERVED and one RELEASED row (branch `GS-KV-01`, a wireless-audio accessory, expiry dates a week out); Create on Main Details with the Status drop-down open (TEMP / DRAFT); the Select Item column showing the System Stock Balance column; the Account → Entity Details tab with a B2B customer selected; the Bin Number tab with two bin lines for a bin-tracked item; the Bin Reservation create form; Settings → Default Selection.

## Questions for Vincent (run 24)

1. Alias `/applets/stock-reservation-applet/` added to fix the legacy modules card link — keep, or remove and fix the legacy page instead?
2. File issues for (a) expiry soft-delete without release, (b) bin path bypassing the processor / negative `qty_reserved` on release, (c) the inverted TMP-removal filter, (d) no availability check on plain reservations — or leave as documentation? (a)+(b) together mean the balance-row availability drifts on every tenant that uses expiry or bins.
3. Should the wiki get a Scheduler applet page (registry `schedulerApplet`, ACTIVE)? Several processor-driven pages (this one, Stock Replenishment events, EcomSync) can only point at it.
4. `documentation_url` for `stock-reservation-applet` points at Confluence — update to the wiki page (same question as Stock Replenishment)?

## Notes (run 24)

- Pace: ~80 minutes for one page — small applet (two entities) but four backend paths (plain reserve, bin reserve, expiry job, TMP job) and four external callers to trace. Stopped before Supplier (next in queue) to keep the findings complete.
- Method (METHOD.md candidate, extends §13 and §26): **when the shared Application Settings screen is routed but the applet has no document form, run gates.py at both commits and then prove "consumed" by a whole-applet grep — expect zero.** Here 208/297 controls render for a code no gate targets; the honest section is one table of "rendered / saved / read by nothing", not 200 rows. Counting rendered keys without the consumption grep would have produced a 200-row reference card of dead settings.
- Method (extends §12 and §22): **status transitions that bypass the queue processor are the direction bugs of non-generic documents.** Grep every `setPosting_status(` / raw `UPDATE … SET posting_status` in the service and Uow and check each one against the processor's add/subtract; here one of three RESERVED writers skips the processor and the RELEASE path assumes it did not.
- Method: **for "expiry" claims, find the job, then check what it changes** — status column vs posting status vs balance. Old page and product intuition both assumed expiry = release; the job only soft-deletes.
- Method: **DCO null checks written as `StringUtils.isBlank(String.valueOf(x))` never fire** for null numbers — do not cite them as backend rejections.
- `gates.py` run at pinned 0614ae3 (checked out via `git show` into scratchpad; the submodule is not initialised in the applet clone — `git -C <submodule> rev-parse` silently returns the parent repo's HEAD, read `.gitmodules` + `git submodule status` instead) and at HEAD a8c38a2: 208 vs 297 RENDERED; 89 rows differ (new e-Invoice / doc-link / stock-requisition keys, `HIDE_BILL_TO_TAB` / `HIDE_SHIP_TO_TAB` GATED-OUT→RENDERED, `HIDE_EVENTS_TAB` / `HIDE_GENERIC_DOC_APPROVAL_TAB` RENDERED→GATED-OUT). None consumed at either commit, so the diff does not change the page.
- Plain-grep second pass done for every key in `applet-settings.model.ts`, `selectMasterSettings`, `selectPersonalSettings`, `masterSettings`, `personalSettings`, `SessionSelectors`, `appletSettings`, `DEFAULT_BRANCH`, `DEFAULT_LOCATION`, `PRINTABLE`, `print`, `export`, `hasPermission`, `permission`, `crm_contract`, `bill`/`ship` outputs, `onSearch`, `batches-listing` (dead), `sales-group` (commented route).
- Live DB reads: `bl_applet_client_side_perm_dfn` for `stock-reservation-applet` — 0 rows; `bl_applet_hdr` name/code ILIKE '%reserv%' — query errored on a non-existent column before returning (no data read).
- Issues: applet repo has 1 (migration); wiki #148 (original request) and #143 (Stock Availability) — nothing product-related. Troubleshooting is therefore code-derived; anonymisation needs: none.
