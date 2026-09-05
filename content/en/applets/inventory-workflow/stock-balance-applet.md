---
title: "Stock Balance"
description: "Reference for the Stock Balance applet — the read-only item x company x location grid over the current stock balance, with pivot, grouping, charts and export; what it queries, what it filters on, who can open it, and why it can disagree with Stock Availability and Stock Report."
applet_code: "erp_stock_balance_applet"
page_type: applet
applet_repo: "blg-applet-wavelet-stock-balance-applet"
modules: [inventory, purchasing, pos, manufacturing]
related_applets: [related-applets-stock-balance, stock-availability-applet, stock-report-applet, stock-take-applet, stock-adjustment-applet, stock-transfer-applet, stock-reservation-applet, non-stock-and-trade-in-applet, inv-item-maintenance-applet, doc-item-maintenance-applet, organisation-applet]
guides: []
sources:
  screens:
    - blg-applet-wavelet-stock-balance-applet/micro-fe/projects/wavelet-erp/applets/stock-balance-applet/src/app/app.routing.ts
    - blg-applet-wavelet-stock-balance-applet/micro-fe/projects/wavelet-erp/applets/stock-balance-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-stock-balance-applet/micro-fe/projects/wavelet-erp/applets/stock-balance-applet/src/app/services/stock-balance-pages.service.ts
    - blg-applet-wavelet-stock-balance-applet/micro-fe/projects/wavelet-erp/applets/stock-balance-applet/src/app/components/stock-balance-container/stock-balance-listing/stock-balance-listing.component.ts
    - blg-applet-wavelet-stock-balance-applet/micro-fe/projects/wavelet-erp/applets/stock-balance-applet/src/app/components/stock-balance-container/stock-balance-listing/stock-balance-listing.component.html
    - blg-applet-wavelet-stock-balance-applet/micro-fe/projects/wavelet-erp/applets/stock-balance-applet/src/app/components/stock-balance-container/stock-balance-view/stock-balance-view.component.html
    - blg-applet-wavelet-stock-balance-applet/micro-fe/projects/wavelet-erp/applets/stock-balance-applet/src/app/components/stock-balance-container/stock-balance-view/stock-balance-view-batch/stock-balance-view-batch.component.html
    - blg-applet-wavelet-stock-balance-applet/micro-fe/projects/wavelet-erp/applets/stock-balance-applet/src/app/components/stock-balance-container/stock-balance-transaction-history/stock-balance-transaction-history.component.ts
  configuration:
    - blg-applet-wavelet-stock-balance-applet/micro-fe/projects/wavelet-erp/applets/stock-balance-applet/src/app/app.routing.ts
    - blg-applet-wavelet-stock-balance-applet/micro-fe/projects/wavelet-erp/applets/stock-balance-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-stock-balance-applet/micro-fe/projects/wavelet-erp/applets/stock-balance-applet/src/app/components/settings-container/settings-container.component.ts
    - blg-applet-wavelet-stock-balance-applet/micro-fe/projects/wavelet-erp/applets/stock-balance-applet/src/app/components/personalization-container/personalization-container.component.ts
    - blg-applet-wavelet-stock-balance-applet/micro-fe/projects/wavelet-erp/applets/stock-balance-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-stock-balance-applet/micro-fe/projects/wavelet-erp/applets/stock-balance-applet/src/app/components/utilities/custom-tooltip.component.ts
    - blg-applet-wavelet-stock-balance-applet/micro-fe/projects/wavelet-erp/applets/stock-balance-applet/src/app/components/stock-balance-container/stock-balance.module.ts
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/stock/StockAvailabilityController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/DropDownController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/stock/StockAvailabilityService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/permissions/TntErpPermissions.java
    - akaun_master.bl_applet_client_side_perm_dfn (applet erp_stock_balance_applet, 0 rows)
  fields:
    - blg-applet-wavelet-stock-balance-applet/micro-fe/projects/wavelet-erp/applets/stock-balance-applet/src/app/components/stock-balance-container/stock-balance-listing/stock-balance-listing.component.ts
    - blg-applet-wavelet-stock-balance-applet/micro-fe/projects/wavelet-erp/applets/stock-balance-applet/src/app/models/advanced-search-models/stock-bal.model.ts
    - blg-applet-wavelet-stock-balance-applet/micro-fe/projects/wavelet-erp/applets/stock-balance-applet/src/app/models/stock-bal-constants.ts
    - blg-shared-utilities/utilities/advanced-search-v2/advanced-search-v2.component.ts
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dto/erp/StockAvailabilityInputDto.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dto/erp/StockAvailabilityOutputDto.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/stock/StockAvailabilityUow.java
  lifecycle:
    - blg-applet-wavelet-stock-balance-applet/micro-fe/projects/wavelet-erp/applets/stock-balance-applet/src/app/services/api-service.ts
    - blg-applet-wavelet-stock-balance-applet/micro-fe/projects/wavelet-erp/applets/stock-balance-applet/src/app/state-controllers/stock-balance-controller/store/effects/stock-balance.effects.ts
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/stock/StockAvailabilityController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/stock/StockAvailabilityUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/stock/StockAvailabilityService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/inventory/InventoryTxnLineToCurrentStockBalanceProcessor.java
  troubleshooting:
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/stock/StockAvailabilityController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/stock/StockAvailabilityUow.java
    - blg-applet-wavelet-stock-balance-applet/micro-fe/projects/wavelet-erp/applets/stock-balance-applet/src/app/components/stock-balance-container/stock-balance-listing/stock-balance-listing.component.ts
    - gh:bigledger/blg-int-general-task#9080
    - gh:bigledger/blg-int-general-task#4807
    - gh:bigledger/blg-int-general-task#1422
tags:
- stock-balance
- inventory-management
- warehouse
- stock-visibility
- inventory-control
weight: 185
aliases:
- /applets/stock-balance-applet/
---

## Overview

The Stock Balance applet is the enquiry screen over BigLedger's current stock balance: one grid of **item x company x location** rows showing the ledger quantity on hand, the location's moving-average cost and the company's last purchase cost. Warehouse staff open it to see what is where; inventory controllers pivot it by location to compare branches; finance exports it for a quick reconciliation.

It reads only. Nothing in it creates, edits or posts a document, and it has no applet settings of its own. The balance it shows is written by the finalised stock-moving documents and background processors described on [Related Applets - Stock Balance](/applets/inventory-workflow/related-applets-stock-balance/); if a number here is wrong, the fix is always a document (usually a [Stock Adjustment](/applets/inventory-workflow/stock-adjustment-applet/)), never this screen.

Under the hood the grid is fed by the same backend query as the [Stock Availability](/applets/inventory-workflow/stock-availability-applet/) applet, which is why the two agree on the ledger quantity but not on "available" — see [Lifecycle and effects](#lifecycle-and-effects).

## Where it fits

| Direction | Applet / document | Why |
|---|---|---|
| Upstream | Every stock-moving document — see the signum list on [Related Applets - Stock Balance](/applets/inventory-workflow/related-applets-stock-balance/) | Each FINAL appends signed lines to the stock ledger; the balance processor rolls them into the row this grid shows |
| Upstream | [Stock Adjustment](/applets/inventory-workflow/stock-adjustment-applet/), [Stock Transfer](/applets/inventory-workflow/stock-transfer-applet/), [Stock Take](/applets/inventory-workflow/stock-take-applet/) | The correction path: count, compare with this grid, adjust |
| Upstream | [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) / [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) | Item code, EAN (scan code), item type and sub-item type used as columns and filters; grouped items are excluded from the query |
| Upstream | [Organisation](/applets/master-data/organisation-applet/) | Companies and locations — the grid's Company column and Location pivot, and the targets on the read permission |
| Upstream | [Non Stock and Trade In](/applets/inventory-workflow/non-stock-and-trade-in-applet/) | Trade-in stock (`bl_fi_nsti_stock_hdr`) is unioned into the same query and appears as rows of its own |
| Sibling | [Stock Availability](/applets/inventory-workflow/stock-availability-applet/) | Same query, but shows balance plus open sales / purchase order quantities |
| Sibling | [Stock Report](/applets/inventory-workflow/stock-report-applet/) | Historical (nightly snapshot) and by-date balances; this applet shows only "now" |
| Downstream | None | The applet writes nothing |

Modules: Inventory, Purchasing, POS and Manufacturing all list it as the "what do we have" screen.

## Screens and menus

The applet has a single menu item, **Stock Balance**, which opens the listing. **Settings** shows only the shared server-side permission screens (Permission Wizard, Permission Set, User Permission, Role Permission), Team access and the developer tools (Release Notes, Audit Trail); there is no Field Settings, Default Selection or Feature Visibility entry because the applet declares no settings pages (`settingItems = []`). **Personalization** has only the Sidebar page.

{{< figure src="/images/stock-balance-applet/sb-setting.png" alt="Stock Balance applet Settings page showing only server-side permission screens and team access" caption="Settings: server-side permissions, team access and developer tools — no applet-level field settings exist." >}}

### Stock Balance Listing

An ag-grid enterprise grid that opens in **Pivot Mode** with **Item Code** as the row group, **Location** as the pivot column and **Bal** (sum) as the value, so the default view is one row per item with one balance column per location and a total footer. EAN Code is visible; Company, MA Price and Last Purchase Company are hidden until you tick them in the Columns tool panel. The status bar shows total / filtered row count, selected rows and the aggregation of a selected range. Grouping, pivoting, range selection and charts are the grid's own features; export (CSV / Excel) is on the right-click context menu.

{{< figure src="/images/stock-balance-applet/sb-column.png" alt="Columns tool panel with Pivot Mode on and Item Code, Location and Bal ticked" caption="Columns tool panel: Pivot Mode is on by default; tick Company, MA Price or Last Purchase Company to reveal them." >}}

Switching Pivot Mode off gives a flat list of item x location rows (Item Code, EAN Code, Location, Bal), which is the easier view for filtering and export. Charts (Pivot Chart, Chart Range) are only offered while Pivot Mode is on.

### Advanced Search

The search panel above the grid offers Companies, Location, Item Code, Item Type, Sub Item Type and a **Balance Greater Than 0** checkbox; the plain search box is a keyword search. Which of these actually reach the server is listed under [Fields](#fields) — the Companies selector is emitted by the shared search component but ignored by this applet.

{{< figure src="/images/stock-balance-applet/sb-search.png" alt="Advanced search panel with Companies, Location, Item Code, Item Type, Sub Item Type and Balance Greater Than 0" caption="Advanced Search panel." >}}

### Screens that exist in code but cannot be reached

The page service also registers a **Stock Balance View** (tabs *Main*, *Bin*, *Scrap Bins*) and a **Batch No History** page. No row click or button on the listing navigates to them, the Bin and Scrap Bins grids bind to an empty array, and Batch No History queries the item master rather than any history table. Earlier versions of this page and its infographics described bin / scrap-bin drill-downs and movement history; those do not exist in the current build (commit `429dba9`).

## Configuration

### Before you can use it

| Prerequisite | Where | Why |
|---|---|---|
| Companies and locations | [Organisation](/applets/master-data/organisation-applet/) | Rows are keyed by company and location; the read permission is targeted at them |
| Inventory items with a type and sub-type | [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) | Item Type / Sub Item Type filters match `bl_fi_mst_item_hdr.txn_type` / `sub_item_type`; `GROUPED_ITEM` never appears |
| At least one finalised stock-moving document, or a Stock Adjustment for opening stock | [Related Applets - Stock Balance](/applets/inventory-workflow/related-applets-stock-balance/) | The grid has no import or opening-balance entry of its own |
| Read permission on stock availability with location / company targets | Settings > Permission Wizard (this applet) | The listing calls the stock-availability endpoint, which requires `API_TNT_DM_ERP_INV_STOCK_AVAILABILITY_READ` (or `_ADMIN` / `_OWNER`) and filters the requested locations and companies against the permission's targets |

### Applet settings

No exposed control found (routes and settings components checked at commit `429dba9`). `menu-items.ts` declares `settingItems = []` and `personalizationItems = []`; the settings container renders only the shared permission, webhook and feature-visibility routes, none of which read or write an applet setting. The interface `AppletSettings` in `models/applet-settings.model.ts` declares the usual document-applet keys (`DEFAULT_BRANCH`, `DEFAULT_LOCATION`, `HIDE_*`, `ENABLE_CUSTOM_STATUS_*` and so on) but nothing renders, persists or reads them — it is copied scaffolding, so none of those keys are documented here.

**Keys read at runtime without a control.** `CustomTooltip` (`components/utilities/custom-tooltip.component.ts`) reads `HIDE_LISTING_AVG_COST`, `HIDE_LISTING_LAST_PURCHASE_COST`, `HIDE_LISTING_FIFO_COST` and `HIDE_LISTING_LIFO_COST` from the session's master settings and pairs each with a `SHOW_LISTING_*` client-side permission. The component is declared in the module but no column definition uses it as a `tooltipComponent`, so the keys have no effect in the current build even if they were written to the applet's settings row.

### Document behaviour settings

Not a document applet — there is no status flow, posting, printable or approval toggle.

### Settings in other applets that control this applet

| Setting | Where it is set | Effect here |
|---|---|---|
| Item `txn_type` and `sub_item_type` | [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) | Filter membership; `GROUPED_ITEM` is excluded by the query (`StockAvailabilityUow` L237–L249) |
| Location status | [Organisation](/applets/master-data/organisation-applet/) > Location | Not consulted — the query joins `bl_inv_mst_location` without a status filter (L232), so a deactivated location with a non-zero balance still shows a column |
| Min / max levels | [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) > Location tab | Not shown here; they are read by the min/max e-mail job and Stock Availability, not by this grid |

Nothing in the endpoint reads an applet setting, a company setting or the knock-off configuration.

### Feature visibility / permissions

**Server-side (what actually gates the grid).** `POST core2/tnt/dm/erp/inv/stock-availability` (`StockAvailabilityController` L79–L118) requires `API_TNT_DM_ERP_INV_STOCK_AVAILABILITY_READ`, `_ADMIN` or `_OWNER` (`TntErpPermissions` L5925–L5927). `READ` carries company / location targets: the controller intersects the requested `location_guids` and `company_guids` with the assignee's materialised targets (`StockAvailabilityService.targetPermissionProcessing` L451–L465) and returns *not authorised* when nothing survives (L93–L94). The location drop-down the applet loads on open (`POST .../drop-down/location`) is unpermissioned — its permission check is commented out in `DropDownController` L153–L156 — so an empty search asks for every location and the backend trims the list.

**Client-side.** The code checks `SHOW_LISTING_AVG_COST`, `SHOW_LISTING_LAST_PURCHASE_COST`, `SHOW_LISTING_FIFO_COST` and `SHOW_LISTING_LIFO_COST` (in the unused tooltip, see above). None of them is seeded: `bl_applet_client_side_perm_dfn` has no rows for `erp_stock_balance_applet`, so the Client Side Permission screen has nothing to assign. Cost columns (MA Price, Last Purchase Company) are therefore visible to anyone who can open the grid — hide them per role with server-side permissions on the underlying data only, or by not granting the read permission.

## Fields

The applet has no create / edit form. The two things a user fills in are the search panel and the grid's column choices.

### Advanced Search

| Field | Sent to the server as | Matching | Notes |
|---|---|---|---|
| Search box (keyword) | `keyword` | Each space-separated word must match (`ILIKE '%word%'`) one of item code, name, description, scan code, alternate item codes 1–2, remarks, additional remarks 1–4 (`StockAvailabilityUow.generateWhereClauseByItemCode`) | Runs together with every location the drop-down returned |
| Companies | — | Ignored | The shared search emits `companyGuids`, but `onSearch` never reads it (`stockBalSearchDto.company_guids` is commented out) |
| Location | `location_guids` | Exact, multi-select | Empty = every location the drop-down returned (then trimmed by permission targets) |
| Item Code | `keyword` | Same fuzzy match as the search box | Not an exact-code filter; `SM-` returns every code containing `SM-` |
| Item Type | `item_type` | Exact, one value | `BASIC_ITEM`, `GROUPED_ITEM`, `BUNDLE`, `COUPON`, `SERVICE`, `WARRANTY`, `BATCH_EXPIRY`, `DOC_HEADER_ADJUSTMENT` (`stock-bal-constants.ts`); only `BASIC_ITEM` and `BATCH_EXPIRY` normally have balance rows |
| Sub Item Type | `sub_item_types` | Exact, one value | `BASIC_QTY`, `BATCH_NUMBER`, `SERIAL_NUMBER`, `BIN_NUMBER` |
| Balance Greater Than 0 | `location_qty_ledger_greater_than = 0` | `qty_ledger > 0` on the location balance row | Unticked = zero and negative balances included |

### Listing columns

| Column | Source (`StockAvailabilityOutputDto`) | Backend column | Default |
|---|---|---|---|
| Item Code | `item_code` | `bl_inv_mst_item_hdr.code` | Row group, hidden as a column |
| EAN Code | `scan_code` | `bl_fi_mst_item_hdr.scan_code` | Visible |
| Company | `comp_code` | `bl_fi_mst_comp.code` | Hidden |
| Location | `location_code` | `bl_inv_mst_location.code` | Pivot column |
| Bal | `qty_balance` | `bl_inv_current_location_stock_balance.qty_ledger` (NSTI rows: `bl_fi_nsti_stock_hdr.qty_base` summed) | Value, `sum` |
| MA Price | `ma_cost` | `bl_inv_current_location_stock_balance.cost_ma_price` (NSTI rows: average `purchase_price_incl_tax`) | Hidden |
| Last Purchase Company | `company_last_purchase_cost` | `bl_inv_current_company_stock_balance.cost_last_purchase_company` | Hidden |

The response also carries `qty_reserved`, `qty_adjustment` (open-document quantity), `qty_available`, `company_qty_balance`, `fifo_cost`, `lifo_cost`, `item_name`, `uom`, `type` and `sub_type`; the listing defines no columns for them, so they are not reachable through the Columns panel.

## Lifecycle and effects

**Reads only.** The applet's single request is `POST core2/tnt/dm/erp/inv/stock-availability` with the search DTO (`api-service.ts` L13–L30; `stock-balance.effects.ts` L27–L89). It never calls the `current-location-stock-balances` endpoints, never writes `bl_inv_*`, and creates no journal, queue row or ledger line.

**What the query returns** (`StockAvailabilityUow.generateSql` L180–L327):

- `bl_inv_current_location_stock_balance` (status not DELETED) joined to company, location, the inventory item and the financial item (grouped items excluded), **full-outer-joined** to `bl_fi_generic_doc_line_open_queue` on item and store. A row therefore exists for every item x location that has a balance row *or* an open sales / purchase order line, which is why an item with no stock can appear with a blank Bal.
- Because the applet sends no `stock_server_doc_type_signum_dto_list`, the backend uses its default pairs SO→SI (−1) and GRN→PI (+1) (`StockAvailabilityService.getCorrectServerDocTypeSignumDto` L30–L44) for the open-queue side. The applet computes but does not display the resulting `qty_available`.
- `UNION` with trade-in stock from `bl_fi_nsti_stock_hdr` (items of type `NSTI`), whose average purchase price incl. tax is returned in the MA Price slot and whose company balance is always 0.
- The applet then merges rows that share item, location and company (`removeDuplicate`, listing L275–L303) and drops rows whose `location_guid` is null.

**Balance definition.** `qty_ledger` is the chain tip of the signed stock ledger `bl_inv_txn_line`, maintained by `InventoryTxnLineToCurrentStockBalanceProcessor` after each FINAL and re-projected after a VOID or backdated line. Which document types carry a non-zero quantity signum, how VOID negates lines, and the refresh / snapshot jobs are documented once on [Related Applets - Stock Balance](/applets/inventory-workflow/related-applets-stock-balance/) and are not repeated here.

**No posting proof block applies** — there is no server document type, signum, journal or stock processor for this applet.

## Related applets

- [Related Applets - Stock Balance](/applets/inventory-workflow/related-applets-stock-balance/) — the hub: which documents move the number in this grid, how a FINAL reaches it, and the background jobs.
- [Stock Availability](/applets/inventory-workflow/stock-availability-applet/) — the same endpoint with the open-order side displayed; use it for "can I promise this".
- [Stock Report](/applets/inventory-workflow/stock-report-applet/) — Historical Stock Balance (nightly snapshot) and by-date reports when you need "as at".
- [Stock Take](/applets/inventory-workflow/stock-take-applet/) and [Stock Adjustment](/applets/inventory-workflow/stock-adjustment-applet/) — count against this grid, then correct through an adjustment.
- [Stock Transfer](/applets/inventory-workflow/stock-transfer-applet/) — moves a balance between the location columns shown here.
- [Stock Reservation](/applets/inventory-workflow/stock-reservation-applet/) — writes `qty_reserved`, which the endpoint returns but this grid does not show.
- [Non Stock and Trade In](/applets/inventory-workflow/non-stock-and-trade-in-applet/) — the source of the trade-in rows unioned into the grid.
- [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/), [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) — item code, EAN, type and sub-type.
- [Organisation](/applets/master-data/organisation-applet/) — companies and locations; permission targets.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| Grid stays empty or the request returns *not authorised* as soon as the applet opens | The empty search asks for every location; the backend intersects that list with the assignee's location / company targets on `API_TNT_DM_ERP_INV_STOCK_AVAILABILITY_READ` and rejects when nothing survives (`StockAvailabilityController` L89–L94) | In Settings > Permission Wizard grant the read permission with the locations (or companies) the user may see, or `_ADMIN` / `_OWNER` |
| An item appears with a blank or 0 balance although nothing was ever received | The full outer join adds rows for items with open sales / purchase order lines at that store (`StockAvailabilityUow` L244–L256) | Expected; tick **Balance Greater Than 0** to hide them |
| A deactivated location still shows a balance column | The query has no location-status filter; stock left in the location when it was deactivated is still on its balance row (pattern in gh:bigledger/blg-int-general-task#9080) | Transfer or adjust the stock out, then the column disappears once every balance is 0 and you filter on > 0 |
| Balance differs from Stock Availability for the same item and location | Stock Availability displays balance ± open order quantities; this grid displays `qty_ledger` only | Compare the *Balance* column in Stock Availability, not *Available* |
| Balance differs from Stock Report's Historical Stock Balance | That report is the nightly HBAL snapshot; this grid is the live chain tip, so a backdated document, a VOID or a refresh run after the snapshot moves one but not the other (gh:bigledger/blg-int-general-task#4807) | Use Stock Summary by Location for a ledger-summed figure as at a date |
| Companies filter changes nothing | The applet never reads the emitted `companyGuids` (listing `onSearch` L219–L252) | Reveal the Company column and use the column filter instead |
| Item Code filter returns many codes | Item Code is sent as the fuzzy `keyword`, split on spaces and matched across code, name, description, EAN, alternate codes and remarks | Group by Item Code (default) and use the row-group filter for an exact code |
| MA Price is 0 for a trade-in row, or shows a value that is not a moving average | NSTI rows come from `bl_fi_nsti_stock_hdr` and return the average purchase price incl. tax in that slot; their last purchase cost is always 0 | Expected; trade-in stock is not costed by the inventory ledger — see [Non Stock and Trade In](/applets/inventory-workflow/non-stock-and-trade-in-applet/) |
| A document is FINAL but the balance did not move | Either the document type has a zero quantity signum (credit / debit notes, plain GRN / GIN, invoice *No Stock In / Out*), or the ledger / balance processors did not run for it | Check the signum list on the hub page; for a genuine miss, the refresh endpoint and queue processors on the hub page rebuild the row |
| Negative balance | The ledger allows negative quantities; nothing in this applet or its endpoint blocks them | Find the outbound document that overshot (Stock Report > Stock Movement) and correct by document |
| Nothing happens when you click a row; no bin, scrap-bin or history view | Those pages are unreachable scaffolding in the current build | Use Stock Report (batch / serial reports) for sub-balances |

## Related documentation

- [Related Applets - Stock Balance](/applets/inventory-workflow/related-applets-stock-balance/) — the index of everything that writes to and reads from the balance
- [Inventory module](/modules-v2/inventory/) — where the applet sits among the inventory applets
- [Stock Availability](/applets/inventory-workflow/stock-availability-applet/) and [Stock Report](/applets/inventory-workflow/stock-report-applet/) — the two sibling enquiry screens
