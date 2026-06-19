---
title: "Core Module"
description: "Foundation master data and system configuration applets required by every other BigLedger module."
weight: 10
---

## 1. Module Overview

The **Core Module** is the foundation of the entire BigLedger ecosystem. It contains the master data applets that every other module depends on — from organizational structure and chart of accounts to customer/supplier records, employee data, pricing, and tax configuration.

**No other module can function without Core.** It must be the first module implemented in any BigLedger deployment.

**Business Value:**
- Single source of truth for all master data across the organization
- Centralized configuration eliminates data duplication and inconsistency
- Role-based access through the Tenant Admin Applet ensures security from day one
- Workflow design capabilities enable custom approval chains for any business process

---

## 2. Key Concepts & Terminology

| Term | Definition |
|------|-----------|
| **Tenant** | A self-contained BigLedger account representing one business entity or organization. |
| **Organisation** | The hierarchical structure defining the company, its branches, and locations. |
| **Chart of Accounts (COA)** | The master list of all financial accounts used for recording transactions. |
| **Cashbook** | A register representing a bank account, cash drawer, or payment method used for recording monetary inflows and outflows. |
| **Pricebook** | A curated list of item prices assigned to specific customer groups, tiers, or channels. |
| **Inventory Item** | A product or service record in the item master, including SKU, pricing, tax codes, and stock settings. |
| **Doc Item** | A document-level item configuration defining how items behave within transactional documents (e.g., invoices, purchase orders). |
| **Workflow Design** | A visual rule builder that defines multi-step approval or automation chains triggered by document events. |

---

## 3. Included Applets

### Organisation & Structure

| Applet | Purpose |
|--------|---------|
| [Organisation Applet](/applets/master-data/organisation-applet/) | Define and manage the full company hierarchy — company, branches, locations, and departments. |

### Financial Foundation

| Applet | Purpose |
|--------|---------|
| [Chart of Accounts Applet](/applets/master-data/chart-of-account-applet/) | Create and manage the hierarchical account structure for all financial transactions. |
| [Cashbook Applet](/applets/master-data/cashbook-applet/) | Set up and maintain bank accounts, petty cash, and payment method registers. |
| [Tax Configuration Applet](/applets/master-data/tax-configuration-applet/) | Define tax codes, rates, and rules for sales and purchase transactions. |

### People & Partners

| Applet | Purpose |
|--------|---------|
| [Customer Maintenance Applet](/applets/master-data/customer-maintenance-applet/) | Create and manage customer master records with credit terms, addresses, and contact details. |
| [Supplier Maintenance Applet](/applets/master-data/supplier-maintenance-applet/) | Create and manage supplier/vendor master records with payment terms and banking details. |
| [Employee Maintenance Applet](/applets/master-data/employee-maintenance-applet/) | Manage employee profiles, department assignments, and HR-related data. |

### Products & Pricing

| Applet | Purpose |
|--------|---------|
| [Inventory Item Maintenance Applet](/applets/master-data/inv-item-maintenance-applet/) | Maintain the item master catalogue — SKUs, descriptions, classifications, and stock settings. |
| [Doc Item Maintenance Applet](/applets/master-data/doc-item-maintenance-applet/) | Configure document-level item behaviors including pricing rules, tax mapping, and UOM settings. |
| [Pricebook Applet](/applets/master-data/pricebook-applet/) | Create segmented price lists for different customer tiers, channels, or promotional periods. |
| [Shipping Pricebook Applet](/applets/master-data/shipping-pricebook-applet/) | Define shipping and delivery rate cards based on weight, destination, or service type. |

### System Administration

| Applet | Purpose |
|--------|---------|
| [Tenant Admin Applet](/applets/external-tenant-admin/tenant-admin-applet/) | Manage users, roles, permissions, and system-wide configurations. |
| [Workflow Design Applet](/applets/master-data/workflow-design-applet/) | Build visual approval workflows and automation rules for transactional documents. |
| [Group Maintenance Applet](/applets/master-data/group-maintenance-applet/) | Manage user groups and permission sets for role-based access control. |

---

## 4. Standard Business Workflows

### Workflow 1: New Company Setup (Day One)

```
Company Setup ──▶ Branch Setup ──▶ Location Setup ──▶ COA Import ──▶ Tax Setup ──▶ Cashbook Setup
```

**Steps:**
1. **System Admin** creates the company entity in the **Organisation Applet**.
2. Add branches (e.g., HQ, Penang Office) within the **Organisation Applet**.
3. Add locations (e.g., Main Warehouse, Retail Outlet) within the **Organisation Applet**.
4. Import the **Chart of Accounts** using a standard industry template.
5. Configure **Tax Codes** (e.g., SST @ 6%, Service Tax @ 8%) in the **Tax Configuration Applet**.
6. Create **Cashbooks** for each bank account and petty cash fund.

### Workflow 2: New Customer Onboarding

```
Customer Creation ──▶ Credit Terms ──▶ Pricebook Assignment ──▶ Ready for Sales
```

**Steps:**
1. Sales Admin creates the customer record in **Customer Maintenance Applet** with contact details and addresses.
2. Finance sets the customer's credit limit and payment terms (e.g., Net 30).
3. Sales Manager assigns the customer to the appropriate **Pricebook** tier.
4. The customer is now ready for quotations and orders in the Sales module.

### Workflow 3: New Product Launch

```
Item Creation ──▶ Doc Item Config ──▶ Pricing Setup ──▶ Tax Mapping ──▶ Stock Locations
```

**Steps:**
1. Product team creates the item in **Inventory Item Maintenance** with SKU, description, and classification.
2. **Doc Item Maintenance** is configured to set how the item behaves on invoices (tax category, UOM, discount rules).
3. Prices are set in the relevant **Pricebook** entries.
4. Tax codes are mapped in the **Tax Configuration Applet**.
5. Stock locations are assigned in the Inventory module.

---

## 5. Roles & Permissions

| Role | Primary Applets | Key Responsibilities |
|------|----------------|---------------------|
| **System Administrator** | Tenant Admin, Workflow Design, Group Maintenance | User management, permissions, system configuration, workflow setup |
| **Finance Controller** | Chart of Accounts, Cashbook, Tax Configuration | Account structure, banking setup, tax compliance |
| **Sales Administrator** | Customer Maintenance, Pricebook | Customer records, pricing tiers, credit terms |
| **Purchasing Administrator** | Supplier Maintenance | Vendor records, payment terms, supplier qualifications |
| **HR Administrator** | Employee Maintenance | Employee records, department assignments |
| **Product Manager** | Inv Item Maintenance, Doc Item Maintenance, Shipping Pricebook | Product catalogue, pricing rules, shipping rates |

---

## 6. Prerequisites / Initial Setup

The Core Module is the **first module** to be implemented. It has no external prerequisites.

### Setup Sequence

Recommended configuration order:
1. **Organization Setup** (Company details, branches, departments)
2. **Financial Foundation** (Chart of Accounts, Tax Configuration, Cashbooks)
3. **Master Data** (Customers, Suppliers, Employees, Items catalogue)
4. **System Configuration** (Tenant Admin settings, user permissions, workflow rules)

### Implementation Checklist:

- [ ] Create the company entity in the Organisation Applet
- [ ] Define at least one branch and one location
- [ ] Import or create the Chart of Accounts
- [ ] Configure all applicable tax codes
- [ ] Create at least one Cashbook (bank account)
- [ ] Set up the System Administrator user in Tenant Admin
- [ ] Create initial user roles and permission groups
- [ ] Import or create customer master records
- [ ] Import or create supplier master records
- [ ] Import or create the item catalogue
- [ ] Set up at least one Pricebook

### Configuration Best Practices & Naming Conventions

#### Naming Conventions:
- **Accounts (COA)**: Use structured numbering (e.g., 1000-1999 for Assets, 2000-2999 for Liabilities, 3000-3999 for Equity).
- **Items**: Use category-based codes (e.g., `ELEC-001` for Electronics, `FURN-001` for Furniture).
- **Customers/Suppliers**: Use systematic codes (e.g., `CUS-001`, `SUP-001`).
- **Employees**: Use department-based prefixes (e.g., `HR-001`, `FIN-001`).

#### Data Integrity:
- **Enable Audit Trails** in the Tenant Admin Applet from the start.
- **Set Up Approval Workflows** for critical master data changes (like customer credit limits or new supplier onboarding).
- **Plan naming schemes** before configuring the system to ensure scalability.

---

## 7. FAQs & Troubleshooting

**Q: Can I change the Chart of Accounts structure after going live?**
A: Yes, you can add new accounts at any time. However, renaming or deleting accounts that have transactions posted against them is restricted. Plan your COA carefully during initial setup.

**Q: How many branches and locations can I have?**
A: There is no hard limit. BigLedger supports multi-branch, multi-location setups of any scale.

**Q: A new employee was added but they can't log in. What's wrong?**
A: Employee records in **Employee Maintenance** are HR data. Login access is managed separately in the **Tenant Admin Applet**. Ensure the user has been created there with the correct role assignments.

**Q: How do I set different prices for different customer groups?**
A: Create multiple **Pricebooks** (e.g., Retail, Wholesale, VIP) and assign customers to the appropriate pricebook in their customer record.

**Q: Can one item have different tax treatments in different branches?**
A: Yes. Tax codes are configurable at the document item level and can be overridden per branch or location through the **Doc Item Maintenance Applet**.
