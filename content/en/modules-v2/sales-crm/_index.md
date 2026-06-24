---
title: "Sales & CRM Module"
description: "Complete revenue lifecycle — from quotation through invoicing, commission tracking, customer relationship management, and sales automation."
weight: 25
---

## 1. Module Overview

The **Sales & CRM Module** powers the complete revenue lifecycle — from the first customer lead and quotation through order fulfillment, invoicing, payment collection, and customer relationship retention. It provides sales teams with tools to manage the quoting pipeline, process confirmed orders, track deliveries, handle returns and credit adjustments, reconcile daily cashier collections, and automate CRM activities.

**Business Value:**
- **Eliminate Manual Handoffs**: Automatically link quotations, sales orders, delivery orders, and invoices.
- **Real-Time Pipeline Visibility**: Track opportunities and sales performance in real-time.
- **Improved Customer Experience**: Unified interaction history and multi-channel support center.
- **Optimized Incentives**: Transparent, automated commission tracking and payouts.

### Core Capabilities

- **Customer Relationship Management**: Complete 360-degree customer profile view, contact hierarchy, and interaction tracking.
- **Sales Process Automation**: Visual pipeline management, opportunity tracking, quote generation, and forecasting.
- **Lead Management**: Multi-channel lead capture, scoring, automated routing, and conversion tracking.
- **Customer Service & Support**: Ticket creation, knowledge base integration, SLA compliance monitoring, and feedback collection.
- **Advanced CRM & Automation**: Automated sales follow-ups, email cadences, predictive lead scoring, and customer churn prediction.

### Industry-Specific Features

- **B2B Sales**: Account-based marketing, complex multi-stakeholder decision management, and contract tracking.
- **B2C Sales**: Mass market management, loyalty reward programs, and cashier Z-reports.
- **Service Industries**: Subscription management, recurring revenue, and maintenance contract renewals.

### Compliance & Security

- **Data Privacy (GDPR)**: Built-in consent management, secure customer data handling, and role-based access control.
- **Sales Compliance**: Multi-level approval workflows for credit limits and contract terms, complete audit trails, and document tracking.

---

## 2. Key Concepts & Terminology

| Term | Definition |
|------|-----------|
| **Sales Quotation** | A formal price proposal sent to a customer before a confirmed order. |
| **Sales Order (SO)** | A confirmed customer order that triggers downstream fulfillment and invoicing. |
| **Proforma Invoice** | A preliminary invoice issued before goods are delivered, often used for advance payment or customs. |
| **Delivery Order (DO)** | A warehouse instruction to pick, pack, and ship goods to the customer. |
| **GRN (Goods Received Note)** | Confirmation that goods have been received by the customer or returned to the warehouse. |
| **GIN (Goods Issue Note)** | A document recording the physical issue of stock from the warehouse. |
| **Credit Note** | A document reducing the amount owed by a customer (e.g., for returns or pricing adjustments). |
| **Debit Note** | A document increasing the amount owed by a customer (e.g., for undercharges). |
| **Z Report** | An end-of-day cashier closure summary that locks daily totals for reconciliation. |
| **Commission Cycle** | A defined time period for calculating and approving sales commission payouts. |
| **Service Level Agreement (SLA)** | Defined response and resolution times for customer support tickets. |
| **Unified Contact Center (UCC)** | An integrated console combining email, phone, chat, and social media customer touchpoints. |

---

## 3. Included Applets

### Customer Relationship Management (CRM)

| Applet | Purpose |
|--------|---------|
| [Customer Maintenance Applet](/applets/master-data/customer-maintenance-applet/) | Create and manage customer master records with credit terms, addresses, and contact details. |
| [Unified Contact Center (UCC) Applet](/applets/sales-workflow/unified-contact-center-ucc-applet/) | Multi-channel communication console for support tickets, phone logs, and chat interactions. |
| [AI Customer Analytics Applet](/applets/sales-workflow/ai-customer-analytics-applet/) | Advanced intelligence for customer scoring, behavior analytics, and predictive lifetime value. |

### Document Lifecycle

| Applet | Purpose |
|--------|---------|
| [Internal Sales Quotation Applet](/applets/sales-workflow/internal-sales-quotation-applet/) | Create, review, and manage price proposals to customers. |
| [Internal Sales Order Applet](/applets/sales-workflow/internal-sales-order-applet/) | Process confirmed customer orders and trigger fulfillment. |
| [Internal Sales Proforma Invoice Applet](/applets/sales-workflow/internal-sales-proforma-invoice-applet/) | Issue preliminary invoices for advance payment or customs purposes. |
| [Internal Sales Invoice Applet](/applets/sales-workflow/internal-sales-invoice-applet/) | Generate final tax invoices for completed sales. |
| [Internal Delivery Order Applet](/applets/sales-workflow/internal-delivery-order-applet/) | Manage warehouse pick-pack-ship instructions for customer orders. |
| [Internal Sales GRN Applet](/applets/sales-workflow/internal-sales-grn-applet/) | Record goods received confirmations from customers or for returns processing. |
| [Internal Sales GIN (Stock Out) Applet](/applets/sales-workflow/internal-sales-gin-stock-out-applet/) | Process goods issue notes for stock-out transactions. |

### Adjustments & Returns

| Applet | Purpose |
|--------|---------|
| [Internal Sales Credit Note Applet](/applets/sales-workflow/internal-sales-credit-note-applet/) | Issue credit adjustments reducing customer balances. |
| [Internal Sales Debit Note Applet](/applets/sales-workflow/internal-sales-debit-note-applet/) | Issue debit adjustments increasing customer balances. |
| [Internal Sales Return Applet](/applets/sales-workflow/internal-sales-return-applet/) | Process customer returns and manage restocking workflows. |
| [Internal Sales Refund Note Applet](/applets/sales-workflow/internal-sales-refund-note-applet/) | Generate refund documents for returned or cancelled transactions. |

### Reporting & Analytics

| Applet | Purpose |
|--------|---------|
| [Sales Report Applet](/applets/sales-workflow/sales-report-applet/) | Comprehensive sales performance reporting and analytics. |
| [Sales Report — Supplier Access Applet](/applets/sales-workflow/sales-report-supplier-access-applet/) | Restricted sales reporting view for external supplier partners. |
| [Daily Cashier Report Applet](/applets/sales-workflow/daily-cashier-report-applet/) | End-of-day cashier reconciliation with Z Reports and collection tracking. |

### Commission & Specialized

| Applet | Purpose |
|--------|---------|
| [Sales Commission Applet](/applets/sales-workflow/sales-commission-applet/) | Track, calculate, and process sales commission payouts. |
| [Commission Scheme Applet](/applets/sales-workflow/commission-scheme-applet/) | Define commission rules, rates, and scheme structures. |
| [Customer Consignment Applet](/applets/sales-workflow/customer-consignment-applet/) | Manage consignment stock placed at customer locations. |
| [POS Terminal Applet](/applets/sales-workflow/pos-terminal-applet/) | Point of sale terminal for retail counter transactions. |
| [Custom Processor Applet](/applets/sales-workflow/custom-processor-applet/) | Configurable document processing for custom sales workflows. |

---

## 4. Standard Business Workflows

### Workflow 1: Quote-to-Cash (Standard Sales Cycle)

```
┌──────────────┐    ┌──────────────┐    ┌──────────────┐    ┌──────────────┐    ┌──────────────┐
│   Sales      │───▶│   Sales      │───▶│   Delivery   │───▶│   Sales      │───▶│   Receipt    │
│   Quotation  │    │   Order      │    │   Order      │    │   Invoice    │    │   Voucher    │
└──────────────┘    └──────────────┘    └──────────────┘    └──────────────┘    └──────────────┘
```

**Steps:**
1. **Sales Rep** creates a quotation in the **Sales Quotation Applet** and sends it to the customer.
2. When accepted, the quote is converted to a **Sales Order** in the **Sales Order Applet**.
3. Warehouse receives the **Delivery Order** via the **Delivery Order Applet** and ships goods.
4. Finance generates the **Sales Invoice** via the **Sales Invoice Applet**.
5. Payment is recorded using the **Receipt Voucher** in the Financial Accounting module.

### Workflow 2: Returns & Credit Adjustment

```
Customer Complaint ──▶ Sales Return ──▶ GRN (Stock In) ──▶ Credit Note ──▶ Refund Note
```

**Steps:**
1. Customer contacts the sales team about a defective or incorrect item.
2. **Sales Rep** creates a **Sales Return** in the **Sales Return Applet**.
3. Warehouse confirms receipt of returned goods via the **Sales GRN Applet**.
4. A **Credit Note** is issued via the **Credit Note Applet** to adjust the customer balance.
5. If a cash refund is required, a **Refund Note** is generated.

### Workflow 3: End-of-Day Cashier Reconciliation

```
POS Transactions ──▶ Cashier Collection Report ──▶ Z Report ──▶ Bank Deposit
```

**Steps:**
1. Throughout the day, POS terminals process sales via the **POS Terminal Applet**.
2. At shift end, the store manager opens the **Daily Cashier Report Applet** to review collections.
3. The **Z Report** is generated to lock the day's totals.
4. Physical cash is reconciled against the digital totals and deposited to the bank.

### Workflow 4: Commission Payout Cycle

```
Sales Finalized ──▶ Commission Calculated ──▶ Cycle Closed ──▶ Payout Processed
```

**Steps:**
1. As invoices are paid, commissions accumulate in the **Sales Commission Applet**.
2. At period end, the manager reviews the **Commission Cycle** and locks the period.
3. Finance processes payments via the **Payout Processing** workspace.

### Workflow 5: Lead-to-Cash Process

```
Lead Generation → Qualification → Opportunity → Quote → Negotiation → Close → Fulfillment
```

**Steps:**
1. Leads are captured via multiple channels (web, social, events) in the **UCC Applet**.
2. Leads are scored and qualified by the sales team.
3. An Opportunity is created and updated along the sales pipeline.
4. A Quote is generated from the opportunity and sent to the customer.
5. Negotiation is conducted, terms are finalized, and the deal is marked as won (Sales Order).
6. Fulfillment starts and leads to invoice billing and final payment collection.

### Workflow 6: Customer Lifecycle Management

```
Prospect → Lead → Opportunity → Customer → Retention → Expansion → Advocacy
```

**Steps:**
1. Prospects are engaged via campaigns.
2. Conversion to lead tracks initial contact details.
3. Opportunity tracking aligns sales team activities.
4. Closed deal creates the customer master record.
5. Service support ensures retention.
6. Upsells and cross-sells expand the account value.
7. Satisfied customers become reference advocates.

### Workflow 7: Customer Service Process

```
Issue → Ticket Creation → Assignment → Resolution → Follow-up → Closure
```

**Steps:**
1. An issue is received through email, chat, or phone.
2. A ticket is created in the **Unified Contact Center (UCC) Applet** and prioritized.
3. The ticket is assigned to a support agent based on routing rules.
4. The agent resolves the issue and records details in the knowledge base.
5. Follow-up is conducted to verify customer satisfaction.
6. The ticket is closed and CSAT metrics are updated.

---

## 5. Roles & Permissions

| Role | Primary Applets | Key Responsibilities |
|------|----------------|---------------------|
| **Sales Representative** | Quotation, Sales Order, Commission | Create quotes, convert to orders, track personal commissions |
| **Sales Manager** | Sales Report, Commission, Order | Approve high-value quotes, review pipeline, close commission cycles |
| **Warehouse Staff** | Delivery Order, GIN, GRN | Pick, pack, and ship orders; process returns receiving |
| **Accounts / Finance** | Sales Invoice, Credit Note, Receipt Voucher, Cashier Report | Generate invoices, process payments, reconcile daily collections |
| **Store Cashier** | POS Terminal, Daily Cashier Report | Process retail sales, reconcile daily cash drawer |
| **System Administrator** | All (Settings panels) | Configure field settings, printable formats, workflow rules |

---

## 6. Prerequisites / Initial Setup

Before going live with Sales & CRM, ensure:

- [x] **Core Module** — Organisation, branches, and locations are configured
- [ ] **Customer Maintenance** — Customer records are created or imported
- [ ] **Inventory Item Maintenance** — Products/services are defined with pricing
- [ ] **Chart of Accounts** — Sales revenue, COGS, and receivables accounts exist
- [ ] **Tax Configuration** — Applicable sales tax codes are configured
- [ ] **Pricebook** — At least one pricebook is set up with item prices
- [ ] Each sales applet has its **Application Settings**, **Default Selection**, and **Printable Format Settings** configured

### Setup Sequence

Recommended configuration order:
1. **Organization Setup** (Company details, branches, departments)
2. **Financial Foundation** (Chart of Accounts, Tax Configuration, Cashbooks)
3. **Master Data** (Customers, Suppliers, Employees, Items catalogue)
4. **System Configuration** (Tenant Admin settings, user permissions, workflow rules)

### Phased Implementation Approach

- **Phase 1: Foundation Setup**: Define customer hierarchies, classifications, sales territories, and import customer data.
- **Phase 2: Sales Process Implementation**: Set up pipeline stages, quote templates, pricebooks, discount rules, and lead-routing criteria.
- **Phase 3: Service & Analytics**: Configure support ticket workflows in the UCC Applet, SLA monitors, and sales performance dashboards.

---

## 7. FAQs & Troubleshooting

**Q: A Sales Order was created but no Delivery Order appeared. Why?**
A: Delivery Orders are typically generated manually or via workflow rules. Check the **Workflow Settings** in the Sales Order Applet to ensure the automation is enabled.

**Q: The cashier's Z Report total doesn't match the physical cash drawer.**
A: Open the **Daily Cashier Report Applet** and filter by the specific cashier and shift. Compare individual transaction entries against physical receipts to identify the discrepancy.

**Q: Can a Sales Quotation be edited after it's been sent?**
A: Yes, as long as the quotation has not been converted to a Sales Order. Once converted, the original quotation is locked.

**Q: How do I change the PDF layout of a Sales Invoice?**
A: Navigate to **Sales Invoice Applet → Settings → Printable Format Settings**. Upload your updated `.jrxml` template and mark it as the default.

**Q: A customer wants a proforma invoice before committing to the order. Which applet do I use?**
A: Use the **Internal Sales Proforma Invoice Applet** to generate a preliminary invoice that can be sent before goods are shipped.

### Troubleshooting Common Issues

- **Low User Adoption**: Review training materials, check for slow interface loading, verify process alignment, and capture feedback.
- **Data Quality Problems**: Set up data validation rules in customer records and pricebooks, establish clear data entry guidelines, and run clean-up scripts.
- **Integration Failures**: Check API endpoints, verify transaction mapping, and inspect error logs inside the **Custom Processor Applet** or system console.
