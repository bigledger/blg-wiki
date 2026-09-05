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
