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

## How it connects

- **stock-balance** — qty_ledger comes from the current stock balance tables (bl_inv_current_location_stock_balance / company).
- **stock-reservation** — reserved/locked/packed on Stock Card & Planning.
- **doc-item-maintenance** — item's Stock Availability + Stock Card tabs embed the same views; category slot bindings must match (gt#9149).
- **moving-average-cost** — cost columns depend on the MA processor / reset MA.

## Open questions

- Which document types and signs the *listing* (not Details) sends by default — inferred from backend rows, not read from the listing request.
- Whether Stock Availability with SO and PO includes incoming (A = P − R + I) — existing page claims a configurable variant; not verified.

## Wiki impact

- stock-balance-applet, stock-reservation-applet, stock-take-applet, stock-adjustment-applet, warehouse-management-applet (lane 4) → add stock-availability-applet to related_applets.
- internal-sales-order / internal-purchase-order / internal-purchase-grn (other lanes) → mention that open documents reduce/increase Available Qty here.
