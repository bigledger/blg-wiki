---
title: "Entity Maintenance Applet"
description: "Comprehensive entity master management system for customers, suppliers, employees, and merchants with category governance, financial controls, and operational settings"
tags:
- entity-management
- master-data
- customer-supplier
- credit-control
- configuration
weight: 171
---

## Purpose and Overview

The **Entity Applet** is the main master-data workspace for maintaining business entities used across operations and finance. It centralizes customer, supplier, employee, and merchant records, then extends each record with category assignments, address/contact data, payment details, tax setup, credit controls, and company mappings.

{{< callout type="info" >}}
**Core Concept**: Create a clean entity header first, then enrich it through modular tabs such as **Payment Config**, **Tax**, **Address**, **Contact**, **Company Linking**, and **Credit Term and Limit**.
{{< /callout >}}

## Key Features Overview

### Who Benefits from This Applet?

**Sales and Commercial Teams:**
- Maintain customer and merchant profiles in one place
- Keep contacts and addresses current for quoting and billing
- Reuse consistent category structures for reporting and segmentation

**Procurement and Operations Teams:**
- Maintain supplier records with standardized fields
- Organize suppliers with dedicated category hierarchies
- Reduce onboarding delays caused by incomplete master data

**Finance and Credit Control Teams:**
- Configure payment and tax information per entity
- Set credit terms and credit limits with clear status control
- Maintain AR/AP context and company-level linking for transaction readiness

**Master Data Admins and System Owners:**
- Govern defaults for branch and location
- Control field-level behavior from settings
- Apply permission and visibility governance when enabled in tenant routes

### What Problems Does This Solve?

**The Fragmented Entity Master Problem:**

When entity data lives in spreadsheets and disconnected systems, teams face:
- Duplicate and inconsistent entity records
- Missing contact, tax, or payment information at transaction time
- Manual credit control outside the platform
- Repeated corrections across sales, purchasing, and finance
- Slow onboarding because ownership and validation rules are unclear

**The Entity Applet Solution:**

- **Single source of truth** - one managed profile per entity
- **Role-aware setup** - entity can be customer, supplier, employee, merchant, or mixed
- **Category governance** - dedicated modules for Entity, Customer, Employee, and Supplier categories
- **Financial readiness** - payment config, tax, credit term, and credit limit in one workflow
- **Operational completeness** - address, contact, login mapping, remarks, and branch/company links

## Key Features Overview

{{< cards >}}
  {{< card title="Entity Listing" subtitle="Grid-based listing with search, filters, and edit drill-down" link="#entity-listing-and-search" >}}

  {{< card title="Entity Create and Edit" subtitle="Core fields plus extension tabs for complete profiles" link="#entity-create-and-main-validation-rules" >}}

  {{< card title="Category Modules" subtitle="Entity, Customer, Employee, and Supplier category governance" link="#category-management" >}}

  {{< card title="Payment and Tax Setup" subtitle="Country, bank, payment method, and tax configurations" link="#payment-configuration" >}}

  {{< card title="Credit Controls" subtitle="Credit term templates and credit limits by currency" link="#credit-term-and-limit" >}}

  {{< card title="Company and Branch Mapping" subtitle="Company Linking and Intercompany Branch maintenance" link="#company-linking-and-intercompany-branch" >}}

  {{< card title="Configuration and Defaults" subtitle="Default selection, field settings, and optional governance routes" link="#configuration--settings" >}}

  {{< card title="Personalization" subtitle="User-level branch and location defaults" link="#personalization" >}}
{{< /cards >}}

{{< figure src="/images/entity-applet/entity-create-overview.png" alt="Entity Maintenance create form with required master fields and type selections" caption="Entity Create Form: Define core fields such as Entity Name, Status, Type, Entity Type, ID Number, Currency, and AR/AP Type before saving." >}}

## Key Concepts

### Understanding the Entity Framework

The applet follows a practical framework: identity, role, classification, transaction controls, and risk controls.

| Aspect | Component | Practical Example |
|--------|-----------|------------------|
| **Who is this record?** | Entity Header | "ABC Industrial Sdn Bhd" |
| **What role does it play?** | Type + Entity Type | Supplier + Corporate |
| **How is it classified?** | Category modules | Supplier Category: Raw Materials |
| **How will it transact?** | AR/AP Type, Payment Config, Tax | AP with bank transfer and tax code |
| **How is exposure controlled?** | Credit Term and Credit Limit | NET30 with MYR 100,000 limit |

{{< callout type="tip" >}}
**Implementation pattern**: Start with a minimal valid header, then complete operational and financial tabs before allowing live transactions.
{{< /callout >}}

### Entity Lifecycle Structure

Think of the applet as a staged entity lifecycle:

```
Entity Listing
  -> Create Entity Header
     -> Entity Edit Tabs
        -> Main
        -> Entity Category
        -> Login
        -> Payment Config
        -> Tax
        -> Address
        -> Contact
        -> Intercompany Branch
        -> Company Linking
        -> Remark
        -> Credit Term and Limit
  -> Settings and Personalization Defaults
```

### Category Domains

The applet separates category governance into four dedicated modules:
- **Entity Category** for broad classification
- **Customer Category** for customer-specific policy and reporting use
- **Employee Category** for employee-related classification
- **Supplier Category** for procurement and vendor segmentation

Each module supports create, edit, status control, and parent-category hierarchy.

---

## Quick Start Guide

Use these role-based quick starts to onboard with minimal setup errors.

### For Sales and Operations: Create Your First Entity

**Goal:** Create an entity profile that operations teams can use immediately.

1. Open **Entity Listing** and click **Create**.
2. Fill required header fields: Entity Name, Status, Type, Entity Type, ID Number, Currency, AR/AP Type.
3. Save the new header and reopen the record in edit mode.
4. Complete **Address** and **Contact** tabs so teams can transact and communicate.
5. Assign the correct **Entity Category** and validate status as active.
6. Return to listing and confirm the record appears correctly in search/filter results.

{{< figure src="/images/entity-applet/entity-create-form.png" alt="Entity Maintenance create form with required master fields and type selections" caption="Entity Create Form: Complete core identity and transaction fields before saving." >}}

---

### For Finance and Credit Control: Make the Entity Financially Ready

**Goal:** Ensure AP/AR processing can run without master-data gaps.

1. Open the entity and verify role (customer/supplier/employee/merchant) and AR/AP direction.
2. Configure **Payment Config** with payee status, payment type, country, bank, and account data.
3. Configure **Tax** with country, tax type, tax code, rate, and option.
4. Add **Credit Term** and **Credit Limit** entries with currency and status.
5. Set **Company Linking** and **Intercompany Branch** where required.
6. Perform a readiness check to confirm no mandatory financial fields are missing.

{{< figure src="/images/entity-applet/entity-payment-config-tab.png" alt="Entity payment config tab with country, payment type, bank, and identifier fields in a tabular view" caption="Payment Config: Set settlement method and bank details before live AP or AR use." >}}

---

### For Admins and Data Owners: Standardize Before Bulk Onboarding

**Goal:** Build consistent governance so onboarding scales cleanly.

1. Define category structures for Entity, Customer, Employee, and Supplier modules.
2. Set parent-child hierarchy in each category module where needed.
3. Configure **Settings > Default Selection** for default branch and default location.
4. Review **Settings > Field Settings** toggles to standardize form behavior.
5. Validate route-level governance features such as feature visibility and permissions if enabled in tenant.
6. Configure **Personalization > Default Selection** for user-level overrides.
7. Run UAT with at least one customer and one supplier onboarding scenario.

{{< figure src="/images/entity-applet/entity-settings-default-selection.png" alt="Default selection configuration screen for branch and location in Entity Maintenance applet" caption="Default Selection: Set applet-level branch and location defaults to reduce data-entry errors." >}}

---

{{< callout type="tip" >}}
**Rollout tip**: Finalize categories and defaults first, then onboard entities in batches by business function (for example, customers first, then suppliers).
{{< /callout >}}

---

## Entity Operations Walkthrough

### Entity Listing and Search

The listing page is the daily control center for entity maintenance:
- Search and advanced filtering
- Grid columns for name, type, ext type, currency, status, creation date, and modified date
- Pagination and row-click navigation to edit pages
- Quick create access for new records

{{< figure src="/images/entity-applet/entity-listing-main.png" alt="Entity listing grid with search, filters, pagination, and row-based navigation to edit view" caption="Entity Listing: Search, filter, and open entity records from a centralized grid." >}}

### Entity Create and Main Validation Rules

The create flow captures base attributes needed for downstream usage:
- Entity Name
- Status
- Type (`CUSTOMER`, `SUPPLIER`, `EMPLOYEE`, `MERCHANT`)
- Entity Type (`CORPORATE` or `INDIVIDUAL`)
- Identity Type and ID Number
- Tax ID, Currency, Description, and AR/AP Type

The form includes behavior rules:
- If `EMPLOYEE` is selected in Type, Entity Type is constrained to `INDIVIDUAL`
- ID field placeholder changes based on Entity Type context

{{< figure src="/images/entity-applet/entity-edit-form.png" alt="Entity edit screen with multi-tab profile management including Main, Category, Login, Payment, and Tax" caption="Entity Edit: Continue setup through modular tabs after saving the entity header." >}}

### Category Management

Category modules follow a consistent listing/create/edit pattern:
- `Entity Category`
- `Customer Category`
- `Employee Category`
- `Supplier Category`

Core capabilities:
- Category code and name maintenance
- Active/inactive status control
- Parent category linking for hierarchy
- Searchable listing for easier cleanup and governance

{{< figure src="/images/entity-applet/entity-category-report.png" alt="Entity category listing screen used as a report-style view for category governance and status monitoring" caption="Entity Category Report View: Use this listing to review category structure, statuses, and maintenance coverage." >}}

### Payment Configuration

Payment configuration captures settlement-related details used by finance:
- Payee residential status
- Payment type
- Country and bank
- Bank identifier code
- Account number and account holder name
- IBN number and account expiry

### Credit Term and Limit

Credit governance is handled in two linked sections:
- **Credit Term** for term logic and timing offsets
- **Credit Limit** for amount, currency, and status controls

These controls support risk management before approving orders or credit exposure.

### Company Linking and Intercompany Branch

Company and branch mapping ensures entities are available in the correct context:
- **Company Linking** maps entity to company scope and AR/AP context
- **Intercompany Branch** maps entity to specific intercompany branch relationships

Use both sections when entities operate across multiple companies or branches.

---

## Configuration & Settings

### Applet Default Selection (`Settings > Default Selection`)

Configure applet-wide defaults:
- Default Branch
- Default Location

These defaults reduce repetitive data entry and improve consistency.

{{< figure src="/images/entity-applet/entity-settings-default-selection.png" alt="Default selection configuration screen for branch and location in Entity Maintenance applet" caption="Default Selection Screen: Configure default branch and location for consistent data entry." >}}

### Field Settings (`Settings > Field Settings`)

Field settings allow toggle-based control for selected form areas. Common toggles include:
- Unit Discount
- SST/VAT/GST
- WHT
- Blanket Order
- Segment
- G/L Dimension
- Profit Center
- Project

### Advanced Governance Routes (Tenant Dependent)

Depending on tenant configuration, additional settings routes may be available:
- `Settings > Webhook`
- `Settings > Feature Visibility`
- `Settings > Permission Set Listing`
- `Settings > User Permission Listing`
- `Settings > Team Permission Listing`
- `Settings > Role Permission Listing`

Use these routes to align security, visibility, and operational governance.

### Label and i18n Notes

The applet primarily uses built-in labels from component definitions. A lightweight i18n helper is used for dropdown tree selection text (for example, showing `All` when no specific item is selected).

---

## Personalization

### User Default Selection (`Personalization > Default Selection`)

Users can define personal defaults for:
- Default Branch
- Default Location

These settings let teams keep global defaults while supporting user-specific workflows.

{{< figure src="/images/entity-applet/entity-personalization-default-selection.png" alt="Personalization default selection screen for user-level branch and location defaults" caption="Personalization: Set user-level branch and location defaults to speed up daily entry." >}}

---

## FAQ

**Q: Why does my new entity not appear where I expect after saving?**  
A: Verify status is active, check the assigned role/type, confirm company or intercompany links, and ensure your role permissions allow visibility in that module.

**Q: When should I use Entity Category versus Customer or Supplier Category?**  
A: Use Entity Category for broad classification, and role-specific categories when reporting or process rules are specific to customer, supplier, or employee contexts.

**Q: Do I need to fill Payment, Tax, and Credit for every entity?**  
A: Not always. For entities that will be used in AP/AR transactions, these sections should be completed before go-live. For non-transactional records, fields can be completed later based on policy.

**Q: Can one entity hold multiple roles (for example, both customer and supplier)?**  
A: Yes. The Type field supports multi-role usage, so one profile can represent multiple business relationships when governance allows it.

**Q: What is the difference between applet defaults and personalization defaults?**  
A: Applet defaults apply to everyone, while personalization defaults are user-level overrides for daily convenience.

**Q: How can we prevent duplicate entity creation?**  
A: Enforce pre-create search by legal name and registration ID, maintain naming standards, and assign a data steward to review uncertain matches.
