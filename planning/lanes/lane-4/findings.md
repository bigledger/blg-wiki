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
