---
topic: stock-availability
aliases: [available quantity, stock enquiry, serial trace, batch trace, bin availability]
applets: [stockAvailability]
modules: [inventory, purchasing, pos]
related: [stock-balance, stock-reservation, inv-item-maintenance, doc-item-maintenance, sales-order, purchase-order, moving-average-cost]
wiki:
  - content/en/applets/inventory-workflow/stock-availability-applet.md
status: growing
updated: 2026-09-05
---

# Stock Availability

Read-only enquiry over the stock ledger: balance, open-document adjustments, available quantity, costs and prices, serial/batch/bin views.

## Facts

- 2026-09-05 — Registry: `stockAvailability` "Stock Availability", TNT-USER, ACTIVE; documentation_url already points at /applets/inventory-workflow/stock-availability-applet/. [src:planning/private/registry-applets-2026-09-05.tsv]
- 2026-09-05 — Menus: Stock Availability, Stock Availability Details, Stock Aging Report, Stock Availability with SO and PO, Trace Serial No, Serial Number Balance, Trace Batch No, Bin Availability, Stock Card & Planning, Audit Trail (Stock Transfer Queue commented out). Settings: Application Settings, Default Selection. [src:blg-applet-wavelet-stock-availability-applet/.../models/menu-items.ts]
- 2026-09-05 — Listing: qty_available = qty_balance + Σ(qty_adjustment × qty_signum) over open-document rows returned by the backend; rows are merged per inv_item × location × company. [src:.../stock-availability-listing.component.ts L522-523]
- 2026-09-05 — Backend StockAvailabilityService returns per location: grn_qty, po_qty, so_qty, qty_ledger (balance), stock_in_transit, qty_min_level, qty_max_level, cost MA/last purchase/FIFO/LIFO; callers pass stock_server_doc_type_signum_dto_list pairs (e.g. INTERNAL_SALES_ORDER/INTERNAL_SALES_INVOICE, INTERNAL_PURCHASE_ORDER/INTERNAL_PURCHASE_INVOICE, INTERNAL_PURCHASE_GOODS_RECEIVED_NOTE/INTERNAL_PURCHASE_INVOICE, INTERNAL_OUTBOUND_DELIVERY_ORDER/…). [src:blg-akaun-platform-java/javasdk/.../StockAvailabilityService.java L35, L141-144, L390-402] [src:.../stock-availability-details-view-*/ components]
- 2026-09-05 — Details Optional filter defaults: HIDE_ZERO_BALANCE, HIDE_GOODS_RECEIVE_NOTE_BALANCE, HIDE_PURCHASE_ORDER_BALANCE, HIDE_SALES_ORDER_BALANCE, HIDE_DELIVERY_ORDER_BALANCE, HIDE_SALES_INVOICE_DRAFT_BALANCE, HIDE_GOODS_RECEIVE_NOTE_DRAFT_BALANCE, HIDE_GRN_STOCK_IN_DRAFT_BALANCE; extras SHOW_MIN_QTY, SHOW_MAX_QTY, SHOW_OTHER_IMAGES_1..3/_ALL. [src:.../models/advanced-search-models/stock-availability-details-search.model.ts L62, L126]
- 2026-09-05 — Application Settings: PRICING_SCHEMES, PRICE_METRICS (single select; sets the value type for all scheme columns), ~55 HIDE_* switches (listing columns, report columns, details tabs, stock-movement pop-up, GRN columns, cost/GP pop-ups), ITEM_CATEGORY_GROUP_0..19 + HIDE_ITEM_CATEGORY_GROUP_n, ENABLE_FILTER_BY_TODAYS_TXN, INCREASE_ITEM_IMAGE_SIZE, HIDE_<MENU>_MENU generated from menu states. Default Selection: DEFAULT_BRANCH, DEFAULT_LOCATION, DEFAULT_TOGGLE_COLUMN. [src:.../application-settings.component.ts] [src:.../default-settings.component.html] [src:gh:bigledger/blg-int-general-task#9812]
- 2026-09-05 — 50 registered SHOW_* permissions mirroring the HIDE_ settings (menus, listing columns, costs, documents, report columns). [src:akaun_master.bl_applet_client_side_perm_dfn]
- 2026-09-05 — Stock Card & Planning columns: Total Qty, Reserved Qty, Reserved By, Locked Qty, Packed Qty, Ad Hoc Qty, Available Qty, Bin Code, UOM, Job Order, Completion Date, Status. [src:.../stock-card-planning-container]
- 2026-09-05 — Issues: category-2 filter mismatch between Stock Availability and Doc Item (gt#9149); average cost shown wrong in stock movement / sales report (gt#6078, #6164, #6394); sales-invoice-draft section drill-down bug (gt#7450); reset-MA UI enhancement open (repo#22). [src:gh:bigledger/blg-int-general-task#9149] [src:gh:bigledger/blg-int-general-task#6078] [src:gh:bigledger/blg-int-general-task#7450] [src:gh:bigledger/blg-applet-wavelet-stock-availability-applet#22]
- 2026-09-05 (run 4) — Menu gating is generic: models/menu-visibility.ts hides an item when the user lacks SHOW_<STATE>_MENU and (HIDE_<STATE>_MENU ?? item.defaultHidden) is true; Stock Card & Planning has defaultHidden: true (menu-items.ts) and SHOW_STOCK_CARD_PLANNING_MENU is not seeded, so it is hidden by default for everyone. Audit Trail is a menu; Stock Transfer Queue route exists without a menu entry. [src:blg-applet-wavelet-stock-availability-applet/.../models/menu-visibility.ts] [src:.../models/menu-items.ts]
- 2026-09-05 (run 4) — Application Settings defaults (application-settings.component.ts): menu switches init defaultHidden ?? false, patched `resolve?.[key] ?? default`; listing/report switches no initial value, patched raw; settings2 (HIDE_PURCHASE_GRN_PURCHASE_PRICE, HIDE_PURCHASE_GRN_SUPPLIER_NAME, INCREASE_ITEM_IMAGE_SIZE, HIDE_STOCK_MOVEMENT, HIDE_TOOLTIP_PRICING_DETAILS, HIDE_PURCHASE_DOCUMENTS_IN_STOCK_MOVEMENT, HIDE_PURCHASE_DOCUMENTS, HIDE_INTERNAL_STOCK_ADJUSTMENT) and settings3 (HIDE_UNIT_COST_AMOUNT) init true and null→true; settings5 tabs init false, patched === true; HIDE_ITEM_CATEGORY_GROUP_n default false. Consumers test the stored value (=== true / truthy), so the init-true switches only take effect after the first save of the screen. [src:.../settings-container/application-settings/application-settings.component.ts] [src:.../stock-availability-details-view/stock-availability-details-view.component.ts] [src:.../stock-availability-details-view-movement/stock-availability-details-view-movement.component.ts]
- 2026-09-05 (run 4) — Rendered but not consumed (literal + prefix grep of the micro-fe at 980bd5f): ENABLE_FILTER_BY_TODAYS_TXN, HIDE_PURCHASE_GRN_PURCHASE_PRICE, HIDE_PURCHASE_GRN_SUPPLIER_NAME, HIDE_DOC_POPUP_COST_AMOUNT, HIDE_DOC_POPUP_GP, ITEM_CATEGORY_GROUP_0..20, HIDE_ITEM_CATEGORY_GROUP_0..20. Runtime-only keys: HIDE_UOM/HIDE_STOCK_BALANCE/HIDE_ADJ_QTY/HIDE_AVAILABLE_QTY/HIDE_AVG_COST/HIDE_LAST_PURCHASE_COST (item view, stock-availability-view-main.html L86-176, paired with SHOW_UOM… perms of which only SHOW_AVG_COST and SHOW_LAST_PURCHASE_COST are seeded), HIDE_PURCHASE_ORDER_DOCUMENTS (details view L149; SHOW_PURCHASE_DOCUMENTS), AGING_PERIOD_TYPE (stock-aging-report L233, 'DAY'), PRINTABLE (export L83), DISABLE_STOCK_AVAILABILITY_LISTING (stock-transfer-queue-listing L315). [src:.../stock-availability-view-main/stock-availability-view-main.component.html] [src:.../stock-aging-report/stock-aging-report.component.ts]
- 2026-09-05 (run 4) — PRICING_SCHEMES / PRICE_METRICS and the HIDE_LISTING_*PRICE switches are consumed by the Details listing and its pricing tooltip, not the main listing (stock-availability-listing.component.ts has no pricing-scheme column; column/permission map L90-99 covers costs and quantities only). HIDE_REPORT_* switches are the Stock Movement pop-up columns (details-view-movement), not the aging/trace reports. HIDE_LISTING cost/qty switches also apply to Bin Availability and Stock Card & Planning (column maps with setting+permission). No min-level row highlight exists (getRowStyle L499 styles footer/group rows only). [src:.../stock-availability-details-listing/stock-availability-details-listing.component.ts] [src:.../stock-availability-listing/stock-availability-listing.component.ts] [src:gh:bigledger/blg-int-general-task#9812]
- 2026-09-05 (run 4) — Permissions: 49 ACTIVE seeded (one DELETED typo row SHOW_AVG_COSTSHOW_UOM); checked in code but not seeded: SHOW_STOCK_CARD_PLANNING_MENU, SHOW_AUDIT_TRAIL_MENU, SHOW_LISTING_COMPANY_AVG_COST, SHOW_UOM, SHOW_STOCK_BALANCE, SHOW_ADJ_QTY, SHOW_AVAILABLE_QTY, SHOW_REPORT_INVENTORY_VALUE; seeded but checked nowhere: SHOW_DOC_POPUP_COST_AMOUNT, SHOW_DOC_POPUP_GP. Backend read perms requested by the applet: API_TNT_DM_ERP_INV_STOCK_AVAILABILITY_READ, _AVG_COST_READ, _SALES_REPORT_READ, API_TNT_DM_ERP_STOCK_AGING_REPORT_READ, API_TNT_DM_ERP_STOCK_REPORT_READ, API_TNT_DM_ERP_INV_BATCH_READ, TNT_API_BIN_READ. [src:.../app.component.ts] [src:akaun_master.bl_applet_client_side_perm_dfn (applet_guid join, 2026-09-05)]
- 2026-09-05 (run 4) — Default Selection (tenant): DEFAULT_BRANCH, DEFAULT_LOCATION, DEFAULT_TOGGLE_COLUMN (read by details listing), SIDE_BAR_ORDER drag-and-drop with RESET; new menu items are merged into a saved order. Backend default signum pairs when the caller passes none/incomplete: (INTERNAL_SALES_ORDER→INTERNAL_SALES_INVOICE, −1), (INTERNAL_PURCHASE_GOODS_RECEIVED_NOTE→INTERNAL_PURCHASE_INVOICE, +1) (StockAvailabilityService L29-43). Issue #3333: entity column added to the SO tab. [src:.../settings-container/default-settings/default-settings.component.ts] [src:blg-akaun-platform-java/javasdk/.../stock/StockAvailabilityService.java] [src:gh:bigledger/blg-int-general-task#3333]

- 2026-09-03 — Draft GRN balances are now visible in the stock availability report (weekly technical meeting). [src:gmail:1a0663d23d98e303]

## How it connects
- **internal-purchase-grn-applet** — draft GRNs now surface as pending stock in availability.

- **stock-balance** — qty_ledger comes from the current stock balance tables (bl_inv_current_location_stock_balance / company).
- **stock-reservation** — reserved/locked/packed on Stock Card & Planning.
- **doc-item-maintenance** — item's Stock Availability + Stock Card tabs embed the same views; category slot bindings must match (gt#9149).
- **moving-average-cost** — cost columns depend on the MA processor / reset MA.

## Open questions

- Which document types and signs the *listing* (not Details) sends by default — inferred from backend rows, not read from the listing request.
- Whether Stock Availability with SO and PO includes incoming (A = P − R + I) — existing page claims a configurable variant; not verified.

## Wiki impact

- (run 4) Old page claims removed: min-level row highlight, 'every hide switch has a matching permission', finance-role pattern, reset-MA re-run prescription, pricing-scheme columns on the main listing, HIDE_REPORT_* on aging/trace reports.

- stock-balance-applet, stock-reservation-applet, stock-take-applet, stock-adjustment-applet, warehouse-management-applet (lane 4) → add stock-availability-applet to related_applets.
- internal-sales-order / internal-purchase-order / internal-purchase-grn (other lanes) → mention that open documents reduce/increase Available Qty here.
