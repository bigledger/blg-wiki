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

---

# Run 26 — master-data/supplier-applet-1.md (registry `supplier-applet` "Supplier")

Run 25 was killed by a model quota before writing anything, so this is the first run to touch the page.

## Registry / naming mismatches (run 26)

- `supplier-applet` "Supplier" is ACTIVE (TNT-APPLET, created 2023-12-08) with **no `documentation_url`**. Title corrected "Supplier Applet" → "Supplier". No aliases existed and none were needed — every inbound link in the wiki already uses `/applets/master-data/supplier-applet-1/`. **Product-side ask:** set `documentation_url` to `https://wiki.bigledger.com/applets/master-data/supplier-applet-1/`.
- **No client-side permissions are seeded for this applet.** `bl_applet_client_side_perm_dfn` has zero rows for `supplier-applet`, yet the code checks ten `SHOW_*` codes (`SHOW_CATEGORY_MENU`, `SHOW_FILE_IMPORT_MENU`, `SHOW_UPLOAD_CREDIT_TERMS_MENU`, `SHOW_UPLOAD_CREDIT_LIMITS_MENU`, `SHOW_CREDIT_TERM_LISTING`, `SHOW_CREDIT_LIMIT_LISTING`, `SHOW_FILE_EXPORT_MENU`, `SHOW_CONSOLIDATED_ARAP_MENU`, `SHOW_ENTITY_MERGING_MENU`, `SHOW_ENTITY_MERGING_PROCESSING_MENU`). Same gap as F-0044. `HIDE_AUDIT_LOG_MENU` has no `SHOW_*` pair at all.
- Neighbouring registry rows with **no wiki page**: `APAutomationSupplierAccess` "AP Automation Supplier Access Applet" (ACTIVE; it is the applet the consolidated-ARAP monthly matching report e-mails name), `rma_supplier` "RMA Supplier", `Digi_Supplier_PO_Applet` "Supplier PO". The `Supplier - Delivery Order` / `- Goods Receipt` / `- Invoices` / `- Orders` / `Supplier Payment Match` / `SH Supplier Maintenance` / `Z Suppliers Maintenance` rows are CORE1-revision entries (same family lane 3 flagged in run 1) — still unclear whether they are live applets or legacy stubs.

## Back-link requests satisfied (run 26)

All eleven queued requests naming this page were honoured in `related_applets` and in the body:

| Requested by | Applet added | Also satisfied in prose |
|---|---|---|
| lane 2 | `internal-payment-voucher-applet`, `internal-purchase-invoice-applet` | Where it fits + Related applets |
| lane 3 | `internal-purchase-debit-note-applet`, `internal-purchase-credit-note-applet`, `internal-purchase-refund-note-applet`, `internal-purchase-requisition-applet`, `blanket-purchase-order-applet`, `purchase-report-applet`, `internal-purchase-gin-applet`, `supplier-delivery-order-applet` | Login-tab callout states the supplier ↔ login link is the prerequisite for every supplier-access applet (SDO, PO/GRN/Invoice/CN/Return Supplier Access) |
| lane 3 (e-invoice) | `my-e-invoice-admin-applet`, `my-e-invoice-portal-applet`, `mypeppol-admin-applet` | E-Invoice tab documents ID-type rules and the required-field block; Peppol section documents the single `is_default` receiver |
| lane 4 (own) | `entity-applet`, `merchant-applet`, `customer-maintenance-applet`, `employee-applet`, `internal-consignment-gin-applet`, `internal-consignment-grn-applet`, `stock-replenishment-applet`, `organisation-applet`, `tax-configuration-applet`, `chart-of-account-applet`, `cashbook-applet`, `doc-item-maintenance-applet`, `inv-item-maintenance-applet`, `pricebook-applet` | Supplier Category tree note (Entity Maintenance maintains the same tree); Item Pricing section states replenishment drops links whose entity is inactive or not of type supplier |

One request could not be fully honoured as worded: lane 3 asked for "state that ID type must be PASSPORT for foreigners, NRIC 12 digits without hyphens, `default_einvoice_address` chosen shipping → billing → main". The first two are stated. The **address precedence is different on the supplier side** — the supplier applet sets `default_einvoice_address` explicitly from the custom address type (Billing Address (E-Invoice)), and the backend reads the flagged address; there is no shipping → billing → main fallback in this applet. Lane 3 should re-check that claim on the customer page before it is repeated.

## Method notes for METHOD.md (run 26)

1. **Not every applet's shared-utilities is a submodule.** `blg-applet-akaun-platform-supplier-applet` (and the merchant applet, per run 16) **vendors a private copy** of `projects/shared-utilities` — no `.gitmodules`, no `refs/blg-shared-utilities` link. `kb/tools/gates.py` reads `refs/blg-shared-utilities` and therefore **cannot be run for these applets at all** (neither at a pinned commit nor at HEAD); the "rendered" proof has to come from the applet's own field-configuration template plus its gear key lists. Check for `.gitmodules` before reaching for gates.py. It also means shared-utilities fixes do not reach these applets.
2. **The fresh-tenant fallback is a real, documentable default.** `session.effects.ts` substitutes `{HIDE_EMAIL:true, HIDE_PHONE_NO:true}` when an applet has no `APPLET_SETTINGS` extension. Wherever `HIDE_EMAIL` is a real key (customer, supplier, employee, merchant), **Email is hidden on a brand-new tenant until Application Settings is saved once**. Worth a sweep across the four master-data pages. `HIDE_PHONE_NO` is a stale key name — the applets use `HIDE_PHONE_NUMBER`, so phone is unaffected.
3. **A second settings screen can own keys the main screen has never heard of.** Default Selection here writes `ALLOWED_AR_AP_TYPES` and `SUPPLIER_DETAILS_TAB_ORDER` into the same `APPLET_SETTINGS` row; neither has a control on Application Settings. Enumerate *every* component that dispatches `saveMasterSettingsInit`, not just the field-configuration one.
4. **"Create" is not always a create screen.** The live supplier listing inserts a `status = TEMP` entity row on **+** and opens the *edit* screen on it, resuming a previous TEMP draft if one exists. The standalone create component is dead code reachable only from an unrouted legacy listing. Trace which component the pages service actually puts in view-column 0 before documenting a create form.
5. **Prove enforcement, don't infer it from the presence of a field.** Supplier credit terms and credit limits exist on three table tiers and are importable — and are read by *nothing* at posting time. The blacklist block (`ENTITY_BLACKLISTED`, "Customer is blacklisted due to credit limit…") is gated to four sales doc types and a nightly job that queries `is_customer` only. This is exactly the "client confirm ≠ backend rejection" trap in reverse: master data that looks like a control and is not one.
6. **Master-data applets have their own silent-failure class: half-configured GL mappings.** `JournalPostingService` throws `MISSING_DEFAULT_GL_CODE: CREDITOR` only when the `bl_fi_mst_company_glcode_link` row is *missing*. If the row exists with a null subledger, the creditor line is dropped and the journal posts unbalanced with no error (same guard on the tax, settlement-charges and stock lines). Any page that says "you will get MISSING_DEFAULT_GL_CODE" should add the half-configured case.

## Bugs and product questions (run 26)

- **Duplicate supplier code returns the wrong error message.** `API_TNT_DM_BL_FI_MST_ENTITY_HDR_OBJECT_SUPPLIER_CODE_ALREADY_EXISTS` is built from the "should not be set" template instead of the "already exists" one (the merchant and employee siblings are correct), so a duplicate code reports *"The supplier_code in the bl_fi_mst_entity_hdr object should not be set"*. Documented in Troubleshooting; worth a one-line backend fix.
- **Supplier export is not a round trip.** The export writes 11 core columns + billing + shipping; the import accepts 41. `EINVOICE_TAX_ID_NO`, `EINVOICE_SELF_BILLED`, `SST_REG_NO`, `TOURISM_TAX_ID`, `SIC_CODE` and `SUPPLIER_CATEGORY_CODE` are dropped, and a re-import silently blanks them. **Question for Vincent / product:** should export be brought in line, or should the applet warn?
- **Entity merge rewrites every entity-referencing column in the tenant database**, including posted documents, journal rows and balance tables, with no filter for posting state or fiscal-period lock, no type check (a customer can be merged into a supplier), no lock during the run, and no unmerge — the history table records only a row count. The page now carries a strong warning. **This deserves a decision:** either a guard rail in the product or an explicit "out of hours, checked twice, irreversible" operating note in the guides.
- **Self-billed e-Invoices fail quietly.** Missing supplier TIN / ID type / ID value / ID number / business-activity description do not throw — the document is diverted to the batch pool with a `validation_msg` string. A blank SST number is submitted as the literal `NA` and a blank MSIC code as `00000`, so those two go out *wrong* rather than being caught.
- **Two Peppol IDs flagged default is non-deterministic** — the receiver lookup is `.findFirst()` with no ORDER BY. The applet does not prevent a second default.
- **Invitation links never expire.** `app_login_registration.expiry_date` exists but the invitation flow passes no end date.
- **Dead UI in the applet:** 8 unbound "Lines Settings" / "Department Settings" toggles copied from the document-applet settings screen (identical residue to Merchant Admin, run 16); `HIDE_IDENTITY_TYPE` rendered with no form control; `HIDE_CONTACT_DESIGNATION` and `HIDE_LISTING_CONTACT_TITLE` saved but never read; `HIDE_CUST_CATEGORY` / `HIDE_FILE_IMPORT` read only by an uncalled `filteredMenuItems()`; Personalization › Default Selection throws on use (its input binding is commented out); Default Selection always writes `DEFAULT_BRANCH`/`DEFAULT_LOCATION`/`DEFAULT_AR_AP` as null; credit-term save hard-codes `status = "ACTIVE"` regardless of the Status control.
- **Credit limit amount accepts integers only** (`^[0-9]*$`) on the supplier side while the customer applet allows 2 decimal places. Deliberate or drift?
- **Answered for lane 4 run 16's open question:** the Supplier Login tab **does** have the "Select catalogs for the applets installation" picker (gated by `INSTALL_ALL_APPLETS_ON_INVITE`). Merchant Admin does not. Employee still unchecked.

## Cross-lane link requests (run 26)

- `content/en/applets/purchase-workflow/supplier-delivery-order-applet.md`, `internal-purchase-order-supplier-access-applet.md`, `internal-purchase-grn-supplier-access-applet.md`, `internal-purchase-invoice-supplier-access-applet.md`, `internal-purchase-credit-note-supplier-access-applet.md`, `internal-purchase-return-supplier-access-applet.md`, `blanket-purchase-order-applet-supplier-access-applet.md` (lane 3) — add `supplier-applet-1` to `related_applets` and state the prerequisite: the portal user is resolved from `bl_fi_mst_entity_login_subject_link`, written by the **Supplier applet's Login tab**, and only *after* the invitee confirms the emailed invitation. `UserPermissionService.isUserLoginEntity` throws `CLIENT_AUTH_USER_NOT_AUTHORIZED. NO USER FOUND in bl_fi_mst_entity_login_subject_link` when the link is absent — that is the "supplier logs in and sees nothing" symptom.
- `content/en/applets/finance/internal-purchase-invoice-applet.md` (lane 2) — the AR/AP precedence is **Company Linking row's `default_arap_type` COALESCE-d over the entity header's**, not the header alone; and `AR_MERCHANT → MERCHANT_RECEIVABLE`, `AP_MERCHANT → MERCHANT_PAYABLE` complete the map. Also add the silent half-configured-mapping failure (row present, subledger null → creditor line dropped, journal unbalanced, no error).
- `content/en/applets/master-data/customer-maintenance-applet.md` (lane 4, done) — its open question "where is the credit limit enforced?" is **answered**: the nightly `EntityBlacklistCustomerProcessor` sets `credit_limit_status = BLACKLISTED` from the *sales* limit tables for `is_customer` rows only, and `GenericDocumentService.disallowBlacklistedCustomer` hard-blocks FINAL for exactly `INTERNAL_SALES_CASHBILL`, `INTERNAL_SALES_INVOICE`, `INTERNAL_SALES_ORDER`, `INTERNAL_OUTBOUND_DELIVERY_ORDER` with *"Customer is blacklisted due to credit limit. Transactions are not allowed for this customer."* There is **no check at save**, and `EntityCreditAvailabilityService` is advisory only (two GET endpoints, never throws) and reads the limit from a fourth location, `bl_fi_mst_entity_ext` `param_code='CREDIT_LIMITS'`. Fold this in and drop any "hard block on the sales order" wording that is not one of those four types.
- `content/en/applets/master-data/entity-applet.md` (lane 4, done) — add that a merge can join entities of *different* types with no guard, and that the source entities end up `INACTIVE` rather than deleted; add `supplier-applet-1` prose about the shared category tree if not already there.
- `content/en/applets/e-invoice/my-e-invoice-admin-applet.md` (lane 3) — the self-billed supplier block and its six *"Supplier … is missing"* batch-pool reasons; that SST → `NA` and MSIC → `00000` substitutions mean those never block; and that LHDN TIN validation is **not** called during generation.
- `content/en/applets/e-invoice/mypeppol-admin-applet.md` (lane 3) — the outbound receiver is the entity's `is_default` Peppol ID with no tie-break; there is no scheme column, the scheme is fixed `iso6523-actorid-upis`, so the ICD prefix must be inside the participant ID string; the header's `peppol_participant_id` is a denormalised copy the outbound path never reads.
- `content/en/modules-v2/purchasing/configuration/_index.md` (modules owner) — "Supplier Master Profiles & Payment Terms" points at Entity Maintenance; re-point to `/applets/master-data/supplier-applet-1/` (repeat of the run-7 request, still open).
- `content/en/modules-v2/financial-accounting/_index.md` L60 & L93, `content/en/modules-v2/core/_index.md` L74 & L144 (modules owner) — link text says "Supplier Maintenance Applet"; the registry name is **Supplier**.
- **API reference / developer-docs lane** — undocumented and worth adding: `core2/tnt/dm/erp/entity/suppliers/{backoffice-ep,etl-ep}`, `erp/supplier-import-file-hdr/backoffice-ep` (multipart, `delimiter` query param that **NPEs if omitted**), `erp/entity-export/backoffice-ep/suppliers/generate-csv`, `erp/entity-merging/backoffice-ep` (synchronous, unvalidated) vs `erp/entity-merging-processing/backoffice-ep` (queued), `erp/entity-login-subject-links/**`. Also: entity listings no longer use `/core2/tnt/ms/subquery`.
- `planning/lanes/METHOD.md` (coordinator) — fold in the six method notes above, especially §1 (gates.py does not apply to applets that vendor shared-utilities) and §5 (prove enforcement).

## Screenshots (run 26)

Kept (5 of 16 referenced):
- `supplier-create-form.png` — the Main tab of **Supplier Edit** on a fresh record; shows Status `TEMP`, Entity Type `SUPPLIER`, Supplier Type `CORPORATE`, Identity Type `BRN`, AR/AP Type `AP_TRADE`. Proves the TEMP-draft create flow and the defaults. No data.
- `payment-config-create.png` — empty Payment Config form. The visible bank name comes from the product's own bank master, not a customer.
- `supplier-settings.png` — the Applet Settings menu. No data. (Slightly older build: it predates *Resource Bundle Configuration* and *Custom Field Placement* and still shows *Triggers* / *Reset Applet State*. Recapture would be nice but it is not misleading about the grouping.)
- `menu-file-import-1.png` — Import File Create with the delimiter list open (COMMA highlighted, matching the code default). Left-pane rows are all named "file".
- `menu-file-export.png` — File Export listing; only generated export filenames.

Dropped (11 — references removed from the page):
- `supplier-applet-overview.png` — an AI marketing infographic claiming features that do not exist ("ABC classifications", "flags on problematic vendors"). Same decision as Pricebook / Stock Balance / Stock Conversion / Stock Replenishment. Quarantine, along with the unreferenced twin `supplier-overview.png`.
- `supplier-listing.png`, `supplier-search.png` — Created By / Modified By columns full of staff full names.
- `menu-entity-merging.png` — entity names are developer personal names; also shows the pre-fuzzy-search screen.
- `menu-entity-merge-processing.png` — a person's name plus two consumer brand names as test entities.
- `menu-credit-term-listing.png`, `menu-credit-limit-listing.png` — credit master codes containing personal first names.
- `menu-consolidated-arap.png` — an account named after a person.
- `menu-file-import.png` — file names containing what look like customer company abbreviations, plus a raw PostgreSQL exception string.
- `menu-file-import-error.png` — Checking tab with a person-name test row (its column list is now stated in prose instead).
- `personal.png` — a real name and a bigledger.com email address.

Also unreferenced and unused (left in place, not audited): `menu-category.png`, `menu-entity-branch-group.png`, `menu-personal-default-selection.png`, `menu-upload-credit-limits.png`, `menu-upload-credit-terms.png`, `menu.png`, `supplier-create-form-button.png`, `supplier-documents-tab.png`, `supplier-edit-form.png`, `supplier-overview.png`.

**Recapture list** (clean demo tenant, generic data, no personal names): supplier listing, advance search, Entity Merging (with criteria + search term + threshold visible), Entity Merge Processing, Credit Term Listing, Credit Limit Listing, Consolidated ARAP, File Import listing + Checking tab, Personalization, Category, Entity Branch Group, Application Settings (current build, showing the panel names).

## Notes for the loop

- `kb/topics/supplier-maintenance.md` created (that slug is already referenced by `customer-maintenance.md`, `entity-applet.md`, `organisation-applet.md` and `stock-replenishment.md`).
- Three new customer-repo pseudonyms were added to `kb/private/repo-pseudonyms.tsv` (gitignored, verified with `git check-ignore`): the mapping method `sha1(bare-slug)[:6]` was re-verified against three known pairs first. No real slug appears in `content/`, `kb/topics/`, the ledger or this file.
- `tests/content-lint.sh` passes.

---

# Run 27 — Tax Configuration (master-data)

Page: `content/en/applets/master-data/tax-configuration-applet.md` — registry `taxConfiguration` "Tax Configuration".
Repo `blg-applet-wavelet-tax-config-applet` (HEAD 52247e1, 2026-03-15). Submodule present (`.gitmodules` → blg-shared-utilities), but gates.py was not needed: this applet does **not** use the shared `FieldConfigurationComponent` — its settings screens are applet-local.

## Registry / naming mismatches (run 27)

- **F-0040 confirmed and sharpened.** `bl_applet_hdr` has exactly **one** tax row: `taxConfiguration` "Tax Configuration", ACTIVE, TNT-USER, created 2021-07-27. Two wiki pages claim it:
  - `content/en/applets/master-data/tax-configuration-applet.md` — **now the derived reference page** (this run). Slug matches the ~10 inbound links of the form `/applets/tax-configuration-applet/` that were **all broken** (no page held that alias); I added the alias, which fixes them.
  - `content/en/applets/finance/tax-config-applet.md` — **not edited**. It holds `aliases: [/applets/tax-config-applet/]`, which is the registry's `documentation_url`, so the product links into it today.
  - **Decision for Vincent:** merge finance → master-data (recommended: the master-data folder is where the other master-data applets live and the registry name is "Tax Configuration"), delete the finance page and move the `/applets/tax-config-applet/` alias onto the master-data page. I did **not** move the alias, because two pages cannot hold it at once and I may not edit outside my lane. Until then the two pages disagree.
  - The finance page's claims that do **not** survive the code: tax codes mapped to chart of accounts *in this applet*; compound and cascading taxes; effective-dated rate history; multi-jurisdiction beyond the four hard-coded countries; e-filing integration; "audit trail" (the Applet Log screen is an empty placeholder card); "deactivate obsolete tax codes safely" (INACTIVE does not remove a code from document drop-downs).
- The old master-data page was pure invention (500 tax codes per jurisdiction, <100 ms calculations, 1,000+ concurrent users, tax-authority e-filing, Singapore 8% GST examples). All removed.

## What this applet actually is (run 27)

1. **Master data with no calculation and no mapping.** One row of `bl_fi_cfg_tax_code` per code. There is no GL field on a tax code. The tax journal line's GL code and subledger come from the **company default GL code link** whose `txn_code` matches the document type's `PNS_TAX` handler — `OUTPUT_TAX` on sales-side types, `INPUT_TAX` on purchase-side types (`JournalPostingTypeHandler` L49/L60/L71/L80/L91/L102). Any guide or page saying "map your tax codes to accounts here" is wrong.
2. **The half-configured-mapping silent failure applies to tax too** (same shape as run 26's creditor finding): `JournalPostingService` L271 appends the tax line only `if` a **subledger** guid resolved. Missing link *or* link with a null subledger ⇒ tax line dropped, no error, FINAL later fails with `TOTAL_DEBITS_AND_TOTAL_CREDITS_NOT_BALANCES`.
3. **No working applet setting at all.** Field Settings is an unbound 8-toggle stub (identical document-applet residue to Merchant Admin run 16, Shipping Pricebook run 20 and Supplier run 26); Default Selection — both the applet and the personal copy — never receives the applet container it writes into and its `save` output is unbound, and `DEFAULT_BRANCH`/`DEFAULT_LOCATION` are read by nothing. Personalization → Field Settings 404s. The only "configuration" is the tax-code data itself.
4. **Two applets write the same table, inconsistently.** The MY-SST applet's Tax Code create screen writes `bl_fi_cfg_tax_code` with `tax_country` = **alpha-3 code** ("MYS") and an **unrounded** rate, and puts the tariff code in the `tax_tariff_code` column. Tax Configuration writes the **country name** ("Malaysia"), rounds the rate to two decimals (so fractional percentages collapse to whole percent) and puts the tariff code in `property_json`. Tax Configuration's edit screen dereferences the country lookup without a null check, so a row created in MY-SST cannot be opened in Tax Configuration.
5. **INACTIVE is not retirement.** The applet's listing filters to ACTIVE by default; every server read behind the document drop-downs filters only `status != 'DELETED'`. And Delete is soft while the `tax_code` unique constraint is not partial — deleting a code permanently consumes the string.

## Bugs and product questions (run 27)

- **`VAT-SALES` can never be selected on a sales document.** `blg-shared-utilities/utilities/sst/sst.component.ts` L60-64 keeps only `SST-SLS-OUTPUT`, `SST-SVC-OUTPUT`, `GST-OUTPUT` when `txnType === 'SALES'`, and otherwise anything containing `INPUT` or `PURCHASE`. `VAT-PURCHASE` slips onto the purchase side only because its name contains "PURCHASE". Singapore / Thailand / Indonesia tenants therefore have no sales VAT code at line level. **Needs a product decision** — the fix is one string in the shared component.
- **Fractional tax rates are silently rounded to whole percent** in Tax Configuration (`+(rate/100).toFixed(2)` on both create and edit). 8.5% becomes 8% or 9%. MY-SST does not round. Worth aligning.
- **Edit clears `is_input` for every input code.** `tax-config.mappers.ts formGroupToContainer` writes `}if (` instead of `} else if (`, so an INPUT code falls through into the OUTPUT branch's `else` and both flags end up false. Harmless today only because **nothing reads `is_input`/`is_output`** — no code sets those query criteria anywhere in the backend. Either wire them up or drop the columns.
- **`GenericDocumentDataConsistencyObject` L1004 NPEs** on `if (Objects.nonNull(currentTaxRate) || currentTaxRate.compareTo(newTaxRate) != 0)` when a line carries a tax code but a null `tax_gst_rate` — reachable from the import and API paths, not from the UI. Should be `Objects.isNull(...) ||`.
- **`DropDownController.getTaxCodes` (L472) passes `bl_fi_mst_cashbook_hdr.class` as the permission target table** while querying `bl_fi_cfg_tax_code` — a copy/paste that scopes the business-context permission check against the cashbook table.
- **Delete has no confirmation dialog** and is irreversible in practice (soft delete + non-partial unique constraint on `tax_code`).
- **Mislabelled validation hint:** the Tax Code field's error hint on the create screen reads *"Please insert tax name"* (visible in the shipped screenshot).
- **Dead UI:** `settings/webhook` and `settings/feature-visibility` have routes but no menu entry; `settings/applet-log` is a card with the heading "Audit Trail" and nothing else; the shared settings shell's *Permission Wizard* link has no route here and lands on the applet 404; the `TAX_COUNTRY` constant offers 23 countries to the advanced-search filter while only 4 can ever exist; the advanced-search **Tax Type** filter always queries `tax_gst_type`, so the four withholding types it offers can never match.

## Cross-lane link requests (run 27)

- `content/en/applets/finance/sst-applet.md` (lane 2/3 — finance folder) — state that its **Tax Code** screens write the *same* `bl_fi_cfg_tax_code` rows as Tax Configuration, and add the three divergences: `tax_country` alpha-3 vs full name, unrounded vs 2-dp rate, `tax_tariff_code` column vs `property_json`. Add `tax-configuration-applet` to `related_applets`.
- `content/en/applets/master-data/organisation-applet.md` (lane 4, done) — the company Default GL Code section should name `OUTPUT_TAX` and `INPUT_TAX` explicitly as *the* tax account mapping, and carry the silent half-configured failure (row present, subledger null ⇒ tax line dropped, journal unbalanced, no error).
- `content/en/applets/master-data/chart-of-account-applet.md` (lane 4, done) — same one-liner from the GL side; add `tax-configuration-applet` to `related_applets` (already present).
- `content/en/applets/e-invoice/my-e-invoice-admin-applet.md` (lane 3) — the submitted line `tax_type` is the **e-Invoice taxable type code**, not the document line's tax type: `MyEInvoiceToIRBMappingService` L66 sets it from `tax_gst_type` and L86 immediately overwrites it. Only the rate and amount come from Tax Configuration.
- `content/en/applets/sales-workflow/internal-sales-invoice-applet.md`, `content/en/applets/finance/internal-purchase-invoice-applet.md`, and every other page documenting a taxed line (lanes 2/3) — add `tax-configuration-applet` to `related_applets`, and state the drop-down filter rule (`app-sst` sales list = `SST-SLS-OUTPUT` / `SST-SVC-OUTPUT` / `GST-OUTPUT`; everything else = contains `INPUT` or `PURCHASE`; `app-wht` = any non-empty `tax_wht_type`) plus the "rate is snapshotted on save" rule.
- `content/en/applets/master-data/doc-item-maintenance-applet.md` and `inv-item-maintenance-applet.md` (lane 4, done) — one line that the item default tax code must exist in Tax Configuration and that an inactive code still pre-fills.
- **Modules owner** — `content/en/modules/purchasing/_index.md` L79, `content/en/modules/hr-payroll/_index.md` L79, `content/en/modules/core/_index.md` L256-257, `content/en/modules/financial-accounting/_index.md` L73, `content/en/modules/financial-accounting.md` L24-25, `content/en/modules/sales-crm/_index.md` L86, `content/en/modules/inventory/_index.md` L88, `content/en/applets/_index.md` L83-84, `content/en/applets/applet-catalog.md` L79/L86, `content/en/applets/ecommerce/ecommerce-catalog-applet.md` L41, `content/en/applets/finance/general-ledger-applet.md` L48, `content/en/applets/finance/accounts-receivable-applet.md` L42 — these link `/applets/tax-configuration-applet/` (now resolved by the new alias) **and** `/applets/tax-config-applet/` as if they were two different applets ("Standard tax setup" vs "Advanced tax configuration"). There is one applet. After the F-0040 merge, collapse every pair to a single link.
- **Non-existent pages linked from the old page** (now removed, but they are still linked from elsewhere in the finance folder): `/applets/tax-reporting-applet/`, `/applets/tax-payment-applet/`, `/applets/tax-reconciliation-applet/`, `/applets/sales-tax-applet/`, `/applets/purchase-tax-applet/`, `/applets/ecommerce-tax-applet/`, `/applets/supplier-maintenance-applet/`. None has a registry row. Worth a repo-wide sweep.

## Screenshots (run 27)

Kept (4 of 6 in `static/images/tax-config-applet/`):
- `tax-config-listing.png` — the listing on a tenant labelled TESTING with the standard Royal Malaysian Customs code set (IMS0, SRG5, TXG0, ZRE…). No personal names, e-mails or hostnames. Also documents two real behaviours: the 50-row page ("1 – 50 of 57") and blank *Tax Type Name* for the `SVC-MY INPUT` / `SVC-MY OUTPUT` rows whose type is outside the applet's 10-entry map.
- `listing-search-filter.png` — the advanced-search panel (Country, Tax Type, Updated Date range behind a checkbox, Status).
- `create-tax-type-dropdown.png` — Create with the Tax Type list open; also captures the mislabelled *"Please insert tax name"* hint under Tax Code.
- `edit-tax-code.png` — Edit with the audit block and the Delete button.

Dropped:
- `tax-config-overview-infographic.png` — AI marketing infographic (same decision as Pricebook, Stock Balance, Stock Conversion, Stock Replenishment, Supplier). Quarantine.
- `edit-tax-type-dropdown.png` — redundant with the create-screen drop-down and adds nothing.

Recapture list (clean demo tenant): the Settings → Field Settings and Default Selection screens (to show what the stubs look like), and Personalization.

## Notes for the loop

- `kb/topics/tax-configuration.md` created — that is the slug six existing topics already reference (`merchant-admin`, `customer-maintenance`, `entity-applet`, `doc-item-maintenance`, `non-stock-and-trade-in`, `supplier-maintenance`); `e-invoice.md` uses `tax-codes`, which should be pointed at this file.
- METHOD note for §27's neighbourhood: **a `.gitmodules` entry does not mean the applet uses the shared settings screen.** Tax Configuration has the submodule and still defines its own `FieldConfigurationComponent` under `components/settings-container/`. Classify by what `app.routing.ts` imports, not by the submodule's presence.
- METHOD note: **an applet-local settings screen can be a non-functional stub.** Check for a form control / model binding and a click handler on SAVE before documenting a single toggle. Three of the last five master-data applets shipped the same unbound 8-toggle "Lines Settings / Department Settings" panel.
- `tests/content-lint.sh` passes.

---

# Run 28 — Warehouse Management System Applet

**Page:** `content/en/applets/inventory-workflow/warehouse-management-applet.md`
**Registry:** `warehouse_management_system_applet` · "Warehouse Management System Applet" · TNT-ADMIN · ACTIVE ·
`documentation_url = https://wiki.bigledger.com/applets/warehouse-management-system-applet/`, which was
already the page's `aliases` entry — kept, no new alias needed.
**Repo:** `blg-applet-wavelet-warehouse-management-system-applet` (HEAD `0f0ebb70`).
**Backend:** `blg-akaun-platform-java` — `…/erp/wms/` in `javasdk/domain`, `client-sdk/dal/table`,
`akaun-api/controller` and `akaun-api/jobProcessor` (300 `*Wms*` files).

Title changed from "Warehouse Management Applet" to the registry name. The page went from 1663 lines
of user-guide prose to 530 lines of reference.

## What the old page got wrong

Almost the whole Configuration section was invented. Specifically:

- "Application Settings let administrators define whether specific fields are Required, Optional, or
  Hidden" with a four-column *Setting Name / Module / Field / Behaviour* table — **no such screen
  exists.** The real screen is 18 named toggles and drop-downs in two tabs.
- "Default Selection … Default Warehouse / Default Layout / Default UOM" — the real screen offers
  Default Branch and Default Location, and it does not work at all.
- "Feature Visibility … select the role, toggle features On/Off, changes take effect immediately" —
  the component is a stub with three hard-coded team names and no save handler.
- Webhook use-case table (Receiving Doc created → ERP, Packing List posted → customer portal, …) —
  entirely invented; the applet has a `settings/webhook` route and nothing that emits an event.
- "Audit Trail (`Settings > Applet Log`)" — the link exists in the shared sidebar but this applet has
  no `applet-log` route, so it lands on 404. Same for Release Notes.
- Receiving Doc statuses "Draft / Submitted / Posted / Cancelled" — `WmsPostingStatusColumn` has
  exactly two values, `DRAFT` and `FINAL`.
- "Picking Queue … all pending order items sorted by Sales Invoice" — the queue is fed only from the
  Sales Order applet and the listing hard-codes `server_doc_type: "INTERNAL_SALES_ORDER"`. The
  column is *labelled* "Sales Invoice No" but holds the sales order's `server_doc_1`.
- WMS Item Maintenance "storage class / handling notes / min-max stacking rules" — `bl_wms_item_hdr`
  has item code, name, type, UOM, description, stock balance and four dimension columns. Nothing else.

## Facts established (all cited in the page's `sources:` map)

1. **Settings are applet-local.** `app.routing.ts` maps `settings/field-settings` to the repo's own
   `components/settings-container/field-configuration/FieldConfigurationComponent`. The repo *does*
   carry the shared-utilities submodule (pinned `cf8379f2`), used only for the settings shell, the
   permission screens, feature visibility, webhook and the personalization sidebar. This is METHOD §29
   again — a `.gitmodules` entry proves nothing.
2. **Four proofs.** 18 keys are declared in the form group, all 18 are rendered (15 slide toggles +
   3 drop-downs across two `mat-tab`s), all 18 are persisted by one SAVE (`saveMasterSettingsInit` →
   `bl_applet_ext` `param_code = APPLET_SETTINGS`, `param_type = JSON`; the storage shape is visible
   in `packed-list-scan-listing.component.ts`, which re-reads the ext row directly). **15 are
   consumed.** Dead: `ENABLE_BUNDLE_CONFIG_UPON_FINAL`, `ENABLE_CAMERA_SCANNER`,
   `ENABLE_SCAN_CODE_SEARCH` — no reader in the applet and, per §15, no Java-side reader either
   (`grep` for all key names across `blg-akaun-platform-java` returns nothing). `ENABLE_BRANCH_FILTER`
   is in `applet-settings.model.ts` only: not rendered, not saved, not read.
3. **Two settings-form quirks worth keeping.** (a) The Picking List toggle is *labelled*
   `ENABLE_CONSOLIDATED_PACKING_LIST_CONVERSION` but bound to `ENABLE_CONSOLIDATED_PACKING_LIST`;
   the long name is not a key. (b) Three mutually-exclusive pairs are enforced in the settings form
   only (camera vs scan-code, cart scan by container vs by container+item, packed scan by container
   vs by container+item) — a value pushed straight into `bl_applet_ext` can set both.
4. **Both Default Selection screens are unwired.** `DefaultSettingsComponent` and
   `PersonalDefaultSettingsComponent` declare `appletContainer: AppletContainerModel` and never assign
   it (the personal one's populating subscription is commented out); their `valueChanges` handlers
   dereference `this.appletContainer.bl_applet_exts` and throw, and SAVE emits an `@Output` nobody
   binds because both are routed directly. Consequence: `DEFAULT_LOCATION` is *read* in three places
   (Receiving Doc create, Space Container Allocation create/edit) and has **no working writer
   anywhere in the applet**. Same decoy shape already recorded for Shipping Pricebook (run 20),
   Merchant Admin (run 16) and Supplier (run 26).
5. **The applet moves no stock and posts no journal.** No `bl_wms_*` table has a
   `*DataConsistencyObject` under `FinancialDocDataConsistencyObject/`, no `JournalPostingTypeHandler`
   entry, no `bl_inv_txn_line` write. The outbound flow ends by *drafting* a generic document:
   `INTERNAL_OUTBOUND_DELIVERY_ORDER` (amount signum 0, quantity signum 0 — moves nothing even at
   FINAL) or `INTERNAL_OUTBOUND_STOCK_TRANSFER` (amount 0, quantity −1). Both are written with
   `posting_status = DRAFT` and finalised in their own applets. This is the single most important
   correction the page makes.
6. **The Picking Queue has exactly one producer, and it is outside this applet.**
   `wms-pick-pack-queues/insert-wms-picking-queue/backoffice-ep` is called only from
   `insertToWarehousePickingQueue` in the ts-lib, and the only non-`node_modules` callers in the org
   are the Sales Order (Internal) V2 applet and the Shopee Sales Order applet (plus two
   customer-specific copies, not cited). The endpoint copies `bl_fi_pick_pack_queue` rows into
   `bl_wms_pick_pack_queue` and **deletes the finance-side rows**.
7. **`createPickingList` ignores your selection and the queue balance.** It groups the selected WMS
   queue rows by *source document header*, then iterates every `bl_fi_generic_doc_line` of that
   document, setting `qty_to_pick = quantity_base.intValue()`. So (a) selecting one line of a sales
   order produces a picking list covering all its lines, (b) partial shipments are picked at the full
   ordered quantity, and (c) fractional quantities are truncated because `qty_to_pick` / `qty_picked`
   are `Integer` columns on `bl_wms_picking_list_line`. All selected queue rows are deleted in the
   same transaction.
8. **The Receiving Doc FINAL button has two code paths.** From the *listing*,
   `ENABLE_AUTO_ITEM_ALLOCATION_TO_CONTAINER` chooses between `auto-allocate-items` and the plain
   processing-queue insert. From the *editor*, `ReceivingDocActions.updatePostingStatus` always goes
   through `insertToProcessingQueueByAutoAllocation` — the setting is ignored. Turning the setting off
   therefore appears not to work depending on which screen the user finalises from.
9. **Status vocabularies.** Receiving Doc `posting_status`: `DRAFT` → `FINAL`. Putaway
   `process_status`: `PENDING_ALLOCATION` (no `layout_node_guid` on the container's `property_json`)
   or `PLANNED_ALLOCATION` → `COMPLETED_ALLOCATION` (slotting creates the node↔container link and
   deletes the putaway processing-queue row). Picking list `packing_status`: `PENDING_PICKING` →
   `IN_PACKING_STATION`. Packing list line: `UNPACKED` → `PACKED`. Source generic document header and
   lines: `IN_PROGRESS` → `COMPLETED` (`PackingStatusEnum`).
10. **VOID is asymmetric.** `FINANCIAL_PICK_PACK_QUEUE_VOID_PROCESSOR` fires when an
    `INTERNAL_SALES_ORDER` reaches `VOID`. It deletes the order's `bl_fi_pick_pack_queue` rows and its
    picking list **only while the picking list is `PENDING_PICKING`**; after `IN_PACKING_STATION` it
    does nothing. It never touches `bl_wms_pick_pack_queue`, so anything already pulled into the
    warehouse queue is orphaned by the void.
11. **Consolidated DO rules.** *Create DO* requires all selected packing lists to share one
    `doc_entity_hdr_guid` — otherwise `Core2BadRequestException("Customers are not the same for
    consolidated DO")` — and carries only lines with `packing_status = PACKED`. Only `DRAFT` packing
    lists are eligible (filtered client-side).
12. **Permissions.** `bl_applet_client_side_perm_dfn` joined to `bl_applet_hdr` on `applet_guid` has
    **zero rows** for this applet code (akaun_master, 2026-09-06). No `hasPermission()` call and no
    `SHOW_*`/`HIDE_*` constant exists in the applet. The one live `HIDE_*` reference
    (`!appletSettings.HIDE_UNIT_PRICE_STD_PRICING_SCHEME || SHOW_UNIT_PRICE_STD_PRICING_SCHEME`) reads
    a key in no model and a component property that is never declared, so the guarded control is
    always shown. The `PermissionResolver` *does* register a **Warehouse** target view, so server-side
    permissions can be scoped per warehouse — that is the only applet-specific permission surface.
13. **Dead UI worth naming.** The receiving line's *Bin Number* tab has four `Validators.required`
    fields and no save handler or dispatch at all. `space-container-allocation-report` has a route and
    no menu entry (commented out in `menu-items.ts`). The Picking List *Search* and *Packing List*
    tabs and the Packing List *Export/Print* tab are commented out in the templates.
14. **Shared-utilities drift (METHOD §26).** At the pinned commit the settings sidebar also renders a
    *Client Side Permissions* group (Applet Access, Role Pricing Scheme Linking, Teams→404, Roles→404)
    and an *Integration → Triggers* group; at HEAD both are commented out and *Audit Trail* is gone
    too. The product screenshot shows neither the client-side nor the integration group but still
    shows Audit Trail — i.e. the deployed bundle is a third state, between pinned and HEAD. The page
    describes the sidebar as the screenshot shows it and flags Release Notes / Audit Trail as 404s.

## Registry / naming mismatches

None. Exactly one ACTIVE row matches (`bl_applet_hdr` queried live 2026-09-06 for `%warehouse%` /
`%wms%`), the `documentation_url` already resolves to this page, and there is no second page for it.

## Cross-lane link requests (7)

- `content/en/applets/master-data/inv-item-maintenance-applet.md` (lane 4, done — **needs correcting**)
  — three places say Warehouse Management owns "Locations (`bl_inv_mst_location`)" (front-matter
  Upstream table, the Location tab paragraph, and Related documentation). It does not. Locations are
  owned by [Organisation](/applets/master-data/organisation-applet/). Warehouse Management owns a
  *separate* warehouse → layout → node → container hierarchy in `bl_wms_*`. Re-point those three
  references at Organisation.
- `content/en/applets/inventory-workflow/stock-reservation-applet.md` (lane 4, done — **needs
  correcting**) — three places say bin headers/lines that a bin reservation points at are "maintained
  in Warehouse Management". They are not: the WMS *Bin Number* tab is dead code with no save handler,
  and the WMS writes none of the `bl_inv_bin_*` tables. Either name the real owner or drop the claim.
- `content/en/applets/sales-workflow/internal-sales-order-applet.md` (lane 2/3) — add
  `warehouse-management-applet` to `related_applets`, and document the **Pick Pack Queue → Send to
  Warehouse Picking Queue** button: it is the only way rows reach the WMS Picking Queue, it deletes the
  finance-side `bl_fi_pick_pack_queue` rows in the process, and VOIDing the order afterwards will not
  clean up what has already been pulled across.
- `content/en/applets/sales-workflow/internal-outbound-delivery-order-applet.md` (lane 2/3) — add
  `warehouse-management-applet` to `related_applets` and state that a DO can arrive already created in
  `DRAFT` from a WMS Packing List (consolidated, one customer only, PACKED lines only) or from
  *Batch Process DO* (one per packing list, priced from `DEFAULT_PRICING_SCHEME`). Also worth stating
  there that this doc type is 0/0 — it moves no stock.
- `content/en/applets/inventory-workflow/stock-transfer-applet.md` (lane 4, done) — it already links
  Warehouse Management with "packing lists reference outbound transfers". Sharpen: the WMS *creates*
  the `INTERNAL_OUTBOUND_STOCK_TRANSFER` in `DRAFT` from the Packing List's Doc Conversion tab, with
  company/branch/from-location/to-location/date all required on that form and prefilled from
  `DEFAULT_COMPANY` / `DEFAULT_BRANCH` in the WMS applet settings. That is the only stock-moving exit
  from the warehouse flow.
- `content/en/applets/ecommerce/` — the Shopee Sales Order applet also calls
  `insertToWarehousePickingQueue`. Whoever owns that page should note it, and note that the WMS
  Picking Queue listing filters to `INTERNAL_SALES_ORDER`, so Shopee-pushed rows of another doc type
  would never surface. (Open question in the topic file.)
- `content/en/modules-v2/inventory/related-applets/_index.md` — its Warehouse Management entry should
  say the applet drafts documents rather than posting stock, so readers do not look for a journal.

## Screenshots (run 28)

Kept (2 of 23 in `static/images/warehouse-management-applet/`):
- `application_settings_details_1774408664855.png` — Applet Settings → Application Settings, Inbound
  Process tab, showing the three Receiving Doc toggles and the collapsed Scan Session / GRN Processing
  Queue panels. No grid data, no names. Also independently confirms the settings sidebar groups.
- `applet_settings_listing_1774408553901.png` — the empty *Teams / Manage Team Access* panel you land
  on when you click Settings, i.e. Feature Visibility. No data.

Dropped (21) — all listing/form captures from a staging tenant whose test data carries a **full
personal name** repeated across the PIC and Supplier columns, a **real Malaysian insurer's registered
name** in a Supplier cell, and developer test records built from people's first names
(`SaadTest`, `ShyamWarehouse`, `Reza Warehouse Inc.`, `E Solutions Warehouse`):
`warehouse_listing_*`, `warehouse_listing_advanced_search_*`, `create_warehouse_*`,
`edit_warehouse_details_*`, `edit_warehouse_layout_*`, `edit_warehouse_node_setting_*`,
`receiving_doc_listing_*` (both), `receiving_doc_creation_*`, `receiving_line_listing_*`,
`processing_queue_listing_*`, `putaway_list_listing_*`, `putaway_processing_listing_*`,
`scan_session_listing_*` (which is in fact a capture of the *Receiving Lines* screen, mislabelled),
`picking_queue_listing_*`, `picking_list_listing_*`, `packing_list_listing_*`,
`space_container_allocation_listing_*` (both), `warehouse_container_listing_*`,
`warehouse_container_view_drawer_*`, `warehouse_picker_listing_*`,
`warehouse_picker_view_drawer_*`. Plus `warehouse-management-overview-infographic.png` — AI marketing
infographic, same decision as Pricebook / Stock Balance / Stock Conversion / Stock Replenishment /
Supplier / Tax Configuration. Quarantine.

Recapture list (clean demo tenant, no real names): Warehouse listing + Create Warehouse; the Layout
and Node Setting tabs with a populated node tree; Receiving Doc listing showing the FINAL button;
Receiving Doc editor tab strip (Main Details / Account / Lines / Generic Document / External Generic
Document / Attachments); Processing Queue with the putaway-allocation and bulk-update controls
enabled; Putaway List showing all three process statuses; Space Container Allocation create with the
scan fields; Picking Queue with the Location Balance / Company Balance columns; Picking List editor
tab strip; Packing List Doc Conversion tab; Containers; Pickers; the Outbound Settings tab of
Application Settings.

## Notes for the loop

- `kb/topics/warehouse-management.md` created (new slug; nothing referenced it before).
- METHOD candidate §31: **"the queue this applet reads is filled by a different applet."** Before
  writing a queue-driven applet's Lifecycle, grep the org for the *producer* endpoint
  (`grep -rl <method> --include=*.ts refs/ | grep -v node_modules`). Here the entire outbound flow is
  inert until a button in a sales applet is pressed, and no amount of reading the WMS repo would have
  shown that.
- METHOD candidate §32: **a conversion applet's posting section is the target document's signums, not
  its own.** Warehouse Management has no DCO at all; the honest posting proof block is a row of "not
  applicable" plus a table of what the *drafted* documents will do when someone else finalises them.
- Two `Integer` columns (`qty_to_pick`, `qty_picked`) in a system whose quantities are `BigDecimal`
  everywhere else. Worth a bug report independent of the docs.
- `tests/content-lint.sh` passes.

---

# Run 29 — 2026-09-06 — Workflow Design Applet; lane 2's queue adopted

## Page completed

- `content/en/applets/master-data/workflow-design-applet.md` — registry `workflow_design_applet`
  "Workflow Design Applet" (TNT-ADMIN, ACTIVE). Title unchanged; the registry `documentation_url`
  already points at this URL, so no alias was needed. Full rewrite: the previous 358-line page was an
  invented user guide (webhooks that fire on status change, e-mail/SMS notifications, "database
  updates", conditional routing by amount, approver delegation, process version control, an audit
  trail of workflow design changes, and an FAQ claiming the system blocks deletion of an in-use
  status). **None of that exists.** Replaced with a 369-line reference derived from the applet, the
  shared utilities, the Java backend and the schema.

## Cross-lane requests satisfied

Every queued "add Workflow Design to `related_applets`" request is now honoured from this side, and
each named applet is linked in *Where it fits* / *Related applets*:

- lane 1: `internal-sales-order-applet`, `internal-sales-invoice-applet`,
  `internal-sales-credit-note-applet`, `internal-sales-quotation-applet` (findings lines 19/22/24/109).
- lane 3: `internal-purchase-order-applet` (findings line 15) and the note at line 851 — *"document
  applets' Workflow Settings attach a process per company and the status is a label, not a gate, for
  generic documents (intranet #3251 open)"*. Both are now stated with backend proof (see below).
- lane 4 run 13: `stock-take-applet` — the page says the stock take stamps the Starting Status and
  offers the same transition list but enforces nothing, and cites the two open requests.

Also added, from the code rather than a request: `internal-sales-debit-note-applet`,
`internal-sales-return-applet`, `internal-purchase-requisition-applet`,
`internal-purchase-return-applet`, `internal-packing-order-applet`,
`internal-outbound-delivery-order-applet`, `internal-rma-applet`, `car-workshop-applet`,
`tenant-admin-applet`, `organisation-applet`, `employee-applet`.

## What the code actually says (the corrections that matter)

1. **The status track is a label for generic documents.**
   `GenericDocumentHdrDataConsistencyObject` (javasdk `.../FinancialDocDataConsistencyObject/`,
   creation validators ~L215–232 and the matching update block ~L429–446) validates only that
   `wf_process_hdr_guid` and `wf_process_status_guid` *exist* as rows
   (`GENERIC_DOC_HDR_WF_PROCESS_HDR_GUID_GUID_DOES_NOT_EXIST`,
   `GENERIC_DOC_HDR_WF_PROCESS_STATUS_GUID_DOES_NOT_EXIST`). Nothing checks that the status belongs
   to the process, and nothing checks that a transition exists from the previous status. Confirms
   lane 3's line 851 with a citation.

2. **The only enforcement is `FINAL_STATUS_GUID`, and it is client-side.**
   `internal-sales-order-applet-v2/.../internal-sales-order-view.component.ts` L334, L428, L669–675:
   the FINAL button is rendered only when
   `(!HIDE_GENDOC_FINAL_BUTTON || SHOW_FINAL_BUTTON) && status==='ACTIVE' && (!postingStatus ||
   postingStatus==='DRAFT') && (FINAL_STATUS_GUID === CURRENT_STATUS_GUID || FINAL_STATUS_GUID === null)`.
   Unset = gate off. Per METHOD §5 the page states this is button visibility, not a backend rejection.

3. **The "who can move it" rule is a SQL join, and one missing row silences it.**
   `ProcessStatusUow.getAvailableStatusesForUserProcessGuid` (javasdk L163) inner-joins
   `bl_wf_md_transition` → `bl_wf_md_process_status` → `bl_wf_md_transition_role_link` →
   `app_mst_role` → `app_mst_link_subject_to_role` on the caller's subject GUID. A transition with no
   Role row returns nothing **for everyone**, so the drop-down shows only the current status (the
   shared form prepends it). This is the single most useful troubleshooting fact on the page.
   The ordered variant (L194) sorts on `bl_wf_md_process_status_link.sequence_no`, which the link
   screen never populates at link time — hence "statuses come back in a strange order".

4. **Transition Actions, Action Types and Notification Subscribers are dead.** `ActionService`,
   `ActionTypeService`, `TransitionActionService` and `ProcessTransitionNotificationSubscriberService`
   are create/update/delete only. Nothing in `javasdk/.../domain/jobProcessor/` reads `bl_wf_md_action`,
   `bl_wf_md_action_type`, `bl_wf_md_transition_action` or
   `bl_wf_md_process_transition_notification_subscriber`. `jobProcessor/wf/` contains only the
   `bl_wf_issue` GitHub-sync and issue-e-mail processors, which are a different subsystem.
   **There is no workflow e-mail, SMS or webhook.**

5. **Transition triggers run for exactly one document family.**
   `SvcIssueProcessStatusProcessorService` L53–60 →
   `SvcIssueProcessStatusProcessorHelperMethods.loopThroughTriggersAndUpdateProcessStatusesForSvcIssue`.
   Only the Service Note / RMA header (`bl_svc_issue_hdr`, with internal / customer / supplier process
   columns) is cascaded. `type` is `TRANSITIONS` (checks the target's current status matches the target
   transition's `current_process_status_guid`) or `TARGET_STATUS` (sets it directly) —
   `ProcessTransitionToTransitionConstants` in client-sdk. No generic-document equivalent exists.

6. **There are two unrelated approval systems and the wiki has been conflating them.**
   `bl_wf_md_*` (this applet) versus `bl_fi_generic_doc_approval_hdr` / `_setting` / `_sequence` /
   `_request` / `_history` / `_conversion_monitor` with a real processor and the
   `GENERIC_DOC_APPROVAL_PENDING_APPROVAL_NOTIFICATION` /
   `GENERIC_DOC_APPROVAL_REJECT…` e-mail templates
   (`akaun-api/.../jobProcessor/erp/genericDocument/approval/`). The second one has UI in
   `blg-applet-wavelet-internal-purchase-order-applet`,
   `…-internal-purchase-requisition-applet`, `…-internal-stock-requisition-applet` and
   `blg-applets-wavelet-erp-v3`. The page opens with a warning callout naming both.

7. **Attachment path.** `bl_fi_comp_workflow_gendoc_process_template_hdr` (company + process +
   `server_doc_type` + `applet_guid`, written by each document applet's Settings → Workflow Settings,
   24 org applet repos have that screen). The shared `company-workflow-dropdown` filters it on
   `applet_guid === sessionStorage.appletGuid`, so a link created from a *different* applet never
   shows up — the second-most-useful troubleshooting row.

8. **The status link copies its labels.** `status-listing.component.ts` onSave copies
   `name`, `code`, `description` from `bl_wf_md_process_status` onto
   `bl_wf_md_process_status_link` at link time. Renaming the catalogue status afterwards does not
   change what documents show. No uniqueness validator, so the same status can be linked twice.

## Configuration classification (METHOD §29, §27)

- `.gitmodules` exists and pins `blg-shared-utilities` at `f1ded0401b9b206694055f919420fc02497f573a`
  (submodule **not** checked out in refs — read via `git archive <sha>` into the scratchpad, and the
  refs clone was left on `main`).
- `app.routing.ts` line 2 imports `FieldConfigurationComponent` from
  `projects/shared-utilities/...`, so the routed Application Settings screen is the **shared** one.
  The applet *also* declares `components/settings-container/field-configuration/` in
  `AppletSettingsModule` — the familiar unbound 8-toggle stub (Lines Settings / Department Settings,
  no `formControl`, no SAVE handler) — but it is routed nowhere. This is the mirror image of §29:
  there the submodule existed and the *local* stub was in use; here the stub is dead and the shared
  screen is live. **Classify by what `app.routing.ts` imports** remains the right rule.
- `workflow_design_applet` has no `tabMappings` entry, so no tab-hide section renders and every
  ungated control does. `kb/tools/gates.py workflow_design_applet`: **235 RENDERED + 60
  RENDERED?(runtime)** at the pinned commit; **237 + 60** at shared-utilities HEAD `a8c38a2`.
  Diff between pinned and HEAD for this applet: `+ALLOW_DUPLICATE_SERIAL_NUMBER_ACROSS_DIFFERENT_ITEMS`,
  `+HIDE_BATCH_EXPIRY_DATE`, `+HIDE_BATCH_ISSUE_DATE` (both RENDERED), `+HIDE_OUTSTANDING_AMOUNT`,
  `+HIDE_REBATE_PRICE_EXCL_TAX`, `+POS_VOUCHER_INVENTORY`, and the approval-menu gates gained a second
  applet code. None is consumed here.
- **Consumed keys: one.** `PRINTABLE`, through
  `printable-format.effects.ts selectDefaultPrintableFormat$ → saveSettings$` (which writes the
  `APPLET_SETTINGS` `bl_applet_ext` row itself rather than going through the session effect) and read
  back by `printable-format-listing.component.ts` L90. `DEFAULT_BRANCH` / `DEFAULT_LOCATION` /
  `DEFAULT_COMPANY` are written by Default Selection (and the personal twin) and read back only by
  those same screens.
- `bl_applet_client_side_perm_dfn` joined to `bl_applet_hdr` on `code='workflow_design_applet'`:
  **no rows**. Server-side only, via `TntWFPermissions.TNT_API_DM_WF_MD_*`.

## Defects found (worth a bug report independent of the docs)

- **F-lane4-29-a** Printable Format Settings in this applet queries
  `txn_type = INTERNAL_BLANKET_PURCHASE_ORDER` — `applet-constants.ts` still holds the forked
  Blanket PO doc type (`amount_signum` 0, `quantity_signum` 0). The screen therefore lists and tags
  blanket-PO printables. The applet has no print button at all.
- **F-lane4-29-b** The shared settings shell renders a **Release Notes** link (Developer Tools) for
  which this applet has no `release-notes` route; it falls through to the applet's `**` → 404.
- **F-lane4-29-c** `settings/webhook` and `settings/feature-visibility` are routed but have no menu
  link (the Integration group is commented out in the shared shell). `settings` with no child
  redirects to `feature-visibility`, so the gear lands on an unlinked screen.
- **F-lane4-29-d** Create Process's **Status** and **Transition** tabs are ag-grids bound to
  `[rowData]="[]"` with no Add control — permanently empty. Work only happens in Edit.
- **F-lane4-29-e** Process create: Description is marked `required` in the template but its
  `UntypedFormControl` has no validator; the asterisk is a lie.
- **F-lane4-29-f** Transition Trigger create: SAVE is never disabled, `transition` keeps
  `Validators.required` even in TARGET_STATUS mode, and `isAllDataValid` only rejects a literal
  `'404'` sentinel — a trigger can be saved with a null target.
- **F-lane4-29-g** The Action screen saves the typed **Name** into `bl_wf_md_action.namespace`
  (the table has no name column) and the listing reads it back from there. Harmless but confusing.
- **F-lane4-29-h** `ProcessStatusService.delete` has no in-use check; a status referenced by live
  documents and by process links can be deleted.
- **F-lane4-29-i** The applet still carries the fork's dead code: `models/design-workflow-process.model.ts`
  and `models/workflow-design-process-status.model.ts` both re-declare `InternalSOMain`;
  `state-controllers/supplier-controller/`, `models/supplier*.ts`, `models/customer-constants.ts`,
  `models/advanced-search-models/blanket-purchase-order.model.ts` and
  `components/settings/settings.component.ts` (an entire `app-settings` component declared in no
  module, with a fully commented-out template) are all unreferenced. Intranet #4126 tracks the
  refactor onto `blg-akaun-ng-lib`.

## Screenshots with personal data

Eight of the eleven images under `static/images/workflow-design-applet/` must be quarantined; the
page no longer references them.

- `process-listing.png` — grid rows carry six staff full names in Created By / Updated By, and a
  process named after a real Malaysian telco brand.
- `process-edit-form.png` — same listing behind the Create Process panel, same brand row.
- `process-status-listing.png` — staff full names in Created By / Updated By.
- `process-resolution-listing.png` — staff full names.
- `transition-action-listing.png` — staff full names.
- `transition-action-type-listing.png` — staff full names.
- `settings-permission-wizard.png` — permission-template codes that read as a customer/brand
  abbreviation plus a developer's initials; same call as the Organisation (run 17) and Shipping
  Pricebook (run 20) drops.
- `workflow-design-applet-overview-infographic.png` — AI marketing infographic; same decision as
  Pricebook / Stock Balance / Stock Conversion / Stock Replenishment / Supplier / Tax Configuration /
  Warehouse Management.

Kept (clean): `settings-feature-visibility.png` (Applet Settings navigation + the shared tab strip),
`settings-default-selection.png`, `settings-webhook.png`.

Recapture list (clean demo tenant, no real names, no brands): Process listing; Create Process Details
tab; Edit Process → Main showing Type and Starting Status; Edit Process → Status with sequence numbers
and resolutions; the Process Status catalogue multi-select used to link statuses; Edit Process →
Transition; a transition's five sub-tabs (Details / Transition Triggers / Role / Subscriber / Action);
Process Resolution listing; Action and Action Type listings; a document's workflow status drop-down
showing the role-filtered next statuses.

## Cross-lane link requests (from this page)

- **`content/en/applets/purchase-workflow/internal-purchase-order-applet.md`** and
  **`.../internal-purchase-requisition-applet.md`** (lane 3): these two carry *both* mechanisms —
  Settings → **Workflow Settings** (this applet's processes; label only) and Settings → **Approval
  Settings** (`bl_fi_generic_doc_approval_*`; the real engine with e-mail). The pages should name
  which is which; today a reader cannot tell. Add `workflow-design-applet` to `related_applets`.
- **`content/en/applets/sales-workflow/internal-sales-invoice-applet.md`** (lane 1): its Configuration
  section lists `FINAL_STATUS_GUID` under "rendered but unread". It *is* read in the Sales Order V2
  sibling and gates the FINAL button; worth re-checking whether the invoice's own view component
  reads it before leaving it in the no-op list.
- **`content/en/applets/inventory-workflow/stock-take-applet.md`** (lane 4, done run 13): add
  `workflow-design-applet` to `related_applets` if not already there, and state that the transition
  list it offers is filtered by the user's roles — an empty list means the transition has no Role row,
  not that the session is locked.
- **`content/en/applets/rma/internal-rma-applet.md`** and
  **`content/en/applets/sales-workflow/car-workshop-applet.md`** (lane 2 → now this lane): these are
  the **only** consumers whose transition triggers execute. Their Lifecycle sections should describe
  the `SvcIssueProcessStatusProcessor` cascade over the internal / customer / supplier process columns.
- **`content/en/applets/integrations/webhook-applet.md`** (lane 2 → now this lane): should say that
  applet triggers are the *only* event mechanism — a workflow transition fires nothing.
- **`content/en/applets/external-tenant-admin/tenant-admin-applet.md`** (lane 3): roles and
  role-to-user assignment are the gate on every workflow transition; add `workflow-design-applet`.
- **`content/en/applets/master-data/organisation-applet.md`** (lane 4, done run 17): add
  `workflow-design-applet` to `related_applets` — processes are attached per company.
- Any page or guide claiming a workflow status change sends an e-mail, an SMS or a webhook is wrong
  and should be corrected on sight.

## Lane 2 queue adopted

Lane 4's own queue is empty. Per the run-29 instruction I have started taking pages from
`planning/lanes/lane-2/state.json` in order; `folders` in lane 4's state now also lists `finance`,
`crm`, `integrations`, `rma`, `human-resources`, and `adopted_from` records the handover.
First adopted page: `content/en/applets/finance/deposit-applet.md`. **The coordinator should move the
remaining 23 items out of lane 2's queue** so the two lanes cannot collide:
`integrations/developer-sysadmin-applet`, `finance/e-mandate-applet`, `crm/engagement-applet`,
`crm/events-management-applet`, `finance/fixed-asset-applet`, `finance/general-ledger-applet`,
`integrations/ingram-micro-ms-esd-applet`, `crm/installation-of-team-maintenance-applet`,
`rma/internal-rma-applet`, `crm/introduction-to-team-maintenance-applet`, `finance/investment-applet`,
`finance/investment-guide`, `finance/mm-deposit-applet`, `finance/revenue-management-applet`,
`finance/sst-applet`, `finance/statement-of-account-applet`, `integrations/t2t-admin-applet`,
`crm/team-maintenance-applet`, `finance/txn-recon-applet`, `crm/unified-contact-center-ucc-applet`,
`integrations/vstecs-ms-esd-order-applet`, `rma/warranty-admin-applet`,
`integrations/webhook-applet`.

## Notes for the loop

- `kb/topics/workflow-design.md` created. The slug matches what
  `kb/topics/internal-purchase-requisition-applet.md` and `kb/topics/stock-take.md` already reference;
  `kb/topics/internal-purchase-order-supplier-access-applet.md` uses `workflow-process` and
  `kb/topics/internal-purchase-order-applet.md` uses `approval-workflow` for the same thing — both are
  listed as aliases in the new topic, and those two `related:` lines should be normalised to
  `workflow-design`.
- METHOD candidate §33: **when an applet's screens are a role-filtered list, read the SQL, not the
  component.** The whole behaviour of Workflow Design lives in one `ProcessStatusUow` query; the
  Angular side just renders whatever comes back. Any applet whose UI "sometimes shows nothing" is a
  join to go and read.
- METHOD candidate §34: **check whether a second, newer subsystem does the same job.** Workflow Design
  and `bl_fi_generic_doc_approval_*` both look like "approvals"; the older one is inert and the newer
  one is real. Before documenting a feature, grep the schema for a second table family with the same
  noun.
- `tests/content-lint.sh` passes.

## Adopted page 1 — `finance/deposit-applet.md`: IA question settled before writing

Reconnaissance only this run; the page stays in the queue and gets its full rewrite next run. What is
now established, so the next run does not have to re-litigate it:

- **One registry row, two pages.** `depositApplet` / "Deposit Applet" (TNT-USER, ACTIVE,
  `documentation_url` = `https://wiki.bigledger.com/applets/mm-deposit-applet/`). Both
  `content/en/applets/finance/deposit-applet.md` (438 lines) and
  `content/en/applets/finance/mm-deposit-applet.md` describe it; the latter carries the alias
  `/applets/mm-deposit-applet/` that matches the registry URL. Both sit in lane 2's queue.
- **There is no second "general deposits" applet.** `blg-applet-wavelet-deposit-applet`
  (`micro-fe/projects/wavelet-erp/applets/deposit-applet/src/app/app.routing.ts` and
  `models/menu-items.ts` at commit 442b3ae) exposes exactly three routes —
  `deposit-requisition`, `deposit-register`, `deposit-category`, labelled **MM Deposit Requisition /
  MM Deposit Register / MM Deposit Category**. Nothing about security deposits, utility deposits or
  reclaim tracking exists.
- **So `content/en/modules-v2/financial-accounting/_index.md` L178–179 is wrong**: it lists
  "MM Deposit Applet — money market" and "Deposit Applet — for other deposit instruments (security
  deposits, utilities) … deposit balance and reclaim tracking" as two different applets. That
  distinction is invented. Lane 3/coordinator: one row, one link.
- **Recommendation (Vincent's call, F-0050 pattern):** keep `finance/deposit-applet.md` as the
  canonical page — its slug matches the registry code and name, and the three inbound applet links
  (`modules-v2/financial-accounting`, `inventory-workflow/related-applets-stock-balance`,
  `finance/investment-applet`) already point at it — move the `/applets/mm-deposit-applet/` alias onto
  it, fold in anything accurate from `mm-deposit-applet.md`, and delete that file. Until decided,
  neither page should be rewritten twice.
- Two defects visible without opening the code: `deposit-applet.md` names three real Malaysian banks
  in its worked example (CLAUDE.md forbids naming real banks) and is written in guide voice with a
  "Work in Progress" callout, TL;DR heading and emoji; `mm-deposit-applet.md` contains mojibake
  (`requestâ†'approval`, `â€'`) that the lint's allowlist is currently letting through.

# Run 30 — 2026-09-06 — Deposit Applet (adopted page 1)

## Page completed

- `content/en/applets/finance/deposit-applet.md` — registry `depositApplet` "Deposit Applet"
  (TNT-USER, ACTIVE). Title unchanged. Full rewrite: 438 lines of guide-voice marketing (TL;DR
  heading, emoji, "Work in Progress" callout, an analogy section, three real Malaysian bank names,
  a "Who Benefits" section, a Quick Start and an FAQ) → 592 lines of reference derived from the
  applet at `442b3ae`, blg-shared-utilities at the pinned `f1ded04`, and the Java backend at
  `1ff620e`.

## The IA question (carried over from run 29) — NOT resolved, by design

Run 29 established one registry row, two pages. Per the run-30 instruction I wrote
`finance/deposit-applet.md` as the single canonical reference for all three menus and **did not
touch** `finance/mm-deposit-applet.md`. What the merge would involve, precisely:

- **The alias.** `mm-deposit-applet.md` front matter carries `aliases: [/applets/mm-deposit-applet/]`,
  which is exactly the registry `documentation_url`. That alias must move to `deposit-applet.md` in
  the *same* commit that deletes `mm-deposit-applet.md` — Hugo fails a build with the same alias
  declared on two pages, so it cannot be pre-added.
- **Inbound links to repoint** (5): `content/en/modules/accounting/_index.md` L162,
  `content/en/modules-v2/financial-accounting/_index.md` L178, L261, L352, and
  `content/en/applets/finance/investment-applet.md` L420. None is in this lane's folders.
- **What `mm-deposit-applet.md` has that the canonical page now covers**: the three menus, the
  fixed/floating exclusivity, the invitee constraints, the formatting rules, the SAVE/FINAL parity,
  the category screen. All re-derived from source and, where the old page was wrong, corrected.
- **What `mm-deposit-applet.md` has that the canonical page deliberately does not carry**: a
  "Files of Interest" list of repo paths in the body (the standard puts those in `sources:`), a
  "Data Models (conceptual)" column dump, a "Demo Script", and a "Customer Management
  (Select / Create / Edit)" section. That last one is *real* but mis-framed: those screens are the
  entity picker behind **Edit Invitee → Entity Name**, not a customer-maintenance feature of the
  deposit applet. If the pages are merged, that content should not survive as its own H3.
- **Its 17 screenshots** live under `static/screenshots/deposit-applet/` (a different tree from the
  13 under `static/images/deposit-applet/`). They were not audited this run because the page was not
  touched. `invite-email.png` and `quotation-form.png` are the only two the canonical page has no
  equivalent for and are worth auditing before deletion.
- **Its mojibake** (`requestâ†'approval`, `â€'`, `”¦`, `”™`) is still there; `tests/content-lint.sh`
  passes because the check looks for a narrower byte pattern. Either the merge removes the file or
  the lint's mojibake rule needs widening — worth a separate item.

**Recommendation unchanged from run 29:** keep `finance/deposit-applet.md`, move the
`/applets/mm-deposit-applet/` alias onto it, delete `mm-deposit-applet.md`, repoint the five inbound
links. Vincent's call (F-0050 pattern). `mm-deposit-applet.md` stays in the queue and is skipped when
reached, for the same reason.

## What the code actually says (the corrections that matter)

1. **The applet posts no journal, and has no server document type.** `bl_fi_deposit_requisition_hdr`
   and `bl_fi_deposit_register_hdr` have no `ServerDocTypes` entry, no
   `FinancialDocDataConsistencyObject`, and `JournalPostingService` contains no reference to either.
   The old page's "Posts GL journal entries automatically when a deposit is finalised — no manual
   journaling" is wrong, as is "These transactions are the actual journal entries posted to the GL".
   What FINAL actually writes is `bl_fi_deposit_register_txn_line` rows — an interest schedule in the
   applet's own table (`DepositRegisterTxnLineService.createAutomaticTransactions`).
2. **The Payment/Receipt tab links documents; it never creates them.** The picker is hard-coded to
   `INTERNAL_RECEIPT_VOUCHER, INTERNAL_PAYMENT_VOUCHER` and writes
   `bl_fi_deposit_register_hdr_gendoc_link`, which carries no amount. The ledger effect of a
   placement is entirely the payment voucher out and the receipt voucher back.
3. **There is no settings UI at all** — three independent proofs (METHOD §29 applied):
   (a) `app.component.ts` sets `readonly hideSettings = true`, and in shared-utilities
   `sidebar.component.html` L98/L108 that flag gates *both* the settings gear and the Personalization
   link; (b) `app.routing.ts` declares no `settings` route (it imports the shared permission and
   personalization containers and routes none of them); (c) `components/settings-container/` exists
   with Field Configuration, Default Settings, Email Template and Printable Format screens declared
   in `AppletSettingsModule` — and **`AppletSettingsModule` is imported by no module**, `app.module.ts`
   included. So the old page's "Configuration & Settings: Default Selection / Application Settings
   (Field Configuration) / Email Template / Printable Format Settings" section described four screens
   that cannot be reached. Open requests `gh:.../deposit-applet#8` and `#9` ask for the gear to be
   added. gates.py does not apply: the `.gitmodules` entry exists but the shared settings screen is
   not routed.
4. **Three `APPLET_SETTINGS` keys are still read at runtime with no control anywhere**: `SORT_ORDER`
   (consumed — sets the listings' `orderBy`), `DISABLE_GEN_DOC_LISTING` (consumed — skips the initial
   requisition search) and `ENABLE_FILTER_BY_TODAYS_TXN` (computes a `dateRange` that is *never read*
   — no observable effect). Every other `appletSettings.*` reference in the repo (the `HIDE_*` line
   and delivery keys, `HIDE_JOB_*`, `DISALLOW_SELL_BELOW_MIN_PRICE`, `ENABLE_MULTIPLE_KO`, …) sits in
   fork components no route or view-column stack reaches.
5. **Rollover: manual only, and always principal + interest.**
   `transactions-listing.component.ts canClickManualRollover` requires FINAL **and** Rollover options
   = `Manual Rollover` **and** Auto Rollover Logic = `YES` **and** not already `ROLLED_OVER`. Choosing
   `Automatic Rollover` gives no rollover at all. `DepositRegisterHdrService.createRollover`
   unconditionally sets the child's principal to the parent's `amount_upon_maturity` —
   `rollover_options` plays no part in the amount — so the old page's "Principal only" vs
   "Principal + Interest" choice does not exist. The child's term is
   `Duration.between(start,end).toDays()` (exclusive), one day shorter than the inclusive
   `end − start + 1` the form shows.
6. **`DepositRolloverProcessor` is not a rollover job.** Queue code `DEPOSIT_ROLLOVER_PROCESSOR`,
   registered in `JobProcessorClassName`, but its own `getDescription()` reads "Create Monthly Opening
   and Closing Rows in bl_fi_deposit_register_txn_line" and it writes one `MONTH_CLOSING` + one
   `MONTH_OPENING` line per run **without setting `hdr_guid`** — orphan rows belonging to no register,
   carrying tenant-wide monthly totals. No scheduled job rolls a deposit over.
7. **The invitee quotation form is an anonymous public endpoint.**
   `DepositReqHdrEntityLinkThymeleafFormController` has no permission check, and
   `DepositRequisitionHdrEntityLinkController` declares `GET /public-ep/{hdrGuid}` and
   `PUT /public-ep` as `AnonymousTenantEndpoint`. The link GUID is the only credential: no token, no
   expiry, no login. The "Submission Deadline" the e-mail prints is always `ZonedDateTime.now()
   .plusDays(7)`, computed at send time, neither stored nor enforced. Both old pages call this a
   "secure, expiring link" — that is wrong and it is a security-relevant wrongness.
8. **The invitation e-mail is hard-coded Java.** `DepositRequisitionEmailService.buildEmailTemplate`
   builds the HTML in a `StringBuilder`; the subject is
   `"Money Market Deposit Placement Invitation - <name>"`; the contact line is the requisition
   creator's `app_login_subject.main_email`. There is no configurable template — and the Email
   Template screen in the repo is part of the dead `AppletSettingsModule` (see 3).
9. **Select Requisition does not link, and drops the Interest Rate.** The picker filters on
   `status = ACTIVE` only (so a DRAFT requisition can be selected — the old page said "all FINAL
   requisitions"). The register's `deposit_requisition_hdr_guid` is initialised `null` in the draft
   state and is written by nothing on this path, so a saved register does not point back at its
   requisition. The `patchValue` list copies 17 fields but **omits `interestRate`**, Currency, Deposit
   Category and Financial Institution — for a FIXED requisition the register's required Interest Rate
   comes across blank.
10. **DELETE is dead on both document screens.** The requisition's `deleteButtonCondition()` returns
    `this.showDeleteButton`, a field initialised `false` and never assigned; its `onDelete()` would
    dispatch the fork's `SalesInvoiceActions.deleteSalesInvoiceInit`, whose effect calls the sales
    invoice service. The register's `deleteCondition()` returns `null` on its first line (the real
    body is unreachable) and `onDelete()` returns immediately. Only MM Deposit Category has a working
    delete (`canDelete` when `status === 'ACTIVE'`; it does *not* check posting status, so a FINAL
    category can be deleted).
11. **Permission granularity on the register side is wrong.** In `DepositRegisterHdrController`, only
    `temp/backoffice-ep` and `create-rollover` ask for `TNT_API_DEPOSIT_CREATE`; the ordinary
    **create, update and delete** endpoints all ask for `TNT_API_DEPOSIT_READ`. Same in the
    transaction-line, attachment, gen-doc-link and category controllers.
    `TNT_API_DEPOSIT_UPDATE` and `TNT_API_DEPOSIT_DELETE` are defined in `AkaunTenantPermissions` and
    used by no deposit controller. The requisition side is correctly granular
    (`API_TNT_DEPOSIT_REQUISITION_HDR_*`).
12. **The backend validates nothing about the business.** Both DCOs check only guid, category FK,
    created/updated subject GUIDs, created/updated dates, status and revision. No amount, date, rate,
    company or GL-code validation; **no FK check at all on the register's `gl_code_guid` or
    `company_guid`**. Every rule the forms appear to enforce is an Angular validator.
13. **Only the requisition has a document number.**
    `DepositRequisitionHdrDataConsistencyObject.fillMissingDataForCreation` runs
    `RunningNumberGeneratorUtil("server_doc_no","DEPOSIT_REQUISITION_NO", …)`. The register's
    equivalent sets only guid, dates, status and revision, so `server_doc_no` stays null — consistent
    with the register listing having no Doc No. column, and with the `// new doc no to be generated
    later` comment in `createRollover` never being honoured.
14. **`+` creates a server row before you type** on all three listings (`createTemp` →
    `status = TEMP` → straight to the Edit screen). The fork's separate Create screen is registered in
    the view-column stack, is navigated to by nothing, and has its Main Details tab commented out.
    `TempDeposit*Processor` ("Delete Temp rows after certain time", configurable `noOfHours`) sweeps
    abandoned rows. Same stub-accumulation shape recorded for Supplier in run 26.
15. **Interest maths is server-side and simple daily accrual**:
    `principal × rate × days ÷ (100 × 365)`, HALF_UP to 2dp, via
    `POST .../deposit-register-hdrs/deposit-calculations/backoffice-ep`. `ONCE` = one interest line at
    maturity; `MULTI` = one per generated payout date, periods measured exclusively with `+1` on the
    last. `FLOATING` uses `interest_rate_effective` (= reference value + delta), `FIXED` uses
    `interest_rate`. Interest Convert to Principal = `YES` adds a `COMPOUND` line per period and makes
    the maturity line `principal + interest − inflation`; `NO` makes it `principal − inflation`.

## Configuration classification (METHOD §29)

`.gitmodules` pins `blg-shared-utilities` at `f1ded0401b9b206694055f919420fc02497f573a` (submodule not
checked out in refs; read with `git show <sha>:<path>` from the refs clone, which was left on `main`).
`app.routing.ts` imports `SidebarComponent`, `FourOhFourComponent`,
`ClientSidePermissionSetContainerComponent`, `PermissionWizardContainerComponent` and
`RolePricingSchemeLinkContainerComponent` from shared-utilities but **routes only** the three deposit
containers and the 404. So the classification is neither *shared* nor *applet-local*: it is
**no settings screen**, and `kb/tools/gates.py` has nothing to score. `bl_applet_client_side_perm_dfn`
joined to `bl_applet_hdr` on `code='depositApplet'`: **0 rows**.

## Defects found (worth a bug report independent of the docs)

- **F-lane4-30-a** `DepositRolloverProcessor` writes `MONTH_CLOSING` / `MONTH_OPENING` lines with no
  `hdr_guid`, so they belong to no deposit and appear on no Transactions tab. Its name and queue code
  also promise something it does not do.
- **F-lane4-30-b** Register create / update / delete are gated by `TNT_API_DEPOSIT_READ` (see 11).
- **F-lane4-30-c** `DepositRequisitionHdrController.createTempBackofficeEp` checks
  `TntErpPermissionsV2.API_TNT_BUDGET_VOTEBOOK_CREATE` — a copy-paste from the vote-book controller.
- **F-lane4-30-d** `app.component.ts` calls
  `getRefreshToken([{ appletCode: sessionStorage.getItem('depositApplet') }])` — it reads the *value*
  of a session key literally named `depositApplet` instead of passing the applet code (every other
  applet reads `sessionStorage.getItem('appletCode')`), so `appletCode` goes up as `null`.
- **F-lane4-30-e** DELETE is unreachable on both the requisition and the register (see 10).
- **F-lane4-30-f** Select Requisition does not copy `interestRate` and never sets
  `deposit_requisition_hdr_guid` (see 9).
- **F-lane4-30-g** `ENABLE_FILTER_BY_TODAYS_TXN` is read in two components; the `dateRange` it
  computes is assigned and never used.
- **F-lane4-30-h** Register Rollover options list is `['Manual Rollover',' Automatic Rollover']` —
  the second value has a leading space, so any equality comparison against `'Automatic Rollover'`
  fails. (Nothing compares it today, which is itself the bug: `Automatic Rollover` does nothing.)
- **F-lane4-30-i** `bl_fi_deposit_register_hdr.interest_earned` is a form field on the register that
  nothing maintains — linking a receipt voucher does not update it.
- **F-lane4-30-j** `createAutomaticTransactions` does not check whether a schedule already exists, so
  a repeated `≠FINAL → FINAL` update through the API appends a second set of lines.
- **F-lane4-30-k** `models/constants/applet-constants.ts` still declares
  `docType = "INTERNAL_SALES_INVOICE"`, `amount_signum = -1`, `quantity_signum = 1`, and
  `printable-format-constants.ts` still points at the sales-invoice printable param code. Dead, but it
  is what a future reader will find first.
- **F-lane4-30-l** The Agreement tab is fully implemented (`agreement/` components, `AddAgreementComponent`
  in the view-column stack at index 6) but its `<mat-tab>` is commented out, so nothing can reach it.

## Screenshots with personal data

Nine of the thirteen images under `static/images/deposit-applet/` are dropped; the page no longer
references them.

- `deposit-requisition-listing.png` — grid rows carry a developer's full name repeatedly in Deposit
  Name / Deposit Code, and one Company cell holds a real consumer-electronics brand.
- `deposit-register-actions.png` — the same listing behind the Select Requisition panel; same name,
  same brand.
- `deposit-register-listing.png` — Deposit Name and Company columns carry two developers' given names.
- `deposit-requisition-invitee-tab.png` — invitee rows carry a developer's full name; the Created by /
  Modified by fields carry a second person's full name.
- `deposit-register-details-1.png` — Company shows a developer's given name; it is also stale (the
  Interest Rate Reference Type shows `KLIBOR`, a value no longer in `INTEREST_RATE_REF_TYPE_LIST`).
- `deposit-register-details-2.png` — Created by / Modified by carry a developer's full name.
- `deposit-category-listing.png` — listing rows and the edit panel both carry a developer's full name.
- `deposit-overview-infographic.png`, `deposit-lifecycle-infographic.png` — AI marketing infographics;
  same decision as Pricebook / Stock Balance / Stock Conversion / Stock Replenishment / Supplier /
  Tax Configuration / Warehouse Management / Workflow Design.

Kept (clean — empty forms and empty grids, no names, no amounts):
`deposit-requisition-details-tab.png`, `deposit-register-transactions-tab.png`,
`deposit-register-payment-tab.png`, `deposit-register-attachment-tab.png`.

Recapture list (clean demo tenant, no real names, no brands): MM Deposit Requisition listing;
Edit Requisition → Details filled in, FIXED; the same form switched to FLOATING showing the four
reference fields; Invitee tab with two or three invitee rows; Edit Invitee showing the three editable
controls against the read-only terms; MM Deposit Register listing; Edit Register → Details with
Rollover options visible; Transactions tab after FINAL showing PLACEMENT / INTEREST / MATURITY /
SUMMARY lines; the Manual Rollover button in its enabled state; Rollover tab showing a two-deposit
chain; MM Deposit Category listing and edit.

## Cross-lane link requests (from this page)

- **`content/en/modules-v2/financial-accounting/_index.md`** (coordinator / whoever owns modules-v2):
  L178–179 list "MM Deposit Applet — money market" and "Deposit Applet — for other deposit instruments
  (security deposits, utilities) … deposit balance and reclaim tracking" as **two different applets**.
  There is one registry row and one repo with three menus; nothing about security deposits, utility
  deposits or reclaim tracking exists anywhere in the code. Collapse to one row pointing at
  `/applets/finance/deposit-applet/`. L261 and L352 also point at `mm-deposit-applet`.
- **`content/en/modules/accounting/_index.md`** L162 — same, links to `/applets/mm-deposit-applet/`.
- **`content/en/applets/finance/internal-payment-voucher-applet.md`** and
  **`content/en/applets/finance/internal-receipt-voucher-applet.md`** (this lane's `finance` folder,
  not yet in the queue): add `deposit-applet` to `related_applets` and one sentence — these two are
  the *only* documents the deposit register's Payment/Receipt tab will link, and they are where the
  journal for a placement actually comes from.
- **`content/en/applets/finance/investment-applet.md`** (in this lane's queue): it already links to
  both deposit pages (L419–420); when it is rewritten, drop the `mm-deposit-applet` link and keep one.
- **`content/en/applets/inventory-workflow/related-applets-stock-balance.md`** (this lane, done run
  19): L160 lists Deposit among applets that "read the item balance on their line screens". The
  deposit applet's item and line-item screens are fork residue that no route or view-column stack
  reaches — remove Deposit from that row on the next pass over the page.
- **`content/en/applets/master-data/workflow-design-applet.md`** (this lane, done run 29): the deposit
  register header carries `process_hdr_guid` / `process_status_guid` columns (copied on rollover) but
  no screen in the applet sets them, and its "Approval Workflow" field is free text. Worth one line if
  that page ever enumerates which documents attach a workflow process.

## Notes for the loop

- `kb/topics/deposit-management.md` created (new slug; nothing referenced it before).
- METHOD candidate §31: **a `hideSettings` input on `<app-layout>` removes the whole settings and
  personalization surface.** Before classifying an applet's settings, grep the applet's
  `app.component.ts` for `hideSettings` — if it is `true`, no gear renders for anyone regardless of
  what `app.routing.ts` or `AppletSettingsModule` contain, and gates.py has nothing to score. This is
  a third outcome alongside METHOD §1's "shared / applet-local / none".
- METHOD candidate §32: **a declared NgModule that nothing imports is dead UI.** Deposit's
  `AppletSettingsModule` declares four settings screens and is imported by no module. Before
  documenting any settings screen found by folder name, check that its module is actually in some
  `imports:` array — folder existence is not the "rendered" proof.
- METHOD candidate §33: **a processor's name can lie; read `getDescription()` and the body.**
  `DepositRolloverProcessor` rolls nothing over.
- `tests/content-lint.sh` passes.

## Page 2 — `integrations/developer-sysadmin-applet.md`

- Registry `developer-sysadmin-applet` "Developer SysAdmin Applet" (ROOT-ADMIN, ACTIVE,
  `documentation_url` = a Confluence page, so no alias was added). **Title changed** from
  "Developer & Sysadmin Applet" to the registry name. Repo
  `blg-applet-core-akaun-platform-developer-sysadmin-applet` at `c7f2b59`. Full rewrite of a
  167-line invented page: cards linking to anchors that did not exist, a "Who Benefits" section, a
  Quick Start for registering a vendor and mapping a category, a "Configuration & Settings" list of
  four things that do not exist (Module Templates, Vendor Whitelisting, Store Taxonomy,
  Personalization by "Applet Version"), and an FAQ answering that deactivating an applet "globally
  suspends its availability in the Applet Store" and that developer-to-vendor mapping is "flexible".
  → 345 lines of reference.

### The finding that matters most

**Most of this applet is unfinished UI with hard-coded sample rows.** Verified component by
component (a grid is "real" only if it injects a service or uses a server-side datasource):

| Screen | State |
| --- | --- |
| Applet listing / create / edit Details | real (`AppletService`, server-side grid) |
| Vendor listing / create / edit Details, Developer, Applets | real (`VendorService`) |
| Modules listing / create / edit + Applets tab | real (`module-applet-hdrs`, `module-applet-links`) |
| Edit Applet → Languages, Images, Module, Catalog, Installations | real |
| **Categories menu (listing, edit, its Applets and Images tabs)** | **placeholder** |
| **Developer menu (listing, edit, its Applets and Vendor tabs)** | **placeholder**, and no create screen exists |
| **Edit Applet → Category, Pricing, Developer, Reviews, Permission Template, Client-Side Permission, Events** | **placeholder** |
| **Vendor → Events; Vendor → Developer → Add** | **placeholder** (`onAdd()` has an empty body) |
| Edit Applet → Review, Retire Applet | commented out: "Hidden until … flow is ready" |

`CategoryEditComponent.onSave()` is the sharpest case: it calls `onReturn()` and then raises the
toast **"Category updated successfully"**. No service is injected and no HTTP call is made. A user
gets a success message for a save that never happened.

**This explains a pattern three earlier runs found independently.** Runs 28 (Warehouse Management),
29 (Workflow Design) and 30 (Deposit) each recorded "no rows in `bl_applet_client_side_perm_dfn`".
The Client-Side Permission tab in this applet — the only screen in the product that looks like it
seeds them — is a mock with one hard-coded row and no service. There is no working UI anywhere that
creates client-side permission definitions. Every "checked in code; not seeded in the registry"
sentence in this wiki (F-0044) traces back here.

### Other verified facts

- **Applet Code is immutable after create.** The create effect sets `bl_applet_hdr.code`; the update
  effect sends name, vendor, store, type, status, description, documentation URL and `property_json`
  and omits `code`. The template renders a second, read-only copy of the field in edit mode.
- **The update path is a read-modify-write with no revision check**: `getByGuidAsSysadmin` → overwrite
  fields from the form → PUT the whole container. Two sessions editing the same applet overwrite each
  other silently.
- **An unauthorised read returns a stripped container, not an error.**
  `AppletController.replaceAppletWithoutPermission` hands back only the applet GUID and icon file
  GUID when `hasPermission` is false, so a permission problem presents as an empty applet.
- **Permission model**: create/update/delete/read each accept any of `MST_APPLET_OWNER`,
  `MST_APPLET_ADMIN`, the matching `MST_API_APPLET_*` code, a platform system OWNER/ADMIN rank, or
  `isUserPlatformAdmin`. Update scopes to `PermissionTarget("bl_applet_hdr", <guid>)`. Vendors use
  the parallel `MST_VENDOR_*` codes.
- **`applet_type` domain** as the form offers it: ROOT-ADMIN, ROOT-USER, TNT-ADMIN, TNT-APPLET,
  TNT-USER, CLI-CLIENT, ETL-CLIENT, WEB-CLIENT, PROGRAM-CLIENT, SDK-CLIENT. Status is ACTIVE /
  INACTIVE only; there is no delete or retire action in the UI at all
  (`MST_API_APPLET_DELETE` exists and is API-only).
- **`property_json.applet_mf_html_tag`** is built as `<{customElTag}XXXXXXXX></{customElTag}XXXXXXXX>`
  — a literal placeholder matching the `sessionStorage.getItem('randomNumber')` suffix each applet's
  own `app.module.ts` uses in `customElements.define`.

### Configuration classification (METHOD §27, §29)

No `.gitmodules`; the repo **vendors** `micro-fe/projects/shared-utilities`, so gates.py cannot run
and shared-utilities fixes never reach it. `app.routing.ts` routes the applet's **local**
`FieldConfigurationComponent` and `DefaultSettingsComponent`, both of which are the familiar dead
stubs (eight unbound toggles with a handler-less SAVE; branch/location writes into an
`appletContainer` that is never assigned, with an `@Output() save` the container does not bind).
The vendored `WebhookComponent` behind Settings → Integration → **Triggers** is a design mock —
ten literal "Sample Event #n" values, three sample detail rows, and an `ngOnInit` copy-pasted from
Default Selection. `settings/feature-visibility` and `settings/team-permission-listing` are routed
with no menu entry, and `settings` with no child redirects to feature-visibility.
**No `APPLET_SETTINGS` key is read anywhere in the applet.** `bl_applet_client_side_perm_dfn`: 0 rows.

### Defects found

- **F-lane4-30-m** `CategoryEditComponent.onSave()` toasts success and persists nothing.
- **F-lane4-30-n** Category and Developer listings, and seven Edit Applet tabs, ship hard-coded
  sample rows to production. Several of those rows contain a developer's real name and work e-mail
  address in the source (not reproduced here).
- **F-lane4-30-o** `VendorDeveloperAddComponent.onAdd()` and `disableAdd()` have empty bodies over an
  empty grid.
- **F-lane4-30-p** `models/permission-constants.ts` hard-codes a `TENANT_CODE` enum value naming an
  individual — should be removed or made configurable.
- **F-lane4-30-q** "Search Filer" (for "Search Filter") on both the Category and Module create forms.
- **F-lane4-30-r** The applet still uses the `-old` shared listing components
  (`app-pagination-old`, `app-advanced-search-old`, `app-grid-toggle-old`, `app-column-toggle-old`)
  that the rest of the estate has moved off; the closed Angular-14 migration issue (#1) did not
  cover them, and the vendored shared-utilities copy is why the newer ones never arrived.

### Screenshots

None exist — `static/images/` has no `developer-sysadmin*` directory and the old page referenced no
images (its own callout said screenshots would "be added soon"). Recapture list (platform demo
environment, no real names or e-mail addresses): Applet listing; Create Applet Details; Edit Applet
tab strip; Edit Applet → Module; Edit Applet → Catalog; Edit Applet → Installations; Vendor listing;
Edit Vendor tab strip; Modules listing; Edit Module → Applets; the Settings menu showing the three
groups.

### Cross-lane link requests (from this page)

- **`content/en/applets/finance/budgetary-applet.md`** (this lane's `finance` folder, not yet in the
  queue): it states three times that job-processor subscriptions are configured in the Developer
  SysAdmin Applet, including a Configuration row citing "applet trigger templates and tenant trigger
  configuration". **No job-processor, trigger-template or subscription screen exists in this applet**
  — its five menus are Applet, Vendor, Categories, Modules, Developer, and the only trigger-shaped
  screen is the sample-data Triggers stub. That claim needs re-sourcing before the page is trusted;
  the likely home is `PlatformSysAdmin` "Platform SysAdmin"
  (`blg-applet-core-akaun-platform-sysadmin-applet`), which has not been read.
- **`content/en/applets/external-tenant-admin/tenant-admin-applet.md`** (lane 3, done): it says this
  applet "creates the tenant, its first OWNER, the applet store and the applet registry". Only the
  last is true here — there is no tenant-creation screen, and the applet's `TenantService` merely
  reads `sessionStorage.tenantCode`. Soften to "registers the applet (`bl_applet_hdr`) that the
  Catalogue and Applets menus read".
- **Every applet page that says a `SHOW_*` client-side permission is "checked in code but not seeded
  in the registry"** (F-0044): the reason is now known and citable — there is no working screen that
  seeds `bl_applet_client_side_perm_dfn`. Worth one shared sentence rather than repeating the
  observation per page.
- **`content/en/applets/applet-store.md`** / **`applet-catalog.md`** / **`applet-directory.md`**: add
  `developer-sysadmin-applet` to `related_applets`; the store record they describe is written here,
  but store **pricing** and **categories** are not maintainable from this applet today.

### Notes for the loop

- `kb/topics/applet-registry.md` created (new slug).
- METHOD candidate §35: **a finished-looking grid is not a working grid.** Before documenting a
  listing or a tab, check that the component injects a service or binds a server-side datasource; a
  `rowData = [ { … } ]` literal with plausible sample values is the tell. This applet ships seven such
  tabs and two whole menus. The same test found the Deposit applet's dead settings folder.
- METHOD candidate §36: **when several applets report the same absence, look for the missing console.**
  Three runs recorded "no client-side permission rows" before this run found that the screen which
  would create them is a mock.

## Page 3 — `finance/e-mandate-applet.md`: SKIPPED (registry / naming mismatch)

**There is no registry row for an E-Mandate applet.** Checked both sources on 2026-09-06:

- `planning/private/registry-applets-2026-09-05.tsv` — no row whose code or name contains
  `mandate`, `e-mandate`, `ddebit`, `direct debit` or `fpx`.
- Live `bl_applet_hdr` in `akaun_master` (236 rows, the same count as the TSV) — same query over
  `code`, `name` **and** `property_json::text`: nothing. Also no row containing `collect`, so the
  "Collection Applet" the page names downstream does not exist either.

The applet itself is real and recent: `blg-applet-core-akaun-platform-e-mandate-applet`, last commit
`3bf0ec0` (2026-08-12), `micro-fe/projects/akaun-platform/applets/e-mandate-applet`. Its
`app.routing.ts` sets `mainPath = 'eMandate'` and its `app.component.ts` sets
`appletName = 'E-Mandate Applet'`. Three menus — **E-Mandate Create**, **E-Mandate Update**,
**E-Mandate Terminate** — plus the standard settings and personalization sub-trees. The only
domain-specific backend call in the applet is `PgwFpxFormService` from `blg-akaun-ts-lib`, used by
the company effects; nothing in `blg-akaun-platform-java/akaun-api` matches `PgwFpxForm` or
`pgw_fpx`, so the FPX form service is served from somewhere outside that repository.

So: **built, not registered**. Per ADR-0002 and standard rule 1 the page was not rewritten. The
existing 197-line page describes required permissions ("Mandate Creator", "Mandate Admin"), field
settings and a downstream Collection Applet — none of which was verified, and the registry says the
applet cannot be installed by any tenant today.

**For Vincent / the coordinator:** this is a different case from the F-0050 duplicates. The question
is not which of two pages wins, it is whether an unregistered applet should have a published page at
all. Options: (a) register `eMandate` in `bl_applet_hdr` and then document it; (b) keep the page and
mark it clearly as not yet available; (c) unpublish it until the registry row exists. Recommend (a)
or (c). The same question will recur — worth an ADR rather than a per-page decision.

## Page 4 — `crm/engagement-applet.md`

- Registry `engagementApplet` "Engagement Applet" (TNT-ADMIN, ACTIVE, no `documentation_url`). Title
  unchanged. Repo `blg-applet-wavelet-engagement-applet` at `a6c58d6`. Full rewrite of a 279-line
  marketing page (Who Benefits, "The Manual Spreadsheet Risk", Quick Start, an FAQ) into a 329-line
  reference.

### The useful contrast: a working applet-local field configuration

This is the first applet in the lane whose **local** `FieldConfigurationComponent` is real. The
submodule is present, `app.routing.ts` routes the local screen (METHOD §29), and unlike the unbound
eight-toggle stub found in Tax Configuration, Merchant Admin, Shipping Pricebook, Supplier and
Deposit, this one has 21 reactive `FormControl`s, patches them from
`SessionSelectors.selectMasterSettings` on load, and saves through
`SessionActions.saveMasterSettingsInit`. Declared + rendered + persisted for all 21; **consumed for
19**. Use it as the counter-example when explaining why the others are stubs — the stub is a copied
placeholder, not a platform limitation.

Two dead keys: `HIDE_MANAGING_PARTNER` (in `applet-settings.model.ts` only, gates nothing) and
`ENABLE_AUDIT_TRAIL` (nowhere else in the applet at all, not even in the model — and the
`settings/applet-log` route it presumably belongs to is not gated on it and has no menu entry).

### The finding that changes how the applet is described

**Engagement Code and Engagement Name are `readonly` in the template, carry `Validators.required`,
and nothing in the applet writes them.** The composing helper `updateName` (joining
*customer – code – company – branch* with " - ") is defined and **every call site is commented out**.
Selecting a customer sets only `customer_entity_hdr_guid` and the entity record. The backend's
`fillMissingDataForCreation` sets guid, dates, status, revision and the created/updated-by names —
not code, not name, not `running_no`.

So an engagement cannot be created end-to-end in the UI: **+** POSTs an empty header (created
`ACTIVE`, no TEMP, no sweeper), and SAVE is then permanently disabled because code and name can never
be filled. The route that works is `EngagementHdrController`'s `/etl-ep` create/update/delete/read,
gated by the **same** `TNT_AAT_ENGAGEMENT_HDR_*` permissions as the back-office endpoints. The
quarantined screenshots confirm it: live rows carry codes and names in exactly the shape `updateName`
produces, so the data was loaded, not typed.

### Other verified facts

- **The DCO validates far more on update than on create.** Create: guid, approval-setting FK if set,
  code not already taken, dates, subject GUIDs, status, revision. Update adds `comp_guid`,
  `branch_guid`, `customer_entity_hdr_guid` and `billing_entity_hdr_guid` FK checks, `running_no` not
  blank, `code` not blank **and** unique, `engagement_status` not blank. A row imported with stale
  GUIDs passes creation and fails on the first edit — that is the troubleshooting row to keep.
- `fillMissingDataForUpdate` auto-assigns `running_no` from `app_sequence_counter` (module name
  `ENGAGEMENT_NO`, keyed by tenant code) and refreshes the denormalised `created_by_name` /
  `updated_by_name` from `app_login_subject` on every update.
- **The Main form has no `category` control**, yet the draft-mirroring code assigns
  `engagement_category = form.category`, which is always `undefined`. That is why the listing's
  Engagement Category column is empty on every row in the (quarantined) captures.
- **Status is a free-text input** — the fixed-list `mat-select` is commented out — and the backend
  only checks it is not blank.
- **Hiding a required field does not relax its validator.** `HIDE_CUSTOMER_NAME`,
  `HIDE_ENGAGEMENT_CODE`, `HIDE_ENGAGEMENT_NAME` and `HIDE_JOB_GROUP` remove the control while
  `Validators.required` stays, so SAVE greys out with no visible cause. This is a general shape worth
  checking on every applet with `HIDE_*` settings over required fields.
- Commented out of the template: the **Employees** tab (the perpetual-tracking counterpart of Fiscal
  Year End — so a perpetual engagement has no staffing tab at all), **Memorandum of Fees**,
  **Claims**, **Issue Link**, and the **DELETE** button. Deletion is API-only.
- The settings menu offers only Application Settings and Engagement Category. Default Selection is
  commented out of `settingItems`; `personalizationItems` is an empty array, so the whole
  personalization sub-tree is routed with no way in; `settings/applet-log` (audit trail listing +
  viewer) is routed with no menu entry.
- Engagement roles: Engagement Manager, Engagement Director, Engagement Partner, Managing Partner,
  EQCR, Key Audit Partner — each with a Non-Applicable tick stored in the header's
  `non_applicable_setting_json`. A fiscal-year-end record has its own role block and its own employee
  list carrying an **Approval Level** per employee.

### Screenshots — all five dropped

Every product capture under `static/images/engagement-applet/` shows a live tenant's **real client
company names** in the Engagement Code, Engagement Name and Entity Name columns — a dozen or more
identifiable Malaysian companies across the four screens, plus the tenant user's photograph in the
avatar. These are exactly the "real names / a database row" case the citation rule forbids.

- `engagement-listing.png`, `edit-engagement-main.png`, `fiscal-year-end-tab.png`, `gen-doc-tab.png`
  — real client names throughout.
- `create-engagement-form.png` — unreferenced by the old page; not audited, quarantine with the rest.
- `engagement-applet-overview.png` — AI marketing infographic; same decision as the other nine.

The page now publishes no images and says so in a callout. Recapture list (demo tenant, synthetic
client names): Engagement Listing; Edit Engagement → Main with the roles block; the same with FYE
Type = Yearly showing the Fiscal Year End tab; a fiscal-year-end record with its employee list;
Gen Doc tab with a linked document; Settings → Application Settings, both tabs; Settings →
Engagement Category listing and edit.

### Cross-lane link requests (from this page)

- **`content/en/applets/master-data/employee-applet.md`** (this lane, done): add one line that
  engagement **Approval Level** is set per engagement year on the fiscal-year-end employee link, not
  on the employee record, and add `engagement-applet` to `related_applets`.
- **`content/en/applets/master-data/customer-maintenance-applet.md`** and
  **`.../entity-applet.md`** (this lane, done): add `engagement-applet` to `related_applets` — the
  engagement is FK-checked against `bl_fi_mst_entity_hdr` for both the customer and the billing
  entity on every update.
- **Anything documenting the AAT claims flow** (`bl_aat_claim_*`, Memorandum of Fees): do not route
  the reader through the Engagement applet. Those tabs are commented out; the claims module is real
  but its entry point is elsewhere.

### Notes for the loop

- `kb/topics/engagement.md` created (new slug).
- METHOD candidate §37: **a `HIDE_*` setting over a `Validators.required` control disables SAVE with
  no visible cause.** Removing the control from the template does not remove the validator. Check
  every documented `HIDE_*` against the required list and say so where they overlap.
- METHOD candidate §38: **when a required field is `readonly` and no writer exists, look for the ETL
  endpoint.** Engagement Code and Name have no writer in the UI; `/etl-ep` create/update/delete sit
  beside `/backoffice-ep` on the same controller with the same permissions. That is how the data
  actually arrives, and the page has to say so or the reader will conclude the applet is broken.

## Page 5 — `crm/events-management-applet.md`

- Registry `eventManagementApplet` "Event Management Applet" (TNT-USER, ACTIVE,
  `documentation_url` = Confluence). **Title changed** from "Events Management Applet" to the registry
  name; the file name and URL are unchanged, and all ten inbound links already use
  `/applets/crm/events-management-applet/`, so **no alias was added**. Repo
  `blg-applet-wavelet-events-management-applet` at `ccbfcbb`. Full rewrite of a 205-line marketing
  page ("The Golden Triangle of Event Management", role-based quick starts) into 297 lines.

### The finding that matters most

**The Expenses tab and the Event Expense Report are reads against the claims module, not an expense
store of their own.** Both call
`POST .../erp/audit-assurance-tax/claim/reports/event-expenses-reports/...` — a multi-event variant
and `single-event/{calendar_event_hdr_guid}`, each with a `/statistics` sibling — and
`ClaimReportController` gates them on `TNT_AAT_CLAIM_REPORT_OWNER` / `_ADMIN` / `_CREATE`. The
`TNT_API_CMS_CALENDAR_*` family that covers everything else in the applet does **not** open them, and
the read sits behind a `_CREATE` code because the endpoints are POSTs. A cost reaches an event
because `bl_aat_claim_document_line.calendar_event_hdr_guid` FKs to `bl_cms_calendar_event_hdr`;
nothing in this applet tags a claim line.

The old page's "Every invoice, receipt, and claim is tied directly to the Event Record" is therefore
half true and misleadingly framed — there are no invoices or receipts here, only claim lines, and
they are tagged elsewhere.

### Other verified facts

- **Nothing notifies anyone.** `bl_cms_calendar_event_notification_queue` has a table, a DCO
  (`CmsCalendarEventLinkQueueDataConsistencyObject`) and a controller, and **no job processor under
  `akaun-api/.../jobProcessor/` reads it**. Creating or changing an event sends no e-mail, SMS or
  webhook. Same shape as the Workflow Design finding in run 29.
- Applet-local `FieldConfigurationComponent`, routed in preference to the shared screen although the
  submodule is present (METHOD §29). Nine keys declared + rendered + persisted, **seven consumed**.
  Dead: `ENABLE_AUDIT_TRAIL` (read nowhere; `settings/applet-log` is not gated on it — the second
  applet in a row with exactly this dead key, after Engagement) and `HIDE_DEFAULT_SELECT_CALENDAR`
  (hides only its own drop-down on the settings screen; `selectedCalendar` keeps being applied).
- `HIDE_CALENDAR_LISTING_MENU` is enforced by `app.component.ts` filtering the item out of
  `menuItems`; the route still resolves if typed. A menu hide, not an access control.
- The **Agenda** tab is an attachment list over `bl_cms_event_attachment` (File Name, Size, Uploaded
  Date, Uploaded By) — not a structured agenda.
- Event Type is a two-value `PRIVATE` / `PUBLIC` list that gates nothing found; there is no
  per-calendar privacy model behind it, which contradicts the old page's "Granular Privacy — Calendar
  level permissions ensure only the Marketing team sees the Marketing calendar". Calendar membership
  (`bl_cms_calendar_member_hdr`) exists, but the settings entry that manages it is called
  *Events Calendar Permission* while being a membership list.
- Only Event Name, Company (`maxLength 255`) and Start Date carry validators. No cross-field date
  check on either side, so End Date can precede Start Date.
- Routed with no menu entry: `settings/webhook`, `settings/feature-visibility`,
  `settings/applet-log` (audit trail listing + viewer) and the permission wizard / set / user / team /
  role listings. `settings` with no child redirects to `feature-visibility`.
- **Repo trap:** the repository carries two scaffold projects — `akaun-platform/testApplet` and
  `akaun-platform/example-applet`, both routed at `applets/akaun/dev/example-applet` — alongside the
  real `wavelet-erp/applets/events-management-applet`. A naive `find -name app.routing.ts` hits the
  scaffolds first. Worth remembering for the rest of the queue.

### Screenshots

Only one image existed, `events-management-infographic.jpg`, an AI marketing infographic — dropped,
same decision as the other ten this lane has removed. **No product screenshots exist for this
applet.** Recapture list: Event Calender (month view with a few events); Event Listing; Event Edit →
Details; Event Edit → Company Linking; Event Edit → Events Participant; Event Edit → Expenses with
rows; Calendar Listing; Calendar Edit → Members; Settings → Field Settings, all three tabs; Event
Expense Report with the statistics panel.

### Cross-lane link requests (from this page)

- **`content/en/modules-v2/crm-digital/_index.md`** (L19, L30, L54),
  **`.../crm-digital/configuration/_index.md`** (L46),
  **`.../crm-digital/related-applets/_index.md`** (L14) and
  **`.../crm-digital/reports/_index.md`** (L19): all describe this applet as an *"event landing page
  builder, ticketing, QR check-in scanning, post-event surveys, registration pages"* with an
  *"Event Attendance & Conversion Summary"* report giving *"total registrations, ticket sales
  revenue, QR check-in count, no-show rate %"*. **None of that exists.** The applet has four screens —
  a calendar view, an event listing, a calendar listing and a claim-based expense report — and no
  public page, no ticket, no QR code, no survey and no attendance report. Six lines across four pages
  need correcting; not in this lane's folders.
- **`content/en/applets/ecommerce/cp-commerce-admin-applet.md`** L815 promises *"a dedicated events
  workflow with expenses, guest management, and advanced scheduling"* here. Expenses is a read-only
  claim report, guest management is a participant list of name and e-mail, and scheduling is a
  calendar view. Soften. (`events-management-applet` is already in its `related_applets`; the reverse
  link has now been added from this side.)
- **Whichever page documents the AAT claims applet**: it should own the explanation of
  `bl_aat_claim_document_line.calendar_event_hdr_guid` — both the Events and the Engagement applet
  read the claim reports without writing claims.

### Notes for the loop

- `kb/topics/event-management.md` created (new slug).
- METHOD candidate §39: **a report screen inside applet A can be gated by applet B's permissions.**
  The Events applet's two expense screens need `TNT_AAT_CLAIM_REPORT_*`, not the calendar family, so
  a user with full rights over events sees nothing. Check the permission constant on every report
  endpoint an applet calls, not just its own CRUD controllers.
- METHOD candidate §40: **`ENABLE_AUDIT_TRAIL` is a recurring dead key.** Engagement and Events both
  render and persist it and neither reads it, and in both applets the `settings/applet-log` route it
  presumably belongs to is ungated and unlinked. Expect it in the rest of this family.

---

# Run 31 — 2026-09-06 — Fixed Asset (adopted page 6)

## Page completed

- `content/en/applets/finance/fixed-asset-applet.md` — registry `FixedAssetRegisterApplet` "Fixed
  Asset" (TNT-USER, ACTIVE). Title changed from "Fixed Asset Applet" to the registry name.
  `documentation_url` is Confluence, so no alias was added; all six inbound links in `content/en/`
  already use `/applets/finance/fixed-asset-applet/`. Full rewrite: 591 lines of guide-voice
  marketing ("Who Benefits from This Applet?", "What Problems Does This Solve?", a Quick Start, an
  FAQ, invented settings screens) → 599 lines of reference derived from the applet at `6b8abe0d`,
  blg-shared-utilities at the pinned `04bb553` and at HEAD `a8c38a2`, blg-akaun-ts-lib at
  `7d1616a9e`, and the Java backend at `1ff620ef0e`.

## Configuration classification (METHOD §1, §29, §32)

**Applet-local, and genuinely wired — but only half of it works.** `app.routing.ts` imports the
applet's own `FieldConfigurationComponent` and `DefaultSettingsComponent` from
`components/settings-container/`, not the shared one, and — unlike the Deposit applet in run 30 —
`AppletSettingsModule` **is** in `AppModule.imports`, and there is no `hideSettings`. So the screens
render. `.gitmodules` does point at blg-shared-utilities (pinned `04bb5539`), which is why METHOD
§29 applies: the submodule is present and the applet still defines its own settings screens.

| Screen | Verdict |
|---|---|
| Settings → Field Settings | The unbound eight-toggle stub. Empty component class (no form, no store, no save handler); eight `mat-slide-toggle` elements with no `formControlName` and no `[(ngModel)]`; SAVE with no `(click)`. Same artefact as Tax Configuration, Merchant Admin, Shipping Pricebook, Supplier. Its eight labels (Unit Discount, SST/VAT/GST, WHT, Blanket Order, Segment, G/L Dimension, Profit Center, Project) correspond to nothing in the fixed-asset form — it is a copy-paste from a document applet. |
| Settings → Default Selection | Real. Dispatches `saveMasterSettingsInit` with `DEFAULT_BRANCH`, `DEFAULT_LOCATION`, `DEFAULT_COMPANY` (no control; patched when a branch is picked) and `ASSET_REGISTER_DETAILS_TAB_ORDER`. |
| Personalization → Default Selection | Broken. `appletContainer` is never assigned (the subscription that would assign it is commented out), so both value-change handlers dereference `undefined`; SAVE emits `undefined`. |
| Personalization → Field Settings | The menu entry points at `field-settings`, which is not a child of the `personalization` route. Lands on the applet's 404. |
| Settings → Feature Visibility | Shared-utilities stub; SAVE has no `(click)`. Not in any menu, but it is the default redirect for `settings`, so it is the first thing you see. |

Four-proof result: `ASSET_REGISTER_DETAILS_TAB_ORDER` is the only key that is declared + rendered +
persisted + **consumed** (`edit-asset-register.component.ts` L94-97 orders the six tabs from it).
`DEFAULT_BRANCH` / `DEFAULT_LOCATION` / `DEFAULT_COMPANY` are declared, rendered (the first two),
persisted, and read by nothing — a plain grep of the whole `src/` tree finds no reader outside the
settings screens themselves. Everything else in `models/applet-settings.model.ts` (six `INCLUDE_*`,
eight `ENABLE_*`, `PRINTABLE`, and fifty `*_CUSTOM_STATUS_*` keys) is **model-only**: zero hits
anywhere else in the repo. No inline `app-applet-settings-toggle` gear anywhere (METHOD §8 checked,
zero hits).

## The finding that matters most

**The monthly depreciation run creates a journal with no lines.**

`FixedAssetDepreciationProcessor.createJournal` builds a debit line (GL `fi_depr_glcode_guid`) and a
credit line (GL `fi_acc_depr_glcode_guid`) and then adds each one to the journal only through

```java
Optional.ofNullable(line.getSub_ledger_guid()).ifPresent(p -> lines.add(line));
```

where the subledger comes from `bl_fi_fixed_asset_register_hdr.fi_depr_subledger_guid` and
`.fi_acc_depr_subledger_guid`. A grep of the entire Java tree for those two columns finds them
**read** (the processor, `FixedAssetDepreciationRunLineService`), **filtered** (two UoW query
builders), and **FK-checked** (the category-depreciation-config DCO) — and set nowhere. The applet
does not send them either: the Configuration tab writes only the two GL codes, onto both the config
row and the header (`edit-asset-register.component.ts` L262-263, L272-273). The only subledger the
applet or backend ever populates on an asset is `sub_ledger_guid` — the *asset* GL's subledger — and
only on the purchase-invoice conversion path.

Both lines are therefore dropped and the header is created with `amt_debit = 0`, `amt_credit = 0`
and zero lines. `JournalDataConsistencyObject` has no "at least one line" check and no
debit = credit check, so it is accepted silently and `posting_status` is set to `POSTED`.

The contrast is what makes it a bug rather than a design: the Transactions tab and the Other Journal
tab both send lines with a **null** `sub_ledger_guid`, and `JournalService.createJournal` (L47-70)
resolves the subledger from the line's GL code and company, creating one if none exists. The
depreciation path filters the lines out before that code can ever run.

Second-order effect where the columns *are* populated (by direct API call): `createJournal` groups
the final lines by `sub_ledger_guid` and sums debits and credits into the first line it saw, keeping
that line's GL code. Point both depreciation GL codes at the same subledger and you get one line
carrying both amounts on the expense GL code.

## Other verified facts worth keeping

- **The run ignores its own company and branch, and stops at 100 assets.**
  `FixedAssetDepreciationRunLineService.createDepreciationLine` sets only `schedule_date_month` and
  `schedule_date_year` on `FixedAssetRegisterQueryCriteria`; `guid_company`, `guid_branch` and
  `guid_location` stay null, and the SQL treats null as "no filter". It also never touches
  `criteria.setLimit`, so `BaseQueryCriteria`'s default of **100** applies, with `ORDER BY hdr.guid`.
  A run picks up at most 100 assets across every company in the tenant, ordered by random UUID, and
  stamps the run header's company and branch onto each journal.
- **The stop condition reads backwards.** `if (newAccDepreciation.compareTo(residual_value) <= 0)`
  → depreciate. With the usual residual value of 0 any positive amount makes it false on the first
  run, and the `else` branch sets the asset to `DEPRECIATED` and calls `deletePermanent` on every
  run line for that asset dated on or after the month, plus `JournalService.deletePermanentJournal`
  on their journals.
- **Re-running a month is destructive by design.** Before rebuilding, `createDepreciationLine`
  permanently deletes the run's existing lines and their journals.
- **`ACTUAL_DAY` averaging only implements straight line.**
  `calculateMonthlyDepreciationAveragingActualDays` has a single `if ("STRAIGHT_LINE".equals(...))`
  branch and returns `BigDecimal.ZERO` for both declining-balance methods.
- **`depr_rate` is a bare monthly multiplier.** `bookValue.multiply(depr_rate)` (doubled for
  DOUBLE_DECLINING_BALANCE) — no ÷12, no ÷100 — against a field labelled "Depreciation Rate (%)".
  Straight line divides by `useful_life × 12`, so useful life is in years.
- **Eligibility is a three-way inner join.** asset header × `bl_fi_fixed_asset_register_depreciation_config`
  × `bl_fi_fixed_asset_depreciation_schedule` for that exact month/year. The report SQL
  (`FixedAssetRegisterUow.getReport`) inner-joins the same two tables. An asset without both is
  invisible to the run *and* to the report — and schedule rows are added one month at a time from a
  month picker, with no bulk-generate action anywhere.
- **The purchase-invoice conversion endpoint is anonymous.**
  `GET fa/fixed-asset-registers/purchase/{genericDocGuid}` is an `EndpointMethod.AnonymousTenantEndpoint`
  with no permission check; the `genDocContainer.map(...)` result is discarded and it returns `OK`
  regardless. It converts lines where `item_txn_type = FIXED_ASSET_REGISTER` **and**
  `server_doc_type = INTERNAL_PURCHASE_INVOICE` into DRAFT assets, one per line (not per unit), with
  `purchase_price = amount_txn ÷ quantity_base`, and stamps `posting_fixed_asset = POSTED` on the
  document as the re-entry guard.
- **Auto-created GL code (METHOD §20).** That conversion creates a GL code named "Fixed Asset
  Register" plus the company `FIXED_ASSET_REGISTER` link and the subledger when the link is missing,
  rather than throwing `MISSING_DEFAULT_GL_CODE`.
- **The automatic path is opt-in per tenant.** `FixedAssetRegisterItemTypeJobProcessor`
  (`FIXED_ASSET_REGISTER_ITEM_TYPE`, `ObjType.SECONDARY`) only fires where
  `bl_applet_trigger_template_processor_link` in the master DB makes it a subscriber of the
  generic-document publisher AND the tenant holds an enabled `bl_applet_trigger_config` row
  (`JobProcessorService.getLinkedTriggerTmplAndSubscriberJobProcessor`). Its private
  `createFixedAssetHdr` method is dead code — nothing calls it.
- **Asset transactions are browser-assembled journals.** Acquisition / Adjustment / Disposal /
  Asset Held for Sale build `bl_fi_jrnl_line` objects client-side, sum them, and refuse to send when
  debits ≠ credits with a toast ("Journal Transaction is not balanced"). That is a client confirm,
  not a backend rejection.
- **Negative Adjustment posts an undefined GL code.** `let debit, credit, glcodeDebit, glcodeCredit,
  glcode;` — `glcode` is never assigned, and the `debit < 0` branch does `glcodeCredit = glcode`.
  The line goes out with no GL code and the journal validator rejects it.
- **Disposal ignores accumulated depreciation.** It debits the asset GL at the acquisition amount
  and credits the disposal price, then a gain/loss line. There is no accumulated-depreciation
  reversal anywhere in the transaction code.
- **Create-form placeholders exist because the backend rejects nulls.**
  `FixedAssetRegisterHdrDataConsistencyObject` throws on null purchase date, purchase price,
  depreciation method, depreciation start, averaging method, rate and useful life, so
  `create-asset.component.ts` sends `purchase_date = new Date()`, `purchase_price = 0`,
  `depr_method = "DRAFT"`, `depr_ave_method = "DRAFT"`, `depr_rate = 0`, `useful_life = 0`.
  `"DRAFT"` matches no branch in the processor.
- **Asset Code is `Math.random().toString(36)`**, upper-cased — not a document-numbering series —
  and the duplicate check runs in the browser against the currently loaded listing page only.
- **Description has no input control** on either the create or the edit form: an empty
  `<div formControlName="descr">` and nothing else. The value is still copied into the request.
- **GL Code is required on edit but not on create**, though both label the drop-down `GL Code*`.
- **Promotion to REGISTERED is a client-side gate**: Save is enabled for `DRAFT` when Details is
  valid, and for `REGISTERED` only when Details is valid AND the depreciation config is valid AND at
  least one Transactions row exists. Save then fires two independent, unsequenced HTTP calls (header
  PUT, config POST or PUT) with no error handling.
- **CSV import**: 15 columns, none of them depreciation. Employees are matched by entity **name**,
  GL codes by `gl_code_1`, and the ledger by literal `code = 'PRIMARY'` — every other path in the
  codebase looks the ledger up by `obj_type = 'PRM'`. It creates a subledger for the resolved GL
  code when none exists. Imported assets have no config and no schedule, so they never appear in a
  run or in the report.
- **Permissions** are entirely server-side: `FixedAssetPermissions` (`API_TNT_DM_FA_CATEGORY_*`,
  `_CONFIG_*`, `_HEADER_*`, `_SCHEDULE_*`, `_ATTACHMENT_*`, `_CATEGORY_DEPRECIATION_CONFIG_*`) plus
  `AkaunTenantPermissionsV2` (`API_TNT_DM_FA_REGISTER_*`, `_DEPRECIATION_RUN_HDR_*`,
  `_DEPRECIATION_RUN_LINE_*`) and `TntErpPermissions.API_TNT_DM_ERP_FIXED_ASSET_IMPORT_FILE_HDR_READ`.
  No `SHOW_*`/`HIDE_*` constants and no client-side rows. The **RUN** button needs
  `API_TNT_DM_FA_DEPRECIATION_RUN_LINE_CREATE`, not `UPDATE` — an easy misconfiguration.
- **The settings menu is partly unroutable.** The shared shell at the pinned `04bb553` renders
  Permission Wizard, Release Notes and Applet Log; this applet routes none of them, so all three hit
  the applet's `404`. Conversely `feature-visibility`, `webhook` and `team-permission-listing` are
  routed with no menu link. At shared-utilities HEAD (`a8c38a2`) Applet Log is dropped as well.
- **The RUN button is three clicks deep and not where you would look**: Depreciation Run → open a
  run → Lines tab → `+` → the Registered Assets listing. There is no RUN on the run header.

## Defects found (worth a bug report independent of the docs)

1. Depreciation journals are always empty — nothing writes `fi_depr_subledger_guid` /
   `fi_acc_depr_subledger_guid` and the processor filters on them. **Highest severity on this page.**
2. `createDepreciationLine` leaks across companies and caps at 100 assets.
3. The stop condition `accumulated <= residual` inverts the intended "stop at residual value" rule
   and destroys later schedule lines and their journals as a side effect.
4. `ACTUAL_DAY` averaging silently returns zero for both declining-balance methods.
5. `depr_rate` applied as a bare monthly multiplier against a field labelled "(%)".
6. `fa/fixed-asset-registers/purchase/{guid}` is an unauthenticated write endpoint.
7. Negative Adjustment sends a journal line with an unassigned GL code variable.
8. Disposal does not reverse accumulated depreciation.
9. `<div formControlName="descr">` — a `formControlName` on an element with no value accessor;
   Description is unfillable on both forms and this is a probable console error.
10. Personalization → Default Selection throws on first interaction (`appletContainer` never
    assigned) and saves nothing; Personalization → Field Settings 404s.
11. Field Settings and Feature Visibility both render a SAVE button with no handler.
12. The CSV import resolves the ledger by `code = 'PRIMARY'` while everything else uses
    `obj_type = 'PRM'`.
13. Asset Code auto-generation is `Math.random()` with a browser-local uniqueness check.
14. Edit Save fires two unsequenced writes; a failed config write leaves the header updated.

## Screenshots

Sixteen files exist under `static/images/fixed-asset-applet/`. Every one was opened and looked at.

**Kept (10)** — staging/testing tenants, synthetic data, empty grids or generic forms:
`asset_register_create.png`, `asset_register_edit.png`, `asset_category_listing.png`,
`depreciation_run_listing.png`, `file_import_screen.png`, `reports_screen.png`, `transactions-tab.png`,
`depreciation-tab-schedule.png`, `attachment-tab.png`, `other-journal-tab.png`.

**Dropped from the page (references removed; files to quarantine, 6):**

- `depreciation-tab-configuration.png` — a listing row reads `FAHAD ASSEST` / `FAHAD ASSEST`, a
  developer's first name (the same first name appears in the internal task tracker), alongside
  "Amz Company" and "B Company". A real person's name in a grid.
- `related-doc-tab.png` — ten rows of `INTERNAL_SALES_INVOICE` / `INTERNAL_RECEIPT_VOUCHER` against
  a company named **JP ZenCare**, with real document numbers and 2026 dates, and a pager reading
  "page 1 of 854". A real customer/company name across a grid of real document rows.
- `asset_register_listing.png` — the Location column shows `L-IDA-CONSIGNMENT GRACE`, which reads as
  a person's name; also duplicated exactly by `side_menu.png`.
- `side_menu.png` — byte-for-byte the same screen as `asset_register_listing.png`, same problem, and
  redundant: the sidebar is visible in every kept capture.
- `settings_page.png` — **not** a privacy drop. It shows a settings menu with four groups (Client
  Side Permissions → Applet Access / Role Pricing Scheme Linking, Integration → Triggers, Developer
  Tools → Reset Applet State) that are commented out in `blg-shared-utilities` at the commit this
  applet pins, so the image documents a menu that no longer renders. The old page's entire
  "Configuration & Settings" section was written from this stale image. Dropped as factually wrong.
- `fixed-asset-applet-overview-infographic.png` — AI marketing infographic (same decision as
  Pricebook / Stock Balance / Stock Conversion / Stock Replenishment / Supplier / Tax Configuration
  / Warehouse Management / Workflow Design / Events).

**Note for Vincent, carried over from run 17:** every full-window capture in this folder shows a
personal profile photograph of a real person in the top-right avatar. Earlier runs kept captures
carrying a staff login e-mail in the same bar, so I have kept these on the same precedent — but if
the avatar counts, all ten kept images need recapture too.

**Recapture wanted** from a GadgetSphere-seeded tenant: Asset Register listing, Edit Asset →
Depreciation → Configuration (with the method drop-down open), Edit Asset → Related Doc, Settings
(current menu, showing which entries 404), Depreciation Run → Lines → Registered Assets (the screen
the RUN button actually lives on).

## Cross-lane link requests (from this page)

1. `content/en/applets/finance/ledger-and-journal-applet.md` (already lists `fixed-asset-applet` in
   `related_applets`) — **correction needed**. Its upstream table says "FINAL on these documents
   creates an `AUTO` journal here" and includes Fixed Asset. There is no FINAL on a fixed asset. Only
   the depreciation processor writes `auto_flag = AUTO` (txn_type `DEPRECIATION`, descr
   "AUTO CREATED FROM FIXED ASSET DEPRECIATION PROCESSOR", back-referenced by
   `bl_fi_jrnl_hdr.far_hdr_guid` and `far_depr_run_line_guid`); acquisition, adjustment, disposal and
   other-journal entries are ordinary browser-posted journals with no `auto_flag`, txn_types
   `ACQUISITION` / `ADJUSTMENT` / `DISPOSAL` / `ASSET_HELD_FOR_SALE` / `TXN`.
2. `content/en/applets/finance/internal-purchase-invoice-applet.md` — add `fixed-asset-applet` to
   `related_applets` and a sentence: a line whose item has `item_txn_type = FIXED_ASSET_REGISTER`
   can create a DRAFT fixed-asset record on the document's `posting_fixed_asset` cycle, one asset per
   line at the unit price, but only where the tenant has enabled the `FIXED_ASSET_REGISTER_ITEM_TYPE`
   applet trigger.
3. `content/en/applets/master-data/inv-item-maintenance-applet.md` — add `fixed-asset-applet` to
   `related_applets`: `property_json.type` and `property_json.category_guid` on the item seed the
   converted asset's type and category, and the category is only applied if the GUID resolves.
4. `content/en/applets/master-data/chart-of-account-applet.md` — add `fixed-asset-applet` to
   `related_applets`. Also relevant to that page: the fixed-asset purchase conversion auto-creates a
   GL code named "Fixed Asset Register" plus the company `FIXED_ASSET_REGISTER` link when missing,
   which belongs in whatever list that page keeps of auto-created GL codes.
5. `content/en/applets/master-data/organisation-applet.md` — add `fixed-asset-applet` to
   `related_applets` (company `FIXED_ASSET_REGISTER` default GL link).
6. `content/en/applets/master-data/employee-applet.md` — add `fixed-asset-applet` to
   `related_applets` (person-in-charge; CSV import matches by name).
7. `content/en/applets/finance/financial-report-applet.md` — add `fixed-asset-applet` to
   `related_applets`.
8. `content/en/modules-v2/financial-accounting/_index.md` L340 — "confirm depreciation journals are
   posted before closing the period" is good advice; the page should say what to do when they are
   not, and the title on L176 should read "Fixed Asset", not "Fixed Asset Applet".

## Notes for the loop

- `kb/topics/fixed-asset-register.md` created (new slug; nothing referenced it before).
- METHOD candidate §41: **check that the settings *menu* and the settings *routes* agree.** The
  shared `app-settings` shell renders its own fixed groups (Server Side Permissions, Developer
  Tools) on top of whatever `settingItems` the applet passes, and those links are hard-coded — an
  applet that does not declare `permission-wizard-listing`, `release-notes` or `applet-log` still
  shows the links, and they 404. The inverse also happens (`feature-visibility` is the default
  redirect for `settings` and appears in no menu). Diff the shell's hard-coded `routerLink` list
  against the applet's `app.routing.ts` children before writing any settings section — and read the
  shell at the applet's **pinned** submodule commit, because the list is edited by commenting blocks
  in and out (METHOD §26).
- METHOD candidate §42: **a screenshot can be a stale-fact source, not just a privacy risk.** The
  old page's whole configuration section was transcribed from a settings screenshot whose menu had
  since been commented out upstream. When a page's prose matches an image and nothing else, treat
  the image as the citation and go verify it in code — and drop the image if it no longer matches.
- METHOD candidate §43: **a journal-writing processor can filter its own lines away.** Before
  writing "this creates a journal Dr X / Cr Y", check the guard on `lines.add(...)`. Here it is
  `Optional.ofNullable(line.getSub_ledger_guid()).ifPresent(...)` over two columns that no code
  path sets. The generic `JournalService.createJournal` resolves or creates a subledger from the GL
  code, so any *other* caller with a null subledger works fine — which is exactly why the bug is
  invisible from the other tabs of the same applet.
- METHOD candidate §44: **check `criteria.setLimit` on every batch/job selection.**
  `BaseQueryCriteria` defaults `limit = 100`. A backend loop that builds its criteria by hand and
  never overrides it silently processes at most 100 rows. Also check which filter columns it sets:
  leaving `guid_company` null means "all companies", not "the company on the header".
- `tests/content-lint.sh` passes.

## Page 2 — `finance/general-ledger-applet.md`: SKIPPED (registry / naming mismatch)

There is **no ACTIVE registry row for a General Ledger applet under any name.**
`planning/private/registry-applets-2026-09-05.tsv` and the live `bl_applet_hdr` (checked 2026-09-06)
return exactly two rows for `code ILIKE '%general%' OR name ILIKE '%general%' OR code ILIKE '%ledger%'
OR name ILIKE '%ledger%' OR code ILIKE '%gl%'`:

- `LedgerAndJournal` — "Ledger And Journal", TNT-USER, ACTIVE — already documented at
  `content/en/applets/finance/ledger-and-journal-applet.md`.
- `posGeneral` — "POS General", TNT-USER, ACTIVE — a different applet entirely.

The existing page is a placeholder: 60 lines, three `TODO:` headings, a "Documentation Status:
requires comprehensive documentation" callout, and a feature list ("Automated recurring entries",
"Budget vs. actual reporting", "Financial statement generation") that describes Ledger And Journal,
Budgetary and Financial Report between them. Per ADR-0002 / standard rule 1 it was not rewritten.

**Why this one needs Vincent rather than a quiet delete.** Unlike the earlier skips, this page is
heavily linked — 19 references across `content/en/`, in **two URL shapes**:

- `/applets/general-ledger-applet/` (5): `modules/financial-accounting/_index.md` L58,
  `modules/erp/_index.md` L28, `modules/accounting/_index.md` L33, `applets/_index.md` L90,
  `applets/applet-catalog.md` L194.
- `/applets/finance/general-ledger-applet/` (14): `user-guide/reports-analytics-v2/_index.md` L166;
  `modules-v2/financial-accounting/_index.md` L243, L244, L288, L337, L368, L503, L517;
  `guides/accounting-guides/financial-reporting.md` L171; `guides/accounting-guides/_index.md` L97;
  `applets/finance/deposit-applet.md` L14, L105, L557, L591; and `general-ledger-applet` appears in
  the `related_applets` list of `applets/master-data/cashbook-applet.md`.

Neither URL is claimed as an alias by any other page, so a merge is clean:

1. Add `aliases: [/applets/general-ledger-applet/, /applets/finance/general-ledger-applet/]` to
   `content/en/applets/finance/ledger-and-journal-applet.md` **in the same commit** that deletes
   `general-ledger-applet.md` — Hugo fails the build if the alias is declared while the page still
   exists.
2. Nothing in the placeholder needs carrying across: everything it claims is either already on the
   Ledger And Journal page or belongs to Budgetary / Financial Report.
3. Optionally repoint the 19 links and the `related_applets` entry to
   `/applets/finance/ledger-and-journal-applet/` so the aliases become belt-and-braces rather than
   load-bearing. Most of those files are outside this lane's folders.

Recorded as the same F-0050 pattern as `customer-applet.md`, `mm-deposit-applet.md` and the two
Stock Take / Inventory Item duplicates: the facts are settled, the IA decision is Vincent's.

## Pages 3 and 4 — the two MS ESD pages: SKIPPED (customer-specific, excluded from scope)

`content/en/applets/integrations/ingram-micro-ms-esd-applet.md` and
`content/en/applets/integrations/vstecs-ms-esd-order-applet.md` both document applet families that
`planning/private/applet-exclusions.tsv` marks **customer-specific**:

- `IMMsEsdOrderApplet_ALLIT`, `_machines`, `_PCImage`, `_senheng`, `_TM` — five ACTIVE TNT-USER rows,
  all excluded. Four of the five registry names embed a customer's trading name.
- `MsEsdOrderApplet` (ETL-CLIENT) and `MsEsdOrderApplet_ALL_IT` — both ACTIVE, both excluded, both
  names embed a distributor's trading name.

There is no generic, non-customer applet behind either page. Neither has a repo in
`/home/marketing/repos/refs/` other than two customer-named lambda repos, which are out of scope and
must not be cited even by pseudonym for a public page.

Both pages are also thin: the Ingram one is **front matter only** — nine lines, no body at all — and
the VSTECS one is nineteen lines of unedited implementation notes ("Attached User guide for MS ESD
Order and Work Breakdown for implementation", "**Note" with an unclosed bold marker). Neither is
salvageable, and per the standard's exclusion rule neither should exist.

**Recommendation (Vincent's call): delete both.** Both page titles name a real distributor brand,
which is a privacy problem on a public site independent of the exclusion rule. Inbound links to
clean up:

- `content/en/applets/applet-catalog.md` L347 (`/applets/ingram-micro-ms-esd-applet/`) and L348
  (`/applets/vstecs-ms-esd-order-applet/`).
- The Chinese twins at `content/zh/applets/applet-catalog.md` L302 and L303 — these must be edited
  in the same commit or the catalog keeps two dead links (CLAUDE.md's translation-parity rule).
- `vstecs-ms-esd-order-applet.md` carries `aliases: [/applets/vstecs-ms-esd-order-applet/]`, which is
  also its registry `documentation_url`. Deleting the page frees the alias; nothing else claims it.
  The registry row's `documentation_url` would then point at a 404, so the product-side link needs
  clearing too (an `applet-audit` follow-up).

## Pages 5, 6 and 7 — the three Team Maintenance pages: SKIPPED (registry / naming mismatch)

`crm/installation-of-team-maintenance-applet.md`, `crm/introduction-to-team-maintenance-applet.md`
and `crm/team-maintenance-applet.md` all describe the same applet, and it has **no ACTIVE registry
row**. Checked three ways against the live `bl_applet_hdr` on 2026-09-06 — `code ILIKE '%team%'`,
`name ILIKE '%team%'`, and `property_json::text ILIKE '%team-maintenance%'` — every query returns a
single row:

```
newTeamMaintenanceApplet | Team Maintenance | TNT-APPLET | DELETED | (no documentation_url)
```

The applet is nevertheless **built and actively maintained**. Two repos exist:
`blg-applet-akaun-platform-team-maintenance-applet` (HEAD 2025-11-18, "Initial split from monorepo")
and `blg-applet-akaun-platform-team-maintenance-V2-applet` (HEAD 2026-08-21, a merged PR against an
internal task issue), whose `mainPath` is
`applet/tnt/wavelet/erp/finance/team-maintenance-applet`. So this is the third instance of the same
shape in this lane: **a maintained applet with a deleted or absent registry row** — after Group
Maintenance (run 9) and E-Mandate (run 30). Worth Vincent's attention as a pattern rather than three
separate curiosities: either the registry is stale or these applets are being shipped outside it.

The three pages are stubs and would not be worth keeping even if the row existed:

- `team-maintenance-applet.md` — 9 lines: front matter and a body consisting of the single
  character `1`.
- `installation-of-team-maintenance-applet.md` — front matter plus five lines of generic Applet
  Store install steps that apply to every applet and belong in a platform page, not an applet page.
- `introduction-to-team-maintenance-applet.md` — front matter plus three lines: "Team Maintenance
  applet is to manage the users and permissions of the team. There is only one module in the Applet
  which is 'Team'."

Note that "team permissions" as a *concept* is alive and platform-wide — the shared settings shell
renders a Team Permission entry and every applet routes `team-permission-listing` — so deleting these
pages does not leave a hole in the docs; the permission surface belongs on the applet pages that
route it.

**Recommendation (Vincent's call): delete all three,** or keep one placeholder if the registry row is
going to be restored. Inbound links to repoint or drop, all to `/applets/team-maintenance-applet/`
(none of the three pages declares that alias, so every one of these links is already dead):

- `content/en/modules/hr-payroll/_index.md` L59, `content/en/modules/digital-crm/_index.md` L68,
  `content/en/modules/erp/_index.md` L217, `content/en/applets/applet-catalog.md` L324,
  `content/en/applets/_index.md` L104.
- Chinese twins: `content/zh/applets/applet-catalog.md` L281, `content/zh/applets/_index.md` L53.

**Separately worth recording:** all five links above are broken *today*, because no page claims
`/applets/team-maintenance-applet/`. The same is true of `/applets/general-ledger-applet/` (page 2
above). A repo-wide sweep for `/applets/<slug>/` links whose slug is not claimed by any page's path
or `aliases:` would probably find more; `scripts/check-links.sh` may already do this and not be run
often enough.

## Page 8 — `rma/internal-rma-applet.md`

Registry `InternalRmaApplet` "Rma Applet (Internal)" (TNT-USER, ACTIVE). Title changed from
"RMA (Internal) Applet" to the registry name. The registry `documentation_url` already points at
`/applets/rma/internal-rma-applet/`, so no alias was needed. Full rewrite: 289 lines of guide-voice
marketing (a "Who Benefits" section, an invented six-step lifecycle taken from an AI infographic, a
Quick Start, an FAQ that asserts bulk actions, partial receipts and automatic credit notes that do
not exist) → 455 lines of reference derived from the applet at `bb89fce`, blg-shared-utilities at
the pinned `04bb553`, blg-akaun-ts-lib at `7d1616a9e` and the Java backend at `1ff620ef0e`. The UTF-8
BOM on the file was preserved.

### The finding that matters most: three record types, one applet

The old page treated "RMA" as one lifecycle. It is three unrelated things:

| Record | Storage | Signums | Effect |
|---|---|---|---|
| Service Note | `bl_svc_issue_hdr`, endpoints under `core2/tnt/dm/svc/` | n/a — not a generic document | No posting, no stock. Its state is its position in up to three workflow processes |
| Customer RMA | generic document `INTERNAL_SALES_RMA` | amount **0**, quantity **0** | **Moves no stock and posts no journal.** It is one of five signum-zero sales types `GenericDocumentService` lists alongside Quotation, Sales Order, Outbound DO and Jobsheet |
| Supplier RTV | generic document `INTERNAL_SUPPLIER_RTV` | amount **+1**, quantity **+1** | Moves stock and posts through the standard path |
| RMA Request | `bl_svc_issue_request_hdr` | n/a | An approval inbox that produces a service note |

So every claim of the form "approving the RMA restocks the item" or "the RMA generates a credit note"
is wrong. The old page's FAQ made both. Corrected on the page and flagged in the topic note.

### The second finding: a fourth approval engine

`bl_svc_issue_request_hdr.approval_status` is an `SVCApprovalStatus` enum with exactly
`PENDING_APPROVAL`, `APPROVED`, `REJECTED`. It is **not** the optional document approval on
`bl_fi_generic_doc_approval_*` (the sweep recorded in `kb/topics/document-approval.md`), **not** the
Workflow Design engine, and **not** `bl_fi_budget_register_approval_*`. There is no Approval Settings
screen for it anywhere and nothing configures who may approve beyond
`TNT_API_DM_SVC_ISSUE_REQUEST_HDR_UPDATE`.

Approving enqueues `SVC_ISSUE_REQUEST_HDR_PROCESSOR` — `getDescription()` is literally "Move Approved
row to svc issue hdr" — which runs

```sql
SELECT * FROM bl_svc_issue_request_hdr
WHERE guid = :guid AND svc_issue_hdr_guid IS NULL AND approval_status = 'APPROVED'
```

maps the row straight onto a `bl_svc_issue_hdr` object by column-name overlap, creates the service
note, and writes the new GUID back onto the request. `svc_issue_hdr_guid IS NULL` is the entire
idempotency guard. The UI disables the drop-down once the value is APPROVED or REJECTED; the backend
endpoint does not, and accepts any enum value.

There is also a `login-entity-ep` create path guarded by `UserPermissionService.isUserLoginEntity`
rather than a permission, so a logged-in customer or supplier entity can raise its own request. That
is the real "customer portal" the old page speculated about — worth saying plainly rather than
hedging with "if integrated with a customer portal".

**Running count of approval mechanisms in the product: four.** Generic-document approval (optional,
three doc types have settings), Workflow Design (inert except here), budget register (unaudited),
and this one.

### Configuration classification (METHOD §1, §29)

**Applet-local, and the counter-example to the eight-toggle stub.** `app.routing.ts` imports the
applet's own `FieldConfigurationComponent`, `DefaultSettingsComponent` and four further settings
screens; `AppletSettingsModule` is in `AppModule.imports`; the shared-utilities submodule is present
(pinned `04bb5539`) but is used only for the permission, layout, session and audit-trail modules.

Four-proof result on **Application Settings** (the `field-settings` route, labelled "Application
Settings" in the menu): **82 keys declared** in the form group (72 named plus ten
`ITEM_CATEGORY_GROUP_n` added in a loop), **all 82 rendered** — mostly `[formControl]="form.controls['KEY']"`
rather than `formControlName`, so a naive `formControlName="KEY"` regex finds only 47 and is wrong —
**all 82 persisted** by one `saveMasterSettingsInit` of `this.form.value`, **68 consumed** elsewhere
in the applet.

The dead fourteen: `HIDE_CUSTRMA_DOC_NO`, `HIDE_SUPRTV_DOC_NO`, `HIDE_WORKFLOW_STATUS`,
`HIDE_WORKFLOW_RESOLUTION`, and `ITEM_CATEGORY_GROUP_1`…`_10`. A Java-side grep confirms none of
them is read by the backend either (METHOD §15); the `ITEM_CATEGORY_GROUP_*` symbols that do exist in
the Java tree are CSV column names in the financial-item import and unrelated.

Two model keys are not on this screen: `SERVICE_NOTE_DETAILS_TAB_ORDER` (owned by Default Selection)
and `salesManLabels`, which is model-only.

Also notable: `SHOW_CUSTOMER_WORKFLOW_STATUS` and `SHOW_SUPPLIER_WORKFLOW_STATUS` are **opt-in**
(METHOD §18) — they are not hide toggles — and because `HIDE_WORKFLOW_STATUS` is dead, the internal
workflow status has no working hide key at all.

### The Workflow Design connection

This applet is the **only consumer of the Workflow Design engine in the product**, which closes the
loop on run 29's finding that the engine is inert except for "the service-issue (RMA) processor".
Concretely:

- Three applet settings each select a workflow process: `WORKFLOW_PROCESS_GUID` (internal),
  `CUSTOMER_WORKFLOW_PROCESS_GUID`, `SUPPLIER_WORKFLOW_PROCESS_GUID`, rendered by three dedicated
  drop-down components.
- Settings → Workflow Settings writes `bl_fi_comp_workflow_gendoc_process_template_hdr` rows —
  company (required), process (required), this applet's GUID, a description, and `server_doc_type`
  hard-coded to `INTERNAL_SALES_RMA` from `AppletConstants.docType`.
- A service note therefore carries three independent status fields, and run 29's transition → role →
  user inner join is why a user with no Role row sees an empty drop-down. That is now the first
  troubleshooting row on this page.

### Other verified facts

- **Cross-family permission gates (METHOD §39).** Return reasons (`svc/return-reasons`), request
  actions (`svc/request-actions`) and the RMA Report (`svc/rma-reports`) are all gated for **read**
  by `TNT_API_DM_SVC_ISSUE_HDR_ADMIN/OWNER/READ`, not by their own
  `TNT_API_DM_SVC_RETURN_REASON_*` / `_REQUEST_ACTION_*` families, which cover only create, update
  and delete. A user granted the reason family and not the issue-header family can create codes and
  cannot list them.
- **The RUN-style trap in reverse:** the Approve action needs
  `TNT_API_DM_SVC_ISSUE_REQUEST_HDR_UPDATE`, which is what you would expect — but the *report* does
  not need any report permission at all.
- **Required-vs-hidden (METHOD §37).** Only Branch, Location and Status carry
  `Validators.required` on the service note, plus Assignee and Reporter when `ENABLE_PIC_SELECTION`
  is on. `HIDE_BRANCH` and `HIDE_LOCATION` remove the controls without removing the validators →
  SAVE silently disabled. Documented as a troubleshooting row.
- **Two different "status" concepts.** `bl_svc_issue_hdr.status` is `ACTIVE`/`INACTIVE`. A separate
  nine-value progress list (Ready to send out from Branch … close) is hard-coded in
  `models/constants/sales-invoice-details.constants.ts` and is **not** configurable — the old page
  implied it was.
- **Tab ordering is defensive.** `SERVICE_NOTE_DETAILS_TAB_ORDER` sorts the seven panels by the saved
  order and appends any panel missing from the saved list, so a tab added in a later release still
  appears — the same merge logic Fixed Asset uses.
- **Every shell settings entry has a route here.** Unlike Fixed Asset (run 31, page 1), this applet
  declares `permission-wizard-listing`, `release-notes` and `applet-log`, so nothing in the settings
  menu 404s. Two routes have no menu link (`webhook`, `feature-visibility`) and
  `client-side-permission-listing` is the default redirect for `settings`.
- **Personalization is broken the same way as Fixed Asset's** — `appletContainer` never assigned,
  change handlers dereference `undefined`, SAVE emits nothing. Here the menu's Field Settings entry
  is commented out, so at least it does not 404.
- **The Supplier RTV Line screen is headed "Customer RMA Line Items Listing"** — the supplier
  component re-uses the customer component's title.
- **A parallel `internal-rma-applet (obsolete)` project directory** sits beside the real one in the
  repo, with its own `app.routing.ts`. Anyone grepping this repo for routes will find two.

### Defects found

1. `HIDE_CUSTRMA_DOC_NO`, `HIDE_SUPRTV_DOC_NO`, `HIDE_WORKFLOW_STATUS`, `HIDE_WORKFLOW_RESOLUTION`
   are rendered, saved and read by nothing.
2. Ten `ITEM_CATEGORY_GROUP_n` multi-select controls persist and are never read.
3. `HIDE_BRANCH` / `HIDE_LOCATION` disable SAVE by hiding required controls.
4. The approve/reject one-way rule is client-side only; the endpoint accepts any enum value.
5. Personalization → Default Selection throws on first interaction and saves nothing.
6. Supplier RTV Line renders the Customer RMA heading.
7. The obsolete duplicate project directory should be deleted from the repo.
8. `HIDE_WORKFLOW_STATUS` being dead means the internal workflow status cannot be hidden even though
   a control exists to do it.

### Screenshots

Twenty-two files under `static/images/internal-rma-applet/`. Every one was opened and looked at.

**Kept (6)** — all settings screens plus the report, no personal data:
`settings-overview.png`, `settings-application-settings.png`, `settings-default-selection.png`,
`settings-return-reasons.png`, `settings-request-action.png`, `rma-report.png`.

**Dropped from the page (references removed; files to quarantine, 16):**

- Eleven listing / create / view captures whose grids carry **real staff full names, work e-mail
  addresses at the company domain, and Malaysian mobile numbers**, plus company names that read as
  real customers: `service-note-listing.png`, `service-note-create.png`, `service-note-view.png`,
  `customer-rma-listing.png`, `customer-rma-create.png`, `customer-rma-view.png`,
  `customer-rma-line-listing.png`, `supplier-rtv-listing.png`, `supplier-rtv-create.png`,
  `supplier-rtv-line-listing.png`, `rma-requests-listing.png`. The RMA Requests one is the worst:
  a customer's first name, a full mobile number, and a real marketplace brand as an e-mail domain.
- `settings-workflow.png` — process rows named after two individuals.
- `settings-printable-format.png` — format codes carrying a developer's name and three strings that
  read as customer abbreviations or brands.
- `personalization.png` and `personalization-default-selection.png` — a **photograph of a real
  person, their full name and their work e-mail address**, large and central.
- `rma-overview-infographic.png` — an AI marketing infographic (NotebookLM watermark) inventing a
  "6-Step RMA Lifecycle" (Request Created → Pending Approval → Approved → Item Received → Inspected →
  Resolved) that exists nowhere in the code. It was the source of the old page's "Key Concepts →
  RMA Lifecycle" section.

**This settles the avatar question raised in runs 17 and 31/page 1.** In this folder the logged-in
staff member's face, name and e-mail are not just a 30-pixel avatar — they are the subject of two
full screens. Whatever Vincent decides about small avatars, these two had to go.

**Recapture wanted** from a GadgetSphere-seeded tenant: Service Note listing, Create Service Note
(Main Details with the three workflow status fields visible), Service Note edit showing the seven
tabs, Customer RMA and Supplier RTV listings and Lines tabs, RMA Requests with a PENDING_APPROVAL
row and the rejection modal, Settings → Workflow Settings, Settings → Printable Format Settings.

### Cross-lane link requests (from this page)

1. `content/en/applets/master-data/workflow-design-applet.md` (lane 4, run 29 — this lane, but the
   page is already done, so recording rather than editing) — should name Internal RMA as the
   engine's **only** consumer, and describe the three-process pattern
   (`WORKFLOW_PROCESS_GUID` / `CUSTOMER_…` / `SUPPLIER_…`) and the per-company
   `bl_fi_comp_workflow_gendoc_process_template_hdr` binding written from RMA's Workflow Settings
   with `server_doc_type = INTERNAL_SALES_RMA`. Add `internal-rma-applet` to its `related_applets`.
2. `content/en/applets/sales-workflow/internal-sales-invoice-applet.md` — add `internal-rma-applet`
   to `related_applets`.
3. `content/en/applets/master-data/customer-maintenance-applet.md` and
   `content/en/applets/master-data/supplier-applet-1.md` — add `internal-rma-applet`, and note that
   an entity with a login can raise its own RMA request through `svc/issue-request-hdrs/login-entity-ep`.
4. `content/en/applets/rma/warranty-admin-applet.md` (still in this lane's queue) — the service note
   carries purchase date, warranty expiry and extended expiry; cross-link both ways.
5. **Any page listing which documents move stock** must include `INTERNAL_SUPPLIER_RTV` (+1/+1) and
   exclude `INTERNAL_SALES_RMA` (0/0). `content/en/applets/inventory-workflow/related-applets-stock-balance.md`
   (this lane, run 19) built its list from the DCO signum sweep, so it should already be right —
   worth a spot check.
6. `kb/topics/document-approval.md` — should gain a line naming `SVCApprovalStatus` on
   `bl_svc_issue_request_hdr` as a fourth, separate engine, alongside the existing note that
   `bl_fi_budget_register_approval_*` is a third.

### Notes for the loop

- `kb/topics/rma-and-service-notes.md` created (new slug).
- METHOD candidate §45: **the "rendered" proof must accept `[formControl]="form.controls['KEY']"`,
  not just `formControlName="KEY"`.** On this applet the naive regex reports 47 of 82 rendered; the
  truth is 82 of 82. Search for the bare key name in the template and then confirm the binding form,
  rather than pattern-matching one binding syntax.
- METHOD candidate §46: **count the approval engines before writing an approval sentence.** There are
  now four unrelated ones — generic-document approval, Workflow Design, budget register, and
  `SVCApprovalStatus` on `bl_svc_issue_request_hdr`. They share no tables, no enum and no settings
  surface. Identify which one a screen uses from the table it writes, not from the word "approval".
- METHOD candidate §47: **a `login-entity-ep` sibling is a real feature, not a variant endpoint.**
  Where a controller offers `backoffice-ep` / `etl-ep` / `login-entity-ep`, the last one is the
  customer- or supplier-facing path and usually checks `isUserLoginEntity` instead of a permission.
  It is what makes "can the customer do this themselves?" answerable, and pages keep hedging about
  it (run 30 found the same shape on Engagement's `/etl-ep`).
- `tests/content-lint.sh` passes.

---

# Run 32 — 2026-09-06 — MY-SST (adopted page 9), plus three registry skips

## Page completed

- `content/en/applets/finance/sst-applet.md` — registry `mySST` "MY-SST APPLET" (TNT-USER, ACTIVE).
  Full rewrite of a 731-line guide-voice page ("Who Benefits from This Applet?", a Quick Start, a
  20-question FAQ, an "Applet Reference" appendix) into a ~430-line reference derived from the applet
  at `b9e058e`, blg-shared-utilities at the pinned `7f59480` and HEAD `a8c38a2`, and the Java backend
  at `1ff620ef0e`.

### Title

The registry `name` is **upper-cased**: `MY-SST APPLET`. Standard rule "title = registry name exactly"
gives a shouting page title. Applied it anyway (precedent: run 31 used "Rma Applet (Internal)", run 17
used "Organization"). **Vincent's decision:** normalise `bl_applet_hdr.name` to `MY-SST Applet` in the
product registry, then the page title follows. Recorded here rather than deviating from the standard.

### Aliases

`documentation_url` is `https://wiki.bigledger.com/applets/sst/mysst/`, already an alias — kept. Added
`/applets/sst-applet/`, which was **unclaimed** and is used by six inbound links
(`applets-workflows.md`, `modules/core/_index.md`, `modules/financial-accounting.md`,
`applets/_index.md` ×2, `applets/applet-catalog.md`). Those links were broken before this run.

## Configuration classification (METHOD §1, §27, §29)

**Applet-local, and nothing in it works.** `.gitmodules` points at blg-shared-utilities (pinned
`7f59480`), so METHOD §29 applies: the submodule is there and `app.routing.ts` still imports the
applet's own `FieldConfigurationComponent` and `DefaultSettingsComponent`. `AppletSettingsModule` and
`AppletPersonalizationModule` are both imported, so the screens render.

| Screen | In the menu? | Verdict |
|---|---|---|
| Settings → Default Tax Settings | Yes | Two controls (Default Branch, Default Location). Both value-change handlers dereference `this.appletContainer`, which is never assigned: the component declares `@Input() appletSettings$` / `@Output() save` but is **routed directly**, so neither binding exists. First interaction throws; SAVE emits to nobody. |
| Settings → Field Settings | No | The unbound eight-toggle stub (Unit Discount, SST/VAT/GST, WHT, Blanket Order, Segment, G/L Dimension, Profit Center, Project). Sixth applet in this lane with the identical artefact. Reachable only by URL. |
| Settings → Webhook / Client-Side Permission / Permission Set / User / Team / Role | No | Shared-utilities screens, routed but unlinked. `settings` with no child redirects to `client-side-permission-listing`, so that empty grid is the first thing the gear shows. |
| Personalization → Default Selection | Yes | Same defect, plus the load subscription is commented out. |
| Personalization → Sidebar | No | Routed, unlinked. |

Four-proof: **no key passes all four through this applet's own screens.** 25 keys declared in
`applet-settings.model.ts`; one has a reader.

- `DEFAULT_BRANCH` — declared, rendered, **not persisted** (the save path throws), **consumed** by all
  three Service SST-02 components. The twist: they read it from `SessionSelectors.selectPersonalSettings`,
  which the shared session effect fills from the per-user `USER_SETTINGS` row on
  `bl_applet_login_subject_link_ext` — a *different* row from the applet-level `APPLET_SETTINGS` that
  Default Selection tries to write. So the one consumed key is a personal setting the applet cannot set.
- `DEFAULT_LOCATION` — declared, rendered, not persisted, no reader.
- The other 23 (`INCLUDE_*` ×6, `ENABLE_*` ×6, `PRINTABLE`, 15 `ENABLE_CUSTOM_STATUS_*`) — model-only.

No inline `app-applet-settings-toggle` gear anywhere (METHOD §8 checked, zero hits).

## The finding that matters most

**Every box of the SST-02 sums hard-coded tax-code string literals, and that is why customers keep
reporting that item 10 and item 11c do not tally.**

`SSTController` calls `SSTService.getSST02Report(dto, conn, sstType, taxCodeList)` with the list baked
into the source:

| Endpoint | Tab label | Service tax codes |
|---|---|---|
| `service/sst-02` | SST-02 | `SRS6`, `SVU-6`, `IMS6` |
| `service/sst-02/v2/backoffice-ep` | SST-02 Version 2 | `SRS8`, `SVU-6`, `IMS6` |
| `service/sst-02/v3/backoffice-ep` | SST-02 Version 3 | `SRS6`, `SRS8`, `SVU-6`, `IMS6` |
| `sales/sst-02` | SST-02 (Sales) | `ImmutableList.of()` — no tax-code filter at this level |

The three Service "versions" are the 6% era, the 8% era and a straddling period. That is the real
reason the tab exists three times, and no page or release note says so.

Inside `getSST02Report` the Sales branch is equally literal: §11a `SRG5/SW-5/SU-5`, §11b
`SRG10/SW-10/SU-10`, §18a `ZREG0/ZRLG0`, §18b `ESA`/`ESB`/`ESC-A|B|C`, §19-21 `EPC-A|B|C`; Service §18c
`ESS0`.

Now the tally bug. Both numbers come from `bl_fi_tax_txn` for the same filing cycle, through two
different filters:

- **Item 10** (`SECTION_B1_TOTAL10`) = `SUM(doc_line_amount_net)` grouped by `tax_tariff_code`, over rows
  with `tax_tariff_code IS NOT NULL`, INNER JOINed to `bl_fi_mst_label_hdr` in the `TARIFF_CODES` list.
- **Item 11c** = `SUM(doc_line_amount_net)` over rows with `doc_line_tax_code IN (<the literals>)`.

A filed line with a tariff code but a tax code outside the list lands in 10 and not in 11c. A filed line
with the right tax code but no tariff code lands in 11c and not in 10. Neither filter is configurable.
This is reported at `customer-repo-e40ac3#7`, `#16` and `#17` (three tickets, one tenant, over months),
and the closing comment is always "fixed on our side" — i.e. data was patched, never the query.

## Other verified facts worth keeping

1. **Service tax is payment-basis, sales tax is accrual-basis, and it is SQL, not settings.**
   `getSSTDocumentsService`: `posting_status = 'FINAL'` AND `(arap_stlm_amount + arap_contra) <> 0`, with
   an INNER JOIN LATERAL onto the AR/AP contra documents and the **date range applied to the contra
   date**. `getSSTDocumentsSales`: `posting_status <> 'VOID'` only — a **DRAFT** sales invoice is eligible
   and can be filed.
2. Line eligibility also differs: service takes `SST-SVC-OUTPUT` with `tax_gst_rate > 0` **or**
   `tax_gst_code = 'ESS0'`; sales takes `SST-SLS-OUTPUT`/`SST-SLS-INPUT` with `tax_gst_rate > 0` and has
   no zero-rate escape. The "Taxable Amount" column means `SUM(amount_txn)` (gross) on service and
   `SUM(amount_tax_gst)` (the tax) on sales. The sales line sub-query omits the `status` filter, so
   DELETED lines count.
3. **`fileTaxTxn` keeps only lines whose `txn_type` is `PNS`.** A taxed freight or charge line carried as
   another line type is taxed on the invoice and absent from the return.
4. **Unfile deletes one row.** `unfileTaxTxn` does `container.stream().findFirst().get()` over all rows
   matching company + document and deletes that single row, then the controller nulls `posting_tax_gst`.
   A multi-line document keeps orphan rows against the old filing while showing as unfiled; re-filing
   adds a second full set. That is the mechanism behind `customer-repo-bb8ea1#244` and `#327`
   ("duplicate filing for sales return and credit memo"). `.get()` on an empty result throws.
5. **`FILE ALL` ignores the already-filed guard.** `file/backoffice-ep` filters
   `!"POSTED".equals(posting_tax_gst)`; `service|sales/file-all/backoffice-ep` files whatever the
   eligibility query returns, with no such filter.
6. **A failed file is invisible.** `taxContainer.getOrElse(ImmutableList.of())` — the controller returns
   HTTP 200 with an empty list for that document and leaves `posting_tax_gst` unset.
7. **Lock checks no permission at all.** `FinancialFilingController.lock` fetches with the two-argument
   `new FinancialFilingUow().getByGuid(guid, dbConn)`; the `requiredPermList` it builds is passed only to
   `checkPreviousCycleIsLocked`, where it decides a `Permissioned` display flag. Any authenticated tenant
   user can lock a filing cycle. **Delete needs only `TNT_API_FINANCIAL_FILING_READ`** — there is no
   delete permission in the family.
8. **Lock does not freeze the period.** No file, file-all or unfile path reads `locked_status`. What it
   does enforce is order: any earlier-starting cycle for the same company with `locked_status IS NULL`
   blocks it (deleted cycles are **not** excluded), answered as HTTP 200 with the body
   `PREVIOUS FILING CYCLE IS NOT LOCKED`, which the applet's effect does recognise and toast.
9. **Lock blanks its own Part A.** `generateSqlForPartA` filters `locked_status <> 'LOCKED'`, so after
   locking, the SST-02 renders with no company name, no SST number and no period dates. There is no
   unlock action. The old page's FAQ said locking is what you do *after* exporting; it is now the only
   safe order, and the page says so.
10. **The lock endpoint's carry-forward branch posts a journal with hard-coded amounts.**
    `JournalPostingService.getJournalContainerCarryForward` builds `new BigDecimal(1500)` /`1500` /
    `1000` / `1000` under comments reading `//Get Amount 6b to transfer` and `//Get Amount 5b to
    transfer`, then creates a POSTED journal *SST-02 Auto Transfer* / *AUTO CREATED DURING LOCKING OF
    FILING CYCLE*. **The applet never reaches it** — `confirmDialog` dispatches lock with `{}` and
    `confirmCarryForward()` is commented out with the note "no need carry forward for SST, only GST".
    Reachable only by direct API call. Also: the lock is saved *before* carry-forward runs, so a
    carry-forward failure leaves the cycle locked and returns 500.
11. **SST-02 item 13 is never assigned.** `section13A/13a/13b/13c` default to `BigDecimal.ZERO` in
    `SST02OutputDto.PartB2` and `getSST02Report` never sets them; item 14 is set equal to item 12. Credit
    notes and bad debts therefore never reduce the tax payable on the form. The old page's FAQ claimed
    they appear in "Section 13a (Tax deduction from credit notes)" — false, and now corrected.
12. **The Sales item 12 sums the wrong column.** Service sets §12 to the §11c **tax**; Sales sets it to
    §11a **net** + §11b **net** — turnover reported where tax payable belongs.
13. Item 15's *percentage* is stored and printed but never used in arithmetic; item 16 = item 14 + the
    typed penalty **amount**.
14. **Reports read live data, the SST-02 reads a snapshot.** The two Tax Report screens hit
    `taxable-generic-documents` (live `bl_fi_generic_doc_hdr`); the Tax Code Summary joins live
    `bl_fi_generic_doc_line` to `bl_fi_tax_txn`; the SST-02 reads only `bl_fi_tax_txn`. They diverge
    permanently once a filed document is edited. That is the standing "SST report and SST-02 not tally"
    complaint at `customer-repo-d4fc8d#37` and `customer-repo-c0c34b#715` — two unrelated tenants, a year
    apart. The Tax Code Summary also has no `t.status` filter, so a VOID-reversal row double-counts.
15. **`VOID_TAX_PROCESSOR` is a subscriber, not a trigger.** Nothing in the Java tree enqueues it; it runs
    where a tenant's job template subscribes it to the generic-document queue. Where it is not
    subscribed, voiding a filed document leaves its tax transaction in the return. When it does run it
    writes a negated row with `filing_status = VOID` (keeping the original) and throws
    *No tax transaction found for this generic document!* on a document that was never filed.
16. **The `TARIFF_CODES` label list is seeded, not created.** Liquibase `V20221019` inserts it as a
    SYSTEM_DEFAULT with the fixed GUID `…-002`; `label.effects.ts` only looks it up by code. Older or
    hand-provisioned tenants without that row save every tariff code with a null `label_list_guid`, and
    Part B1 comes back empty.
17. Filing-cycle validation is FK-existence only — **no date-order check and no overlap check**. Two
    cycles covering the same month are accepted, and the same document can be filed into both.
18. Five unrelated permission families across one applet, and the one that gates filing is the
    generic-document family (METHOD lesson: check which family actually gates a screen):
    File/File All/Unfile → `API_TNT_DM_ERP_GEN_DOC_*` (+ `API_TNT_DM_ERP_FI_TAX_TXN_*` for unfile);
    reports and SST-02 → `API_TNT_DM_ERP_SST02_*`; Tax Code Summary → `API_TNT_DM_ERP_TAX_CODE_SUMMARY_*`;
    tax years → `API_TNT_DM_ERP_FI_FILING_YEAR_*`; filing cycles → `TNT_API_FINANCIAL_FILING_*` /
    `TNT_LOG_FINANCIAL_FILING_*`.
19. The v1 Service SST-02's document query carries `app_perm_dfn.perm_code IN ('')`, so its
    `has_permission` column is always FALSE — but `SSTController.replaceWithoutPermission` returns the
    value unchanged, so nothing is masked. Dead permission plumbing.
20. Form defects that reach the data: Tax Year's **Approval No** is never sent (`onAdd` reads
    `form.value.approval`, the control is `approval_no`); a filing cycle's `fiscal_year_guid` is always
    null (assigned from a `fiscal` control that does not exist on that form); changing a cycle's Start
    Date always recomputes End Date as start **+ 3 months** (`onDateChange` hard-codes it) regardless of
    Monthly / Quarterly / Custom; the Tariff Code create and edit panels are both headed "Tax Code".
21. `bl_fi_cfg_tax_code` divergence from run 27 re-verified from this side: MY-SST writes `tax_country`
    = `MYS`, the rate unrounded as `rate/100`, and the tariff code into the `tax_tariff_code` column.
22. There are **no** `sales/sst-02/v2` or `/v3` endpoints on the server. The applet's `api-service.ts`
    builds those URLs, but no component calls them with `sstType = "SALES"` — the Sales tab has only the
    v1 SST-02 component. Dead client code, not a live 404.

## Defects found (worth a bug report independent of the docs)

1. Carry-forward journal posts hard-coded RM 1,500 / RM 1,500 / RM 1,000 / RM 1,000 (unreachable from
   the applet, live on the endpoint).
2. `unfileTaxTxn` deletes only the first matching row → duplicate filings.
3. `FILE ALL` has no already-POSTED guard → duplicate filings.
4. Lock endpoint performs no permission check.
5. Delete of a filing cycle is gated by a READ permission.
6. Locking a cycle blanks its own SST-02 Part A.
7. SST-02 item 13 is never populated; item 14 does not subtract it.
8. Sales SST-02 item 12 sums taxable amounts instead of tax amounts.
9. Sales eligibility accepts DRAFT documents.
10. Sales line sub-query omits the `status <> 'DELETED'` filter.
11. Tax Code Summary omits the `bl_fi_tax_txn.status` filter → VOID reversals double-count.
12. Both Default Selection screens throw on first interaction and save nothing.
13. Tax Year `approval_no` is never persisted.
14. Filing cycle `fiscal_year_guid` is never persisted.
15. Filing-cycle End Date recalculation hard-codes three months.
16. `checkPreviousCycleIsLocked` does not exclude deleted cycles.
17. Tariff Code screens are headed "Tax Code".
18. Filing failures return HTTP 200 with an empty body and no user-visible error.

## Screenshots

Eighteen references over `static/images/sst-applet/` (the directory also holds eleven stray
`shipping-pricebook-applet-*` files that belong to another applet). Every referenced image was opened.

**Kept (5)** — all from a clean `TESTING`/synthetic tenant or showing only test tariff data:
`tax-filing-listing.png`, `tax-filing-cycle-details.png`, `tax-filing-sst02-tab.png`,
`tariff-code-listing.png`, `tariff-code-create.png`. The two tariff ones are worth keeping precisely
because they show the mislabelled "Create/Edit Tax Code" heading on the Tariff Code screen.

**Dropped from the page (references removed; files to quarantine, 13):**

- `tax-code-listing.png`, `tax-code-create.png`, `tax-code-edit.png` — a grid row reading
  **"Martin Test Output 6"** (a developer's first name).
- `sst-service-tax-report-search.png`, `sst-sales-tax-report-search.png`,
  `sst-tax-code-summary-search.png` — company `11111 | yasir_test` and branch `1234 | YASIRBRANCH`
  (a developer's first name, twice per image).
- `tax-filing-view.png` — a filing cycle named **"TEST TALHA"** (a person's name) plus a company row
  reading as a real technology company.
- `main-listing-page.png`, `search-filter.png`, `tax-year-create.png`, `tax-year-edit.png` — the same
  Tax Year listing behind all four, carrying a company row that reads as a real customer name.
- `tax-filing-unfiled-transactions.png`, `tax-filing-filed-transactions.png` — the Branches drop-down
  lists five branch codes sharing a four-letter prefix that reads as a customer abbreviation, plus a
  named `SDN BHD`.
- `tax-filing-create.png` — the Company drop-down lists a name that reads as a real brand among
  otherwise synthetic entries.
- `sst-applet-overview-infographic.png` — an AI marketing infographic ("50% Less Time on Filing",
  "Intelligent Code Matching", "Real-time Data Sync"). None of those claims is supported by the code.

**Recapture wanted** from a GadgetSphere-seeded tenant: Tax Year listing and create; Tax Code listing,
create and edit; the Tax Filing → Service tab showing **all five** sub-tabs (Filed, Unfiled, SST-02,
SST-02 Version 2, SST-02 Version 3) side by side, which is the single most useful missing image; the
Unfiled Transactions grid with the Branches filter open; a populated SST-02 result grid; and the three
report search dialogs.

## Registry / naming mismatches

### `finance/investment-applet.md` and `finance/investment-guide.md` — SKIPPED

No registry row for an Investment applet under any name. `registry-applets-2026-09-05.tsv` and the live
`bl_applet_hdr` (236 rows, 2026-09-06) contain **nothing** matching `invest` in `code`, `name` or
`property_json`, and no treasury / portfolio / securities / fund row either (`%fund%` matches only
"Refund").

The repo **does** exist and is maintained: `blg-applet-wavelet-investment-applet`, HEAD `a4eb938`
(2026-08-03), 21 commits, angular project `investment-applet`, route
`applet/tnt/wavelet/erp/investment-applet`, build output `investment-applet-elements.js`. No registry
row's `es_module_url` points at that build. Same shape as E-Mandate (run 30) and Team Maintenance
(run 31): built, deployed nowhere.

**What the applet actually is** — worth recording, because two pages currently describe it wrongly.
Its four menus are **Deposit Requisition, Deposit Register, Deposit Category, Reports**: the first
three are the Deposit Applet's screens (run 30) in properly-named folders, and Reports is a
Depreciation Schedule over `FixedAssetReportInputDto` — i.e. the Fixed Asset applet's report (run 31).
It is a merge of the two, not a securities register.

**Both pages currently claim otherwise.** `finance/deposit-applet.md` (written in run 30, this lane)
says "the adjacent treasury register; deposits are term placements, **investments are holdings**" in
three places, and `modules-v2/financial-accounting/_index.md` L177 promises "Investment cost, market
value, and gain/loss tracking". Nothing of the kind exists in the repo or the backend. See cross-lane
requests below.

`investment-guide.md` is a separate matter: 18 lines describing "Portfolio Management / Trade
Execution / Performance Analysis / Risk Management" inside a "Unified Financial System (**UTMFin
Replacement**)". That is not BigLedger vocabulary at all.

### `finance/revenue-management-applet.md` — SKIPPED

No registry row (nothing matching `revenue`, `PTJ`, `receivable`, `collection`; `claim` matches only
`claimApplet` and `ClaimCycleApplet`, which are different applets with their own pages), and no repo.
The 181-line page describes "Bill of Claims", "**Inter-PTJ Claims Journal**", "Multiple Letter
Generation", "Debtors Subsidiary Ledger", "Staff Loan Subsidiary Ledger" — *PTJ* is *Pusat
Tanggungjawab*, Malaysian public-sector accounting vocabulary.

### The common origin, and a thing Vincent should see

`revenue-management-applet.md` and `investment-guide.md` are the same material as
`content/en/user-guide/demo/education/`, whose `_index.md` is titled **"UTM Integrated Financial System
Evaluation Guide"** and opens *"Thank you for taking the time to evaluate the BigLedger Integrated
Financial System for Universiti Teknologi Malaysia (UTM)"*. Eleven published pages addressed by name to
one named prospect's evaluation panel, live on the public wiki, plus two applet pages carrying that
tender's module names as if they were shipping applets.

**This needs Vincent's decision** and is outside this lane's folders, so nothing was touched:
(a) should a named-prospect evaluation guide be published on the public documentation site at all;
(b) the two applet-tree pages that leaked out of it should be deleted, with the three inbound links in
`modules-v2/financial-accounting/_index.md` repointed.

## Cross-lane link requests (from this page)

1. `content/en/applets/finance/deposit-applet.md` (lane 4, run 30 — done, so recording not editing) —
   remove the three "Investment Applet … investments are holdings" claims and the
   `investment-applet` entry in `related_applets`. The Investment applet is unregistered and is a fork
   of the Deposit + Fixed Asset screens, not a holdings register.
2. `content/en/modules-v2/financial-accounting/_index.md` — three problems: L177 / L260 / L352 describe
   the Investment Applet as tracking "investment cost, market value, and gain/loss" (invented, and the
   applet is unregistered); L212 / L251 / L342 / L370 / L509 describe the SST applet as aggregating
   "output and input tax from all posted transactions across the period", which is wrong for service tax
   (payment basis) and silent about the hard-coded tax-code lists; the L509 FAQ about SST not tallying
   should name the live-vs-snapshot split.
3. `content/en/applets/master-data/tax-configuration-applet.md` — should state that the tax **code
   string** is compliance-critical, because the SST-02 sums the literals `SRS6`, `SRS8`, `SVU-6`, `IMS6`,
   `SRG5`, `SRG10`, `SW-5`, `SW-10`, `SU-5`, `SU-10`, `ESS0`, `ESA`, `ESB`, `ESC-A|B|C`, `EPC-A|B|C`,
   `ZREG0`, `ZRLG0`. Add `sst-applet` to its `related_applets` if not already there (it is).
4. `content/en/applets/sales-workflow/internal-sales-credit-note-applet.md` and the sales-return page —
   a credit note whose lines are zero-rated or non-`PNS` is invisible to SST filing; and unfiling is not
   a clean reversal (one row per call).
5. `content/en/applets/finance/internal-purchase-invoice-applet.md` and
   `content/en/applets/sales-workflow/internal-sales-invoice-applet.md` — add `sst-applet` to
   `related_applets`, and note that for **service** tax the settlement date, not the document date,
   decides the SST period.
6. `content/en/applets/e-invoice/my-e-invoice-admin-applet.md` — worth one sentence that e-Invoice and
   SST filing share no tables and use different tax classifications (`einvoice_taxable_type_code` vs
   `tax_gst_type`), so a validated e-Invoice says nothing about the SST-02.
7. `content/en/applets/finance/tax-config-applet.md` — the duplicate identified as F-0040 in run 27 also
   links to SST; whatever merge Vincent chooses should keep `/applets/sst-applet/` pointing here.
8. `content/en/applets/applet-catalog.md` L93 and `content/en/applets/_index.md` — the two
   `/applets/sst-applet/` links now resolve (alias added this run); no edit needed, recording so the
   parity check does not flag it as an accidental alias.

## Notes for the loop

- `kb/topics/sst-filing.md` created (new slug). `kb/topics/tax-configuration.md` gained an
  `sst-filing` edge in its `related:` list.
- Two pseudonyms added to `kb/private/repo-pseudonyms.tsv`.
- METHOD candidate §48: **a "version 2 / version 3" tab is usually a regulatory-change fork, not a
  redesign.** The three SST-02 tabs differ only in a hard-coded tax-code list matching the 6% → 8%
  service-tax change. Where a screen offers numbered versions of the same report, diff the arguments the
  controller passes, not the components.
- METHOD candidate §49: **a report that "does not tally" with another report is usually live-data vs
  snapshot.** Before writing any reconciliation advice, establish for each number whether it reads the
  live document tables or a frozen copy written at some earlier action. Three unrelated tenants have
  filed the same ticket against this applet.
- METHOD candidate §50: **`@Input()` / `@Output()` on a component that `app.routing.ts` routes directly
  are dead.** Angular binds them only when the component is embedded in a template. Two of this lane's
  applets (Fixed Asset run 31, MY-SST here) have settings screens that are broken for exactly this
  reason, and the symptom is identical: `appletContainer` undefined, SAVE emits into the void. Check the
  routing table before believing a settings screen saves anything.
- METHOD candidate §51: **check the tenant provisioning seed before calling a lookup a prerequisite.**
  MY-SST looks up the `TARIFF_CODES` label list and never creates it, which reads like a bug until you
  find the Liquibase changelog that seeds it with a fixed GUID. Grep `javasdk/src/main/resources/liquibase/`
  for the code before writing "you must create X first".
- `tests/content-lint.sh` passes.

## Page 2 — `finance/statement-of-account-applet.md`

Registry `statementOfAccountApplet` "Statement of Account Applet" (TNT-USER, ACTIVE). Title unchanged;
`documentation_url` already points at this page, so no alias was needed. The existing 166-line page was
guide-voice (Quick Start, feature cards, FAQ) but — unusually for this lane — **written by someone who
had actually used the applet**: the "at least one of Sales Agent or Customer Category", the Month From
gating on `TRANSACTION_HISTORY`, and the printable-format txn type `STATEMENT_OF_ACCOUNT` all check out
against the code. Most of it survives, restructured. UTF-8 BOM preserved. Derived from the applet at
`4e98c83` and the Java backend at `1ff620ef0e`.

### Configuration classification — the positive counter-example

**Applet-local, and the main settings screen genuinely works.** Six applets in this lane have shipped
the unbound eight-toggle stub. This one has a real screen: `FieldConfigurationComponent` builds a
19-control `FormGroup`, patches it from `SessionSelectors.selectMasterSettings`, binds every control
with `[formControl]`, and SAVE dispatches `saveMasterSettingsInit`. `AppletSettingsModule` is imported.

Four-proof: 19 declared, 19 rendered, 19 persisted, **13 consumed**.

- The 13 `HIDE_HDR_*` keys each set both `hide` **and** `suppressColumnsToolPanel` on their ag-grid
  column in the Runs listing — so a hidden column cannot be brought back from the grid's own tool
  panel either. Worth documenting as a behaviour, not just a toggle.
- The six `HIDE_LINE_*` keys save and are read by nothing; the Lines grid builds its columns without
  them.
- `PRINTABLE` is owned by a *second* screen (Settings → Printable Format Settings, via
  `printable-format.effects.ts`) and consumed as the default printable format on the run, event **and**
  template forms — METHOD §28 again: enumerate every component dispatching `saveMasterSettingsInit`.
- `DEFAULT_BRANCH`, `DEFAULT_LOCATION`, `DEFAULT_COMPANY`, `DEFAULT_VALIDITY_DAYS`,
  `DEFAULT_PRICING_SCHEME` are model-only; their Default Selection screen is routed but commented out
  of the settings menu.

Also commented out of both routing and menu: Workflow Settings and Email Template. Eight further
settings routes have no menu entry, including `client-side-permission-listing`, which is the default
redirect for `settings` — and no `bl_applet_client_side_perm_dfn` rows are seeded, so it opens empty.

### The finding that matters most

**A scheduled statement run produces no lines, and records no failure.**

`StatementOfAccountEventHdrService.createRunHdrFromEventHdr` builds the run header from the event and
writes:

```java
customerCategoriesJson.put("customer_categories", customerCategoriesArray);   // L193
salesAgentsJson.put("sales_agents", salesAgentsArray);                       // L215
```

`StatementOfAccountRunLineService.processEvent` reads:

```java
eventProperties.getCustomer_categories().get("categories")   // L250
eventProperties.getSales_agents().get("agents")              // L257
```

— the key names the **manual** create form writes. Both lists come back null, so neither of the two
branches at L272 and L280 fires. Because `updateHdrFailed` is called only *inside* those branches, the
run is left with no lines **and** no `FAILED` status. Only the `companies` key matches between the two
paths, which is why the company set looks fine and the customer set is empty.

The Runs listing already handles both key shapes defensively
(`params.value?.categories_name?.join(', ') || params.value?.customer_categories_name?.join(', ')` and
`salesAgents?.agents?.length > 0 || salesAgents?.sales_agents?.length > 0`), so the divergence is known
on the UI side and unhandled on the processing side.

Matching live ticket: `gh:bigledger/blg-intranet#4254`, priority **Critical**, "[…] Statement of Account
Applet - Lines not showing", body "Lines are not showing up after creation is a data issue?". It is not
a data issue.

### Other verified facts worth keeping

1. **There is no "all customers" option.** `processEvent` has exactly two selectors — customer category,
   or sales agent — and the create form enforces it with a form-level `atLeastOneCheckedValidator`. A
   customer with no category and no `default_sales_agent` can never receive a statement.
2. The candidate-customer query per company is
   `posting_status ILIKE 'FINAL' AND date_txn < :stmtEndDate` — the **statement start date is bound as a
   parameter but never referenced in the SQL**, so an old FINAL document keeps a customer eligible.
3. The sales-agent path unions two sets: customers on FINAL documents in the period whose
   `sales_entity_hdr_guid` matches, **and every non-deleted entity whose `default_sales_agent` matches**,
   with no period or company filter on the second. The per-company intersection is what saves it.
4. **`/run/{guid}`, `/regenerate/{guid}`, `/{guid}/retry-pending-lines` and `/retry-pending-lines`
   perform no permission check** — plain `AuthenticatedTenantEndpoint` handlers with no
   `doesUserHaveAnyPermission`. The last has no GUID and sweeps every incomplete run in the tenant.
   CRUD is properly gated by `API_TNT_DM_ERP_STATEMENT_OF_ACCOUNT_*`.
5. `STATEMENT_OF_ACCOUNT_RUN_PDF_GENERATION_PROCESSOR` calls
   `processStatementOfAccountRun(Optional.empty(), conn, true)` — an **empty** GUID. It processes every
   run header in the tenant at `run_count_completed = false` and status `CREATED`, not the one its event
   named. A sweeper wearing a per-run processor's clothes.
6. `run` acts only on `CREATED`, `regenerate` only on `COMPLETED`/`FAILED`. **Nothing recovers a run
   stuck at `IN_PROGRESS`** except the retry endpoints, which only re-process lines still at `CREATED`.
   Open applet issue #1 asks for a button that does exactly what `/retry-pending-lines` already does —
   the capability exists on the server and is not surfaced.
7. **A template is never read by the server.** `template_hdr_guid` is written onto the event header, and
   `createRunHdrFromEventHdr` copies exclusively from the event header and the event's own three filter
   tables. Templates only pre-fill the event form.
8. The recurring processor takes `ACTIVE` events with `run_status = PENDING` whose `date_end` fell in the
   previous 24 hours, converts each once, and stamps `run_status = 'CREATED'`. Recurrence comes from
   `StatementOfAccountEventHdrRecurringService` expanding an RRULE into one event row per occurrence at
   save time — and applet issue #3 reports that expansion produces the wrong cycle dates.
9. Both statement dates are snapped to `startOf('month')` / `endOf('month').endOf('day')` on every value
   change, so a run always covers whole months. Every field is disabled after CREATE — a run is
   immutable.
10. E-mail recipients are the union of typed addresses plus five independently-toggled sources (entity
    main e-mail, primary address contacts, secondary address contacts, staff/family, login subjects),
    all defaulting to on; invalid addresses are dropped silently.
11. No journal, no signum, no stock, no queue beyond its own two processors. A statement reports a
    receivable position; it does not create one.

### Defects found

1. Event-to-run JSON key mismatch → scheduled runs produce nothing, silently.
2. `updateHdrFailed` is unreachable when both selectors are empty, so the run has no terminal state.
3. Four action endpoints with no permission check, one of them tenant-wide.
4. The PDF generation processor ignores the GUID it was given.
5. Six `HIDE_LINE_*` settings persist and are read by nothing.
6. The statement start date is not applied to the candidate-customer query.
7. No recovery path for a run stuck at `IN_PROGRESS`.
8. RRULE expansion produces wrong cycle dates (applet issue #3).

### Screenshots

None. `static/images/` has no `statement-of-account*` directory and the page referenced no images.
**Recapture wanted** from a GadgetSphere-seeded tenant: the Runs listing showing all 13 configurable
columns; Create Statement with Run Type = Email and the five recipient check boxes visible; the Lines
tab of a completed run; Settings → Application Settings with both accordion groups open; Settings →
Printable Format Settings; the Events listing with a recurring event.

### Cross-lane link requests (from this page)

1. `content/en/applets/master-data/customer-maintenance-applet.md` (lane 4, run 1 — done) — should say
   that a customer with **no customer category and no default sales agent** can never be included in a
   statement run, and add `statement-of-account-applet` to `related_applets`.
2. `content/en/applets/finance/debtor-report-applet.md` — cross-link, and avoid implying the statement
   and the debtor report agree line for line; a customer has reported a mismatch
   (`customer-repo-f18431#948`) and a separate aging defect on the report side
   (`customer-repo-67287b#196`).
3. `content/en/applets/master-data/entity-applet.md` — the entity's address contacts and login subjects
   are statement recipients; worth one line.
4. `content/en/applets/sales-workflow/internal-sales-invoice-applet.md` — only `FINAL` documents make a
   customer eligible for a statement; add `statement-of-account-applet` to `related_applets`.
5. Any page describing a shared-utilities ag-grid listing — `gh:bigledger/blg-intranet#4966` reports the
   grid resetting to the first page after SAVE. That is shared behaviour, not applet-specific, and no
   lane page mentions it.
6. `gh:bigledger/blg-wiki#141` is an open request for a **user guide** for this applet. The reference
   page is now the prerequisite; the guide must lead with the category-or-sales-agent constraint,
   because that is the single thing that makes a run come back empty.

### Notes for the loop

- `kb/topics/statement-of-account.md` created (new slug).
- METHOD candidate §52: **when two code paths build the same JSON column, diff their key names.** The
  manual form and the scheduled converter both populate `customer_categories` / `sales_agents` on the
  same table with different inner keys, and only the reader of one of them exists. A grid rendering
  `a || b` for the same concept is the tell that this has happened.
- METHOD candidate §53: **a processor that takes a GUID in its event properties and then calls its
  service with `Optional.empty()` is a sweeper.** Check the argument, not the class name — the
  difference between "processes this run" and "processes every run in the tenant" is one token.
- `tests/content-lint.sh` passes.

---

# Run 33 — 2026-09-06

Pages: `integrations/t2t-admin-applet.md` (rewritten), `rma/warranty-admin-applet.md` (rewritten),
`integrations/webhook-applet.md` (**unpublished**, ADR-0008 tier 1), `finance/txn-recon-applet.md`
(skipped, no registry row). `crm/unified-contact-center-ucc-applet.md` left in the queue — see
"Why UCC was not attempted" below.

## T2T Admin (`t2tAdminApplet`) — rewritten

Registry `t2tAdminApplet` "T2T Admin", ACTIVE, `documentation_url` = `/applets/t2t-admin-applet/`,
which is the page's existing alias. Title changed from "T2T Admin Applet".

**No front-end repository exists.** `gh repo list bigledger --limit 1000` returns 455 repositories
and none matches `t2t`; `grep -rl t2tAdminApplet` over `refs/` returns nothing outside the wiki's
own mirrors. The registry row points at a pre-built bundle
(`…/akaun-platform/t2t-admin-applet/prod/t2t-admin-applet-elements.js`). The page says so plainly
and documents the backend API surface instead — the standard's "still enhance from the backend +
issues + existing page" branch.

The registry row's `description` column is word-for-word the old wiki page's opening paragraph, so
it is not independent evidence of anything.

### What the old page claimed and what is actually there

| Old claim | Reality |
|---|---|
| "SOC 2, ISO 27001 compliance ready" | Unevidenced (same class as Q-0006) |
| "Up to 1,000 tenants per instance", "100 consolidation hierarchies", "50+ custom fields per tenant" | No such limit exists anywhere in the T2T code |
| Links to Consolidation, Enterprise Reporting, Compliance Management, Data Synchronization, API Gateway and Security Management applets | Six applets that do not exist |
| "Multi-entity financial consolidation", "cross-tenant transaction processing", "inter-company billing" | T2T writes link tables only. Outside the `t2t` packages the sole backend consumer of a T2T link is one customer-specific ESD ordering service |
| "Tenant provisioning, migration, archival, disaster recovery" | Not a T2T concern; the connection is an invitation between two tenants that already exist |

### What T2T actually is

Fifteen controllers under `core2/t2t/dm/`: tenant linking, business mapping (+ read-only company
and branch pickers into the other tenant), item-to-tenant permission (host and guest), item-to-item
mapping (guest and host), item labels, external teams (back-office and guest), roles /
link-team-to-role / link-perm-to-role, and an audit trail. Five tables:
`bl_t2t_comp_branch_entity_link`, `bl_t2t_item_to_item_link`, `bl_t2t_fi_item_to_tenant_link`,
`bl_t2t_fi_mst_label_link`, `bl_t2t_audit_trail_event`, plus `app_tenant_hdr` rows with
`obj_type = 'T2T'`.

The only readable T2T UI is the **T2T Item Mapping** tab in Doc Item Maintenance (three sub-tabs),
which loads the connected-tenant list before anything else — the cause of
`gh:bigledger/blg-intranet#1712` "T2T Item Mapping showing blank".

### Defects found (routed to planning/product/)

1. **No cross-database transaction.** Every two-sided write (invite, invitation response, status
   update, business mapping create/update/delete, item-to-item create/update/delete) writes one
   database, then the other with a bare DAO call, and undoes the first with a compensating
   statement if the second does not affect exactly one row
   (`TenantInvitationService.java:56-63,131-140`). Nothing reconciles a failure of the compensation.
2. **A connection row can never be removed.** `TenantInvitationController` exposes no `DELETE`
   (lines 55, 91, 152, 190, 210), and `sendInvitation`'s duplicate check matches on code and
   `obj_access` only, ignoring status (`TenantInvitationService.java:45-47`) — so a tenant that
   once rejected you can never be re-invited, only status-updated.
3. **`checkItemPerm` ignores `status`.** `T2TItemToTenantLinkUow.java:228-245` builds its query with
   `SqlGenerator.generateQueryStatementWithOneCondition`, which appends only `status != 'DELETED'`
   (`SqlGenerator.java:137-139`). Setting an item-sharing permission to `INACTIVE` does not revoke it.
4. **`getTenantPerm` sends a malformed query parameter.**
   `blg-akaun-ts-lib/.../t2t-services/t2t-tenant.service.ts:53` builds
   `…&obj_status = CONNECTED` with spaces around the `=`; the parameter name arrives as
   `obj_status ` and does not bind, so the guest-permission list is unfiltered by status.
   Its sibling `getConnectedTenants` (line 44) is correct — the two lines are three apart.
5. Unauthorised reads return the record with `status = PERMISSION_DENIED` and every other field
   stripped rather than a 403 (`TenantInvitationController.java:46-53`) — the same pattern already
   recorded for the applet registry and warranty.

### Also noticed

- `T2TAuditTrailService` is imported and never used in the e-Invoice sub-tabs of Sales Return,
  Purchase Credit Note, Purchase Self-Billed Invoice and Sales Refund Note V2 — copy-paste
  boilerplate, five files each. Harmless, but it means "someone imports the T2T audit trail" is not
  evidence that anything reads it.
- `T2TItemToTenantLinkService` is one of the few backend writes that calls `WebhookService`
  (`T2T_ITEM_TO_TENANT_LINKING_ADDED` / `_UPDATED`) — and neither code is in the seeded
  `WebhookTopics` enum, so on a stock tenant the call finds no topic row and sends nothing.

### Screenshots

None exist and none were referenced. **Recapture wanted:** the tenant-linking listing with an
`INVITED` and a `CONNECTED` row; the business-mapping screen showing self company/branch against
other company/branch; the item-to-tenant permission listing; the external-team member list; the
audit trail. All need a two-tenant sandbox, which is why none exists.

## Warranty Admin (`warrantyAdmin`) — rewritten

Registry `warrantyAdmin` "Warranty Admin", ACTIVE, `documentation_url` = `/applets/warranty-admin-applet/`
= the page's existing alias. Title changed from "Warranty Admin Applet". Repo
`blg-applet-wavelet-warranty-admin-applet` (HEAD `6f099a1`, 2026-08-30).

### Settings classification

**Shared** `FieldConfigurationComponent` — `app.routing.ts` imports it from
`projects/shared-utilities/modules/permission/field-configuration/…`, and `.gitmodules` pins
shared-utilities at `f1ded040` while HEAD is `a8c38a2`. There is **no `tabMappings` entry for
`warrantyAdmin`**, so `kb/tools/gates.py warrantyAdmin` reports 237 RENDERED controls at HEAD — the
default generic-document set. A per-key grep of the applet finds a consumer for none of them.

Four proofs pass for exactly three keys: `PRINTABLE`, `DEFAULT_COMPANY`, `DEFAULT_BRANCH` (the last
two consumed by the shared session effect `getDefaultCompanyAndDefaultBranch$`, not by the applet).
`DEFAULT_LOCATION`, `DEFAULT_SENDER_EMAIL`, `DEFAULT_APPROVED_EMAIL_TEMPLATE`,
`DEFAULT_DECLINED_EMAIL_TEMPLATE` and all 30 custom-status keys are saved and never read. Everything
else in `applet-settings.model.ts` (the `INCLUDE_*`/`ENABLE_*` dimension and tax flags, ~22 `HIDE_*`
price/quantity flags, `DISABLE_GEN_DOC_LISTING`) is model-only.

`settingItems` lists only five entries; the permission listings, Feature Visibility and the Webhook
screen have routes and no link.

### Corrections to the old page (all tier 1)

| Old claim | Evidence against |
|---|---|
| Registrations are created automatically by POS / External Sales Invoice when a serialised item is sold | Nothing outside the warranty applet and the CP Commerce storefront references `bl_wrty_product_registration_hdr` — checked across the Java backend and every UI repo in `refs/` |
| "Instant Communication: automated email delivery of certificates"; "Automate Communications … every customer gets their certificate immediately"; an FAQ about a customer not receiving the e-mail | Both the approve and the decline effect carry the literal comment `// TODO: exhaustMap to send email` (`product-registration.effects.ts:57,107`). The backend sender, the `…_SEND_EMAIL` permission and the Email Template screen all exist; the call site does not |
| "Expiry dates are computed instantly based on predefined terms"; "the system automatically calculates the Warranty Expiry Date" | `warrantyPeriod` and `warrantyExpiryDate` are plain `UntypedFormControl`s (`main-details.component.ts:21-31`); no code derives either |
| `Settings > Default Selection` sets default warranty periods in years/months/days | Default Selection holds branch, location, company, sender e-mail and two template pickers (`default-settings.component.html`) |
| `Settings > Application Settings` sets Mandatory / Visible / Read-Only per field | The shared screen has no such control for this applet and the applet reads none of its keys |
| Certificate status `EXPIRED` | `StatusColumn` has no `EXPIRED` value and no job compares `warranty_expiry_date` to today |
| "Custom Status … tailor the registration lifecycle" | The 30 keys are persisted and read nowhere; there is no custom-status control on either form |
| RMA validates active warranty when processing a claim | No RMA or service-note code reads `bl_wrty_warranty_certificate_hdr` |

Kept from the old page: that there is no add button, the approve/decline/save semantics, the tab
list, and the PENDING → APPROVED/DECLINED shape.

### New facts

- **Membership is a hard prerequisite.** `membership_hdr_guid` is validated non-null *and* looked up
  in the membership card table on create and update
  (`WarrantyProductRegistrationDataConsistencyObject.java:40-52`). Warranty registration is a
  members-only feature, and the back-office form has no control for it.
- The **CP Commerce storefront** is the only shipped creator
  (`wavelet-cp-commerce/src/app/state-controllers/warranty-store/effects/warranty.effects.ts:55-90`),
  submitting membership, entity, name, `qty = 1`, one serial number, purchase date, item and
  `approval_status = PENDING`. It blocks submission until a membership card GUID resolves.
- **Approving twice creates two certificates** — nothing checks `prod_registration_guid` for an
  existing one.
- **`approval_status` is never validated.** It appears in the codebase only as a query filter
  (`WarrantyProductRegistrationUow.java:240`).
- The `login-entity-ep` create endpoints for both registration and certificate check only
  `isUserLoginEntity(caller, entity_hdr_guid)`
  (`WarrantyProductRegistrationController.java:99-105`, `WarrantyCertificateController.java:87-105`),
  so a member's own session can post a registration in any approval status and then post a
  certificate for it. Delete on `login-entity-ep` is scoped only to ownership
  (`WarrantyCertificateController.java:205-222`).
- Attachment endpoints reuse the **registration** permission family; there is no attachment family.

### Screenshots with personal data

All four images referenced by the old page were dropped:

- `warranty-admin-applet/product-registration-listing.png` — ten rows of real first/last names, five
  distinct e-mail addresses including corporate ones, Malaysian mobile numbers, and a laptop brand
  as product data.
- `warranty-admin-applet/warranty-certificate-listing.png` — the same grid, same data.
- `warranty-admin-applet/settings-page.png` — no personal data, but **stale**: it shows "Server Side
  Permissions" and "Developer Tools" menu groups (Permission Wizard, Permission Set, User
  Permission, Role Permission, Release Notes, Audit Trail) that `settingItems` no longer contains.
- `warranty-admin-applet/warranty-admin-overview-infographic.png` — AI infographic asserting
  automated e-mail and automatic expiry calculation, both false.

**Recapture wanted** from a GadgetSphere-seeded tenant: the Product Registration listing with
synthetic members; a PENDING registration open on Main Details with the APPROVE/DECLINE buttons; the
Attachments tab; the Warranty Certificates export pane with a printable format chosen; Settings >
Default Selection (all six controls); Settings > Custom Status; the current Settings menu (five
entries only).

## Webhook applet — unpublished under ADR-0008

`content/en/applets/integrations/webhook-applet.md` set to `draft: true`; worklog entry
`planning/worklog/webhook-applet-2026-09-06-unpublish.md` carries the evidence, the salvage and the
rewrite brief. Tier 1 on content grounds alone, and there is no ACTIVE registry row either.

Every quantified claim is contradicted by `WebhookService.java` and `WebhookTopics.java`: one HTTP
POST per subscription on a fixed 4-thread pool with a 60-second connect timeout and **no retry**;
authentication is exactly one custom header (`auth_header_name` / `auth_header_value`) — no OAuth,
JWT or signing; 53 seeded topics, not "200+ event types"; no filtering, routing, transformation or
batching; the activity table is never purged, so "90 days of history" is wrong in both directions;
and there is no delivery guarantee at all, the caller never learns the outcome.

Inbound links repaired in the same pass:
`master-data/workflow-design-applet.md` (three references — one prose sentence rewritten to describe
webhook subscriptions directly, two "Related" bullets removed) and
`integrations/developer-sysadmin-applet.md` (four — the `related_applets` entry, the Where-it-fits
row, the Related-applets bullet and a Troubleshooting fix cell).

**Not repaired, outside lane 4's folders (F-0298):** `content/en/applets/applet-catalog.md` L114 and
L419 and its zh twin L100/L374 link to `/applets/webhook-applet/`, a URL the page never claimed as an
alias — those links were already broken before this unpublish.

## Registry / naming mismatches

### `finance/txn-recon-applet.md` — no registry row (skipped)

`registry-applets-2026-09-05.tsv` and the live `bl_applet_hdr` (checked 2026-09-06, including a
`property_json` search for `txn-recon` and `transaction-recon`) contain no Transaction
Reconciliation row. The nearest ACTIVE row, `paymentchannelApplet` "Payment Channel", is a different
applet: `applets/tnt/pgw/payment-channel-applet` / `payment-channel-applet-elements-` versus this
repo's `applets/wavelet/erp/transaction-recon-applet` / `txn-recon-applet-elements-`
(`organisation-constants.ts`, `app.module.ts:162`). The repo
`blg-applet-wavelet-txn-recon-applet` (HEAD `8401b04`, 2026-03-19) has working Company / Payment
Channel / Settings routes. Not rewritten per ADR-0002 / standard rule 1. The page's content matches
the repo's menu structure, so it is *not* disproven — it is unreachable, which is ADR-0007's
question, not ADR-0008's.

### `integrations/webhook-applet.md` — no registry row

Same search; nothing matching `hook` in code, name or `property_json`. Repo
`blg-applet-wavelet-web-hook-applet` (HEAD `5dcadf1`, 2026-08-30), route
`applet/tnt/wavelet/erp/web-hook-applet`, one working screen plus the standard settings shell.

**The built-but-unregistered list is now six**: Group Maintenance, E-Mandate, Team Maintenance,
Investment, Transaction Reconciliation, Webhook. Q-0009 asked about four; re-asked as Q-0022.

### `t2tAdminApplet` — ACTIVE row, no repository

The inverse case, and new: the registry says the applet exists and ships a bundle, and the
organisation holds no source for it. Raised as Q-0021.

## Why UCC was not attempted

`crm/unified-contact-center-ucc-applet.md` is 873 lines over the largest applet in the lane
(15 top-level route groups, 20 configuration screens, 60-plus `bl_alg_cc_*` tables, 24 job
processors) and carries **71 screenshots of a live contact centre**. A sample of two proves the
risk: `23d97877-…jpeg` is a Contacts listing of ~20 real Malaysian mobile numbers across WhatsApp,
SMS and Voice. A rushed rewrite would have been worse than none, so the page stays in the queue with
this run's research recorded below so run 34 starts from it.

### UCC research already done (do not repeat)

- **Two ACTIVE registry rows.** `UnifiedContactCenter` (2021, `applets/tnt/ailedger/ucc`, bundle on
  a `ucc-applet-custom-element` bucket) and `UnifiedContactCenterJava` (2026-04-02,
  `applets/tnt/ailedger/uccjava`, bundle under `bigledger/wavelet-erp/unified-contact-center`). The
  wiki page holds the *first* row's `documentation_url`. `blg-applets-ucc` (HEAD `f32d6b4f7`,
  2026-09-03) declares `mainRoute = 'applets/tnt/ailedger/uccjava'` — it is the **Java** applet;
  `alg-applets-ucc` (HEAD `adc3915e1`, 2026-04-01) declares `applets/tnt/ailedger/ucc` and is the
  older one. Which row the page documents is a decision, not a lookup.
- **Settings are applet-LOCAL** (`ucc-applet-routing.module.ts` imports
  `components/settings-container/{application-settings,field-configuration,default-settings}`).
  - **Application Settings** exposes exactly one real setting:
    `ISSUE_CATEGORY_CATEGORY_GROUP_SETTINGS_LIST` — eleven slots, each a category-group GUID plus a
    *Mandatory* flag, sourced from `bl_wf_issue_label_list_hdr` where `namespace = 'WF_CATEGORY'`.
    It passes all four proofs: consumed by
    `inbox/customer-details/issue-tracker/issue-edit/issue-edit-category/issue-edit-category.component.ts:98`
    and its template, which sets `[required]` per slot.
  - **Field Settings** is the unbound 8-toggle stub again — a 22-line component with no `FormGroup`
    and no save handler (`field-configuration.component.ts`).
  - **Default Selection** is inert in the P-0025 shape: `@Input() appletSettings$` / `@Output() save`
    on a directly-routed component, `appletContainer` declared and never assigned, so the first
    branch or location change dereferences `undefined`, and SAVE emits into the void
    (`default-settings.component.ts:29,35,53`; `default-settings.component.html:2`). **Third
    confirmation** of P-0025, after Fixed Asset and MY-SST.
  - `ISSUE_CODE_FORMAT` is declared in `applet-settings.model.ts` and rendered nowhere — model-only.
- **Channels** (`models/channel-constants.ts`): WHATSAPP, TELEGRAM, SMS, FB_MESSENGER, EMAIL, VOICE,
  LAZADA, WEB, SHOPEE, INSTAGRAM_FEED, INSTAGRAM_CHAT, LINE — twelve, not "WhatsApp, Facebook,
  Telegram and more".
- **Task model** (`models/task-constants.ts`): statuses CREATED, TEAM_ASSIGNED, AGENT_ASSIGNED,
  IN-PROGRESS, COMPLETED, CANCELLED, UNASSIGNED; actions ASSIGN_WORKER, ASSIGN_TO_ME, COMPLETE,
  CANCEL, UNASSIGN; ten event types; target types CONVERSATION, EMAIL, VOICE.
- **Menu** (`core/side-menu/content/side-menu-content.component.html`): Task Queue (All/Team/My),
  Task Queue Outbound (All/Team/My), Inbox (All Tasks / All Conversations / All Active Conversations
  / My Team Tasks / My Tasks / Active Tasks / My Conversations / My Active / My Team Conversations),
  Outbound, Quality, Outbound Queue Sales Lead, Social Media, Dashboard, Reports (Task/Agent/
  Conversation/User), My-Profile, Contacts, Broadcast, Live Dashboard (Online Agent / All Agents /
  Active Tasks), Task Router (Router Queue / Tasks), Configurations. `models/menu-items.ts` is
  boilerplate leftovers (Company / Dashboard / "Generic Example") and is **not** the real menu.
- **Configurations** sub-routes: projects, virtual-contacts, squads, template-messages, qr-codes,
  agents, teams, outbound-task, automation-rule, rule, skill, action, quality-control.
- **Backend**: `core2/tnt/dm/alg/cc/…` — 28 controller packages (action, agent, api, channel,
  contextMsg, conversation, email, endpoint, facebookFeed, link, message, project, qc, qrCode,
  reports, rule, ruleAction, session, shoppingCart, squad, statistics, task, taskQueue,
  templateMessage, tenant, virtualContact, voice, voucher) and 24 job processors under
  `jobProcessor/alg/cc/` including skill-based and team assignment, expired-task sweepers, campaign
  send, Shopee/Lazada authentication and conversation sync, e-mail send, and QC line generation.
- **Live data is not all in Postgres**: `models/firestore-models/` holds conversation, message,
  session, e-mail thread, Facebook post/comment/reaction and voice-call models, and `app.module.ts`
  initialises `AngularFireModule` / `AngularFireMessagingModule`. There is also an
  `inbox-socket.service.ts` WebSocket. Any rewrite must say where a conversation actually lives.
- Related repos: `akn-kotlin-ucc-app` (a Kotlin Multiplatform mobile client, HEAD 2026-09-03),
  `blg-ucc-lambda-functions` (channel webhooks, HEAD 2025-08-29), and one customer-branded fork —
  cite that one by pseudonym.

## Cross-lane link requests (from this run)

1. `content/en/applets/master-data/doc-item-maintenance-applet.md` (lane 4, run 1 — done) — the T2T
   Item Mapping tab is blank when no tenant connection exists (that is the whole of
   `gh:bigledger/blg-intranet#1712`), and an item can be in only one pair per connection per
   direction. One callout.
2. `content/en/applets/rma/internal-rma-applet.md` (lane 4, run 31 — done) — its Where-it-fits row
   "Warranty and expiry dates on the service note" implies an automated link. Nothing in RMA reads
   `bl_wrty_warranty_certificate_hdr`; the row should say the check is manual. (F-0301)
3. `content/en/applets/external-tenant-admin/tenant-admin-applet.md` (lane 3) — add `t2t-admin-applet`
   to `related_applets`; T2T administers the relationship *between* tenants, this one administers a
   tenant.
4. `content/en/applets/master-data/organisation-applet.md` (lane 4, run 17 — done) — add
   `t2t-admin-applet`: business mapping pairs this applet's companies, branches and entity lines
   across a tenant connection.
5. `content/en/applets/master-data/entity-applet.md` (lane 4, run 1 — done) — one line that
   `login-entity-ep` endpoints across the platform (warranty, RMA requests, e-commerce) are gated
   only by "is the caller this entity", not by a permission code. It is a recurring shape and no
   page explains it.
6. Any page describing CP Commerce — warranty registration through the storefront is **members-only**
   and silently retries until a membership card GUID resolves.

## Notes for the loop

- Ledger: two records appended to `kb/sources/applet-repos/ledger.lane-4.jsonl`.
- Topics: `kb/topics/tenant-to-tenant-linking.md` and `kb/topics/warranty-registration.md` (both new).
- METHOD candidate §54: **an ACTIVE registry row is not proof that source exists.** Before writing a
  page, check `gh repo list` for the applet slug as well as `refs/`; T2T Admin ships a CDN bundle
  from no repository in the organisation. When that happens the honest page documents the API and
  says the screens cannot be documented.
- METHOD candidate §55: **grep the storefront, not only the applets, for who creates a record.**
  Warranty registrations are created by `wavelet-cp-commerce`, and the applet that "owns" them can
  only PUT. A listing with no add button is the tell.
- METHOD candidate §56: **a `// TODO` in an effect is a documentable fact.** Two literal
  `// TODO: exhaustMap to send email` comments are the whole reason a shipped Email Template screen,
  three e-mail settings, a backend sender and a dedicated permission code do nothing.
- METHOD candidate §57: **check the query string as well as the criteria object.** A single stray
  space in `…&obj_status = CONNECTED` silently drops a filter that every reader of the code assumes
  is applied.

### Screenshots with personal data

All 60 come from `content/en/applets/crm/unified-contact-center-ucc-applet.md`, whose references
were removed in this run and replaced by a withheld-screenshot note. Audited image by image; the
eleven not listed here (dashboards, empty filter grids, count tiles, an empty broadcast form, the
channel drop-down, the own-brand social-media page list) were kept.

- `ucc-applet/02f60dce-af0a-4dcc-8df3-51390ace1dcf.jpeg` — WhatsApp inbox: real names and phone numbers
- `ucc-applet/1011f5ca-9416-4b7e-8d61-d8b5a006df43.jpeg` — task grid: names, phones, e-mail addresses
- `ucc-applet/1abf02b9-26d0-424b-b0c6-34c5845d956f.jpeg` — task queue: e-mail address and personal names
- `ucc-applet/1c1f603d-fb78-4cd5-b604-379b7bac70fe.jpeg` — Facebook feed: real post content and page id
- `ucc-applet/1d12d08d-6b3b-47af-8f09-efce59063c6e.jpeg` — conversation list: names and phone numbers
- `ucc-applet/206ac5ee-5cca-414f-a2aa-ad2bd9c68fc8.jpeg` — chat transcript with a real contact name
- `ucc-applet/23d97877-0a52-4990-8b54-90fec9fcb59a.jpeg` — contacts grid: ~20 real Malaysian mobile numbers
- `ucc-applet/24927c55-9a9c-4557-aaf7-aa9dfd93232b.jpeg` — task grid: personal names and a marketplace brand
- `ucc-applet/2903b931-dc87-4c2a-aabd-13c13d080ddb.jpeg` — task grid: personal names and a marketplace brand
- `ucc-applet/2ac8f14f-776f-4f65-b5b7-edb6728fff71.jpeg` — inbox listing: names and phone numbers
- `ucc-applet/2ce26485-ea11-4e93-9338-a95f2de2f8b2.jpeg` — task queue: personal name, marketplace channel
- `ucc-applet/2f06004a-ba70-4a1d-bcdd-267e6eb3dfd2.jpeg` — team queue: names, phones, e-mail addresses
- `ucc-applet/2fa13312-c842-4bb1-b5db-8bd1b020da3d.jpeg` — inbox: phones, e-mail, a customer document
- `ucc-applet/3316b124-d5ce-423d-a3fe-03867674cccd.jpeg` — broadcast contact picker listing real contacts
- `ucc-applet/33f85d62-f031-404c-a2ca-8dd03a5e72fd.jpeg` — contacts grid of real phone numbers
- `ucc-applet/35c3a67e-3a94-41e4-85c7-d886d4487233.jpeg` — task queue: e-mail, names, marketplace
- `ucc-applet/3f13dd0e-e1f3-46db-b07f-94f62034c8da.jpeg` — filter panel over an inbox showing real names
- `ucc-applet/4067eff8-5efe-41a6-aeab-d715f4ea70be.jpeg` — task report grid: names and brands
- `ucc-applet/43d575f8-e9a3-4fea-b14b-9c3a848695ee.jpeg` — outbound queue: real e-mail addresses
- `ucc-applet/47597bf1-de06-4f40-893f-9713d349a1d3.jpeg` — Facebook feed: real post content
- `ucc-applet/516cb2fa-9199-4bb6-abf8-f00934b74b87.jpeg` — outbound queue: real e-mail addresses
- `ucc-applet/5bbcad7b-e35e-41c2-b692-2a4f959da693.jpeg` — inbox listing: names and phone numbers
- `ucc-applet/5ccca342-bc9b-436f-8fc8-d780df769e88.jpeg` — contacts grid plus an edit-contact phone number
- `ucc-applet/5e564a41-338c-463b-9bef-9702dcbbddb5.jpeg` — agent picker listing real agent names
- `ucc-applet/60226237-8106-49e6-9dae-74cf072855db.jpeg` — task queue: e-mail and personal name
- `ucc-applet/60acc284-be89-4834-89bc-d938beb5e572.jpeg` — Facebook feed: real post content
- `ucc-applet/650eb7f1-e7a2-4e9a-9ca8-f134e7722c88.jpeg` — agent listing with real first names
- `ucc-applet/6851f654-4c2d-4485-a4ee-e75c75b37d03.jpeg` — contacts grid of real phone numbers
- `ucc-applet/696bd24a-cf60-4cf1-b50a-7c90f84c1751.jpeg` — outbound queue: real e-mail addresses
- `ucc-applet/6c3a7b93-ab25-4ea4-8cbf-3f885e41f9f7.jpeg` — agent picker listing real agent names
- `ucc-applet/6e25ae4e-34f4-4e7d-9b86-475425ff0d12.jpeg` — chat plus a personal-info panel and username
- `ucc-applet/794bdad6-3dc5-44ce-a763-075e3426fe44.jpeg` — chat plus a contact name and phone number
- `ucc-applet/7b30c7b4-38cc-42d9-8a3f-50dd319fe6a6.jpeg` — broadcast form showing a real phone endpoint
- `ucc-applet/7f76c17d-8358-4f2e-9ea3-913bda26a0d4.jpeg` — endpoint drop-down listing real phone numbers
- `ucc-applet/85c5123b-d7a3-494f-bc3f-e754f09e85c7.jpeg` — live agent grid: customer names and phones
- `ucc-applet/8739cf78-a47e-4368-b561-ddd517996343.jpeg` — outbound queue: real e-mail addresses
- `ucc-applet/87fff6ae-a9c8-452d-9e57-8258c7971571.jpeg` — chat transcript with a real contact name
- `ucc-applet/8d5ae225-9f6e-4cb1-a5cc-546fc36b417a.jpeg` — message search results: phones, e-mails, message text
- `ucc-applet/95e6194e-5a5f-4c14-adad-7114f99ca4c0.jpeg` — contacts grid of real phone numbers
- `ucc-applet/967b836a-6abd-412b-8ff0-538a1394f048.jpeg` — agent report grid with real agent names
- `ucc-applet/99ed0bcd-4e1e-451d-a297-b5883c2ac5ce.jpeg` — user profile with a real name and e-mail
- `ucc-applet/9b48ed3e-e61f-4999-9984-cc6f82f4933c.jpeg` — task queue: e-mail and personal names
- `ucc-applet/a9de6003-56ff-4454-8b1b-1a69a56e98c2.jpeg` — task edit: personal name, marketplace
- `ucc-applet/ae77ad3e-7657-4d13-adc5-f3ba9802d00d.jpeg` — task queue: e-mail and personal names
- `ucc-applet/b0c672b0-ffb8-4c5f-b0eb-dfc0450b5f7e.jpeg` — live agent grid: customer names and phones
- `ucc-applet/c05c001a-dcdb-4fd7-a8d7-8d5d12377fdc.jpeg` — live agent grid: customer names and phones
- `ucc-applet/d628631d-3c88-40ad-9e16-83d64e62aef2.jpeg` — inbox: names, phones, a customer document
- `ucc-applet/db51a49e-fed9-40f6-810d-749d888f77b1.jpeg` — task queue: customer and agent names
- `ucc-applet/dda65f67-d7e4-4a50-b09f-315b5337a70a.jpeg` — task edit: personal name, marketplace
- `ucc-applet/e1ae74bb-827b-4fb4-b57a-0c4d13b9eaf9.jpeg` — task queue: personal name, marketplace
- `ucc-applet/e3bb770a-dfdd-4cfb-82de-bad7eb32c6a9.jpeg` — team queue: names, phones, e-mail addresses
- `ucc-applet/e422c4be-44d5-482f-9604-fb0cabfc8d5e.jpeg` — Facebook feed: real post content
- `ucc-applet/e586c8cc-5024-4111-8e3a-1ec665ffe4f3.jpeg` — team queue: names, phones, e-mail addresses
- `ucc-applet/e62a205e-6882-449b-bef1-54e78ea30ff4.jpeg` — broadcast form with a phone number and contact name
- `ucc-applet/e91298aa-3164-438a-9fcf-c479c35a4ea5.jpeg` — task queue: customer and agent names
- `ucc-applet/e9fc3ee7-f1ee-4ac7-9c78-51081afacf29.jpeg` — contacts grid plus an edit-contact phone number
- `ucc-applet/f6d1faec-bd36-4620-84b6-a82bf21cc194.jpeg` — user profile with a real name and e-mail
- `ucc-applet/f98db44f-b5f3-4e40-8173-9b9922222ada.jpeg` — inbox listing: names and phone numbers
- `ucc-applet/fc433fe4-3984-4efb-8575-de979c9f87a9.jpeg` — task queue: e-mail, name, marketplace
- `ucc-applet/fe06ff40-d1fd-4bd3-88e4-5ed5af02c07e.jpeg` — agent status grid showing a real agent name

**Recapture wanted** from a synthetic tenant seeded with GadgetSphere contacts: the Contacts
listing; the Inbox conversation view on WhatsApp; All / Team / My Task Queue listings and their
bulk-action menus; the outbound task queue; the task edit screen; the agent and task reports; the
Live Dashboard agent grids; My Profile with its QR code; the broadcast recipient picker; the
Facebook feed. That is most of the page, which is why the UCC rewrite needs a screenshot session
before it can be finished.
### UCC page — privacy fix applied without a rewrite

`crm/unified-contact-center-ucc-applet.md` was **not** rewritten (see "Why UCC was not attempted"),
but the 60 unsafe `{{< figure >}}` references above were removed in this run and replaced by
*"(Screenshot withheld: the original showed live customer data. A replacement from a synthetic
tenant is on the recapture list.)"*. The 11 safe images stay. Nothing else on the page was touched,
so the rewrite in run 34 starts from the same prose.

The page stays in the queue. Its files are listed under "Screenshots with personal data" above so
`kb/tools/quarantine-images.sh 4` moves them; they are now unreferenced, so the tool will not skip
them.

---

# Run 34 — `crm/unified-contact-center-ucc-applet.md` (the whole run)

Registry row `UnifiedContactCenter`, repo **`alg-applets-ucc`** at `adc3915e1` (2026-04-01), backend
`blg-akaun-platform-java` at `1ff620ef0e` (2026-09-05). 873 lines of screenshot walkthrough replaced
by a reference page built from source. Run 33's research below was used and, in two places,
corrected.

## Two corrections to run 33's UCC notes

1. **The repo choice is settled, not a decision.** `alg-applets-ucc/…/shared/shared.module.ts:175`
   declares `mainRoute = 'applets/tnt/ailedger/ucc'` — the row the wiki documents.
   `blg-applets-ucc/…/shared.module.ts:167` declares `…/uccjava`, whose registry row is
   `UnifiedContactCenterJava` and is listed in `planning/private/applet-exclusions.tsv` as
   `internal-tool`. So the page is written from `alg-applets-ucc`, and the newer repo is not named
   on the page. What *is* a question is that the documented repo has been frozen since 2026-04-01
   and all work continues in the excluded one — raised as **Q-0050**.
2. **"Live data is not all in Postgres … Firestore" is wrong.** There is no Firestore. The
   `models/firestore-models/` folder name is a legacy misnomer; those models are serialised over
   HTTP to `core2/tnt/dm/alg/cc/`, and the backend stores them in a **per-tenant MongoDB** through
   `MongoTemplate` (`javasdk/…/alg/cc/cudServices/ConversationResourceService.java:29-60`; 28 Mongo
   `dal/table` classes). `app.module.ts` initialises `AngularFireModule` **only** for
   `AngularFireMessagingModule` — browser push, topic code `UCC_MESSAGE_RECEIVED`. Run 33's menu
   list also included nine commented-out items (All Conversations, All Active Conversations, My
   Conversations, My Active, My Team Conversations, Squads, configuration Tasks, Action, the whole
   Outbound Queue section); the real menu is in the page.

## Configuration classification (METHOD §1, §29)

**Applet-local, and only one real setting.** `ucc-applet-routing.module.ts:105-125` routes
`application-settings`, `field-settings` and `default-selection` to this applet's own
`components/settings-container/`. Four proofs pass for exactly one key:

- `ISSUE_CATEGORY_CATEGORY_GROUP_SETTINGS_LIST` — declared in `applet-settings.model.ts`, rendered
  as eleven `Category Group N` selects each with a *Mandatory* checkbox
  (`application-settings.component.html:16-34`), persisted by `saveMasterSettingsInit`
  (`application-settings.component.ts:111`), consumed by the Issue Tracker edit-category component.
  Options come from `bl_wf_issue_label_list_hdr` where `namespace = 'WF_CATEGORY'` (`:70-80`).
- `ISSUE_CODE_FORMAT` — loaded into `issueCodeFormats` at `:37-39` and rendered nowhere. Model-only.
- Field Settings — the unbound 8-toggle stub again (22 lines, no `FormGroup`, no save handler; the
  toggles are Unit Discount / SST-VAT-GST / WHT / Blanket Order / Segment / G-L Dimension / Profit
  Center / Project, copied from a document applet).
- Default Selection **and** Personalization → Default Selection — both the P-0025 shape.
  **Fourth and fifth confirmations**, after Fixed Asset, MY-SST and Warranty. The personalization
  one even keeps its load-subscribe commented out (`personal-default-settings.component.ts:31-39`).

## The finding that matters most: UCC is the positive case for client-side permissions

67 `CLIENT_SIDE_PERM` rows exist for `UnifiedContactCenter` in `bl_applet_client_side_perm_dfn`
(read-only query against akaun_master). Every other applet in this programme has found codes checked
in the client and never seeded (F-0044), which makes the whole mechanism look decorative. It is not:
the granted list is fetched per subject and applet from that table
(`client-side-permission.effects.ts:29-38`) and the selector tests membership
(`client-side-permission.selectors.ts:22-26`). **Where the rows exist, the gates work.**

Which makes the gaps here diagnosable rather than mysterious:

- 4 seeded codes are never checked: `ACTION_VIEW`, `AGENT_DELETE`, `AGENT_UPDATE`,
  `PREDEFINED_MESSAGE_ENDPOINT_VIEW`.
- 13 checked codes have no row: `LIVE_DASHBOARD_VIEW`, `SKILL_{VIEW,UPDATE,DELETE}`,
  `PROJECT_DRIVE_{VIEW,CREATE,DELETE}`, `TASK_ROUTER_VIEW`, `TASK_ROUTER_QUEUE_{UPDATE,DELETE}`,
  `TASK_ROUTER_QUEUE_{RULE,SKILL}_VIEW`, `TASK_ROUTEER_QUEUE_CREATE` (sic).
- Five menu items are gated by a permission that does not describe them. Live Dashboard and Task
  Router → `BROADCAST_MENU_VIEW`; Teams and Quality Control → `SQUAD_VIEW`; Outbound Tasks →
  `TASK_VIEW` (`side-menu-content.component.ts:111-140`). `LIVE_DASHBOARD_VIEW` is computed and then
  never used in the template — a copy-paste that leaves a real permission dead.
- `taskRouterViewPerm$` and `skillViewPerm$` are hard-wired `of(true)` (`:37,:45`).

The method note: **when a permission code fails, check the definition table before the code.** A
missing row and a wrong gate look identical from the UI, and only one of them is fixable by an
administrator.

## Other verified facts worth keeping

- **Twelve channels**, not "and more": the applet enum has INSTAGRAM_FEED, the ts-lib copy does not.
- **Broadcast**: channel list = every configured channel minus VOICE and WEB
  (`broadcast-create.component.ts:52-59`), but compose panels exist for five
  (`broadcast-create.component.html:40-54`). Recipients from the contact list or a `.txt`/`.csv`
  upload; the endpoint drop-down is the virtual contact's endpoints filtered to the chosen channel.
- **Task Router is misnamed in the old page**: Router Queue lists `bl_alg_cc_queue_hdr` (the
  queues); Tasks lists `bl_alg_cc_task_hdr` at every status.
- **Customer panel**: 12 tabs verified from the template, Membership commented out, Media Library
  and Product hidden on voice. Information has 8 sub-tabs including Campaign History and
  Conversation Instance History, which the old page never mentioned.
- **Social Media**: three tabs, two routes, and the Instagram and Twitter tabs point at `../emails`
  and `../voice`. No YouTube anywhere — the old page's "6.2 YouTube (under development)" was
  invented.
- **Contacts** are `bl_crm_contact_hdr` rows; **teams** are `app_mst_grp_hdr` rows. Neither is
  UCC-private.
- **Routing**: rules by priority → matched action → automation rule's default rule → assign to any
  agent with fewest tasks. 13 action types declared, 9 implemented inbound, 1 (ASSIGN_TO_TEAM)
  outbound.
- **Expiry**: `ExpiredTaskQueueDeletionProcessor.processEvent` is entirely commented out behind
  *"Kindly fix this code before redeploying, since this is causing the entire platform to break"*.
  The scheduler and reader still run, so the chain looks alive.
- **Endpoint credential matrix** (providers, which need access id / auth token / API key) is in the
  page; it is the single most useful thing on it for a reader configuring a channel.
- **WebSocket**: API-Gateway URL with `room=main`, reconnect after 2s, refresh every 8 minutes,
  24-hour timeout. **Availability toggle** starts at OFFLINE on every load and only sends over the
  socket — it is not seeded from the server.

## Defects found (routed to planning/product/)

- **P-0075** expiry chain never completes · **P-0076** three action types silently dropped ·
  **P-0077** the Automation Rule screen cannot create the rule set the processor looks up ·
  **P-0078** two Social Media tabs point at non-routes · **P-0079** broadcast offers channels with
  no compose panel · **P-0080** five menu gates do not match their labels, 13 unseeded codes, and a
  route guard that never denies · **P-0081** two more P-0025 instances plus the Field Settings stub ·
  **P-0082** a Telegram/Facebook contact cannot be created with its platform id.

## Screenshots

All 60 unsafe images stay quarantined. The 11 survivors were re-checked image by image in this run
before use — none shows a name, number, address or customer brand; the tenants shown are
`DEVELOPMENT_TENANT` and `STAGING_TENANT` and the only social page is BigLedger's own. All eleven
are placed in the rewritten page: summary tiles ×2, Social Media ×2, Dashboard ×3, Reports ×2,
Broadcast ×2.

**Recapture still wanted** (F-0341), on a synthetic tenant: Inbox conversation view and the customer
panel's tabs, All/Team/My task queues and their bulk-action menus, the outbound queues, the task
edit screen, Contacts listing and create, My Profile and its QR code, the Live Dashboard grids, the
Task Router screens, the Quality screens.

Note for whoever recaptures: the surviving screenshots are from an April 2026 build and already
differ from the source at HEAD — they show no *Quality* and no *Task Router* menu entry. The page
describes the menu from source, not from the screenshots.

## Cross-lane link requests (from this page)

1. `content/en/applications/unified-contact-center.md` (not an applet-lane folder) — read it against
   the rewritten reference page; it probably repeats the automatic-contact-merging and Task Router
   claims removed here, and possibly the YouTube one. (F-0342)
2. `content/en/applets/ecommerce/shopping-cart-applet.md` — add `unified-contact-center-ucc-applet`
   to `related_applets`: an agent creates a cart from inside a conversation, and the in-conversation
   commerce menus are under triage internally, so the cart page should not present that path as
   settled.
3. `content/en/applets/master-data/customer-maintenance-applet.md` — one line that contact-centre
   contacts are the same `bl_crm_contact_hdr` rows, created with source `AI_LEDGER`, and that
   merging a conversation to a CRM contact is a manual act by an agent.
4. `content/en/applets/e-invoice/my-e-invoice-admin-applet.md` — the conversation E-Invoice panel is
   a second entry point for requesting an e-invoice; it is under internal triage.
5. `content/en/applets/membership/membership-admin-applet.md` — membership is one of the four link
   targets of Contact Merging.
6. Any architecture or developer page that states tenant data is PostgreSQL — contact-centre
   conversation data is MongoDB, per tenant.

## Notes for the loop

- Ledger: one record appended to `kb/sources/applet-repos/ledger.lane-4.jsonl`
  (`applet:UnifiedContactCenter`), with six lateral issue notes.
- Topic: `kb/topics/unified-contact-center.md` (new).
- Worklog: `planning/worklog/2026-09-06-lane4-ucc-applet-rewrite.md` — ADR-0008 tier 1, five
  fragments removed verbatim.
- METHOD candidate §58: **when a client-side permission does nothing, query
  `bl_applet_client_side_perm_dfn` before reading the component.** A code with no definition row and
  a gate wired to the wrong code are indistinguishable in the UI. UCC has both, and 67 seeded rows
  that prove the mechanism works.
- METHOD candidate §59: **a folder name is not evidence of a datastore.** `models/firestore-models/`
  in UCC holds plain HTTP DTOs; the store is MongoDB, and the only Firebase module imported is
  messaging. Trace the service, then the backend `*ResourceService`, before naming a database.
- METHOD candidate §60: **read the menu template, not the menu model.** `models/menu-items.ts` in
  UCC is boilerplate (Company / Dashboard / "Generic Example") and the real menu is 500 lines of
  `side-menu-content.component.html` — with nine commented-out entries that an unwary reader would
  publish as features.
- METHOD candidate §61: **`// TODO` applies to Java too.** The pattern found in Angular effects
  (Warranty) recurs in a job processor: a whole `processEvent` body commented out with a note that
  it broke the platform, while the scheduler that feeds it still runs.
