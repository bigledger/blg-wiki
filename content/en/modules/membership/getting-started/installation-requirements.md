---
title: "Installation Requirements"
description: "Comprehensive checklist of Core Module dependencies, required applets, and system requirements"
weight: 30
---

Before implementing the Membership Module, verify all prerequisites are met. This comprehensive checklist ensures smooth deployment and prevents configuration issues.

## Overview

The Membership Module builds upon BigLedger's Core Module foundation. Proper configuration of core applets is essential for membership functionality. This guide provides a systematic verification process for all dependencies.

**Estimated Review Time:** 30-60 minutes

**Target Audience:** System administrators, implementation teams, technical consultants

## Dependency Hierarchy

Understanding the dependency structure helps prioritize configuration:

```
Core Module Foundation
├── Organization Applet (Required)
├── Customer Maintenance Applet (Required)
├── Doc Item Maintenance Applet (Required)
└── Pricebook Applet (Required)

Membership Module Core
├── Membership Points Currency (Required)
├── Membership Program Applet (Required)
└── Membership Admin Console (Required)

Optional Integration Modules
├── Point of Sale Module (Recommended)
├── E-Commerce Module (Optional)
├── Financial Accounting Module (Recommended)
└── Sales & CRM Module (Optional)
```

## Core Module Requirements

These Core Module applets must be configured before Membership Module setup.

### 1. Organization Applet

**Status:** Required

**Purpose:** Defines company structure, locations, and organizational hierarchy

**Verification Checklist:**

- [ ] **Organization Applet installed** and accessible
- [ ] **At least one company entity** created and active
- [ ] **Primary operating location** configured
- [ ] **Branch/location hierarchy** defined (if multi-location)
- [ ] **Currency settings** configured for local operations
- [ ] **Fiscal calendar** established

**Configuration Validation:**

Navigate to **Organization Applet** and verify:

```
Company Information:
✓ Legal entity name
✓ Registration numbers
✓ Primary business address
✓ Contact information

Location Setup:
✓ At least one active location
✓ Location codes assigned
✓ Operating hours defined (if needed)
✓ Location type specified

Settings:
✓ Base currency configured
✓ Time zone set correctly
✓ Date format preferences
```

**Why This Matters:**
Memberships are location-aware. Multi-location businesses need proper organization structure for cross-location point earning and redemption.

**Reference:** [Organization Applet Documentation](/applets/organization-applet/)

### 2. Customer Maintenance Applet

**Status:** Required

**Purpose:** Manages customer master data and member account linkages

**Verification Checklist:**

- [ ] **Customer Maintenance Applet installed** and accessible
- [ ] **Customer data structure** defined (required fields)
- [ ] **Customer numbering scheme** established
- [ ] **Customer groups/categories** configured (optional but recommended)
- [ ] **Custom fields** for membership data (if needed)
- [ ] **Duplicate detection** rules configured

**Configuration Validation:**

Access **Customer Maintenance Applet** and confirm:

```
Customer Master Data:
✓ Customer code format defined
✓ Required fields identified
✓ Contact information structure (phone, email)
✓ Address format configured

Customer Grouping:
✓ Customer types/categories defined
✓ Segmentation fields available
✓ Search and filter capabilities

Data Quality:
✓ Duplicate checking enabled
✓ Validation rules active
✓ Data format standards enforced
```

**Why This Matters:**
Each membership is linked to a customer record. Clean, well-structured customer data is essential for effective membership management.

**Important Notes:**
- One customer record can have **multiple memberships**
- Customer data quality directly impacts member experience
- Ensure adequate fields for member communications (email, mobile)

**Reference:** [Customer Maintenance Applet Documentation](/applets/customer-maintenance-applet/)

### 3. Doc Item Maintenance Applet

**Status:** Required

**Purpose:** Defines membership products, reward items, and redeemable services

**Verification Checklist:**

- [ ] **Doc Item Maintenance Applet installed** and accessible
- [ ] **Item numbering scheme** established
- [ ] **FI-ITEM (Financial Item) category** available
- [ ] **Item master data structure** defined
- [ ] **GL account mapping** configured for financial items
- [ ] **Tax configuration** linked to items

**Configuration Validation:**

Navigate to **Doc Item Maintenance** and verify:

```
Item Setup:
✓ Item code format standardized
✓ Item types configured (especially FI-ITEM)
✓ Description field standards
✓ Unit of measure defined

Financial Integration:
✓ GL account assignments possible
✓ Revenue accounts identified
✓ Tax code linkage functional

Item Categories:
✓ Membership products category
✓ Reward items category (if applicable)
✓ Service items configured
```

**Why This Matters:**
Memberships are represented as FI-ITEM (Financial Item) products. Proper item maintenance enables:
- Membership fee processing
- Reward catalog management
- Points redemption for products/services
- Financial tracking of membership revenue

**Membership-Specific Items to Create:**
- Membership enrollment products (free or paid)
- Renewal products (if applicable)
- Upgrade/downgrade products
- Redeemable reward items

**Reference:** [Doc Item Maintenance Applet Documentation](/applets/doc-item-maintenance-applet/)

### 4. Pricebook Applet

**Status:** Required

**Purpose:** Manages member-specific pricing and tier-based discounts

**Verification Checklist:**

- [ ] **Pricebook Applet installed** and accessible
- [ ] **Standard pricing structure** configured
- [ ] **Price lists** created for base pricing
- [ ] **Discount mechanisms** understood
- [ ] **Member pricing capability** verified
- [ ] **Effective dating** functionality available

**Configuration Validation:**

Access **Pricebook Applet** and confirm:

```
Pricing Structure:
✓ Base price list configured
✓ Pricing by customer group possible
✓ Tier-based pricing capability
✓ Effective date controls

Discount Configuration:
✓ Percentage discounts supported
✓ Fixed amount discounts available
✓ Member-specific pricing enabled
✓ Override capabilities defined

Price Management:
✓ Bulk price updates possible
✓ Price history maintained
✓ Special pricing rules configurable
```

**Why This Matters:**
Pricebook enables tier-based benefits—Gold members get better pricing than Bronze members. This drives tier progression and program value.

**Membership Applications:**
- Standard member pricing (e.g., 5% discount)
- Premium member pricing (e.g., 15% discount)
- VIP member pricing (e.g., 25% discount)
- Member-exclusive product pricing

**Reference:** [Pricebook Applet Documentation](/applets/pricebook-applet/)

### 5. Tax Configuration Applet

**Status:** Highly Recommended

**Purpose:** Manages tax calculations for membership fees and redemptions

**Verification Checklist:**

- [ ] **Tax Configuration Applet** accessible
- [ ] **Tax codes** configured for your jurisdiction
- [ ] **Tax rates** accurate and current
- [ ] **Tax exemptions** defined (if applicable)
- [ ] **Membership fee tax treatment** determined
- [ ] **Points redemption tax rules** established

**Configuration Validation:**

```
Tax Setup:
✓ Primary tax codes configured (GST, SST, VAT, Sales Tax)
✓ Tax rates accurate
✓ Effective dates set correctly
✓ Tax calculations tested

Membership Tax Rules:
✓ Membership fee tax treatment defined
✓ Reward redemption tax handling configured
✓ Tax-exempt scenarios identified
```

**Why This Matters:**
Tax treatment varies by jurisdiction and membership type. Proper configuration ensures compliance and accurate financial reporting.

## Membership Module Applets

Core applets specific to the Membership Module.

### 1. Membership Points Currency Applet

**Status:** Required

**Purpose:** Creates and manages loyalty point currencies

**Installation:**

1. Navigate to **Applet Store** or **Applet Management**
2. Search for "Membership Points Currency" or "PTS CCY Module"
3. Click **Install** or **Enable**
4. Verify applet appears in available applets list

**Verification Checklist:**

- [ ] **Applet installed** successfully
- [ ] **Access permissions** granted to administrators
- [ ] **Create currency** function tested
- [ ] **Edit/delete currency** capabilities verified
- [ ] **Currency listing** displays correctly

**Initial Configuration:**

You'll configure actual point currencies during setup, but verify the applet is ready:

```
Test Currency Creation:
1. Open PTS CCY Module
2. Click "+" to create new currency
3. Enter test data:
   - Currency Code: TEST
   - Currency Name: Test Points
4. Verify saves successfully
5. Delete test currency
```

**Reference:** [Membership Points Currency Documentation](/applets/membership-points-currency/)

### 2. Membership Program Applet

**Status:** Required

**Purpose:** Central configuration for programs, tiers, earning rules, and redemption

**Installation:**

1. Access **Applet Store**
2. Locate "Membership Program Applet"
3. Install and configure
4. Grant appropriate user access

**Verification Checklist:**

- [ ] **Applet installed** and accessible
- [ ] **Member Class creation** capability verified
- [ ] **Earning Rules** section accessible
- [ ] **Redemption Rules** configuration available
- [ ] **Tier progression** settings visible
- [ ] **Expiry configuration** options present

**Functional Areas to Verify:**

```
Member Classes:
✓ Can create member class/tier
✓ Can assign points currency to class
✓ Can define tier benefits
✓ Can set tier criteria

Earning Rules:
✓ Can create earning rules
✓ Multiple earning rules per class supported
✓ Transaction type triggers available
✓ Calculation methods configurable

Redemption Rules:
✓ Redemption types available (points-to-cash, points-to-products)
✓ Conversion rates configurable
✓ Minimum redemption settings
✓ Redemption restrictions definable

Expiry Management:
✓ Points expiry rules configurable
✓ Membership expiry settings available
✓ Grace period configuration
```

**Reference:** [Membership Program Applet Documentation](/applets/membership-program/)

### 3. Membership Admin Console Applet

**Status:** Required

**Purpose:** Operational management interface for day-to-day member administration

**Installation:**

1. Install from Applet Store
2. Configure admin user permissions
3. Set up dashboard preferences
4. Test member search and management functions

**Verification Checklist:**

- [ ] **Applet installed** successfully
- [ ] **Member search** functionality works
- [ ] **Member details view** accessible
- [ ] **Points balance display** functional
- [ ] **Manual adjustment** capabilities verified (for admin corrections)
- [ ] **Transaction history** viewable
- [ ] **Reporting functions** accessible

**Operational Capabilities to Test:**

```
Member Management:
✓ Search members by name, phone, email
✓ View complete member profile
✓ See all memberships per customer
✓ Check point balances across currencies

Administrative Functions:
✓ Manual points adjustment (with justification)
✓ Membership status changes (activate/suspend)
✓ Tier override capabilities
✓ Membership renewal processing

Reporting:
✓ Member listing reports
✓ Points balance summaries
✓ Transaction history exports
✓ Program performance metrics
```

**Reference:** [Membership Admin Console Documentation](/applets/membership-admin-console-applet/)

## Optional Integration Modules

These modules enhance membership functionality but are not strictly required.

### Point of Sale (POS) Module

**Status:** Highly Recommended (for retail)

**Integration Benefits:**
- Real-time member identification at checkout
- Automatic points earning on purchases
- Points redemption as payment method
- Member discount application
- Receipt printing with points balance

**Integration Requirements:**

- [ ] **POS Module installed** and configured
- [ ] **Member lookup** capability at POS
- [ ] **Points calculation** integration tested
- [ ] **Redemption workflow** at checkout functional
- [ ] **Receipt customization** for member info

**Reference:** [POS Module Documentation](/modules/pos/)

### E-Commerce Module

**Status:** Recommended (for online businesses)

**Integration Benefits:**
- Member portal via CP-Commerce
- Online points balance display
- E-commerce points earning
- Online redemption capabilities
- Member account management

**Integration Requirements:**

- [ ] **E-Commerce Module installed**
- [ ] **CP-Commerce configured** for member portal
- [ ] **Member login** functionality tested
- [ ] **Points display** on website functional
- [ ] **Online redemption** workflow verified

**Reference:** [E-Commerce Module Documentation](/modules/ecommerce/)

### Financial Accounting Module

**Status:** Recommended (for liability tracking)

**Integration Benefits:**
- Points liability accounting
- Deferred revenue for membership fees
- Redemption expense tracking
- Financial reporting for loyalty program
- Compliance and audit trail

**Integration Requirements:**

- [ ] **Financial Accounting Module** configured
- [ ] **Liability accounts** created for points
- [ ] **Revenue accounts** set up for memberships
- [ ] **Journal templates** configured
- [ ] **Automated posting** rules established

**Reference:** [Financial Accounting Module Documentation](/modules/financial-accounting/)

### Sales & CRM Module

**Status:** Optional

**Integration Benefits:**
- Member segmentation for campaigns
- Purchase history analysis
- Loyalty program performance tracking
- Member lifetime value calculation
- Targeted marketing automation

**Integration Requirements:**

- [ ] **Sales & CRM Module** installed
- [ ] **Member segmentation** fields configured
- [ ] **Campaign management** linked to tiers
- [ ] **Analytics integration** functional

**Reference:** [Sales & CRM Module Documentation](/modules/sales-crm/)

## System Requirements

### Technical Infrastructure

**Database Requirements:**

- [ ] **Database version** supported by Membership Module
- [ ] **Sufficient storage** for member transactions (estimate 10MB per 1000 members)
- [ ] **Index optimization** for member lookup performance
- [ ] **Backup procedures** include membership data

**Application Server:**

- [ ] **BigLedger version** compatible with Membership Module
- [ ] **Adequate memory** allocation (minimum 2GB for membership processing)
- [ ] **Processing capacity** for real-time points calculations

**Network Infrastructure:**

- [ ] **Reliable connectivity** for POS-to-server communication
- [ ] **Redundancy** for critical member lookup services
- [ ] **Bandwidth** adequate for multi-location synchronization

### User Access and Permissions

**Administrative Roles:**

- [ ] **Membership Administrator** role defined
- [ ] **Permissions granted** for applet access
- [ ] **Approval workflows** configured (if required)
- [ ] **Audit logging** enabled for sensitive operations

**Operational Roles:**

- [ ] **POS cashiers** can lookup members
- [ ] **Customer service** can view member details
- [ ] **Store managers** can enroll members
- [ ] **Finance team** can access liability reports

**Member Self-Service:**

- [ ] **Member portal users** can view balances (if e-commerce enabled)
- [ ] **Member authentication** configured
- [ ] **Password reset** functionality tested

## Pre-Implementation Checklist

Complete this final checklist before beginning Membership Module configuration:

### Core Configuration Complete

- [ ] Organization structure finalized and active
- [ ] Customer master data clean and standardized
- [ ] Item master data configured with FI-ITEM support
- [ ] Pricebook operational with tier pricing capability
- [ ] Tax configuration accurate and tested

### Membership Applets Ready

- [ ] Membership Points Currency Applet installed
- [ ] Membership Program Applet accessible
- [ ] Membership Admin Console operational
- [ ] All applets tested for basic functionality

### Integration Preparation

- [ ] POS integration requirements understood (if applicable)
- [ ] E-Commerce integration planned (if applicable)
- [ ] Financial Accounting integration designed (if applicable)
- [ ] Data flow mapping completed

### Business Readiness

- [ ] Loyalty program rules documented
- [ ] Tier structure designed and approved
- [ ] Earning and redemption rules defined
- [ ] Financial liability assessment completed
- [ ] Legal terms and conditions prepared

### Operational Readiness

- [ ] Staff training plan prepared
- [ ] Member enrollment procedures documented
- [ ] Support escalation process defined
- [ ] Communication materials drafted

### Technical Readiness

- [ ] Test environment available
- [ ] Backup procedures verified
- [ ] User permissions configured
- [ ] Monitoring and alerting set up

## Validation Tests

Before proceeding to configuration, perform these validation tests:

### Test 1: Create Test Customer

```
Objective: Verify customer creation works correctly

Steps:
1. Open Customer Maintenance Applet
2. Create new customer with complete information
3. Save and verify customer appears in list
4. Edit customer and save changes
5. Search for customer using different criteria

Success Criteria:
✓ Customer created without errors
✓ All fields saved correctly
✓ Search functions work
✓ Edit and update functional
```

### Test 2: Create Test Item

```
Objective: Verify FI-ITEM creation for memberships

Steps:
1. Open Doc Item Maintenance Applet
2. Create FI-ITEM type item
3. Set item code, name, price
4. Link to GL account
5. Save and verify

Success Criteria:
✓ FI-ITEM created successfully
✓ GL account linkage works
✓ Item appears in searches
✓ Price configuration saved
```

### Test 3: Test Points Currency Applet

```
Objective: Confirm points currency functionality

Steps:
1. Open PTS CCY Module
2. Create test currency (e.g., TESTPTS)
3. Edit currency name
4. View currency list
5. Delete test currency

Success Criteria:
✓ Currency creation successful
✓ Edit function works
✓ List displays correctly
✓ Delete function operational
```

### Test 4: Verify Pricebook Functionality

```
Objective: Ensure tier-based pricing capability

Steps:
1. Open Pricebook Applet
2. Create customer-specific price
3. Set different price for different customer group
4. Verify effective dating works
5. Test price retrieval

Success Criteria:
✓ Customer-specific pricing functional
✓ Group pricing works
✓ Effective dates respected
✓ Price lookup accurate
```

## Troubleshooting Prerequisites

### Common Installation Issues

**Applet Not Visible After Installation**

Possible causes and solutions:
- User permissions not configured → Verify role assignments
- Module license not activated → Check license status
- Browser cache → Clear cache and reload
- Installation incomplete → Reinstall applet

**Cannot Create Points Currency**

Possible causes:
- Organization Applet not configured → Complete org setup first
- Database permissions → Verify database access
- Duplicate currency code → Use unique code
- Required fields missing → Complete all mandatory fields

**Customer Membership Linking Fails**

Possible causes:
- Customer Maintenance not configured → Verify customer applet setup
- Member class not created → Create member class first
- Points currency missing → Configure points currency
- Status inactive → Ensure all components active

## Next Steps

After completing this requirements checklist:

### All Prerequisites Met

Proceed to build your first membership program:

{{< cards >}}
  {{< card link="/modules/membership/getting-started/first-membership-program/" title="First Membership Program" subtitle="Complete walkthrough to create a retail loyalty program with Bronze, Silver, and Gold tiers" >}}
{{< /cards >}}

### Missing Prerequisites

If any requirements are not met:

1. **Core Module Setup** - Complete Organization, Customer, Item, and Pricebook configuration
2. **Applet Installation** - Install missing Membership applets
3. **Integration Planning** - Design integration with POS, E-Commerce, or Accounting modules
4. **Return to This Checklist** - Verify completion before proceeding

### Need Quick Test

For rapid familiarization before full setup:

{{< cards >}}
  {{< card link="/modules/membership/getting-started/quick-start-guide/" title="Quick Start Guide" subtitle="5-minute basic setup to learn the module with minimal configuration" >}}
{{< /cards >}}

## Summary

**Core Dependencies (Required):**
- Organization Applet
- Customer Maintenance Applet
- Doc Item Maintenance Applet
- Pricebook Applet

**Membership Applets (Required):**
- Membership Points Currency Applet
- Membership Program Applet
- Membership Admin Console Applet

**Integration Modules (Optional but Recommended):**
- Point of Sale Module (for retail)
- E-Commerce Module (for online)
- Financial Accounting Module (for liability tracking)

**Estimated Setup Time:**
- Prerequisites verification: 30-60 minutes
- Core applet configuration: 2-4 hours
- Membership module setup: 2-3 hours
- Testing and validation: 1-2 hours
- **Total: 1-2 days for complete implementation**

{{< callout type="warning" >}}
**Important**: Do not skip prerequisite verification. Missing dependencies will cause configuration errors and require rework. Complete this checklist systematically before proceeding to membership configuration.
{{< /callout >}}
