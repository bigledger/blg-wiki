---
aliases:
- /modules-v2/purchasing/related-applets/
title: "Related Applets"
description: "Complete guide to native BigLedger applet connections and dependencies supporting the Purchasing Module."
weight: 70
---

The Purchasing Module integrates seamlessly with core and supporting applets across BigLedger to deliver end-to-end Procurement-to-Pay (P2P) operations.

## Core Procurement Applets

{{< cards >}}
  {{< card link="/applets/purchase-workflow/internal-purchase-requisition-applet" title="Purchase Requisition Applet" subtitle="Internal departmental buying requests, budget checks, and pre-order approval workflows" >}}
  {{< card link="/applets/purchase-workflow/internal-purchase-order-applet" title="Purchase Order Applet" subtitle="Vendor contracting, item price enforcement, delivery scheduling, and formal PO generation" >}}
  {{< card link="/applets/purchase-workflow/internal-purchase-grn-applet" title="Goods Received Note GRN Applet" subtitle="Physical warehouse stock receiving, batch/serial assignment, inspection logs, and stock-in posting" >}}
  {{< card link="/applets/purchase-workflow/internal-purchase-invoice-no-stock-in-applet" title="Purchase Invoice No Stock In Applet" subtitle="Supplier billing that books no stock — pairs with Purchase GRN Stock In when stock moves at receipt" >}}
{{< /cards >}}

## Commercial & Consignment Applets

- **[Purchase Quotation Applet](/applets/purchase-workflow/internal-purchase-quotation-applet/)**: Vendor price requests and bidding proposals.
- **[Purchase Return Applet](/applets/purchase-workflow/internal-purchase-return-applet/)**: Returned merchandise processing and debit note requests.
- **[Purchase Credit Note Applet](/applets/purchase-workflow/internal-purchase-credit-note-applet/)**: Supplier price adjustments and billing corrections.
- **[Blanket Purchase Order Applet](/applets/purchase-workflow/blanket-purchase-order-applet/)**: Long-term supply contracts and scheduled release orders.

## Ecosystem Master Data Dependencies

- **Supplier Maintenance Applet (Core)**: Supplier master accounts, payment terms, and currency settings.
- **[Doc Item Maintenance Applet](/applets/master-data/doc-item-maintenance-applet/)**: Item master data, SKUs, and purchasing unit of measure conversions.
- **[Pricebook Applet](/applets/master-data/pricebook-applet/)**: Vendor pricebooks and contracted discount matrices.
