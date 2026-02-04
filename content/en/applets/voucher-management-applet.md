---
title: "Voucher Management Applet"
description: "Comprehensive voucher and ticket management system for marketing campaigns, loyalty programs, and event ticketing"
tags:
- voucher-management
- tickets
- loyalty-programs
- marketing-campaigns
- event-management
---

## Purpose and Overview

### Who Benefits from This Applet?

**Marketing Teams:**
- Create promotional vouchers and discount codes
- Track campaign performance through redemption rates
- Manage recurring promotional programs

**Event Managers:**
- Issue and track event tickets
- Monitor scanned entries in real-time
- Handle bulk ticket imports

**CRM Administrators:**
- Configure voucher rules and restrictions
- Manage customer loyalty rewards
- Set up automated recurring voucher issuance

**Finance Teams:**
- Track voucher liabilities and redemptions
- Generate reports on promotional costs
- Monitor discounts applied across channels

### What Problems Does This Solve?

**Traditional Voucher Management Challenges:**
- Manual voucher code generation prone to errors
- No real-time tracking of redemption status
- Difficulty managing bulk voucher campaigns
- Limited visibility into promotion effectiveness

**The Voucher Management V2 Solution:**
- **Centralized voucher creation** - Generate unique codes automatically
- **Real-time redemption tracking** - Know instantly when vouchers are used
- **Event ticket integration** - Manage tickets with scan verification
- **Recurring voucher automation** - Schedule periodic voucher issuance
- **Bulk import capabilities** - Upload thousands of vouchers from files

## Key Features Overview

{{< cards >}}
  {{< card title="Voucher Management" subtitle="Create and manage promotional vouchers" link="#voucher-management" >}}

  {{< card title="Ticket Management" subtitle="Event tickets and passes" link="#ticket-management" >}}
  
  {{< card title="Scanned Events" subtitle="Real-time scan tracking" link="#scanned-events" >}}

  {{< card title="Recurring Vouchers" subtitle="Automated scheduled issuance" link="#recurring-vouchers" >}}

  {{< card title="Import Vouchers" subtitle="Bulk voucher file uploads" link="#import-vouchers" >}}

  {{< card title="Settings & Permissions" subtitle="Configure system behavior" link="#configuration--settings" >}}
{{< /cards >}}

{{< figure src="/images/voucher-management-applet/voucher-overview-infographic.png" alt="Unlock Your Promotion Potential: The All-in-One Voucher & Ticket System - showing the challenges of manual promotions vs the centralized automated solution" caption="Unlock Your Promotion Potential: From disconnected manual processes to a centralized, automated voucher and ticket management platform." >}}

---

## Key Concepts

### Understanding Vouchers vs Tickets

| Concept | Description | Use Case |
|---------|-------------|----------|
| **Voucher** | A redeemable code for discounts, credits, or gifts | Promotional campaigns, loyalty rewards |
| **Ticket** | An entry pass or access token | Events, concerts, conferences |
| **Recurring Voucher** | Auto-generated vouchers on a schedule | Monthly loyalty rewards, subscription perks |
| **Scanned Event** | Record of when a ticket/voucher was verified | Entry tracking, redemption proof |

### Voucher Lifecycle

```
Created → Issued → Active → Redeemed/Expired
   │         │        │          │
   │         │        │          └── End states
   │         │        └── Ready for use
   │         └── Assigned to customer
   └── Draft voucher definition
```

---

## Quick Start Guide

### For Marketing: Create Your First Voucher

**Goal:** Create a promotional voucher code for a campaign

1. **Navigate**: Go to **Vouchers** from the sidebar
2. **Create**: Click **"+"** or **"New Voucher"**
3. **Configure** the voucher details as shown below:

{{< figure src="/images/voucher-management-applet/voucher-edit-details.png" alt="Create Voucher Form" caption="Configure voucher code, discount type, value, validity dates, and usage limits." >}}

4. **Save**: Click **Create** to activate the voucher

### For Event Managers: Issue Event Tickets

**Goal:** Create tickets for an upcoming event

1. **Navigate**: Go to **Tickets** from the sidebar
2. **Create Event**: Click **"+"** to create new ticket batch
3. **Configure** the ticket details:

{{< figure src="/images/voucher-management-applet/ticket-edit-details.png" alt="Create Ticket Form" caption="Enter event name, set ticket quantity, define ticket types, and assign to customers." >}}

4. **Issue**: Generate and distribute ticket codes

### For Admins: Set Up Recurring Vouchers

**Goal:** Automate monthly loyalty rewards

1. **Navigate**: Go to **Recurring Vouchers**
2. **Create Rule**: Click **"+"** to set up automation
3. **Configure** the recurring schedule:

{{< figure src="/images/voucher-management-applet/recurring-voucher-edit-details.png" alt="Recurring Voucher Setup" caption="Set schedule (daily, weekly, monthly), define voucher template, and select target recipients." >}}

4. **Activate**: Enable the recurring schedule

---

## Voucher Management

### Creating Vouchers

The main **Voucher** section allows you to:

- **Create single vouchers** - For specific promotions
- **Generate batch codes** - Multiple unique codes for campaigns
- **Set restrictions** - Minimum purchase, product categories, customer segments
- **Track usage** - Real-time redemption monitoring

### Key Fields

| Field | Purpose | Example |
|-------|---------|---------|
| **Voucher Code** | Unique identifier customers enter | WELCOME20 |
| **Discount Type** | Percentage or Fixed Amount | 20% off |
| **Minimum Purchase** | Required spend to use voucher | RM 100 |
| **Valid From/To** | Promotional period | Jan 1 - Jan 31 |
| **Usage Limit** | Max times voucher can be used | 100 redemptions |
| **Per-Customer Limit** | Max uses per customer | 1 per customer |

### Voucher Edit Form Tabs

When editing a voucher, click on a voucher row to open the edit panel. The following tabs are available:

#### Details Tab

The **Details** tab contains core voucher information including code, name, type, discount value, validity dates, and usage limits.

{{< figure src="/images/voucher-management-applet/voucher-edit-details.png" alt="Voucher Edit Details Tab showing code, name, type, and validity configuration" caption="Details Tab: Configure the voucher code, name, discount type, value, and validity period." >}}

#### Image Tab

Upload voucher artwork or promotional images that can be displayed to customers.

{{< figure src="/images/voucher-management-applet/voucher-edit-image.png" alt="Voucher Edit Image Tab for uploading promotional artwork" caption="Image Tab: Upload promotional images for your voucher." >}}

#### Website Link Tab

Configure external URLs for voucher landing pages or promotional campaigns.

{{< figure src="/images/voucher-management-applet/voucher-edit-website-link.png" alt="Voucher Edit Website Link Tab for configuring external URLs" caption="Website Link Tab: Set up external landing page URLs." >}}

#### Apply Rules Tab

Set conditions for voucher applicability including products, categories, and channels.

{{< figure src="/images/voucher-management-applet/voucher-edit-apply-rules.png" alt="Voucher Edit Apply Rules Tab for setting applicability conditions" caption="Apply Rules Tab: Define where and when the voucher can be used." >}}

#### Rules-Doc Hdr Tab

Document header rules for invoice and receipt integration.

{{< figure src="/images/voucher-management-applet/voucher-edit-rules-doc-hdr.png" alt="Voucher Edit Rules-Doc Hdr Tab for document header configuration" caption="Rules-Doc Hdr Tab: Configure document header rules for integration." >}}

#### Rules-Multi Line Tab

Multi-line item rules for complex discount logic across multiple products.

{{< figure src="/images/voucher-management-applet/voucher-edit-rules-multi-line.png" alt="Voucher Edit Rules-Multi Line Tab for complex discount rules" caption="Rules-Multi Line Tab: Set up complex multi-product discount rules." >}}

#### Rules-Single Line Tab

Single line item rules for simple product-specific discounts.

{{< figure src="/images/voucher-management-applet/voucher-edit-rules-single-line.png" alt="Voucher Edit Rules-Single Line Tab for simple product discounts" caption="Rules-Single Line Tab: Configure simple single-product discount rules." >}}

#### Ticket Management Tab

View and manage tickets that have been generated from this voucher.

{{< figure src="/images/voucher-management-applet/voucher-edit-ticket-management.png" alt="Voucher Edit Ticket Management Tab showing generated tickets" caption="Ticket Management Tab: View and manage tickets linked to this voucher." >}}

#### Audit Tab

Full audit trail showing all changes and redemptions for this voucher.

{{< figure src="/images/voucher-management-applet/voucher-edit-audit.png" alt="Voucher Edit Audit Tab showing change history" caption="Audit Tab: Complete audit trail of voucher modifications and usage." >}}

---

## Ticket Management

### Managing Event Tickets

The **Ticket** module provides:

- **Ticket generation** - Create unique ticket codes
- **Assignment tracking** - Know who holds each ticket
- **Scan verification** - Validate tickets at entry points
- **Capacity management** - Track available vs sold tickets

### Ticket Edit Form Tabs

When editing a ticket, click on a ticket row to open the edit panel. The following tabs are available:

#### Details Tab

The **Details** tab shows serial number, item name, assignee, status, validity period, and activation pin.

{{< figure src="/images/voucher-management-applet/ticket-edit-details.png" alt="Ticket Edit Details Tab showing serial number and assignee information" caption="Details Tab: View and edit ticket details including serial number, assignee, and validity." >}}

#### Ticket History Tab

Complete movement and redemption history for audit trail.

{{< figure src="/images/voucher-management-applet/ticket-edit-history.png" alt="Ticket History Tab showing movement and redemption records" caption="Ticket History Tab: Track all ticket movements and redemption events." >}}

---

## Scanned Events

### Real-Time Scan Tracking

The **Scanned Events** section shows:

- **Scan history** - When and where tickets/vouchers were scanned
- **Verification status** - Valid, Already Used, Expired
- **Location tracking** - Which entry point processed the scan
- **Timestamp logs** - Detailed audit trail

### Scanned Event Edit Form Tabs

When viewing a scanned event, click on a row to open the details panel. The following tabs are available:

#### Details Tab

The **Details** tab shows serial number, item name, contact info, reward points, status, and remarks.

{{< figure src="/images/voucher-management-applet/scanned-event-edit-details.png" alt="Scanned Event Details Tab showing scan information" caption="Details Tab: View scan details including serial number, contact info, and reward points." >}}

#### Attachment Tab

View uploaded images associated with the scanned event.

{{< figure src="/images/voucher-management-applet/scanned-event-edit-attachments.png" alt="Scanned Event Attachment Tab showing uploaded images" caption="Attachment Tab: View images uploaded during the scan event." >}}

---

## Recurring Vouchers

### Automated Voucher Issuance

Set up recurring voucher programs for:

- **Birthday rewards** - Auto-issue on customer birthdays
- **Loyalty milestones** - Reward after X purchases
- **Monthly perks** - Subscription member benefits
- **Anniversary rewards** - Celebrate customer anniversaries

### Recurring Voucher Edit Form Tabs

When editing a recurring voucher, click on a row to open the edit panel. The following tabs are available:

#### Details Tab

The **Details** tab contains voucher code, name, type, status, and schedule configuration.

{{< figure src="/images/voucher-management-applet/recurring-voucher-edit-details.png" alt="Recurring Voucher Details Tab showing schedule configuration" caption="Details Tab: Configure the recurring voucher code, name, and schedule." >}}

#### Treatment Value Tab

Define the discount or benefit value for generated vouchers.

{{< figure src="/images/voucher-management-applet/recurring-voucher-edit-treatment-value.png" alt="Recurring Voucher Treatment Value Tab" caption="Treatment Value Tab: Set the discount or benefit value." >}}

#### Apply Rules Tab

Set conditions for when the recurring voucher should be applied.

{{< figure src="/images/voucher-management-applet/recurring-voucher-edit-apply-rules.png" alt="Recurring Voucher Apply Rules Tab" caption="Apply Rules Tab: Define application conditions." >}}

#### Image Tab

Upload promotional images for the voucher template.

{{< figure src="/images/voucher-management-applet/recurring-voucher-edit-image.png" alt="Recurring Voucher Image Tab" caption="Image Tab: Upload promotional images for generated vouchers." >}}

---

## Import Vouchers

### Bulk Voucher Upload

The **Import Vouchers** feature allows:

- **CSV/Excel upload** - Import thousands of codes at once
- **Validation checks** - Verify format before import
- **Duplicate detection** - Prevent code conflicts
- **Batch assignment** - Assign to campaigns in bulk

---

## Configuration & Settings

### Settings Menu Overview

Access settings via **Settings** in the sidebar:

#### Default Settings
Configure default values for new vouchers:
- Default validity period
- Default discount type
- Default usage limits

#### Field Configuration
Customize visible fields and required inputs for voucher creation.

#### Webhook Configuration
Set up integrations to notify external systems when vouchers are:
- Created
- Redeemed
- Expired

#### Feature Visibility
Control which features are visible to different user roles.

#### Permissions
Manage access control:
- **Permission Sets** - Define role-based access
- **User Permissions** - Individual user access
- **Team Permissions** - Team-level access
- **Role Permissions** - Role-based access control

---

## Personalization

### Personal Settings

#### Personal Default Selection
Set your preferred defaults when creating new vouchers.

#### Sidebar Customization
Arrange sidebar menu items to match your workflow.

---

## FAQ

**Q: Can I create vouchers that work across multiple stores?**
A: Yes, voucher scope can be configured to work globally or limited to specific locations.

**Q: How do I prevent voucher fraud?**
A: Set per-customer usage limits, require minimum purchase amounts, and enable one-time use restrictions.

**Q: Can vouchers be combined with other discounts?**
A: This is configurable per voucher - you can allow or prevent stacking.

**Q: How do I track which marketing campaign a voucher belongs to?**
A: Use voucher codes with campaign prefixes (e.g., "SUMMER2024-001") and filter reports accordingly.

**Q: What happens to unused vouchers after expiry?**
A: Expired vouchers automatically become inactive and cannot be redeemed. They remain in the system for reporting purposes.
