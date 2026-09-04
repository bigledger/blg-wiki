# Lane 1 findings

Folders: sales-workflow, membership, manufacturing, claims

## Cross-lane link requests

- From `sales-workflow/internal-sales-debit-note-applet` (done 2026-09-05): add `internal-sales-debit-note-applet` to `related_applets` of `purchase-workflow/internal-purchase-debit-note-applet` (intercompany mirror), `finance/internal-receipt-voucher-applet`, `e-invoice/my-e-invoice-portal-applet`, `master-data/doc-item-maintenance-applet` (account-code items for charges), `master-data/customer-applet`, `master-data/chart-of-account-applet`, `master-data/cashbook-applet`, `master-data/tax-configuration-applet`.

- From `sales-workflow/internal-sales-return-applet` (done 2026-09-05): add `internal-sales-return-applet` to `related_applets` of `purchase-workflow/internal-purchase-return-applet` (intercompany mirror), `e-invoice/my-e-invoice-admin-applet` and `e-invoice/my-e-invoice-portal-applet` (return references the original e-invoice; void blocked after submission), `finance/internal-receipt-voucher-applet`, `inventory-workflow/stock-balance-applet`, `master-data/customer-applet`, `master-data/chart-of-account-applet` (SALES_RETURN default GL), `master-data/cashbook-applet`.

- From `sales-workflow/internal-sales-order-applet` (done 2026-09-05): add `internal-sales-order-applet` to `related_applets` of `purchase-workflow/internal-purchase-order-applet` (intercompany mirror + auto stock purchase), `inventory-workflow/stock-availability-applet` and `inventory-workflow/stock-reservation-applet` (open orders reduce availability; lines reserve), `delivery-installation/delivery-installation-applet` (delivery plans/calendar), `finance/internal-receipt-voucher-applet` (deposits), `master-data/customer-applet`, `master-data/pricebook-applet`, `master-data/cashbook-applet`, `master-data/workflow-design-applet`.
- `inventory-workflow/stock-availability-applet`: state that available quantity subtracts open FINAL sales orders (signum −1 in `StockAvailabilityService`) as well as invoices.

- From `sales-workflow/internal-sales-credit-note-applet` (done 2026-09-05): add `internal-sales-credit-note-applet` to `related_applets` of `finance/internal-receipt-voucher-applet`, `purchase-workflow/internal-purchase-credit-note-applet` (intercompany mirror), `e-invoice/my-e-invoice-portal-applet` (original-invoice reference fields), `master-data/customer-applet`, `master-data/chart-of-account-applet`, `master-data/cashbook-applet`, `master-data/tax-configuration-applet`, `master-data/workflow-design-applet`.

- From `sales-workflow/internal-sales-invoice-applet` (done 2026-09-05): please add `internal-sales-invoice-applet` to `related_applets` of these pages outside lane 1: `finance/internal-receipt-voucher-applet`, `finance/internal-purchase-invoice-applet` (intercompany mirror), `e-invoice/my-e-invoice-portal-applet`, `master-data/customer-applet`, `master-data/chart-of-account-applet` (company default GL codes DEBTOR/SALES/OUTPUT_TAX/COGS), `master-data/cashbook-applet` (settlement methods need cashbook + GL), `master-data/pricebook-applet`, `master-data/tax-configuration-applet`, `master-data/workflow-design-applet`, `master-data/organisation-applet`, `inventory-workflow/stock-balance-applet`.
- `master-data/chart-of-account-applet`: its Configuration should state that journal posting of sales documents throws `MISSING_DEFAULT_GL_CODE: DEBTOR|SALES|SALES_DISCOUNT|OUTPUT_TAX|COGS|FOREX_GAIN|FOREX_LOSS` when the company default GL link is missing (source: JournalPostingTypeHandler.java SALES handler; JournalPostingService.java).
- `master-data/cashbook-applet`: settlement methods (`STL_MTHD` lines) must carry both a cashbook and a GL code — posting fails with `MISSING_CASHBOOK` / `MISSING_GL_CODE: STL_MTHD [code]` (JournalPostingService.java L191-L211).

## Registry / naming mismatches

- `InternalSalesDebitNote`: two registry rows share this code — ACTIVE "Sales Debit Note (Internal)" and DELETED "Internal Sales Debit Note". Page uses the ACTIVE name. The parity check should key on (code, status).
- `InternalSalesDebitNote`: `SHOW_FILE_IMPORT_MENU`, `SHOW_INTERCOMPANY_MENU`, `SHOW_DRAFT_BUTTON` and the clone-button permission are read by the app but absent from its 35 client-side perm defs.

- `internalSalesReturnApplet`: registry `name` is "Sales Return (Internal) " with a trailing space (also `salesContractApplet` → "Sales Contract Applet "). Page titles use the trimmed name; the parity check should compare trimmed strings.
- `internalSalesReturnApplet`: `SHOW_INTERCOMPANY_MENU` / `SHOW_FILE_EXPORT_MENU` read by the app, not among its 45 client-side perm defs (same systemic gap).

- `erp_internal_sales_order_applet_v2` (Sales Order (Internal)): app.component reads `SHOW_SO_DETAILED_REPORT_MENU`, `SHOW_PICK_PACK_QUEUE_MENU`, `SHOW_DELIVERY_ITEMS_MENU`, `SHOW_ECOMSYNC_MENU`, `SHOW_BATCH_PRINTING_MENU`, `SHOW_DELIVERY_PLAN_MENU`, `SHOW_CALENDER_MENU`, `SHOW_FILE_EXPORT_MENU`, and line approval reads `ALLOW_APPROVE_SELL_BELOW_PRICE`; none of these exist among the 25 client-side perm defs for the applet. Same pattern as the credit note — looks systemic (per-tenant seeding?).

- `InternalSalesCreditNote` (Sales Credit Note (Internal)): the app reads client-side permission codes `SHOW_FILE_IMPORT_MENU`, `SHOW_INTERCOMPANY_MENU`, `SHOW_GENDOC_CLONE_BUTTON` and the `ALLOW_<TYPE>_ITEM_PRICE_EDIT` family, but none of them exist in `bl_applet_client_side_perm_dfn` for this applet (38 ACTIVE defs). Either the registry is incomplete or these are seeded per tenant. Documented in the page's Troubleshooting; needs a product decision.

## Undocumented applets encountered

- `SFA` — "Sales Force Automation" (TNT-USER, ACTIVE, doc URL points at Confluence). No wiki page under sales-workflow. Not in lane-1 queue.
- `shopee_sales_order_applet` — registry name "Tiktok Sales Order Applet" (TNT-ADMIN, ACTIVE, 2024-11-20). No wiki page; the code/name mismatch itself needs a decision (marketplace integration applets may fall under the customer-specific/integration exclusion policy).

## Questions for Vincent

1. **Client-side permission registry gap (systemic).** All five applets read `SHOW_*_MENU` (and in places `SHOW_DRAFT_BUTTON`, `SHOW_GENDOC_CLONE_BUTTON`, `ALLOW_APPROVE_SELL_BELOW_PRICE`, `ALLOW_<TYPE>_ITEM_PRICE_EDIT`) from client-side permissions, but `bl_applet_client_side_perm_dfn` in akaun_master does not define them for those applet codes. Either the master registry is incomplete (documented as "request the code" in each page's Troubleshooting) or they are seeded per tenant. Which is it, and should the pages say so differently?
2. **Registry hygiene.** Trailing spaces in `name` for `internalSalesReturnApplet` and `salesContractApplet`; a DELETED duplicate row for code `InternalSalesDebitNote`. Should the parity check trim names and key on (code, status)?
3. **Sales Order page banner.** I removed the "Under Review: This applet is still under review" callout because the page is now source-derived. Confirm that is what the banner meant.
4. **Marketplace image filenames.** `so-shopee-ecomsync.png` / `so-lazada-ecomsync.png` (pre-existing) name third-party marketplaces in the filename; captions now say "marketplace A/B". Fine to keep, or rename the files?

## Notes

- 2026-09-05 — **Learning 1: the applet's own settings surface is tiny; the real configuration lives in shared-utilities.** Every document applet exposes a small *Default Selection* screen (branch, location, sometimes pricing scheme / pricebook / currency / decimal precision / `DATE_TXN_LOGIC`, plus drag-and-drop tab order) and delegates *Application Settings* to `blg-shared-utilities/modules/permission/field-configuration` — an 8,300-line template gated by `sessionStorage.appletCode`. The set of toggles that actually apply to an applet is the intersection of that template with the applet's `applet-settings.model.ts` (Sales Invoice 255, Sales Order 240, Debit Note 163, Credit Note 194, Sales Return 134). The template also shows toggles an applet ignores (e.g. `HIDE_PICK_PACK_QUEUE_MENU` on the credit note, purchase-order menus on the debit note). The lane scratchpad has `applet-scan.sh` that does this intersection automatically.
- 2026-09-05 — **Learning 2: `HIDE_*` settings and `SHOW_*` client-side permissions are a pair.** app.component removes a sidebar item when `!SHOW_X && HIDE_X`, so a tenant-wide hide can be re-opened per user/role — but only if the `SHOW_*` code exists in the registry, which it mostly does not (see Questions). The same pairing exists for pricing columns (`HIDE_UNIT_PRICE_*` ↔ `SHOW_UNIT_PRICE_*`), and for this family of applets the shared screen defaults detailed pricing columns and department fields to hidden (`shouldHideSetting` / `hideDepartmentSetting` lists).
- 2026-09-05 — **Learning 3: posting behaviour is not an applet setting.** What FINAL does is decided by the document's signums (invoice +1/−1, credit note −1/0, return −1/+1, debit note +1/0, order 0/0), by `JournalPostingTypeHandler`'s per-family handler (`SALES` → DEBTOR/SALES/SALES_DISCOUNT/SALES_RETURN/OUTPUT_TAX/FOREX_*; return lines use the `SALES_RETURN` txn code), and by the company's `posting_final_json` include/exclude list read by the Generic Document Primary Processor. The only applet-side levers are validation flags (`VALIDATE_STOCK_ON_FINALIZE`, `ENABLE_SERIAL_NUMBER_VALIDATION_FINAL`, `DISALLOW_SELL_BELOW_*`) and `FINAL_STATUS_GUID` for workflow.
- 2026-09-05 — Applet repos hold almost no GitHub issues (1–6 each, mostly migration chores); real failure modes come from commit subjects that reference customer support repos. Troubleshooting tables were built from those, anonymised.
- 2026-09-05 — Two pages in this lane carried a UTF-8 BOM (sales return, debit note); preserved.
- 2026-09-05 — Stopping after 5 pages this run (invoice, credit note, order, return, debit note): the next queue item, `pos-general-applet`, is a much larger applet (its own 80+ `POS_*` toggles on the shared screen) and deserves a fresh session.

- 2026-09-05 — Applet UI repos are Angular workspaces under `micro-fe/projects/wavelet-erp/applets/<slug>/`; the Settings → *Application Settings* screen is the **shared** `FieldConfigurationComponent` from `blg-shared-utilities` (8,300-line template, gated by `sessionStorage.appletCode`). Per-applet settings therefore = intersection of the applet's `AppletSettings` interface with that template. Reusable extraction script kept in the lane scratchpad.
- 2026-09-05 — The applet repo has only 2 GitHub issues; real failure modes come from the commit log, whose subjects reference customer support repos (`blg-sd-<customer>`). All anonymised.
