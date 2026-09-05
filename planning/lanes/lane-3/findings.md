# Lane 3 findings

Folders: purchase-workflow, ecommerce, e-invoice, delivery-installation, external-tenant-admin

## Cross-lane link requests

- **sales-workflow/internal-sales-debit-note-applet.md** (lane owning sales-workflow): add `internal-purchase-debit-note-applet` to `related_applets`. Its "Core Concept" callout says the auto-created Purchase Debit Note makes the buyer "owe +RM 500"; the backend posts the Purchase Debit Note as Dr Creditor / Cr Purchase (amount signum +1), i.e. the buyer's payable goes *down*. Please soften that claim to "creates a matching Purchase Debit Note (Internal) in the buying company" until the question below is answered.
- **finance/internal-purchase-invoice-applet.md**, **finance/internal-payment-voucher-applet.md**, **finance/creditor-report-applet.md**: add `internal-purchase-debit-note-applet` to `related_applets` (Search Document pulls PI lines; PDN and PV are the two settlement doc types against PIs in PurchaseReportUow).
- **master-data/chart-of-account-applet.md**, **master-data/doc-item-maintenance-applet.md**, **master-data/tax-configuration-applet.md**, **master-data/supplier-applet-1.md**, **master-data/organisation-applet.md**: add `internal-purchase-debit-note-applet` to `related_applets`.

- **sales-workflow/internal-sales-credit-note-applet.md**: add `internal-purchase-credit-note-applet` to `related_applets` (intercompany SCN → PCN pairing in IntercompanyProcessingService).
- **purchase-workflow/supplier-delivery-order-applet.md** (this lane, later in queue) and **finance/internal-purchase-invoice-applet.md**, **finance/internal-payment-voucher-applet.md**, **finance/creditor-report-applet.md**, master-data pages listed above: also add `internal-purchase-credit-note-applet`.

- **sales-workflow/internal-sales-order-applet.md**: add `internal-purchase-order-applet` to `related_applets` (intercompany PO ↔ SO pairing).
- **finance/internal-purchase-invoice-applet.md**, **master-data/pricebook-applet.md**, **master-data/workflow-design-applet.md**, **master-data/employee-applet.md**: add `internal-purchase-order-applet` (PI knocks off PO lines; pricing schemes; workflow; designations for approval).

- **sales-workflow/internal-sales-return-applet.md**: add `internal-purchase-return-applet` (intercompany PR ↔ SR pairing).
- **master-data/inv-item-maintenance-applet.md**, **finance/internal-purchase-invoice-applet.md**, **finance/internal-payment-voucher-applet.md**, **finance/creditor-report-applet.md**: add `internal-purchase-return-applet`.

## Registry / naming mismatches

- None for the four pages processed: all had ACTIVE registry rows. Titles corrected to the registry names (dropped the trailing " Applet"): Purchase Debit Note (Internal), Purchase Credit Note (Internal), Purchase Order (Internal), Purchase Return (Internal).
- Registry `documentation_url` for `internal_purchase_debit_note_applet` still points at the old Confluence page rather than the wiki (not a page problem; for the parity check / product-side update).

## Undocumented applets encountered

- `internalconsignmentGRNApplet` — "Consignment GRN Applet (Internal)", ACTIVE, has no wiki page under purchase-workflow (the queue has `internal-consignment-return-applet.md`, whose registry row I have not resolved yet).
- `Buyer - Delivery Order`, `Supplier - Delivery Order`, `Transporter- Delivery Order` (CORE1 revision rows) — ACTIVE, no pages; unclear whether they are live applets or legacy CORE1 stubs.

## Questions for Vincent

- **Purchase Debit Note posting direction.** Code: `InternalPurchaseDebitNoteDataConsistencyObject` fixes amount signum **+1**, so `JournalPostingService` posts Dr Creditor / Cr Purchase (AP down), and `PurchaseReportUow` lists `INTERNAL_PURCHASE_DEBIT_NOTE` next to `INTERNAL_PAYMENT_VOUCHER` as settlement against purchase invoices. Purchase Credit Note is **−1** (AP up, same side as an invoice). The old wiki pages said the opposite for both. I rewrote the PDN page to match the code. Please confirm this is the intended product semantics (buyer-issued notes) before the PCN page is rewritten the same way.
- **Intercompany mirror signs.** `IntercompanyProcessingService` pairs Sales Debit Note (+1, AR up) → Purchase Debit Note (+1, AP down) and Sales Credit Note (−1, AR down) → Purchase Credit Note (−1, AP up). The pairs are name-matched but financially opposite. Bug, or intended? This decides what the sales-side pages may claim.

## Notes

- Coordinator instruction (2026-09-05) for the e-invoice pages (my-e-invoice-admin, my-e-invoice-portal, mypeppol-admin, e-invoice/website-builder/user-permission-manager): read `refs/blg-intranet/content/1100-malaysia-einvoice/` and the ~560 blg-intranet e-invoice issues first; internal source — facts only, anonymised, images checked before reuse. Recorded in state.json `notes` so the next run applies it; not reached in this run.

- Applet UI repos reference `projects/shared-utilities` as a git submodule that is *not* checked out inside each applet clone; the shared settings screen (`FieldConfigurationComponent`, 8,300-line template) lives in `/home/marketing/repos/refs/blg-shared-utilities`. Settings toggles there are labelled by their key, so the wiki uses the key as the setting name.
- The five `SHOW_GENDOC_*_BUTTON` / `SHOW_CLONE_BUTTON` / `SHOW_FILE_IMPORT_MENU` client-side permissions are checked by the purchase-side applet code but are not seeded in `bl_applet_client_side_perm_dfn` for `internal_purchase_debit_note_applet`; the page tells admins to create them.

---

## Run 2 (2026-09-05) — Purchase GRN (Internal)

### F-0038 — stock-movement direction, answered from the backend

The `*DataConsistencyObject` signums are unambiguous:

| Document type | File (javasdk …/validator/FinancialDocDataConsistencyObject/) | Amount signum | Quantity signum |
|---|---|---|---|
| `INTERNAL_PURCHASE_GOODS_RECEIVED_NOTE` (Purchase GRN) | `InternalPurchaseGoodReceivedNoteDataConsistencyObject.java` | 0 | **0** |
| `INTERNAL_PURCHASE_GRN_STOCK_IN` (Purchase GRN Stock In) | `InternalPurchaseGrnStockInDataConsistencyObject.java` | −1 | **+1** |
| `INTERNAL_PURCHASE_INVOICE` (Purchase Invoice) | `InternalPurchaseInvoiceDataConsistencyObject.java` | −1 | **+1** |
| `INTERNAL_PURCHASE_INVOICE_NO_STOCK_IN` | `InternalPurchaseInvoiceNoStockInDataConsistencyObject.java` | −1 | 0 |

Corroboration: `InventoryTransactionLineProcessorService.createInventoryTxnFromGenericDoc` skips lines with quantity signum 0 (so a FINAL GRN writes no `bl_inv_txn_line`); `JournalPostingTypeHandler` has no handler for the GRN type but has one for GRN Stock In (`CREDITOR_NOT_INVOICED`, `INVENTORY_NOT_INVOICED`, …); the applet's own `AppletConstants` says 0 / 0; `GenericDocumentConverterFactory` pairs GRN → PI and GRN Stock In → PI No Stock In. Lane 2's PI page already says "the standard GRN does not move stock" — the GRN page now agrees. The old GRN page's "inventory updates automatically upon finalization" claim is gone.

Still saying the old thing (outside my lane): `content/en/modules-v2/purchasing/_index.md` lines 18, 44, 55 ("automated inventory stock-in", "Stock Increased (Physical stock-in) / GRNI accrual"); `content/en/guides/purchasing-guides/standard-procurement-workflow.md` (~line 1084 "GRN confirmed, inventory updated"); `content/en/guides/purchasing-guides/direct-grn-workflow.md` ("receive goods directly into inventory", Dr Inventory journal at ~line 397). Those descriptions are correct only for the GRN Stock In applet.

### Cross-lane link requests

- **sales-workflow/internal-sales-invoice-applet.md**, **sales-workflow/internal-outbound-delivery-order-applet.md**: add `internal-purchase-grn-applet` to `related_applets` (intercompany SI → GRN and outbound DO → GRN pairs in `IntercompanyProcessingService`, both 0 / 0).
- **inventory-workflow/stock-availability-applet.md**: add `internal-purchase-grn-applet` to `related_applets` (already named in its Where-it-fits table; `grn_qty` / `grn_draft_qty` columns come from GRN open-queue rows and DRAFT GRN lines).
- **finance/internal-purchase-invoice-applet.md**: already links the GRN both ways; no change. It could mention that the company gendoc flow config's `doc_2_posting_status` decides whether the auto-generated invoice is DRAFT or FINAL.
- **master-data/inv-item-maintenance-applet.md**, **master-data/pricebook-applet.md**: add `internal-purchase-grn-applet`.
- **modules-v2/purchasing/_index.md** and the two purchasing guides above: correct the GRN stock-in / GRNI wording (see F-0038).

### Registry / naming mismatches

- `internalPurchaseGrnStockInApplet` ("Purchase GRN Stock In Applet (Internal)") has `documentation_url` pointing at `/applets/internal-purchase-grn-supplier-access-applet/` — the wrong page (product-side fix).
- Title corrected: "Purchase GRN (Internal) Applet" → "Purchase GRN (Internal)".

### Questions for Vincent

- **FINAL/VOID per-user override in the GRN applet.** `showFinal()` and `showVoid()` read only `HIDE_GENDOC_FINAL_BUTTON` / `HIDE_GENDOC_VOID_BUTTON`; only DISCARD ORs in its `SHOW_GENDOC_DISCARD_BUTTON` permission. The registry seeds `SHOW_FINAL_BUTTON` (never read by the code) and does not seed `SHOW_GENDOC_*`. The page states this as-is. Is this a product bug to raise, or intended?
- **Orphaned image.** `static/images/internal-purchase-grn-applet/internal-purchase-grn-overview-infographic.png` is an AI-generated infographic with garbled text ("Paperwork Bap", "PD metaluio") and the "Stock Change / Quality Check" claims the code disproves. I removed the reference; the loop may delete the file.
- **Removed invented features.** The old page described approval queues, "Quality Hold", "Price Variance" flags, "Link Multi-PO", "GRN Reversal", barcode scanning and supplier-performance dashboards. None exist in the applet or backend; I did not carry them over. If any of these are on a roadmap they belong elsewhere.

### Notes

- The customer-support repo issues behind the 2026 serial-number commits contain real customer document numbers and location names; nothing from them was copied — only the resulting configuration keys.

## Run 2 (2026-09-05) — CP Commerce Admin

### Cross-lane link requests

- **ecommerce/shopping-cart-applet.md**, **ecommerce/internal-shopping-cart-customer-access-applet.md**, **ecommerce/ecommerce-catalog-applet.md**, **ecommerce/seller-admin-applet.md**, **ecommerce/pdg-applet.md** (this lane, later in queue): add `cp-commerce-admin-applet` to `related_applets` when processed.
- **membership/membership-admin-applet.md**, **membership/voucher-management-applet.md**, **sales-workflow/commission-scheme-applet.md**, **crm/events-management-applet.md**, **master-data/customer-applet.md**, **master-data/organisation-applet.md**, **master-data/doc-item-maintenance-applet.md**, **master-data/pricebook-applet.md**, **master-data/shipping-pricebook-applet.md**, **master-data/cashbook-applet.md**: add `cp-commerce-admin-applet` to `related_applets` (each is linked from a Website edit tab or Post Registration Config).

### Registry / naming mismatches

- Title corrected "CP Commerce Admin Applet" → "CP Commerce Admin" (registry `cp_commerce_admin_console_v1`, TNT-ADMIN). Registry `documentation_url` still points at Confluence.
- The repo's own name (`blg-applets-wavelet-cp-commerce`) hosts the admin applet plus a media-library applet under `projects/akaun-platform/applets/`; the customer-specific `wavelet-cp-commerce-app-*` clones were not read.

### Notes for the loop

- The old page documented **Review**, **Shipping Provider** and **Users** as sidebar sections; in `menu-items.ts` all three are commented out (Shipping Provider marked "TO DO LATER") while their routes still exist. The page now says so. If the product intends them to be visible, that is a product change.
- The old page's "Configuration & Settings" listed Feature Visibility as the settings landing page and "Field Configuration" as if it configured fields; the applet has no `applet-settings.model.ts` and reads no field-configuration keys (0 toggles apply), and `bl_applet_client_side_perm_dfn` has **no rows** for this applet code. Documented as "reads none of its keys / none seeded".
- The **widget reference** (GENERIC_HEADER … BUTTON_SINGLE) lives in the front-end `wavelet-cp-commerce` repo, not in this applet; I kept the existing table but did not re-verify it this run.
- Dropped: the "Work in Progress" banner, the persona quick-start walkthroughs (guide voice), the "Key Concepts / Golden Chain" section (its setup order survives as one sentence under *Before you can use it*), fictional person names in examples, and courier brand names. Images `cp-commerce-features.jpg` and `cp-commerce-framework.png` are now unreferenced.
- Open feature requests, not documented: "Copy Template" for the admin applet (gh:bigledger/blg-applets-wavelet-cp-commerce#3), configurable "Remove All" at checkout (#6), CP Commerce user fingerprint (backend, blg-intranet#1883).

## Run 2 (2026-09-05) — Purchase Report

### Cross-lane link requests

- **finance/internal-purchase-invoice-applet.md**, **finance/internal-payment-voucher-applet.md**, **finance/creditor-report-applet.md**, **inventory-workflow/stock-balance-applet.md**, **master-data/supplier-applet-1.md**, **master-data/organisation-applet.md**, **master-data/doc-item-maintenance-applet.md**, **master-data/inv-item-maintenance-applet.md**: add `purchase-report-applet` to `related_applets` (source documents, settlement queries, stock-balance column, filter master data).

### Registry / naming mismatches

- Title corrected "Purchase Report Applet" → "Purchase Report" (registry `purchaseReport`, TNT-USER, ACTIVE, documentation_url already the wiki page). No client-side permissions seeded although the code checks `SHOW_PURCHASE_REPORT_BY_*_MENU`, `SHOW_MA_COST`, `SHOW_QUOTATION`…`SHOW_OTHERS` and `SHOW_ADVANCED_SEARCH_*` (same pattern as F-0044).

### Notes for the loop

- The old page invented a document-detail dialog (Details / Account / Line Items / Settlement / Doc Link tabs) and header-level columns (Supplier Code, Currency, Status); the applet's grid is line-level with GRN No / PO No columns and has no dialog. `static/images/purchase-report-applet/purchase-document-details.png` and `purchase-report-infographic.jpg` are now unreferenced.
- Only FINAL purchase invoices, no-stock-in invoices and purchase returns feed the report; POs and GRNs never appear — the old page's "Document Type filter switches between PO, GRN and invoice" was wrong.
- This applet ships its own field-configuration component (tabs By Document / By Item Code / Item Category Group); `kb/tools/applet-scan.sh`'s shared-screen intersection (11 keys) is therefore misleading for report applets — read the applet's own settings component instead.

## Run 4 (2026-09-05) — Purchase Debit Note (Internal) rework

Fixed exactly what the codex review found, re-derived Configuration and Lifecycle under the updated standard:

- **Settings over-declaration** — four-proof audit (declared / rendered for this applet code / saved / read). 95 keys documented; 6 runtime-only keys in their own list; 11 keys read but with no control anywhere; ~35 model-only keys (custom status, `ENABLE_`/`INCLUDE_` dimensions, SST/WHT, five `EXPAND_*`, three `HIDE_*_TAB`…) removed and listed as "declared but never read". Method note for METHOD.md: components consume keys through string lists (`hide: 'KEY'`, `expandSetting: 'KEY'`), so `grep appletSettings.KEY` under-counts; and the shared template's `appletCode==='x' || 'y'` gates are always-true JavaScript, so those sections render for every applet.
- **GL precedence** corrected to line GL → header GL → item-company link → company default (`JournalPostingService.java` L139–L190); the silent-omit path (L236, L271) and the resulting `TOTAL_DEBITS_AND_TOTAL_CREDITS_NOT_BALANCES` / `NO_JOURNAL_CREATED` throws (L574–L582) are now documented and in Troubleshooting.
- **Posting proof block** added in the standard's fixed form (DCO L15–L17; JPS L123–L131, L257–L263, L322–L353; JPTH L53–L60; inventory skip L39–L40; VOID L662–L710 + reverse journal in `JournalPostingJobProcessorService` L92–L108).
- Other review items: `aliases: []` added (the page never had any); description names the operator; Default Selection table has Default / Effect, "who" as one sentence above; server-permission targets now cited from the extract (`planning/lanes/lane-3/perm-dfn/…tsv`: Company, Branch, Location, Entity); Workflow Design suggestion removed ("No exposed control found … commit f3a1875"); historical-aging processor cited; Sales Agent label warning added (writes `default_sales_entity_hdr_guid`, never read back by this applet).
- **New correction not in the review:** the run-1 page said a FINAL debit note with outgoing links "is not convertible to VOID". `checkIsGenDocConvertibletoVoid` is used only by the e-Invoice cancellation queue; the listing VOID does not check links. Corrected.
- **Sibling fix in my lane:** `internal-purchase-credit-note-applet.md` lines 196 and 360 had the same inverted precedence; corrected to line → header → item-company → company default.

### Cross-lane link requests

- **finance/internal-purchase-invoice-applet.md** (lane 2): its posting table says "Line GL code → item's `PURCHASE` link → company default" — the header GL code step is missing between line and item (`JournalPostingService.java` L151–L165, `container.getBl_fi_generic_doc_hdr().getGuid_glcode()` is tried before the item-company link).
- **master-data/chart-of-account-applet.md**: no change — it already describes the silent-omit + balance-check path correctly.
- Guides that say "missing default GL → posts without a journal" (if any remain under guides/purchasing-guides) should say: the line is dropped and FINAL fails the journal balance check.

### Questions for Vincent

- Unchanged from run 1: is the SDN (+1, AR up) → PDN (+1, AP down) intercompany pairing intended? The page states the code as-is.
- The five `SHOW_GENDOC_*` / `SHOW_CLONE_BUTTON` / `SHOW_FILE_IMPORT_MENU` permissions are still checked in code but unseeded for this applet (F-0044 pattern) — product-side seeding decision.

## Run 4 (2026-09-05) — Blanket Purchase Order Applet

Rewritten from user-guide prose to the reference standard. Registry `blanketPurchaseOrderApplet`, name "Blanket Purchase Order Applet" (title keeps the word Applet because the registry name does — unlike the other purchase documents; flagged below).

### Method finding — the inline gear is a second settings rendering path (add to METHOD.md)

The shared `app-applet-settings-toggle` component (`blg-shared-utilities/modules/settings/applet-settings-toggle/`, blg-intranet#5374/#5383 "inline gear config") is embedded in many screens of the newer applet builds (15 screens in Blanket PO, 23 in Purchase Debit Note), each with an explicit `appletSettingsKeys` list. Keys in those lists are **rendered** even when the shared Application Settings screen has no control for them — for Blanket PO the shared screen has *no* section gated for its code, so 13 `HIDE_*` keys are gear-only. The gear is opt-in via `ENABLE_INLINE_APPLET_CONFIG` (first, ungated toggle on the shared screen, or personal Default Selection); Owners/Admins save to master or personal, others personal only; a personal `false` deletes the key. The four-proof "rendered" check must therefore union: shared screen (gated) + applet-local settings components + gear `appletSettingsKeys`. Consequence for run 1–3 pages: any "read but no control" list may be wrong wherever the applet embeds the gear — I corrected the PDN page this run (11 keys moved to "gear-only").

### Removed inventions (old page)

- "Maximum Amount" spend cap and per-line "Maximum Quantity" — no such field anywhere (grep 0 hits); the only limit is the line quantity consumed through the open queue.
- Settlement tab and Department Hdr on the create screen — both commented out in the template; the Batch No Booking page is registered but unreachable.
- "Release management / spend monitoring in real time / audit trail" feature list, persona quick-starts, Pro Tips, and the AI infographic (`static/images/blanket-purchase-order-applet/blanket-purchase-order-overview.png`, now unreferenced — the loop may delete it). Kept: the four real screenshots and the PO knock-off click path (accurate).

### Cross-lane link requests

- **purchase-workflow/internal-purchase-order-applet.md** (my lane, done in run 1): add `blanket-purchase-order-applet` to `related_applets` and state that the *KO For → Blanket Purchase Order* tab is shown only when the company gendoc flow config pair `INTERNAL_BLANKET_PURCHASE_ORDER → INTERNAL_PURCHASE_ORDER` (`flow_type = LINE`) is enabled (`line-item-create.component.ts` L120–L131) — I will fold this in when the PO page next gets touched; noting it here so the loop can gate it.
- **purchase-workflow/blanket-purchase-order-applet-supplier-access-applet.md** (my lane, later in queue): link back.
- **master-data/organisation-applet.md** (other lane): if it is the home of the company gendoc flow configuration, add a sentence that the BPO → PO, GRN → PI etc. pairs are set there; add `blanket-purchase-order-applet` to `related_applets`.
- **master-data/supplier-applet-1.md**, **master-data/doc-item-maintenance-applet.md**, **master-data/pricebook-applet.md**, **master-data/tax-configuration-applet.md**: add `blanket-purchase-order-applet`.
- **modules-v2/purchasing/related-applets/_index.md**, **guides/roles/procurement-manager.md**: check they do not promise spend caps / maximum amounts for blanket POs.

### Registry / naming mismatches

- `blanketPurchaseOrderApplet` name is "Blanket Purchase Order Applet" (with suffix) while its siblings dropped it; `blanketPurchaseOrderAppletSupplierAccess` has no `documentation_url`. Product-side tidy-up, not a page problem.
- `BLANKET_PURCHASE_ORDER_DISPLAY_PRICING` is seeded as a client-side permission but never checked in code; `HIDE_PRICE` is.

### Questions for Vincent

- Should the validity window (`VALIDITY_DATE_END`) block knock-off from an expired agreement? Nothing enforces it today; the page says so.
- Which applet page owns the company gendoc flow configuration UI? Three of my pages (GRN, PO, BPO) now depend on it and link only to a table name.

## Run 5 (2026-09-05) — Delivery Installation applet

Rewritten from the **V2 project**. Registry `delivery-installation-applet`, name "Delivery Installation applet" (title set exactly, lower-case *applet* as in the registry). The page previously described the V2 UI in persona / marketing voice with invented specifics (up to five custom status workflows, an "App Left Menu Items" screen that hides menus, per-driver menu trimming); all replaced by code-derived sections.

### Which repo is the product

Two repos exist: `blg-applet-wavelet-delivery-installation-applet` (contains both the old `delivery-installation-applet` project and a 2025-11 copy of `delivery-installation-applet-V2`) and `blg-applet-wavelet-delivery-installation-applet-V2` (V2 project only, commits to 2026-07-26, 90 files newer). The registry has one code and its `es_module_url` bundle (`…/delivery-installation-applet/prod/delivery-installation-applet-elements.js`, 50 MB) was fetched and grepped: it contains only V2 markers (`logistic-hub-network` ×37, `custom-status-settings` ×42) and no V1 route names. So the deployed product = V2 project, documented from the V2 repo @9966d77. The old V1 project (trip-calendar / trip-listing / internal-sales-order-* routes) is dead code. Method note: **when two repos claim the same applet code, curl the registry's `es_module_url` and grep for route names** — 30 seconds, no ambiguity.

### Method findings (add to METHOD.md)

- **Screens can be mislabelled.** The "Menu Containers" menu entry (`app-left-menu-items` route, `LeftMenuItemsComponent`) renders 24 advanced-search field toggles; the Application Settings tab that used to hold them is commented out. Four-proof "rendered" must be checked per template, never inferred from the menu label or component name.
- **Routed settings components can be dead.** Default Selection is routed directly with no `@Input` provider, so its `appletContainer` is undefined and its Save emits nothing; the personal variant has its loader commented out. Field Settings is an unbound placeholder. Both are documented as "not functional at commit <sha>" rather than as settings.
- **Backend guards can be case-mismatched.** `JobsUow.getByGuidWithCondition` compares `delivery_status != 'CANCELLED'` while `JobsService.cancelJobs` writes `"Cancelled"`, so the "cancelled job cannot be completed" claim is only true for trip-cancelled jobs. Worth a grep for every "rejects" claim: check what string the writer actually stores.

### Screenshots with personal data (not referenced)

All under `static/images/delivery-installation-applet-V2-applet/` (lane 4 suggested keeping them; I opened all 13):

- `delivery-job-main-listing.png`, `delivery-job-main-action-tab.png`, `delivery-job-create-edit-form.png`, `shipment-listing-listing.png`, `shipment-listing-create-jobs.png` — logistics/tracking references prefixed with a real customer's code, a recipient name, driver names.
- `trip-listing-execution-view.png` — driver names (real staff first names) in the Driver Name column.
- `job-sources-so.png`, `job-sources-si.png`, `job-sources-do.png` — "Job Created By" shows full staff names.
- `delivery-job-line-report.png` — a driver's full name and a real company name in the Customer column.
- `delivery-installation-overview-infographic.png` (both folders) — AI infographic, no data; not used (marketing artefact).
- Kept and referenced: `trip-calendar-planning-view.png` (empty calendar) and `settings-configuration-center.png` (settings menu). Both still show the logged-in user's small avatar photo in the top-right corner and the tenant code `STAGING_TENANT`; I judged the avatar too small to identify anyone but flag it for Vincent.

The old page's only image, `static/images/delivery-installation-applet/delivery-installation-overview-infographic.png`, is now unreferenced (the loop may delete it).

### Anonymisation note on issue citations

The applet's real issue history lives in a customer-project repo whose slug contains the customer's abbreviation (110 issues, mostly work logs). I cited its issue ids only in the ledger shard and `kb/topics/delivery-installation-applet.md`, not in the page's public `sources:`; the page cites `gh:bigledger/blg-wiki#54` only. Vincent to decide whether gh ids of customer-named repos may appear in front matter.

### Cross-lane link requests

- **inventory-workflow/delivery-installation-applet-V2-applet.md** (lane 4, skipped as duplicate): merge into `delivery-installation/delivery-installation-applet.md` with `aliases: [/applets/inventory-workflow/delivery-installation-applet-V2-applet/]` added to my page by the loop when the duplicate is removed (adding the alias while the page still exists would collide). Its 13 screenshots: see the personal-data list above — only two are usable.
- **sales-workflow/internal-sales-order-applet.md** (lane 1), **sales-workflow/internal-sales-invoice-applet.md**, **sales-workflow/internal-delivery-order-applet.md**: add `delivery-installation-applet` to `related_applets`; state that the document's `delivery_status` (PARTIALLY DELIVERED / FULLY DELIVERED) is written by the Delivery Installation applet's Complete / Cancel actions and that cancelling a job returns `qty_to_deliver` to the pick-pack queue (`JobsService.java` L401–L450, L848–L912).
- **inventory-workflow/driver-delivery-order-applet.md** (lane 4): already links here; no change.
- **master-data/organisation-applet.md**, **master-data/employee-applet.md** (lane 4): add `delivery-installation-applet` to `related_applets` (branch/location on shipments and jobs; drivers are separate `bl_del_driver` records linked to logins by e-mail, not employees).
- **guides/sales-guides/installation-scheduling-workflow.md**, **partial-delivery-workflow.md**: they are listed as this applet's guides but never name it; a sentence pointing to the Delivery Installation applet for trip planning would close the loop.

### Registry / naming mismatches

- Registry name "Delivery Installation applet" has a lower-case *applet* and no ampersand; the UI header says "Delivery & Installation Applet" and the app component says "Delivery and Installation Applet". Product-side tidy-up; page follows the registry.
- `documentation_url` for both delivery codes still points at the Atlassian wiki, not wiki.bigledger.com.
- No client-side permission definitions are seeded for this code (0 rows), and the code checks none.

### Questions for Vincent

- The completion guard case mismatch (`CANCELLED` vs `Cancelled`) — report as a defect to the backend team? The page states it as-is.
- Default Selection / Personalization › Default Selection are dead at 9966d77 — keep them on the page as "not functional", or ask product to remove the menu items?
- Who seeds `bl_applet_config` `RETURN_REASON` for a new tenant? The Return Reasons screen cannot create it, so a fresh tenant cannot add return reasons until it exists.
- Avatar photo in the two kept screenshots (see above) — acceptable, or should the loop crop/replace them?
