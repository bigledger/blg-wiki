---
title: "Related Applets - Stock Balance"
description: "Index of the applets that write to and read from BigLedger's stock balance: which documents actually move stock (and which only look as if they do), how a finalised document reaches the balance, which applets read it, and the background jobs behind it."
weight: 140
modules: [inventory, purchasing, pos, manufacturing, ecommerce]
related_applets: [stock-balance-applet, stock-availability-applet, stock-report-applet, stock-take-applet, stock-adjustment-applet, stock-transfer-applet, stock-conversion-applet, stock-reservation-applet, stock-replenishment-applet, internal-stock-requisition-applet, consignee-stock-transfer-applet, internal-consignment-grn-applet, internal-consignment-gin-applet, non-stock-and-trade-in-applet, warehouse-management-applet, inv-item-maintenance-applet, doc-item-maintenance-applet, organisation-applet, internal-sales-invoice-applet, pos-general-applet, internal-sales-return-applet, internal-sales-refund-note-applet, internal-sales-gin-stock-out-applet, internal-sales-order-applet, internal-outbound-delivery-order-applet, customer-consignment-applet, internal-purchase-invoice-applet, internal-purchase-grn-stock-in-applet, internal-purchase-return-applet, internal-purchase-refund-note-applet, internal-purchase-order-applet, internal-purchase-grn-applet, internal-purchase-requisition-applet, 90-ecomsync-related-applets]
guides: []
sources:
  where-it-fits:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/inventory/InventoryTransactionLineProcessorService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/factory/InventoryTransactionLineFactory.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/InventoryStockReservationService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/stock/CurrentLocationStockBalanceService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/stock/StockBalanceHelper.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/NonStockTradeInApplet/NonStockTradeInTxnLineService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/ecomsync/EcomSyncMainStockCalculationService.java
    - blg-applet-wavelet-stock-balance-applet/micro-fe/projects/wavelet-erp/applets/stock-balance-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-stock-balance-applet/micro-fe/projects/wavelet-erp/applets/stock-balance-applet/src/app/app.routing.ts
    - blg-applet-wavelet-stock-balance-applet/micro-fe/projects/wavelet-erp/applets/stock-balance-applet/src/app/components/stock-balance-container/stock-balance-listing/stock-balance-listing.component.ts
    - blg-applet-wavelet-inv-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/inv-item-maintenance-applet/src/app/components/basic-item-container/basic-item-edit/basic-item-location/item-location.component.ts
  data-model:
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/ServerDocTypes.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalSalesInvoiceDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalPurchaseGrnStockInDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalStockAdjustmentDco.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalOutboundStockTransferDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalSalesCreditNoteDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalPurchaseGoodReceivedNoteDataConsistencyObject.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_inv_current_location_stock_balance.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_inv_current_company_stock_balance.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_inv_stock_balance_applied_txn.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/common/api/constants/StockBalanceConstants.java
  background-jobs:
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/inventory/InventoryTransactionLineProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/inventory/InventoryTxnLineToCurrentStockBalanceProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/inventory/InventoryCurrentStockBalanceQueueProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/inventory/RefreshInventoryCurrentStockBalanceProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/inventory/BackdatedInvTxnLineRecalculationProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/inventory/VoidInventoryTransactionLineProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/inventory/InventoryStockConversionToInvTxnLineProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/inventory/InventoryHistoricalStockBalanceProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/inventory/MinMaxQtyStockBalanceCronNotificationProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/inventory/InventoryStockReservationProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/NonStockTradeInTxnLineToCurrentStockBalanceProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/mrp/MrpProcessFinalizationProcessor.java
  troubleshooting:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/factory/InventoryTransactionLineFactory.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/stock/RefreshStockBalanceController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/inventory/InventoryTransactionLineDataFixController.java
    - gh:bigledger/blg-int-general-task#9080
    - gh:bigledger/blg-int-general-task#9555
    - gh:bigledger/blg-int-general-task#4807
    - gh:bigledger/blg-int-general-task#1422
    - gh:bigledger/blg-int-general-task#6259
tags:
- applets
- stock-balance
- integration
- related-applets
---

## Overview

**Stock balance** is the quantity BigLedger believes is on hand for one inventory item at one location (and, summed, for one company). It is not typed in anywhere; it is the running total of a signed **stock ledger** (`bl_inv_txn_line`) that the server appends to whenever a stock-moving document is finalised. The [Stock Balance](/applets/inventory-workflow/stock-balance-applet/) applet is only the enquiry screen over that total.

This page is the index for everything around that number. It lists which documents actually move the balance (fewer than the old version of this page claimed), how a *FINAL* reaches the balance, which applets read it when you add a line or run a report, and the background jobs that keep it right. The field-level detail for each screen lives on the applet pages linked below.

{{< callout type="info" >}}
There is no "import lines" feature in the Stock Balance applet. Its single menu item is the listing; balances arrive only through the finalised documents and processors described here.
{{< /callout >}}

## Where it fits

| Applet | Role for the stock balance | Reference page |
|---|---|---|
| **Stock Balance** | The enquiry: item x company x location grid with ledger quantity, moving-average cost and last purchase cost; batch, scrap and transaction-history views. Reads only. | [Stock Balance](/applets/inventory-workflow/stock-balance-applet/) |
| **Stock Availability** | The same balance plus the open sales orders, purchase orders and GRNs that will change it: *Available = balance + sum(open quantity x signum)*. Reads only. | [Stock Availability](/applets/inventory-workflow/stock-availability-applet/) |
| **Stock Report** | Thirteen reports over the ledger and the balance tables, including *Historical Stock Balance* (the daily snapshot) and the *Stock Balance* report family. Reads only. | [Stock Report](/applets/inventory-workflow/stock-report-applet/) |
| **Stock Take** | Counts against the ledger's opening balance and movements for a location; measures the gap but writes nothing to the balance. | [Stock Take](/applets/inventory-workflow/stock-take-applet/) |
| **Stock Adjustment (Internal)** | The document that corrects a balance up or down (and the only path from a stock-take variance to the ledger). Writes. | [Stock Adjustment](/applets/inventory-workflow/stock-adjustment-applet/) |
| **Stock Transfer** | Transfer Out and Transfer In between locations, through a per-company *stock in transit* location. Writes. | [Stock Transfer](/applets/inventory-workflow/stock-transfer-applet/) |
| **Stock Conversion** | Converts one item into another at a location; its lines are posted to the same ledger by their own processor. Writes. | [Stock Conversion](/applets/inventory-workflow/stock-conversion-applet/) |
| **Stock Reservation** | The only writer of the *reserved* quantity column on the balance row. | [Stock Reservation](/applets/inventory-workflow/stock-reservation-applet/) |
| **Stock Replenishment** | Seeds balance rows with *min* / *max* levels for the items and locations in a run; those levels drive the min/max e-mail job. | [Stock Replenishment](/applets/inventory-workflow/stock-replenishment-applet/) |
| **Inventory Item Maintenance** | The item master (the balance is keyed by inventory item); its *Location* tab edits the per-location min / max levels on the balance row (`update-min-max-qty`), and its *Stock Min Max Import* screen loads them in bulk. | [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) |
| **Doc Item Maintenance** | Links the sales/purchase item to the inventory item; only lines whose item is a basic or alias inventory item (or a serialised coupon) reach the ledger. | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) |
| **Organization** | Companies and locations; the branch's default location is the last fallback when a line has no location. | [Organization](/applets/master-data/organisation-applet/) |
| **Sales and purchase document applets** | The writers (invoice, cash bill, return, GRN Stock In, GIN Stock Out, refund notes, consignment) and the readers (orders, quotations, requisitions, delivery orders). See the two tables below. | linked per document below |
| **Non Stock and Trade In** | Trade-in units have their **own** ledger and balance tables (`bl_fi_nsti_stock_*`); they never appear in the inventory balance. | [Non Stock and Trade In](/applets/inventory-workflow/non-stock-and-trade-in-applet/) |
| **EcomSync** | The marketplace quantity is derived from the balance minus open marketplace orders and written to a separate marketplace table. | [EcomSync Related Applets](/applets/integrations/90-ecomsync-related-applets/) |

## What a stock balance is

Two tables hold the current figure, one row per item x location and one per item x company:

| Table | Key | Live columns (written by the processors) | Columns present but never written |
|---|---|---|---|
| `bl_inv_current_location_stock_balance` | company, location, inventory item | `qty_ledger`, `qty_reserved`, `qty_min_level`, `qty_max_level`, moving-average / weighted-average / FIFO / LIFO cost amounts and prices, last purchase cost, landed cost, serial / batch / bin JSON | `qty_physical`, `qty_available`, `qty_damaged`, `qty_rma`, `qty_ecom_buffer`, `qty_sales_order_open`, `qty_purchase_order_open`, `qty_work_order_open`, `qty_jobsheet_open`, `qty_reorder_level` (initialised to 0 only) |
| `bl_inv_current_company_stock_balance` | company, inventory item | `qty_ledger`, `qty_reserved`, moving-average cost | the same set |

Every ledger line applied to the balance is recorded once in `bl_inv_stock_balance_applied_txn`, so a re-run of the processor skips the line instead of counting it twice. Each ledger line also links to the next line for the same item at the same location and company (`next_location_txn_guid`, `next_company_txn_guid`): the balance is always the *tip* of that chain, which is what lets a backdated document be inserted mid-chain and the tip recomputed. Balance rows are tagged `CBAL` (current) and the daily snapshots `HBAL` (historical); ledger lines that open a month are `BF` / `CF` / `OPENING`.

The *available* quantity you see in Stock Availability is **not** stored: it is computed at query time from `qty_ledger` and the open documents. The same is true of the marketplace quantity (EcomSync writes `qty_available` on its own `bl_mkp_entity_branch_stock_balance` row, not here).

## Which documents move the balance

A document moves stock only if its server document type carries a non-zero **quantity signum**. The signum is fixed in the backend's data-consistency object for the type; it is not an applet setting, and the applet's own constant is overwritten by the server on every save. Twenty-five types have a non-zero quantity signum; the ones with a wiki page are:

| Direction | Document (server type) | Quantity signum | Amount signum | Reference page |
|---|---|---|---|---|
| Stock **out** | Sales Invoice (`INTERNAL_SALES_INVOICE`) | -1 | +1 | [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/) |
| Stock out | Cash Bill (`INTERNAL_SALES_CASHBILL`) | -1 | +1 | [POS General](/applets/sales-workflow/pos-general-applet/) |
| Stock out | Sales GIN Stock Out (`INTERNAL_SALES_GIN_STOCK_OUT`) | -1 | +1 | [Sales GIN Stock Out](/applets/sales-workflow/internal-sales-gin-stock-out-applet/) |
| Stock out | Purchase Return (`INTERNAL_PURCHASE_RETURN`) | -1 | +1 | [Purchase Return (Internal)](/applets/purchase-workflow/internal-purchase-return-applet/) |
| Stock out | Purchase Refund Note (`INTERNAL_PURCHASE_REFUND_NOTE`) | -1 | +1 | [Purchase Refund Note](/applets/purchase-workflow/internal-purchase-refund-note-applet/) |
| Stock out | Transfer Out (`INTERNAL_OUTBOUND_STOCK_TRANSFER`) | -1 | 0 | [Stock Transfer](/applets/inventory-workflow/stock-transfer-applet/) |
| Stock out | Customer Consignment Out (`INTERNAL_CUSTOMER_CONSIGNMENT_OUT`) | -1 | 0 | [Customer Consignment](/applets/sales-workflow/customer-consignment-applet/), [Consignee Stock Transfer](/applets/inventory-workflow/consignee-stock-transfer-applet/) |
| Stock out | Purchase Consignment GIN (`INTERNAL_PURCHASE_CONSIGNMENT_GIN`) | -1 | +1 | [Consignment GIN (Internal)](/applets/inventory-workflow/internal-consignment-gin-applet/) |
| Stock **in** | Purchase Invoice (`INTERNAL_PURCHASE_INVOICE`) | +1 | -1 | [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/) |
| Stock in | Purchase GRN Stock In (`INTERNAL_PURCHASE_GRN_STOCK_IN`) | +1 | -1 | [Purchase GRN Stock In](/applets/purchase-workflow/internal-purchase-grn-stock-in-applet/) |
| Stock in | Sales Return (`INTERNAL_SALES_RETURN`) | +1 | -1 | [Sales Return (Internal)](/applets/sales-workflow/internal-sales-return-applet/) |
| Stock in | Sales Refund Note (`INTERNAL_SALES_REFUND_NOTE`) | +1 | -1 | [Sales Refund Note](/applets/sales-workflow/internal-sales-refund-note-applet/) |
| Stock in | Transfer In (`INTERNAL_INBOUND_STOCK_TRANSFER`) | +1 | 0 | [Stock Transfer](/applets/inventory-workflow/stock-transfer-applet/) |
| Stock in | Customer Consignment In (`INTERNAL_CUSTOMER_CONSIGNMENT_IN`) | +1 | 0 | [Customer Consignment](/applets/sales-workflow/customer-consignment-applet/) |
| Stock in | Purchase Consignment GRN (`INTERNAL_PURCHASE_CONSIGNMENT_GRN`) | +1 | -1 | [Consignment GRN (Internal)](/applets/inventory-workflow/internal-consignment-grn-applet/) |
| Either | Stock Adjustment (`INTERNAL_STOCK_ADJUSTMENT`) | +1 (the line's Adjust-In / Adjust-Out sign decides the direction) | 0 | [Stock Adjustment](/applets/inventory-workflow/stock-adjustment-applet/) |
| Either | Stock Conversion (own table, not a generic document) | per line | - | [Stock Conversion](/applets/inventory-workflow/stock-conversion-applet/) |

Without a page yet: Sales GRN Stock In (+1), Purchase GIN Stock Out (-1), Purchase Self-Billed Invoice (+1), Supplier Consignment In / Out (+1 / -1), Supplier RTV (+1), Consignment Stock Adjustment (+1), Production Order (+1, posted by the manufacturing finalisation job), and the two trade-in types (Purchase Trade-In +1, Sales Trade-In -1 -- posted to the trade-in tables, see above).

{{< callout type="warning" >}}
**These do not move stock, whatever their name suggests.** Sales / Purchase **Credit Note** and **Debit Note**, the plain Sales / Purchase **GRN** and **GIN** (as opposed to *GRN Stock In* / *GIN Stock Out*), Sales / Purchase Invoice **No Stock Out / No Stock In**, Sales Order, Purchase Order, Purchase Requisition, Stock Requisition, Quotation, Packing Order, Delivery Order, Goods Delivery Note, Jobsheet and Job Order all carry quantity signum 0. Finalising them changes nothing on the balance; they knock off, reserve, or bill. The earlier version of this page listed the notes and the plain GRN / GIN as feeding the balance -- that was wrong.
{{< /callout >}}

## How a FINAL reaches the balance

1. You set the document to **FINAL**. The generic-document primary processor fans out to its subscribed jobs; the stock one is `INVENTORY_TRANSACTION_LINE_PROCESSOR`.
2. That job takes every *PNS* line with a non-zero quantity signum whose item resolves to an inventory item, and writes one signed ledger line (`bl_inv_txn_line`) per inventory item. The line's location is the first of: line delivery location, line store, header store, the branch's default location. Transfers additionally write the mirror line on the company's *stock in transit* location; customer-consignment documents write a negated mirror line on the document's second store (`guid_store_2`).
3. Each ledger line is queued to `INVENTORY_TXN_LINE_TO_CURRENT_STOCK_BALANCE_PROCESSOR`, which inserts the applied-marker, upserts the location row and the company row (quantity, moving-average and weighted-average cost), updates last-purchase cost, then handles the serial / batch / bin sub-balances according to the item's sub-type.
4. If the document is **backdated** (the new line is not the chain tip), `BACKDATED_INV_TXN_LINE_RECALCULATION_PROCESSOR` re-projects the balance from the true tip and the FIFO chain is marked dirty for rebuild.
5. **VOID** does not delete anything: `VOID_INVENTORY_TRANSACTION_LINE_PROCESSOR` writes a negated copy of every ledger line with transaction code `VOID`, marks the document's inventory posting status VOID, and queues a refresh of the affected item / location / company rows.

Stock Conversion follows the same path from its own processor (`INVENTORY_STOCK_CONVERSION_TO_INV_TXN_LINE_PROCESSOR`, with a VOID twin); production orders are posted by `MRP_PROCESS_FINALIZATION_PROCESSOR`; trade-in units go through `NSTI_TXN_LINE_TO_CURRENT_STOCK_BALANCE_PROCESSOR` into the trade-in tables.

Whether a given job is subscribed for your tenant is job-template configuration on the server, not an applet setting. If a FINAL document never shows in the balance, that subscription and the job queue are the first things support checks.

## Which applets read the balance

The balance is read through the `current-location-stock-balances` / `current-company-stock-balances` and item `stock-balance` endpoints. Applets in the current source that read it:

| Applet | Where you see it |
|---|---|
| [Stock Balance](/applets/inventory-workflow/stock-balance-applet/), [Stock Availability](/applets/inventory-workflow/stock-availability-applet/), [Stock Report](/applets/inventory-workflow/stock-report-applet/) | The enquiry and report screens |
| [Stock Take](/applets/inventory-workflow/stock-take-applet/) | Opening balance, movements and closing balance on the count report (from the ledger lines) |
| [POS General](/applets/sales-workflow/pos-general-applet/), [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [Sales Order (Internal)](/applets/sales-workflow/internal-sales-order-applet/), [Sales Quotation (Internal)](/applets/sales-workflow/internal-sales-quotation-applet/), [Outbound Delivery Order](/applets/sales-workflow/internal-outbound-delivery-order-applet/), [Sales Invoice No Stock Out](/applets/sales-workflow/internal-sales-invoice-no-stock-out-applet/) | The *Stock Balance* column on the line-item picker and line details |
| [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/), [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/), [Purchase Return (Internal)](/applets/purchase-workflow/internal-purchase-return-applet/), [Purchase Requisition (Internal)](/applets/purchase-workflow/internal-purchase-requisition-applet/) | Line-item balance and reorder checks |
| [Stock Transfer](/applets/inventory-workflow/stock-transfer-applet/), [Stock Adjustment](/applets/inventory-workflow/stock-adjustment-applet/), [Stock Requisition (Internal)](/applets/inventory-workflow/internal-stock-requisition-applet/), [Consignee Stock Transfer](/applets/inventory-workflow/consignee-stock-transfer-applet/), [Customer Consignment](/applets/sales-workflow/customer-consignment-applet/) | Current company / location balance beside the quantity you enter |
| [Stock Reservation](/applets/inventory-workflow/stock-reservation-applet/), [Stock Replenishment](/applets/inventory-workflow/stock-replenishment-applet/), [Warehouse Management](/applets/inventory-workflow/warehouse-management-applet/) | Reserve, replenish and pick against the balance |
| [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/), [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) | The item's *Location* / *Stock Availability* tabs |
| [Delivery Installation](/applets/delivery-installation/delivery-installation-applet/), [Car Workshop](/applets/sales-workflow/car-workshop-applet/), [Deposit](/applets/finance/deposit-applet/) | Read the item balance on their line screens |

## Background jobs

| Queue code | Type | What it does |
|---|---|---|
| `INVENTORY_TRANSACTION_LINE_PROCESSOR` | subscribed to the generic-document primary processor | Finalised document to ledger lines |
| `INVENTORY_TXN_LINE_TO_CURRENT_STOCK_BALANCE_PROCESSOR` | secondary | Ledger line to location and company balance, MA / WA cost, last purchase cost, serial / batch / bin sub-balances |
| `BACKDATED_INV_TXN_LINE_RECALCULATION_PROCESSOR` | secondary | Re-projects the balance after a backdated line |
| `VOID_INVENTORY_TRANSACTION_LINE_PROCESSOR` | subscribed | Writes negated `VOID` lines and refreshes the rows |
| `INVENTORY_CURRENT_STOCK_BALANCE_QUEUE_PROCESSOR` | system | Drains `bl_inv_current_stock_balance_queue` (refresh requests) by priority |
| `REFRESH_INVENTORY_CURRENT_STOCK_BALANCE_PROCESSOR` | secondary | Rebuilds one item x location (and company) row from the chain tip; also reachable as `PUT .../refresh-stock-balances/current-stock-balance/backoffice-ep` |
| `INVENTORY_STOCK_CONVERSION_TO_INV_TXN_LINE_PROCESSOR` / `VOID_...` | subscribed | Stock conversion lines in and out |
| `INVENTORY_STOCK_RESERVATION_PROCESSOR` | subscribed | Reserved / released quantities on the balance rows |
| `INVENTORY_HISTORICAL_STOCK_BALANCE_PROCESSOR` | system (scheduled) | Copies both current tables into `bl_inv_historical_*_stock_balance` (`HBAL`) -- the source of the *Historical Stock Balance* report |
| `MIN_MAX_QTY_STOCK_BALANCE_CRON_NOTIFICATION_PROCESSOR` | system (scheduled) | E-mails a summary plus CSV of rows where `qty_ledger` is below a non-zero min level or above a non-zero max level, for the configured locations and recipients |
| `NSTI_TXN_LINE_TO_CURRENT_STOCK_BALANCE_PROCESSOR` | secondary | Trade-in ledger lines to the trade-in unit tables |
| `MRP_PROCESS_FINALIZATION_PROCESSOR` | manufacturing | Production-order stock in / out |

## Troubleshooting

| Symptom | Likely cause | What to do |
|---|---|---|
| A finalised invoice, GRN Stock In or return never appears in the balance | The item on the line is not linked to an inventory item, or is not a basic / alias item; or the stock job is not subscribed for the tenant; or the job failed and is waiting in the queue | Check the item link in Doc Item Maintenance; ask support to check the job queue and the tenant's job-template subscriptions |
| Stock lands in a location nobody uses (often a deactivated one) | Location precedence: line delivery location, line store, header store, then the branch default. A stale default or a line that kept an old location puts the quantity there | Correct the branch default in Organization; fix the lines and re-post, or move the quantity with a Stock Transfer or Stock Adjustment |
| Intercompany returns book the quantity at the wrong location | The return copied the counterpart document's store / delivery location instead of the receiving location | Compare `guid_store` and `delivery_location_guid` on the header and lines with the intended location; adjust and repost |
| Historical Stock Balance and Stock Summary by Location disagree on a closing figure | The historical table is a nightly snapshot of the current rows; the summary report sums ledger lines by date. A backdated or voided document between snapshot and report, or a row refreshed after the snapshot, makes them differ | Run the refresh for the item / location, then compare again from the next snapshot |
| Trade-in units are missing from the balance and the historical report | Trade-in stock is kept in its own tables; the inventory reports do not include it (an enhancement request to show both is open) | Use the Non Stock and Trade In applet's own listing for trade-in units |
| The min / max e-mail never arrives | The job needs a non-empty location list and recipient list in its properties, and only rows whose min or max level is greater than zero count; with nothing to report it sends no mail | Set min / max on the item's *Location* tab or through a replenishment run, and check the job's properties with support |
| The same document counted twice after a reprocess | Should not happen: the applied-marker table rejects a second application of the same ledger line. If it does, a duplicate ledger line exists | Support: `GET .../duplicate-stock-balance` on the transaction-line data-fix controller lists duplicates |
| *Available* in Stock Availability differs from the balance here | Expected: available = balance plus signed open orders. The balance itself only changes on FINAL of a stock-moving document | Look at the open sales / purchase orders in Stock Availability |

## Related documentation

- Module overview: [Inventory](/modules/inventory/) and its [related applets](/modules/inventory/related-applets/)
- Applet pages: [Stock Balance](/applets/inventory-workflow/stock-balance-applet/), [Stock Availability](/applets/inventory-workflow/stock-availability-applet/), [Stock Report](/applets/inventory-workflow/stock-report-applet/), [Stock Adjustment](/applets/inventory-workflow/stock-adjustment-applet/), [Stock Transfer](/applets/inventory-workflow/stock-transfer-applet/), [Stock Take](/applets/inventory-workflow/stock-take-applet/)
- Marketplace stock: [EcomSync Related Applets](/applets/integrations/90-ecomsync-related-applets/)
