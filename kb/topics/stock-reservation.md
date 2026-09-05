---
topic: stock-reservation
aliases: [stock reservation, reserved stock, bin reservation, qty_reserved, stock hold]
applets: [stock-reservation-applet]
modules: [inventory, manufacturing]
related: [stock-availability, stock-balance, internal-sales-order-applet, internal-job-order-applet, internal-packing-order-applet, warehouse-management, stock-replenishment, inv-item-maintenance, scheduler]
wiki:
  - content/en/applets/inventory-workflow/stock-reservation-applet.md
  - content/en/applets/inventory-workflow/stock-availability-applet.md
  - content/en/applets/inventory-workflow/related-applets-stock-balance.md
status: growing
updated: 2026-09-05
---

# Stock reservation

A promise that a quantity of one inventory item at one location is held for one customer until an expiry date. It moves no stock and posts no journal; when set to RESERVED it adds its quantity to the `qty_reserved` column of the location and company stock-balance rows, which the availability queries subtract from what can be sold. Reservations can additionally be pinned to warehouse bin lines, and several document applets (Sales Order, Job Order, Packing Order) create and release them through the same endpoints.

## Facts

- 2026-09-05 — Registry `stock-reservation-applet` "Stock Reservation Applet", TNT-USER, ACTIVE (2024-01-26); `documentation_url` is a Confluence page. Repo `blg-applet-wavelet-stock-reservation-applet` (HEAD b09dca7, 2026-07-27, Angular 14 migration merge); shared-utilities submodule pinned at 0614ae3. Route `applet/tnt/wavelet/erp/stock-reservation-applet`; menus Stock Reservation, Bin Reservation. [src:planning/private/registry-applets-2026-09-05.tsv] [src:blg-applet-wavelet-stock-reservation-applet/.../app.routing.ts] [src:.../models/menu-items.ts]
- 2026-09-05 — Own table `bl_inv_stock_reservation_hdr` (item, comp, branch, store, `quantity_base`, `expiry_date`, `serial_number`, `posting_status`, `entity_fi_item_link_guid`, `gen_doc_hdr_guid`/`gen_doc_line_guid`, `mrp_prodsys_hdr_guid`, CRM contact guids). Doc No = `server_doc_1` from the platform sequence counter for the table (`RunningNumberGeneratorUtil`), not the document-numbering config. [src:blg-akaun-platform-java/client-sdk/.../bl_inv_stock_reservation_hdr.java] [src:.../InventoryStockReservationHdrDataConsistencyObject.java generateRunningNumbersForServerDoc]
- 2026-09-05 — Statuses `StockReservationStatusColumn`: TMP, DRAFT, RESERVED, RELEASED. Form default DRAFT; backend default TMP when omitted (`fillMissingDataForCreation`). `update-posting-status` returns 403 `YOU_ARE_NOT_AUTHORIZED_TO_UPDATE_THE_POSTING_STATUS` when the current status is RELEASED (terminal). [src:.../StockReservationStatusColumn.java] [src:.../InventoryStockReservationHdrController.java L119-150] [src:.../hdr.states.ts]
- 2026-09-05 — Effect: setting RESERVED or RELEASED queues `INVENTORY_STOCK_RESERVATION_PROCESSOR` (RUN_NOW); RESERVED adds `quantity_base` to `qty_reserved` on `bl_inv_current_location_stock_balance` and `bl_inv_current_company_stock_balance`, RELEASED subtracts — only if the balance rows exist (silent no-op otherwise). No `bl_inv_txn_line`, no `qty_ledger` change, no journal. No comparison with on-hand stock for plain reservations. [src:.../InventoryStockReservationHdrService.java L80-100] [src:.../InventoryStockReservationProcessor.java] [src:.../InventoryStockReservationService.java]
- 2026-09-05 — Bin-pinned path: `validate-reserve-with-bin/{guid}` requires item sub-type `BIN_NUMBER`, header DRAFT ("Stock Is Already Reserved"), ≥1 link, and bin availability ≥ reserved per link ("Reserved Qty is Bigger than Available Qty For Bin Code: …"); then sets RESERVED on header + ACTIVE links by direct SQL without queueing the processor — `qty_reserved` on the balance is untouched; only `BinUow` availability (available − reserved − locked) reflects it. A later RELEASE goes through the processor and subtracts an amount that was never added. [src:.../InventoryStockReservationHdrService.java validateAndReserveBin] [src:.../InventoryStockReservationHdrUow.java updateReservationStatusAndBinLink] [src:.../BinUow.java L531-550] [src:.../stock-reservation.effects.ts releaseStock$]
- 2026-09-05 — Expiry: `EXPIRED_STOCK_RESERVATION_REMOVAL_PROCESSOR` (needs a Scheduler crontab; nothing schedules it in code) selects up to `limit` (default 10) headers with `expiry_date <= now()` and `status <> DELETED` regardless of posting status, sets `status = DELETED` on header and ACTIVE links, does not RELEASE and does not touch `qty_reserved`; it also deletes MRP job-order temp reservations and DISCARDs their linked generic document. [src:.../ExpiredStockReservationRemovalProcessor.java] [src:.../ExpiredStockReservationRemovalProcessorProperties.java] [src:.../InventoryStockReservationHdrUow.java retrieveExpiredInvStockReservationByLimit]
- 2026-09-05 — `TEMPORARY_RESERVED_STOCK_REMOVAL_PROCESSOR` (`limit`, `time_to_live` minutes) loads TMP headers and calls `processMultipleReleasedStatus` for those whose `created_date + ttl` is AFTER now (filter inverted), subtracting from `qty_reserved` although TMP never added, leaving status TMP. [src:.../TemporaryReservedStockRemovalProcessor.java L34-42]
- 2026-09-05 — Readers: `StockAvailabilityUow` row mapper computes location available = `qty_ledger + signum×open − qty_reserved` (balance column, L84); its details query sums RESERVED headers directly (`stk_reserve` CTE L1015-1024, status<>DELETED) into `total_qty`; `StockSummaryService.addReservationQty` subtracts company `qty_reserved`; Stock Replenishment snapshots company `qty_reserved`. The two sources diverge after an expiry soft-delete. [src:.../StockAvailabilityUow.java L84, L1015-1024, L1098-1118] [src:.../StockSummaryService.java L54-62]
- 2026-09-05 — Settings: Application Settings is the shared `FieldConfigurationComponent`; with no tab mapping / appletCode gate for this code, 208 controls render at the pinned commit (297 at HEAD, gates.py), all saved, none consumed. Default Selection (`DEFAULT_BRANCH`, `DEFAULT_LOCATION`, silent `DEFAULT_COMPANY`) and personal Default Selection are saved but never read (plain-grep second pass: no settings read outside the settings screens). Printable formats stored under `STOCK_RESERVATION_APPLET_EXT_CODE_PRINTABLE_FORMAT_GUID_STOCK_RESERVATION`, no print button. Personalization → Field Settings has no route (404). Local `field-configuration` component is unrouted dead code. [src:.../app.routing.ts] [src:.../default-settings.component.ts] [src:.../applet-settings.model.ts] [src:.../printable-format-constants.ts] [src:blg-shared-utilities/.../field-configuration.component.html 0614ae3, a8c38a2]
- 2026-09-05 — Form: Branch, Location, Item (picker restricted to PNS BASIC_ITEM/BUNDLE with `basic_qty_ledger_greater_than 0` at the location), Reserve Qty (min 1; = bin total for BIN_NUMBER), Expiry (required), Status, Serial Number, UOM, Description; `entity_guid` required (Account tab). CRM Contract and Bill To / Ship To are not persisted (no reducer mapping / outputs unbound). Backend DCO null checks on `quantity_base` and `amount_std` use `String.valueOf` and never fire. [src:.../main-details.component.ts] [src:.../line-search-item.component.ts L74-92] [src:.../hdr.reducers.ts] [src:.../stock-reservation-create.component.html] [src:.../InventoryStockReservationHdrDataConsistencyObject.java L65-76]
- 2026-09-05 — Permissions: `API_TNT_DM_ERP_INVENTORY_STOCK_RESERVATION_HDR_{OWNER,ADMIN,MEMBER,CREATE,UPDATE,DELETE,READ}`; reserve/release/validate-with-bin use UPDATE; bin links `API_TNT_DM_INV_BIN_RESERVATION_GEN_DOC_LINK_*`. No client-side perm rows seeded (0 in `bl_applet_client_side_perm_dfn`) and no `hasPermission` in the applet. [src:.../TntErpPermissions.java L318-330] [src:.../AkaunTenantPermissionsV3.java L84-89] [src:.../InventoryStockReservationHdrController.java]
- 2026-09-05 — Other writers: Job Order production-request stock planning (DRAFT header linked to the SO line → RESERVED; PARTIAL bin links expiring start + 24 h), Packing Order pick queue (loads RESERVED bin links, sets link + header RELEASED), SFA v2 (embeds a copy of the reservation screens), MRP stock-transfer auto-bin-reservation endpoint (also bumps `mrp_produced_qty`). [src:blg-applet-wavelet-internal-job-order-applet/.../prod-req-stock-planning.component.ts L395-445] [src:blg-applet-wavelet-internal-packing-order-applet/.../queue.effects.ts L138-151] [src:.../InventoryStockReservationHdrService.java autoBinReservationFromMrpStockTransfer]
- 2026-09-05 — Listing advanced search is inert: `onSearch` is empty and the search model is a receipt-voucher copy (`INTERNAL_RECEIPT_VOUCHER` condition). [src:.../stock-reservation-listing.component.ts L240] [src:.../advanced-search-models/stock-reservation.model.ts]

## How it connects

- **stock-availability** — availability subtracts `qty_reserved` from the balance row; the details view sums RESERVED headers instead.
- **stock-balance** — this applet is the only writer of `qty_reserved` on both balance tables; ledger quantity is never touched.
- **internal-sales-order-applet** — the usual source of a reservation (`gen_doc_hdr_guid`); note the separate "signum-zero as outbound reservation" rule in `GenericDocumentService` L2178 for open sales orders.
- **internal-job-order-applet / internal-packing-order-applet** — reserve (job order) and release (packing pick) through the same endpoints; bin links carry the SO line.
- **warehouse-management** — bin headers/lines; bin availability nets reserved and locked quantities.
- **stock-replenishment** — snapshots company `qty_reserved`.
- **scheduler** — the expiry and TMP-removal jobs exist only as crontab entries; no wiki page for the Scheduler applet yet.

## Open questions

- Is the bin path's missing processor call (RESERVED by SQL, RELEASE via processor) intended? As written, releasing a bin-pinned reservation drives `qty_reserved` negative.
- Should the expiry job RELEASE (subtract) before soft-deleting? Today expired RESERVED holds keep reducing availability on the balance row.
- Is `TEMPORARY_RESERVED_STOCK_REMOVAL_PROCESSOR` deployed anywhere? Its TTL filter is inverted and it subtracts for TMP rows that never added.

## Wiki impact

- `content/en/applets/inventory-workflow/stock-availability-applet.md` — say which of its two numbers comes from the balance column and which from the RESERVED-header sum.
- `content/en/applets/inventory-workflow/related-applets-stock-balance.md` — the Stock Reservation row should say "RESERVED/RELEASED via the processor; bin-pinned reservations bypass it".
- `content/en/applets/sales-workflow/internal-sales-order-applet.md` — distinguish the reservation header from the signum-zero availability rule.
- `content/en/applets/manufacturing/internal-packing-order-applet.md` — one sentence on what the pick queue releases; a Job Order applet page does not exist yet (when written: what production-request stock planning reserves).
