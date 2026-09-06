---
title: "Stock Replenishment Applet"
description: "Reference for the Stock Replenishment applet — templates, scheduled events and runs that compare per-location stock against minimum / maximum levels and generate purchase orders, internal stock transfers or inter-company transfers: its screens, the fulfillment strategy and every setting that changes what a run produces, fields, backend processing chain, permissions and failure modes."
applet_code: "stockReplenishmentApplet"
page_type: applet
applet_repo: "blg-applet-wavelet-stock-replenishment-applet"
modules: [inventory, purchasing]
related_applets: [internal-purchase-order-applet, stock-transfer-applet, inv-item-maintenance-applet, doc-item-maintenance-applet, supplier-applet-1, organisation-applet, stock-balance-applet, stock-availability-applet, related-applets-stock-balance, chart-of-account-applet]
guides: []
sources:
  screens:
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/app.routing.ts
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/components/stock-replenishment-container/stock-replenishment-listing/stock-replenishment-listing.component.ts
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/components/stock-replenishment-container/stock-replenishment-view/stock-replenishment-view.component.ts
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/components/stock-replenishment-container/stock-replenishment-view/stock-replenishment-view.component.html
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/components/stock-replenishment-template-container/stock-replenishment-template-view/stock-replenishment-template-view.component.html
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/components/stock-replenishment-events-container/stock-replenishment-events-view/stock-replenishment-events-view.component.html
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/components/stock-replenishment-events-container/stock-replenishment-events-listing/stock-replenishment-events-listing.component.ts
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/components/stock-replenishment-template-container/stock-replenishment-template-listing/stock-replenishment-template-listing.component.ts
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/components/order-quantity-reports-container/order-quantity-reports-listing/order-quantity-reports-listing.component.ts
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/components/stock-replenishment-container/stock-replenishment-view/stock-replenishment-view-order-qty/stock-replenishment-view-order-qty.component.html
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/components/stock-replenishment-container/stock-replenishment-view/stock-replenishment-po-order-fulfillments/stock-replenishment-po-order-fulfillments.component.html
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/components/stock-replenishment-container/stock-replenishment-view/stock-replenishment-view-export/stock-replenishment-view-export.component.html
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/components/stock-replenishment-container/stock-replenishment-view/stock-replenishment-view-export/stock-replenishment-view-export.component.ts
  configuration:
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/app.routing.ts
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/components/settings-container/field-configuration/field-configuration.component.ts
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.html
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/components/personalization-container/personalization-container.component.html
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/models/constants/printable-format-constants.ts
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/components/settings-container/printable-format-settings-container/printable-format-listing/printable-format-listing.component.ts
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/state-controllers/printable-format-controller/store/effects/printable-format.effects.ts
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/models/email-template.constants.ts
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/models/constants/email-template-placeholder-constants.ts
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/components/settings-container/email-template-container/email-template-create/email-template-create.component.html
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/components/settings-container/email-template-container/email-template-listing/email-template-listing.component.ts
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/components/stock-replenishment-fulfillment-strategy/stock-replenishment-fulfillment-strategy.component.ts
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/components/stock-replenishment-fulfillment-strategy/stock-replenishment-fulfillment-strategy.component.html
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/components/utilities/filter-logic-controls/filter-logic.model.ts
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/components/utilities/filter-logic-controls/filter-logic-controls.component.html
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/components/stock-replenishment-template-container/stock-replenishment-template-view/stock-replenishment-template-view.component.ts
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/components/audit-trail-container/audit-trail-listing/audit-trail-listing.component.ts
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/resolver/permission.resolver.ts
    - blg-shared-utilities/utilities/select-email-template/select-email-template.component.ts
    - blg-shared-utilities/utilities/recurrence-editor-component/recurrence-editor-component.component.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/stockReplenishment/fulfillment/StockReplenishmentFulfillmentStrategyCloneService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/stockReplenishment/run/StockReplenishmentRunHdrService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/stockReplenishment/event/StockReplenishmentEventHdrService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/jobProcessor/inventory/StockReplenishmentRunOrderFulfillmentProcessorService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/stockReplenishment/run/StockReplenishmentToGenericDocumentService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/stock/replenishment/run/StockReplenishmentRunHdrController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/stock/replenishment/run/StockReplenishmentRunOrderFulfillmentLineController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/stock/replenishment/event/StockReplenishmentEventHdrController.java
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/components/branch-container/branch-edit/intercompany-configuration/intercompany-configuration-add/intercompany-configuration-add.component.html
    - akaun_master.bl_applet_client_side_perm_dfn (applet stockReplenishmentApplet, 0 rows)
  fields:
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/components/stock-replenishment-template-container/stock-replenishment-template-create/stock-replenishment-template-create.component.ts
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/components/stock-replenishment-template-container/stock-replenishment-template-create/stock-replenishment-template-create.component.html
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/components/stock-replenishment-events-container/stock-replenishment-events-create/stock-replenishment-events-create.component.ts
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/components/stock-replenishment-events-container/stock-replenishment-events-create/stock-replenishment-events-create.component.html
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/components/stock-replenishment-container/stock-replenishment-create/stock-replenishment-create.component.ts
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/components/stock-replenishment-container/stock-replenishment-create/stock-replenishment-create.component.html
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/components/stock-replenishment-container/stock-replenishment-view/stock-replenishment-view-order-qty/stock-replenishment-view-order-qty.component.ts
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/components/stock-replenishment-container/stock-replenishment-view/stock-replenishment-po-order-fulfillments/stock-replenishment-po-order-fulfillments.component.ts
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/components/stock-replenishment-container/stock-replenishment-view/stock-replenishment-view-order-qty/stock-replenishment-view-order-fulfillment/stock-replenishment-view-order-fulfillment.component.html
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/components/stock-replenishment-template-container/stock-replenishment-template-view/stock-replenishment-template-view-items-filter/stock-replenishment-template-view-add-item-lines/stock-replenishment-template-view-add-item-lines.component.ts
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/components/stock-replenishment-template-container/stock-replenishment-template-view/stock-replenishment-template-view-category-filter/stock-replenishment-template-view-add-categories/stock-replenishment-template-view-add-categories.component.ts
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/components/utilities/update-template-confirmation-dialog/event-confirmation-dialog.html
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/multipo/inv-current-location-stock-balance.service.ts
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/stock/CurrentLocationStockBalanceController.java
  lifecycle:
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/inventory/StockReplenishmentRunProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/inventory/StockReplenishmentRunOrderFulfillmentProcessor.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/jobProcessor/inventory/StockReplenishmentRunProcessorService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/jobProcessor/inventory/StockReplenishmentRunProcessorHelperMethods.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/jobProcessor/inventory/StockReplenishmentRunOrderFulfillmentProcessorService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/stockReplenishment/run/StockReplenishmentToGenericDocumentService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/stockReplenishment/run/StockReplenishmentRunHdrService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/stockReplenishment/event/StockReplenishmentEventHdrService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/stockReplenishment/event/StockReplenishmentEventHdrRecurringService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/stockReplenishment/fulfillment/StockReplenishmentFulfillmentStrategyCloneService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/stockReplenishmentDataConsistencyObjects/event/StockReplenishmentEventHdrDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/stockReplenishmentDataConsistencyObjects/run/StockReplenishmentRunHdrDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/stock/replenishment/run/StockReplenishmentRunHdrUow.java
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/stock-service/stock-replenishment-run-hdr.service.ts
  troubleshooting:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/jobProcessor/inventory/StockReplenishmentRunProcessorHelperMethods.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/jobProcessor/inventory/StockReplenishmentRunOrderFulfillmentProcessorService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/stockReplenishment/run/StockReplenishmentToGenericDocumentService.java
    - blg-applet-wavelet-stock-replenishment-applet/micro-fe/projects/wavelet-erp/applets/stock-replenishment-applet/src/app/components/stock-replenishment-container/stock-replenishment-view/stock-replenishment-po-order-fulfillments/stock-replenishment-po-order-fulfillments.component.ts
    - gh:bigledger/blg-applet-wavelet-stock-replenishment-applet#10
    - gh:bigledger/blg-applet-wavelet-stock-replenishment-applet#29
    - gh:bigledger/blg-applet-wavelet-stock-replenishment-applet#30
    - gh:bigledger/blg-applet-wavelet-stock-replenishment-applet#31
    - gh:bigledger/blg-applet-wavelet-stock-replenishment-applet#39
    - gh:bigledger/blg-applet-wavelet-stock-replenishment-applet#40
    - gh:bigledger/blg-applet-wavelet-stock-replenishment-applet#44
    - gh:bigledger/blg-applet-wavelet-stock-replenishment-applet#46
    - gh:bigledger/blg-applet-wavelet-stock-replenishment-applet#47
tags:
- inventory-management
- stock-replenishment
- replenishment-runs
- replenishment-events
- purchase-order-generation
weight: 170
---

## Overview

The **Stock Replenishment** applet turns per-location minimum / maximum stock levels into documents. A **Replenishment Template** fixes the scope (items, locations, suppliers) and a **Fulfillment Strategy** (buy from a supplier, transfer from another location of the same company, or transfer from another company in the tenant). A **Replenishment Event** puts a template on a calendar — optionally recurring — and a **Replenishment Run** is one execution: the backend processor computes, for every item × location in scope, how far the location is below its minimum (or maximum) level and writes an *order quantity line* and an *order fulfillment line*. From those lines the applet — or, for scheduled events, the processor itself — creates **Purchase Orders (Internal)** or **Internal Outbound Stock Transfers**, and optionally e-mails the outcome.

It is opened by purchasing and inventory planners. Upstream are the item master (min/max levels, supplier pricing) and the stock balance; downstream are the Purchase Order and Stock Transfer applets that carry the generated documents through GRN, invoice and stock movement. The applet itself moves no stock and posts no journal.

## Where it fits

| | Applet / process | Why |
|---|---|---|
| Module | [Inventory](/modules/inventory/), [Purchasing](/modules/purchasing/) | Stock-driven purchase and transfer generation |
| Upstream | [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) | Per-location **minimum / maximum quantity** on the location stock balance row — the only numbers the reorder formula uses |
| Upstream | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) → Entity Pricing | Supplier link per item: **supplier priority**, purchase unit price, min / max order quantity, lead time |
| Upstream | [Supplier](/applets/master-data/supplier-applet-1/) | The supplier must be an active entity of type supplier, otherwise its pricing link is ignored |
| Upstream | [Organization](/applets/master-data/organisation-applet/) | Locations (company, branch, geolocation for *Nearest location first*); **Branch → Intercompany Configuration** for inter-company transfers |
| Upstream | [Stock Balance](/applets/inventory-workflow/stock-balance-applet/) / [Stock Availability](/applets/inventory-workflow/stock-availability-applet/) | `qty_ledger`, open-PO, reserved and sales-order-open quantities that the run snapshots |
| Downstream | [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) | Generated `INTERNAL_PURCHASE_ORDER` documents (DRAFT or FINAL) |
| Downstream | [Stock Transfer](/applets/inventory-workflow/stock-transfer-applet/) | Generated `INTERNAL_OUTBOUND_STOCK_TRANSFER` documents; the inter-company variant also creates the inbound leg in the counterpart company |
| Downstream | [Chart of Account](/applets/master-data/chart-of-account-applet/) | Inter-company transfers are blocked unless the inter-company GL mapping resolves for both companies |

## Screens and menus

The applet route is `applet/tnt/wavelet/erp/stock-replenishment-applet`. Five menu items, plus Settings and Personalization:

| Menu | What it holds |
|---|---|
| **Replenishment Runs** (default) | Listing (Run Name, Status, Description, Created / Updated Date; quick search on run name; advanced search by name and created / updated date) and the run view |
| **Replenishment Events** | Listing (Event Name, Event Code, Created / Updated Date, Status) and the event view |
| **Replenishment Template** | Listing (Template Name, Created / Updated Date, Status) and the template view |
| **Order Qty Reports** | One flat grid over every run's order-quantity lines: Item Code / Name, Location, Supplier, Unit Price (Inc tax), Stock Bal Qty, Reorder level, Min / Max Order Qty, Lead time (days), Sales Qty (last month), Reorder Qty User / Algo / Final, Generated Date, PO Number, Status |
| **Audit Trail** | Generic audit-trail listing filtered by table name |

**Run view** — eleven tabs, in this default order: **Details**, **Locations**, **Items**, **Suppliers**, **Categories**, **Fulfillment Strategy**, **Min/Max Qty/Loc**, **Item List**, **Order Fulfillments**, **Export**, **Purchase Orders**. Item List, Order Fulfillments and Purchase Orders load lazily. A **Delete** button sits under the tabs.

- **Min/Max Qty/Loc** — an editable grid of every item × location in the run (Item Code, Item Name, Loc. Code, **Min**, **Max**, Balance) with two buttons: **Auto-Fill All** (queues the run processor for this run) and **Reload**.
- **Order Fulfillments** — the fulfillment lines (Item Code, Supplier Code / Name, Location Code, Quantity To FulFill, **Quantity To Approve** (editable), Price (editable), Min / Max Purchase Quantity, Location Balance, Fulfillment Type, Status, Blocked Reason) with four buttons: **GENERATE PO**, **GENERATE STOCK TRANSFER**, **GENERATE INTER-COMPANY TRANSFER**, **GENERATE ORDER FULFILMENTS**. Opening a line shows the underlying order-quantity line (Details tab — 30-day sales, balances, in-transit, open PO, reserved, sales-order-in-queue, reorder calculation, supplier, unit cost) and its fulfillment lines.
- **Purchase Orders** — the documents linked to the run (PO Number, Branch, Location, Txn Amount), read through the run's document links.
- **Export** — one working button, **EXPORT AS PDF**, whose handler is empty; CSV / DOCX / ZIP are disabled.

**Template view** — tabs **Details**, **Items filter**, **Suppliers filter**, **Locations filter**, **Fulfillment Strategy**, **Category filter**, **Items List** (a read-only expansion of the picked items and categories). A commented-out **Runs** tab is not shown.

**Event view** — tabs **Details** (with the **Recurring** checkbox and recurrence editor), **Items filter**, **Suppliers filter**, **Locations filter**, **Fulfillment Strategy**.

Each filter tab carries a **Rules Logic** (AND / OR) and **Negation Logic** (Included / Excluded) control above its grid.

**Settings** — Field Settings, Default Selection, Printable Format Settings, Email Template, plus the shared Webhook, Feature Visibility and permission screens. **Personalization** — Sidebar and Default Selection.

No product screenshots exist for this applet; the two images previously on this page were a marketing infographic and a missing file, and have been removed.

## Configuration

### Before you can use it

| Prerequisite | Where | Why it matters |
|---|---|---|
| Per-location **minimum / maximum quantity** on each item | [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) (per-location levels, or the Min-Max import) — or the run's **Min/Max Qty/Loc** tab, which writes the same row | The reorder quantity is `min level − current stock` (or `max level − current stock`). A location with no balance row or a null level is treated as 0, so nothing is ordered (`StockReplenishmentRunProcessorHelperMethods.createNewRunOrderQtyLine`) |
| A **supplier pricing link** per item (Entity Pricing) with **Supplier Priority**, Purchase Unit Price, Purchase Qty Min / Max Order and Lead Time | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) | The processor picks the highest-priority active supplier; without any link it falls back to the supplier of the last FINAL purchase invoice for the item, and if there is none it throws `PO cannot be initiated without a supplier present.` The link also supplies the PO unit price (0 if absent) and lead time (5 days if absent) |
| Suppliers are active entities of type **supplier** | [Supplier](/applets/master-data/supplier-applet-1/) | Links to inactive or non-supplier entities are filtered out (`retrieveActiveSupplierLinks`) |
| Locations belong to a branch and company; geolocation set when using *Nearest location first* | [Organization](/applets/master-data/organisation-applet/) | Generated documents take company / branch from the destination location (`COMPANY_GUID_IS_NULL`, `BRANCH_GUID_IS_NULL` otherwise); the nearest-location rule uses the Haversine distance between location coordinates |
| **Branch Intercompany Configuration** with the pairing *Internal Outbound Stock Transfer to Internal Inbound Stock Transfer* and a *Transfer Counterpart Entity Branch* | [Organization](/applets/master-data/organisation-applet/) → Branch → Edit → Intercompany Configuration | Required only for **Inter-company Transfer only**. Missing config or missing counterpart branch marks the line BLOCKED with the reason shown in the grid (`applyInterCompanyConfigBlocking`) |
| Inter-company GL mapping for both companies | [Chart of Account](/applets/master-data/chart-of-account-applet/) | Same blocking check: "Chart of Accounts not configured for the …" |
| Purchase Order and Stock Transfer applets set up (numbering, posting) | [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/), [Stock Transfer](/applets/inventory-workflow/stock-transfer-applet/) | Generated documents go through `GenericDocumentService.createGenericDoc` with the normal PO / transfer consistency objects; a FINAL transfer moves stock immediately |
| An **Email Template** (Settings → Email Template) and a tenant e-mail sender | This applet; sender resolved by `DefaultSenderEmailResolver` | Only when *Email notification* is on. Without a template the backend uses its built-in subject and body |

### Applet settings

Settings live in **applet-local** components — the shared `FieldConfigurationComponent` is not used. Tenant admins with access to the Settings menu change them (no per-row authority in code).

**Field Settings** is a stub: eight unbound toggles (Unit Discount, SST/VAT/GST, WHT, Blanket Order, Segment, G/L Dimension, Profit Center, Project) and a SAVE button with no handler. Nothing on this screen is saved or read.

**Default Selection** (saved to `bl_applet_ext` `APPLET_SETTINGS` through `saveMasterSettingsInit`):

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| **Default Branch** (`DEFAULT_BRANCH`) | Nothing. Declared, rendered and saved, but no create or view component reads it (plain-grep of the key across the applet finds only the two settings screens) | null | None |
| **Default Location** (`DEFAULT_LOCATION`) | Nothing — same as above. Selecting a branch pre-fills it from the branch's `MAIN_LOCATION` | null | None |
| **Details Tab Ordering** (`STOCK_REPLENISHMENT_DETAILS_TAB_ORDER`) | Drag-and-drop order of the run view tabs. Saved as a list of `{title, content}`; the run view sorts its panels by that order and appends any tab not in the saved list | Details, Locations, Items, Suppliers, Categories, Item List, Order Fulfillments - PO, Export, Purchase Orders (nine entries — the list predates the Fulfillment Strategy and Min/Max Qty/Loc tabs, which therefore always land at the end until the setting is re-saved) | Run view tab order changes for every user on next load |
| **Reset** | Saves `DEFAULT_BRANCH` and `DEFAULT_LOCATION` as null and keeps the current tab order | — | — |

**Printable Format Settings** — upload `.jrxml` formats under transaction type `STOCK_REPLENISHMENT_FULFILLMENT_PRINTABLE_FORMAT`; the star column writes the chosen format's GUID to `PRINTABLE`. `PRINTABLE` is read back only by the Printable Format and Email Template listings to mark the default row. **No screen prints anything** — the Export tab's `onPrint()` is empty — so the setting has no effect on output.

**Email Template** — applet-level notification templates (`bl_applet_notification_template_hdr`, transaction type `STOCK_REPLENISHMENT_FULFILLMENT_EMAIL_TEMPLATE`) with **Template Code**, **Email Subject** (stored in `descr`) and **Template** body (stored in `email_body`), plus clickable placeholder chips. Supported placeholders, substituted by the backend in `${token}` or `{{token}}` form (unknown tokens are left verbatim): `docNumber`, `docTypeLabel`, `docServerType`, `supplier`, `location`, `items`, `itemsFulfilled`, `itemsBlocked`, `reason`, `outcome`, `fulfillmentType`, `documentCount`, `lineCount`. A template is used only when a Fulfillment Strategy selects it.

**Keys read without a control** (stored values would be honoured, but no screen in this applet sets them): `DEFAULT_ORIENTATION` / `VERTICAL_ORIENTATION` (template view layout) and the personal `DEFAULT_TOGGLE_COLUMN` (audit-trail grid).

**Personalization → Default Selection** is broken in this build: the component's `appletSettings$` input is never bound by the shared personalization container, so selecting a branch or location throws on `this.appletContainer.bl_applet_exts` and nothing is saved.

### Document behaviour settings — the Fulfillment Strategy

The Fulfillment Strategy tab is the same component on Template, Event and Run (`level` input). Each level has its own row (`bl_inv_stock_replenishment_template_fulfillment_strategy` / `…_event_…` / `…_run_…`) and **SAVE STRATEGY** writes only that level. Precedence is by cloning, not by lookup: creating an event copies the template's strategy (and filters) onto the event; creating a run copies the event's strategy if the run came from an event, otherwise the template's (`StockReplenishmentFulfillmentStrategyCloneService`, called from `StockReplenishmentEventHdrService.create` and `StockReplenishmentRunHdrService.create`). **The processors read only the run's row** (`getRunFulfillmentStrategy`, first row by `hdr_guid`). Changing a template or event afterwards does not change existing runs; a run with no row at all is processed with the defaults below.

| Control | Key | Options | Default (UI initial value) | Read by |
|---|---|---|---|---|
| **Fulfillment Type** | `fulfillment_type` | Purchase Order only · Internal Stock Transfer only · Inter-company Transfer only | `PURCHASE_ORDER_ONLY` | Fulfillment processor: picks the PO, internal-transfer or inter-company branch |
| **Stock Control** | `stock_control_strategy` | Minimum stock (`MIN`) · Maximum stock (`MAX`) | `MIN` | Run processor: reorder qty = `min − stock` or `max − stock`, floored at 0. `MAX` is also the precondition for surplus redistribution |
| **Document Status** | `po_status` | Draft · Active | `DRAFT` | Document service: `ACTIVE` (or `FINAL`) → generated documents are created with posting status **FINAL**; anything else → **DRAFT**. Applies to POs and to both transfer types |
| **Block existing open PO** (PO type only) | `block_existing_open_po` | checkbox | on | `createPOs`: a line is set BLOCKED ("Existing open purchase order found for same supplier and item") when any non-deleted `INTERNAL_PURCHASE_ORDER` in DRAFT / FINAL / EDITED for the same supplier already has a line for the item — regardless of location or quantity |
| **Transfer Scope** (transfer types) | `transfer_scope` | Same company · Same tenant | `SAME_COMPANY` | Internal transfer source search: `SAME_COMPANY` keeps only source locations of the destination's company |
| **Minimum Transfer Qty** (transfer types) | `minimum_transfer_qty` | number | null (treated as 0) | Source candidates must hold at least this `qty_ledger` |
| **Source Priority** (transfer types) | `source_priority` | Highest stock first · Nearest location first · Specific locations only | `HIGHEST_STOCK_FIRST` | Candidate choice: max `qty_ledger`; nearest by location coordinates; or the strategy's SOURCE locations (then highest stock among them). Nearest falls back to highest-stock when the destination has no coordinates |
| **Specific Locations** (when Source Priority = Specific locations only) | `…_fulfillment_strategy_location` rows, `usage_type = SOURCE` | multi-select | empty | Saved separately after the strategy row; the run clone copies them |
| **Target Scope** (transfer types) | `target_scope` | All tenant companies · Selected companies only | `ALL_TENANT_COMPANIES` | Inter-company source search only. **No company picker is rendered**, so `SELECTED_COMPANIES_ONLY` always resolves to an empty allowed set and every line is left "No suitable inter-company source location found" |
| **Enable surplus handling** | `surplus_enabled` | checkbox | off | With `MAX` control: a line whose `stock − max ≥ Min Surplus` becomes a `SURPLUS_REDISTRIBUTION` fulfillment line instead of an order |
| **Send Excess To** | `surplus_destination_type` | Auto — lowest stock location · Specific locations | `AUTO_LOWEST_STOCK_LOCATION` | Destination = the location (below its own minimum) with the lowest `qty_ledger`, optionally restricted to the strategy's DESTINATION locations |
| **Surplus Transfer Scope** | `surplus_transfer_scope` | Same Company only · Same Tenant | `SAME_COMPANY` | Restricts surplus destinations to the source's company |
| **Min Surplus Before Transfer Triggers** | `surplus_minimum_qty` | number | null (0) | Threshold above |
| **Surplus Document Type** | `surplus_server_doc_type` | `INTERNAL_OUTBOUND_STOCK_TRANSFER` (only option) | `INTERNAL_OUTBOUND_STOCK_TRANSFER` | Document type of the surplus transfer |
| **Email notification** | `email_notification_enabled` | checkbox | off | Master switch for `sendFulfillmentNotification` |
| Email template picker | `email_notification_template_hdr_guid` | templates of this applet's transaction type | empty | Subject / body source; built-in default when empty |
| **Email Recipients** | `email_notification_recipients` | free text, comma / semicolon separated | empty | Empty → status `SKIPPED_NO_RECIPIENTS` on the lines |
| **Notify on success / failure / partial / blocked** | `email_notify_on_*` | checkboxes | all off | One flag per outcome; an outcome whose flag is off is `SKIPPED` |
| `email_format` | — | — | `SUMMARY_PER_RUN` | Declared with a default and saved on the row; **no control** and the backend never reads it |

The two yellow banners on the tab (reorder formula; inter-company accounting impact) are informational text in the template.

**Filter logic per group** (Items, Locations, Suppliers, Categories on template, event and run): **Rules Logic** `AND` / `OR` and **Negation Logic** `Included` / `Excluded`, stored on the header row (`item_filter_logic`, `item_filter_negation`, …; defaults `AND` / `DISABLED`). Effect in `StockReplenishmentRunProcessorService.resolveEffectiveSet`: negation off → the picked set; negation on with picks → every active location / item **except** the picks; negation on with no picks → the whole universe. AND / OR is stored and copied but does not change the result today (the code comment says so). Event values that are null inherit the template's at processing time. **Category filters are cloned template → event but never used to select items** — only Items and Locations decide the item × location grid; Suppliers restrict which supplier is chosen.

### Settings in other applets that control this applet

| Setting | Where it is set | Effect here |
|---|---|---|
| Per-location **Min / Max quantity** (`qty_min_level`, `qty_max_level` on `bl_inv_current_location_stock_balance`) | Inventory Item Maintenance, Min-Max import, or this applet's Min/Max Qty/Loc tab (`PUT …/current-location-stock-balances/update-min-max-qty/backoffice-ep`; the grid rejects Max < Min client-side) | The whole reorder calculation |
| **Supplier Priority**, purchase price, min / max order qty, lead time on the item's Entity Pricing | Doc Item Maintenance (added for this applet — issue #47) | Supplier choice (highest integer wins; ties pick the first row returned), PO price, grid columns |
| Branch **Intercompany Configuration** — pairing *Internal Outbound Stock Transfer → Internal Inbound Stock Transfer*, *Transfer Counterpart Entity / Branch* (issue #30) | Organization → Branch → Intercompany Configuration | Inter-company lines are BLOCKED without it; with AUTO mode the inbound transfer is created in the counterpart company through `IntercompanyProcessingService` |
| PO / Stock Transfer running numbers, Purchase Order applet field settings | Purchase Order (Internal), Stock Transfer | Document numbers and the form the generated documents open in |

### Feature visibility / permissions

- **Client-side permissions**: none seeded (`bl_applet_client_side_perm_dfn` has 0 rows for `stockReplenishmentApplet`). Feature Visibility shows nothing for this applet; menu items cannot be hidden per role.
- **Server permissions** (`AkaunTenantPermissions`): `API_TNT_DM_STOCK_REPLENISHMENT_RUN_{CREATE,READ,UPDATE,DELETE,ADMIN,OWNER,MEMBER}`, and the same seven for `TEMPLATE_HDR`, `EVENT_HDR`, `RUN_FILTER_ITEM`, `RUN_FILTER_LOCATION`, `RUN_ORDER_QTY_LINE`, `RUN_ORDER_FULFILLMENT_LINE`, `RUN_DOC_LINK`. OWNER and ADMIN satisfy every check on their family.
- **Manual run** (`GET …/stock-replenishment-run-hdrs/backoffice-ep/manual-run/{guid}`, the Auto-Fill All / GENERATE ORDER FULFILMENTS buttons) needs only `…_RUN_READ`.
- **All three generate buttons** (`generate-purchase-order`, `generate-internal-stock-transfer`, `generate-inter-company-transfer`) check the one V2 permission `API_TNT_DM_STOCK_REPLENISHMENT_RUN_ORDER_FULFILLMENT_LINE_GENERATE_PO` — there is no separate transfer permission.
- Event-created documents run under the subject stored in the queue event (the user who created the event).

## Fields

### Replenishment Template — Details

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Template Name | `template_name` | Yes (`Validators.required`) | Free text |
| Description | `description` | No | |
| Status | `status` | Yes | `ACTIVE` (default) / `INACTIVE`; nothing in the processor checks it |
| Created By / Creation Date / Modified By / Modified Date | audit | — | Read-only on the view |

Filter tabs add rows to `…_template_filter_item` (picked from the financial-item grid: Item Code, Item Name, UOM, Status — both `fi_item_guid` and `inv_item_guid` are stored), `…_filter_location`, `…_filter_supplier`, `…_filter_category` (label code / name).

### Replenishment Event — Details

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Replenishment Template | `template_hdr_guid` | Yes (`required` in the template) | Its filters and strategy are copied onto the event on save |
| Event Code / Event Name | `code`, `name` | Yes | |
| Cycle Start Date / Cycle End Date | `date_start`, `date_end` | No | Start = when the run is queued (RUN_NOW if already past, otherwise scheduled); the end is only used to size recurring instances |
| Recurring | `is_recurring` | No | Shows the recurrence editor; the RRULE is stored in `rrule`. On save the backend materialises one event row per occurrence (all occurrences for finite rules, **the first 100** for infinite ones), each with its own copy of filters and strategy |
| Description, Status | | Status required | `ACTIVE` default |

Editing or deleting a recurring event asks **This event / This and following events / All events** (`recurring_update_type`; delete passes `delete_type`). A malformed rule is rejected with `Invalid Recurrence Rule : …`.

### Replenishment Run — Details

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Replenishment Template | `template_hdr_guid` | No | With a template the processor is queued immediately on save; without one nothing runs until Auto-Fill All, and the run's own Items / Locations tabs must be filled first |
| Run Name | `run_name` | Yes | |
| Current Run Start / End Date | `date_start`, `date_end` | No | Copied onto every order-quantity line; not used in the calculation |
| Previous Run Name / Start / End | `prev_run_guid` | No (read-only) | Informational; for event-created runs the backend sets it to the template's latest run. The processor does not compare runs |
| Description, Status | | Status required | `ACTIVE` / `INACTIVE` |
| Company, Sales Duration, Replenishment Event Name | | — | Company and Sales Duration are commented out; Event Name shows for event-created runs |

### Min/Max Qty/Loc (run)

Editable **Min** and **Max** per item × location; each edit is sent straight to the location stock balance (not to the run). The grid refuses `Max < Min` when both are positive and restores the old value.

### Order Fulfillments (run)

| Column | Meaning | Editable |
|---|---|---|
| Quantity To FulFill / **Quantity To Approve** | `qty_to_fulfill`, `qty_to_approve` — the transfer quantity for transfer lines; **0 for PO lines** until edited | Quantity To Approve: yes (saved on the line) |
| Price | `purchase_price` from the entity pricing link (0 if none) | Yes |
| Min / Max Purchase Quantity, Lead time | from the entity pricing link (lead time defaults to 5 days) | No |
| Fulfillment Type / Status / Blocked Reason | `PURCHASE_ORDER_ONLY`, `INTERNAL_STOCK_TRANSFER_ONLY`, `INTER_COMPANY_TRANSFER_ONLY`, `SURPLUS_REDISTRIBUTION`; `PENDING` → `GENERATED` or `BLOCKED` | No |

The generated document line takes **Quantity To Approve** as its quantity and **Price** as its unit price; a PO line left at 0 produces a zero-quantity PO line.

## Lifecycle and effects

Templates, events and runs have only `ACTIVE` / `INACTIVE` statuses; there is no FINAL or VOID. The work happens in two queue processors and one document service.

**1. Queueing.** Saving a run with a template inserts a `STOCK_REPLENISHMENT_RUN_PROCESSOR` event (`RUN_NOW`) into `bl_inv_stock_replenishment_run_processing_queue` (`StockReplenishmentRunHdrService.create`). Saving an event inserts the same event per occurrence, `RUN_NOW` when the cycle start is already past, otherwise scheduled for the cycle start (`insertToQueueWithConditions`). Auto-Fill All and GENERATE ORDER FULFILMENTS call `manual-run/{guid}`, which queues the run again.

**2. Run processor** (`StockReplenishmentRunProcessor` → `StockReplenishmentRunProcessorService`), three scenarios: an **event** (creates the run header, copies the event's filters and strategy, sets `prev_run_guid`); a **run with a template** (copies template filters into the run's Locations / Items / Suppliers tabs when the run's own are empty); a **run without a template** (uses the run's tabs only). It then resolves the effective location and item sets (negation), and for every item × location writes a `bl_inv_stock_replenishment_run_order_qty_line` with: location min / max / `qty_ledger` / open-PO; in-transit = open queue quantity of `INTERNAL_OUTBOUND_STOCK_TRANSFER` → `INTERNAL_INBOUND_STOCK_TRANSFER` for the item at the location; company balance, reserved, sales-order-open, open-PO; last-30-days sales at location and company (signed `bl_inv_txn_line` quantities of `INTERNAL_SALES_INVOICE` and `INTERNAL_SALES_RETURN`, excluding BF / CF); `loc_qty_reorder_calc = max(0, level − qty_ledger)`; the chosen supplier. Re-running does not delete earlier lines — each run of the processor appends a new set. Processing stops silently (logged, no error to the UI) when the effective location or item set is empty or a template has no location / item filters.

**3. Fulfillment processor** (`StockReplenishmentRunOrderFulfillmentProcessorService.processOrderQtyLineAndCreateFulfillment`, one secondary queue event per line for manual runs, inline for event runs): reads the run's strategy and writes one `bl_inv_stock_replenishment_run_order_fulfillment_line` per order-quantity line — PO (`server_doc_type = INTERNAL_PURCHASE_ORDER`, status PENDING), internal transfer or inter-company transfer (`INTERNAL_OUTBOUND_STOCK_TRANSFER`, source location chosen by scope / priority, `qty = min(requested, source qty_ledger)`), or surplus redistribution. A line with no item is skipped; a line with no usable source stays PENDING with a reason.

**4. Document service** (`StockReplenishmentToGenericDocumentService`): `createPOs` filters the selected lines to PO type with a supplier and not BLOCKED, applies the open-PO block, builds one PO per line and **merges lines with the same branch and supplier into one PO**, creates them through `GenericDocumentService.createGenericDoc` with `InternalPurchaseOrderDataConsistencyObject`, writes `bl_inv_stock_replenishment_run_doc_link` rows, sets the lines to `GENERATED` and sends the notification. `createInternalStockTransfers` does the same for internal and surplus lines; `createInterCompanyTransfers` adds the branch inter-company checks, stamps `intercompany_settings_json` and triggers the platform inter-company conversion. For **event-created** runs the run processor calls `createPOs` and `createInternalStockTransfers` itself (errors swallowed); inter-company documents are never created automatically.

**Posting proof block**

| | |
|---|---|
| Server document type | None for the applet's own tables (`bl_inv_stock_replenishment_template_hdr`, `…_event_hdr`, `…_run_hdr`, `…_run_order_qty_line`, `…_run_order_fulfillment_line`, `…_run_doc_link`, `…_fulfillment_strategy*`). Generated: `INTERNAL_PURCHASE_ORDER`, `INTERNAL_OUTBOUND_STOCK_TRANSFER` |
| Amount signum / quantity signum | Not applicable to the applet; the generated PO line is written with `amount_signum = 0` and the PO / transfer types then post per their own consistency objects (see the Purchase Order and Stock Transfer pages) |
| Dr / Cr equation | None — no journal from this applet |
| GL precedence | Not applicable; generated lines carry no GL code (the PO applet resolves it when the PO is finalised) |
| Stock processor | None from this applet. A generated transfer created with posting status FINAL moves stock immediately through the Stock Transfer processing chain |
| Generated document header | company / branch from the destination location (`guid_store` = location), `doc_entity_hdr_guid` = supplier (PO), `date_txn` = now, posting status per *Document Status*; line: `item_guid`, `quantity_base` = Qty To Approve, `unit_price_std` = Price, UOM literal `PCS`, no tax, no discount |
| What Delete does | Run: `StockReplenishmentRunHdrUow.delete` removes the header; generated documents and doc links are not touched. Event: per `delete_type` (this / following / all occurrences). Template: header delete only |
| Notification | Per document batch: outcome `SUCCESS` (no blocked lines), `PARTIAL` (some blocked), `BLOCKED` (all blocked), `FAILURE` (exception — then rethrown to the caller). Each line records `SENT`, `FAILED`, `SKIPPED` or `SKIPPED_NO_RECIPIENTS` |

**Validation.** The header consistency objects check only structure (guid, status, audit columns; the event's `guid_algo`, if set, must exist). Business rules are the throws listed under Troubleshooting.

## Related applets

- [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) — receives the generated `INTERNAL_PURCHASE_ORDER` documents; its own *PO Replenishment* menu is a separate, older screen family.
- [Stock Transfer](/applets/inventory-workflow/stock-transfer-applet/) — receives generated outbound transfers (internal, inter-company and surplus).
- [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) — per-location minimum / maximum levels.
- [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) — Entity Pricing supplier links, supplier priority, purchase price, order quantity bands, lead time.
- [Supplier](/applets/master-data/supplier-applet-1/) — the supplier entity on the generated PO.
- [Organization](/applets/master-data/organisation-applet/) — locations, branches, geolocation, Branch Intercompany Configuration.
- [Chart of Account](/applets/master-data/chart-of-account-applet/) — inter-company GL mapping check.
- [Stock Balance](/applets/inventory-workflow/stock-balance-applet/), [Stock Availability](/applets/inventory-workflow/stock-availability-applet/), [Stock Balance overview](/applets/inventory-workflow/related-applets-stock-balance/) — the balance rows the run snapshots and whose min / max it edits.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| Order Fulfillments tab is empty after creating a run | The run was created without a template (nothing is queued), or its Items / Locations tabs are empty, or the template has no location / item filter — the processor logs "will not process all locations/items" and returns | Fill the run's Locations and Items tabs (or pick a template that has them) and press **Auto-Fill All** |
| Every order quantity is 0 | No `qty_min_level` / `qty_max_level` on the location balance row, or the location has no balance row at all (treated as 0) | Set levels on the **Min/Max Qty/Loc** tab or in Inventory Item Maintenance, then re-run |
| Run processor fails with `PO cannot be initiated without a supplier present.` / `There can be no PO without a supplier` | No active supplier pricing link for the item and no FINAL purchase invoice to fall back on (issues #44, #46) | Add the supplier under Doc Item Maintenance → Entity Pricing with a priority; make sure the entity is active and of type supplier |
| Wrong supplier chosen | Highest **Supplier Priority** wins; equal priorities pick the first row returned; the Suppliers filter only narrows the candidates | Set distinct priorities (issue #47) |
| Line BLOCKED "Existing open purchase order found for same supplier and item" | *Block existing open PO* is on and any DRAFT / FINAL / EDITED PO for that supplier already contains the item — at any location | Finalise or receive the open PO, or turn the checkbox off on the **run's** strategy |
| PO created with quantity 0 | PO fulfillment lines start with Qty To Approve = 0 | Enter **Quantity To Approve** on each line before **GENERATE PO** |
| Toast "No purchase order was created - check the selected line's Fulfillment Type, Status, and Blocked Reason" | Selected lines are not `INTERNAL_PURCHASE_ORDER`, have no supplier, or are BLOCKED / already GENERATED | Select PENDING PO lines only; use the matching button for transfer lines |
| Line PENDING "No suitable source location found for internal stock transfer" | No other location holds ≥ *Minimum Transfer Qty*, or *Transfer Scope = Same company* excludes the only stocked locations, or *Specific locations only* has no locations saved | Widen the scope, lower the minimum, or add source locations |
| Inter-company line PENDING "No suitable inter-company source location found" although another company has stock | *Target Scope = Selected companies only* — the UI has no company picker, so the allowed set is empty | Use *All tenant companies* |
| Inter-company line BLOCKED "No inter-company configuration found for this branch" / "…missing 'Auto Purchase Stock Entity Branch'" / "Chart of Accounts not configured…" | Branch Intercompany Configuration lacks the stock-transfer pairing or counterpart branch, or the GL mapping fails (issues #10, #30) | Configure the pairing on the **destination** location's branch in the Organization applet and the GL mapping for both companies |
| Strategy edited on the template but the run still behaves the old way | Processors read the run's own strategy row; template → event → run copies happen at creation | Edit the strategy on the **run** (or recreate the run) |
| Filter set to *Excluded* processes everything | Negation with an empty pick list means "whole universe" | Pick at least one value, or set Included |
| Categories filter has no effect | Category rows are copied but not used to select items | Pick items (or exclude items) directly |
| No e-mail although notification is on | The outcome's *Notify on …* checkbox is off (`SKIPPED`), recipients empty (`SKIPPED_NO_RECIPIENTS`), or the send failed (`FAILED`, logged with the error code) | Tick the outcome flags, enter recipients; check the applet's Email Template exists — templates saved before issue #39 had an empty body |
| Placeholders appear literally in the e-mail | Token not in the supported list | Use only the placeholders listed under Email Template |
| Recurring event creates far fewer occurrences than expected | Infinite rules are capped at 100 instances; `Invalid Recurrence Rule` rejects a malformed RRULE (issue #45) | Give the rule an end date or count |
| Order Fulfillments shows duplicate lines | Every Auto-Fill / GENERATE ORDER FULFILMENTS appends a new set of order-quantity and fulfillment lines | Select only the newest lines; delete the extra ones from the grid |
| Personalization → Default Selection throws on selecting a branch | Component input never bound (see Configuration) | Use Settings → Default Selection; the values have no effect anyway |
| Export as PDF does nothing | `onPrint()` is empty; printable formats are stored but never rendered | Use the Purchase Orders tab to open the generated documents and print from the PO applet |

## Related documentation

- [Inventory module](/modules/inventory/) · [Purchasing module](/modules/purchasing/)
- [Stock Balance overview](/applets/inventory-workflow/related-applets-stock-balance/) — where the min / max levels live and how balances are maintained
- [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) — what happens to a generated PO
- [Stock Transfer](/applets/inventory-workflow/stock-transfer-applet/) — what a FINAL outbound transfer does to stock
