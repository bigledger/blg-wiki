---
title: "Internal Sales Invoice Applet"
description: "Comprehensive sales transaction management system for invoicing, inventory logic, financial posting, and intercompany commerce."
tags:
- sales-management
- invoice-processing
- financial-posting
- stock-control
- intercompany-transactions
weight: 101
date: 2026-02-06
draft: false
---

## Purpose and Overview

The **Internal Sales Invoice Applet** is the engine room of the order-to-cash process. It moves beyond simple billing by integrating sales transactions with real-time inventory deduction, financial posting, logistics coordination, and intercompany transfers.

{{< callout type="info" >}}
**Core Concept**: The system bridges **Sales Operations** (Orders) with **Financial Control** (Ledgers), **Logistics** (Pick & Pack), and **Intercompany** logic in a single workflow.
{{< /callout >}}

{{< figure src="/images/internal-sales-invoice-applet/internal-sales-invoice-overview-infographic.png" alt="Internal Sales Invoice Overview Infographic" caption="Visual guide to the challenges, solutions, and benefits of the applet." >}}

{{< figure src="/images/internal-sales-invoice-applet/main-listing-page.png" alt="Internal Sales Invoice Main Listing" caption="The central hub for managing all sales transactions and their statuses." >}}

## Key Features Overview

### Who Benefits from This Applet?

**Sales Representatives:**
- **Instant Conversion**: Convert confirmed orders to invoices via Knock-Off (KO) without manual re-entry.
- **Strategic Efficiency**: Use **Templates** for recurring high-volume orders.
- **Inventory Visibility**: See real-time stock availability to prevent over-promising.

**Finance & Accounts Teams:**
- **Fiscal Automation**: Automated General Ledger (GL) postings upon finalization.
- **Intercompany Reconciliation**: Seamless management of cross-entity billing.
- **Compliance**: Accurate tax calculations and "Selling Below Cost" alerts.
- **Auditability**: Complete forensic trails for every price change and status update.

**Logistics & Warehouse Teams:**
- **Fulfillment Integration**: Approved invoices automatically populate the **Pick & Pack Queue**.
- **Correction Tools**: **Swap Serial** allows inventory correction without financial reversals.
- **Reporting**: Direct link between invoicing and stock movement reports.

**Business Managers:**
- **Control Tower**: Centralized **Approval Dashboard** for overriding credit limits or price floors.
- **Performance**: Real-time sales performance monitoring.
- **Security**: Strict access controls via permission sets (User, Team, Role).

### What Problems Does This Solve?

**The Disconnected Systems Problem:**
Traditional sales processing often separates billing from inventory and accounting. This leads to data re-entry errors, phantom stock (selling what you don't have), and month-end reconciliation nightmares.

**The Sales Invoice Applet Solution:**
- **Single Source of Truth**: The invoice drives the GL, Stock Card, and Logistics Queue simultaneously.
- **Unified Workflow**: Pack queue, delivery logistics, and intercompany transfers live in one ecosystem.
- **Forensic Audit Trail**: Track every click, status change, and user action.
- **Flexible Settlement**: Handle complex payments via Contra, Credit Notes, or Vouchers.

## Key Features Overview

{{< cards >}}
  {{< card title="Transaction Listing" subtitle="View and track invoice status" link="#transaction-listing" >}}

  {{< card title="Knock-off (KO)" subtitle="Convert orders to invoices instantly" link="#efficient-invoice-generation" >}}

  {{< card title="Templates" subtitle="Create reusable invoice structures" link="#sales-invoice-templates" >}}

  {{< card title="Pick & Pack" subtitle="Manage logistics and delivery" link="#pick--pack-queue" >}}

  {{< card title="Intercompany" subtitle="Manage cross-entity transactions" link="#intercompany-transactions" >}}

  {{< card title="Approvals" subtitle="Centralized permission requests" link="#approvals-management" >}}

  {{< card title="Swap Serial" subtitle="Correct serial number issues" link="#swap-serial" >}}

  {{< card title="Document Tracing" subtitle="Audit financial journal postings" link="#document-tracing" >}}
{{< /cards >}}

## Key Concepts

### The Invoice Lifecycle

Understanding the state transitions is crucial for effective management.

| Stage | Component | System Action | Financial Impact |
|-------|-----------|--------|--------|
| **1. Creation** | Sales Order / Template | Confirmed demand | **Reserved Stock** (No GL impact) |
| **2. Billing** | **Sales Invoice** | Finalization | **Stock Deducted** + **Revenue Recognized** + **Tax Posted** |
| **3. Fulfillment** | Pick & Pack / DO | Goods leave warehouse | Physical stock movement verified |
| **4. Payment** | Receipt/Contra | Payment received | Customer AR Balance reduced |

### Intercompany Transactions
For organizations with multiple entities, this applet handles the complexity of selling from Entity A to Entity B. It automates the corresponding AP/AR entries to ensure books balance across the group, eliminating the need for manual dual-entry.

---

## Workflow Guide

This section outlines the primary workflows for different roles, focusing on best practices and system behavior.

### Efficient Invoice Generation

**Goal:** Create valid sales invoices that accurately reflect inventory and financial obligations.

**1. Leveraging Templates & Knock-Offs**
Instead of manual entry, prioritize using **Knock-Off (KO)** from Sales Orders or **Sales Invoice Templates**.
*   **KO Logic**: Inherits all customer details, pricing, and terms from the source document.
*   **Impact**: Ensures data consistency and prevents "creative invoicing" where details differ from the approved order.

**2. The Creation Form**
{{< figure src="/images/internal-sales-invoice-applet/create-form.png" alt="Invoice Creation Form" caption="The streamlined interface for creating new sales invoices." >}}

*   **Entity Selection**: Selecting a customer auto-populates critical financial data: Credit Terms, Default Currency, and Billing Address.
*   **Item Selection**:
    *   **Stock Checking**: The system validates availability in real-time.
    *   **Serialization**: For serialized inventory, specific serial numbers must be allocated here to ensure the correct unit is deducted.
*   **Pricing**: Unit prices are typically locked to the Price Book. Overrides may trigger an approval workflow.

**3. Finalization & Posting**
Switching status to **Final** is the "point of no return" for financial posting.
*   **Immediate Actions**: Revenue is recognized, Tax is posted, and Inventory is deducted.
*   **Logistics Trigger**: The item is visible in the Pick & Pack Queue.

---

### Management & Control

**Goal:** Maintain financial integrity and operational compliance.

**1. Status Monitoring**
*   **Draft**: Working documents. No financial impact.
*   **Final**: Legal documents. Locked. Requires **Voiding** to reverse.
*   **Modification**: Limited editing of non-financial fields (e.g., Remarks, Delivery Instructions) on Final documents.

**2. Handling Exceptions (Approvals)**
Sensitive actions automatically trigger the **Approval Workflow**.
*   **Triggers**: Exceeding Credit Limit, Selling Below Cost, Backdating Transaction Date.
*   **Action**: Managers review these in the **Approval Permission** dashboard.
*   **Result**: The invoice remains in a "Pending" state until authorized. This prevents high-risk transactions from slipping through.

---

## Feature Deep Dive

### Sales Invoice Templates
Reduce repetitive data entry by standardizing common sales scenarios.
-   **Strategic Use**: Create templates for "Standard Service Packs" or "Monthly Retainers".
-   **Organization**: Share templates with specific teams to ensure everyone sells the same package structure.

### Intercompany Transactions
Manually handle complex inter-entity billing via the **Intercompany** route.
-   **Scenario**: HQ purchasing bulk inventory and selling it to regional branches.
-   **System Logic**: Accessing the Intercompany route allows you to select internal entities as customers. The system validates that the "Sales" in HQ corresponds to a potential "Purchase" in the destination entity.

### Pick & Pack Queue
A dedicated view for warehouse operations to close the loop between "Sold" and "Shipped".
-   **Process**: Items from approved invoices appear here.
-   **Action**: Warehouse staff mark items as "Picked" (gathered) and "Packed" (ready for courier).
-   **Outcome**: Generates the Delivery Order (DO) and updates the shipment status, providing visibility to Sales teams.

### Swap Serial
A critical tool for correcting inventory errors without financial rollback.
-   **The Problem**: You sold "Serial A" physically, but the invoice says "Serial B".
-   **The Fix**: Instead of Voiding (which messes up the accounts for a non-financial error), use **Swap Serial**.
-   **Result**: The system swaps the serial numbers in the backend inventory records while keeping the Invoice and GL entries intact.

### Contra Settlements
Contra Settlement allows you to pay an invoice using *other documents* instead of cash.
*   **Use Case**: You buy raw materials from Supplier X and sell finished goods to Customer X (same entity).
*   **Execution**: In the **Contra** tab, "Knock Off" the Invoice against a Credit Note or Purchase Bill to offset the balance.

### Document Tracing
The **Trace** button is your audit best friend.
*   **Financials**: Review the exact Journal Entries (Debit AR / Credit Sales) generated.
*   **Inventory**: Verify which Batch or Serial Number was deducted from which Location.
*   **Costing**: specific Cost of Goods Sold (COGS) calculation for that transaction.

### Line Reports
{{< figure src="/images/internal-sales-invoice-applet/reports-page.png" alt="Line Reports Listing" caption="Detailed listing of all invoice line items for granular reporting." >}}
For deep analysis, the Line Reports view breaks down invoices into individual row items. This allows for granular reporting on "Product X sales by Region" or "Salesman Y performance by Item Category".

---

## Configuration & Settings

**Customize the interface to match your workflow.**

{{< figure src="/images/internal-sales-invoice-applet/settings-page.png" alt="Applet Settings" caption="Configure default branches, layouts, and permissions." >}}

### Personalization Menu
Access the **Personalization** menu to adapt the applet to your specific role.
-   **Default Settings**: Set Default Branch and Location to avoid repetitive selection.
-   **View Layouts**: Switch between Horizontal (Data-dense) or Vertical (Visual) orientation.

### Admin Configuration
System Administrators can fine-tune behavior via the Settings panel.
-   **Field Settings**: Toggle visibility of Profit Margin, Cost Price, etc., based on user roles.
-   **Workflow Settings**: Define custom logic for approval flows (e.g., "Invoices > $10k require Manager").
-   **Printable Format Settings**: Customize the Tax Invoice and Delivery Order PDF layouts with company branding.
-   **Webhooks**: Set up event-driven notifications to external systems (e.g., "On Finalize -> Send to Slack").

---

## Applet Reference

This section provides a comprehensive reference of all menu items, settings, permissions, and configurable features available in the Internal Sales Invoice Applet.

### Menu Items

The following main navigation menu items are available in the applet:

| Menu Item | Description | Route Path |
|-----------|-------------|------------|
| **Sales Invoice** | Main listing of all sales invoice transactions | `/sales-invoice` |
| **Line Items** | Detailed line-by-line item reports for granular analysis | `/line-items` |
| **Pick & Pack Queue** | Fulfillment queue for warehouse pick and pack operations | `/pick-pack-queue` |
| **Sales Invoice Template** | Create and manage reusable invoice templates | `/sales-invoice-template` |
| **Approval Permission** | Centralized dashboard for pending approvals | `/approval-permission` |
| **File Import** | Bulk import sales invoices from external files | `/file-import` |
| **Intercompany** | Manage intercompany sales transactions between entities | `/intercompany` |
| **File Export** | Export sales invoice data to external formats | `/file-export` |
| **Swap Serial** | Correct serial number assignments without financial reversal | `/swap-serial` |
| **Settings** | Administrative configuration panel | `/settings` |
| **Personalization** | User-specific preference settings | `/personalization` |

### Settings Sub-Menu Items

The Settings panel contains the following configuration sections:

| Setting | Description | Route Path |
|---------|-------------|------------|
| **Default Selection** | Configure default branch, location, and other selection defaults | `/settings/default-selection` |
| **Field Settings** | Toggle visibility and behavior of form fields | `/settings/field-settings` |
| **Printable Format Settings** | Customize PDF layouts for Tax Invoice, Delivery Order, etc. | `/settings/printable-format-settings` |
| **Email Template** | Configure automated email templates for notifications | `/settings/email-template` |
| **Webhook** | Set up event-driven integrations with external systems | `/settings/webhook` |
| **Feature Visibility** | Control which features are visible to users | `/settings/feature-visibility` |
| **Branch Settings** | Configure branch-specific behaviors and defaults | `/settings/branch-settings` |
| **Workflow Settings** | Define approval workflows and business rules | `/settings/workflow-settings` |
| **Permission Set Listing** | Manage predefined permission sets | `/settings/permission-set-listing` |
| **User Permission Listing** | Configure individual user permissions | `/settings/user-permission-listing` |
| **Team Permission Listing** | Configure team-based permissions | `/settings/team-permission-listing` |
| **Role Permission Listing** | Configure role-based permissions | `/settings/role-permission-listing` |
| **Client-Side Permission Listing** | Manage UI/display-level permissions | `/settings/client-side-permission-listing` |
| **Role Pricing Scheme Link** | Link roles to specific pricing schemes | `/settings/role-pricing-scheme-link-listing` |
| **Permission Wizard** | Guided setup for permission configuration | `/settings/permission-wizard-listing` |
| **Release Notes** | View applet version history and updates | `/settings/release-notes` |
| **Applet Log** | Audit log of applet activities and changes | `/settings/applet-log` |

---

## Settings Configuration Guide

This section provides detailed explanations of each settings option, including their purpose, use cases, and best practices for configuration.

### Default Selection Settings

**Purpose:** Streamline data entry by pre-populating commonly used values, reducing repetitive selections and minimizing user error.

**Key Configurations:**

**Default Branch & Location**
- **Purpose**: Automatically populate the operating branch and inventory location when creating new invoices
- **Use Case**: Sales teams operating from a single branch avoid selecting the same branch repeatedly
- **Best Practice**: Configure per user or role based on their primary working location

**Default Price Book**
- **Purpose**: Automatically apply the correct pricing tier when adding items to invoices
- **Use Case**: Different sales channels (retail, wholesale, online) can have different default price books
- **Configuration**: Set via `DEFAULT_PRICEBOOK` setting
- **Impact**: Ensures pricing consistency and prevents manual pricing errors

**Default Orientation** 
- **Purpose**: Control the default layout mode (Horizontal vs Vertical) for the invoice form
- **Options**: 
  - `HORIZONTAL`: Data-dense, suitable for wide screens and power users
  - `VERTICAL`: Visual-friendly, better for touch devices and new users
- **Configuration**: `DEFAULT_ORIENTATION` and `VERTICAL_ORIENTATION` settings
- **Best Practice**: Horizontal for desktop users, Vertical for tablet/mobile access

---

### Field Settings

**Purpose:** Control which fields are visible, required, or hidden based on user roles and business requirements. This enforces data governance and simplifies the user interface.

**Key Use Cases:**

**Sensitive Financial Data**
- Hide **Cost Price** and **Profit Margin** from sales representatives
- Show these fields only to managers and finance team
- **Benefit**: Prevents disclosure of sensitive margins to external parties

**Regulatory Compliance**
- Make **Tax ID** and **E-Invoice Fields** mandatory for certain customer types
- Enforce **Serial Number** tracking for regulated products
- **Benefit**: Ensures compliance with tax and industry regulations

**Workflow Simplification**
- Hide unused fields (e.g., **Shipping Details** for digital products)
- Make **Purchase Order Number** mandatory for B2B customers
- **Benefit**: Reduces clutter and prevents incomplete transactions

**Configuration Approach:**
1. Identify user roles (Sales, Finance, Admin)
2. Map business rules to field visibility
3. Test workflows after configuration changes

---

### Printable Format Settings

**Purpose:** Customize the appearance and content of printed/PDF documents to match company branding and meet legal requirements.

**Supported Document Types:**

**Tax Invoice**
- **Purpose**: Official billing document for customers
- **Customization Options**:
  - Company logo and branding colors
  - Tax registration details and disclaimers
  - Payment terms and bank account information
  - Custom headers/footers for different branches
- **Use Case**: Multi-entity businesses need different branding per legal entity

**Delivery Order (DO)**
- **Purpose**: Shipping document for warehouse and logistics
- **Customization Options**:
  - Barcode/QR code for warehouse scanning
  - Packing instructions and handling notes
  - Multi-language support for international shipments
- **Use Case**: Streamline warehouse operations with clear picking instructions

**Custom Formats**
- Create specialized documents (Proforma Invoice, Commercial Invoice, Packing List)
- **Use Case**: Export businesses requiring customs documentation
- **Configuration**: Define custom templates for specific customer groups or product categories

**Best Practices:**
- Test printable formats before going live
- Maintain separate templates for different regulatory jurisdictions
- Include all legally required information (tax ID, business registration, etc.)

---

### Email Template Settings

**Purpose:** Automate customer communications with consistent, professional messaging at key transaction milestones.

**Common Email Triggers:**

**Invoice Finalized**
- Automatically send invoice PDF to customer email
- Include payment instructions and due date
- **Benefit**: Immediate delivery, reduces manual follow-up

**Payment Reminder**
- Escalating reminders (7 days before, on due date, 7 days overdue)
- Configurable tone (polite → firm)
- **Benefit**: Improves cash flow without manual intervention

**Approval Requests**
- Notify managers when invoices require approval (credit limit exceeded, below-cost pricing)
- Include approval link for quick action
- **Benefit**: Reduces approval bottlenecks

**Shipment Notifications**
- Alert customers when orders are packed and ready for delivery
- Include tracking number and estimated delivery date
- **Benefit**: Enhances customer experience and reduces support tickets

**Configuration Elements:**
- **Subject Line**: Dynamic variables (Invoice Number, Customer Name, Amount)
- **Body Template**: HTML support for rich formatting
- **Attachments**: Automatically attach invoice PDF
- **Conditions**: Send only if specific criteria met (e.g., Amount > $1000)

---

### Webhook Settings

**Purpose:** Enable real-time integration with external systems by sending event notifications when key actions occur in the applet.

**Common Webhook Use Cases:**

**Accounting System Integration**
- **Trigger**: Invoice finalized
- **Action**: Post invoice data to external accounting software (QuickBooks, Xero)
- **Benefit**: Eliminates double-entry, ensures real-time sync

**CRM Updates**
- **Trigger**: Large invoice created (>$10,000)
- **Action**: Update customer account in Salesforce with latest transaction
- **Benefit**: Sales team has complete customer view

**Slack/Teams Notifications**
- **Trigger**: Invoice requires approval
- **Action**: Post message to #approvals channel
- **Benefit**: Faster response time from management

**Inventory Replenishment**
- **Trigger**: Invoice depletes stock below reorder point
- **Action**: Create purchase requisition in procurement system
- **Benefit**: Automated inventory management

**Configuration:**
- **Webhook URL**: Endpoint to receive event data
- **Events**: Select which actions trigger the webhook (create, update, finalize, void)
- **Payload**: JSON format with invoice details
- **Authentication**: API key or OAuth for secure transmission
- **Retries**: Automatic retry on failure (exponential backoff)

---

### Feature Visibility Settings

**Purpose:** Control which applet features are accessible to users, allowing you to enable/disable functionality based on business needs and user maturity.

**Configurable Features:**

**Pick & Pack Queue** (`HIDE_PICK_PACK_QUEUE_MENU`)
- **Show When**: Using integrated warehouse management
- **Hide When**: Using external 3PL or manual fulfillment
- **Benefit**: Simplifies interface for non-warehouse users

**Sales Invoice Template** (`HIDE_SALES_INVOICE_TEMPLATE_MENU`)
- **Show When**: Selling recurring services or standard packages
- **Hide When**: Every sale is custom/one-off
- **Benefit**: Reduces complexity for businesses without template usage

**File Import** (`HIDE_FILE_IMPORT_MENU`)
- **Show When**: Bulk importing invoices from external systems
- **Hide When**: All invoices created manually or via API
- **Benefit**: Prevents accidental bulk imports by untrained users

**Intercompany Transactions** (`HIDE_INTERCOMPANY_MENU`)
- **Show When**: Multiple legal entities with inter-entity trading
- **Hide When**: Single entity operation
- **Benefit**: Avoids confusion for single-entity businesses

**File Export** (`HIDE_FILE_EXPORT_MENU`)
- **Show When**: Need to export invoice data to external analytics tools
- **Hide When**: No external data requirements
- **Benefit**: Reduces menu clutter

**Swap Serial** (`HIDE_SWAP_SERIAL_NUMBER`)
- **Show When**: Selling serialized inventory (electronics, vehicles)
- **Hide When**: No serial number tracking required
- **Benefit**: Prevents access to advanced inventory corrections by unauthorized users

---

### Branch Settings

**Purpose:** Configure branch-specific business rules, defaults, and operational parameters for multi-branch organizations.

**Key Configurations:**

**Branch-Level Pricing**
- Different branches may have different cost structures or market pricing
- **Example**: Urban branch uses premium pricing, rural branch uses standard pricing

**Branch-Level Inventory**
- Control whether branches can fulfill orders from other branch inventory
- **Cross-Branch Transfer**: Enable/disable inter-branch stock transfers
- **Benefit**: Prevents overselling at branch level

**Branch-Level Permissions**
- Sales team at Branch A can only view/edit Branch A invoices
- Managers can view all branches
- **Benefit**: Data segregation for security and performance

**Branch-Level Defaults**
- Default shipping carrier per branch
- Default payment terms per branch region
- **Benefit**: Operational flexibility while maintaining consistency

---

### Workflow Settings

**Purpose:** Define business rules and approval workflows to enforce governance and prevent high-risk transactions.

**Common Approval Workflows:**

**Credit Limit Exceeded**
- **Rule**: Invoice total + customer outstanding > credit limit
- **Action**: Require manager approval before finalization
- **Approver**: Credit controller or finance manager
- **Benefit**: Prevents bad debt

**Below-Cost Pricing**
- **Rule**: Unit price < cost price
- **Action**: Require approval with justification
- **Approver**: Sales director
- **Benefit**: Protects profit margins, prevents pricing errors

**High-Value Transactions**
- **Rule**: Invoice amount > $50,000
- **Action**: Dual approval (Sales Manager + Finance Manager)
- **Benefit**: Additional scrutiny for large transactions

**Backdated Transactions**
- **Rule**: Transaction date < today - 7 days
- **Action**: Require approval from accounts manager
- **Benefit**: Prevents financial period manipulation

**Configuration:**
- **Threshold Values**: Define dollar amounts, percentage discounts, date ranges
- **Approver Hierarchy**: Primary approver, escalation approver
- **Timeout**: Auto-reject if not approved within X days
- **Notification**: Email/webhook when approval needed

---

### Permission Settings (Advanced)

The applet provides **four layers** of permission control for granular access management:

**Permission Sets**
- **Purpose**: Pre-configured bundles of permissions that can be assigned in bulk
- **Example**: "Sales Team" permission set includes READ + CREATE, excludes DELETE
- **Use Case**: Quickly onboard new users with consistent permissions

**User Permissions**
- **Purpose**: Override or extend permissions for specific individuals
- **Example**: Give one senior salesperson DELETE permission while others don't have it
- **Use Case**: Handle exceptions without creating new roles

**Team Permissions**
- **Purpose**: Grant permissions based on team membership (auto-assigned)
- **Example**: "North Region Sales Team" can only see North region customers
- **Use Case**: Automatic access control as team composition changes

**Role Permissions**
- **Purpose**: Permissions tied to organizational roles (Sales Rep, Manager, Admin)
- **Example**: "Manager" role has approval authority
- **Use Case**: Standard organizational hierarchy mapping

**Client-Side Permissions**
- **Purpose**: UI-level feature visibility (doesn't replace API-level security)
- **Example**: Hide "Void Invoice" button from users without void permission
- **Use Case**: Cleaner UI by hiding inaccessible features

**Role Pricing Scheme Link**
- **Purpose**: Automatically apply pricing tier based on user role
- **Example**: "Retail Sales" role always uses "Standard Pricing", "Wholesale Sales" role uses "Bulk Pricing"
- **Use Case**: Enforce pricing policy without manual price book selection

---

### Release Notes & Applet Log

**Release Notes**
- **Purpose**: Track applet version history and feature changes
- **Contents**: New features, bug fixes, breaking changes
- **Audience**: Administrators and power users
- **Use Case**: Plan user training around new features

**Applet Log**
- **Purpose**: Forensic audit trail of system changes and administrative actions
- **Logged Actions**: 
  - Settings changes (who changed what, when)
  - Permission modifications
  - Feature enable/disable events
- **Retention**: Permanent record for compliance
- **Use Case**: Troubleshoot issues, investigate unauthorized changes, demonstrate compliance to auditors

### Personalization Sub-Menu Items

User-level personalization options:

| Setting | Description | Route Path |
|---------|-------------|------------|
| **Personal Default Selection** | Set personal defaults for branch, location, etc. | `/personalization/personal-default-selection` |
| **Sidebar** | Customize sidebar layout and menu visibility | `/personalization/sidebar` |

### Permission Types

The applet supports **four permission levels** for granular access control:

| Permission Type | Description |
|-----------------|-------------|
| **Permission Set** | Predefined bundles of permissions that can be assigned to users/roles |
| **User Permission** | Direct permission assignments to individual users |
| **Team Permission** | Permissions granted to all members of a team |
| **Role Permission** | Permissions based on organizational roles |
| **Client-Side Permission** | UI-level feature visibility controls |
| **Role Pricing Scheme Link** | Links roles to specific pricing tiers |

#### Technical API Permission Codes
For system administrators and developers configuration backend permissions:

| Permission Code | Purpose |
|-----------------|---------|
| `TNT_API_DOC_INTERNAL_SALES_INVOICE_READ_TGT_GUID` | Read access to sales invoice documents |
| `TNT_API_DOC_INTERNAL_SALES_INVOICE_CREATE_TGT_GUID` | Permission to create new invoices |
| `TNT_API_DOC_INTERNAL_SALES_INVOICE_UPDATE_TGT_GUID` | Permission to update/edit existing invoices |
| `TNT_API_DOC_INTERNAL_SALES_INVOICE_DELIVERY_BRANCH_READ` | Access to delivery branch information |
| `TNT_TENANT_ADMIN` | Full tenant administration access |
| `TNT_TENANT_OWNER` | Owner-level access |

### Feature Visibility Toggles

The following features can be toggled on/off via client-side permissions or settings:

| Feature Code | Menu/Feature Controlled |
|--------------|------------------------|
| `SHOW_PICK_PACK_QUEUE_MENU` | Pick & Pack Queue menu visibility |
| `SHOW_SALES_INVOICE_TEMPLATE_MENU` | Sales Invoice Template menu visibility |
| `SHOW_FILE_IMPORT_MENU` | File Import menu visibility |
| `SHOW_INTERCOMPANY_MENU` | Intercompany menu visibility |
| `SHOW_FILE_EXPORT_MENU` | File Export menu visibility |
| `SHOW_SWAP_SERIAL_NUMBER` | Swap Serial menu visibility |

These can be configured via:
- **Client-Side Permission Settings**: Assign feature toggles to roles
- **Master Settings**: Global enable/disable via `HIDE_*` settings

### Printable Formats

The applet supports customizable printable document formats:

| Document Type | Purpose |
|---------------|---------|
| **Tax Invoice** | Standard sales invoice for customers with tax details |
| **Delivery Order (DO)** | Shipping document for logistics and fulfillment |
| **Custom Formats** | Additional formats configurable via Printable Format Settings |

Printable formats can be customized with:
- Company branding (logo, colors)
- Custom field layouts
- Dynamic content blocks
- Per-branch configurations
