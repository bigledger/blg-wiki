---
topic: stock-report
aliases: [stock movement report, stock aging report, stock summary by location, historical stock balance, stock balance report, stock sales and purchase by item code, stock value by level, batch expiry report]
applets: [stockReport]
modules: [inventory, financial-accounting]
related: [stock-balance, stock-availability, stock-transfer, stock-adjustment, stock-take, moving-average-cost, pricebook, closing-stock-value]
wiki:
  - content/en/applets/inventory-workflow/stock-report-applet.md
status: growing
updated: 2026-09-05
---

# Stock Report

Read-only reporting applet over the stock ledger (`bl_inv_txn_line`): thirteen reports, cost / GP columns gated by HIDE_ settings plus SHOW_ permissions, per-report API read permissions.

## Facts

- 2026-09-05 — Registry: `stockReport` "Stock Report", TNT-USER, ACTIVE, documentation_url → /applets/inventory-workflow/stock-report-applet/. Repo blg-applet-wavelet-stock-report-applet. [src:planning/private/registry-applets-2026-09-05.tsv]
- 2026-09-05 — Menus (states): stock-movement-report, stock-aging-report, stock-summary-report-by-location, historical-stock-balance, stock-sales-purchase-by-item-code, stock-value-by-level, batch-expiry-date, stock-balance-report-new ("Stock Balance Report"), stock-balance-supplier-serial-batch, stock-balance-report ("Stock Balance Pricing Report"), stock-balance-report-with-serial, stock-balance-report-supplier-serial; item-price-change route exists, menu removed (pc-image#1146). [src:.../models/menu-items.ts]
- 2026-09-05 — Menu gating is generic: key = state upper-cased with `_`; hide if `HIDE_<KEY>_MENU` set and user lacks `SHOW_<KEY>_MENU`. All 13 SHOW_*_MENU codes seeded. [src:.../app.component.ts L188-206, L245-247] [src:akaun_master.bl_applet_client_side_perm_dfn]
- 2026-09-05 — Application Settings (applet's own field-configuration component; shared template has 0 entries): tabs Sidebar Menu (HIDE_*_MENU per menu item), Stock Report Listing (HIDE_MA_COST, HIDE_GP, HIDE_GP_PERCENTAGE; ADVANCED_SEARCH_SHOW_<basis> for 23 cost/price bases; AGING_PERIOD_TYPE month/day; PRICING_SCHEMES), Item Category Group (0–20). HIDE_OPEN/CLOSING_INVENTORY_VALUE, HIDE_UNIT_COST, HIDE_TOTAL_COST toggles commented out. [src:.../settings-container/field-configuration/field-configuration.component.ts L25-60]
- 2026-09-05 — Registered permissions (57 active): SHOW_*_MENU ×13, SHOW_MA_COST, SHOW_UNIT_COST, SHOW_TOTAL_COST, SHOW_OPEN/CLOSING_INVENTORY_VALUE, SHOW_OPEN/CLOSING_BALANCE_VALUE, SHOW_ADVANCED_SEARCH_* ×23, legacy SHOW_<REPORT> ×11. SHOW_GP / SHOW_GP_PERCENTAGE are checked in code but NOT registered. Stock Balance Pricing Report reads HIDE_LISTING_*/SHOW_LISTING_* (14 pairs) — not on the settings screen, SHOW_LISTING_* not registered. [src:akaun_master.bl_applet_client_side_perm_dfn] [src:.../stock-balance-report-container/]
- 2026-09-05 — API permissions requested at load: API_TNT_DM_ERP_STOCK_REPORT_{OWNER,ADMIN,READ}, STOCK_AGING_REPORT_*, STOCK_SUMMARY_REPORT_BY_LOCATION_*, STOCK_SALES_PURCHASE_BY_ITEM_CODE_READ, STOCK_VALUE_BY_LEVEL_READ, BATCH_AND_EXPIRY_DATE_READ, STOCK_BALANCE_REPORT_BY_BATCH_NUMBER_READ, STOCK_BALANCE_REPORT_READ, STOCK_BALANCE_WITH_SERIAL_NUMBERS_READ. [src:.../app.component.ts L212-240]
- 2026-09-05 — Search: keyword < 3 chars rejected; non-admin must select ≥1 location (warning added 2025). Movement options hide_voided_documents (posting_status <> 'VOID') and include_sn_adjustment (txn_type SN_ADJ rows have null server_doc_type). Historical: SHOW_ZERO_BALANCE, SHOW_SERIAL_NUMBERS. Stock Balance: SHOW_ZERO_BALANCE. With Serial: HIDE_ZERO_QUANTITY. [src:.../stock-movement-report.component.ts L472, L522-523] [src:StockReportUow.java L75-83, L217-222]
- 2026-09-05 — Summary by Location classification: purchase = INTERNAL_PURCHASE_INVOICE, INTERNAL_PURCHASE_RETURN, INTERNAL_PURCHASE_GRN_STOCK_IN; sold = INTERNAL_SALES_CASHBILL, INTERNAL_SALES_INVOICE, INTERNAL_SALES_RETURN; adj = INTERNAL_STOCK_ADJUSTMENT; other = rest; last_purchase_date from PI/GRN; in-transit = open outbound stock transfer queue qty_open + DRAFT inbound stock transfer lines; close_bal_include_non_movement = open + purchase + sold + adj + other (computed client-side). [src:StockReportUow.java L525-700] [src:.../stock-summary-report-by-location.component.ts L269-349]
- 2026-09-05 — Historical balance: sum of ledger lines with txn_date < bal_date and status != DELETED; historical MA from last PNS / RESET_MA line before the date. Movement report resolves both locations for INTERNAL_INBOUND/OUTBOUND_STOCK_TRANSFER headers. [src:StockReportUow.java L146-148, L1470-1500]
- 2026-09-05 — Issues: serial change not reflected in movement report (gt#9265 / #8945, fixed by including SN_ADJ); historical vs summary closing mismatch (gt#4807); trade-in stock not in historical balance (gt#1422, open); aging negative values (aeco#524, fixed); wrong amount for forex docs (pc-image#2209, fixed); Pricing Schemes setting wired into pricing report (2026-08). [src:gh:bigledger/blg-int-general-task#9265] [src:gh:bigledger/blg-int-general-task#4807] [src:gh:bigledger/blg-int-general-task#1422] [src:git log blg-applet-wavelet-stock-report-applet]

## How it connects

- **stock-transfer** — the queue's qty_open is the Stock In Transit column; the movement report shows both locations of a transfer.
- **stock-adjustment** — Adj column; SN_ADJ rows; RSTMVA short code for Reset MA rows.
- **closing-stock-value** — Summary by Location closing value and Historical MA value are what finance reconciles to the ledger's closing stock.
- **pricebook** — PRICING_SCHEMES drives the Pricing report columns.

## Open questions

- Whether SHOW_GP / SHOW_GP_PERCENTAGE should be seeded (code checks them; registry lacks them).
- Whether the HIDE_LISTING_* keys of the Pricing report are meant to be exposed on the settings screen.

## Wiki impact

- stock-transfer-applet (done): mention that open queue qty is "Stock In Transit" on the summary report — added.
- financial-report-applet (finance lane): point to Summary by Location / Historical for closing stock reconciliation.
- non-stock-and-trade-in-applet (lane 4): note trade-in stock is not in Historical Stock Balance (gt#1422).
