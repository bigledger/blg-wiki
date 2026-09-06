---
title: "Inventory Management"
description: "Set up stock tracking, manage daily stock operations, handle transfers between locations, and generate inventory reports"
tags:
- user-guide
- inventory
weight: 32
bookCollapseSection: false
---

Manage your inventory operations — from initial stock setup and item configuration to daily stock movements, inter-branch transfers, and stock reporting.

---

## 🚀 Get Started / Setup

New to inventory in BigLedger? Start with these foundational steps.

{{< cards >}}
  {{< card link="/guides/inventory-guides/stock-management/" title="📦 Stock Management" subtitle="Set up your items, warehouses, and stock tracking — the foundation for all inventory operations" >}}
{{< /cards >}}

**What you'll set up:**
- Item master data (products, categories, units of measure)
- Warehouse and location definitions
- Stock opening balances
- Reorder levels and minimum stock quantities
- Serial number / batch tracking (if applicable)

{{< callout type="tip" >}}
**First time?** Complete stock management setup before processing any purchase or sales document. Items, warehouses and locations must exist before stock movements can be recorded.
{{< /callout >}}

---

## 📝 Daily Tasks

Guides for everyday inventory activities your warehouse team performs.

{{< cards >}}
  {{< card link="/guides/inventory-guides/stock-transfer/" title="🔄 Stock Transfer Procedures" subtitle="Move stock between warehouses, branches, and locations — with full audit trail" >}}
{{< /cards >}}

**Typical daily workflow:**
1. Receive incoming goods on a Purchase GRN, and count them honestly. A standard GRN records the receipt; it is the **purchase invoice** that books the stock in. (If your company uses the *GRN Stock In* applet instead, the receipt books the stock and the invoice books only the money — one pair or the other, never a document from each.)
2. Pick and pack items for delivery. A delivery order records the despatch; it is the **sales invoice** or cash bill that takes the stock out.
3. Handle stock transfers between locations
4. Review low-stock alerts and reorder notifications
5. Process stock adjustments for damaged or expired items

---

## ⚠️ Common Scenarios / Pitfalls

Watch out for these frequent inventory issues:

| Scenario | What Happens | How to Handle |
|----------|-------------|---------------|
| **Negative stock** | Sales/transfers exceed available quantity | Enable negative stock prevention in settings, or adjust before processing |
| **Item not appearing** | Item exists but isn't selectable in transactions | Check item status is Active, company/branch assignment is correct |
| **Missing serial numbers** | Cannot trace individual units | Enable serial tracking in item configuration before first receipt |
| **Stock count discrepancy** | Physical count ≠ system balance | Use Stock Adjustment to reconcile, document reason for variance |
| **Transfer not received** | Outbound transfer shows but inbound missing | Check receiving branch has approved/received the transfer |

{{< callout type="warning" >}}
**Stock Accuracy**: Perform physical stock counts at least quarterly. Discrepancies compound over time and affect purchasing decisions, sales availability, and financial reporting.
{{< /callout >}}

---

## 📊 Reporting Usage

Monitor your inventory health and movement patterns.

**Key Inventory Reports:**
- **Stock Balance Report** — Current stock on hand per item, location, and warehouse
- **Stock Movement Report** — All stock-in and stock-out transactions for a period
- **Stock Aging Report** — Identify slow-moving and obsolete stock
- **Reorder Report** — Items below minimum stock levels
- **Stock Valuation Report** — Total inventory value by costing method (FIFO, LIFO or moving average)

**Reporting tips:**
- Check Stock Balance daily for high-turnover items
- Use Stock Aging to identify slow-moving inventory quarterly
- Compare stock valuation against financial reports for accuracy
- Export to Excel for warehouse-level analysis

---

## Related Resources

- **[Inventory Module](/modules/inventory/)** — Module overview and capabilities
- **[Warehouse Management](/applets/inventory-workflow/warehouse-management-applet/)** — Advanced WMS operations
- **[Stock Report](/applets/inventory-workflow/stock-report-applet/)** — Stock reporting reference
- **[Stock Adjustment](/applets/inventory-workflow/stock-adjustment-applet/)** — Adjust stock quantities and values
- **[Stock Transfer](/applets/inventory-workflow/stock-transfer-applet/)** — Inter-branch and inter-warehouse transfers
- **[Stock Availability](/applets/inventory-workflow/stock-availability-applet/)** — What is on hand, reserved, in transit, received but not invoiced