---
title: "EcomSync Related Applets"
description: "Index of the applets that together provide marketplace synchronisation (EcomSync) in BigLedger: which applet holds each setup step, what it writes, and which background jobs run."
weight: 195
aliases:
- /applets/90-ecomsync-related-applets/
modules: [ecommerce, inventory]
related_applets: [organisation-applet, doc-item-maintenance-applet, internal-sales-order-applet, stock-availability-applet, internal-receipt-voucher-applet, cp-commerce-admin-applet, pricebook-applet]
guides: [/guides/roles/ecommerce-specialist/, /business-operations/order-listing/, /user-guide/basic-operations/item-maintenance/]
sources:
  where-it-fits:
    - blg-applet-core-akaun-platform-akaun-organisation-applet-v3/micro-fe/projects/akaun-platform/applets/akaun-organisation-applet-v3/src/app/components/branch-container/branch-edit/branch-edit.component.ts
    - blg-applet-wavelet-doc-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/doc-item-maintenance-applet/src/app/components/settings-container/ecomsync-management/ecomsync-management.component.ts
    - blg-applet-wavelet-doc-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/doc-item-maintenance-applet/src/app/components/scheduler-container/scheduler-create/scheduler-create.component.ts
    - blg-applet-wavelet-doc-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/doc-item-maintenance-applet/src/app/components/basic-item-container/basic-item-edit/marketplace-reseller-websites/marketplace-reseller-websites.component.ts
    - blg-applet-wavelet-internal-sales-order-applet-v2/micro-fe/projects/wavelet-erp/applets/internal-sales-order-applet-v2/src/app/app.routing.ts
    - blg-applet-wavelet-internal-sales-order-applet-v2/micro-fe/projects/wavelet-erp/applets/internal-sales-order-applet-v2/src/app/models/menu-items.ts
    - blg-applet-wavelet-internal-sales-order-applet-v2/micro-fe/projects/wavelet-erp/applets/internal-sales-order-applet-v2/src/app/components/dashboard-container/ecomsync-dashboard/ecomsync-dashboard-modules.component.html
    - blg-applet-wavelet-internal-sales-order-applet-v2/micro-fe/projects/wavelet-erp/applets/internal-sales-order-applet-v2/src/app/components/internal-sales-order-container/bulk-update-ecomsync/internal-sales-order-bulk-update-listing.component.ts
    - blg-applet-wavelet-shopee-sales-order-applet/micro-fe/projects/wavelet-erp/applets/shopee-sales-order-applet/src/app/app.component.ts
    - blg-applet-wavelet-shopee-sales-order-applet/micro-fe/projects/wavelet-erp/applets/shopee-sales-order-applet/src/app/models/menu-items.ts
  data-model:
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/financial/bl_fi_mst_ecomsync_branch.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/financial/bl_fi_mst_ecomsync_item_hdr.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/financial/bl_fi_generic_doc_ecomsync_fulfillment_hdr.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_ecomsync_seller_to_tenant_link.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/BranchDataConsistencyObjects/EcomsyncBranchDataConsistencyObject.java
  background-jobs:
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/custom/ecomSync/LazadaOrderIdsIngestionProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/custom/ecomSync/LazadaReceiptCreationProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/custom/ecomSync/ShopeeOrdersV2Processor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/custom/ecomSync/ShopeePullPayoutDetailToReceiptVoucherProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/custom/ecomSync/ShopifyOrdersV2Processor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/custom/ecomSync/TikTokOrdersProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/custom/ecomSync/TikTokPullSettlementPerTxnToReceiptVoucherProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/ecomsync/StockAvailabilityProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/ecomsync/UpdateEcomsyncItemFromFiItemProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/ecomsync/LazadaReviewReplyProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/ecomsync/ShopeeReviewReplyProcessor.java
  troubleshooting:
    - blg-applet-wavelet-internal-sales-order-applet-v2/micro-fe/projects/wavelet-erp/applets/internal-sales-order-applet-v2/src/app/components/internal-sales-order-container/bulk-update-ecomsync/internal-sales-order-bulk-update-listing.component.ts
    - blg-applet-wavelet-doc-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/doc-item-maintenance-applet/src/app/components/settings-container/ecomsync-management/ecomsync-management.component.ts
tags:
- applets
- ecommerce
- marketplace
- synchronization
---

## Overview

**EcomSync** is BigLedger's name for keeping marketplace shops (Lazada, Shopee, TikTok Shop, Shopify and others) in step with the ERP: publishing items and prices to the shop, pulling the shop's orders in as sales orders, pushing fulfilment status back, and turning the marketplace's payouts into receipt vouchers.

It is not one applet. In the current source code there is no separate EcomSync user interface; the screens are spread across three standard applets — **Organisation** (the marketplace branch), **Doc Item Maintenance** (the listings) and **Sales Order (Internal)** (the orders) — and the synchronisation itself runs as background jobs on the server. This page is the index: it tells you which applet holds each step, links to the reference page for that applet, and lists the jobs that run behind the scenes.

{{< callout type="info" >}}
Use this page when you are setting up a marketplace for the first time or tracing why something did not sync. The field-level detail for each screen lives on the applet pages linked below, not here.
{{< /callout >}}

## Where it fits

| Applet | What it holds for EcomSync | Reference page |
|---|---|---|
| **Organisation** | The **marketplace branch**: a branch whose *Marketplace Type* is Lazada, Shopee, TikTok, Shopify, Magento, Selluseller, Anchanto OMS or CP Commerce, with the shop's authorisation, the marketplace settlement method, the branch-level stock rule (mode, buffer or percentage, sales-order handling), the default pricing scheme and the *Publish Item* queue. | [Organisation Applet](/applets/master-data/organisation-applet/) — *Branch → Marketplace* tab |
| **Doc Item Maintenance** | The **listings**: each item's *Marketplace* tab links it to one or more shops, the *Stock Availability* tab shows the resulting marketplace balance, *Settings → Ecomsync Management* pulls Lazada / Shopee category trees, brands and logistics for a branch, and the *Scheduler* menu creates the Lazada / Shopee sync jobs. | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) — *Marketplace* tab, *Scheduler*, *Ecomsync Management* |
| **Sales Order (Internal)** | The **orders**: marketplace orders arrive as sales orders; the *Ecomsync* menu has the Lazada / Shopee dashboards, the scheduler, and review replies; the *Ecomsync* tab on an order shows its marketplace status; the *Bulk Update* listing pushes pack / ready-to-ship status back to the marketplace. | [Sales Order (Internal)](/applets/sales-workflow/internal-sales-order-applet/) — *Ecomsync* menu and tab |
| **Receipt Voucher (Internal)** | Where marketplace **payouts** land: the Shopee payout, TikTok settlement and Lazada receipt jobs create receipt vouchers against the marketplace branch. | [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/) |
| **Stock Availability** | The stock figure the marketplace sees is derived per item and branch from stock balance, open sales orders and the buffer; this applet is the read-only view of that figure across branches. | [Stock Availability Applet](/applets/inventory-workflow/stock-availability-applet/) |
| **Pricebook** | The pricing scheme chosen as the branch's default marketplace price source; the branch's *Pricing Scheme* sub-tab shows which item prices are *No Pricing*, *Syncing* or *Synced*. | [Pricebook Applet](/applets/master-data/pricebook-applet/) |
| **CP Commerce Admin** | BigLedger's own web store. *CP Commerce* is one of the marketplace types, so a CP Commerce branch and items are set up the same way — but the store itself is configured in this applet. | [CP Commerce Admin Applet](/applets/ecommerce/cp-commerce-admin-applet/) |

A marketplace-specific build of the Sales Order applet also exists (its applet name is *Tiktok Sales Order Applet*; it keeps only the Sales Order, Line Items, SO Detailed Report and Ecomsync menus). It has no reference page yet; its screens are a subset of Sales Order (Internal).

## Marketplaces supported

The *Marketplace Type* list on a branch offers **None, Lazada, Shopee, CP Commerce, Magento, Selluseller, Anchanto OMS, Shopify and Tiktok** (plus one customer-specific option). Which of these have a full synchronisation cycle depends on the server-side job processors:

| Marketplace | Orders in | Products / inventory out | Fulfilment status back | Payout → receipt voucher | Reviews |
|---|---|---|---|---|---|
| Lazada | Yes (order ids, then order items) | Yes | Yes, plus cancellation update | Yes | Reply from BigLedger |
| Shopee | Yes | Yes | Yes (fulfilment, logistics), plus cancellation update | Yes | Reply from BigLedger |
| TikTok Shop | Yes | Products | — | Yes (settlement per transaction) | — |
| Shopify | Yes | — | — | — | — |
| Magento, Selluseller, Anchanto OMS | Service packages exist for product retrieval only; no job processor in the EcomSync job set | | | | |

"Yes" means a processor class exists for that step in the backend's EcomSync job set; whether it is scheduled for your tenant is a separate question (see *Background jobs*).

## Setup order

The original version of this page was a list of eleven how-to titles. They are the right steps, in this order; each now points at the applet that owns it.

### Step 1 — Organisation: company, marketplace branch, stock rule

1. **Create the company** (if the marketplace trades under a separate legal entity) — [Organisation Applet](/applets/master-data/organisation-applet/), *Company*.
2. **Create the marketplace branch** — a normal branch record whose *Marketplace → Details* sub-tab sets the *Marketplace Type* and completes the shop authorisation (token fields appear for the types that need them) and the default entity. This is what older documentation calls the *virtual branch*. On the server it is stored as an EcomSync branch record linked to the ERP branch (`bl_fi_mst_ecomsync_branch.fi_branch_guid`); the record must carry a code and point at an existing branch, or the API rejects it (`EcomsyncBranchDataConsistencyObject`, creation validators).
3. **Set the branch's stock and sales-order rule** — *Marketplace → Stock Configuration*: stock mode, buffer by quantity or by percentage, whether the branch overrides item-level stock configuration, and how sales orders are treated. These map to the `mode_config`, `sales_order_config`, `buffer_config`, `qty_buffer`, `percentage`, `stock_mode` and `override_item_stock_config` columns of the EcomSync branch record.
4. **Pick the marketplace settlement method** — *Marketplace → Settlement* (separate from the branch's outer *Settlement* tab, which is for ordinary branch settlement methods).
5. **Choose the default pricing scheme** — *Marketplace → Pricing Scheme*, then *Sync*; the *No Pricing / Syncing / Synced* views show progress.

### Step 2 — Doc Item Maintenance: items and their listings

6. **Create the items** — single (Basic), Bundle (fixed child items and quantities) or Grouped (variants with ratio and display option) — [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/), *Items*. Set the *Manage Media* main image and the *Dimension Details* (height, length, width, weight) before linking: the listing record carries its own copy of both (`main_image_guid`, `dim_*`).
7. **Pull the marketplace's reference data once per branch** — *Settings → Ecomsync Management*: choose the branch, then *Lazada Get Category Tree*, *Lazada Get Brands*, *Shopee Get Category Tree*, *Shopee Get Logistics*. Category and brand pickers on the listing stay empty until this has run.
8. **Link the item to its shop(s)** — the item's *Marketplace* tab: *Main* selects the stores (multi-select over the marketplace branches), *Other Resellers* records reseller URLs, *Checking* shows the synchronisation report. Bundle and single items are linked the same way; a Grouped item's listing record can point at a parent listing (`ecomsync_parent_hdr_guid`). Each link is a marketplace item record (`bl_fi_mst_ecomsync_item_hdr`) holding the shop's own identifiers — `mkt_item_id`, `mkt_seller_sku`, `mkt_sku_id`, `mkt_shop_sku`, `mkt_item_status` — next to the ERP item.
9. **Item-level stock and sales-order overrides (optional)** — the listing record carries the same stock-rule columns as the branch (`mode_config`, `sales_order_config`, `buffer_config`, `qty_buffer`, `percentage`) plus `override_branch_stock_config` and `is_pre_order`; the item's *Stock Availability* tab shows the resulting figures (`mkp_seller_stock_bal_qty`, `mkp_seller_available_qty`, `mkp_seller_buffer`, `mkp_open_seller_order_qty`).
10. **Publish** — either from the branch's *Marketplace → Publish Item* sub-tab (select item category / category-group labels and run the branch item insert queue), or by importing the *Doc Item with Ecomsync Item Link* CSV template from *Import Item*.
11. **Schedule the sync jobs** — *Scheduler*: one record per job code with a time interval or cron expression and the branch list. Codes offered on this screen: `LAZADA_PRODUCTS`, `LAZADA_SALES_ORDER_IDS`, `LAZADA_QC_STATUS`, `LAZADA_FULFILLMENT`, `LAZADA_SALES_ORDER_CANCELLATION_UPDATE`, `INVENTORY_SYNCING_TO_LAZADA`, `SHOPEE_PRODUCTS`, `SHOPEE_ORDERS`, `SHOPEE_BRANDS`, `SHOPEE_CATEGORIES`, `SHOPEE_SALES_ORDER_CANCELLATION_UPDATE`, `INVENTORY_SYNCING_TO_SHOPEE`.

### Step 3 — Sales Order (Internal): orders and status

12. **Watch orders arrive** — *Ecomsync → Dashboard* has a *Lazada Dashboard* and a *Shopee Dashboard* tab; the order-ingestion jobs create sales orders in TEMP status on the marketplace branch. A user must open and save a TEMP marketplace order before it gets its running number ([Sales Order (Internal)](/applets/sales-workflow/internal-sales-order-applet/), *Troubleshooting*).
13. **Update the marketplace order status** — the *Internal Sales Order Bulk Update Listing*: tick the orders, choose a mode — *Create Package and Print Invoice and Shipping Label: Lazada*, *Arrange Shipment: Lazada*, or *Ready To Ship: Shopee* — and click *Update*. The result is recorded per order as a fulfilment record (`bl_fi_generic_doc_ecomsync_fulfillment_hdr`: `type`, `fulfill_status`, `fulfill_resolution`).
14. **Reply to reviews** — *Ecomsync → Reply To Review* and *Replied Review* (Lazada and Shopee).

## Background jobs

Everything that actually talks to a marketplace is a server-side job processor, not a button. The set in the backend (`akaun-api … jobProcessor/custom/ecomSync`, `jobProcessor/ecomsync`, and the queue processors under `controller/tenant/custom/ecomSync`) is:

| Job family | Processors | What they do |
|---|---|---|
| Item publish and update | `EcomsyncItemQueueProcessor`, `UpdateEcomsyncItemFromFiItemProcessor`, `UpdateEcomsyncItemMediaFilesFromFiItemProcessor`, `EcomsyncPricingSchemeQueueProcessor` | Push new or changed items, images and prices from the ERP item to the listing; failures are queued in `bl_fi_mst_ecomsync_item_update_from_fi_item_queue_error` |
| Stock | `StockAvailabilityProcessor`, `EcomsyncUpdateInventoryProcessor` | Recompute marketplace availability from stock balance, open sales orders and buffer, and send it to the shop |
| Lazada | `LazadaOrderIdsIngestionProcessor`, `LazadaOrderItemsIngestionProcessor`, `LazadaSalesOrderCancellationUpdateProcessor`, `LazadaReceiptCreationProcessor`, `LazadaReviewQueueProcessor`, `LazadaReviewReplyProcessor` | Orders in (ids first, then lines), cancellations, receipt vouchers, reviews |
| Shopee | `ShopeeOrdersProcessor` / `V2`, `ShopeeProductsProcessor` / `V2` (and `Custom` variants), `ShopeeFulfillmentProcessor`, `ShopeeLogisticsProcessor`, `ShopeeSalesOrderCancellationUpdateProcessor`, `ShopeePullPayoutDetailToReceiptVoucherProcessor`, `ShopeeReviewQueueProcessor`, `ShopeeReviewReplyProcessor` | Orders, products, fulfilment and logistics status, cancellations, payout → receipt voucher, reviews |
| TikTok Shop | `TikTokOrdersProcessor`, `TikTokProductProcessor`, `TikTokPullSettlementPerTxnToReceiptVoucherProcessor` | Orders, products, settlement → receipt voucher |
| Shopify | `ShopifyOrdersProcessor` / `V2` | Orders in |
| Housekeeping | `EcomsyncRefreshCredentialsProcessor`, `SalesOrdersCheckerProcessor`, `EcomsyncCopyProductsProcessor`, `EcomsyncToOmsCopyProductsProcessor`, `EcomsyncMarketSpecificItemCodeUpdateProcessor` | Refresh shop tokens, re-check orders, copy listings between branches or to an OMS, rewrite market-specific item codes |

Job-level errors for order documents go to `bl_fi_generic_doc_ecomsync_queue_error`; sync events and history per item are kept in `bl_fi_mst_ecomsync_syncing_event` and the item syncing history, which the item's *Marketplace → Checking* view reads.

Only the Lazada and Shopee jobs can be created from the Doc Item *Scheduler* screen. The TikTok, Shopify and housekeeping processors exist in the backend but are not offered there; ask BigLedger support how they are scheduled for your tenant.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| Category, brand or logistics pickers on a listing are empty | *Ecomsync Management* has not been run for that marketplace branch | *Doc Item Maintenance → Settings → Ecomsync Management*: select the branch, run the *Get Category Tree* / *Get Brands* / *Get Logistics* actions |
| *Ecomsync Management* shows "Please select the branch" | The four pull actions need a marketplace branch chosen first | Pick the branch in the *Branch* field, then run the action |
| Bulk update refuses: "Please Select a Mode or Select at least One Data from Listing" | No mode chosen or no rows ticked | Choose a mode and tick the orders |
| Bulk update toast "Error mode being selected for lazada" / "… for shopee" | The mode does not match the order's marketplace (a Shopee mode applied to Lazada orders or the reverse) | Filter the listing to one marketplace and pick its mode |
| Marketplace order stuck in TEMP with no running number | Created by the ingestion job; the tenant running number is assigned when a user saves it | Open the order and save |
| Available quantity on the shop is lower than the stock balance | Open FINAL sales orders and the branch or item buffer are subtracted before sending | Expected; check *Stock Configuration* on the branch and the item's *Stock Availability* tab |
| Item changed in the ERP but the shop still shows the old value | The item-update job has not run, or its run is in the item-update error queue | Check the item's *Marketplace → Checking* report; re-run the products job for that marketplace |
| Nothing syncs for a TikTok or Shopify branch although the branch is authorised | Their processors are not created from the *Scheduler* screen | Contact BigLedger support to enable the jobs for the tenant |

## Related documentation

- Legacy EcomSync module pages (imported from the original product wiki; screen names may be older): [Introduction to EcomSync](/modules/ecommerce/introduction-to-ecomsync/), [Ecomsync Features](/modules/ecommerce/ecomsync-features/), [EcomSync Applet](/modules/ecommerce/ecomsync-applet/)
- [E-Commerce module](/modules-v2/ecommerce/) and its [related applets](/modules-v2/ecommerce/related-applets/)
- [E-Commerce Specialist role guide](/guides/roles/ecommerce-specialist/)
- [Order listing](/business-operations/order-listing/) and [Item maintenance](/user-guide/basic-operations/item-maintenance/) user guides
- Applet reference pages: [Organisation Applet](/applets/master-data/organisation-applet/) · [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) · [Sales Order (Internal)](/applets/sales-workflow/internal-sales-order-applet/) · [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/) · [Stock Availability Applet](/applets/inventory-workflow/stock-availability-applet/) · [Pricebook Applet](/applets/master-data/pricebook-applet/) · [CP Commerce Admin Applet](/applets/ecommerce/cp-commerce-admin-applet/)
