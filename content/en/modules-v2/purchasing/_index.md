---
title: "Purchasing Module"
description: "Complete Purchase-to-Pay lifecycle — from requisition and purchase orders to strategic sourcing, supplier onboarding, and performance analytics."
weight: 35
---

## 1. Module Overview

The **Purchasing Module** manages the entire procurement and sourcing lifecycle. It handles internal purchase requests, Request for Quotation (RFQ) competitive bidding, purchase orders, goods receipt, and supplier invoice verification. Enforcing budget controls and automated workflow routing, the module optimizes corporate spending, ensures strategic vendor compliance, and links directly to Financial Accounting and Inventory.

**Business Value:**
- **Controlled Spending**: Enforce strict delegation of authority limits through multi-level approval hierarchies.
- **Three-Way Matching**: Prevent overpayment by validating that Purchase Orders, GRNs, and Supplier Invoices match in quantities and prices.
- **Strategic Sourcing**: Compare supplier bids, track vendor performance KPIs, and manage contracts to lower Total Cost of Ownership (TCO).
- **Reduced Admin Costs**: Streamline recurring purchases through Blanket Purchase Orders and automated replenishment triggers.

### Core Capabilities

- **Purchase-to-Pay Lifecycle**: Full coordination of requisitions, quotations, orders, warehouse receipts, invoice checking, and payment vouchers.
- **Supplier Relationship Management (SRM)**: Track supplier onboarding checklists, manage certifications, and audit compliance metrics.
- **Spend & Procurement Analytics**: Aggregate category spending, review pricing history trends, and track cost savings dashboards.
- **Cost Management & Optimization**: Deploy should-cost modeling, lifecycle cost analysis, and value engineering to optimize vendor pricing.

### Compliance & Governance

- **Delegation of Authority (DoA)**: Lock purchasing limits by role or department to prevent unauthorized buying.
- **Ethical & Sustainable Sourcing**: Track supplier social, environmental, and anti-corruption compliance records.
- **Global Trade Compliance**: Verify import/export paperwork and coordinate multi-currency supplier pricebooks.

---

## 2. Key Concepts & Terminology

| Term | Definition |
|------|-----------|
| **Purchase Requisition (PR)** | An internal request to buy goods or services, subject to budget and manager approval before conversion to a PO. |
| **Purchase Order (PO)** | A legally binding contract sent to a supplier authorizing the purchase of specified items at agreed prices. |
| **Blanket Purchase Order** | A standing contract for recurring purchases over a defined time, release-managed periodically. |
| **RFQ (Request for Quotation)** | A request sent to multiple suppliers to submit competitive price proposals. |
| **GRN (Goods Received Note)** | A document confirming goods have been physically received, checked for quality, and logged into stock. |
| **Three-Way Matching** | A validation check matching lines across PO, GRN, and Supplier Invoice to confirm payment authorization. |
| **Total Cost of Ownership (TCO)** | The comprehensive analysis of all costs related to buying and using a product, beyond its purchase price. |
| **Should-Cost Modeling** | A bottom-up estimation of an item's raw material, manufacturing, and transport costs to evaluate supplier quotes. |

---

## 3. Included Applets

### Strategic Sourcing & Supplier Admin

| Applet | Purpose |
|--------|---------|
| [Supplier Maintenance Applet](/applets/purchase-workflow/supplier-maintenance-applet/) | Comprehensive vendor directory for payment terms, tax IDs, banking setups, and supplier qualification tracking. |
| [Internal Purchase Quotation Applet](/applets/purchase-workflow/internal-purchase-quotation-applet/) | Log and compare competitive quotes received from suppliers in response to RFQs. |

### Procurement Lifecycle

| Applet | Purpose |
|--------|---------|
| [Internal Purchase Requisition Applet](/applets/purchase-workflow/internal-purchase-requisition-applet/) | Raise internal purchase requests with automatic department budget limit checks. |
| [Internal Purchase Order Applet](/applets/purchase-workflow/internal-purchase-order-applet/) | Create, approve, and email purchase orders to suppliers. |
| [Blanket Purchase Order Applet](/applets/purchase-workflow/blanket-purchase-order-applet/) | Maintain long-term supplier pricing contracts and generate periodic release orders. |

### Goods Receipt & Returns

| Applet | Purpose |
|--------|---------|
| [Internal Purchase GRN Applet](/applets/purchase-workflow/internal-purchase-grn-applet/) | Confirm physical receipt of goods, inspect quality, and update stock records. |
| [Internal Purchase GRN — Stock In Applet](/applets/purchase-workflow/internal-purchase-grn-stock-in-applet/) | Link goods receipt notes to inventory stock cards. |
| [Internal Purchase GRN — Supplier Access Applet](/applets/purchase-workflow/internal-purchase-grn-supplier-access-applet/) | Restricted portal view allowing supplier partners to inspect delivery statuses. |
| [Internal Purchase GIN Applet](/applets/purchase-workflow/internal-purchase-gin-applet/) | Issue Goods Issue Notes to record inventory exiting the warehouse for supplier returns. |
| [Internal Purchase Return Applet](/applets/purchase-workflow/internal-purchase-return-applet/) | Coordinate return workflows for defective, incorrect, or surplus supplier goods. |

### Financial Adjustments & Reports

| Applet | Purpose |
|--------|---------|
| [Internal Purchase Debit Note Applet](/applets/purchase-workflow/internal-purchase-debit-note-applet/) | Generate debit entries to increase claims against suppliers. |
| [Internal Purchase Credit Note Applet](/applets/purchase-workflow/internal-purchase-credit-note-applet/) | Log credit adjustments received from suppliers to reduce account balances. |
| [Internal Purchase Refund Note Applet](/applets/purchase-workflow/internal-purchase-refund-note-applet/) | Record cash or bank refunds from suppliers for returned goods. |
| [Purchase Report Applet](/applets/purchase-workflow/purchase-report-applet/) | Aggregate procurement performance reporting, spend analytics, and supplier KPIs. |

---

## 4. Standard Business Workflows

### Workflow 1: Purchase-to-Pay (Standard Procurement)

```
┌──────────────┐    ┌──────────────┐    ┌──────────────┐    ┌──────────────┐    ┌──────────────┐
│  Purchase    │───▶│  Purchase    │───▶│   Goods      │───▶│  Purchase    │───▶│   Payment    │
│  Requisition │    │   Order      │    │   Receipt    │    │   Invoice    │    │   Voucher    │
└──────────────┘    └──────────────┘    └──────────────┘    └──────────────┘    └──────────────┘
```

**Steps:**
1. **Requester** raises a Purchase Requisition in the **PR Applet** with item details and budget center.
2. After approval, the PR is converted to a **Purchase Order** and sent to the supplier.
3. When goods arrive, the warehouse confirms receipt via the **Purchase GRN Applet** (three-way match check).
4. The supplier invoice is matched against the PO and GRN. Discrepancies are flagged.
5. Once matched, finance processes the **Payment Voucher** in the Financial Accounting module.

### Workflow 2: Strategic Sourcing (Competitive RFQ Bidding)

```
Define Requirement ──▶ RFQ Created ──▶ Send to Suppliers ──▶ Compare Quotes ──▶ Select Supplier ──▶ Award PO
```

**Steps:**
1. Sourcing team identifies a strategic need or high-value purchase requirement.
2. Sourcing officer creates an RFQ document outlining specifications and delivery windows.
3. RFQ is sent to qualified suppliers in **Supplier Maintenance**.
4. Quotations are received and logged in the **Internal Purchase Quotation Applet**.
5. System matches and compares unit prices, lead times, and terms.
6. The winning bid is selected, and a PO is automatically awarded.

### Workflow 3: Supplier Onboarding & Qualification

```
Discover Supplier ──▶ Send Qualification Check ──▶ Assess Compliance ──▶ Approve ──▶ Setup Master Data
```

**Steps:**
1. Procurement identifies a potential supplier.
2. Compliance checks are sent request certificate uploads (ISO, Tax Registration).
3. Sourcing officer assesses financial stability, operational capacity, and ethical certifications.
4. Approval committee reviews the qualification score.
5. Supplier is added as an active vendor in **Supplier Maintenance Applet** and mapped to relevant categories.

### Workflow 4: Supplier Return & Balance Adjustment

```
QC Rejection ──▶ Purchase Return ──▶ GIN (Stock Out) ──▶ Supplier Credit Note ──▶ Balance Adjusted
```

**Steps:**
1. QC rejects a batch of materials. Warehouse raises a **Purchase Return**.
2. Goods are packed and sent back to the supplier, accompanied by an **Internal Purchase GIN**.
3. Sourcing team registers the return and requests a refund or Credit Note.
4. Supplier's Credit Note is entered via **Purchase Credit Note Applet**, adjusting the accounts payable ledger.

---

## 5. Roles & Permissions

| Role | Primary Applets | Key Responsibilities |
|------|----------------|---------------------|
| **Requester (Employee)** | Purchase Requisition | Raise purchase requests for department tools, materials, or services |
| **Purchasing Officer** | Purchase Order, Quotation, Blanket PO | Request quotations, select vendors, issue POs, negotiate contracts |
| **Warehouse Receiver** | Purchase GRN, GRN Stock In | Receive deliveries, count items, verify quality, document variances |
| **Accounts Payable** | Purchase Invoice, Payment Voucher | Match supplier invoices against PO/GRN documents, queue payment releases |
| **Procurement Manager** | Purchase Report, All Purchase Applets | Approve purchase orders exceeding limits, review spend dashboards, audit vendor scorecards |

---

## 6. Prerequisites / Initial Setup

Before going live with the Purchasing Module, ensure:

- [x] **Core Module** — Organisation structure, branches, and cost locations are configured
- [ ] **Supplier Maintenance** — Vendor profiles populated with credit terms and bank accounts
- [ ] **Chart of Accounts** — Mapped accounts for purchase assets, AP ledger, and tax inputs
- [ ] **Workflow Design Applet** — Configured authorization routing matrices and budget thresholds
- [ ] Mapped default JRXML print templates for outgoing RFQs, POs, and Returns

### Implementation Phasing

- **Phase 1: Foundation Setup**: Map buyer roles, define item purchasing classifications (categories), and import supplier listings.
- **Phase 2: Operational Flow**: Set up requisition workflows, PO generation rules, receiving policies, and three-way match tolerances.
- **Phase 3: Sourcing & Analytics**: Roll out blanket PO agreements, supplier performance scorecards, and cost savings dashboards.

---

## 7. FAQs & Troubleshooting

**Q: The GRN quantity doesn't match the PO. Can I still receive the goods?**
A: Yes, partial receipts are supported. The system will track the remaining balance on the PO, allowing future GRNs against the same order.

**Q: How do I handle a supplier price increase after the PO was issued?**
A: Create a **Purchase Debit Note** to adjust the pricing for already-received goods, or amend the PO (if the workflow allows) for future deliveries.

**Q: Can a Purchase Requisition bypass the approval workflow?**
A: No. If an approval workflow is configured, all PRs must complete the approval chain before conversion to a PO. This enforces budgetary controls.

**Q: How do I track spending by supplier over time?**
A: Use the **Purchase Report Applet** and filter by supplier to view historical spend, order volumes, and trends.

### Troubleshooting Common Issues

- **Approval Workflow Delays**: Check if the assigned approver is active in Tenant Admin. Review escalation timers and temporary delegate settings if the approver is out of office.
- **Supplier Performance Shortfalls**: Review the delivery and quality KPIs in the **Purchase Report Applet**. Verify that receipt variances are logged correctly on the GRN to ensure accurate metrics.
- **Three-Way Match Discrepancies**: Investigate pricing mismatches. If the invoice price differs from the PO price within accepted tolerance limits, process the invoice; otherwise, flag it for buyer review.
