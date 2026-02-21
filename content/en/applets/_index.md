---
title: Applets and Workflows
description: Comprehensive guide to BigLedger applets and workflow automation
weight: 1
bookCollapseSection: false
tags:
- applets
- workflows
- automation
---


BigLedger's modular architecture is built on applets - reusable components that provide specific business functionality. Each applet can be used by multiple modules, ensuring consistency across your entire system.

## Understanding Applets

{{< callout type="info" >}}
**Important**: Applets have a many-to-many relationship with modules. For example, the Tax Configuration Applet is used by Financial Accounting, Sales, Purchasing, and E-Commerce modules. This design eliminates duplication and ensures consistent behavior across the system.
{{< /callout >}}

### Key Characteristics
- **Reusable** - One applet serves multiple modules
- **Configurable** - Customize to your business needs
- **Integrated** - Seamlessly work together
- **Independent** - Can be updated without affecting others

## Applet Resources

### Complete Applet Reference
- **[Complete Applet Catalog](/applets/applet-catalog/)** - Comprehensive directory of all BigLedger applets organized by module
- **[Applet Directory](/applets/applet-directory/)** - Searchable applet marketplace and installation guide
- **[Applet Store](/applets/applet-store/)** - Marketplace for additional applets and extensions

### Featured Applet Categories

#### Core Module (13 Essential Applets)
Foundation applets required by all other modules:
- **[Tenant Admin Applet](/applets/tenant-admin-applet/)** - System administration and configuration
- **[Chart of Accounts Applet](/applets/chart-of-account-applet/)** - Financial account structure
- **[Organization Applet](/applets/organization-applet/)** - Company and organizational structure
- **[Customer Maintenance Applet](/applets/customer-maintenance-applet/)** - Customer master data
- **[Supplier Maintenance Applet](/applets/supplier-maintenance-applet/)** - Vendor master data
- **[Employee Maintenance Applet](/applets/employee-maintenance-applet/)** - Employee records
- **[Tax Configuration Applet](/applets/tax-configuration-applet/)** - Tax setup and compliance
- **[Tax Config Applet](/applets/tax-config-applet/)** - Advanced tax configuration
- **[SST Applet](/applets/sst-applet/)** - Malaysian SST reporting
- **[View All Core Applets →](/applets/applet-catalog/#core-module-applets-13-applets)**

#### Financial & Accounting
- **[General Ledger Applet](/applets/general-ledger-applet/)** - Core financial transactions
- **[Bank Reconciliation Applet](/applets/bank-reconciliation-applet/)** - Automated bank statement matching
- **[Internal Receipt Voucher Applet](/applets/internal-receipt-voucher-applet/)** - Manage receipts, payments, and contras
- **[Debtor and Creditor Report Applet](/applets/debtor-and-creditor-report-applet/)** - AR/AP reporting and analysis

#### Inventory & Operations
- **[Stock Take Applet](/applets/stock-take-applet/)** - Digital inventory counting and management
- **[Stock Balance Applet](/applets/stock-balance-applet/)** - Real-time inventory tracking
- **[Internal Stock Adjustment Applet](/applets/internal-stock-adjustment-applet/)** - Inventory corrections
- **[Production Planning & Monitoring Applet](/applets/production-planning-and-monitoring-applet/)** - Manufacturing planning and job order management
- **[Manufacturing Operation Applet](/applets/manufacturing-operation-applet/)** - Shop floor execution and production tracking
- **[Process Monitoring Applet](/applets/process-monitoring-applet/)** - Business process tracking

#### Customer Engagement
- **[Team Maintenance Applet](/applets/team-maintenance-applet/)** - Team structure and management
- **[Membership Admin Console Applet](/applets/membership-admin-console-applet/)** - Customer loyalty programs
- **[Unified Contact Center Applet](/applets/unified-contact-center-ucc-applet/)** - Customer service platform

#### Pricing & Commerce
- **[Pricebook Applet](/applets/pricebook-applet/)** - Advanced pricing management
- **[EcomSync Related Applets](/applets/90-ecomsync-related-applets/)** - E-commerce synchronization

## Module Integration

Applets are designed with a many-to-many relationship with modules:
