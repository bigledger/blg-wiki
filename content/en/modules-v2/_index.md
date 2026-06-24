---
title: "Modules Documentation"
description: "Comprehensive, standardized module documentation for the BigLedger ERP system."
weight: 999
bookHidden: true
---

<div style="margin-bottom: 2rem;">
{{< callout type="warning" >}}
**Work in Progress** — This section is currently being updated to standardize module layouts, roles, and workflows. We will be updating this content from time to time.
{{< /callout >}}
</div>

## BigLedger Module Documentation

BigLedger is organized into functional **modules** — each module is a business-focused collection of **applets** that work together to deliver specific operational capabilities. This documentation standardizes every module page to include business workflows, role mappings, and applet cross-references.

### Module–Applet Architecture

```
┌─────────────────────────────────────────────────────┐
│                    APPLETS                          │
│  (Reusable components - single source of truth)     │
└─────────────────────────────────────────────────────┘
                         ↓ ↑
     ┌──────────────┬────────────┬──────────────┐
     │              │            │              │
┌────▼─────┐  ┌────▼─────┐ ┌───▼──────┐ ┌────▼─────┐
│   Core   │  │Financial │ │   Sales  │ │Inventory │
│  Module  │  │Accounting│ │   & CRM  │ │ & Whse   │
└──────────┘  └──────────┘ └──────────┘ └──────────┘
```

- **Applets** are the actual functional components (single source of truth)
- **Modules** are business-focused collections of applets
- A single applet can belong to multiple modules (many-to-many relationship)

---

## All Modules

### Foundation

{{< cards >}}
  {{< card link="/modules-v2/core/" title="Core Module" subtitle="13 master data applets — the foundation for all operations" >}}
  {{< card link="/modules-v2/financial-accounting/" title="Financial Accounting" subtitle="Ledger, journals, vouchers, bank reconciliation, and budgetary controls" >}}
{{< /cards >}}

### Revenue & Customer Operations

{{< cards >}}
  {{< card link="/modules-v2/sales-crm/" title="Sales & CRM" subtitle="Quote-to-Cash lifecycle, commission tracking, and cashier operations" >}}
  {{< card link="/modules-v2/pos/" title="Point of Sales" subtitle="Retail counter operations, POS terminals, and end-of-day reconciliation" >}}
  {{< card link="/modules-v2/ecommerce/" title="E-Commerce" subtitle="Multi-channel online selling with marketplace integration" >}}
  {{< card link="/modules-v2/membership/" title="Membership & Loyalty" subtitle="Customer loyalty programs, points currency, and voucher management" >}}
{{< /cards >}}

### Supply Chain & Operations

{{< cards >}}
  {{< card link="/modules-v2/purchasing/" title="Purchasing" subtitle="Purchase-to-Pay lifecycle from requisition to invoice matching" >}}
  {{< card link="/modules-v2/inventory/" title="Inventory & Warehouse" subtitle="Stock tracking, transfers, warehouse bin management, and replenishment" >}}
  {{< card link="/modules-v2/manufacturing/" title="Manufacturing" subtitle="Production planning, shop floor execution, and job order management" >}}
{{< /cards >}}

### Compliance & Specialized

{{< cards >}}
  {{< card link="/modules-v2/e-invoice/" title="E-Invoice & PEPPOL" subtitle="MyInvois and PEPPOL electronic invoicing compliance" >}}
  {{< card link="/modules-v2/claims/" title="Claims Management" subtitle="Employee expense claims and reimbursement cycles" >}}
  {{< card link="/modules-v2/hr-payroll/" title="HR & Payroll" subtitle="Employee records, attendance, payroll processing, and leave management" >}}
  {{< card link="/modules-v2/crm-digital/" title="Digital CRM" subtitle="AI-powered customer analytics, engagement, and events management" >}}
{{< /cards >}}

---

## Standard Structure

Every module page follows the same **7-section format**:

1. **Module Overview** — Business value and core function
2. **Key Concepts & Terminology** — Domain glossary
3. **Included Applets** — Every applet linked with a one-sentence summary
4. **Standard Business Workflows** — Cross-applet flows showing real processes
5. **Roles & Permissions** — Who uses what
6. **Prerequisites / Initial Setup** — Go-live checklist
7. **FAQs & Troubleshooting** — Common real-world issues
