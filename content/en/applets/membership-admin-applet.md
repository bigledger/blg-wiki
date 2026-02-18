---
title: "Membership Admin Applet"
description: "Comprehensive administration system for managing member profiles, points, currencies, and privileges"
tags:
- membership-management
- loyalty-program
- points-system
- member-privileges
- customer-retention
weight: 60
---

## Purpose and Overview

The **Membership Admin Applet** is the central control hub for your organization's membership and loyalty programs. It empowers you to manage member data, define point systems, configure currency conversions, and orchestrate member privileges from a single interface.

{{< callout type="info" >}}
**Core Concept**: This applet acts as the **backend engine** for your loyalty ecosystem, handling the complex logic of **who** your members are, **what** they are entitled to, and **how** they earn and burn points.
{{< /callout >}}

## Key Features Overview

### Who Benefits from This Applet?

**Marketing Managers:**
- Create and manage member labels for targeted campaigns
- Define membership classes and privileges
- Configure point earning and redemption rules

**Customer Support & Operations:**
- Quick access to member profiles and history
- Ability to perform manual point adjustments
- Manage member suspensions and status

**System Administrators:**
- Configure system-wide settings and field visibility
- Manage webhooks for integration with external systems
- specific permission controls for teams and users

**Finance Teams:**
- Oversee points-to-money conversion rates
- Audit point transactions and liability
- Generate membership financial reports

### What Problems Does This Solve?

**The Fragmented Loyalty Data Problem:**

Managing a membership program often involves scattered spreadsheets, disconnected systems for points and profiles, and manual calculations.
- Disconnected member data leading to poor customer service
- Inflexible point systems that are hard to change
- Lack of visibility into liability (outstanding points)
- Difficulty in segmenting members for tiers

**The Membership Admin Solution:**

- **Centralized Profile Management** - A single source of truth for all member data, accessible via mobile and web.
- **Flexible Currency Logic** - Support for multiple point currencies and conversion rates.
- **Dynamic Tiering** - Automated or manual management of Member Classes and Privileges.
- **Integration Ready** - Webhooks and API support for connecting to POS and eCommerce.
- **Audit capabilities** - Full visibility into point adjustments and member changes.

## Key Features Overview

{{< cards >}}
  {{< card title="Member Management" subtitle="Create, edit, and manage member profiles" link="#member-management" >}}

  {{< card title="Points & Currencies" subtitle="Configure point types and conversion rates" link="#points--currency-management" >}}

  {{< card title="Privileges & Labels" subtitle="Tiering and segmentation tools" link="#privileges--labels" >}}

  {{< card title="Bulk Operations" subtitle="Upload master data and transactions" link="#bulk-operations" >}}

  {{< card title="Configuration" subtitle="System settings and permissions" link="#configuration--settings" >}}

  {{< card title="Reporting" subtitle="Membership insights and analytics" link="#reporting" >}}
{{< /cards >}}



## Key Concepts

### Understanding the Membership Framework

To effectively manage the system, it is crucial to understand how **Members**, **Classes**, **Labels**, and **Currencies** work together.

| Concept | Definition | Example |
|---------|------------|---------|
| **Member** | The individual customer profile. | John Doe |
| **Member Class** | A hierarchical tier that grants specific benefits. Usually mutually exclusive. | **Silver**, **Gold**, **Platinum** |
| **Member Label** | A flexible tag for segmentation. A member can have multiple labels. | **VIP**, **Vegetarian**, **Golfer** |
| **Points Currency** | A specific type of value a member can hold. | **Reward Points** (spendable), **Tier Miles** (for status) |

### The "Points Ecosystem"

The system allows for complex point interactions:

1.  **Earning**: Members earn **Points** (e.g., 1 Point per $1 spend).
2.  **Conversion**: 
    -   **Points-to-Points**: Convert *Reward Points* to *AirMiles*.
    -   **Points-to-Money**: Redeem *100 Points* for *$1 Off*.
3.  **Expiry**: Points can be set to expire (e.g., "End of Year" or "Rolling 12 Months").

{{< callout type="tip" >}}
**Strategy**: Use **Member Classes** for long-term loyalty tiers (Status) and **Member Labels** for short-term campaign targeting (Segmentation).
{{< /callout >}}

---

## Quick Start Guide

Get your membership program running with these role-specific workflows.

### For Admins: Initial System Setup

**Goal:** Configure the foundational elements of your loyalty program.

**Step 1: Define Point Currencies** (`Membership Points Currency Listing`)
1.  Navigate to **Membership Points Currency Listing**.
2.  Click **Create**.
3.  Define the currency name (e.g., "Loyalty Points").
4.  Set the **Expiry Policy** (e.g., "1st January of next year").
5.  Enable/Disable **Transferability** (can members transfer points to others?).

**Step 2: Set Up Conversions** (`Points to Money` / `Points to Points`)
1.  Navigate to **Membership Points to Money Currency Conversion**.
2.  Create a rule: "100 Loyalty Points = 1.00 MYR".
3.  Set the **Start Date** and **End Date** for this rate (useful for limited-time promotions).

**Step 3: Configure Fields** (`Settings > Field Settings`)
1.  Go to **Settings** > **Field Configuration**.
2.  Toggle fields like **IC Number**, **Date of Birth**, **Gender** based on your data privacy needs.
3.  Set "Mandatory" flags for required fields.

### For Marketing: Creating Tiers & Segments

**Goal:** Set up a "Gold Tier" with specific privileges.

1.  **Create Member Class** (`Member Privilege`):
    -   Go to **Member Privilege**.
    -   Click **New** and name it "Gold Tier".
    -   Set the entry criteria (e.g., "Spend > $5000").

2.  **Assign Labels** (`Member Label`):
    -   Create a "VIP" label.
    -   Use **Member Listing** to filter high-value customers and bulk-assign this label.

### For Support: Managing a Member

**Goal:** Help a customer who needs a point adjustment.

1.  **Search Member** (`Member Listing`):
    -   Enter name, phone, or email in the search bar.
    -   Click the **Eye Icon** to view their 360-degree profile.

2.  **Adjust Points** (`Member Profile > Add Point Adjustment`):
    -   Click **Add Point Adjustment**.
    -   Select **Currency**: "Loyalty Points".
    -   Enter **Amount**: `+500` (Credit) or `-500` (Debit).
    -   Enter **Reason**: "Goodwill for service delay".
    -   Click **Submit**.

---

## Member Management

**The central registry of your customers.**

### Member Profile 360

Clicking on any member in the **Member Listing** opens their full profile, giving you a complete view of:

-   **Profile Details**: Contact info, join date, current tier.
-   **Wallet Balance**: Current balance for all point currencies.
-   **Transaction History**: Every point earned, redeemed, or adjusted.
-   **Privileges**: Active Member Class and Labels.



### Manual Adjustments

Sometimes you need to intervene manually. The **Point Adjustment** feature allows authorized staff to credit or debit points directly.

**Best Practices:**
-   Always provide a clear **Reason Code** or description for audit trails.
-   Use negative values to correct over-crediting.
-   Adjustments are real-time and reflected immediately in the member's app.

---

## Points & Currency Management

**The engine of your loyalty program.**

### Multiple Currencies

Don't limit yourself to just one type of point. The system supports multiple concurrent currencies:

-   **Spending Points**: For redemption (e.g., "Coins").
-   **Status Points**: For tier progression (e.g., "Tier Miles").
-   **Campaign Points**: Temporary points for specific events.

### Conversion Rules

Define how points move and change value.

-   **Points-to-Points**: Allow members to convert "Coins" into "Partner Mils".
-   **Points-to-Money**: The most common redemption. Define the exchange rate (e.g., 100 Points = $1). You can have different rates for different Member Classes (e.g., Gold members get better rates).

---

## Configuration & Settings

Fine-tune the applet behavior to match your business rules.

**Settings Menu Highlights:**

-   **General Settings:**
    -   **Default Selection:** Set default currencies and member types to speed up data entry.
    -   **Card Type:** Define if you use physical card numbers or virtual IDs.

-   **Customization:**
    -   **Field Configuration:** specific control over which fields are visible, editable, or mandatory on the registration form.
    -   **Custom Status:** Create custom workflow statuses beyond standard "Active"/"Inactive".

-   **Integration:**
    -   **Webhooks:** Configure URL endpoints to receive real-time updates on member events (e.g., "On Register", "On Tier Upgrade").

-   **Permissions:**
    -   **Permission Wizard:** Step-by-step guide to setting up user access matrices.
    -   **Role/Team Permissions:** Granular control over who can approve adjustments, view sensitive PII data, or change configuration.

---

## FAQ

**Q: Can I support multiple types of points?**
A: Yes, you can create multiple "Currencies" (e.g., Loyalty Points, Store Credit, Status Miles) and manage them independently with different expiry rules and conversion rates.

**Q: How do I bulk import members from an old system?**
A: Use the **Member Master Data Listing** feature. You can download a CSV template, populate it with your existing member data, and upload it to create profiles in bulk.

**Q: Can I set points to expire automatically?**
A: Yes. When configuring a **Points Currency**, you can set expiry rules, such as "Expires 12 months from earning" or "Expires on 31st December". The system handles the cleanup automatically.

**Q: What is the difference between a Member Class and a Label?**
A:
-   **Member Class** is for Tiers (Bronze, Silver, Gold). A member usually holds only one class at a time, and it often determines their core benefits and earning rates.
-   **Labels** are flexible tags (e.g., "VIP", "Vegetarian", "Golfer"). A member can have many labels. These remain useful for marketing segmentation and ad-hoc grouping.

**Q: How does this integrate with my POS?**
A: The applet acts as the backend. POS systems connect via API to look up members by phone/ID, check balances, and post transactions. Webhooks can also be used to push updates (like a tier upgrade) back to the POS or CRM.
