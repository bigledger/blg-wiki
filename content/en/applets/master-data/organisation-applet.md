---
title: "Organisation Applet"
description: "Manage your organization structure — companies, branches, locations, grouping, labelling, and notification templates"
tags:
- core-platform
- organisation
- company-management
- branch-management
- location-management
weight: 30
---

## Purpose and Overview

The **Organisation Applet** is the foundational applet for setting up and managing your organizational structure within BigLedger. It defines the companies, branches, and locations that form the backbone of every transaction, report, and access control rule across the entire platform.

{{< callout type="info" >}}
**Core Platform Applet**: This is one of the first applets configured when setting up BigLedger. All other applets depend on the organization structure defined here — companies, branches, and locations flow into every transaction document, report filter, and user permission.
{{< /callout >}}

## Key Features Overview

### Who Benefits from This Applet?

**System Administrators:**
- Set up the entire organizational hierarchy (Company → Branch → Location)
- Manage groups and labels for classification and reporting
- Configure notification templates for system-wide communications
- Control field visibility and default selections

**Finance Managers:**
- Understand the multi-company structure for consolidated reporting
- Manage branch-level financial configurations
- Assign cost centers to locations

**Operations Managers:**
- Manage branch operating parameters
- Configure location details for logistics and warehousing
- Organize branches and locations using groups and labels

**IT / Integration Teams:**
- Understand the organizational data model
- Map organizational hierarchy to external systems
- Configure notification templates for automated workflows

### What Problems Does This Solve?

**The Organization Complexity Problem:**

Multi-entity, multi-branch organizations face challenges:
- No single view of the organizational structure
- Inconsistent company / branch / location master data across systems
- Difficult to classify or filter entities for reporting
- Manual notification management

**The Organisation Applet Solution:**

- **Hierarchical structure** — Company → Branch → Location with clear parent-child relationships
- **Groups & Labels** — Flexible classification system for filtering and reporting
- **Category Groups** — Higher-level grouping for cross-cutting organization
- **Notification Templates** — Centralized template management for system emails and messages

## Key Features Overview

{{< cards >}}
  {{< card title="Company" subtitle="Legal entity management" link="#company" >}}

  {{< card title="Branch" subtitle="Operating branch setup" link="#branch" >}}

  {{< card title="Location" subtitle="Physical location management" link="#location" >}}

  {{< card title="Category Group" subtitle="Cross-entity categorization" link="#category-group" >}}

  {{< card title="Groups & Labels" subtitle="Tagging for Company, Branch & Location" link="#company-group" >}}

  {{< card title="Notification Template" subtitle="Email & message templates" link="#notification-template" >}}
{{< /cards >}}

## Key Concepts

### Understanding the Organisation Hierarchy

BigLedger's organizational structure follows a three-level hierarchy:

| Level | Entity | Purpose | Example |
|-------|--------|---------|---------|
| **1** | **Company** | Legal entity / accounting entity | BigLedger Sdn. Bhd. |
| **2** | **Branch** | Operating unit within a company | KL Head Office, Penang Branch |
| **3** | **Location** | Physical location within a branch | Warehouse A, Showroom Floor 2 |

{{< callout type="tip" >}}
**Rule of Thumb**: A **Company** is a legal entity with its own chart of accounts and financial statements. A **Branch** is an operating unit that shares the company's ledger. A **Location** is a physical place within a branch — typically used for inventory/warehouse tracking.
{{< /callout >}}

### Groups and Labels System

Groups and Labels provide two complementary ways to classify and organize your entities:

| Mechanism | Purpose | Usage Example |
|-----------|---------|---------------|
| **Group** | Logical grouping of entities for reporting and filtering | "Northern Region" group containing Penang, Kedah, and Perak branches |
| **Label** | Tag-based classification for flexible multi-dimensional filtering | "High Priority", "Franchise", "Owned" labels on branches |
| **Category Group** | Cross-entity categorization that applies across companies, branches, and locations | "Retail", "Wholesale", "Manufacturing" |

**Key Difference**: An entity belongs to **one Group** but can have **many Labels**. Category Groups provide an additional classification layer that spans across the entity types.

### Organisational Hierarchy

```
Organization (Tenant)
│
├── Company (Legal Entity)
│   ├── Branch (Operating Unit)
│   │   └── Location (Physical Place)
│   └── Branch
│       └── Location
│
├── Company Group ──→ Groups companies together
├── Company Label ──→ Tags on companies
│
├── Branch Group ──→ Groups branches together
├── Branch Label ──→ Tags on branches
│
├── Location Group ──→ Groups locations together
├── Location Label ──→ Tags on locations
│
├── Category Group ──→ Cross-entity classification
│
└── Notification Template ──→ System email/message templates
```

---

## Quick Start Guide

### Step 1: Create Your First Company

**Goal:** Register a legal entity in BigLedger.

1. **Navigate**: Go to **Company** from the sidebar
2. **Create**: Click **"+"** → Enter company name and registration details
3. **Configure**: Set the company address, tax registration number, currency, and fiscal year
4. **Create Chart of Accounts**: Choose to use a default chart of accounts template or create from scratch
5. **Save**: Click **Save** to create the company

### Step 2: Add Branches

**Goal:** Create operating units within your company.

1. **Navigate**: Go to **Branch** from the sidebar
2. **Create**: Click **"+"** → Select the parent **Company** → Enter branch name and details
3. **Configure**: Set branch address, contact details, and operating parameters
4. **Save**: Click **Save**

### Step 3: Add Locations

**Goal:** Define physical locations within your branches.

1. **Navigate**: Go to **Location** from the sidebar
2. **Create**: Click **"+"** → Select the parent **Branch** → Enter location name
3. **Configure**: Set location type (Warehouse, Office, Showroom, etc.) and address
4. **Save**: Click **Save**

### Step 4: Organize with Groups and Labels

**Goal:** Classify your entities for reporting and filtering.

1. **Create Groups**: Go to **Company Group** / **Branch Group** / **Location Group** → Create group → Assign entities
2. **Create Labels**: Go to **Company Label** / **Branch Label** / **Location Label** → Create labels → Tag entities

---

## Sidebar Menu Reference

### Company

Manage the legal entities (companies) within your organization.

**Listing View:**
- Displays all registered companies
- Columns: Company Name, Registration No., Status, Country, Currency
- Search and filter by company name, status, or country
- Click any row to edit company details
- Click **"+"** to create a new company

**Create / Edit View:**

| Field | Description | Required |
|-------|-------------|----------|
| **Company Name** | Official legal name | ✅ |
| **Registration No.** | Business registration number | ✅ |
| **Tax Registration No.** | GST/SST/VAT registration number | Optional |
| **Address** | Registered address | ✅ |
| **Country** | Country of incorporation | ✅ |
| **Default Currency** | Primary operating currency | ✅ |
| **Fiscal Year Start** | Start of financial year (e.g., January) | ✅ |
| **Logo** | Company logo for documents and reports | Optional |
| **Phone / Email** | Contact details | Optional |
| **Status** | Active / Inactive | ✅ |

**Additional Tabs:**
- **Chart of Accounts** — View or create the company's chart of accounts
- **Settings** — Company-specific configurations
- **Users** — Users with access to this company

---

### Branch

Manage operating branches within your companies.

**Listing View:**
- Displays all branches across all companies
- Columns: Branch Name, Company, Status, Address
- Search and filter by branch name, company, or status
- Click any row to edit branch details

**Create / Edit View:**

| Field | Description | Required |
|-------|-------------|----------|
| **Branch Name** | Name of the operating branch | ✅ |
| **Company** | Parent company this branch belongs to | ✅ |
| **Branch Code** | Short code for identification (e.g., KL-HQ) | Optional |
| **Address** | Branch physical address | ✅ |
| **Phone / Email** | Branch contact details | Optional |
| **Manager** | Branch manager or primary contact | Optional |
| **Status** | Active / Inactive | ✅ |

---

### Location

Manage physical locations within branches.

**Listing View:**
- Displays all locations across all branches
- Columns: Location Name, Branch, Company, Type, Status
- Search and filter by location name, branch, or type

**Create / Edit View:**

| Field | Description | Required |
|-------|-------------|----------|
| **Location Name** | Descriptive location name | ✅ |
| **Branch** | Parent branch this location belongs to | ✅ |
| **Location Code** | Short code for identification (e.g., WH-A) | Optional |
| **Type** | Warehouse, Office, Showroom, Factory, etc. | Optional |
| **Address** | Physical address (if different from branch) | Optional |
| **Status** | Active / Inactive | ✅ |

---

### Category Group

Create cross-entity category groups that can be applied across companies, branches, and locations.

**Listing View:**
- Displays all category groups
- Search and filter by group name
- Click any row to edit

**Create / Edit View:**

| Field | Description | Required |
|-------|-------------|----------|
| **Group Name** | Category group name (e.g., "Retail", "Manufacturing") | ✅ |
| **Description** | Purpose or scope of this category | Optional |
| **Status** | Active / Inactive | ✅ |

---

### Company Group

Group multiple companies together for consolidated reporting and filtering.

**Listing View:**
- Displays all company groups
- Shows group name and number of member companies

**Create / Edit View:**

| Field | Description | Required |
|-------|-------------|----------|
| **Group Name** | Name of the company group (e.g., "ASEAN Entities") | ✅ |
| **Description** | Group purpose | Optional |
| **Member Companies** | Companies assigned to this group | ✅ |

---

### Company Label

Tag companies with labels for flexible multi-dimensional filtering.

**Listing View:**
- Displays all company labels
- Shows label name and color

**Create / Edit View:**

| Field | Description | Required |
|-------|-------------|----------|
| **Label Name** | Label text (e.g., "Listed Entity", "Subsidiary") | ✅ |
| **Color** | Visual color for the label | Optional |
| **Applied To** | Companies tagged with this label | Optional |

---

### Branch Group

Group multiple branches together for regional or functional reporting.

**Listing View:**
- Displays all branch groups
- Shows group name and member count

**Create / Edit View:**

| Field | Description | Required |
|-------|-------------|----------|
| **Group Name** | Name of the branch group (e.g., "Northern Region") | ✅ |
| **Description** | Group purpose | Optional |
| **Member Branches** | Branches assigned to this group | ✅ |

---

### Branch Label

Tag branches with labels for filtering and classification.

**Listing View:**
- Displays all branch labels

**Create / Edit View:**

| Field | Description | Required |
|-------|-------------|----------|
| **Label Name** | Label text (e.g., "Franchise", "Company-Owned") | ✅ |
| **Color** | Visual color | Optional |
| **Applied To** | Branches tagged with this label | Optional |

---

### Location Group

Group multiple locations together.

**Listing View:**
- Displays all location groups

**Create / Edit View:**

| Field | Description | Required |
|-------|-------------|----------|
| **Group Name** | Name of the location group (e.g., "Cold Storage") | ✅ |
| **Description** | Group purpose | Optional |
| **Member Locations** | Locations assigned to this group | ✅ |

---

### Location Label

Tag locations with labels for filtering.

**Listing View:**
- Displays all location labels

**Create / Edit View:**

| Field | Description | Required |
|-------|-------------|----------|
| **Label Name** | Label text (e.g., "Climate Controlled", "Bonded Zone") | ✅ |
| **Color** | Visual color | Optional |
| **Applied To** | Locations tagged with this label | Optional |

---

### Notification Template

Manage email and message templates used by BigLedger's notification system.

**Listing View:**
- Displays all notification templates
- Columns: Template Name, Type (Email/SMS/Push), Status
- Search by template name or type

**Create / Edit View:**

| Field | Description | Required |
|-------|-------------|----------|
| **Template Name** | Identifying name for the template | ✅ |
| **Type** | Email / SMS / Push Notification | ✅ |
| **Subject** | Email subject line (for email type) | Conditional |
| **Body** | Template body with placeholder variables | ✅ |
| **Variables** | Available merge fields (e.g., {{customerName}}, {{invoiceNo}}) | Auto |
| **Status** | Active / Inactive | ✅ |

**Common Use Cases:**
- Approval request notifications
- Invoice/document email delivery
- Welcome emails for new users
- Password reset notifications
- Custom workflow notifications

{{< callout type="tip" >}}
**Template Variables**: Use double curly braces `{{variableName}}` to insert dynamic data. Available variables depend on the context where the template is used.
{{< /callout >}}

---

## Settings

{{< callout type="info" >}}
**Access Required**: Settings are only accessible to users with **Owner** or **Admin** roles.
{{< /callout >}}

Access Settings from the gear icon (⚙️) at the bottom of the sidebar.

### Field Settings (Settings → Field Settings)

Control field visibility and behavior across all organisation entity forms.

**Key Configurations:**
- Toggle field visibility for listing columns and edit forms
- Set mandatory fields for data entry
- Configure field labels and tooltips
- Enable/disable optional fields

### Default Selection (Settings → Default Selection)

Pre-set default values that auto-populate when creating new entities.

**Available Defaults:**
- Default Country
- Default Currency
- Default Status for new entities
- Default fiscal year settings

---

## Personalization

Access Personalization from the profile icon at the bottom of the sidebar.

### Field Settings (Personalization → Field Settings)

Customize field visibility for your personal view of the applet. Changes apply only to your account.

### Default Selection (Personalization → Default Selection)

Set your personal default values that auto-populate when **you** create entities. These override company-level defaults for your account only.

---

## Integration Points

### How Organisation Data Flows Across BigLedger

The Organisation Applet is the **foundation** that all other applets depend on:

| Data | Used By | Purpose |
|------|---------|---------|
| **Company** | Every financial applet | Determines which ledger transactions post to |
| **Branch** | All transaction applets (Invoice, PO, etc.) | Branch-level document creation and filtering |
| **Location** | Warehouse, Inventory, Delivery applets | Physical location for stock and delivery |
| **Groups** | Reporting applets | Consolidated and filtered reporting |
| **Labels** | All applets with advanced search | Multi-dimensional filtering |
| **Notification Templates** | All workflow-enabled applets | Automated email/message delivery |

### Module Integration

| Module | Dependency | Purpose |
|--------|-----------|---------|
| **All Modules** | Company, Branch, Location | Every transaction requires company and branch selection |
| **Financial Accounting** | Company, Chart of Accounts | Ledger per company |
| **Sales** | Branch, Location | Branch-level invoicing |
| **Purchasing** | Branch, Location | Branch-level procurement |
| **Inventory** | Location | Stock tracking per location |
| **HR / Claims** | Branch | Employee branch assignment |

---

## Troubleshooting

### Common Issues

#### Cannot Delete a Company
**Problem**: Attempting to delete a company returns an error.
**Symptoms**: Delete button is disabled or shows "Cannot delete — has dependent records."
**Solution**:
1. The company has existing transactions (invoices, journals, etc.) linked to it
2. Companies with transactions cannot be deleted — set the status to **Inactive** instead
3. To fully remove, first delete or reassign all dependent records (branches, transactions)
**Prevention**: Use "Inactive" status instead of deletion for companies that are no longer operating.

#### Branch Not Appearing in Other Applets
**Problem**: A newly created branch is not available in dropdown selections in other applets.
**Symptoms**: The branch exists in the Organisation Applet but doesn't appear in Sales Invoice, Purchase Order, etc.
**Solution**:
1. Verify the branch **Status** is set to **Active**
2. Check that the current user has access permissions to the branch
3. Refresh the browser — some applets cache branch lists
4. Verify the branch is assigned to the correct company
**Prevention**: Always set new branches to "Active" and assign user permissions immediately.

#### Location Missing from Warehouse / Inventory Applets
**Problem**: A location is not appearing in warehouse or inventory selection lists.
**Symptoms**: Location exists but not selectable in warehouse applets.
**Solution**:
1. Verify the location is **Active** and assigned to the correct branch
2. Check that the location **Type** matches the expected type for the selecting applet
3. Ensure the user has permissions for the branch that owns this location
**Prevention**: Configure location types appropriately when creating locations.

#### Notification Template Not Sending Emails
**Problem**: A configured notification template is not triggering emails.
**Symptoms**: No emails received even though the template is configured.
**Solution**:
1. Verify the template **Status** is **Active**
2. Check that email settings (SMTP) are configured at the platform level
3. Verify the template is correctly linked to the triggering workflow
4. Check spam/junk folders
**Prevention**: Test notification templates with a test email before deploying to production.

---

## Best Practices

### Setup Best Practices
- **Plan your hierarchy first** — Before creating entities, map out your Company → Branch → Location hierarchy on paper
- **Naming conventions** — Use consistent naming (e.g., "Company Name - Branch City" for branches)
- **Use codes** — Assign short codes to branches and locations for easy identification in reports

### Grouping & Labelling Best Practices
- **Groups for reporting** — Use groups to create reporting segments (e.g., "Northern Region", "Southern Region")
- **Labels for classification** — Use labels for flexible multi-dimensional tagging (e.g., "Franchise", "High Volume")
- **Category groups for cross-cutting** — Use category groups for themes that apply across entity types (e.g., "Retail", "B2B")

### Administration Best Practices
- **Review periodically** — Deactivate branches and locations that are no longer operational
- **Template management** — Maintain a central library of notification templates, version them when making changes
- **Access control** — Restrict organisation management to authorized administrators only

---

## Related Documentation Links

### Related Applets
- **[Admin Applet](/applets/admin-applet/)** — Platform-level administration
- **[Chart of Account Applet](/applets/chart-of-account-applet/)** — Company-level chart of accounts
- **[Claim Applet](/applets/claim-applet/)** — Employee claims (uses branch structure)

### Core Documentation
- **[BigLedger User Guide](/user-guide/)** — Overall system documentation
- **[Guides](/guides/)** — Getting started and implementation guides

{{< callout type="info" >}}
**Need Help?** For additional support with this applet, contact your system administrator or refer to the [Guides](/guides/) section for implementation assistance.
{{< /callout >}}
