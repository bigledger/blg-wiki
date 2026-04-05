---
title: "Recurring Sales Invoice Applet"
description: "Automated subscription billing and repeating invoice management"
tags:
- recurring-invoices
- subscription-billing
- automated-invoicing
- finance-automation
- billing-cycles
weight: 250
---

{{< callout type="warning" >}}
**Recurring Sales Invoice Applet user guide still under progress**

**Work in Progress: This documentation is currently under development. Visual assets (screenshots) and further details will be added soon.**
{{< /callout >}}

## Purpose and Overview

The **Recurring Sales Invoice Applet** is a finance automation tool designed for businesses with subscription-based models or repeat service contracts. It automates the generation, posting, and emailing of invoices based on predefined schedules, reducing manual billing effort.

{{< callout type="info" >}}
**Core Concept**: A **Recurring Template** acts as a blueprint for multiple future invoices, specifying the items, prices, and recurrence frequency (Weekly, Monthly, Yearly).
{{< /callout >}}

## Key Features Overview

### Who Benefits from This Applet?

**Finance & Billing Teams:**
- Eliminate repetitive manual data entry for monthly retainers
- Reduce billing errors by using standardized templates
- Monitor upcoming revenue and subscription health

**Sales & Account Managers:**
- Easily set up long-term billing agreements for new clients
- View subscription status and renewal dates
- Update pricing for entire groups of recurring invoices

**Customers:**
- Receive consistent, on-time invoices for their subscriptions
- Predictable billing cycles and clear itemized charges
- Automated receipts upon payment (if integrated)

### What Problems Does This Solve?

**The Manual Billing Grind:**
Manually creating the same invoices month after month leads to:
- High administrative overhead and labor costs
- Missed billing cycles and delayed payments
- Inconsistencies in item descriptions and pricing

**The Recurring Invoice Solution:**
- **Automated Scheduling** - Invoices generate themselves on the set date
- **Template-Based Accuracy** - One "gold standard" template ensures zero errors
- **Batch Processing** - Generate and email hundreds of invoices in one click

## Key Features Overview

{{< cards >}}
  {{< card title="Recurrence Templates" subtitle="Create blueprints for repeating invoices" link="#templates" >}}

  {{< card title="Scheduling Engine" subtitle="Define flexible billing frequencies" link="#scheduling" >}}

  {{< card title="Auto-Emailing" subtitle="Automatically notify customers of new invoices" link="#emailing" >}}

  {{< card title="Subscription Analytics" subtitle="Track MRR and renewal trends" link="#analytics" >}}
{{< /cards >}}

## Key Concepts

### Recurrence Logic

| Component | Definition | Management Goal |
|-----------|------------|-----------------|
| **Template** | The master document (Items, Prices, Terms). | Accuracy and standardization. |
| **Frequency** | How often the invoice repeats (Monthly, Quarterly). | Consistent cash flow. |
| **Next Invoice Date**| The date the system will next generate a document. | Planning and oversight. |

## Quick Start Guide

### For Billing Staff: Creating a New Recurring Invoice

**Goal:** Set up a monthly subscription for a new client in 5 steps.

1. **Navigate**: Go to **Recurring Invoices > Templates**
2. **Create**: Click **"+" (New Template)** → Select the **Customer**
3. **Add Items**: Add the subscription lines (e.g., "SaaS License - Basic")
4. **Schedule**: Set **Frequency** to "Monthly" and the **Start Date**
5. **Activate**: Mark the template as **"Active"** → The system will now auto-bill

---

### For Finance Managers: Reviewing Generated Invoices

**Goal:** Verify and batch-email monthly bills.

1. **View Queue**: Go to **Recurring Invoices > Generated Invoices**
2. **Review**: Check the listing for any unexpected amounts or errors
3. **Approve/Post**: Select the invoices and click **"Post to Ledger"**
4. **Distribute**: Click **"Batch Email"** to send all PDFs to customers

---

## Configuration & Settings

Fine-tune your automated billing in **Settings**:
- **Auto-Post Rules**: Enable to automatically finalize invoices without review.
- **Grace Periods**: Define if invoices should generate *before* or *on* the due date.
- **Email Templates**: Customize the message sent with recurring invoices.

---

## FAQ

**Q: Can I change the price for a customer mid-subscription?**
A: Yes, simply edit the **Recurring Template** for that customer. Any *future* invoices will use the updated price, while past invoices remain unchanged.

**Q: What happens if a customer cancels?**
A: Mark the template as **"Inactive"** or set an **"End Date"** in the template settings to stop future billing.

**Q: Can I handle "Annual" and "Monthly" billing together?**
A: Yes, each template has its own frequency settings, allowing you to manage multiple billing cycles for the same customer.

**Q: Does it support pro-rated billing?**
A: Basic templates use fixed amounts, but advanced settings allow for partial-period calculations if configured in the ERP core.
