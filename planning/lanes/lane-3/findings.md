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
