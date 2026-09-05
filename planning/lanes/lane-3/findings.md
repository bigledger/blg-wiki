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

## Run 11 — 2026-09-05 — internal-purchase-gin-applet

### Page

- `content/en/applets/purchase-workflow/internal-purchase-gin-applet.md` rewritten from applet @57f86f1, shared-utilities @af523eb, ts-lib @7d1616a, backend @871dbf5, registry, 22 seeded client-side permission rows and 14 issues. Title set to the registry name "Purchase GIN (Internal)" (was "Purchase GIN (Internal) Applet"); `applet_code: internalPurchaseGINApplet`. The old page was a 2,239-line user-manual-style document (quick starts, use cases, FAQ, best practices, 20 tables) built around one wrong premise; replaced.

### Direction reversal (record for the guides)

- **The Purchase GIN does not move stock and does not post.** `INTERNAL_PURCHASE_GOODS_ISSUED_NOTE` is quantity signum 0 / amount signum 0 (`InternalPurchaseGoodsIssuedNoteDataConsistencyObject`, `ServerDocTypes`); `createInventoryTxnFromGenericDoc` filters to signum ≠ 0, the type is not in `MA_WA_SERVER_DOC_TYPES`, and `getJournalContainer` builds no lines (then throws `NO_JOURNAL_CREATED` if the journal job runs). The old page said "GRN increases stock. GIN reduces stock", "Inventory is reduced", "stock has already left your books"; all four infographics repeated it. The stock-moving purchase-side out document is the Purchase Return (−1/+1); a stock-out sibling type `INTERNAL_PURCHASE_GIN_STOCK_OUT` exists in the backend but has no applet in refs/ and no registry row.
- **No VOID / DISCARD in this applet.** The old page's status table listed VOID ("Reversed when permitted") and DISCARD; the code has FINAL, SAVE and a non-FINAL DELETE only.
- **Default Selection defaults are not applied.** `DEFAULT_BRANCH` / `DEFAULT_LOCATION` are saved but never read by the form; the old page told admins to "Test by creating new GIN — defaults should auto-populate". Also invented: Default Currency, Auto-numbering and Default Purchaser as Default Selection fields.
- **Payment tab is a sales-side component** (writes `INTERNAL_RECEIPT_VOUCHER` settlement lines, `INTERNAL_PAYMENT_VOUCHER` for CASH_BACK) on a 0-signum purchase document — same pattern as the consignment PO (run 9). Documented as no accounting effect.

### Method findings (add to METHOD.md)

- **`isShowColumn(hideKey, showKey)` in the shared `ag-grid-custom` base is another consumption path** the key-name grep misses (listing FINAL button). Grep `isShowColumn(` when computing "consumed".
- **JS truthiness on the shared screen:** `*ngIf="appletCode==='posGeneral' || 'salesInvoiceApplet'"` is always true, so `ENABLE_EDITING_UNIT_PRICE_STD` renders for every applet. The gate script must treat a bare string literal as true.
- **Signum-0 documents still enqueue the journal job.** `GenericDocumentPrimaryProcessor` fans out to every subscribed processor (filtered only by the company's `posting_final_json`); for a 0/0 type the journal job fails with `NO_JOURNAL_CREATED` after the document is already FINAL. Worth one troubleshooting row on every 0/0 page (PO, PR, PQ, GRN, GIN, sales GIN, SO, quotation).
- **Serial-number validation on FINAL is signum-gated** (`validateSerialNumberQty`): existence and count checks skip signum-0 lines unless the caller sends `validate_serial_signum_zero`; none of the wavelet applets seen so far send it. So 0/0 documents accept serials that do not exist in stock. Duplicate-within-document is always checked.
- **Backend DELETE has no FINAL guard** (`performGenericDocumentDeletion` → `GenericDocumentUow.delete`); every applet's "cannot delete a FINAL document" is client-side only. Check before any page says the backend refuses deletion.
- **A gear key list is not evidence of a read.** This applet's gears carry 31 keys that are neither in the model nor read (copied from the PO applet: `HIDE_PO_LINE_WITH_GRN_KO_LISTING`, `SHOW_PO_FREE_GIFT_MENU`, …). The "rendered" proof from a gear must still be paired with a consumed proof.
- Tree-walking gate script used this run is in the session scratchpad (`gates.py`; evaluates `show*Tab`/`hide*Tab` state from `tabMappings`, `appletCode` comparisons and the orientation guard). Recommend adding it to `kb/tools/` as `applet-gates.py`.

### Screenshots

- Excluded (personal names of purchasers / suppliers or a phone number visible): `static/images/internal-purchase-gin-applet/main-listing-view.png`, `create-form-main-details-tab.png`, `create-form-accounts-tab.png`, `Create-Form-Lines-Tab-with-Line-Items.png`. Re-take on a clean tenant with the Supplier Name / Purchaser columns hidden.
- Dropped (NotebookLM artefacts asserting "immediate inventory reduction", "automated payment processing", approval workflows and ERP/WMS webhooks): `gin-document-lifecycle.png`, `gin-decision-tree.png`, `internal-purchase-gin-applet-overview.png`, `role-based-workflow.png` (5–7 MB each; 24 MB total — delete).
- Kept: `edit-forms-from-main-listing.png` (obvious test supplier, dummy ID number; listing shows branches only), `edit-line-items.png` (test item names).

### Cross-lane link requests

- **purchase-workflow/internal-purchase-grn-applet.md** and **internal-purchase-grn-stock-in-applet.md** (my lane; GRN done in run 1, Stock In next): both link to the GIN as the stock-reducing counterpart ("GRN increases stock. GIN reduces stock"). Reword: the plain GRN and the GIN are both 0/0; GRN Stock In moves stock; Purchase Return is the stock-out.
- **sales-workflow/internal-sales-gin-applet.md** (other lane): `INTERNAL_SALES_GOODS_ISSUED_NOTE` is also (0,0) in `ServerDocTypes`; make sure that page does not claim stock movement, and add `internal-purchase-gin-applet` to `related_applets`.
- **inventory-workflow/internal-consignment-gin-applet.md** (other lane): add `internal-purchase-gin-applet` to `related_applets` with the sentence that the consignment GIN moves stock (in `MA_WA_SERVER_DOC_TYPES`) while the purchase GIN does not.
- **inventory-workflow/stock-adjustment-applet.md** (other lane): add `internal-purchase-gin-applet` to `related_applets` ("physical removal for goods dispatched on a GIN when no Purchase Return is raised").
- **sales-workflow/internal-delivery-order-applet.md, internal-sales-order-applet.md, internal-jobsheet-applet.md** (other lane): the GIN's line picker copies their lines and writes `IODO_IPGIN` / `ISO_IPGIN` / `IJS_IPGIN` links; add `internal-purchase-gin-applet` to `related_applets`.
- **purchase-workflow/internal-purchase-order-applet.md, internal-purchase-requisition-applet.md, internal-purchase-quotation-applet.md, internal-purchase-return-applet.md** (my lane) and **finance/internal-purchase-invoice-applet.md** (lane 2): add `internal-purchase-gin-applet` to `related_applets` (links `IPO_IPGIN`, `IPR_IPGIN`, `IPQO_IPGIN`, `IPRO_IPGIN`, `IPI_IPGIN`). Queue small edits for my lane's pages.
- **master-data/supplier-applet-1.md, organisation-applet.md, doc-item-maintenance-applet.md, inv-item-maintenance-applet.md** (other lane): add `internal-purchase-gin-applet` to `related_applets`.
- **A fiscal-year / period-lock page** (wherever it lives): document `LOCK_ALL` / `LOCK_TXN` and the FINAL message "The selected date falls within a locked fiscal period" (intranet #1616) — every generic document except stock transfers raises it.
- **purchase-workflow/internal-purchase-return-applet.md** (my lane, run 1): intranet #5579 — return postings intermittently write the inventory movement to the branch default store instead of the line's `guid_store`; add a troubleshooting row ("stock did not go into the damaged-goods location"). Same for **sales-workflow/internal-sales-return-applet.md** (other lane).
- **guides/purchasing-guides/standard-procurement-workflow.md**: if it mentions the GIN, say it is a dispatch record only.
- **planning/lanes/METHOD.md** (coordinator): fold in the six method findings above.

### Registry / naming mismatches

- `internalPurchaseGINApplet` registry row is complete (name, ACTIVE, documentation_url matches the page). No mismatch.
- Dev `main.ts` sets `appletCode = 'internal-purchase-gin-applet'`; neither it nor the registry code is in the shared screen's `tabMappings` or per-applet lists, so 47 shared toggles never render on a live tenant (documented as gear-only or "read without control").
- 22 client-side permission rows seeded; `INTERNAL_PURCHASE_GIN_DISPLAY_PRICING` and `SHOW_GENDOC_FINAL_BUTTON` are checked but not seeded; `SHOW_LAST_PURCHASE_PRICE` is seeded but not checked.

### Questions for Vincent

- **Is 0/0 intended for the Purchase GIN**, with `INTERNAL_PURCHASE_GIN_STOCK_OUT` as the future stock-moving variant (mirroring GRN vs GRN Stock In)? If so, is a "Purchase GIN Stock Out" applet planned — no repo or registry row exists today. The page states the backend fact and points users to Purchase Return / Stock Adjustment.
- Personal Default Selection is non-functional (unpopulated container, unsubscribed SAVE) and tenant Default Selection's branch/location are never applied — report to product or leave documented?
- Seed `INTERNAL_PURCHASE_GIN_DISPLAY_PRICING` (today non-admin users see no prices on the Lines tab)?
- Delete the four infographics (24 MB) and the four excluded screenshots, or re-take the screenshots on a clean tenant?

### Stopping point

One large document applet this run; the settings surface (shared screen + 31 gears + three applet-local screens) and the 0/0 posting proof each needed their own pass. Next in queue: `internal-purchase-grn-stock-in-applet.md` (registry "Purchase GRN Stock In Applet (Internal)", `internalPurchaseGrnStockInApplet` — this one IS in `tabMappings` and in `MA_WA_SERVER_DOC_TYPES`, so expect a real posting block).

## Run 12 — 2026-09-05 — internal-purchase-grn-stock-in-applet

### Page

- `content/en/applets/purchase-workflow/internal-purchase-grn-stock-in-applet.md` rewritten from applet @45f0bbd, shared-utilities @af523eb, ts-lib @7d1616a, backend @871dbf5, the registry, 51 seeded client-side permission rows and 28 issues. Title set to the registry name "Purchase GRN Stock In Applet (Internal)" (was "Purchase GRN Stock In (Internal) Applet"); `applet_code: internalPurchaseGrnStockInApplet`. The old page was a user-manual-style document (quick starts, worked example with an invented supplier name, FAQ, "Personalization" claims) with a correct core premise (this document does move stock) but no posting proof, no GL prerequisites and a settings table of five invented rows; replaced.

### Direction / posting facts (record for the guides)

- **This is the stock-moving receipt**: `INTERNAL_PURCHASE_GRN_STOCK_IN` is quantity +1 / amount −1; FINAL posts Dr `INVENTORY_NOT_INVOICED` (+ Dr `INPUT_TAX`) / Cr `CREDITOR_NOT_INVOICED`, creates `bl_inv_txn_line` rows and updates the company MA cost (`MA_WA_SERVER_DOC_TYPES`). The plain GRN and the GIN are 0/0. The old FAQ's "GIN typically reduces or reallocates stock" was dropped per METHOD §14.
- **Line-level GL codes are ignored for this document type** (`isConsignmentStockIn` in `JournalPostingService.getJournalContainer` covers `INTERNAL_PURCHASE_GRN_STOCK_IN` as well as the consignment types): precedence is header GL → item-company link (`INVENTORY_NOT_INVOICED` txn code) → company default. METHOD §9's "line → header → item → company" does not hold here.
- **The creditor line ignores the supplier's AR/AP type** for this document (`resolveArap(..., isSkip=true)` returns `CREDITOR_NOT_INVOICED`); the PI No Stock In later moves it to the trade creditor, but only when it carries a link to a GRN Stock In.
- **Inventory location precedence** (`InventoryTransactionLineFactory` L49–52): line `delivery_location_guid` → line `guid_store` → header `guid_store` → branch default location. This is the mechanism behind intranet #3856 ("lines of the same document posted to different locations").
- **The intercompany "Search" tab creates the wrong document type**: `IntercompanyController` hard-codes `INTERNAL_PURCHASE_GOODS_RECEIVED_NOTE`, so a GRN created from a sales invoice here lands in the plain GRN applet and moves no stock.
- **VOID does reverse everything** (negated inventory lines with `txn_code = VOID`, reverse journal, open-queue rows DELETED, serials unlocked) but is refused with `GENERIC_DOCUMENT_HAS_TARGET_LINKS` once a PI No Stock In has knocked the GRN off; the same guard applies to the FINAL → DRAFT action (`SHOW_DRAFT_BUTTON`).

### Method findings (add to METHOD.md)

- **§9 has an exception.** Purchase-side GL precedence skips the line GL for `INTERNAL_PURCHASE_GRN_STOCK_IN`, `INTERNAL_PURCHASE_CONSIGNMENT_GRN` and `INTERNAL_PURCHASE_CONSIGNMENT_RETURN` (`isConsignmentStockIn`). Check that flag before writing the precedence line on any purchase page.
- **Applet-local `SHOW_*`-named settings are opt-in, not hide keys.** This applet's `isShowColumn()` treats a setting whose name contains `SHOW` as "render only if the setting *or* the permission is true" (`SHOW_DRAFT_BUTTON`, `SHOW_GL_DIMENSION`, …). A gear that lists them as ordinary toggles is misleading; document them as opt-in.
- **`HIDE_EXTERNAL_* → HIDE_*` fallback** (`showExternalDocField`, `bareFallback` map) is a consumption path the key-name grep half-misses: the bare keys (`HIDE_QUOTATION` …) count as consumed even though only the `HIDE_EXTERNAL_*` names appear in the template.
- **`SHOW_DOCUMENT_DELETE_BUTTON` is read from the applet record's `APPLET_SETTINGS` extension** (`appletService.getByGuid(appletGuid)`), not from the master settings store — a third settings source beside master / personal. Pair with METHOD §15 (`PRICEBOOK_POINTS_AUTO_APPLY` read by `GenericDocumentService.getBooleanAppletSetting` for every generic document).
- **Shared screen typo**: `MAKE_ATTACHMENT_TAB_COMPULSORY` renders for `appletCode === 'internalPurchaseGRNStcokInApplet'` (sic), so the control never shows for the real code; the edit-form gear carries the key instead. Treat "gated by a misspelt applet code" as a `RENDERED?` case gates.py cannot see — it only evaluates the equality, it cannot know the string is a typo. Worth a warning in gates.py when a compared literal is not in the registry.
- **Listing FINAL needs `amount_net > 0`** (`disableFinalButton`), while the edit-form FINAL allows zero-amount documents — a documented asymmetry to check on every generic-document page.

### Screenshots with personal data

- Excluded: `static/images/internal-purchase-grn-stock-in-applet/path-a.png` — the Select Item grid shows a test item code containing a developer's first name and several real product / brand names; re-take with the item list filtered. Excluded as a NotebookLM infographic with marketing claims ("single source of truth", "three-way match", "financial safeguards"): `static/images/internal-purchase-grn-stock-in-applet/internal-purchase-grn-stock-in.png` (1.5 MB) — delete.
- Kept: `path-b.png` (listing with `PURGRNSI` test numbers and the KO For tab; staging tenant "TESTING"), `line-item-workspace-purgrn-stock-in.png` (test supplier "tesing", test bundle item). Both show only the tenant user's small avatar in the top bar, as in the screenshots kept in earlier runs.

### Cross-lane link requests

- **purchase-workflow/internal-purchase-grn-applet.md** (my lane, run 1): reword the GIN sentence per METHOD §14 and add the line "the intercompany SI → GRN endpoint creates this (0/0) type even when called from the GRN Stock In applet". Queue a small edit.
- **purchase-workflow/internal-purchase-invoice-no-stock-in-applet.md** (my lane, next): the page today says "non-inventory expenses — services, overheads" — wrong premise; it is the invoice leg of the GRN Stock In pair. Its journal is Dr `CREDITOR_NOT_INVOICED` / Cr `INVENTORY_NOT_INVOICED` (only with GRN Stock In links) plus the trade creditor.
- **finance/internal-purchase-invoice-applet.md** (lane 2): add a troubleshooting row for intranet #3940 (stock counted twice when a Purchase Invoice is raised for goods already received on a GRN Stock In) and a row for #5389 (migration duplicates → `SERIAL_NUMBER_ALREADY_EXISTS_FOR_COMPANY`). Add `internal-purchase-grn-stock-in-applet` to `related_applets` if missing.
- **inventory-workflow/stock-availability-applet.md** (other lane): document the `HIDE_GRN_STOCK_IN_DRAFT_BALANCE` option and that `po_qty` counts PO → GRN / PI / GRN Stock In queue rows; add `internal-purchase-grn-stock-in-applet` to `related_applets`.
- **inventory-workflow/stock-balance-applet.md** and **stock-adjustment-applet.md** (other lane): state the costing spec from intranet #5260 (only PI, purchase return, GRN Stock In, GIN stock-out, consignment, trade-in and Reset MA change the MA cost) and the zero-amount-inbound symptom (#5348); add `internal-purchase-grn-stock-in-applet` to `related_applets`.
- **purchase-workflow/internal-purchase-order-applet.md, internal-purchase-requisition-applet.md** (my lane): add `internal-purchase-grn-stock-in-applet` to `related_applets`; note the KO row `INTERNAL_PURCHASE_ORDER → INTERNAL_PURCHASE_GRN_STOCK_IN`.
- **purchase-workflow/internal-purchase-return-applet.md** (my lane): add the inventory-location precedence sentence (also explains intranet #5579 from run 11).
- **master-data/chart-of-account-applet.md, organisation-applet.md** (other lane): the company default GL codes `INVENTORY_NOT_INVOICED` and `CREDITOR_NOT_INVOICED` are required by this document type; add `internal-purchase-grn-stock-in-applet` to `related_applets`. A dedicated "default GL code mapping" page would be the right home — none found.
- **modules-v2/purchasing/_index.md** (line 44): "Goods Received Note … Stock Increased … Goods Received Not Invoiced" describes the GRN *Stock In*; say so, or the plain-GRN reader is misled (F-0038 covers the guides).
- **guides/purchasing-guides/standard-procurement-workflow.md, direct-grn-workflow.md**: state that a company chooses one receiving pair (GRN + Purchase Invoice, or GRN Stock In + PI No Stock In) and configures Knock Off Configuration for it; mixing pairs double-counts stock (#3940).
- **A Knock Off Configuration page** (none exists; `bl_fi_comp_gendoc_flow_config`): this applet needs PO → GRN Stock In and GRN Stock In → PI No Stock In rows, `LINE` flow rows gate the line-editor KO sub-tabs, and `doc_2_posting_status` decides the auto-created invoice's status.
- **planning/lanes/METHOD.md** (coordinator): fold in the six method findings above; amend §9.
- **kb/tools/gates.py** (coordinator): warn when an `appletCode === '…'` literal is not a registry code (would have caught `Stcok`).

### Registry / naming mismatches

- `internalPurchaseGrnStockInApplet` row: name and status fine, but `documentation_url` = `https://wiki.bigledger.com/applets/internal-purchase-grn-supplier-access-applet/` (wrong applet, and a path without the `purchase-workflow/` segment). Should be `https://wiki.bigledger.com/applets/purchase-workflow/internal-purchase-grn-stock-in-applet/`.
- The shared field-configuration screen spells the code `internalPurchaseGRNStcokInApplet` in one gate (attachment-compulsory toggle).
- Permissions: 51 seeded / 48 checked; not seeded but checked: `SHOW_GENDOC_FINAL/VOID/DISCARD_BUTTON`, `SHOW_LISTING_BRANCH`, `SHOW_QTY_MAIN_LISTING`, `SHOW_QUOTATION/ORDER/DELIVERY_ORDER/INVOICE/OTHERS`, `SHOW_GL_DIMENSION/SEGMENT/PROFIT_CENTER/PROJECT`; seeded but never checked: `SHOW_FINAL_BUTTON`, `SHOW_DISABLE_EDITING_AMOUNT_TXN_SETTING`, `IPGRN_HIDE_TRACKING_ID_AND_PERMIT_NO`. Extract in `planning/lanes/lane-3/perm-dfn/internalPurchaseGrnStockInApplet.tsv`.
- Two new customer-repo pseudonyms added to `kb/private/repo-pseudonyms.tsv` (`customer-repo-628f52`, `customer-repo-26f25a`) for the repos referenced in the applet's recent commit messages.

### Questions for Vincent

- **Should the intercompany Search tab in this applet create a GRN Stock In?** Today the backend hard-codes the plain GRN type, so intercompany receipts through this applet never move stock. Either add a stock-in variant of the endpoint or hide the tab here (the page tells users to use PO knock-off instead).
- **Fix the registry `documentation_url`** for `internalPurchaseGrnStockInApplet` (points at the supplier-access page).
- **Seed the missing `SHOW_GENDOC_*` permission codes** for this applet (the `HIDE_GENDOC_*` hides cannot be reopened per role until then) — same question as for the GIN and GRN.
- **Line GL codes are silently ignored** for GRN Stock In journals (`isConsignmentStockIn`). Intended? If yes, the Lines tab should not offer a GL code field for this applet (`HIDE_LINE_ITEMS_GL_CODE` exists but is off by default).
- Delete the infographic and re-take `path-a.png` on a clean tenant.

### Stopping point

One large document applet this run; the settings surface (212 keys, 8 gears, four applet-local screens) and the +1/−1 posting chain with its GL-precedence exception each needed a full pass. Next in queue: `internal-purchase-invoice-no-stock-in-applet.md` (the invoice leg of this pair — its current page has the wrong premise, see cross-lane requests).

## Run 13 — 2026-09-05 — internal-purchase-invoice-no-stock-in-applet

### Page

- `content/en/applets/purchase-workflow/internal-purchase-invoice-no-stock-in-applet.md` rewritten from applet @77722d9, shared-utilities @af523eb, ts-lib @7d1616a, backend @871dbf5, the registry, 66 seeded client-side permission rows and the issue set (applet #18; intranet #3940, #3939, #4339, #3329, #4338, #1616, #5071, #4803, #4717, #3324, #934, #3714). Title set to the registry name "Purchase Invoice No Stock In (Internal)" (was "… Applet"); `applet_code: internalPurchaseInvoiceNoStockInApplet`. The old page was a user-manual-style document whose central premise — an invoice for "services, overheads and intangible purchases" — is wrong; it also invented a settings list, a "Personalization" section, a knock-off-settings description and an e-Invoice submission workflow that the backend does not support for this type. Replaced.

### Direction / posting facts (record for the guides)

- **This is the invoice leg of the GRN Stock In pair, not a services invoice**: `INTERNAL_PURCHASE_INVOICE_NO_STOCK_IN` (`PURINVNSI`) is quantity 0 / amount −1. FINAL posts Dr `PURCHASE` (line GL honoured) / Dr `INPUT_TAX` / Cr `CREDITOR` (or `CREDITOR_NON_TRADE` from the supplier's AR/AP type) and — only when the invoice has an active knock-off link as target — Dr `CREDITOR_NOT_INVOICED` / Cr `INVENTORY_NOT_INVOICED`. No inventory transaction, no MA cost change.
- **The accrual leg keys on any link, not on a GRN Stock In link**: `GenericDocumentLinkUow.getGenDoc1Guids` filters on `status <> 'DELETED'` only, so a PI No Stock In knocked off from a Purchase Order alone also moves the accrual accounts with nothing to clear.
- **The pair never clears exactly when tax is captured**: the reversal leg uses `totalAmount` summed after the tax lines (net + tax) while the GRN Stock In accrued `INVENTORY_NOT_INVOICED` for the net only. Tax on both documents → `INPUT_TAX` debited twice; tax on one → accrual residual equal to the tax. Guides must say "capture tax on one document of the pair and reconcile the residual" until the backend changes.
- **Self-billed e-Invoice is not supported for this type**: the applet has a SELF-BILLED bulk action and an E-Invoice tab (Submission / Progress / Notification / Cancellation / Matched History), and the backend `doc-self-billed/backoffice-ep` accepts the document, but `MyEInvoiceToIRBProcessorService.PURCHASE_DOC_TYPES` and `getDocumentTypeCodes` do not list `INTERNAL_PURCHASE_INVOICE_NO_STOCK_IN` (applet #18 open since 2026-06). Guides must route self-billed invoices through the ordinary Purchase Invoice.
- **The auto-created invoice carries KO links** (`GenericDocumentConverter` L47–90 writes one `KO` link per line), so the accrual leg fires for converter-created documents; posting status follows `doc_2_posting_status` (default FINAL — an auto-FINAL invoice with no review step unless the row says DRAFT).
- **No FINAL → DRAFT** in this applet (the seeded `HIDE_DRAFT_BUTTON` permission is dead); listing FINAL has no `amount_net > 0` guard (unlike the GRN Stock In).

### Method findings (add to METHOD.md)

- **The accessor regex for the "consumed" proof misses destructured reads.** Main Details reads `b.DEFAULT_LOCATION` inside a `combineLatest` tuple; `EDIT_CONTRA_TXN_DATE`, `HIDE_CLONE_BUTTON`, `HIDE_PRINT_BUTTON`, `HIDE_MULTI_DISCOUNT`, `HIDE_RELATED_DOCUMENTS`, `HIDE_DELIVERY_TRIPS` and the personalization keys were all "rendered-never-read" by the regex and consumed by a plain key grep. Always run a second pass: plain grep of every "never read" key across `src/app` minus `models/` and the settings screens, excluding gear-list lines.
- **`getGenDoc1Guids`-style link checks are source-agnostic.** When a journal leg is conditioned on "has a link", check the UOW's WHERE clause before writing "when linked to a GRN Stock In" — here it is any target link.
- **e-Invoice support is a backend allow-list, not an applet feature.** An applet can ship a full E-Invoice tab and bulk action while the type is absent from `MyEInvoiceToIRBProcessorService.PURCHASE_DOC_TYPES` / `getDocumentTypeCodes`. Check those lists for every document page that shows e-Invoice UI (sales-side list at L44–52 of the same file).
- **Knock Off Settings screens in document applets are decoys.** This applet (like the PI) has a `knock-off-settings` route with eight `KNOCK_OFF_BY/FOR_*` toggles that are persisted and never read; the KO tabs read `bl_fi_comp_gendoc_flow_config`. Document them as "saved and ignored" and point at the company Knock Off Configuration.
- **`DATE_TXN_LOGIC` is a Default Selection key that changes backend behaviour**: sent as `posting_status.date_txn_logic`, it overwrites `date_txn` at FINAL before the fiscal-period check. Worth a row on every document page whose Default Selection has it.
- **Listing/permission asymmetries between sibling applets are real**: here `SHOW_GENDOC_FINAL/VOID/DISCARD_BUTTON` are seeded (they were not for the GRN Stock In) but `SHOW_GENDOC_SAVE_BUTTON` and `ALLOW_TO_CREATE_EDIT_ACCOUNT` are not. Never copy the permission section from a sibling.

### Screenshots with personal data (kept 8 of 20, none moved)

- **Excluded from the page (loop to quarantine / delete under `static/images/Purchase-Invoice-No-Stock In-applet/`)**: `Purchase-Invoice-No-Stock In-applet-overview-infographic.png` (NotebookLM-style marketing infographic, "streamlining business workflows", "phantom stock"); `edit-account-tab.png`, `edit-line-item-doc-link.png`, `line-items-listing.png` (supplier name containing a developer's first name); `create-account-select-supplier.png` (supplier grid with a developer's e-mail, an external company e-mail, two real-looking company names and a TIN column); `edit-line-items.png`, `edit-delivery-details.png`, `line-items-search-filter.png` (real printer-consumable brand and model names as items); `create-contra-tab.png` (contra picker listing several real supplier / brand names, one matching a customer repo slug); `file-import-listing.png`, `file-import-checking.png` (import file names that look like a customer name; a branch code that looks like a real company); `file-import-details.png` (a staff member's e-mail as Created By).
- Kept: `invoice-listing.png`, `listing-search-filter.png`, `listing-search-filter-extended.png`, `create-main-details.png`, `create-search-document.png`, `create-line-items-select-item.png`, `edit-main-details.png`, `edit-e-invoice-tab.png` — staging tenant "TESTING", generic test companies / branch codes, the tenant user's small avatar only. The Lines tab and Account tab are now unillustrated; re-take on a clean tenant.
- `listing-search-filter.png` and `create-main-details.png` show test company / branch codes that could be abbreviations of real names; judged generic, flagging for Vincent's call.

### Cross-lane link requests

- **purchase-workflow/internal-purchase-grn-stock-in-applet.md** (my lane, run 12): add the tax-residual sentence to the "Tax codes" prerequisite and a Troubleshooting row "Creditor Not Invoiced / Inventory Not Invoiced never net to zero"; note that the auto-created PI No Stock In defaults to FINAL. Topic file already extended.
- **finance/internal-purchase-invoice-applet.md** (lane 2): state that it is the purchase invoice type the self-billed e-Invoice pipeline recognises and that PI No Stock In is not; keep `internal-purchase-invoice-no-stock-in-applet` in `related_applets`.
- **finance/internal-payment-voucher-applet.md** (other lane): add `internal-purchase-invoice-no-stock-in-applet` to `related_applets` (settles its creditor balance; `INTERNAL_PAYMENT_VOUCHER` handler).
- **purchase-workflow/internal-purchase-return-applet.md, internal-purchase-credit-note-applet.md, internal-purchase-debit-note-applet.md** (my lane): add `internal-purchase-invoice-no-stock-in-applet` to `related_applets`; the return page should say its `RETURN` link blocks VOID of the source PI No Stock In.
- **purchase-workflow/internal-purchase-order-applet.md, internal-purchase-requisition-applet.md, supplier-delivery-order-applet.md** (my lane): add `internal-purchase-invoice-no-stock-in-applet` to `related_applets`; PO page: note that a PO-only knock-off into a PI No Stock In fires the accrual-reversal leg.
- **e-invoice/my-e-invoice-admin-applet.md** (my lane, run 6): add a line that `INTERNAL_PURCHASE_INVOICE_NO_STOCK_IN` is not in the purchase document-type allow-list (self-billed) and link here.
- **master-data/chart-of-account-applet.md, organisation-applet.md** (other lane): the company default GL codes `PURCHASE`, `CREDITOR` / `CREDITOR_NON_TRADE`, `INPUT_TAX`, `CREDITOR_NOT_INVOICED`, `INVENTORY_NOT_INVOICED` are required by this document type; add to `related_applets`.
- **guides/purchasing-guides/standard-procurement-workflow.md, direct-grn-workflow.md**: present the two receiving pairs; say tax is captured on one document of the pair and the accrual residual is reconciled; say self-billed e-Invoices go through the ordinary Purchase Invoice.
- **A Knock Off Configuration page** (none exists): the `INTERNAL_PURCHASE_GRN_STOCK_IN → INTERNAL_PURCHASE_INVOICE_NO_STOCK_IN` row and its `doc_2_posting_status` decide auto-creation and its status; `LINE` rows gate every KO tab in this applet.
- **planning/lanes/METHOD.md** (coordinator): fold in the six method findings above.
- **kb/tools** (coordinator): add a plain-grep second pass to the four-proof script for "never read" keys.

### Registry / naming mismatches

- `internalPurchaseInvoiceNoStockInApplet` row: name, status and `documentation_url` all correct. Old page title had a trailing "Applet"; fixed.
- Permissions: 66 seeded / 38 checked; 28 seeded-never-checked; 27 checked-not-seeded (list on the page). Extract in `planning/lanes/lane-3/perm-dfn/internalPurchaseInvoiceNoStockInApplet.tsv` (server rows: the five `TNT_API_DOC_INTERNAL_PURCHASE_INVOICE_NO_STOCK_IN_*` codes).
- The applet's latest merge commit references a customer-support repo in its branch name; not cited, no pseudonym needed.

### Questions for Vincent

- **Accrual-reversal leg amount**: should it be the net (matching the GRN Stock In's `INVENTORY_NOT_INVOICED` debit) rather than net + tax? As coded, the pair never clears when tax is captured. This is a backend bug candidate.
- **Accrual-reversal trigger**: should it require a link whose source is `INTERNAL_PURCHASE_GRN_STOCK_IN`? Today any target link (e.g. PO-only) fires it.
- **Self-billed e-Invoice for this type** (applet #18): add the type to the pipeline, or hide the SELF-BILLED button and E-Invoice tab in this applet until then?
- Should the dead Knock Off Settings screen (route present, menu commented, keys never read) be removed from this applet and the PI?
- Seed `SHOW_GENDOC_SAVE_BUTTON`, `ALLOW_TO_CREATE_EDIT_ACCOUNT`, `ALLOW_LINE_ITEM_EDIT` and the listing `SHOW_*` codes for this applet; retire the 28 seeded-never-checked codes.
- Quarantine the 12 excluded screenshots and re-take the Lines / Account / Line Items screens on a clean tenant.

### Stopping point

One large document applet this run; the wrong premise meant every section was rebuilt, and the posting proof needed the link UOW, the converter and the e-Invoice allow-lists read end to end. Next in queue: `internal-purchase-quotation-applet.md`.

## Run 15 — 2026-09-05 — internal-purchase-quotation-applet

(Run 14 was killed by a rate limit before writing anything; this run resumed from the same queue head.)

### Page

- `content/en/applets/purchase-workflow/internal-purchase-quotation-applet.md` rewritten from the applet @1f16762 (shared-utilities submodule pinned @49b834e; gates checked at that commit and at HEAD af523eb — identical set for this code), backend @871dbf5, akaun_master perm-dfn extract, and eight issues. Title corrected to the registry name (trailing "Applet" dropped).
- The previous page was a NotebookLM-style marketing page (a "Golden Triangle of Procurement", "posting integrity", "financial auditability", "100% audit traceability") with invented settings (`DEFAULT_BRANCH_GUID`, `DEFAULT_LOCATION_GUID`, `DEFAULT_PRINT_FORMAT`, `ALLOW_DOCUMENT_VOID`) and invented header fields (Delivery Instruction / Delivery Date on the header; the header Delivery Details tab is a read-only delivery-job grid). All replaced.

### Direction / posting facts (record for the guides)

- `INTERNAL_PURCHASE_QUOTATION` (`PURQUO`) is **0 / 0**: no stock movement, no journal, no handler in `JournalPostingTypeHandler`, no converter. The type appears in six backend files only. Any guide saying a quotation "posts" or "locks" anything financially is wrong.
- Lifecycle: CREATE → `TEMP`; SAVE → ACTIVE / DRAFT; FINAL → links re-PUT with `posting_status FINAL`; VOID only from the listing (`/backoffice-ep/void/`), blocked by `GENERIC_DOCUMENT_HAS_TARGET_LINKS` when a PO has knocked the quotation off; DISCARD blocked for FINAL / VOID.
- **Knock-off is a one-shot, TEMP-only operation** (`GenericDocLinkService.knockOff` throws "Target Gen Doc is not in TEMP status" after the first SAVE or first knock-off). The newer `knock-off-draft` endpoint is not used by this applet.

### Method findings (add to METHOD.md)

1. **Copy-pasted KO components carry the source applet's flow-row, queue and permission checks.** The PQ's KO For tab requests flow rows for target `INTERNAL_PURCHASE_ORDER`, renders only when the PR→PO row is enabled, lists PR→PO queue rows and checks `TNT_API_DOC_INTERNAL_PURCHASE_ORDER_CREATE_TGT_GUID`. The "Before you can use it" prerequisite is therefore a row that names a *different* document. Always read `serverDoc2` in `getKOSettingsInit` and the `line_open_queue_server_doc_type_2` criteria, not the tab label.
2. **Queue decrement is keyed on the link's target type** (`getExistingOpenQueue` matches `server_doc_type_2 = link.server_doc_type_doc_2_hdr`). A knock-off whose tab lists queue rows for another target type (as here) leaves those rows untouched; only the link sum in `knockOff` prevents double-quoting. State which queue row (if any) is actually reduced.
3. **Hide-permissions exist**: `HIDE_PRICE` is seeded and checked as "grant to hide". Do not assume every `bl_applet_client_side_perm_dfn` code is a `SHOW_*` re-enable; read the consumer.
4. **A permission can lock a plain field**: the transaction-date picker is `[disabled]="!SHOW_TRANSACTION_DATE"`. Fields disabled by permission belong in the Fields table's Required/Notes column and in Troubleshooting.
5. Applets refactored onto `blg-akaun-ng-lib` (intranet #4115) may still carry an old, small settings model (102 keys here). Do not assume the family's 150–260-key model; run the four proofs on the model that is actually there.
6. The shared-utilities **submodule commit** in the applet repo (`.gitmodules` / `git submodule status`) is the rendered-proof source for that applet's deployed bundle; run `gates.py` against that commit (extract the two files with `git show <sha>:path`) and note whether HEAD differs. Here it did not.

### Screenshots (kept 1 of 7, none moved)

- Excluded from the page (still on disk under `static/images/internal-purchase-quotation-applet/` — not in my folders; loop to quarantine): `listing-and-main-details-view.png` (listing rows whose Branch Code / Supplier columns show a code identical to a customer repo slug and a second real-looking supplier code); `golden-triangle-procurement-lifecycle.png` (**a screenshot of a video-sharing site with a third-party CRM advertisement and the company channel visible — not an applet image at all**); `purpose-and-overview-infographic.png`, `key-features-overview.png` (NotebookLM-branded), `internal-purchase-quotation-applet-overview.png` (generated marketing infographics with claims like "100% Audit Traceability", one with a garbled caption); `workspace-tabs-architecture.png` (generated diagram; says "KO For (Draft Only)" — it is TEMP-only).
- Kept: `line-items-page-view.png` (staging tenant, generic test items).

### Cross-lane link requests

- **purchase-workflow/internal-purchase-requisition-applet.md** (my lane): add that the PQ's KO For tab depends on the **PR→PO** flow row, that a quotation knock-off does not reduce the requisition's PR→PO open quantity, and that "quotations are not knock-off sources in this applet" (L279) is correct but the reverse direction exists; keep `internal-purchase-quotation-applet` in `related_applets`.
- **purchase-workflow/internal-purchase-order-applet.md** (my lane): add a Troubleshooting row "cannot VOID the quotation — `GENERIC_DOCUMENT_HAS_TARGET_LINKS`" pointing at the PO link, and state that the PQ sub-tab needs the PQ→PO flow row.
- **sales-workflow/internal-sales-quotation-applet.md** (other lane): check whether its KO tab is the same copy (queries SO / sales-order rows?), state 0/0, and whether it has the same `HIDE_PRICE` / `SHOW_TRANSACTION_DATE` permissions.
- **guides/purchasing-guides/standard-procurement-workflow.md**: the guide never names the quotation applet (it only talks about attaching a supplier's PDF quote). Add one step "record the quote as a Purchase Quotation, then knock it off into the PO", and say it posts nothing.
- **modules-v2/purchasing/related-applets/_index.md**: description "Vendor price requests and bidding proposals" — there is no bidding / comparison feature; say "records a supplier's quote; feeds the Purchase Order".
- **A Knock Off Configuration page** (none exists): add the PR→PO row as the PQ tab's prerequisite (copy-paste dependency) and the PQ→PO row for the PO's sub-tab.
- **planning/lanes/METHOD.md** (coordinator): fold in the six method findings above.

### Registry / naming mismatches

- `internal-purchase-quotation-applet` row: name, status and `documentation_url` correct. Page title had a trailing "Applet"; fixed.
- Permissions: 24 seeded / 24 checked; 2 checked-not-seeded (`SHOW_AMOUNT_MAIN_LISTING`, `SHOW_SST_VAT_GST_AMOUNT`). The 2026-07 seeding sweep (intranet #5412) did not include this applet. Extract in `planning/lanes/lane-3/perm-dfn/internal-purchase-quotation-applet.tsv` (client-side rows only; server-side codes are the four `TNT_API_DOC_INTERNAL_PURCHASE_QUOTATION_*` constants).
- The applet's 2026-01/02 commits reference a customer-support repo in their branch names; not cited, no pseudonym needed.

### Questions for Vincent

- **KO For tab reads the Purchase Order's flow row, queue and permission** (copy-paste from the PO applet). Should it be changed to PR→PQ (and `TNT_API_DOC_INTERNAL_PURCHASE_QUOTATION_CREATE_TGT_GUID`)? Until then the page documents the PR→PO row as the prerequisite. Bug candidate.
- Is **one knock-off per quotation** (TEMP-only) acceptable, or should the tab use `knock-off-draft/backoffice-ep` like the newer applets?
- The `SHOW_TRANSACTION_DATE` lock on the date picker: intended for all tenants? It means every quotation is dated on creation unless the role is granted the code.
- Seed `SHOW_AMOUNT_MAIN_LISTING` and `SHOW_SST_VAT_GST_AMOUNT`; give the 24 API-only keys a control or drop them from the model; remove `HIDE_LAST_PURCHASE_PRICE`, `HIDE_VALIDITY_DATE`, `DEFAULT_COMPANY` (saved, never read).
- Quarantine the six excluded images — one is a screenshot of a video site with a third-party advertisement and must not stay on the public site. Re-take the listing on a clean tenant.

### Stopping point

One document applet this run (a small one, but every section had to be rebuilt from scratch because the old page was marketing copy, and the knock-off path needed the backend service read end to end). Next in queue: `internal-purchase-refund-note-applet.md`.

## Run 16 — 2026-09-05 — internal-purchase-refund-note-applet

### Page

- `content/en/applets/purchase-workflow/internal-purchase-refund-note-applet.md` rewritten from the applet @5ba2cb5 (shared-utilities submodule pinned @f1ded04; gates checked there and at HEAD af523eb — identical set for this code), backend @871dbf5, ts-lib, the registry, a zero-row perm-dfn extract and 17 issues. Title set to the registry name "Purchase Refund Note Applet (Internal)" (the registry name carries the word "Applet" for both refund-note applets; the old page said "Purchase Refund Note (Internal) Applet").
- The old page was a NotebookLM-style marketing page ("Incoming Credit Adjustment", "intercompany reconciliation discipline", audit-and-control bullets) with no settings, no fields and an invented intercompany premise. Replaced.

### Direction / posting facts (record for the guides)

- **The backend flipped this document's signums on 2026-04-23** (`68f9eaa3ad`, one-file commit titled "Error Creating Purchase Report from M2 api", referencing customer-repo-4f0baa#165): `InternalPurchaseRefundNoteDataConsistencyObject` went from amount −1 / quantity 0 to **amount +1 / quantity −1** — the Purchase Return shape. `ServerDocTypes.INTERNAL_PURCHASE_REFUND_NOTE(-1,1)` agrees.
- **The applet still sends header `amount_signum = -1`** (`hdr.states.ts` L45; `convertToActive$` L367) on CREATE and SAVE. The PUT path (`updateGenericDoc → basicUpdateGenericDoc → fillAndValidateForUpdate → specificValidationForUpdate → checkAmountSignum(+1)`) returns `GENERIC_DOC_INVALID_SIGNUM`; only the TEMP create (`createTempGenericDoc`, no validation) succeeds. **On a backend carrying that commit, no refund note can be created from this applet.** The importer goes through the validated `createGenericDoc` with the same result. Not verified against a live tenant (would need document counts — tenant data); flagged for Vincent.
- **Line signums are filled per LINE type, not per header** (`GenericDocumentDataConsistencyObject` L802–L808 / L1102–L1107 match `handlers` on the line's `server_doc_type`). This applet writes Revenue-tab lines as `INTERNAL_SALES_INVOICE` (−1 / +1), Expense-tab lines as `INTERNAL_PURCHASE_INVOICE` (+1 / −1), everything else as the refund note (−1 / +1), CASH_BACK settlement lines as `INTERNAL_PAYMENT_VOUCHER`, and CHEQUE settlement lines with **no** type (the applet's −1 survives). `STL_MTHD_SERVER_DOC_TYPE_REPAIR_MAP` repairs only sales return / sales refund note settlement lines to the payment voucher.
- Net posting (generic PURCHASE handler): Revenue lines **Cr Purchase**, tax **Cr Input Tax**, settlement lines **Cr Cashbook**, entity **Dr Creditor** — a Purchase-Return-like document whose cash leg is credited (a payment out), which is not a supplier refund. Before April the PNS leg was Dr Purchase (invoice-like) and the cash leg Dr Cashbook. Neither version is a coherent "supplier refunds us" document. Stock: Revenue-tab item lines are outbound movements and FINAL validates their stock balance by default.
- No intercompany pairing for this type; not in `PurchaseReportUow`; present in the e-Invoice discrepancy report and both purchase allow-lists (self-billed type 14).

### Method findings (add to METHOD.md)

1. **Check the DCO's git history, not just its current constants.** A one-file signum flip five months ago is invisible from the constants alone; `git log -p -- <DCO>` shows whether the applet's `AppletConstants` were ever aligned. Here they were not, and the mismatch is a hard failure on CREATE.
2. **Line signums come from the line's `server_doc_type`, not the header's.** Applets in the receipt-voucher family write lines of other document types (sales invoice / purchase invoice / payment voucher). The posting proof block must list the signum per line kind, and the "amount signum" row of the block is the header check only.
3. **`createTempGenericDoc` skips validation; the PUT validates.** "Create works" in a test means only that the TEMP row was written; the failure surfaces on the CREATE button's PUT. When documenting a creation failure, name the endpoint that throws.
4. **A permission ticket can be closed with zero rows seeded** (intranet #4492 closed because `client-side-permission-listing` exists in the routes). Always run the perm-dfn count; do not trust closed BLPR permission tickets.
5. **`INTERNAL_..._DISPLAY_PRICING` is a show-permission with a hide default**: `hidePriceFlag = !checkPermission(code)` hides the price columns for everyone when the code is not seeded. Check the polarity of every `checkPermission` call, not only the `SHOW_*` re-enables.
6. `gates.py` marks `HIDE_EXPORT_TAB` "RENDERED?(runtime: showExportTab || appletCode==…)" — the runtime value depends on `tabMappings`; when the registry code is absent from the map treat it as gated out.

### Screenshots (kept 7 of 12, none moved)

- **Excluded from the page (loop to quarantine under `static/images/internal-purchase-refund-note-applet/`)**: `infographics.png` (generated marketing infographic, "Optimizing Intercompany Credits", stakeholder-benefit boxes); `personalization.png` (a staff member's full name and e-mail address in the profile panel); `revenue_tab.png` (browser chrome with the tester's bookmarks bar and profile visible); `select_revenue.png` (item picker whose test item codes carry a developer's first name three times); `settlement.png` (settlement method named after a developer).
- Kept: `Main_Listing_Main_Tab.png`, `Account_tab.png`, `supplier_selecting.png`, `expenses.png`, `arap.png`, `e-invoice.png`, `Settings.png` — staging tenant, generic test entities (`dfsdf`, `testing17`, "NEW BUNDLE ITEM"), the tenant user's small avatar only. `supplier_selecting.png` lists one test entity with a plain first name as its name; judged generic, flagging for Vincent's call. The Revenue and Settlement tabs are now unillustrated; re-take on a clean tenant.

### Cross-lane link requests

- **sales-workflow/internal-sales-refund-note-applet.md** (other lane): title should be the registry name "Sales Refund Note Applet (Internal)" (page has "Sales Refund Note (Internal) Applet"); add `internal-purchase-refund-note-applet` to `related_applets`; state that its settlement lines are repaired to `INTERNAL_PAYMENT_VOUCHER` by `STL_MTHD_SERVER_DOC_TYPE_REPAIR_MAP` (the purchase twin's are not); check whether its DCO (amount −1 / quantity +1) matches the applet's constants.
- **finance/internal-payment-voucher-applet.md** (other lane): add `internal-purchase-refund-note-applet` to `related_applets` (CASH_BACK settlement lines are stored as payment-voucher lines; contra partner).
- **finance/internal-purchase-invoice-applet.md** (lane 2): add `internal-purchase-refund-note-applet` to `related_applets`; note that Expense-tab lines of a refund note are stored as purchase-invoice lines.
- **purchase-workflow/internal-purchase-return-applet.md** (my lane): add one sentence that the refund note carries the same signums since April 2026 and is not creatable from its applet on current backends; keep the link.
- **purchase-workflow/internal-purchase-debit-note-applet.md, internal-purchase-credit-note-applet.md** (my lane): add `internal-purchase-refund-note-applet` to `related_applets` (credit note already links in prose).
- **e-invoice/my-e-invoice-admin-applet.md** (my lane, run 6): add `internal-purchase-refund-note-applet` to `related_applets`; the self-billed table should list type 14 (Self-billed Refund Note) and 12/13 for return-or-debit / credit note.
- **master-data/cashbook-applet.md, chart-of-account-applet.md, organisation-applet.md, supplier-applet-1.md, tax-configuration-applet.md, doc-item-maintenance-applet.md** (other lane): add `internal-purchase-refund-note-applet` to `related_applets`.
- **guides/purchasing-guides/**: no guide mentions the refund note; until the signum question is settled, guides should route supplier refunds through Purchase Return (goods) or Purchase Debit Note (money) and not through this applet.
- **planning/lanes/METHOD.md** (coordinator): fold in the six method findings above.
- **kb/tools/gates.py** (coordinator): resolve the `RENDERED?(runtime: …)` verdicts against `tabMappings` for the given code.

### Registry / naming mismatches

- `internalPurchaseRefundNoteApplet` row: name "Purchase Refund Note Applet (Internal)", ACTIVE, `documentation_url` correct. Page title corrected to the registry name.
- **Permissions: 0 seeded / 25 checked** (`SHOW_GENDOC_FINAL/DISCARD/VOID_BUTTON`, `SHOW_DOC_NO_*` ×3, `SHOW_CLIENT_DOC_TYPE`, `SHOW_CLIENT_DOC_1–5`, `SHOW_DESCRIPTION`, `SHOW_ARAP_*` ×5, `SHOW_TRANSACTION_DATE`, `INTERNAL_PURCHASE_REFUND_NOTE_DISPLAY_PRICING`). Extract (header only) in `planning/lanes/lane-3/perm-dfn/internalPurchaseRefundNoteApplet.tsv`. The sales twin has one seeded row.
- The April 2026 backend commit and the applet's issue #3 reference a customer-support repo; cited by pseudonym `customer-repo-4f0baa` (already in `kb/private/repo-pseudonyms.tsv`).

### Questions for Vincent

- **Is the Purchase Refund Note creatable on production today?** Code says CREATE/SAVE fail with `GENERIC_DOC_INVALID_SIGNUM` since `68f9eaa3ad` (2026-04-23). An aggregate count of `INTERNAL_PURCHASE_REFUND_NOTE` headers created after that date across tenants would confirm; I did not run it (tenant data). If confirmed: align `AppletConstants` and the two header assignments with the DCO, or revert the DCO.
- **What is the intended accounting shape?** Current DCO = Purchase Return (Cr Purchase, stock out, cash leg credited). A supplier refund would be Dr Cashbook / Cr Creditor with no stock movement. Decide, then add a `STL_MTHD_SERVER_DOC_TYPE_REPAIR_MAP` entry for the purchase refund note (→ receipt voucher) as the sales side has (→ payment voucher).
- Should the Revenue / Expense tabs (lines stored as sales-invoice and purchase-invoice types) stay on a purchase document, or is this receipt-voucher inheritance to be removed?
- Seed the 25 client-side codes checked in code — at minimum `INTERNAL_PURCHASE_REFUND_NOTE_DISPLAY_PRICING` (price columns are hidden for everyone) and `SHOW_TRANSACTION_DATE` (date locked for everyone).
- Rename the listing column "Customer Name" to "Supplier Name"; restore the Line Items menu entry or drop the route; remove the unbound applet-local `field-configuration` component.
- Quarantine the five excluded images; re-take Revenue and Settlement on a clean tenant.

### Stopping point

One document applet this run; every section was rebuilt and the posting proof needed the DCO history, the per-line fill loops, the update path and the settlement-line repair map read end to end. Next in queue: `internal-purchase-requisition-applet.md`.

## Run 17 — 2026-09-05 — internal-purchase-requisition-applet

### Page

- `content/en/applets/purchase-workflow/internal-purchase-requisition-applet.md` rewritten from the applet @6c281e1 (2026-08-26; shared-utilities submodule @8ae0e9b, gates cross-checked at org HEAD af523eb), backend @353fa9a (2026-09-05), ts-lib, the registry, a 51-row perm-dfn extract (`planning/lanes/lane-3/perm-dfn/internal_purchase_requisition.tsv`) and 35 issues. Title set to the registry name "Purchase Requisition (Internal)" (old page: "Purchase Requisition (Internal) Applet"); `applet_code: internal_purchase_requisition`.
- The old page was a NotebookLM-style guide (Quick Start by role, Glossary, FAQ, marketing infographic) with several wrong claims: "Submit for approval … locking the draft", "Discard … no record remains", "approvals route by branch, department, or amount", "Line Items Queue … line-level approval before or alongside document approval". Kept the good prose (the "pre-approved shopping list" framing, Line Items menu vs Lines tab, Approval Request vs the submit button, Void vs Discard) and five screenshots.

### Lane-4 cross-check: approval IS enforced here (answering their run-10 request)

- Unlike the Stock Requisition, this applet **calls the backend approval controller**: Generic Doc Approval tab → `POST generic-doc/approvals/backoffice-ep` (create) → `PUT …/approvals/processors/submission/backoffice-ep` (submit) → `GenericDocApprovalSubmissionService.validateApprovalData` rejects (400 `ERROR_TO_SHOW_IN_UI`) when the submitter entity or approval setting is missing, no branch designation carries the submitter's designation code for that setting, that designation has no approver links, the approvers cover fewer distinct levels than *Total Required Approval Levels*, or the submitter has resigned. Then three queue processors (primary → sequence → request) build sequences, create approver requests, e-mail approvers (template `GENERIC_DOC_APPROVAL_PENDING_APPROVAL_NOTIFICATION`, Thymeleaf decision form link) and advance levels by quorum. **The Approval Settings / Branch Designation screens are the same components lane 4 documented; here they are consumed.**
- **Approval Logic (ANY/ALL), Min/Max Approval Amount and Approver Designation are copied to the sequence rows but never evaluated** by the generic-document processors (only `approval_quorum` vs `approval_quorum_count` advances a level). *Employee Ranking* (`entity_approval_rank` 1–10) has no backend reader at all.
- **Auto-FINAL fires at the first approve action**: `GenericDocApprovalRequestProcessor` L200–201 calls `updatePostingStatusWithChecks(FINAL)` when `date_final_approval != null || request.approval_status == APPROVED`; the second operand is always true inside the approve branch. A two-level setting finalises the requisition after level 1. Documented as observed; bug candidate (last touched 2025-11-11, `3b67b07003`).
- **Plain FINAL is never gated**: `GenericDocumentService` has no reference to the approval tables. Enforcement = hide FINAL (`HIDE_GENDOC_FINAL_BUTTON`; `SHOW_GENDOC_FINAL_BUTTON` is not seeded so nobody can re-enable it) — exactly intranet #744's design.
- **Line Items Queue › APPROVE** (`gen-doc-line-open-queues/backoffice-ep/batch-approve`) sets `approval_status = APPROVED` on open-queue rows; no reader exists in javasdk/akaun-api outside the data layer, and the PO applet's KO does not filter on it. Marker, not gate.

### Other facts (record for the guides)

- Signums 0/0 in DCO, `ServerDocTypes` and `AppletConstants` — aligned (no refund-note-style mismatch). No journal, no stock; FINAL creates open-queue rows only with the company row PR → PO.
- KO For offers **Jobsheet only** (PO / GRN / PQ sub-tabs commented out). The panel-view gate dispatches `getKOSettingsInit` with `serverDoc2 = INTERNAL_SALES_INVOICE` and then filters `server_doc_type_1 === INTERNAL_JOBSHEET` — the Jobsheet panel's visibility follows the *Jobsheet → Sales Invoice* row, not *Jobsheet → Purchase Requisition* (copy-paste bug; tab view is unaffected).
- Backend PR → PO conversion (`PurchaseRequisitionToPurchaseOrderConverter`, `convert-documents` / `generic-document-conversion` endpoints, `GENERIC_DOCUMENT_CONVERSION_PROCESSOR`) exists but nothing in this applet calls it; the PO's KO For is the path.
- Workflow Settings / Workflow Status are labels (backend never reads `wf_process_status_guid`); intranet #3251 (open) asks for a real Pending → Approve/Cancel process.
- Settings: 163 model keys, ~130 four-proof (shared screen + 20 gear templates with 100 keys), 29 declared-never-read, ~25 read-without-model. Applet-local `field-configuration` component unrouted and empty. `SHOW_DOCUMENT_DELETE_BUTTON` read but no delete button in the template.
- Permissions: 50 seeded / ~65 checked. `INTERNAL_PURCHASE_REQUISITION_DISPLAY_PRICING` is hide-by-default (`hidePriceFlag = !checkPermission`). `IPR_HIDE_TRACKING_ID_AND_PERMIT_NO` seeded but never checked. Not seeded although checked: `SHOW_GENDOC_FINAL/VOID_BUTTON`, `SHOW_LINE_ITEMS(_QUEUE)_MENU`, listing-column `SHOW_*`, `ALLOW_LINE_ITEM_EDIT`, `HIDE_PRICE`.

### Method findings (add to METHOD.md)

1. **"Configuration screen ≠ enforcement" needs its converse: trace the submit button.** Same Approval Settings / Branch Designation components are dead in Stock Requisition and live in Purchase Requisition; the difference is one effect (`submitForApprovalInit$` → `bl_fi_generic_doc_approval_hdr.service.submit`). Grep the applet for `approvals/processors/submission` before writing either verdict.
2. **Read the processor's success condition, not just its name.** The approval request processor's `|| approval_status == APPROVED` short-circuits the level check. A one-line boolean can invert a documented behaviour ("approved after all levels") — quote the condition and its line in the page.
3. **Settings copied to a row are not settings consumed.** Approval logic / amount bands are persisted twice (setting → sequence) and read zero times; four-proof "consumed" must find an evaluation, not a `set…`.
4. **Sidebar menus are gated generically** (`HIDE_<STATE>_MENU` / `SHOW_<STATE>_MENU` computed from the route state) — the keys exist for every menu even when no model or control names them; list them as read-without-control.
5. **Check `getKOSettingsInit` arguments** — three applets so far pass a wrong `serverDoc2`; the KO tab's visibility can depend on an unrelated flow row.

### Screenshots (kept 5 of 10, none moved)

- **Excluded from the page (loop to quarantine)**: `static/images/internal-purchase-requisition/purchase-requisition-list.png` and `line-items-listing-view.png` (real company names as suppliers — several well-known Malaysian brands — and staff first names as purchasers); `line-items-queue-approve.png` (developer first names as item codes / test data); `Internal_Purchase_Requisition_Lifecycle.png` (NotebookLM infographic with wrong claims: submit "locks the draft", discard "no record remains"); `static/images/internal-purchase-requisition-applet/internal-purchase-requisition-infographic-overview.png` (generated marketing infographic).
- Kept: `For-Requesters-Create-Your-First-Purchase-Requisition.png` (listing shows document numbers only), `attach-document.png`, `submit-for-approval.png`, `apprival-request.png` (empty queue), `settings.png` — staging/TESTING tenant, tenant user's small avatar only. Recapture wanted on a GadgetSphere-seeded tenant: listing, Line Items, Line Items Queue, Approval Settings create, Branch Designation › Approver, Approval Request with a pending row.

### Cross-lane link requests

- **inventory-workflow/internal-stock-requisition-applet.md** (lane 4): add `internal-purchase-requisition-applet` to `related_applets`; one sentence "the Purchase Requisition applet wires the same screens to the backend — see that page for what an enforced flow looks like".
- **purchase-workflow/internal-purchase-order-applet.md** (my lane, run 1): on next touch, replace "FINAL itself is not blocked by approval status in the applet code" with the backend proof (no read of approval tables in `GenericDocumentService`) and add the auto-FINAL-at-first-approval behaviour (same request processor serves PO approvals); note that Approval Logic / amount bands are not evaluated.
- **sales-workflow/internal-jobsheet-applet.md** (other lane): add `internal-purchase-requisition-applet` to `related_applets`; a FINAL jobsheet with open lines can be knocked off into a requisition (needs the *Jobsheet → Purchase Requisition* `LINE` row); delivery branch is not carried (intranet #4453).
- **master-data/employee-applet.md** (lane 4): approvers for the generic-document approval are employee entities linked per branch designation (`bl_fi_mst_employee_branch_designation_link`); the submitter must be an employee entity without a past `resign_date` (`SUBMITTER_IS_RESIGNED`). Add `internal-purchase-requisition-applet` and `internal-purchase-order-applet` to `related_applets`.
- **master-data/organisation-applet.md** (lane 4): Knock Off Configuration rows PR → PO, Jobsheet → PR, GRN → PR; AUTO/`KO_DOC` rows feed the backend PR → PO converter.
- **master-data/workflow-design-applet.md** (lane 4): note that document applets' *Workflow Settings* attach a process per company and that the status is a label, not a gate, for generic documents (intranet #3251 open).
- **master-data/supplier-applet-1.md, doc-item-maintenance-applet.md, tax-configuration-applet.md** (lane 4): add `internal-purchase-requisition-applet` to `related_applets` when touched.
- **finance/internal-purchase-invoice-applet.md** (lane 2): add `internal-purchase-requisition-applet` to `related_applets` (it already links here).
- **guides/purchasing-guides/standard-procurement-workflow/**: the requisition step should say approval is optional unless FINAL is hidden from requesters, and that the first approval finalises the requisition on current backends.
- **API reference (developer-docs lane)**: `generic-doc/approvals/**` (create / submit / resubmit / withdraw / conversion-checking), `approval-requests/processors/login-entity-primary-ep`, `approval-requests/thymeleaf-forms/{tenant}/{guid}`, `gen-doc-line-open-queues/backoffice-ep/batch-approve`, `gen-doc/convert-documents/backoffice-ep`, `gen-doc/generic-document-conversion/backoffice-ep/{guid}` are undocumented.
- **planning/lanes/METHOD.md** (coordinator): fold in the five method findings above; update §lane-4 note 32 with "enforced in PR, not in Stock Requisition".

### Registry / naming mismatches

- `internal_purchase_requisition` row ACTIVE, `documentation_url` correct; page title corrected to the registry name.
- Applet repo's last commit message names a customer-support repo — cited as `customer-repo-5cf49c` (already in `kb/private/repo-pseudonyms.tsv`).
- Perm-dfn: 50 ACTIVE + 1 DELETED (`IPR_DISPLAY_TRACKING_ID_AND_PERMIT_NO`).

### Questions for Vincent

- **Is finalising the requisition at the first approve action intended?** (`GenericDocApprovalRequestProcessor` L200–201.) If not, the condition should be `date_final_approval != null` only. Same processor serves Purchase Orders.
- Should the backend gate plain FINAL on an existing approval setting for the document type (so that hiding the button is not the only enforcement)?
- Approval Logic (ANY/ALL) and Min/Max Approval Amount are shown in the UI but never evaluated — remove from the screen, or implement?
- Line Items Queue APPROVE writes a flag nobody reads — should the PO's KO respect it, or should the menu go?
- Fix the `getKOSettingsInit(serverDoc2 = INTERNAL_SALES_INVOICE)` copy-paste in the KO For panel gate.
- Seed `SHOW_GENDOC_FINAL_BUTTON` / `SHOW_GENDOC_VOID_BUTTON` (or accept that hiding FINAL is global), and the listing-column `SHOW_*` codes; drop `IPR_HIDE_TRACKING_ID_AND_PERMIT_NO` (unchecked) or wire it.
- Quarantine the five excluded images; recapture list above.

### Stopping point

One large document applet this run — the approval subsystem (submission service, three processors, e-mail service, conversion monitor, converter) had to be read end to end to answer lane 4's question correctly. Next in queue: `content/en/applets/ecommerce/pdg-applet.md`.

## From Lane 3 run 18 (2026-09-05) — content/en/applets/ecommerce/pdg-applet.md

### What the code says (applet @e37bca3, shared-utilities @a8c38a2, backend @353fa9a)

- **Not a document.** No `*DataConsistencyObject` signums, no `JournalPostingTypeHandler`, no stock processor, no open queue. PDG/OPDG live in `bl_inv_pdg_*`, `bl_inv_opdg_*`, `bl_opdg_element_by_brand`. The DCOs validate FKs, subject GUIDs and non-empty status only.
- **Create/update is asynchronous.** `pdg-unique-combination` POST/PUT saves the header `PROCESSING` and enqueues `PdgCreationAndUpdateProcessor` (queue `PDG_CREATE_AND_UPDATE_PROCESSOR`): filter links → category combinations (`SELECT DISTINCT` over items joined to labels — only pairs carried by ≥1 ACTIVE item) → location combinations (distinct size/type of ACTIVE locations matching both filters; **throws "…pair doesn't exist" when none**) → guide elements (+ OPDG elements for existing OPDGs) → `ACTIVE`; any failure → **`DELETED`**, which the listing (statuses `ACTIVE,PROCESSING`) hides. Same pattern for OPDG (`OpdgCreationProcessor`); OPDG elements are copied **without quantities**.
- **Settings.** Application Settings = shared `FieldConfigurationComponent`, no `appletCode` gate → the whole generic catalogue renders. Four-proof for this applet: `HIDE_OPDG_NAME`, `HIDE_OPDG_CODE` (Misc › "PDG Fields", default false; clear the required validator on Opdg Add, hide the field on the PDG-side Edit Opdg details) and `SORT_ORDER`. `ENABLE_FILTER_BY_TODAYS_TXN` read without control. The applet-local field-configuration component is unrouted and unbound; Personalization › Default Selection is a stub. Default Selection saves DEFAULT_BRANCH/LOCATION/COMPANY nothing reads.
- **Permissions.** 0 seeded client-side perm definitions. `app.component.ts` loads only `TNT_API_DOC_PDG_READ_LOCATION_TGT_GUID` (+ TENANT_ADMIN/OWNER). The location target list filters the OPDG outlet listing and the Opdg Add drop-down client-side; **an empty list disables the filter (all outlets visible)**.
- **Delete PDG is a permanent row delete** (`SqlDeleteObject(..., deletePermanent=true)`); `bl_inv_pdg_guide_element` and `bl_inv_opdg_element` cascade, `bl_inv_opdg_hdr.pdg_hdr_guid` does not → a PDG with OPDG headers cannot be deleted (DB FK error → generic toast).
- **Effective/End date** are stored/searchable only — no backend reader. **Brand corner rules are client-side and inconsistent:** the PDG › Outlet Guide chart requires brand total == OPDG qty at Save; the OPDG-menu chart requires brand total <= OPDG qty and 0 <= OPDG qty <= PDG qty. `brand_corner_boolean` is varchar 'Y'/'N'.
- **Opdg Add writes to `bl_inv_mst_location`** (`outlet_size_guid`/`outlet_type_guid`) when the outlet has none; when different it confirms and sets the outlet's existing OPDG headers/elements `INACTIVE` via PUTs.
- Excel import: fixed cell positions (B2/B3 name/code, B6/B7 dates `dd-MMM-yyyy`, B15/C15 category groups, E14 size, E15 type, rows ≥16); one workbook = one PDG for one size–type pair.
- Backend has `bl_inv_auto_rep_event_*` / `bl_inv_auto_rep_run_*` tables referencing OPDG headers and outlet filters — undocumented, no applet in the wiki.

### Method findings (add to METHOD.md)

1. **Template-clone applets: route first, then grep.** 90% of this repo's components (sales invoice tabs, ARAP, deposits, pick-pack, contra) are unrouted leftovers that still read settings and call `checkPermission`. Only settings reads reachable from `app.routing.ts` count as "consumed"; otherwise the four-proof count is inflated by dead code.
2. **Asynchronous masters have a hidden failure state.** When a create returns 200 but the header goes `PROCESSING → DELETED` in a queue job, the listing's status filter hides the failure. Document the job's throw message and the listing filter together.
3. **Check `deletePermanent` and the FK cascade map** for every non-document delete: a hard delete + a non-cascading FK is a "cannot delete" troubleshooting row that no code comment mentions.
4. **A renamed repo breaks slug-based lookup** (`gh repo view` on the old slug still resolves — use it). The registry code, the old slug and the new customer-named slug all differ here.

### Screenshots (kept 7 of 33, none moved)

- **Kept:** `applet-settings-outlet-type.png` (TESTING tenant, generic types), `category-group-mapping.png` (TESTING, EMP_CATEGORY_xx), `pdg-edit-quantity.png`, `opdg-set-outlet-empty.png`, `opdg-pdg-chart.png` (low resolution — recapture wanted), `file-import-listing.png`, `pdg-upload-template.png` (synthetic workbook).
- **Excluded — loop to quarantine (all under `static/screenshots/pdg-applet/`):** `infographics.png` and `pdg-influence-image.png` (generated infographics; the second has wrong claims — "deposit queue", "finance team"); `location-listing.png`, `location-edit.png`, `doc-item-maintenance-items.png`, `file-import-errors.png`, `catalogue-install-applet.png` (real tenant/company/location/product names); `opdg-set-outlet-filled.png`, `opdg-chart.png` (real mall name; the first also a person's full name); `pdg-listing-create.png`, `pdg-edit-details.png`, `pdg-edit-guide.png`, `opdg-report-listing.png`, `opdg-add.png`, `opdg-confirmation.png`, `opdg-outlet-listing.png`, `opdg-pdg-listing.png`, `pdg-listing-matching.png` (a developer's first name as test data; several also test locations named after other customers); `opdg-by-brands.png`, `item-edit-category.png` (real brand/product names); `doc-item-maintenance-category-groups.png`, `applet-details-installed-users.png`, `applet-settings-role-permission.png`, `catalogue-add-user.png` (staff e-mail addresses, a real distributor name as a role); `applet-settings-outlet-size.png` (mislabeled — shows the Outlet *Type* list of what looks like the production tenant).
- **"Login e-mail only" captures (F-0167):** none — every kept or excluded PDG-applet capture shows an avatar only in the top bar.
- Recapture wanted on a GadgetSphere-seeded tenant: PDG listing, Edit PDG › Details and Guide, Opdg Outlet Listing, Set OPDG Elements › OPDG Chart, Opdg By Brands, OPDG Report, File Import › Checking › Error.

### Cross-lane link requests

- **master-data/organisation-applet.md** (lane 4): add `pdg-applet` to `related_applets`; under Outlet Type / Outlet Size say that a location needs **both** to appear in any PDG / OPDG Report, and that the PDG applet's *Opdg Add* can write them onto a location (and inactivate that location's OPDGs when it changes them).
- **master-data/doc-item-maintenance-applet.md** (lane 4): add `pdg-applet`; under Settings › Item Category note that the Category Group 1…10 mapping is what the PDG *Category Group Filter* offers, and that labels double as the brand master for OPDG brand rows (`bl_opdg_element_by_brand.label_hdr_guid`).
- **ecommerce/cp-commerce-admin-applet.md** (my lane, done run 1): on next touch, drop PDG from the "Catalogue" row / related list or reword — PDG is in-store display planning, not storefront catalogue data.
- **inventory-workflow/stock-replenishment-applet.md** (lane 4): the backend's `bl_inv_auto_rep_event_*` / `_run_*` tables reference OPDG headers and outlet-type/size filters; if that page covers auto-replenishment, link here.
- **API reference (developer-docs lane):** `inv/pdg-unique-combination/backoffice-ep` (POST/PUT, `get-unique-category-group`, `get-target-category-values`), `inv/pdg-hdrs`, `inv/pdg-guide-elements`, `inv/opdg-hdrs`, `inv/opdg-elements` (+ `/opdg-report`), `inv/opdg-element-by-brand-hdrs` (+ `/opdgElement/{guid}` delete), `inv/outlet-types`, `inv/outlet-sizes`, `inv/pdg-element/import-file-hdrs` are undocumented; `brand_corner_boolean` is a string.
- **planning/lanes/METHOD.md** (coordinator): fold in the four method findings above.

### Registry / naming mismatches

- `pdgApplet` / "Pdg Applet" ACTIVE, `documentation_url` empty — loop to set it to `/applets/ecommerce/pdg-applet/`. Page title set to the registry name.
- The applet repo was renamed from the org-style `blg-applet-wavelet-pdg-applet` (still resolvable) to a **customer-named slug**; cited as `customer-repo-de2e40`. The README-only tracker repo is `customer-repo-7b4a2c`. Both added to `kb/private/repo-pseudonyms.tsv`.
- The existing page named the real customer in its first paragraph and used the customer's outlet-type scheme; removed.
- `kb/topics/pdg-applet.md` created. The page sits under `content/en/applets/ecommerce/` but the applet is inventory planning (`modules: [inventory]`); no move (out of scope).

### Questions for Vincent

- **Should `pdgApplet` be on the exclusion list?** It is single-customer by construction (customer-named repo, customer's outlet-type scheme, 31 support issues in a customer tracker). The registry row is ACTIVE and not excluded, so it was enhanced with the customer name stripped — say if it should be pulled instead.
- Should the backend enforce (a) Effective/End dates, (b) 0 ≤ OPDG qty ≤ PDG qty, (c) brand total = OPDG qty? All are client-side today and the two chart components disagree (== vs ≤).
- Should an empty `TNT_API_DOC_PDG_READ_LOCATION_TGT_GUID` target list mean "no outlets" instead of "all outlets"?
- PDG create with filters that match no location returns 200 and then silently deletes the header — should the create endpoint validate the location match synchronously?
- Delete PDG is a hard delete blocked by the OPDG-header FK — intended, or should it be a status change?
- Quarantine the 26 excluded images; recapture list above.

### Stopping point

One applet this run — the template-clone repo (hundreds of unrouted components) had to be separated from the seven routed screens, and the asynchronous create path, the hard delete and 33 screenshots each needed verification. Next in queue: `content/en/applets/ecommerce/cp-commerce/push-notification-configuration.md` — verify against the registry first (likely a CP Commerce feature, not an applet; ADR-0002 skip candidate).

## From Lane 3 run 19 (2026-09-05) — content/en/applets/ecommerce/cp-commerce/push-notification-configuration.md

### Verdict: not an applet — restructured as a feature sub-page of CP Commerce Admin

- **No registry row** under any plausible name (push / notification / firebase / commerce); the only Commerce row is `cp_commerce_admin_console_v1` (CP Commerce Admin, done run 1). Per the run-19 brief the page was **not** forced into the single-applet standard: it is rewritten as a short feature sub-page (front matter `page_type: applet-feature`, `applet_code: cp_commerce_admin_console_v1`, `parent_page:`), same URL, alias `/modules/ecommerce/push-notification-configuration/` added (the page was moved there from `content/en/modules/ecommerce/` in commit 163d8446 without an alias).
- **The old page was a privacy and secrets problem, live on the public wiki.** It was a build guide for one customer's white-label app (`wavelet-cp-commerce-app-…`, pseudonym `customer-repo-fa3ee2`) and named the customer in the description and body, with its Android package / iOS bundle IDs, Firebase project id and project number, OAuth client id, GCM sender id and app ids (API keys had been redacted earlier in bd1c933a; the identifiers had not). It also pasted a third-party starter template's `google-services.json`. All removed.
- Rewritten from: backend @353fa9a (`FirebaseAkaunService`, `CmsWebsiteService`, `CmsNotificationService`, `CmsTopicSubscriptionService`, `MemberLabelTopicService`, `CmsTopicUow`, controllers, `NotificationSchedulerProcessor`, `NotificationReadStatusLinkGeneratorProcessor`, `MemberLabelTopicAssignmentProcessor`), admin applet @813f007c8 (website-edit, notification create/edit/scheduled, topic create), base app `wavelet-cp-commerce` @247243251 (push-notification facade/effects, topic-management effects, session bus, auth-resolver, capacitor config, environments). Customer app builds consulted only for `isApp` and the PushNotifications plugin block — cited by pseudonym.

### What the code says (record for the guides)

- Credential = the Firebase **service-account JSON** stored under `bl_cms_website_hdr.property_json.firebase`, per website; 11 keys mandatory, non-null, else `INCORRECT_CONFIGURATION_WEBSITE_CONFIG_FIREBASE`. **No admin screen writes it** — support edits the row. Not a server key, not the platform env credential (`FirebaseAuthService` env vars are a different path).
- `FirebaseApp` cached per `tenantCode.websiteCode` for the API process lifetime → key rotation needs a restart.
- FCM topic = `<websiteCode>.<topicGuid>.<topicCode>`; renaming a topic code silently orphans subscribers.
- Publish → FCM send → `NOTIFICATION_READ_STATUS_LINK_GENERATOR` (one read/unread row per subscriber). `pushToTopic()` swallows FCM exceptions into a 200 body message; the read-status rows are generated regardless.
- Two "defaults": app subscribes to the Website ext `SYS_AKN_WEB_CP_COMMERCE_DEFAULT_TOPIC_HDR`; the backend member-restore uses `bl_cms_topic_hdr.topic_description = 'DEFAULT'` and throws `NO DEFAULT TOPIC IS DEFINED FOR THIS TENANT…` when none.
- `RESTRICT_NOTIFICATION_BY_MEMBER` ext is a string 'true'/'false'; the app's anonymous default-topic subscription runs only when it is 'false', a Default Topic is set, and `environment.isApp` is true (false in the base repo, true in every customer build).
- Scheduler: rows `next_execution_date <= NOW()`, crontab-driven; recurrence (`is_recurring` + `rrule`) exists in the backend but the applet form exposes only a single date-time.
- Members without a stored device token are skipped by the label-link processor (log line only).

### Method findings (add to METHOD.md)

1. **"Feature page under applets/" is a third page kind.** When a queued page has no registry row but documents a real feature of an ACTIVE applet, restructure it as a sub-page carrying the parent's `applet_code` + `page_type: applet-feature` instead of skipping — the content (credential shape, error strings, subscription gating) is worth keeping and belongs nowhere else. Needs a decision on how the parity check treats it (below).
2. **Open every screenshot before trusting the page's own captions.** The "database configuration" capture here was a live DB row with a real service-account e-mail, client id, private_key_id and the first line of a private key; the "Firebase console" captures named a different customer than the page did. Neither was obvious from the file names.
3. **Old build-guide pages carry identifiers, not just keys.** A previous "redact API keys" pass left project numbers, OAuth client ids, bundle IDs and app ids in place. Treat any `project_number`, `client_id`, `GOOGLE_APP_ID`, `mobilesdk_app_id`, Team ID or App Store ID as identifying.
4. **Backend "success" ≠ delivery for integration calls.** Grep the handler for `catch (Exception e) { return ApiResponse.withoutData(e.getMessage())` patterns — the HTTP status lies and the downstream queue still runs; that is the troubleshooting row to write.

### Screenshots (kept 0 of 5 — loop to quarantine `static/images/push-notifications/`)

- `db-config-in-bl-cms-website-hdr.jpg` — **secret material**: real Firebase service-account `client_email`, `client_id`, `private_key_id`, project id and the beginning of `private_key` for a real customer's project. Quarantine first; Vincent should consider the key compromised (it has been on the public wiki since 2026-02) and have the customer's service-account key rotated.
- `firebase-config-cloud-messaging.jpg` — a second real customer's Firebase project name, sender id, iOS bundle id, APNs key IDs and Apple Team ID.
- `project-settings-general-common.jpg` — same customer's project id/number, GCP organisation id and a BigLedger staff e-mail as support contact.
- `project-settings-general-android.jpg` — package name and Android app id.
- `project-settings-general-ios.jpg` — bundle id, iOS app id, App Store ID, Team ID.
- **"Login e-mail only" captures (F-0167):** none — no capture shows a BigLedger login bar; the staff e-mail above is a Firebase support-contact field, not a login.
- Recapture wanted on a demo Firebase project: Cloud Messaging tab with V1 enabled and an APNs key row (masked); Website edit showing Default Topic + Restrict Notification by Member; Notification create; Scheduled tab.

### Cross-lane link requests

- **ecommerce/cp-commerce-admin-applet.md** (my lane, done run 1) — on next touch: Related documentation line → "Push Notification Configuration — Firebase credential on the Website, subscription settings, publish and scheduler flow"; in the Website "Restrict Notification by Member" row add "also gates the app's anonymous Default Topic subscription"; add a *Default Topic* row (ext `SYS_AKN_WEB_CP_COMMERCE_DEFAULT_TOPIC_HDR`); Notifications section: "Publish Now sends to one topic of one website; FCM errors come back in the response message, not as a failed request"; drop the `DEFAULT_TIMEZONE` → "scheduled notifications" claim unless a reader is found (the scheduler compares `next_execution_date` to DB `NOW()`; I found no timezone read).
- **membership/membership-admin-applet.md** (lane ?): add `cp-commerce-admin-applet` to `related_applets`; under member labels note that a Topic → Member Label Link auto-subscribes labelled members to a push topic (only members with a stored app device token).
- **master-data/customer-applet.md** (lane 4): same one-line note under labels.
- **developer-docs / API reference:** `cms/notifications/publish/backoffice-ep` (header `websiteCode`), `cms/topic-subscriptions/public-ep`, `…/member-device-restore/public-ep`, `…/refresh-device-token/public-ep`, `…/unsubscribe/login-ep`, `cms/notification-schedulers/backoffice-ep`, `cms/user-app-device-hdrs/backoffice-ep` are undocumented; `RESTRICT_NOTIFICATION_BY_MEMBER` is a string ext, not boolean.
- **planning/lanes/METHOD.md** (coordinator): fold in the four method findings.

### Registry / naming mismatches

- No row for "Push Notification Configuration" under any name — expected; it is a feature of `cp_commerce_admin_console_v1`. Page now carries the parent's code and `page_type: applet-feature`. **The future `tests/applet-registry-parity.sh` must allow `page_type: applet-feature` pages (one code shared by the parent page and its sub-pages) — otherwise it will flag this page and `website-builder/user-manager.md`.**
- Pseudonyms added to `kb/private/repo-pseudonyms.tsv`: three `wavelet-cp-commerce-app-*` white-label builds and one `blg-sd-*` tracker (`customer-repo-fa3ee2`, `-863427`, `-0dcd22`, `-1322ac`).
- `content/en/applets/ecommerce/cp-commerce/_index.md` still says "CP Commerce Admin configuration guides" — fine as a section stub; not touched.

### Questions for Vincent

- **Security:** the DB screenshot has exposed a real customer's Firebase service-account identifiers and the head of its private key on the public wiki since February. Rotate that customer's service-account key (Firebase console → Service accounts) and update their website row; quarantine the five images from `static/` and, ideally, purge them from git history / CloudFront.
- Do you want feature sub-pages under `applets/` (this page, `website-builder/user-manager.md`) as a recognised page kind, or should they be folded into the parent page as H2 sections? I chose the sub-page with `page_type: applet-feature`; say if the parity gate should instead require one page per code.
- Product questions surfaced by the code (not for the wiki): (a) should CP Commerce Admin get a masked Website field for the Firebase service-account JSON; (b) should `pushToTopic()` fail the request on FCM error and skip the read-status rows; (c) unify the Website Default Topic ext with the backend's `topic_description = 'DEFAULT'` lookup; (d) invalidate the cached `FirebaseApp` when the website row changes.
- Issue wavelet-cp-commerce#245 carries a PDF "Push Notification Configuration Guide" attachment I did not read (binary attachment); if it is the intended user guide, it should be ingested via the ingest pipeline and the customer identifiers stripped.

### Stopping point

One page this run — most of the time went into establishing that the page was not an applet, tracing the credential path through the backend and the base app, and inspecting five screenshots that turned out to be the run's most important finding. Next in queue: `content/en/applets/ecommerce/seller-admin-applet.md` (check the registry for a Seller Admin row first).

**Addendum (same run):** the standard now defines `page_type: applet | index` (index = hub page, parity-allowlisted). This page uses `page_type: applet-feature` — a third value the enum and the parity allowlist need (a leaf feature page of an ACTIVE applet, sharing the parent's `applet_code`). Coordinator to add it or tell me to use `index`.

## From Lane 3 run 20 (2026-09-05) — content/en/applets/ecommerce/seller-admin-applet.md (skipped) and content/en/applets/ecommerce/seller-applet.md (done)

### Registry resolution first

- The registry has exactly one seller row: `seller_applet` / "Seller Applet" (TNT-ADMIN, ACTIVE, created 2023-05-18, `documentation_url` empty). Its `property_json` is the tie-breaker between the two repos: `routerLink = applet/tnt/wavelet/erp/seller-applet`, `es_module_url = …/wavelet-erp/seller-applet/prod`, custom element `seller-applet-elements-` — i.e. **`blg-applet-wavelet-seller-applet`** (whose `app.routing.ts` `mainPath` matches). `blg-applet-wavelet-seller-admin-applet` (`mainPath = applet/tnt/wavelet/erp/seller-admin-applet`) has **no `bl_applet_hdr` row under any name or status** and no row's `property_json` mentions it, although the repo is alive (Angular 14 upgrade 2025-11, sub-query removal 2026-08-31) and has 30 commits.
- Therefore: `seller-admin-applet.md` → **skipped** per ADR-0002 (mismatch recorded below); `seller-applet.md` → enhanced as `seller_applet` (title already equal to the registry name; no retitle needed).

### What the code says — Seller Applet (applet @6988e15, shared-utilities @a8c38a2, ts-lib @7d1616a9e, backend @20fbeede40)

- **A seller is a merchant entity the login is linked to.** `app.component.ts` builds the sidebar "Select User" toggle from `entity-login-subject-links?subject_guid` → `entity/merchants?hdr_guids`; the choice scopes Product and Seller Order listings. PI / PV listings are not scoped. The Seller Account menu is only the seller's **login-link list** (Verify Email → invite → link with Rank/Status); there is no seller create form, no Approve, no "Pending Approval".
- **Settings.** Field Settings = applet-local unbound stub. Settings › Default Selection and Personalization › Default Selection are routed without a parent binding their `appletSettings$` / `save`, so `appletContainer` is undefined and the branch/location `valueChanges` handlers throw. Printable Format Settings is the only working writer (`PRINTABLE`). Four-proof count: **1** (`PRINTABLE`); ~45 keys read without control (DEFAULT_BRANCH/LOCATION, HIDE_COSTING_DETAILS, 21 line-field HIDE_*, HIDE_SERVER_DOC/CLIENT_DOC, custom status line columns, salesManLabels). 0 seeded client-side perms; the code checks `SHOW_INTERCOMPANY_PI_SCREEN`, `SHOW_FINAL_BUTTON`, `SHOW_DOCUMENT_DELETE_BUTTON` (ext), the SHOW_* line partners, `INTERNAL_PAYMENT_VOUCHER_DISPLAY_PRICING`.
- **Seller order is not a finance document.** `server_doc_type = 'SELLER_ORDER'` is a string literal on `bl_mkp_seller_order_hdr`; `MkpSellerOrderDataConsistencyObject` carries `correctAmountSignum = 1` / `correctQuantitySignum = 1` as validation constants; not in `ServerDocTypes`; no journal, no `bl_inv_txn_line`, no open queue, no VOID. `marketplace_status` / `track_delivery_sub_status` (the listing's Order Status / Delivery Status) are never written for SELLER_ORDER rows.
- **Origin chain** = three queue processors with no scheduler wiring in the repo: `CPCOMMERCE_SALES_ORDER_QUEUE_PROCESSOR` (per-line `bl_mkp_seller_order_allocation_queue` for `INTERNAL_SALES_ORDER` / `CPCOMMERCE_SALES_ORDER`) → `MKP_TMP_SELLER_ORDER_LINE_CREATION_PROCESSOR` (auto-allocates **only when exactly one seller** is reachable via `fi_item_guid` → `bl_mkp_mst_pricing_scheme_link` → scheme owner; else manual `tmp-seller-order-line-create/backoffice-ep`) → `MKP_SELLER_ORDER_LINE_CREATION_PROCESSOR` / `create-order-from-tmp` (one header + one line per tmp line). **Bug:** `TmpSellerOrderLineService` sets `purchase_amount` to the quantity, not price × qty. Neither seller applet calls the manual-allocation endpoint.
- **Dead controls (all verified in code):** Seller Order SAVE / FINAL / Delete (no effects), Delivery Type select (unbound), advanced search (queries the generic pick-pack queue), Event tab (hdr filter commented out → every event in the tenant); PI edit FINAL / SAVE / DISCARD (handlers commented out; template still binds them); PV Create (effect commented out); Product create form (values discarded — the + button already created a TEMP item with a GUID code), Currency never saved, Multi UOM / Manage Image / Attribute tabs' writes, Stock Availability edit / delete; Branch Name not mapped, Branch edit PUTs undefined; "Edit Seller Account" button without handler; login-edit Delete throws.
- **Product:** the applet never sets `fi_item_guid`, `cfg_preorder`, `cfg_delivery`, `cfg_production` — the old page's "MKP→FI mapping", "pre-order lead time", "require delivery/production" claims had no code behind them. Pages tab throws on null `fi_item_guid`. Backend: no code-uniqueness check on mkp items (`MKP_ITEM_HDR_OBJECT_CODE_ALREADY_EXIST` unused); soft delete.
- **Stock:** `bl_mkp_entity_branch_stock_balance.qty_balance` is hand-typed (no quantity rule, negatives accepted); `EcomSyncMainStockCalculationService` seller-stock mode computes `qty_available` per row but discards its `BigDecimal.add` results, so the EcomSync `mkp_seller_*` totals stay 0.
- **Settlement:** no code creates a PI from seller orders; `SettlementTypeOptions` (Bank Transfer … Membership Point Currency) is referenced by no routed screen — the old "Settlement Triangle" and payout-mode claims were invented.

### Method findings (add to METHOD.md)

1. **Two repos, one registry row: let `property_json` decide.** `bl_applet_hdr.property_json.routerLink` / `es_module_url` / `custom_element` name the deployed bundle; compare with each repo's `app.routing.ts` `mainPath`. The name similarity ("Seller" vs "Seller Admin") is not evidence.
2. **"Dead handler" is a first-class finding.** In template-clone applets check three things per button: the template binding, that the method exists (not commented out), and that an NgRx effect subscribes to the dispatched action. Here 12 controls failed one of the three. Say "reaches no backend call" with the file, never "not supported".
3. **Marketplace tables have their own DCO family (`MkpDCO/`)** with `correctAmountSignum` / `correctQuantitySignum` constants that look like the finance ones but only validate the mkp row — no `JournalPostingTypeHandler`, no stock processor. Do not write a Dr/Cr line for them; state "not a finance document" and cite `ServerDocTypes` (absent).
4. **Four-proof for an applet without a settings writer:** when the only writer is a side effect (printable-format tick → `TenantAppletService` PUT), the "rendered" proof is that tick, and every other model key is "read without control" — say explicitly that support must write the `APPLET_SETTINGS` ext for them to take effect.
5. **Screenshots of a staging tenant's listings can still carry PII** — staff e-mails and a phone number as login rows, developer names and small real business names as test branches. The "login e-mail only" allowance (F-0167) covers the top bar, not row data.

### Screenshots (kept 5 of 9 under `static/images/seller-applet/`)

- **Kept:** `product-listing.png` (Edit Product tabs; shows the "Please choose currency" validator and an ERR row — recapture wanted), `seller-order-listing.png` (columns + Delivery Type), `purchase-invoice-listing.png`, `payment-voucher-listing.png` (empty listings, column headers only), `seller-applet-settings.png`.
- **Excluded — loop to quarantine:** `seller-account-listing.png` and `seller-account-form.png` (rows show two staff e-mail addresses and a mobile phone number), `branch-listing.png` (test branches named after a person and small real-looking businesses), `seller-overview-infographic.png` (generated infographic with typos and invented claims: "Settlement Triangle", "Store-Level Inventory Control").
- **"Login e-mail only" captures (F-0167):** none; every capture shows an avatar in the top bar.
- **Seller Admin images (`static/images/seller-admin-applet/`, page skipped but images are public):** `seller-account-listing.png` and `seller-account-form.png` list several developers' real names as seller rows — quarantine; `seller-admin-overview-infographic.png` is a generated infographic with typos — quarantine; the other six are harmless (john doe test data / empty grids). No database, console or config captures in either folder.
- Recapture wanted on a GadgetSphere-seeded tenant: Seller Account login list, Product listing with rows, Product › Pricing and Stock Availability tabs, Seller Order listing with rows, Branch listing.

### Cross-lane link requests

- **master-data/merchant-applet.md** (lane 4): `related_applets` has `seller-admin-applet`; add `seller-applet`. Say that the Seller Applet's sidebar lists only merchant entities the login is linked to (`bl_fi_mst_entity_login_subject_link`) and that seller stores are the merchant's entity branches (`bl_fi_mst_entity_branch_hdr`) — Stock Availability rows need one.
- **sales-workflow/internal-sales-order-applet.md** (other lane): add `seller-applet`; document `bl_fi_generic_doc_hdr.seller_order_alloc_queue` (set to `'true'` by `CPCOMMERCE_SALES_ORDER_QUEUE_PROCESSOR`) and the per-line `bl_mkp_seller_order_allocation_queue`; note that FINAL of the sales order is not what triggers allocation — the processors are.
- **master-data/pricebook-applet.md** (lane 4): add `seller-applet`; under `enable_marketplace` say that marketplace pricing schemes are what the Seller Applet's Product › Pricing tab offers (label list `PRICING_SCHEME_ITEM`) and that the seller-order auto-allocation resolves the seller through the scheme's `entity_hdr_guid` (unique match only).
- **master-data/doc-item-maintenance-applet.md** (lane 4): add `seller-applet`; note `bl_mkp_mst_item_hdr.fi_item_guid` must be set outside the Seller Applet for allocation and item pages.
- **finance/internal-purchase-invoice-applet.md, finance/internal-payment-voucher-applet.md** (lane 2): add `seller-applet` to `related_applets`; one line: "the Seller Applet's Purchase Invoice / Payment Voucher menus open the same documents; FINAL (PI) and Create (PV) only work here".
- **master-data/cashbook-applet.md, master-data/organisation-applet.md** (lane 4): add `seller-applet` (settlement methods → PV Payment tab; Knock Off Configuration → PI KO For tab).
- **ecommerce/cp-commerce-admin-applet.md** (my lane, done run 1): on next touch add `seller-applet` and say `CPCOMMERCE_SALES_ORDER` headers enter the seller allocation queue.
- **EcomSync hub / `inventory-workflow/90-ecomsync-related-applets.md` and `modules-v2/ecommerce/*`** (other lanes): the module pages credit the Seller applets with "multi-channel marketplace inventory sync" and "safety stock buffers (e.g. 5 units)" — neither exists in the Seller Applet; the EcomSync seller-stock mode (`MKP_SELLER_STOCK_BALANCE`) reads its balances but the roll-up is broken. Also add the Shopee partner-key expiry (gh:bigledger/blg-int-general-task#9789) as a troubleshooting row: symptom "Failed to refresh credentials - ECOMSYNC_REFRESH_CREDENTIALS_PROCESSOR" in the resource row remarks, all Shopee tenants stop polling; re-authorise from Organisation › Branch › Marketplace › Shopee URL.
- **API reference (developer-docs lane):** `mkp/seller-orders/{backoffice-ep,login-merchant-ep,login-entity-ep}` (+ `create-order-from-tmp`, `print-jasper-pdf/{guid}`), `mkp/seller-order-events/*`, `mkp/tmp-seller-order-hdr|line/backoffice-ep` (+ `tmp-seller-order-line-create`), `mkp/items/{login-entity-ep,new-login-entity-ep}` (+ `add-images/{guid}`), `mkp/entity-branch-stock-balances/login-merchant-ep`, `mkp/label-links/login-merchant-ep`, `mkp/item-attribute-set-links|child-links/login-entity-ep`, `mkp/pricing-scheme-links/backoffice-ep`, `erp/entity-login-subject-links`, `erp/entity/merchants`, `erp/entity-branch-hdrs/login-entity-ep` are undocumented; `MkpPermissions` codes likewise.
- **planning/lanes/METHOD.md** (coordinator): fold in the five method findings above.

### Registry / naming mismatches

- **`seller-admin-applet.md` has no registry row** under any name or status; the only Seller row's bundle is the seller-applet repo. Page skipped, not enhanced. The seller-admin repo is maintained (last commit 2026-08-31) and has its own user-guide tracker (gh:bigledger/blg-wiki#137, closed) — so either the applet is registered under a code I could not find (none of `bl_applet_hdr.property_json` mentions `seller-admin`) or it is deployed outside the Applet Store. Vincent to decide (below).
- `seller_applet` `documentation_url` empty — loop to set `/applets/ecommerce/seller-applet/`.
- `page_type: applet` set; `kb/topics/seller-applet.md` created; `planning/lanes/lane-3/perm-dfn/seller_applet.tsv` is empty (0 rows, evidence of the "0 seeded perms" claim).
- No customer-specific repos cited; the only support case used (gh:bigledger/blg-int-general-task#9789) is cited by its org-repo id and anonymised.

### Questions for Vincent

- **Seller Admin:** register `seller-admin-applet` in `bl_applet_hdr` (then it re-enters the queue) or retire the page and the module-page links to it? If retired, the E-Commerce module pages' "Multi-Channel Sync via Seller Admin Applet" rows need rewording too.
- **Is the Seller Applet live for any tenant?** Every write path except login links, labels, pricing links, stock-balance create, reviews, PI create, PV edit/FINAL and printable formats is dead in the current code. If nobody uses it, a shorter page (or an exclusion) may be better than documenting 12 non-functional buttons.
- Backend defects worth a ticket: `purchase_amount = qty` in `TmpSellerOrderLineService`; discarded `BigDecimal.add` results in `EcomSyncMainStockCalculationService` seller-stock mode; no scheduler for the three seller-order processors in the repo; no mkp item code uniqueness.
- Quarantine the four seller-applet images and the three seller-admin images listed above; recapture list above.

### Stopping point

One page enhanced and one resolved/skipped this run — the registry resolution, the three-processor origin chain and the dead-handler audit across six containers (~73k lines) took the budget. Next in queue: `content/en/applets/ecommerce/shopping-cart-applet.md` (registry `InternalShoppingCart` / "Shopping Cart (Internal)", `documentation_url` points at `/applets/shopping-cart-applet/` — check the alias) — then `purchase-workflow/supplier-delivery-order-applet.md`.

## Run 22 — 2026-09-05 — `content/en/applets/ecommerce/shopping-cart-applet.md`

Registry `InternalShoppingCart` / "Shopping Cart (Internal)"; `documentation_url` already points at `/applets/shopping-cart-applet/`, which the page keeps as its alias. Repo `blg-applet-wavelet-internal-shopping-cart-applet` @5627dab (micro-fe layout, shared-utilities submodule pinned @f90a5c7 — the gates.py pass was run at that commit **and** at HEAD a8c38a2; identical results for every key this applet reads). Backend @1ff620ef0e, ts-lib @7d1616a9e, Sales Order v2 @36f287d.

### What the code says (vs. the old page)

- **A cart is 0/0.** `ShoppingCartDataConsistencyObject` forces amount signum 0 and line signums 0/0; `ServerDocTypes.INTERNAL_SHOPPING_CART(0,0)`; no `JournalPostingTypeHandler` entry, and the fallback maps the name to an empty sub-ledger list, so the journal job ends in `NO_JOURNAL_CREATED`; no stock rows. The old page said FINAL "generates a Sales Order" — it does not. FINAL only (a) runs `validateGenericDocumentOnFinal` (fiscal lock, serial/bin/batch) and (b) lets `GenericDocLineOpenQueueProcessor` write open-queue rows **if** the company has an enabled `INTERNAL_SHOPPING_CART -> INTERNAL_SALES_ORDER` LINE row. The Sales Order **v2** applet then offers "Search Shopping Cart" and a "Shopping Cart" KO panel (panel visible only when that row is enabled; hidden by `HIDE_SEARCH_BY_SHOPPING_CART_TAB` / `HIDE_KO_SHOPPING_CART_TAB`, which the shared screen renders only for `erp_internal_sales_order_applet_v2`).
- **Two backends for one document type.** This applet uses the generic back-office endpoint `gen-doc/internal-shopping-carts`. The ecom endpoint (`InternalShoppingCartController`, `core2/tnt/dm/ecom/…`) — login must be linked to the entity, one cart per entity (`SHOPPING_CART_ALREADY_EXIST`) — belongs to the Customer Access applet. The CP Commerce controller converts a paid storefront cart to a Sales Order server-side (`CpCommerceShoppingCartService.convertShoppingCartToSalesOrder`).
- **Convert / Print are dead.** `convertShoppingCart$` (build an `INTERNAL_RECEIPT_VOUCHER` from the payment lines, delete the cart) and `printJasperPdf$` exist but the Convert and Export tabs are commented out of the View template and the print effect is commented out. The Printables settings screen stores its default under the **Sales Quotation** extension code and filters `txn_type = INTERNAL_SALES_QUOTATION` (copy-paste). Old page described Convert as a working cashier flow.
- **Settings.** 28 four-proof keys: 20 line-detail `HIDE_*` (consumed as `!HIDE_X || SHOW_X` in Add/Edit Line Item), `SHOW_DOCUMENT_DELETE_BUTTON` (read raw from `bl_applet_ext` when View opens), `VERTICAL_ORIENTATION`, `EXPAND_MAIN_DETAILS/ACCOUNT/LINE_ITEMS`, `DEFAULT_LANGUAGE_CODE`, personal `DEFAULT_TOGGLE_COLUMN` / `DEFAULT_ORIENTATION`. `EXPAND_PAYMENTS` is read without a control (the shared screen renders `EXPAND_SETTLEMENT`). `DEFAULT_BRANCH` / `DEFAULT_LOCATION` are rendered and saved (master via `saveMasterSettingsInit`) but **never read by the cart form**; worse, the master Default Selection screen patches its controls from *personal* settings. ~200 other shared toggles render for this applet code and are unread — including every setting the old page listed (`LOCK_PURCHASER_TO_CURRENT_USER`, `DISALLOW_SELL_BELOW_MIN_PRICE`, `HIDE_DOC_NO_*`, "Mandatory Reason", webhooks). No gear. The applet-local `field-configuration.component` is an empty unrouted stub; `settings` with no sub-path redirects to the shared Feature Visibility route which only `console.log`s the permission list; the shared Webhook screen is a sample-data stub.
- **Permissions.** 21 seeded client-side perms for `InternalShoppingCart` (`planning/lanes/lane-3/perm-dfn/InternalShoppingCart.tsv`): 20 `SHOW_*` line keys — all consumed as the per-role re-enable of the `HIDE_*` settings — plus `SHOW_COSTING_DETAILS`, unread. Server-side `TNT_API_DOC_INTERNAL_SHOPPING_CARTS_{CREATE,READ,UPDATE,DELETE}_TGT_GUID`; FINAL rides on UPDATE.
- **Line integrity (new backend feature).** `bl_cms_website_hdr.property_json.line_integrity_config` (opt-in per website, no admin screen) stamps HMAC tokens on cart lines created through login-ep / login-entity-ep / ecom / cp-commerce paths and verifies them at storefront checkout (`CLIENT_CART_LINE_INTEGRITY_HASH_MISSING` / `_MISMATCH` / price drift after `day_limit`). The plain back-office `PUT /{docType}` this applet uses does **not** re-stamp — a staff price edit here breaks the customer's checkout. Documented as a troubleshooting row.
- **Fields.** Branch/Location/Sales Agent/Currency required; Credit Terms/Limit required-but-disabled (display only, from `doc_entity_hdr_json`); Entity ID required; Branch/Location/Member Card/Currency lock only once FINAL; Sales Lead defaults to Corporate; SAVE re-applies the server `date_txn`; Add Payment `+` is **not** disabled at zero outstanding (old page said it was).
- **Issues.** Nothing user-facing: Angular 14 migration (applet #1), sub-query removal (#6539), node_modules (#3091), empty meeting notes (#7430, #7536, #4383 Figma-only). Wiki tracker #110 closed as "Documentation pending".

### Screenshots with personal data

- `static/images/shopping-cart-applet/shopping-cart-listing.png` — staging listing whose Customer Name and Sales Agent columns are real developer names; reference removed from the page. Quarantine.
- `static/images/shopping-cart-applet/shopping-cart-personalization.png` — Personalization screen with a real person's name, photo and e-mail address; reference removed. Quarantine.
- `static/images/shopping-cart-applet/shopping-cart-applet-overview.png` — NotebookLM-generated marketing graphic ("Abandoned Cart Recovery", "Real-Time Storefront Synchronization", "FINAL -> Sales Order", "CONVERT -> Receipt Voucher"); contradicted by the code, no personal data, reference removed. Quarantine (unreferenced).
- Kept (test data only, no people): `shopping-cart-create-main.png`, `shopping-cart-edit-details.png`, `shopping-cart-edit-lines.png`, `shopping-cart-edit-payment.png`. Recapture wanted: listing with fictional customers; Add Line Item dialog; Add Payment dialog; Application Settings › Line Items section.

### Method findings

- **Pin the shared-utilities submodule.** `.gitmodules` pins `micro-fe/projects/shared-utilities` (empty checkout in refs/); the deployed bundle was built against that commit, not `refs/blg-shared-utilities` HEAD. `git archive <sha>` into scratch + a one-line `SU=` patch of gates.py gives the pinned "rendered" proof; diff the two runs before trusting HEAD. Here 330 gate rows differed between f90a5c7 and a8c38a2, none for keys this applet reads.
- **"Rendered" includes controls the applet has no model for.** `SHOW_DOCUMENT_DELETE_BUTTON` is absent from `applet-settings.model.ts` but is rendered by the shared screen, persisted by the shared save, and consumed by a raw `bl_applet_ext` read — the four proofs pass with the shared form as the declaration. Conversely `DEFAULT_BRANCH`/`DEFAULT_LOCATION` pass declared/rendered/persisted and fail consumed. Check the consumer, not the model.
- **Commented-out template = dead button.** Handlers (`onConvert`, `onPrint`) and effects can exist with no binding; grep the HTML for the `(click)` before documenting an action (METHOD §12 restated for templates).
- **Settings-menu decoys.** Routes registered in `app.routing.ts` (feature-visibility, webhook, team-permission) are not necessarily in `settingItems`; the shared `app-settings` shell renders `routes` + fixed server-side-permission and developer-tools links only.

### Cross-lane link requests

- **sales-workflow/internal-sales-order-applet.md** (other lane): add `shopping-cart-applet` to `related_applets`; document the v2 applet's "Search Shopping Cart" tab (`line_open_queue_server_doc_type_1 = INTERNAL_SHOPPING_CART`, `_2 = INTERNAL_SALES_ORDER`) and the "Shopping Cart" KO panel gated by the company flow row (`koSC`), plus `HIDE_SEARCH_BY_SHOPPING_CART_TAB` / `HIDE_KO_SHOPPING_CART_TAB` (shared screen renders them only for `erp_internal_sales_order_applet_v2`).
- **master-data/organisation-applet.md** (lane 4): under Knock Off Configuration, list `INTERNAL_SHOPPING_CART -> INTERNAL_SALES_ORDER` (LINE) as the row that connects carts to sales orders; add `shopping-cart-applet`.
- **master-data/cashbook-applet.md** (lane 4): add `shopping-cart-applet`; note the `SETTLEMENT_TYPE` values the cart's Add Payment dialog switches on (CASH, CASH_BACK, CREDIT_CARD, VOUCHER, BANK_TRANSFER, MEMBERSHIP_POINT_CURRENCY, CHEQUE).
- **master-data/customer-maintenance-applet.md, master-data/tax-configuration-applet.md, master-data/doc-item-maintenance-applet.md** (lane 4): add `shopping-cart-applet` to `related_applets` (embedded customer editor; SST/WHT selectors; `txn_class = PNS` item search).
- **finance/internal-receipt-voucher-applet.md** (lane 2): add `shopping-cart-applet`; one line: cart payment lines are stored as `STL_MTHD` lines with `server_doc_type = INTERNAL_RECEIPT_VOUCHER`; the cart-to-RV conversion is unreachable code.
- **ecommerce/cp-commerce-admin-applet.md** (my lane, done run 1): on next touch add `shopping-cart-applet` and a "Line integrity" feature note (`property_json.line_integrity_config`: `enabled`, `day_limit`, auto-generated `secret`; error codes `CLIENT_CART_LINE_INTEGRITY_HASH_MISSING/MISMATCH`; back-office edits are not re-stamped).
- **modules-v2/ecommerce/** pages (other lane): they credit the cart applet with "abandoned cart recovery" and "real-time storefront synchronization" (the old page's NotebookLM graphic); neither exists — storefront carts are ordinary generic documents polled by the listing on open.
- **developer-docs / API reference**: `gen-doc/internal-shopping-carts` (backoffice), `ecom/internal-shopping-carts` (login-entity, one-per-entity), `cp-commerce/internal-shopping-carts` (checkout, payment reference, direct/indirect URL confirmation) and the line-integrity error codes are undocumented.
- **planning/lanes/METHOD.md** (coordinator): fold in the four method findings above (submodule pin; shared-form declaration; commented-out templates; settings-menu decoys).

### Registry / naming mismatches

- None for this page. Title set to the registry name "Shopping Cart (Internal)" (was "Shopping Cart (Internal) Applet"). `page_type: applet`.

### Questions for Vincent

- Re-enable Convert-to-Receipt-Voucher and Export in the View template, or delete the dead effects and the Printables menu (which targets the Sales Quotation extension code)?
- Should the back-office `PUT /{docType}` call `validateAndStampUpdates` for `internal-shopping-carts` so staff edits do not break storefront checkout when `line_integrity_config` is enabled? Today only the login-ep/login-entity-ep paths stamp.
- Default Selection (`DEFAULT_BRANCH`/`DEFAULT_LOCATION`) is inert here and reads personal values into the master screen — fix or remove from the menu?
- Quarantine the three images above; recapture list above.

### Stopping point

One page this run (the two-endpoint resolution, the pinned-submodule gates pass and the line-integrity trace took the budget). Next in queue: `content/en/applets/purchase-workflow/supplier-delivery-order-applet.md`, then `external-tenant-admin/tenant-admin-applet.md`.
