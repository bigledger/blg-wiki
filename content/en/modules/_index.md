---
title: Modules
description: BigLedger's comprehensive business modules - collections of applets working together
weight: 30
bookCollapseSection: false
---

BigLedger is organized into functional modules, each containing a collection of applets that work together to deliver specific business capabilities. Understanding the module-applet relationship is key to maximizing BigLedger's potential.

## Module-Applet Architecture

{{< callout type="info" >}}
**Important Concept**: Modules are logical groupings of applets. A single applet can belong to multiple modules (many-to-many relationship). For example, the Tax Configuration Applet is used by Financial Accounting, Sales, Purchasing, and E-Commerce modules.
{{< /callout >}}

### How It Works

```
┌─────────────────────────────────────────────────────┐
│                    APPLETS                          │
│  (Reusable components - single source of truth)     │
└─────────────────────────────────────────────────────┘
                         ↓ ↑
     ┌──────────────┬────────────┬──────────────┐
     │              │            │              │
┌────▼─────┐  ┌────▼─────┐ ┌───▼──────┐ ┌────▼─────┐
│   Core   │  │Financial │ │   Sales  │ │E-Commerce│
│  Module  │  │Accounting│ │   & CRM  │ │  Module  │
└──────────┘  └──────────┘ └──────────┘ └──────────┘
```

- **Applets** are the actual functional components
- **Modules** are business-focused collections of applets
- Each module documentation references the applets it uses
- Applet documentation lives in `/applets/` (no duplication)

## Module Categories

### 1. Core Module
**Foundation for all operations**
- Essential master data applets (13 applets)
- System configuration and administration
- Required by all other modules
- [Explore Core Module →](/modules/core/)

### 2. Specialized Business Modules

#### Point of Sales Module
**Complete retail store operations**
- 6 specialized POS applets
- Cashier operations and multi-outlet management
- Offline/online sync capabilities
- [Discover POS Module →](/modules/pos/)

#### CP-Commerce Module  
**Comprehensive e-commerce solution**
- All 13 Core Module applets PLUS 7 commerce applets
- Multi-channel selling and marketplace integration
- Digital-first commerce capabilities
- [Explore CP-Commerce Module →](/modules/cp-commerce/)

#### E-Invoice Module
**Electronic invoicing and compliance**
- 8 specialized e-invoicing applets
- MyInvois and PEPPOL compliance
- Automated regulatory reporting
- [Learn E-Invoice Module →](/modules/e-invoice/)

#### Accounting Module
**Advanced transaction processing**
- 25 comprehensive transaction applets
- Complete financial operations coverage
- Industry-specific accounting workflows
- [Explore Accounting Module →](/modules/accounting/)

#### Digital CRM Module
**Modern customer relationship management**
- 3 AI-powered CRM applets
- Predictive analytics and automation
- Omnichannel customer engagement
- [Discover Digital CRM →](/modules/digital-crm/)

#### IT & CE Module
**Technology and customer engagement**
- 6 specialized IT and customer engagement applets
- Service management and automation
- Digital transformation capabilities
- [Explore IT & CE Module →](/modules/it-ce/)

#### Service Industry Module
**Service-based business operations**
- 7 service-focused applets
- Project management and resource scheduling
- Professional services optimization
- [Learn Service Industry →](/modules/service-industry/)

#### Drop Shipping Module
**Drop shipping business operations**
- 2 specialized drop shipping applets
- Supplier network management
- Automated fulfillment orchestration
- [Explore Drop Shipping →](/modules/drop-shipping/)

### 3. Enterprise Solutions

#### ERP Module
**Complete enterprise resource planning**
- ALL Accounting Module applets (25)
- ALL Point of Sales Module applets (6)
- PLUS 10 additional enterprise applets (41 total)
- Ultimate business management solution
- [Discover ERP Module →](/modules/erp/)

### 4. Traditional Core Modules

#### Financial Accounting
**Standard accounting and financial management**
- General ledger and journals
- Accounts receivable/payable
- Financial reporting
- [Learn about Financial Accounting →](/modules/financial-accounting/)

#### Inventory & Warehouse
**Stock and warehouse management**
- Multi-location inventory
- Stock movements
- Warehouse operations
- [Manage Inventory →](/modules/inventory/)

#### Sales & CRM
**Customer relationship and sales management**
- Customer management
- Quotations and orders
- Sales analytics
- [Explore Sales & CRM →](/modules/crm/)

#### Membership Module
**Customer loyalty and membership program management**
- Multi-membership support per customer
- Multi-currency loyalty points system
- Points-to-cash conversion at POS
- Tier-based rewards and benefits
- [Discover Membership Module →](/modules/membership/)

#### Purchasing
**Procurement and vendor management**
- Purchase orders
- Vendor management
- Purchase analytics
- [View Purchasing →](/modules/procurement/)

#### E-Commerce
**Online sales and marketplace integration**
- Multi-channel selling
- Marketplace integration
- Website management
- [Explore E-Commerce →](/modules/ecommerce/)

### 5. Enterprise Operations

#### Human Resources
**Employee and payroll management**
- Employee records
- Payroll processing
- Leave and claims
- [HR Management →](/modules/hr/)

#### Manufacturing
**Production and assembly operations**
- Bill of materials
- Production planning
- Quality control
- [Manufacturing Guide →](/modules/manufacturing/)

#### Projects
**Project and task management**
- Project tracking
- Resource allocation
- Time tracking
- [Project Management →](/modules/projects/)

## Understanding Module Composition

Each module consists of:

### Core Applets
Applets that are essential for the module's primary function

### Shared Applets
Applets from the Core Module or other modules that provide supporting functions

### Optional Applets
Additional applets that enhance functionality but aren't required

## Example: Financial Accounting Module

```yaml
Core Applets:
  - General Ledger Applet
  - Journal Entry Applet
  - Financial Reports Applet

Shared Applets (from Core Module):
  - Chart of Accounts Applet
  - Tax Configuration Applet
  - Cashbook Applet
  - Organization Applet

Optional Applets:
  - Budget Management Applet
  - Fixed Assets Applet
  - Cost Center Applet
```

## Module Implementation Path

### Phase 1: Foundation
1. **Core Module** - Set up master data and configurations
2. **Financial Accounting** - Establish financial foundation

### Phase 2: Operations
3. **Sales & CRM** or **Purchasing** - Based on business priority
4. **Inventory & Warehouse** - If handling physical goods

### Phase 3: Expansion
5. **POS** - For retail operations
6. **E-Commerce** - For online sales
7. **Manufacturing** - For production
8. **HR & Payroll** - For employee management

## Module Selection Guide

### For Retail Businesses
- Core Module
- Financial Accounting
- POS Module
- Inventory & Warehouse
- E-Commerce (optional)

### For Wholesale/Distribution
- Core Module
- Financial Accounting
- Sales & CRM
- Purchasing
- Inventory & Warehouse

### For Service Businesses
- Core Module
- Financial Accounting
- Sales & CRM
- Projects
- HR & Payroll

### For Manufacturing
- Core Module
- Financial Accounting
- Manufacturing
- Inventory & Warehouse
- Purchasing

### For E-Commerce
- Core Module
- Financial Accounting
- E-Commerce
- Inventory & Warehouse
- Sales & CRM

## Integration Between Modules

Modules are designed to work seamlessly together:

### Data Flow
- Master data flows from Core Module to all others
- Transactions flow between operational modules
- Financial data consolidates in Financial Accounting

### Process Integration
- Sales orders (Sales) → Delivery (Warehouse) → Invoice (Financial)
- Purchase (Purchasing) → Receipt (Warehouse) → Payment (Financial)
- Online orders (E-Commerce) → Fulfillment (Warehouse) → Accounting (Financial)

## Getting Started

1. **Understand your needs** - Which modules match your business?
2. **Start with Core** - Essential foundation for all modules
3. **Add modules gradually** - Implement in phases
4. **Configure applets** - Set up the applets within each module
5. **Train users** - Module-specific training for teams

## Module vs Applet Documentation

### When to Read Module Documentation
- Understanding business processes
- Learning module capabilities
- Planning implementation
- Training by department

### When to Read Applet Documentation
- Detailed configuration steps
- Technical specifications
- Troubleshooting specific features
- Understanding cross-module usage

## Related Resources

### Applet Library
- [Browse All Applets](/applets/) - Complete applet documentation
- [Applet Directory](/applets/applet-directory/) - Searchable applet list
- [Applet Store](/applets/applet-store/) - Add-on applets

### Implementation Guides
- [Getting Started Guide](/user-guide/introduction/)
- [Implementation Best Practices](/guides/advanced/integration-best-practices/)
- [Role-Based Training](/guides/roles/)

{{< callout type="tip" >}}
**Remember**: Modules are business-focused groupings. The same applet can serve multiple modules. Always refer to the applet documentation in `/applets/` for detailed configuration and features.
{{< /callout >}}