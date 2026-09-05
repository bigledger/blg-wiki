---
topic: stock-transfer
aliases: [outbound stock transfer, inbound stock transfer, OBDSTF, IBNSTF, stock transfer queue, ST-GIN knock-off, inter-location transfer]
applets: [stockTransferApplet]
modules: [inventory]
related: [stock-requisition, stock-replenishment, consignee-stock-transfer, stock-balance, stock-availability, stock-report, serial-number-tracking, fiscal-period-lock, warehouse-management]
wiki:
  - content/en/applets/inventory-workflow/stock-transfer-applet.md
status: growing
updated: 2026-09-05
---

# Stock Transfer

Two-document movement of stock between locations of one company: an outbound (goods issued, stock out at Location From) puts every line into an open queue; an inbound knocks the queue off (stock in at Location To). The queue is the in-transit record; no journal is posted.

## Facts

- 2026-09-05 — Registry: `stockTransferApplet` "Stock Transfer", TNT-USER, ACTIVE, documentation_url → /applets/inventory-workflow/stock-transfer-applet/. Repo blg-applet-wavelet-stock-transfer-applet (active, last commits 2026-09). [src:planning/private/registry-applets-2026-09-05.tsv]
- 2026-09-05 — Menus: Outbound (`internal-outbound-stock-transfer`), Queue (`internal-stock-queue`), Details (`stock-transfer-details`), Inbound (`internal-inbound-stock-transfer`), Outbound File Import (`file-import`, listed twice), Error Checking (`error-checking`). Multi-Stock Transfer / Replenishment menu commented out (routes still exist). Settings: Application Settings, Default Selection, Outbound / Inbound Printable Format, Custom Status, Custom Field Placement, Custom Resource Bundle Configuration, Spreadsheet View configuration. [src:blg-applet-wavelet-stock-transfer-applet/.../models/menu-items.ts]
- 2026-09-05 — Menu gating: `updateMenuItem(state, HIDE_setting, SHOW_permission)` for HIDE_QUEUE_MENU/SHOW_QUEUE_MENU, HIDE_OUTBOUND_FILE_IMPORT_MENU/SHOW_OUTBOUND_FILE_IMPORT_MENU, HIDE_STOCK_TRANSFER_DETAILS_MENU/SHOW_STOCK_TRANSFER_DETAILS_MENU, HIDE_ERROR_CHECKING_MENU/SHOW_ERROR_CHECKING_MENU. Only the first two SHOW_ permissions are seeded in bl_applet_client_side_perm_dfn. [src:.../app.component.ts L59-79] [src:akaun_master.bl_applet_client_side_perm_dfn]
- 2026-09-05 — Registered permissions (11): SHOW_CLONE_BUTTON, SHOW_GENDOC_DISCARD_BUTTON, SHOW_GENDOC_FINAL_BUTTON, SHOW_GENDOC_VOID_BUTTON, SHOW_GRN_TAB, SHOW_OUTBOUND_FILE_IMPORT_MENU, SHOW_PURCHASE_INVOICE_TAB, SHOW_QUEUE_MENU, SHOW_ST_GRN_TAB, SHOW_TRANSACTION_DATE, SHOW_UNIT_PRICE_STD_PRICING_SCHEME. [src:akaun_master.bl_applet_client_side_perm_dfn]
- 2026-09-05 — Shared field-configuration screen exposes 66 keys for this applet (gen-doc buttons, doc-number hides, per-side created/modified hides and date-time splits, line columns, KO-tab hides, SHOW_ITEM_STOCK_BALANCE labelled "disallow negative stock for basic item"). INCLUDE_/ENABLE_ dimension, SST, WHT keys are declared but unbound. [src:kb/tools/applet-scan.sh output] [src:blg-shared-utilities/.../field-configuration.component.html]
- 2026-09-05 — Forms: outbound main requires locationSending, locationReceiving, stockTransferServiceDate; inbound requires locationTo, locationFrom, stockTransferServiceDate. Header fields: Reference #, Remarks, Tracking ID, Driver Code (SHOW_DELIVERY_DRIVER_CODE), Doc No tenant/company/branch, custom fields. Line: item, quantity, UOM, GRN No., ST-GRN ID, Tracking ID, remarks; serial / batch (batch_no, issue_date, expiry_date) / bin (bin_code, container_measure, container_qty) / grouped item sub-tabs. [src:.../internal-outbound-stock-transfer-create-main.component.ts L359-361] [src:.../internal-inbound-stock-transfer-create-main.component.ts L368-370]
- 2026-09-05 — Outbound KO For tabs: GRN, Purchase Invoice, ST-GRN, Stock Requisition. Inbound KO For: ST-GIN only; grid filtered by the user's Location To read permissions (store_guids2); knocked-off line gets `quantity_base = qty_open`, link quantity_signum −1. [src:.../internal-outbound-stock-transfer-container/import-knock-off/] [src:.../knock-off-st-gin.component.ts L246-248, L421-476]
- 2026-09-05 — Buttons: outbound SAVE/FINAL/DISCARD (draft), VOID (final only, `showVoid`), CLONE (`!HIDE_CLONE_BUTTON || SHOW_CLONE_BUTTON`), DELETE (`SHOW_DOCUMENT_DELETE_BUTTON && posting_status != FINAL`). Inbound view has no onVoid. ENABLE_AUTO_POPUP without PRINTABLE → "printable not configured" toast on FINAL. [src:.../internal-outbound-stock-transfer-view.component.ts L361-387, L531-642, L806-809]
- 2026-09-05 — Backend: INTERNAL_OUTBOUND_STOCK_TRANSFER quantity_signum −1, amount_signum 0; INTERNAL_INBOUND_STOCK_TRANSFER quantity_signum +1, amount_signum 0 → stock movement only. Neither type appears in JournalPostingTypeHandler → no journal. Short codes OBDSTF / IBNSTF (INTERNAL_STOCK_TRANSFER_NOTE = STKTRF, both signums 0). [src:blg-akaun-platform-java/javasdk/.../InternalOutboundStockTransferDataConsistencyObject.java L16-17] [src:.../InternalInboundStockTransferDataConsistencyObject.java L16-17] [src:.../ServerDocShortCodes.java L26-41]
- 2026-09-05 — Fiscal-period lock (LOCK_TXN / LOCK_ALL) is explicitly NOT applied to outbound and inbound stock transfers. [src:.../GenericDocumentService.java L1681-1696]
- 2026-09-05 — Serial validation: outbound (signum −1) requires the serial at the location (SERIAL_NUMBER_DOES_NOT_EXIST_AT_LOCATION); the "already exists for company" purchase-side check is skipped for INTERNAL_INBOUND_STOCK_TRANSFER. Bin lines must exist ("Bin Line Guid Does Not Exist for STOCK_TRANSFER"). [src:.../GenericDocumentService.java L1878-1890, L1930-1940]
- 2026-09-05 — Queue = `bl_fi_generic_doc_line_open_queue` joined to hdr, locations, item, transporter/sender entities; DELETED filtered. Discarding a document calls `GenericDocumentLineOpenQueueService.updateKO(..., DISCARDED)`. [src:.../StockTransferQueueReportUow.java L273-292] [src:.../GenericDocumentService.java L749]
- 2026-09-05 — Location dropdowns show ACTIVE only; codes starting `L-STOCK-IN-TRANSIT` excluded from Location To (applet component) and optionally from Location From (`excludeStockInTransit` input on the shared component). [src:blg-shared-utilities/utilities/select-location-drop-down-stock/select-location-drop-down-stock.component.ts L32, L85-89, L157] [src:.../utilities/select-location-drop-down-stock-to/...component.ts L87, L156]
- 2026-09-05 — Intercompany auto-stock queue processor is triggered by INTERNAL_SALES_ORDER with a branch intercompany setting in AUTO mode — not by stock transfers. [src:.../IntercompanyProcessingService.java L314-343]
- 2026-09-05 — Issues: FINAL shows custom-field error but still finalises (gt#9564, open); request to auto-create inbound drafts on outbound FINAL (gt#9562, open); item/location lists not filtered by ACTIVE (gt#9251, fixed); queue showed DELETED docs (gt#9141, fixed); inbound location from/to display (gt#6721, fixed); total qty 0 when created from GRN (repo commit re pc-image#2253, fixed). [src:gh:bigledger/blg-int-general-task#9564] [src:gh:bigledger/blg-int-general-task#9562] [src:gh:bigledger/blg-int-general-task#9251] [src:gh:bigledger/blg-int-general-task#9141] [src:gh:bigledger/blg-int-general-task#6721]

## How it connects

- **stock-requisition** — an outbound transfer knocks off a stock requisition (KO For > Stock Requisition); the requisition's location from/to columns are switchable.
- **stock-replenishment** — StockReplenishmentToGenericDocumentService generates outbound transfers from runs.
- **consignee-stock-transfer** — sibling applet with the same queue pattern for consignment.
- **fiscal-period-lock** — the only document family exempt from LOCK_TXN.
- **stock-availability** — queue quantity is at neither location while in transit.

## Open questions

- Whether voiding a finalised outbound whose lines were partly received is blocked by the backend (not verified this pass).
- Whether the inbound side is meant to have VOID (button hidden by setting key exists, but no handler in the view).

## Wiki impact

- internal-stock-requisition-applet (lane 4): state that fulfilment is by outbound stock transfer KO.
- stock-replenishment-applet (lane 4): absorb the replenishment template/events/runs content removed from this page.
- internal-purchase-grn-applet (purchase lane): note GRN can be knocked off into an outbound stock transfer.
- financial-report / chart-of-account fiscal-period text: stock transfers bypass LOCK_TXN.
