---
topic: internal-sales-order-applet
aliases: [sales order, SO, INTERNAL_SALES_ORDER, erp_internal_sales_order_applet_v2]
applets: [erp_internal_sales_order_applet_v2]
modules: [inventory, ecommerce, crm-digital, financial-accounting]
related: [internal-sales-invoice-applet, internal-sales-quotation-applet, internal-delivery-order-applet, internal-packing-order-applet, internal-purchase-order-applet, stock-availability, stock-reservation, pick-pack-queue, ecomsync, intercompany, credit-limit]
wiki:
  - content/en/applets/sales-workflow/internal-sales-order-applet.md
status: growing
updated: 2026-09-05
---

# Sales Order (Internal)

The commitment document before invoice/delivery. Both signums are 0: FINAL posts nothing to GL or stock, but reduces available stock, can reserve stock, and is the knock-off source for invoices, delivery orders and packing orders.

## Facts

- 2026-09-05 — Registry: "Sales Order (Internal)", code `erp_internal_sales_order_applet_v2`; repo display name "Internal Sales Order Applet v2"; route root `applet/tnt/wavelet/erp/internal-sales-order-applet`. [src:registry] [src:…/app.routing.ts]
- 2026-09-05 — Amount signum 0, quantity signum 0 (validator + applet constants). [src:javasdk/…/InternalSalesOrderDataConsistencyObject.java] [src:…/models/constants/applet-constants.ts]
- 2026-09-05 — Available stock = balance − open sales orders − invoices: `StockAvailabilityService` lists `INTERNAL_SALES_ORDER` with signum −1 next to `INTERNAL_SALES_INVOICE`. [src:javasdk/…/StockAvailabilityService.java#L36-L40]
- 2026-09-05 — Backend keeps a `salesDocTypeSignumZero` list (QUOTATION, SALES_ORDER, SALES_RMA, OUTBOUND_DO, JOBSHEET…) so serial/batch and stock-balance validation can be applied to signum-0 documents when the caller passes the flag; the applet's `ENABLE_SERIAL_NUMBER_VALIDATION_FINAL` drives it. [src:javasdk/…/GenericDocumentService.java#L1858,L2083]
- 2026-09-05 — Sales orders are in the blacklist-checked doc-type set at FINAL. [src:javasdk/…/GenericDocumentService.java#L1649]
- 2026-09-05 — TEMP → ACTIVE transition assigns the tenant running number (integration-created orders). [src:javasdk/…/GenericDocumentService.java checkOnUpdateFromTempToActive]
- 2026-09-05 — FINAL of an order on a subscribed e-commerce feed queues `CpCommerceSOFileQueueProcessor` (`GenericDocumentSOSpecificService.createSOTransferOnSubscription`). [src:javasdk/…/GenericDocumentSOSpecificService.java]
- 2026-09-05 — Intercompany: SALES_ORDER ↔ PURCHASE_ORDER; with branch setting mode AUTO + auto_stock_purchase entity, FINAL queues `IntercompanyAutoStockProcessingQueue`; applet toggle `INTERCOMPANY_ENABLE_AUTO_PURCHASE_STOCK`. [src:javasdk/…/IntercompanyProcessingService.java#L322-L345] [src:field-configuration.component.html]
- 2026-09-05 — 18 sidebar menus incl. SO Line with SI KO, Delivery Items, Ecomsync (4 children), Batch Printing, Delivery Plan, Calendar, Audit Trail; 14 `HIDE_*_MENU` toggles; only 25 client-side perms registered — none of the `SHOW_*_MENU` codes the app checks. [src:…/models/menu-items.ts] [src:…/app.component.ts#L45-L120] [src:akaun_master.bl_applet_client_side_perm_dfn]
- 2026-09-05 — Settings unique to this applet: Custom Status (5 header + 5 line + 5 client-doc statuses with values/default), Sales Order Status (code/name/sort order list), `DEFAULT_CURRENCY` in Default Selection, 21-tab order. [src:…/settings-container/custom-status/] [src:…/sales-order-status-container/] [src:…/default-settings.component.ts]
- 2026-09-05 — "CLOSE" is a per-line action (`closeLineConfirmation` in edit-line-item; "close line" in SO Line with SI KO), not a posting status; the previous wiki page listed CLOSE as a document status. [src:…/internal-sales-order-edit-line-item.component.ts#L57-L347] [src:git-log "add the close line SO Line with SI KO"]
- 2026-09-05 — Reservation UI: Reserved Stock tab, availability-by-job with temporary reservation dialog, highlighted reserved rows showing reserving entity; MRP tab links job orders (`MRP_MANDATORY_FOR_NON_FINISHED_GOODS`). [src:…/internal-sales-order-edit-line-item/availability-by-job/] [src:git-log]
- 2026-09-05 — Commit-log fixes (anonymised): batch picker stale selection; position_id reassigned on delete; grid reset after SAVE/FINAL; bundle child JSON; missing doclink hdr on KO; zero-price warning; SN/batch validation messages; parent/alias item family search; custom-field retry button removed; remarks dropdown. [src:git-log:blg-applet-wavelet-internal-sales-order-applet-v2]

## How it connects

- **internal-sales-invoice-applet** — `SalesOrderToSalesInvoiceConverter`; SO Line with SI KO tracks open quantity.
- **internal-packing-order-applet** — `docTypeConnectorMap` names INTERNAL_SALES_ORDER as the packing order's previous document.
- **stock-availability / stock-reservation** — orders reduce availability; lines can reserve.
- **internal-purchase-order-applet** — intercompany mirror + auto stock purchase.
- **ecomsync** — TEMP orders from marketplaces; commerce SO processor at FINAL.

## Open questions

- Which caller passes `validateStockBalanceForSignumZero` for sales orders (UI setting?) — only `SHOW_ITEM_STOCK_BALANCE` ("disallow negative stock for basic item") was found on the shared screen.
- Whether the `SHOW_*_MENU` client-side codes are seeded per tenant rather than in the master registry.

## Wiki impact

- `manufacturing/internal-packing-order-applet` (lane 1) should cite INTERNAL_SALES_ORDER as its source document.
- `inventory-workflow/stock-availability-applet` and `stock-reservation-applet` should explain the sales-order effect on availability.
