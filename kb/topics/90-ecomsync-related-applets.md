---
topic: ecomsync
aliases: [EcomSync, Ecom Sync, marketplace synchronisation, marketplace branch, virtual branch]
applets: [ecomSyncApplet, ecomSyncOrganisationApplet, DocItemApplet, erp_internal_sales_order_applet_v2, shopee_sales_order_applet]
modules: [ecommerce, inventory]
related: [doc-item-maintenance, internal-sales-order-applet, organisation, stock-availability, receipt-voucher, pricing-scheme, cp-commerce]
wiki:
  - content/en/applets/integrations/90-ecomsync-related-applets.md
  - content/en/applets/master-data/doc-item-maintenance-applet.md
  - content/en/applets/master-data/organisation-applet.md
  - content/en/applets/sales-workflow/internal-sales-order-applet.md
  - content/en/modules/ecommerce/introduction-to-ecomsync.md
status: seed
updated: 2026-09-05
---

# EcomSync (marketplace synchronisation)

EcomSync is the name for keeping marketplace shops (Lazada, Shopee, TikTok Shop, Shopify and others) in step with the ERP: items and prices out, orders in, fulfilment status back, payouts turned into receipt vouchers. It is not a single applet in the current code base — the screens live in Organisation (marketplace branch), Doc Item Maintenance (listings, Ecomsync Management, Scheduler) and Sales Order (Internal) (orders, dashboards, bulk status update); the synchronisation itself is a set of server-side job processors.

## Facts

- 2026-09-05 — The registry has two ACTIVE EcomSync rows: `ecomSyncApplet` "Ecom Sync" (TNT-APPLET, 2021-12-06) and `ecomSyncOrganisationApplet` "Ecom Sync Organisation" (ROOT-USER, 2025-09-26). Neither code string appears in any cloned repo under refs/ (grep over *.ts/*.json/*.java/*.html excluding node_modules/dist); the GitHub repo `wavelet-Ecomsync` has no commits. [src:planning/private/registry-applets-2026-09-05.tsv] [src:refs/wavelet-Ecomsync]
- 2026-09-05 — A branch's marketplace type is chosen from None, Lazada, Shopee, CP Commerce, Magento, Selluseller, one customer-specific option, Anchanto OMS, Shopify, Tiktok. [src:blg-applet-core-akaun-platform-akaun-organisation-applet-v3/…/branch-container/branch-edit/branch-edit.component.ts:238-249]
- 2026-09-05 — The server-side marketplace branch record (`bl_fi_mst_ecomsync_branch`) links to the ERP branch (`fi_branch_guid`) and carries `mode_config`, `sales_order_config`, `qty_balance`, `buffer_config`, `qty_buffer`, `percentage`, `stock_mode`, `override_item_stock_config`, `inventory_source`. Creation validators require a guid, an existing ERP branch and a non-blank code. [src:blg-akaun-platform-java/client-sdk/…/table/financial/bl_fi_mst_ecomsync_branch.java] [src:blg-akaun-platform-java/javasdk/…/validator/BranchDataConsistencyObjects/EcomsyncBranchDataConsistencyObject.java]
- 2026-09-05 — Each item↔shop link is a `bl_fi_mst_ecomsync_item_hdr` row holding the shop identifiers (`mkt_item_id`, `mkt_seller_sku`, `mkt_sku_id`, `mkt_shop_sku`, `mkt_item_status`, `mkt_type`), its own copy of the stock rule (`mode_config`, `sales_order_config`, `buffer_config`, `qty_buffer`, `percentage`, `override_branch_stock_config`, `is_pre_order`), the computed seller quantities (`mkp_seller_stock_bal_qty`, `mkp_seller_available_qty`, `mkp_seller_buffer`, `mkp_open_seller_order_qty`), `main_image_guid`, `dim_*`, and an optional `ecomsync_parent_hdr_guid`. [src:blg-akaun-platform-java/client-sdk/…/table/financial/bl_fi_mst_ecomsync_item_hdr.java]
- 2026-09-05 — Doc Item Maintenance → Settings → Ecomsync Management offers four branch-scoped pulls: Lazada Get Category Tree, Lazada Get Brands, Shopee Get Category Tree, Shopee Get Logistics ("Please select the branch" otherwise). [src:blg-applet-wavelet-doc-item-maintenance-applet/…/settings-container/ecomsync-management/ecomsync-management.component.ts:417-429]
- 2026-09-05 — The Doc Item Scheduler screen offers exactly twelve job codes, all Lazada or Shopee: `LAZADA_PRODUCTS`, `LAZADA_SALES_ORDER_IDS`, `LAZADA_QC_STATUS`, `LAZADA_FULFILLMENT`, `LAZADA_SALES_ORDER_CANCELLATION_UPDATE`, `INVENTORY_SYNCING_TO_LAZADA`, `SHOPEE_PRODUCTS`, `SHOPEE_ORDERS`, `SHOPEE_BRANDS`, `SHOPEE_CATEGORIES`, `SHOPEE_SALES_ORDER_CANCELLATION_UPDATE`, `INVENTORY_SYNCING_TO_SHOPEE`. [src:blg-applet-wavelet-doc-item-maintenance-applet/…/scheduler-container/scheduler-create/scheduler-create.component.ts]
- 2026-09-05 — Sales Order (Internal) Ecomsync menu = Dashboard (Lazada Dashboard / Shopee Dashboard tabs), Scheduler, Reply To Review, Replied Review; routes `ecomsync-dashboard`, `ecomsync-scheduler`, `ecomsync-reply-to-review`, `ecomsync-replied-review`. [src:blg-applet-wavelet-internal-sales-order-applet-v2/…/src/app/models/menu-items.ts:56-85] [src:…/app.routing.ts:86-98] [src:…/dashboard-container/ecomsync-dashboard/ecomsync-dashboard-modules.component.html]
- 2026-09-05 — The Internal Sales Order Bulk Update Listing pushes status to the marketplace with three modes: `topackedLZD` "Create Package and Print Invoice and Shipping Label: Lazada", `readytoshipLZD` "Arrange Shipment: Lazada", `readytoshipSHP` "Ready To Ship: Shopee"; a mode applied to the other marketplace's orders toasts "Error mode being selected for lazada/shopee"; no mode or no rows toasts "Please Select a Mode or Select at least One Data from Listing". [src:blg-applet-wavelet-internal-sales-order-applet-v2/…/bulk-update-ecomsync/internal-sales-order-bulk-update-listing.component.ts:404,536-590]
- 2026-09-05 — Fulfilment outcome per order is stored in `bl_fi_generic_doc_ecomsync_fulfillment_hdr` (`type`, `fulfill_status`, `fulfill_resolution`, param/value columns) with lines. [src:blg-akaun-platform-java/client-sdk/…/table/financial/bl_fi_generic_doc_ecomsync_fulfillment_hdr.java]
- 2026-09-05 — Backend job processors exist for Lazada (order ids + items ingestion, cancellation update, receipt creation, review queue/reply), Shopee (orders, products, fulfilment, logistics, cancellation, payout→receipt voucher, review queue/reply), TikTok (orders, products, settlement→receipt voucher), Shopify (orders), plus item/media/pricing queue, stock availability, credential refresh and copy-products processors. Magento, Selluseller and Anchanto OMS have no processor in that set. [src:blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/custom/ecomSync/TikTokOrdersProcessor.java] [src:blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/ecomsync/StockAvailabilityProcessor.java]
- 2026-09-05 — `bl_ecomsync_seller_to_tenant_link` (tenant_guid, branch_guid, seller_id) exists with a CRUD controller; it is the likely data behind the ROOT-USER "Ecom Sync Organisation" registry row, but no UI in refs/ writes it. [src:blg-akaun-platform-java/client-sdk/…/table/bl_ecomsync_seller_to_tenant_link.java] [src:blg-akaun-platform-java/akaun-api/…/controller/tenant/dm/ecomsync/EcomSyncSellerTenantLinkController.java]
- 2026-09-05 — `shopee_sales_order_applet` is ACTIVE in the registry under the name "Tiktok Sales Order Applet"; the repo `blg-applet-wavelet-shopee-sales-order-applet` (split from the monorepo 2025-11-01, `appletName = "Tiktok Sales Order Applet"`) is a trimmed Sales Order (Internal) build: menus Sales Order, Line Items, SO Detailed Report, Ecomsync › Dashboard / Reply To Review / Replied Review. No wiki page. [src:blg-applet-wavelet-shopee-sales-order-applet/…/src/app/app.component.ts:29] [src:…/models/menu-items.ts]
- 2026-09-05 — No GitHub issue on the four repos (doc-item-maintenance, internal-sales-order-v2, organisation-v3, shopee-sales-order) matches ecom/marketplace/lazada/shopee/tiktok/sync; the wiki's only EcomSync issue is the closed SO user-guide request. [src:gh:bigledger/blg-wiki#332]

## How it connects

- **organisation** — the marketplace branch is a normal branch with a Marketplace tab; the EcomSync branch record hangs off it and carries the branch-level stock rule.
- **doc-item-maintenance** — the listing record is per item per shop; item-level stock overrides and the pricing-scheme overwrite live there; Ecomsync Management and Scheduler are Doc Item menus.
- **internal-sales-order-applet** — marketplace orders are ingested as TEMP sales orders; status is pushed back from the bulk-update listing; dashboards and review replies are SO menus.
- **stock-availability** — the seller quantities (`mkp_seller_*`) are what the Stock Availability applet/tab shows; `StockAvailabilityProcessor` recomputes them.
- **receipt-voucher** — Shopee payout, TikTok settlement and Lazada receipt processors create receipt vouchers.
- **pricing-scheme** — the branch's default marketplace pricing scheme and the item's `pricing_scheme_overwrite` decide the price sent.
- **cp-commerce** — CP Commerce is a marketplace type; the same branch/item linking applies, the store itself is configured in CP Commerce Admin.

## Open questions

- Are the "Ecom Sync" and "Ecom Sync Organisation" registry rows live products with a UI outside the cloned repos, or leftovers? (kb/questions candidate — needs Vincent / product.)
- How are the TikTok and Shopify processors scheduled for a tenant, given the Doc Item Scheduler screen offers only Lazada/Shopee codes?
- Precedence when both the branch's `override_item_stock_config` and the item's `override_branch_stock_config` are set — not read this run.

## Wiki impact

- `content/en/applets/integrations/90-ecomsync-related-applets.md` — rewritten as the index page (done, run 6).
- `content/en/applets/finance/internal-receipt-voucher-applet.md` (Lane 2) — add a line that marketplace payout/settlement jobs create receipt vouchers, and `90-ecomsync-related-applets` to related links (next pass).
- `content/en/modules/ecommerce/related-applets/_index.md` (other lane) — link the index page; it currently lists Doc Item / Pricebook / Sales Order without the marketplace angle.
- `content/en/applets/_index.md` and `applet-catalog.md` link `/applets/90-ecomsync-related-applets/` — now served by the alias; no edit needed.
