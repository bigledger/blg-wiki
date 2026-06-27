---
title: "Core Concepts"
description: "Fundamental architectural concepts of BigLedger's Purchasing Module — P2P document lifecycles, 3-way matching, and GRNI accruals."
weight: 20
bookCollapseSection: false
---

Understanding core procurement concepts is essential before configuring vendor pricebooks or processing supplier invoices. These concepts explain **how procurement documents flow through the ERP** and how warehouse receipts impact financial ledgers.

## The Procurement-to-Pay (P2P) Document Lifecycle

Procurement transactions follow a structured 5-step lifecycle. Each step represents a distinct legal commitment, inventory movement, and financial milestone.

![Procurement-to-Pay Document Lifecycle](/images/purchasing/purchasing_lifecycle.png)

| Step | Document | Business Purpose | Inventory Impact | Accounting Impact |
|------|----------|------------------|------------------|-------------------|
| **1** | **Purchase Requisition** | Internal department request asking procurement to buy goods | None | None |
| **2** | **Purchase Order (PO)** | Legally binding contract sent to vendor specifying items & prices | Stock Expected (Incoming PO quantity) | None (Commitment recorded) |
| **3** | **Goods Received Note (GRN)** | Receiving slip issued upon physical arrival of goods | Stock Increased (Physical stock-in) | GRNI Accrual (Debit Inventory / Credit GRNI) |
| **4** | **Purchase Invoice** | Supplier's commercial billing document demanding payment | None (if GRN already executed) | Accounts Payable Credited, GRNI Cleared |
| **5** | **Vendor Settlement** | AP cash disbursement or bank transfer payment | None | Bank Credited, Accounts Payable Debited |

---

## 3-Way Invoice Matching Mechanics

To prevent unauthorized payments and billing errors, BigLedger enforces **3-Way Invoice Matching** before an Accounts Payable invoice can be approved for payment disbursement:

```
          ┌─────────────────────────────────────────────────────────┐
          │                  Purchase Order (PO)                    │
          │             (Approved Quantities & Prices)              │
          └────────────────────────────┬────────────────────────────┘
                                       │
                ┌──────────────────────┴──────────────────────┐
                ▼                                             ▼
┌───────────────────────────────┐             ┌───────────────────────────────┐
│     Goods Received Note (GRN) │             │       Supplier Invoice        │
│    (Physical Stock Received)  │<───────────>│    (Vendor Billing Demand)    │
└───────────────────────────────┘  3-Way Match└───────────────────────────────┘
```

1. **PO vs. GRN:** Verifies that the warehouse physically received the exact quantities ordered.
2. **PO vs. Invoice:** Verifies that the supplier billed the exact unit prices agreed upon in the purchase order.
3. **GRN vs. Invoice:** Verifies that the invoice only bills for items actually delivered to the warehouse.

---

## Understanding GRNI (Goods Received Not Invoiced)

When goods arrive at the warehouse, inventory balance increases immediately via the **Goods Received Note (GRN)**. However, the supplier's formal invoice may not arrive until weeks later. 

To maintain accurate financial statements, BigLedger uses a clearing account called **Goods Received Not Invoiced (GRNI)**:
- **Upon GRN Execution:** Debit Inventory Asset, Credit GRNI Liability Clearing Account.
- **Upon Invoice Receipt:** Debit GRNI Liability Clearing Account, Credit Accounts Payable.

This ensures your balance sheet reflects inventory asset value immediately upon physical receipt without waiting for vendor invoices.

---

## What to Read Next

- **[Configuration](/modules-v2/purchasing/configuration/)** — Set up vendor pricebooks, requisition approval hierarchies, and receiving rules.
- **[Use Cases](/modules-v2/purchasing/use-cases/)** — Review reference architectures for raw material procurement, trading stock reordering, and consignment purchases.
