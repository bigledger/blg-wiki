---
title: "Core Module"
description: "Essential applets that form the foundation of BigLedger ERP system"
weight: 10
---


The Core Module contains fundamental applets that are required by all other modules in BigLedger. These applets provide the basic infrastructure and master data management capabilities that the entire system depends on.

## Overview

The Core Module is the foundation of BigLedger ERP, providing:
- **Master Data Management** - Centralized management of critical business data
- **System Configuration** - Essential settings and configurations
- **Basic Operations** - Fundamental business operations
- **Data Integration** - Shared data across all modules

{{< callout type="info" >}}
**Important**: Core Module applets are prerequisites for all other modules. They must be properly configured before implementing other business modules.
{{< /callout >}}

## Core Applets

### 1. Chart of Accounts Applet
**Purpose**: Define and manage the complete chart of accounts structure
- Account categories and types
- Account hierarchies
- Financial statement mapping
- Multi-currency support

**Used by**: All financial transactions across every module

### 2. Tenant Admin Applet
**Purpose**: System-wide administration and configuration
- User management and permissions
- System settings
- Security configuration
- Audit settings

**Used by**: System administrators for overall system management

### 3. Organization Applet
**Purpose**: Define organizational structure
- Company setup
- Branch configuration
- Department structure
- Cost center management

**Used by**: All modules for organizational hierarchy

### 4. Cashbook Applet
**Purpose**: Cash and bank account management
- Cash account setup
- Bank account configuration
- Payment methods
- Cash flow tracking

**Used by**: All modules handling financial transactions

### 5. Document Item Maintenance Applet
**Purpose**: Manage document-based items and services
- Service items
- Non-inventory items
- Document templates
- Billing items

**Used by**: Service-based operations, professional services

### 6. Tax Configuration Applet
**Purpose**: Complete tax setup and management
- GST/SST configuration
- Tax codes and rates
- Tax groups
- Compliance rules

**Used by**: All modules generating taxable transactions

### 6a. Tax Config Applet
**Purpose**: Advanced tax configuration and system-wide settings
- Complex tax rule definitions
- GL account mapping for taxes
- Effective date management
- Regulatory compliance integration

**Used by**: Finance administrators and compliance officers

### 6b. SST Applet
**Purpose**: Malaysian SST reporting and compliance
- SST-02 form generation
- Taxable period management
- Transaction-level tax audits

**Used by**: Malaysian tax compliance teams

### 7. Inventory Item Maintenance Applet
**Purpose**: Product and inventory master data
- Product creation
- Item categories
- Units of measure
- Stock settings

**Used by**: All inventory-related modules

### 8. Customer Maintenance Applet
**Purpose**: Customer master data management
- Customer profiles
- Credit limits
- Payment terms
- Customer categories

**Used by**: Sales, CRM, AR, and customer-facing modules

### 9. Supplier Maintenance Applet
**Purpose**: Vendor/supplier master data
- Supplier profiles
- Payment terms
- Purchase agreements
- Supplier categories

**Used by**: Purchasing, AP, and procurement modules

### 10. Employee Maintenance Applet
**Purpose**: Employee master records
- Employee profiles
- Department assignments
- Roles and permissions
- Compensation data

**Used by**: HR, Payroll, and employee-related modules

## Dependencies

### Module Dependencies
All BigLedger modules depend on Core Module applets:

| Module | Core Dependencies |
|--------|------------------|
| **Financial Accounting** | Chart of Accounts, Tax Configuration, Cashbook |
| **Sales & CRM** | Customer Maintenance, Tax Configuration, Doc Item |
| **Purchasing** | Supplier Maintenance, Tax Configuration |
| **Inventory** | Inv Item Maintenance, Organization |
| **HR & Payroll** | Employee Maintenance, Organization |
| **POS** | Customer, Inv Item, Cashbook, Tax |
| **E-Commerce** | Customer, Inv Item, Tax, Organization |

### Setup Sequence
Recommended configuration order:

1. **Organization Setup**
   - Company details
   - Branch structure
   - Departments

2. **Financial Foundation**
   - Chart of Accounts
   - Tax Configuration
   - Cashbook setup

3. **Master Data**
   - Customers
   - Suppliers
   - Employees
   - Items (Inventory/Document)

4. **System Configuration**
   - Tenant Admin settings
   - User permissions
   - Workflow rules

## Configuration Best Practices

### Initial Setup
1. **Plan your structure** before configuration
2. **Use consistent coding** across all master data
3. **Set up test data** before going live
4. **Document configurations** for reference

### Naming Conventions
- **Accounts**: Use structured numbering (1000-1999 Assets, 2000-2999 Liabilities)
- **Items**: Category-based codes (ELEC-001, FURN-001)
- **Customers/Suppliers**: Systematic codes (CUS-001, SUP-001)
- **Employees**: Department-based (HR-001, FIN-001)

### Data Integrity
- Enable **audit trails** from the start
- Set up **approval workflows** for master data changes
- Regular **data validation** checks
- Implement **change control** procedures

## Integration Points

### Cross-Module Data Flow

```
Core Module (Master Data)
    ↓
┌─────────────┬──────────────┬──────────────┬──────────────┐
│  Financial  │   Sales      │  Inventory   │     HR       │
│  Accounting │   & CRM      │  & Warehouse │  & Payroll   │
└─────────────┴──────────────┴──────────────┴──────────────┘
    ↓              ↓              ↓              ↓
         Transactional Data (Orders, Invoices, etc.)
```

### API Integration
Core Module applets provide APIs for:
- Master data synchronization
- Real-time validation
- Data export/import
- Third-party integration

## Common Use Cases

### Multi-Branch Operations
- Centralized chart of accounts
- Branch-specific cashbooks
- Consolidated reporting
- Inter-branch transactions

### Multi-Currency Business
- Currency configuration in Organization
- Exchange rates in Financial settings
- Multi-currency in Customer/Supplier
- Currency-specific pricing

### Compliance Requirements
- GST/SST setup in Tax Configuration
- Audit trails in Tenant Admin
- Statutory reports from Chart of Accounts
- Compliance validations

## Troubleshooting

### Common Issues

**Cannot create transactions**
- Verify Chart of Accounts is complete
- Check Tax Configuration
- Ensure Cashbook is set up

**Master data not appearing**
- Check Organization structure
- Verify user permissions
- Confirm data status (Active/Inactive)

**Integration failures**
- Validate master data completeness
- Check field mappings
- Review API permissions

## Related Documentation

### Setup Guides
- [Organization Setup Guide](/applets/organization-applet/)
- [Chart of Accounts Configuration](/guides/accounting-guides/chart-of-accounts-setup/)
- [Tax Configuration Guide](/applets/tax-configuration-applet/)
- [Tax Config Guide](/applets/tax-config-applet/)
- [SST Guide](/applets/sst-applet/)

### Module Documentation
- [Financial Accounting Module](/modules/financial-accounting/)
- [Inventory Module](/modules/inventory/)
- [Sales & CRM Module](/modules/crm/)

### Advanced Topics
- [Multi-Entity Setup](/guides/advanced/)
- [API Integration](/developers/api-reference/)
- [Data Migration](/guides/)

## Next Steps

After configuring Core Module applets:

1. **Set up Financial Accounting** for financial operations
2. **Configure Sales/Purchasing** for trading operations
3. **Implement Inventory** for stock management
4. **Add specialized modules** based on business needs

{{< callout type="tip" >}}
**Pro Tip**: Take time to properly configure Core Module applets. This foundation determines the efficiency and scalability of your entire BigLedger implementation.
{{< /callout >}}