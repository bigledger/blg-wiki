---
title: "Core Module"
description: "Foundation master data and system configuration applets required by every other BigLedger module."
weight: 10
---

## 1. Module Overview

The **Core Module** is the foundation of the entire BigLedger ecosystem. It contains the master data and configuration applets that every other module depends on — organization structure, chart of accounts, customers, suppliers, employees, products, pricing, tax, and system administration.

**No other module can function without Core. It must be implemented first.**

**Business Value:**
- Single source of truth for all master data across the organization
- Centralized configuration eliminates duplication and inconsistency
- Role-based access via Tenant Admin enforces security from day one
- Visual workflow design enables custom approval chains for any business process

---

## 2. Key Concepts & Terminology

| Term | Definition |
|------|-----------|
| **Tenant** | A self-contained BigLedger account representing one business entity. |
| **Organisation** | The hierarchical structure defining the company, its branches, and locations. |
| **Chart of Accounts (COA)** | The master list of all financial accounts used for recording transactions. |
| **Cashbook** | A register representing a bank account, cash drawer, or payment method. |
| **Pricebook** | A curated price list assigned to specific customer groups, tiers, or channels. |
| **Inventory Item** | A product or service record in the item master (SKU, pricing, tax, stock settings). |
| **Doc Item** | Document-level item configuration controlling how items behave on transactional documents. |
| **Workflow Design** | A visual rule builder defining multi-step approval or automation chains. |

---

## 3. Applet Dependency Map

Core's applets stack into four layers. Each layer depends on the one above it — configure top-down during implementation.

![Core Module Applet Dependency Map](/images/core/applet-dependency-map.png)

Data flows downward — every layer below depends on what is configured above.

---

## 4. The Applet Layers Explained

### Layer 1 — Organisation Shell

The skeleton of *what exists* in your business and *who can access it*.

| Applet | Purpose |
|--------|---------|
| [Organisation Applet](/applets/master-data/organisation-applet/) | Define the company hierarchy — entity, branches, locations, departments. |
| [Tenant Admin Applet](/applets/external-tenant-admin/tenant-admin-applet/) | Manage users, roles, permissions, and system-wide configuration. |

### Layer 2 — Financial Foundation

How money is classified, stored, and taxed. Required before any financial transaction can post.

| Applet | Purpose |
|--------|---------|
| [Chart of Accounts Applet](/applets/master-data/chart-of-account-applet/) | Build the hierarchical account structure for all financial transactions. |
| [Cashbook Applet](/applets/master-data/cashbook-applet/) | Set up bank accounts, petty cash, and payment method registers. |
| [Tax Configuration Applet](/applets/master-data/tax-configuration-applet/) | Define tax codes, rates, and rules for sales and purchase transactions. |

### Layer 3 — Master Entities

Who you do business with.

| Applet | Purpose |
|--------|---------|
| [Customer Maintenance Applet](/applets/master-data/customer-maintenance-applet/) | Create customer master records with credit terms and contacts. |
| [Supplier Maintenance Applet](/applets/master-data/supplier-applet-1/) | Manage supplier/vendor master records with payment terms and banking. |
| [Employee Maintenance Applet](/applets/master-data/employee-applet/) | Manage employee profiles and department assignments. |

### Layer 4 — Product & Pricing

What you sell and at what price. Items flow from master record to document behavior to price list.

| Applet | Purpose |
|--------|---------|
| [Inventory Item Maintenance Applet](/applets/master-data/inv-item-maintenance-applet/) | Maintain the item master catalogue — SKUs, descriptions, classifications. |
| [Doc Item Maintenance Applet](/applets/master-data/doc-item-maintenance-applet/) | Configure document-level item behavior — tax mapping, UOM, discount rules. |
| [Pricebook Applet](/applets/master-data/pricebook-applet/) | Create segmented price lists per customer tier or channel. |
| [Shipping Pricebook Applet](/applets/master-data/shipping-pricebook-applet/) | Define shipping and delivery rate cards. |

---

## 5. Who Uses This Module?

Six roles use the Core Module — each owns a specific layer of master data.

| Role | Owns |
|------|------|
| **System Administrator** | Tenant configuration, users, workflows |
| **Finance Controller** | Financial foundation (COA, Cashbook, Tax) |
| **Sales Administrator** | Customer records and pricing tiers |
| **Purchasing Administrator** | Supplier records and payment terms |
| **HR Administrator** | Employee records |
| **Product Manager** | Item catalogue, doc item behavior, pricebooks |

---

## 6. Role-Based User Journeys

### Journey: System Administrator (Day-One Setup)

```
[Tenant Admin] ──▶ [Organisation] ──▶ [Group Maintenance] ──▶ [Workflow Design]
```

1. Open [Tenant Admin Applet](/applets/external-tenant-admin/tenant-admin-applet/) and create the System Administrator account.
2. Move to [Organisation Applet](/applets/master-data/organisation-applet/) — create the company entity, branches, and locations.
3. Use [Group Maintenance Applet](/applets/master-data/group-maintenance-V2-applet/) to define role groups (Finance, Sales, Procurement, etc.).
4. Configure approval chains in [Workflow Design Applet](/applets/master-data/workflow-design-applet/).

### Journey: Finance Controller (Financial Skeleton)

```
[Chart of Accounts] ──▶ [Tax Configuration] ──▶ [Cashbook]
```

1. Import or build the account tree in [Chart of Accounts Applet](/applets/master-data/chart-of-account-applet/).
2. Set up tax codes and rates in [Tax Configuration Applet](/applets/master-data/tax-configuration-applet/).
3. Register every bank account and petty cash fund in [Cashbook Applet](/applets/master-data/cashbook-applet/).

### Journey: Sales Administrator (Customer Onboarding)

```
[Customer Maintenance] ──▶ Credit terms ──▶ [Pricebook] ──▶ Ready for Sales Module
```

1. Create the customer in [Customer Maintenance Applet](/applets/master-data/customer-maintenance-applet/).
2. Set credit limit and payment terms (Net 30, etc.).
3. Assign the customer to the right tier in [Pricebook Applet](/applets/master-data/pricebook-applet/).

### Journey: Purchasing Administrator (Vendor Onboarding)

```
[Supplier Maintenance] ──▶ Payment terms ──▶ Banking ──▶ Ready for Purchasing Module
```

1. Create the supplier in [Supplier Maintenance Applet](/applets/master-data/supplier-applet-1/).
2. Set payment terms and banking details.

### Journey: Product Manager (New Product Launch)

```
[Inv Item Maintenance] ──▶ [Doc Item Maintenance] ──▶ [Pricebook] ──▶ Tax mapping
```

1. Create the SKU in [Inventory Item Maintenance Applet](/applets/master-data/inv-item-maintenance-applet/).
2. Configure document behavior in [Doc Item Maintenance Applet](/applets/master-data/doc-item-maintenance-applet/) — tax category, UOM, discount rules.
3. Add prices in the relevant tiers in [Pricebook Applet](/applets/master-data/pricebook-applet/).
4. Confirm tax mapping in [Tax Configuration Applet](/applets/master-data/tax-configuration-applet/).

### Journey: HR Administrator

```
[Employee Maintenance] ──▶ Hands off to HR-Payroll Module
```

Create and maintain employee profiles in [Employee Maintenance Applet](/applets/master-data/employee-applet/). Downstream HR processes (payroll, claims) consume these records.

---

## 7. Cross-Module Touchpoints

| Direction | What Flows |
|-----------|-----------|
| **Receives from** | Nothing — Core is the root of every implementation. |
| **Sends to** | Finance (COA, Cashbook, Tax), Sales (Customers, Pricebooks), Purchasing (Suppliers), Inventory (Items), HR-Payroll (Employees), POS, E-Commerce, Claims, Manufacturing — **every module**. |

---

## 8. Prerequisites & Setup

Core has **no external prerequisites** — it is module #1 in every BigLedger implementation.

### Recommended Setup Sequence

1. **Organisation Shell** — company, branches, locations, Tenant Admin user
2. **Financial Foundation** — COA, Tax Codes, Cashbooks
3. **Master Entities** — Customers, Suppliers, Employees
4. **Product & Pricing** — Items, Doc Item rules, Pricebooks
5. **Automation Glue** — Workflows, Permission Groups

### Implementation Checklist

- [ ] Create the company entity in the Organisation Applet
- [ ] Define at least one branch and one location
- [ ] Import or build the Chart of Accounts
- [ ] Configure all applicable tax codes
- [ ] Create at least one Cashbook
- [ ] Create the System Administrator in Tenant Admin
- [ ] Set up initial user roles and permission groups
- [ ] Import or create customer master records
- [ ] Import or create supplier master records
- [ ] Import or create the item catalogue
- [ ] Set up at least one Pricebook

### Naming Conventions

- **Accounts (COA):** structured numbering — `1000-1999` Assets, `2000-2999` Liabilities, `3000-3999` Equity
- **Items:** category-based codes — `ELEC-001`, `FURN-001`
- **Customers / Suppliers:** systematic codes — `CUS-001`, `SUP-001`
- **Employees:** department-prefixed — `HR-001`, `FIN-001`

### Data Integrity

- Enable Audit Trails in Tenant Admin from day one
- Set up approval workflows for critical master changes (credit limits, new suppliers)
- Plan naming schemes *before* configuring — retroactive renames are painful

---

## 9. FAQs & Troubleshooting

**Q: Can I change the Chart of Accounts structure after going live?**
A: You can add new accounts at any time. Renaming or deleting accounts that already have posted transactions is restricted. Plan your COA carefully during initial setup.

**Q: How many branches and locations can I have?**
A: There is no hard limit. BigLedger supports multi-branch, multi-location setups of any scale.

**Q: A new employee was added but they can't log in. What's wrong?**
A: [Employee Maintenance Applet](/applets/master-data/employee-applet/) holds HR data. Login access is managed separately in [Tenant Admin Applet](/applets/external-tenant-admin/tenant-admin-applet/). Create the user there with the correct role assignments.

**Q: How do I set different prices for different customer groups?**
A: Create multiple pricebooks (Retail, Wholesale, VIP) in [Pricebook Applet](/applets/master-data/pricebook-applet/) and assign customers to the correct one in their customer record.

**Q: Can one item have different tax treatments in different branches?**
A: Yes. Tax codes are configurable at the document item level and can be overridden per branch through [Doc Item Maintenance Applet](/applets/master-data/doc-item-maintenance-applet/).
