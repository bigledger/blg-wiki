---
title: "Accounts Receivable Applet"
description: "Customer billing, collections, and receivables management for BigLedger"
tags:
- accounting-module
- accounts-receivable
- customer-billing
- collections
- credit-management
weight: 101
---

## Purpose and Overview

{{< callout type="warning" >}}
**TODO**: This applet documentation needs detailed expansion. This is a placeholder with basic structure and key information.
{{< /callout >}}

The Accounts Receivable Applet manages all customer billing, payment processing, and collections activities in BigLedger's Accounting Module, providing comprehensive receivables management and customer credit control.

### Primary Functions
- **Customer Invoicing** - Invoice generation and delivery
- **Payment Processing** - Customer payment recording and matching
- **Collections Management** - Overdue account management
- **Credit Control** - Customer credit limits and monitoring
- **Aging Analysis** - Receivables aging and reporting

## Key Features

### TODO: Expand Key Features Section
- Automated invoice generation
- Multiple payment method support
- Customer statement generation
- Credit limit monitoring
- Collection workflow automation

## How Customer Balances Update

When you record a customer payment, apply a credit note, or knock off an invoice against a payment (contra), the affected documents' outstanding balances are recalculated **in the background** — usually within seconds, occasionally a few minutes during peak load. What this means in practice:

- A balance that has not moved immediately after you apply or void a knock-off is **not an error** — refresh the screen after a moment.
- Do **not** re-enter a payment because the balance "didn't update"; re-entering creates a duplicate settlement. Refresh first.
- If an outstanding balance is still stale **15 minutes** after the settlement, report it to support with the document numbers involved — that is a fault to investigate, not a step you missed.
- Finalising an invoice and seeing it in the General Ledger are two steps: the invoice's journal is generated in the background moments after Final. See the [Posting Status Explained guide](/guides/accounting-guides/document-posting-status/) if a finalised document seems to be missing from the ledger.

## Integration Points

### Core Module Dependencies
- **[Customer Maintenance Applet](/applets/customer-maintenance-applet/)** - Customer master data
- **[Chart of Account Applet](/applets/chart-of-account-applet/)** - Account mapping
- **[Tax Configuration Applet](/applets/tax-configuration-applet/)** - Invoice tax calculations

## Related Applets

### TODO: Document Related Applets
- General Ledger Applet
- Sales Order Applet
- Credit Management Applet
- Collection Management Applet

{{< callout type="info" >}}
**Documentation Status**: This applet requires comprehensive documentation including detailed features, configuration guides, use cases, and implementation examples.
{{< /callout >}}