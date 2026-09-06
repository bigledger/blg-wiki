---
topic: warehouse-management
aliases: [WMS, warehouse management system, picking and packing, putaway, space container allocation]
applets: [warehouse_management_system_applet, erp_internal_sales_order_applet_v2, stockTransferApplet]
modules: [inventory]
related: [stock-balance, stock-reservation, stock-replenishment, consignee-stock-transfer, doc-item-maintenance]
wiki:
  - content/en/applets/inventory-workflow/warehouse-management-applet.md
status: growing
updated: 2026-09-06
---

# Warehouse management (WMS)

The physical-fulfilment layer between a customer order and the document that moves stock. It owns its
own warehouse / layout / node / container hierarchy (`bl_wms_*`), separate from the company-branch-location
tree and from stock balances. It writes no journal and no inventory transaction line; the outbound flow
ends by drafting a generic document that another applet finalises.

## Facts

- 2026-09-06 — The WMS keeps its own tables (`bl_wms_warehouse_hdr`, `bl_wms_warehouse_layout_hdr`,
  `bl_wms_warehouse_layout_node_hdr`, `bl_wms_container_hdr`, `bl_wms_grn_*`, `bl_wms_picking_*`,
  `bl_wms_packing_*`, `bl_wms_putaway_*`, `bl_wms_pick_pack_queue`). None of them is a generic document:
  there is no `*DataConsistencyObject` for any of them and no journal posting handler.
  [src:blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/erp/wms/]
- 2026-09-06 — Warehouses are NOT stock locations. `bl_wms_warehouse_hdr` is unrelated to
  `bl_inv_mst_location`; the only place the WMS applet touches locations is the Packing List →
  Stock Transfer conversion form. Pages that describe Warehouse Management as the owner of
  `bl_inv_mst_location` are wrong.
  [src:blg-applet-wavelet-warehouse-management-system-applet/…/stock-transfer-location-drop-down/stock-transfer-location-dropdown.component.ts]
- 2026-09-06 — The WMS Picking Queue is fed by exactly one action outside the applet: *Send to
  Warehouse Picking Queue* on the Sales Order (Internal) V2 applet's Pick Pack Queue listing
  (`insertToWarehousePickingQueue` → `wms-pick-pack-queues/insert-wms-picking-queue/backoffice-ep`).
  That endpoint copies `bl_fi_pick_pack_queue` rows into `bl_wms_pick_pack_queue` and DELETES the
  finance-side rows.
  [src:blg-applet-wavelet-internal-sales-order-applet-v2/…/pick-pack-queue-listing.component.ts]
  [src:blg-akaun-platform-java/javasdk/…/domain/erp/wms/WMSPickPackQueueService.java]
- 2026-09-06 — The Picking Queue listing hard-codes `server_doc_type: "INTERNAL_SALES_ORDER"` in both
  its search and its refresh, so only sales orders are ever visible there.
  [src:blg-applet-wavelet-warehouse-management-system-applet/…/picking-queue-listing.component.ts]
- 2026-09-06 — `createPickingList` groups selected queue rows by SOURCE DOCUMENT HEADER and then walks
  every line of that document, setting `qty_to_pick = quantity_base` — the queue's remaining balance is
  ignored — while deleting all the selected WMS queue rows. `qty_to_pick`/`qty_picked` are Java ints,
  so fractional quantities are truncated.
  [src:blg-akaun-platform-java/javasdk/…/domain/erp/wms/WmsPickingQueueToListService.java]
- 2026-09-06 — Packing List converts to `INTERNAL_OUTBOUND_DELIVERY_ORDER` (amount signum 0, quantity
  signum 0 → moves no stock) or `INTERNAL_OUTBOUND_STOCK_TRANSFER` (amount 0, quantity −1 → removes
  stock at FINAL). Both are created with `posting_status = DRAFT`; only PACKED lines are carried over.
  [src:blg-akaun-platform-java/javasdk/…/domain/erp/wms/ConsolidatedPackingListService.java]
  [src:blg-akaun-platform-java/javasdk/…/validator/FinancialDocDataConsistencyObject/InternalOutboundDeliveryOrderDataConsistencyObject.java]
  [src:blg-akaun-platform-java/javasdk/…/validator/FinancialDocDataConsistencyObject/InternalOutboundStockTransferDataConsistencyObject.java]
- 2026-09-06 — Consolidated DO creation throws `Customers are not the same for consolidated DO` when
  the selected packing lists do not share one `doc_entity_hdr_guid`.
  [src:blg-akaun-platform-java/javasdk/…/domain/erp/wms/ConsolidatedPackingListService.java]
- 2026-09-06 — VOIDing an Internal Sales Order runs the `FINANCIAL_PICK_PACK_QUEUE_VOID_PROCESSOR`
  queue handler. It deletes `bl_fi_pick_pack_queue` rows and the picking list ONLY while the picking
  list is `PENDING_PICKING`; after `IN_PACKING_STATION` nothing is cleaned up, and it never touches
  `bl_wms_pick_pack_queue`, so rows already pulled into the warehouse queue are orphaned.
  [src:blg-akaun-platform-java/akaun-api/…/jobProcessor/erp/wms/FinancialPickPackQueueVoidProcessor.java]
- 2026-09-06 — Receiving Doc posting status has exactly two values, `DRAFT` and `FINAL`
  (`WmsPostingStatusColumn`). FINAL creates one processing-queue row per receiving line. Putaway
  process status is `PENDING_ALLOCATION` / `PLANNED_ALLOCATION` / `COMPLETED_ALLOCATION`; which one is
  set on creation depends on whether the container's `property_json.layout_node_guid` is present.
  [src:blg-akaun-platform-java/…/dal/table/erp/wms/WmsPostingStatusColumn.java]
  [src:blg-akaun-platform-java/javasdk/…/domain/erp/wms/WmsPutawayService.java]
- 2026-09-06 — Settings are applet-LOCAL (`app.routing.ts` maps `settings/field-settings` to the repo's
  own `FieldConfigurationComponent`), even though the repo carries the shared-utilities submodule
  (pinned `cf8379f2`). 18 keys pass declared+rendered+persisted; 15 are consumed. The three dead ones
  are `ENABLE_BUNDLE_CONFIG_UPON_FINAL`, `ENABLE_CAMERA_SCANNER`, `ENABLE_SCAN_CODE_SEARCH` — no reader
  in the applet and no Java-side reader either. `ENABLE_BRANCH_FILTER` is model-only.
  [src:blg-applet-wavelet-warehouse-management-system-applet/…/settings-container/field-configuration/]
- 2026-09-06 — FINAL from the Receiving Doc LISTING honours `ENABLE_AUTO_ITEM_ALLOCATION_TO_CONTAINER`;
  FINAL from the Receiving Doc EDITOR always calls `insertToProcessingQueueByAutoAllocation`, ignoring
  the setting. Two code paths, one button label.
  [src:blg-applet-wavelet-warehouse-management-system-applet/…/receiving-doc-listing.component.ts]
  [src:blg-applet-wavelet-warehouse-management-system-applet/…/state-controllers/receiving-doc-controller/store/effects/receiving-doc.effects.ts]
- 2026-09-06 — Both Default Selection screens (applet and personal) are unwired: `appletContainer` is
  declared and never assigned, the load subscription is commented out in the personal one, and the
  SAVE button emits an `@Output` nobody binds because the components are routed directly. Same decoy
  shape already recorded for Shipping Pricebook and Merchant Admin.
  [src:blg-applet-wavelet-warehouse-management-system-applet/…/settings-container/default-settings/default-settings.component.ts]
- 2026-09-06 — Shared `FeatureVisibilityComponent` is a stub: its Teams panel is a select with literal
  `Team 1/2/3` options, an add button with no handler and a SAVE button with no click binding. It is
  also the default landing screen for `settings` (the empty child route redirects to it) while having
  no link in the settings sidebar.
  [src:blg-shared-utilities/modules/settings/feature-visibility/]
- 2026-09-06 — `bl_applet_client_side_perm_dfn` has no rows for `warehouse_management_system_applet`
  (joined on `applet_guid`, akaun_master, checked 2026-09-06), and the applet source contains no
  `hasPermission()` calls. The `PermissionResolver` does register a **Warehouse** target view, so
  server-side permissions can be scoped per warehouse.
  [src:blg-applet-wavelet-warehouse-management-system-applet/…/resolver/permission.resolver.ts]
- 2026-09-06 — The receiving line's *Bin Number* tab validates four required fields and has no save
  handler or dispatch at all. The WMS applet writes none of the bin tables that Stock Reservation
  reserves against.
  [src:blg-applet-wavelet-warehouse-management-system-applet/…/line-item-bin-number/line-item-bin-number.component.ts]
- 2026-09-06 — The shared settings sidebar links `./release-notes` and `./applet-log`; this applet
  routes neither, so both Developer Tools links land on the 404 screen.
  [src:blg-shared-utilities/modules/settings/settings.component.html]
  [src:blg-applet-wavelet-warehouse-management-system-applet/…/app.routing.ts]

## How it connects

- **stock-balance** — the WMS never writes `bl_inv_txn_line`. Everything it does is location bookkeeping
  in its own tables; the balance only changes when the drafted Outbound Stock Transfer (quantity signum
  −1) or the sales-side document is finalised. The Picking Queue merely *reads* `qty_ledger` from the
  location and company balance views.
- **stock-reservation** — the two are independent. Reservation works on `bl_inv_bin_*` and
  `qty_reserved`; the WMS bin tab is dead code and the WMS container/node links are a different model.
  A quantity can be reserved and simultaneously invisible to the warehouse picking queue.
- **stock-transfer** — the Doc Conversion tab is the WMS's only stock-moving exit. The transfer is
  created in DRAFT with company/branch/from/to location taken from the conversion form, prefilled by
  `DEFAULT_COMPANY` / `DEFAULT_BRANCH`.
- **doc-item-maintenance / inventory items** — receiving lines can point at a financial item, an
  inventory item or a WMS item (`bl_wms_item_hdr`), resolved in that order by
  `constructProcessingQueueFromGrnLine`. A WMS item is a separate register, not an extension of the
  inventory item.

## Open questions

- Which applet, if any, calls `wms-grn-processing-queues/bundled-items-insert`? The endpoint and its
  service method exist and `ENABLE_BUNDLE_CONFIG_UPON_FINAL` exists to gate it, but no caller was found
  in any org repo. Possibly the Kotlin mobile WMS client (`akn-kotlin-mobile-wms`) — not read this run.
- The Picking Queue is fed only from Sales Order V2 and the Shopee sales order applet. Is the
  restriction to `INTERNAL_SALES_ORDER` in the listing deliberate, or does it hide Shopee-pushed rows?

## Wiki impact

- content/en/applets/inventory-workflow/warehouse-management-applet.md — rewritten to the applet
  standard in lane-4 run 28.
- content/en/applets/master-data/inv-item-maintenance-applet.md and
  content/en/applets/inventory-workflow/stock-reservation-applet.md both describe Warehouse Management
  as the owner of stock locations / bins. Both claims are wrong (see facts above) — cross-lane fixes
  requested in findings.
