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

## Run 6 (2026-09-05) — E-invoice pages (admin, portal, Peppol) from the internal e-invoice README + backend + issues

Read in full before writing: `refs/blg-intranet/content/1100-malaysia-einvoice/README.md` (2,679 lines), all 10 images, the 10K-simulation scenarios CSV, the LHDN core-workflow diagram; 300 blg-intranet issues matching e-invoice/peppol (titles) plus 27 bodies; the applet repo's 40 issues; backend `MyEInvoice*` controllers/services @871dbf5c96. Facts extracted, no passages copied; no tenant, PIC or credential from the README appears anywhere in the wiki (the README's per-tenant consolidation schedule and PIC names were deliberately ignored).

### Pages

- `content/en/applets/e-invoice/my-e-invoice-admin-applet.md` — rewritten to standard. 10 consumed applet-local settings + 1 rendered-not-consumed (`HIDE_SUBMISSION_STATUS`) + 3 read-without-control; Default Selection dead (unbound); 0 client-side permission rows. Lifecycle rebuilt from the entry-gate processor, the mandatory-field check, the pool services, the resubmission guards and the cancellation service. 17 troubleshooting rows.
- `content/en/applets/e-invoice/my-e-invoice-portal-applet.md` — rewritten; **title set to the registry name "MY E-Invoice Portal Applet"** (capital MY). No consumed settings at all. Key correction: the portal does not submit to LHDN; it updates the customer's entity and calls `request-queues/process-request/login-entity-ep`; the "auto-switch Regenerate vs Credit Note" story in the old page is really "the logic dropdown collapses to NEW_REVERSAL_DOC after 72 h".
- `content/en/applets/e-invoice/mypeppol-admin-applet.md` — rewritten. **Direction reversal:** the old page (and the Peppol guide) say documents enter the Waiting Queue *after LHDN validates*. The code gates the Waiting Queue on the e-invoice mandatory-field check + company/entity `peppol_participant_id` only (`PeppolPostingQueueToWaitingQueueProcessor.checkPostingQueueValidity` L123–L146); no Peppol processor reads `einvoice_document_status`. Also: Monthly Reports are not "sample data" (no mock found; `rowData = []` until Generate Report); the Testbed menu is commented out.

### Skipped

- `content/en/applets/e-invoice/website-builder/user-permission-manager.md` — no registry row under any plausible name ("User Permission Manager", "Website Builder"); it is a CP Commerce website-builder screen, and an identical page exists at `content/en/applets/ecommerce/website-builder/user-manager.md` (also in my queue). Recorded as a registry mismatch; the loop should merge the two and move the survivor out of `applets/e-invoice/`.

### Method findings (add to METHOD.md)

- **Internal runbooks are the best troubleshooting source.** The README's error catalogue (CF324/CF358 buyer NRIC shapes, DC511 base currency, DR303/DR308 stale original reference, CV317 state code 17, duplicate-submission patterns, 72-hour rule from `validation_datetime`) gave more real failure modes than 300 issue titles. Read the runbook first, then use issues only to confirm and date.
- **Effects can be copy-pasted skeletons.** The Peppol applet's NgRx effects inject the real services under variable names from other applets (`couponLineService`, `batchPoolEventService`, `ticketScannedService`). Trace by the injected *type*, not the variable name.
- **Two applets can ship the same constant with different contents.** `PROCESSING_LOGIC` has four entries in the admin applet (with `CANCEL_FOR_EDIT_AND_RESUBMIT` labelled `CANCEL_EINVOICE`) and three in the portal applet. Grep the constant in every repo that renders the dropdown before saying an option "is missing".
- **Registry names are case-significant for the title rule.** `myEInvoicePortalApplet` is "MY E-Invoice Portal Applet"; the page had "My E-invoice Portal Applet".

### Screenshots with personal data (listed, not referenced)

Opened all 22 admin, 5 portal and 17 Peppol images plus the 10 intranet images. Offenders (exact paths, one per line):

- static/images/my-e-invoice-admin-applet/posting-queue-submit.png — buyer name that reads as a real individual/business in the Entity column; avatar photo.
- static/images/my-e-invoice-admin-applet/posting-queue.png — a staff first name in the Entity column.
- static/images/my-e-invoice-admin-applet/batch-pool.png — two full personal names in Sales Entity Name.
- static/images/my-e-invoice-admin-applet/individual-pool.png — a staff member's full name as Entity Name.
- static/images/my-e-invoice-admin-applet/single-general-pool.png — several staff first names / full names as Entity Name.
- static/images/my-e-invoice-admin-applet/external-reception-queue.png — staff full names as buyer names, with TINs.
- static/images/my-e-invoice-admin-applet/internal-submission-email-dashboard.png — a staff e-mail address (Receiver Email) and a real customer company name in the Title column.
- static/images/my-e-invoice-admin-applet/monthly-report.png — a staff member's full name in Created By / Updated By.
- static/images/my-e-invoice-admin-applet/my-e-invoice-admin-applet-overview-infographic.png — AI marketing artefact, no data; now unreferenced.
- static/images/my-e-invoice-portal-applet/my-e-invoice-portal-applet-overview-infographic.png — AI artefact; now unreferenced.
- static/images/my-peppol-admin-applet/my-peppol-admin-applet-overview-infographic.png — AI artefact with garbled text; now unreferenced.

Intranet images NOT copied (contain real data): `wrong-general-tin-usage.png` (tenant code, company names, document numbers), `original-einvoice-error.jpg` (supplier name, TIN, buyer name and e-mail), `postman-environment-variables.jpg` (client id/secret), `postman-login-intermediary-system.jpg` (TIN, bearer token), `get-doc-details.jpg` (real issuer/receiver names and TINs). Copied (clean): `lhdn-core-workflow.png` → `static/images/my-e-invoice-admin-applet/lhdn-core-workflow.png` (processor/table names only). `einvoice-entity-json-priority-chart.jpg`, `forex-error.jpg`, `einvoice-date-and-time-documentation.jpg` are clean but reproduced as text instead.

Kept and referenced (clean; several show the logged-in user's small avatar photo top-right, as flagged in run 5): admin — master-list, batch-pool-validation-error, internal-submission-to-irb-e-invoice, internal-submission-consolidated, internal-submission-validation-queue, internal-submission-history, internal-submission-portal-request, cancellation-rejection-requests, cancellation-queue-details, reconciliation-purchase-matching; portal — all four screen captures; Peppol — posting-queue, view-posting-queue-account, waiting-queue, internal-submission-to-peppol-ap, internal-submission-queue, internal-submission-to-peppol-ap-export, external-reception-from-peppol-ap, peppol-id-registration. Unreferenced but clean: admin cancellation.png, internal-submission-individual.png, reconciliation-sales-matching.png; Peppol view-posting-queue-details/lines, internal-submission-to-peppol-ap-details, internal-submission-queue-details, internal-submission-history, external-reception-from-peppol-ap-details/export, peppol-registered-companies.

### Cross-lane link requests

- **master-data/organisation-applet.md** (other lane): document the company E-Invoice tab as the owner of `einvoice_status` (ENABLED gate — documents finalised before enabling are dropped silently), TIN/BRN/SST/MSIC/business activity/address/phone, and the `einvoice_settings_json` keys `einvoice_issuer_type`, `einvoice_forex_gendoc_posting_logic`, `einvoice_running_no_config`, `einvoice_line_item_desc_config`; and the Peppol Config tab as owner of `peppol_status` and `peppol_participant_id`. Add `my-e-invoice-admin-applet`, `mypeppol-admin-applet` to `related_applets`.
- **master-data/customer-applet.md**, **master-data/supplier-applet-1.md**: add the three e-invoice applets to `related_applets`; state that ID type must be PASSPORT for foreigners, NRIC 12 digits without hyphens, `default_einvoice_address` chosen shipping → billing → main, phone 8–20 chars, and that one Peppol ID must be marked default (it is the Peppol receiver).
- **sales-workflow/internal-sales-invoice-applet.md**, **pos-general-applet.md**, **internal-sales-credit-note/debit-note/refund-note/return**: add `my-e-invoice-admin-applet` to `related_applets`; say finalising only *queues* the document (trigger processor), that `einvoice_submission_type` / `skip_einvoice` decide the pool, that RM 10,000+ SINV/SCSH are forced individual, and that notes/returns must reference the currently Valid original.
- **finance/internal-purchase-invoice-applet.md** (lane 2?): self-billed purchase invoices (`EINVOICE_SELF_BILLED = TRUE`) enter the same pipeline with the supplier as issuer; link to the admin applet.
- **guides/einvoice-guides/peppol-configuration.md** and **modules-v2/e-invoice/** pages: remove "after LHDN validates" for the Peppol Waiting Queue (see direction reversal above).
- **guides/einvoice-guides/einvoice-pools-and-routing.md**, **einvoice-validation.md**: spot-check against the routing table and mandatory list on the admin page (RM 10k rule applies to SINV/SCSH only; CANCEL_EINVOICE label).
- **applets/e-invoice/my-einvoice-for-customer-and-supplier-applet.md** (skipped, run 5): when the loop merges it into the portal page, add `aliases: [/applets/e-invoice/my-einvoice-for-customer-and-supplier-applet/]` to the portal page.
- **ecommerce/website-builder/user-manager.md** (my lane, later): merge with `e-invoice/website-builder/user-permission-manager.md`; both lack a registry row.

### Registry / naming mismatches

- `myIEnvoiceAdminApplet` (sic — "IEnvoice") `documentation_url` points at `/applets/e-invoice/einvoice-generation-applet/`, which is only an alias of the current page; `myEInvoicePortalApplet` has no `documentation_url`; `peppolApAdminApplet`'s `documentation_url` points at `/applets/peppolap-admin-applet/`, which does not exist in the wiki (no page for the AP operator tool — probably correct, it is BigLedger-internal, but the URL should be blanked).
- "User Permission Manager" / "User Manager" (website builder) — no registry row; not applets.
- 0 client-side permission definitions for all four e-invoice codes.

### Questions for Vincent

- Is it intended that the Peppol Waiting Queue does **not** wait for LHDN `Valid`? The old page, the Peppol guide and the modules-v2 text all say it does; the code does not. If the behaviour is a bug, the page should say "currently" rather than presenting it as design.
- `HIDE_SUBMISSION_STATUS` is rendered and saved but read nowhere; `DEFAULT_SELECTION` screens in all three e-invoice applets are dead (unbound). Report to product, or leave documented as "not functional"?
- The forex choice `POST_FOREX_DOC` / `POST_LOCAL_CCY_DOC` has no UI (intranet #5803 open). The admin page says "set by support" — acceptable until the Organisation applet exposes it?
- May the copied `lhdn-core-workflow.png` (processor/table names only, from the internal README) stay on the public wiki? It is the single most useful picture on the page.
- The portal applet's Processing Logic dropdown still lacks `CANCEL_FOR_EDIT_AND_RESUBMIT` (intranet #5427 closed the backend half). Raise a front-end issue on the portal repo?

## Run 7 (2026-09-05) — Delivery And Installation Driver

### Pages

- `content/en/applets/delivery-installation/delivery-installation-driver-applet.md` — rewritten from `blg-applet-wavelet-delivery-installation-driver-applet` @be97a51, the `login-driver-ep` endpoints in `blg-akaun-platform-java` @871dbf5, the four `LoginDriver*` services in blg-akaun-ts-lib, and the deployed prod bundle (fetched from the registry's `es_module_url`). Title set to the registry name "Delivery And Installation Driver". Only two GitHub issues exist on the repo (deployment cleanup, Angular 14 migration) plus wiki#55; troubleshooting is code-derived.

### Removed inventions (old page and infographic)

The previous page (and the infographic added under wiki#55 / PR #315) described: *Start Trip* by the driver; *Arrived* / *Installing* statuses; a *Returned* status with a mandatory return reason; *Custom Status* milestones for installers; GPS-stamped signatures; Google Maps **and Waze** integration; a *Default Vehicle* personalisation; manual *Trip Status Date* for offline back-dating; automatic Sales Order → Sales Invoice conversion on e-signature. None of these exists in the driver applet source or bundle. What exists: one Trip Calendar, job cards, Start Job / Confirm Delivery / Cancel Job, stop reordering, and a proof-of-delivery form (name, IC, signature, photos, qty delivered + failure reason per line, remarks, cash amount). The address is a plain `maps.google.com/?q=` link. Timestamps are server time at the tap.

### Method findings (add to METHOD.md)

- **Fetch the deployed bundle from the registry's `es_module_url` and diff behaviour claims against it** before reporting a source-level defect. Both defects below are in the bundle, so they are production facts, not stale-branch artefacts. (Cost: one `curl`, ~9 MB.)
- **Driver/customer-facing "login-*-ep" endpoints gate on identity SQL, not on permission sets.** Do not write "assign the `API_TNT_DM_DEL_*` permission" for such applets; write which table link makes the login recognised (`bl_del_driver_hdr.login_subject_guid` + `bl_del_trip_driver_link` here).
- **A companion native app may be the real client.** The Kotlin driver app implements the same flow against the same endpoints; when a web applet looks broken, check whether the mobile build is what customers use before escalating.

### Screenshots with personal data (not referenced)

static/images/delivery-installation-driver-applet/trip-calendar-day.png
static/images/delivery-installation-driver-applet/trip-calendar-agenda.png

(Both show the left menu with a real tenant code as the tenant entry. Month and week views are clean and are referenced. The infographic `static/images/delivery-installation-driver-applet/delivery-installation-driver-applet-overview-infographic.png` has no personal data but asserts the invented features above; left unreferenced.)

### Cross-lane link requests

- **inventory-workflow/driver-delivery-order-applet.md** (lane 4): keep `delivery-installation-driver-applet` in `related_applets`; add one sentence that the two driver applets share no data (trip/job model vs `delivery_driver_guid` on the DO) and that proof of delivery exists only in the Delivery And Installation Driver applet.
- **sales-workflow/internal-sales-order-applet.md, internal-sales-invoice-applet.md, internal-delivery-order-applet.md** (lane 1): the `delivery_status` roll-up (PARTIALLY/FULLY DELIVERED) is also triggered by the *driver's* Complete Job, and the driver's Cancel Job restores `bl_fi_pick_pack_queue.qty_balance` — add `delivery-installation-driver-applet` to `related_applets` alongside `delivery-installation-applet`.
- **modules-v2/inventory** (owner lane): the delivery section should name both delivery applets and say that drivers work in the driver applet or the Android driver app.
- **guides**: no guide covers the driver workflow; if one is commissioned it must be written from the current page, not from the old prose.

### Registry / naming mismatches

- `Delivery_Installation_Driver_Applet` `documentation_url` = the Atlassian "Delivery Installation Applet" page (shared with `delivery-installation-applet`); should be `https://wiki.bigledger.com/applets/delivery-installation/delivery-installation-driver-applet/`.
- The applet's in-app name is "Delivery & Installation Driver Applet" (`app.component.ts`), the registry name is "Delivery And Installation Driver", the old wiki title was "Delivery Installation Driver Applet". Page now uses the registry name; consider an alias-free rename only (URL unchanged).
- 0 client-side permission definitions; the applet's own client-side permission loading is commented out.

### Questions for Vincent

- **Is the web driver applet functional in production?** At be97a51 and in the deployed bundle, the Trip Calendar effect (`app.effects.ts` L52–L88) dereferences `bl_del_trip_hdr` on the paged response envelope, so the calendar can never list trips and shows the *Failed to retrive trips* toast; the only navigation into trips and jobs is via calendar events. The June 2026 screenshots show *No events to display*. Either (a) customers use the Android app (`akn-kotlin-mobile-delivery-driver`, merged from a customer project repo in June 2026) and the wiki should say so, or (b) this is a live defect to raise on the applet repo. The page currently states the fact and says "report to product".
- **Hard-coded applet guid for return reasons** (`shared-components.effects.ts` L243 = `a7c0cb60-…`, not in `bl_applet_hdr`): raise an issue on the driver repo? The Delivery Installation applet uses the session applet guid. Until fixed, drivers have no Failure Reason dropdown unless a tenant row carries the old guid.
- Should the Android driver app get its own wiki page (it is not in the applet registry, so ADR-0002 says no page) or a section on this page? I added one paragraph and no link.
- The old infographic is now unreferenced; delete it, or regenerate one from the rewritten page?

### Skipped (run 7, ADR-0002)

- `content/en/applets/ecommerce/ecommerce-catalog-applet.md` — TODO placeholder ("E-Commerce Catalog Applet"); no registry row under catalog / catalogue / marketplace / commerce other than `cp_commerce_admin_console_v1` (CP Commerce Admin, TNT-ADMIN, page rewritten in run 1). The product catalog is a per-website tab of CP Commerce Admin, not an applet. Recommendation: delete the page and add `/applets/ecommerce/ecommerce-catalog-applet/` to `aliases:` of `ecommerce/cp-commerce-admin-applet.md`; its dead links (`/applets/inv-item-maintenance-applet/`, `/applets/tax-configuration-applet/`, `/applets/organization-applet/`) go with it.
- `content/en/applets/ecommerce/installation-of-pricebook-applet.md` — 13 lines of "go to the Applet Store, search, click install"; not an applet. The Pricebook applet (`PricebookApplet`, registry `documentation_url` → `/applets/pricebook-applet/`) is documented at `content/en/applets/master-data/pricebook-applet.md` (another lane). Recommendation: fold the install steps into a single generic "Install an applet from the Applet Store" section (they are identical for every applet), alias the old URL, and fix the registry `documentation_url` to `/applets/master-data/pricebook-applet/` (registry mismatch for lane 4 / the applet-audit skill).

## Run 9 (2026-09-05) — Consignment Purchase Order (Internal)

Run 8 was killed by a rate limit before writing anything; run 9 resumed from the queue head.

### Pages

- `content/en/applets/purchase-workflow/internal-consignment-purchase-order-applet.md` — rewritten to standard from `blg-applet-wavelet-internal-consignment-purchase-order-applet` @1447f23 and the backend @871dbf5c96. Title set to the registry name "Consignment Purchase Order Applet (Internal)". The old page was a 700-line user-guide-voice document (quick start, FAQ, glossary, role table) with several inventions; it is replaced, keeping five clean screenshots.

### Corrections to the old page (record for the guides)

- **FINAL is not listing-only.** The old page said "FINAL is on the listing, not on the edit pane header". The edit template has FINAL (and DISCARD) with `showFinal()`; only VOID is listing-only (the edit VOID button is commented out).
- **There is no "Blanket Consignment Purchase Order" document type.** The KO For sub-tab carries that label but searches `INTERNAL_BLANKET_PURCHASE_ORDER`.
- **No Planned Notification Schedule (PNS), no ownership tracking, no "pay-as-you-use billing" in this applet** — the infographic and the old Delivery Details text asserted them. `PNS` in the code is the line `txn_type`, not a schedule.
- **The Payment tab is a sales-side component**: every settlement method except `CASH_BACK` writes an `INTERNAL_RECEIPT_VOUCHER` settlement line on this purchase document; with amount signum 0 the totals stay 0.00. The page now tells readers to settle in Consignor Purchase Billing.
- **Whether FINAL creates open-queue rows is a company setting, not an applet setting**: `GenericDocLineOpenQueueProcessor` reads `bl_fi_comp_gendoc_flow_config` (Organisation → Company → Knock Off Configuration, intranet #4638). The old page and the sibling PO page both describe FINAL as unconditionally "opening its lines in the open queue".

### Method findings (add to METHOD.md)

- **Read `app.routing.ts` before trusting a `settings-container` listing.** This applet ships an applet-local `field-configuration` component (one bound toggle, eight unbound sliders) that is *not routed*; the `field-settings` route loads the shared `FieldConfigurationComponent`. `applet-scan.sh` happened to be right because it only reads the shared screen, but a grep of the local component would have produced a one-setting Configuration section.
- **Open-queue creation on FINAL is gated per company by `bl_fi_comp_gendoc_flow_config` (`config_type = KO`, `server_doc_type_1` = the finalised type, `is_enabled`).** This applies to every document type. `posting_ko` on `bl_fi_generic_doc_hdr` records whether the processor ran; `KnockOffWatchdogService` re-queues FINAL rows with `posting_ko IS NULL`; `POST …/line-open-queues/data-fix-missing-queue` is the manual repair. Every "downstream cannot find my document" troubleshooting row should start here.
- **With zero seeded client-side permission rows, `ClientSidePermissionChecker.checkPermission` still passes for tenant OWNER/ADMIN rank** — so a price-gating code like `PURCHASE_ORDER_DISPLAY_PRICING` hides prices for ordinary users and shows them for admins, which looks like a role bug to the customer. Worth a sentence on every page whose applet has 0 seeded rows.
- **Default Selection pickers can be rendered without a form control** (`DEFAULT_PRICING_SCHEME` here): the `[(pricingScheme)]="form.controls['…']"` binding resolves to `undefined`, nothing is saved. Check the FormGroup, not just the template.

### Screenshots with personal data (not referenced)

- static/images/internal-consignment-purchase-order-applet/line-items-tab.png — item codes / names in the Search Item panel contain two staff first names.
- static/images/internal-consignment-purchase-order-applet/trace-document-tab.png — no personal data, but it shows four pages of SST *output* tax transactions on a signum-0 purchase document (test tenant data that cannot come from this order); misleading, so unreferenced. A real brand name appears as a test item.
- static/images/internal-consignment-purchase-order-applet/internal-consignment-purchase-order-applet-overview-infographic.png — AI marketing artefact asserting PNS, ownership tracking, KO reconciliation and pay-as-you-use billing; none exists in the applet. Unreferenced.

Kept and referenced (clean; tenant shown is a generic staging code; avatar top-right as flagged in earlier runs): main-details.png, account-tab.png, KO-tab.png, payment-tab.png, delivery-details-tab.png.

### Cross-lane link requests

- **master-data/organisation-applet.md** (other lane): document Company → *Knock Off Configuration* (`bl_fi_comp_gendoc_flow_config`: source type, target type, `is_enabled`, `config_mode`) as the owner of every knock-off pair; say that without an enabled row FINAL creates no open-queue rows for that source type. Add `internal-consignment-purchase-order-applet` to `related_applets`. Mention intranet #4638 (duplicate source/target rows are not yet blocked).
- **inventory-workflow/internal-consignment-grn-applet.md** (other lane): `related_applets` already lists this page; add that its KO tab queries `line_open_queue_server_doc_type_1 = INTERNAL_PURCHASE_CONSIGNMENT_ORDER` / `_2 = INTERNAL_PURCHASE_CONSIGNMENT_GRN` and copies `qty_open`; note the flow-config prerequisite; add the MA-costing fix (intranet #4693: consignment GRN amounts now feed the costing recalculation).
- **purchase-workflow/internal-purchase-order-applet.md** (my lane, done in run 1): its Lifecycle says FINAL "opens its lines in the open-queue" unconditionally — should say "when the company's Knock Off Configuration has an enabled row for `INTERNAL_PURCHASE_ORDER`". Queue a small fix in a later run.
- **inventory-workflow/consignee-stock-transfer-applet.md, internal-consignment-gin-applet.md, purchase-workflow/internal-consignment-return-applet.md, internal-consignor-purchase-billing-applet.md, inventory-workflow/internal-consignment-billing-applet.md**: add `internal-consignment-purchase-order-applet` to `related_applets` (this page links to all of them).
- **guides/purchasing-guides/consignment-purchasing.md**: check for "FINAL from the listing", "blanket consignment PO" and PNS wording; the guide should say the consignment PO posts nothing and that the GRN is where stock and liability appear.
- **modules-v2/purchasing/use-cases/_index.md**: links here; no change needed unless it repeats the PNS/billing claims.

### Registry / naming mismatches

- `internalConsignmentPurchaseOrderApplet` has an empty `documentation_url`; should be `https://wiki.bigledger.com/applets/purchase-workflow/internal-consignment-purchase-order-applet/`.
- 0 client-side permission definitions for the applet code, while the code checks ~50 codes (list on the page).
- Registry names for the family differ in word order from the wiki titles of the neighbouring pages (e.g. wiki "Internal Consignor Purchase Billing Applet" vs registry "Consignor Purchase Billing Applet (Internal)"; wiki "Consignment Return (Internal) Applet" vs registry "Consignment Return Applet (Internal)") — those are next in my queue and will be renamed when processed.

### Questions for Vincent

- The applet's Payment / Contra tabs write sales-side receipt-voucher lines on a signum-0 purchase document. Raise as a defect on the applet repo, or leave documented as "do not use"?
- `DEFAULT_PRICING_SCHEME` on Default Selection is a dead picker (no form control) and the applet-local field-configuration component is unrouted dead code — report to product?
- Should the wiki recommend seeding the client-side permission definitions for this applet (at minimum `PURCHASE_ORDER_DISPLAY_PRICING`, `PO_ALLOW_BACKDATE_TRANSACTION`, `SHOW_GENDOC_*_BUTTON`)? Today ordinary buyers cannot see line prices.
- Two of the three unreferenced images (infographic, trace-document) could be deleted; keep for the loop to decide.

## Run 9, second page (2026-09-05) — Consignment Return (Internal)

### Pages

- `content/en/applets/purchase-workflow/internal-consignment-return-applet.md` — rewritten to standard from `blg-applet-wavelet-internal-consignment-return-applet` @16378cc and the backend @871dbf5c96. Title set to the registry name "Consignment Return Applet (Internal)" (was "Consignment Return (Internal) Applet"). Eleven clean screenshots kept.
- `content/en/applets/purchase-workflow/internal-consignment-purchase-order-applet.md` — corrected after METHOD.md item 10 landed mid-run: the tab-hide keys, `ENABLE_MULTIPLE_KO` and `ENABLE_SERIAL_NUMBER_VALIDATION_FINAL` are now listed as "read without control" (the shared screen renders those sections only for codes in `getTabValue()`'s map and, for some blocks, only for `internalPurchaseOrderApplet`). Ledger hash refreshed.

### Direction reversal (record for the guides)

- **A consignment return does not move stock.** `InternalPurchaseConsignmentReturnDataConsistencyObject` sets quantity signum **0** and amount signum +1, and `fillQuantitySignumAndAmountSignumForLine` overwrites the applet's own −1 on every line. The type is also absent from `StockBalanceHelper.MA_WA_SERVER_DOC_TYPES`. The old page ("automated inventory adjustments on finalization"), its infographic ("a single action updates stock levels, GL postings and supplier ARAP") and the consignment guide say the opposite.
- The journal is **Dr Consignment Liability / Cr Consignment Stock** through the `PURCHASE_CONSIGNMENT` handler; line GL codes, item-company GL links and the supplier's AR/AP type are all bypassed for consignment types (`isConsignmentStockIn`). The old page's "Creditor" wording is wrong for this type.
- The **Search** tab pulls **purchase-invoice** lines and **KO For** offers the five ordinary purchase documents; the Consignment GRN is reachable only via the Contra tab. The old page said "referencing an existing Purchase GRN or Purchase Order" — technically true, but it hid that the consignment GRN is not a source.

### Method findings (add to METHOD.md)

- **The applet's `applet-constants.ts` signums are not evidence.** The consignment return ships `quantity_signum = -1`; the backend DCO forces 0 and overwrites it. Always take the signum from the DCO (METHOD item 3) — this is the first case found where the two disagree.
- **`getTabValue()` gating (METHOD item 10) also hides the KO For / multiple-KO toggles and some `appletCode === 'internalPurchaseOrderApplet'`-only blocks.** For any applet code absent from `tabMappings`, every `HIDE_*_TAB` key the applet reads is "read without control". I have added a tree-walking gate script (scratchpad `gates.txt` approach: parse the shared HTML with a tag stack and print the enclosing `*ngIf` chain per `formControlName`) — it should replace the nearest-`*ngIf` heuristic in `applet-scan.sh`.
- **Consignment journal handler is shared by GRN and return**: `PURCHASE_CONSIGNMENT` (`CONSIGNMENT_LIABILITY`, `CONSIGNMENT_STOCK`, `INPUT_TAX`, `PURCHASE_DISCOUNT`), company defaults only. Any consignment page's "Before you can use it" must list those four default GL codes; `MISSING_DEFAULT_GL_CODE: CONSIGNMENT_LIABILITY` is the failure to write.
- **One applet, two display-pricing permission codes** (`PURCHASE_CONSIGNMENT_RETURN_DISPLAY_PRICING` vs `INTERNAL_PURCHASE_CONSIGNMENT_RETURN_DISPLAY_PRICING`): grep every `checkPermission(` call, not just the first.

### Screenshots with personal data (not referenced)

- static/images/internal-consignment-return-applet/Main_details.png — listing rows show two branch names, one of which reads as a real retail outlet name and location.
- static/images/internal-consignment-return-applet/account.png — supplier Entity Name is a personal first name with an ID-card-style number.
- static/images/internal-consignment-return-applet/infograhic.png (sic) — AI artefact asserting stock updates and cash refunds on FINAL; contradicts the backend; unreferenced.

Kept and referenced (clean; test branch names only): lines, delivery_details, settlements, department, arap_tab, trace_document_tab, contra_tab_listing, contra, doc_link_copy_from, export, attachments. Unreferenced but clean: doc_link_copy_to.

### Cross-lane link requests

- **inventory-workflow/internal-consignment-grn-applet.md** and **internal-consignment-gin-applet.md** (other lane): state that GRN and GIN are the stock-moving / MA-feeding consignment documents and that the return (quantity signum 0) and order (0/0) are not; add `internal-consignment-return-applet` to both `related_applets` (GRN already has it; GIN links to it in prose).
- **finance/chart-of-account-applet.md** (other lane): add `CONSIGNMENT_LIABILITY` and `CONSIGNMENT_STOCK` to the list of company default GL codes, with the note that consignment documents ignore line GL codes.
- **purchase-workflow/internal-purchase-return-applet.md** (my lane, done in run 1): add `internal-consignment-return-applet` to `related_applets` as the non-stock consignment counterpart — queue a small edit.
- **finance/internal-purchase-invoice-applet.md** (lane 2): the consignment return's Search tab links purchase-invoice lines as `INTERNAL_PURCHASE_INVOICE` → `INTERNAL_PURCHASE_CONSIGNMENT_RETURN`; add to `related_applets`.
- **guides/purchasing-guides/consignment-purchasing.md**: remove any "return reduces stock" wording; say returns reverse the consignment liability and that the physical movement is a GIN / adjustment.
- **planning/lanes/METHOD.md** (coordinator): fold in the four method findings above; consider adding the enclosing-`*ngIf` gate script to `kb/tools/`.

### Registry / naming mismatches

- `internalConsignmentReturnApplet` has an empty `documentation_url`; should be `https://wiki.bigledger.com/applets/purchase-workflow/internal-consignment-return-applet/`.
- `main.ts` sets the dev applet code `internalConsignmentReturn` (registry: `internalConsignmentReturnApplet`); neither is in the shared screen's `tabMappings`, so the mismatch has no additional effect here, but it is the same pattern lane 4 found for the GIN.
- 0 client-side permission definitions; two different display-pricing codes checked.

### Questions for Vincent

- **Is quantity signum 0 intended for the consignment return?** The applet author assumed −1 (constant in the applet), the old wiki and the guide assume stock moves, the backend says 0. If 0 is intended, the GIN is the only way to record consigned stock leaving; if −1 is intended, this is a backend defect worth raising. The page states the backend fact.
- Should the Search tab search Consignment GRN lines rather than purchase-invoice lines? As shipped, a consignment return can only be built from purchase invoices or entered by hand.
- Same recurring items as the PO page: seed the display-pricing / `SHOW_FINAL_BUTTON` client-side permissions; delete or keep the unreferenced infographic and the two excluded screenshots.

### Stopping point

Two large document applets this run (both consignment purchase-side documents with backend surprises). Next in queue: `internal-consignor-purchase-billing-applet.md`. Registry title for it is "Consignor Purchase Billing Applet (Internal)".

## Run 10 — 2026-09-05 — internal-consignor-purchase-billing-applet

### Page

- `content/en/applets/purchase-workflow/internal-consignor-purchase-billing-applet.md` rewritten from applet @823e05d, backend @871dbf5, ts-lib, shared-utilities, registry and 10 issues. Title set to the registry name "Consignor Purchase Billing Applet (Internal)"; `applet_code: InternalConsignorPurchaseBillingApplet`.

### What the code says that the old page got wrong

- **Not a generic document.** It writes `bl_fi_csg_billing_hdr` / `bl_fi_csg_billing_line` through its own endpoint. No journal handler, no stock processor, no open-queue rows, no creditor balance. The old page hedged ("uses operational status"); the new page states it. The generic type `INTERNAL_CONSIGNOR_CONSIGNMENT` (CSRCON, 0/0) exists in the backend but is never created by this applet.
- **The Payment tab cannot record anything.** `payment.effects.ts` compares the amount with the header *object* (`parseFloat(hdr)` = NaN), so "Payment Exceeds Outstanding" fires on every ADD; and neither CREATE nor SAVE includes payment lines in the request. The old page told finance to "add Payment lines after CREATE, then SAVE". The consignment PO page (my lane, run 9) also sends users here for settlement — see cross-lane list.
- **Line changes on the edit screen are lost on SAVE.** The edit effect never copies draft lines into the request (`genDoc.bl_fi_csg_billing_line = [...pns, ...stl]` is commented out); the edit-line screen dispatches to the generic-line state, not the billing-line state; the single-line PUT has no caller. Only header edits persist.
- **Consignor is optional** (Account form has no validators; backend checks the entity only if present). Old page: "CREATE stays disabled until Account is valid". Worse: a billing saved without a consignor breaks the listing load (`entity_hdr_guid.toString()` on null per row).
- **Quantity To Bill is typed, not computed from stock.** Client formula opening + net − closing with `parseInt`; the backend `/item/calc` exists (different formula: opening + net **+** closing, net from *ordinary* purchase GRN/GIN types) and is never called.
- **Export** calls the Purchase Order Jasper endpoint with a hard-coded template; the chosen format is ignored. Old page presented it as a working PDF export.
- **Settings**: only `PRINTABLE` passes four proofs. Default Selection has no save handler and its load code is commented out; Field Settings is eight unbound toggles. The old page listed Feature Visibility / Default Selection / Field Settings / Webhook as working admin areas.

### Method findings (add to METHOD.md)

- **Not every "document applet" is a generic document.** Check the ts-lib service's `endpoint_path` and the backend container class before assuming `bl_fi_generic_doc_*`, DCO signums and `JournalPostingTypeHandler` apply. For an own-table applet the posting proof block is a table of "none" with the absence cited (grep of JournalPostingService / StockBalanceHelper for the table name).
- **Trace the request body, not the reducer.** This applet has a complete draft store for payments and billing lines, but the effect that builds the PUT never reads it. The "persisted" proof for a *field* (not just a setting) = the field is present in the object handed to `service.post/put`. Worth adding as a standard step for document applets: read the create/edit effects end-to-end.
- **A settings route with no `(save)` binding is not persisted** even if the component emits. Check `app.routing.ts` for how the settings component is mounted; a bare component in a route has no parent to catch its output.
- **NaN guards.** `parseFloat(object)` comparisons silently make a whole feature unusable; grep `parseFloat(<any>` against `withLatestFrom(selectHdr)` in payment effects of the other consignment-family applets (PO page run 9 reported "Payment totals stay 0.00" — may be the same defect).

### Screenshots

- Excluded (real customer legal name visible in the listing rows): `static/images/internal-consignor-purchase-billling-applet/main-listing.png`, `create-main-details.png`. Both should be re-taken on a clean tenant or deleted.
- Dropped: `internal-consignor-purchase-billing-applet-overview-infographic.png` — NotebookLM artefact claiming "Flexible Settlement Recording … directly within the same record", which the code cannot do.
- Kept: `add-line-items.png` (test item codes only; one row shows a sportswear brand as an item name — test data, acceptable), `settlement-tab.png` (empty grid).
- Note the image folder is misspelt (`billling`); left as is so existing links keep working.

### Cross-lane link requests

- **purchase-workflow/internal-consignment-purchase-order-applet.md** (my lane, run 9): "the consignor is settled through Consignor Purchase Billing" and the Payment-tab troubleshooting row "Record consignor settlement in Consignor Purchase Billing" — change to "record the billable quantity in Consignor Purchase Billing; the creditor balance and payment are a Purchase Invoice and Payment Voucher". Queue a small edit.
- **inventory-workflow/internal-consignment-grn-applet.md** (other lane): "a GRN that has been knocked off by a later document [Consignment Billing / Consignor Purchase Billing] can no longer be voided" — the consignor billing creates no links and no open-queue rows, so it never knocks off a GRN; reword to name only documents that actually link.
- **finance/internal-purchase-invoice-applet.md** (lane 2): intranet #4717 asks for an "External Documents Date … like the External Invoice Date in the Purchase Invoice Applet" — make sure the PI page documents that field and its role (supplier's invoice date vs. posting date).
- **guides/purchasing-guides/consignment-purchasing.md**: remove any step that records consignor payment in this applet; the settlement path is PI + PV.
- **applets/purchase-workflow/_index.md** (my lane): the family description should say the consignor billing is a quantity record, not a payment document.
- **planning/lanes/METHOD.md** (coordinator): fold in the four method findings above.

### Registry / naming mismatches

- `InternalConsignorPurchaseBillingApplet` has an empty `documentation_url`; should be `https://wiki.bigledger.com/applets/purchase-workflow/internal-consignor-purchase-billing-applet/`.
- 0 client-side permission definitions and 0 `checkPermission` calls — a third pattern beside "checked but not seeded" (F-0044): nothing to seed until the applet gates something.
- Backend permission `API_TNT_DM_ERP_CONSIGNOR_PURCHASE_BILLING_MEMBER` is defined but no endpoint checks it.

### Questions for Vincent

- **Is the Payment tab supposed to work?** The reducer expects `csg_type = STL_MTHD` lines, the guard is broken, and the request assembly is commented out. Either finish it (three small fixes) or hide the tab and say "settle via PI + PV" everywhere. The page currently documents the code as shipped.
- **Should SAVE persist line changes?** One commented line in the edit effect. Until then the page tells users to create a new billing to fix lines.
- **Which Quantity To Bill formula is intended** (UI: opening + net − closing; backend calc: opening + net + closing, from ordinary GRN/GIN)? And should the applet call `/item/calc` at all? The page documents the UI behaviour and notes the unused endpoint.
- Delete or re-take the two excluded listing screenshots.

### Stopping point

One large applet this run — it turned out to be an unfinished template fork with more non-working paths than working ones, and every one needed its own proof. Next in queue: `internal-purchase-gin-applet.md`.
