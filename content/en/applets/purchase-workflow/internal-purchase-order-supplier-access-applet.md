---
title: "Purchase Order Supplier Access (Internal) Applet"
description: "Efficient purchase order visibility and acknowledgement for suppliers"
tags:
- supplier-portal
- purchase-orders
- procurement-transparency
- order-acknowledgement
- vendor-management
weight: 270
---

{{< callout type="warning" >}}
**Internal Purchase Order Supplier Access Applet user guide still under progress**

**Work in Progress: This documentation is currently under development. Visual assets (screenshots) and further details will be added soon.**
{{< /callout >}}

## Purpose and Overview

The **Internal Purchase Order Supplier Access Applet** is a key procurement tool that allows vendors to view, download, and acknowledge Purchase Orders (POs) issued by your organization. This digital bridge ensures both parties are aligned on order details, pricing, and delivery timelines.

{{< callout type="info" >}}
**Core Concept**: A **Supplier Purchase Order Account** provides a dedicated space for vendors to see new orders, confirm their ability to fulfill them, and track historical orders.
{{< /callout >}}

## Key Features Overview

### Who Benefits from This Applet?

**Vendors & Suppliers:**
- Instant notification when a new PO is issued
- Digital "Acknowledge" button to confirm receipt
- Downloadable official PO PDFs with terms and conditions

**Procurement Officers:**
- Real-time visibility into whether a supplier has seen the PO
- Reduced manual effort in sending POs via email or fax
- Automated tracking of order fulfillment status

**Warehouse & Receiving Teams:**
- Better predictability of incoming shipments
- Early notification of delivery delays or partial shipments
- Shared data for faster Goods Received Note (GRN) processing

### What Problems Does This Solve?

**The Communication Lag Problem:**
Manual PO processing often suffers from:
- "Lost" emails slowing down the procurement cycle
- Suppliers working off outdated or incorrect PO versions
- Unconfirmed orders leading to stockouts or delivery delays

**The Supplier PO Access Solution:**
- **Single Version of Truth** - The portal always shows the latest authorized PO
- **Digital Acknowledgement** - Instantly see when a supplier confirms an order
- **Audit History** - Complete log of when a PO was issued, viewed, and acknowledged

## Key Features Overview

{{< cards >}}
  {{< card title="PO Listing" subtitle="View all new and historical purchase orders" link="#po-listing" >}}

  {{< card title="Order Acknowledgement" subtitle="Confirm order receipt and delivery dates" link="#acknowledgement" >}}

  {{< card title="Document Download" subtitle="Access official PO PDFs for records" link="#documents" >}}

  {{< card title="Delivery Updates" subtitle="Suppliers can provide estimated arrival dates" link="#delivery-tracking" >}}
{{< /cards >}}

## Key Concepts

### Order Progression

| Status | Meaning | Action Required |
|-----------|------------|-----------------|
| **Issued** | PO sent to the supplier. | Supplier to review. |
| **Acknowledged**| Supplier confirmed the order. | Procurement to monitor. |
| **Shipped** | Supplier marked items as dispatched. | Warehouse to prepare for receipt. |
| **Fulfilled** | Items received and processed. | Finance to await invoice. |

## Quick Start Guide

### For Suppliers: Acknowledging a New Order

**Goal:** Confirm you have received and accepted a PO in 3 steps.

1. **Access**: Go to **Supplier Portal > My Purchase Orders**
2. **Review**: Open the newest PO and verify items, quantities, and prices
3. **Acknowledge**: Click **"Acknowledge Order"** and enter an estimated delivery date

---

### For Procurement: Monitoring Order Status

**Goal:** Check which vendors have seen their POs.

1. **Listing**: Open **Purchase Order > Supplier View Log**
2. **Filter**: Search for POs with "Issued" but not "Acknowledged" status
3. **Follow-Up**: Contact vendors who haven't acknowledged their orders yet

---

## Configuration & Settings

Fine-tune your procurement workflow in **Settings**:
- **Auto-Cancellation**: Set a timeout period for unacknowledged orders.
- **Acknowledgement Rules**: Define if suppliers *must* acknowledge before shipping.
- **Email Alerts**: Set up automated reminders for pending POs.

---

## FAQ

**Q: Can a supplier change the price on a PO?**
A: No, the portal is typically read-only. Any price discrepancies must be resolved through a formal change request or via the **Dispute** function.

**Q: What if the supplier can only fulfill half of the order?**
A: Suppliers can use the **Acknowledgement** notes to specify partial fulfillment, allowing procurement to adjust the PO accordingly.

**Q: Can I see when a supplier last logged in?**
A: Yes, admin users can see **Last Login** and **PO View History** in the supplier's portal profile.

**Q: How do we handle multi-lingual suppliers?**
A: The portal supports multiple languages, allowing suppliers to view the interface in their preferred language (if configured).
