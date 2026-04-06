---
title: "Pricebook Applet"
description: "Set up promotions, purchase with purchase (PWP), and campaigns for product selling based on segments, customers, and periods"
weight: 80
tags:
- applets
- pricing
- promotions
- sales
---

## Purpose and Overview

The **Pricebook Applet** is the central engine for managing dynamic and complex pricing strategies within the ERP ecosystem. It moves beyond simple static pricing by allowing organizations to set up sophisticated Promotions, Purchase with Purchase (PWP) rules, and targeted sales campaigns based on Customer Segments, specific Entities, and defined Validity Periods.

{{< callout type="info" >}}
**Core Concept:** The system links **what** you are selling (Products) to **who** is allowed the special price (Customer Segments) and **when** the rule applies (Campaign Periods).
{{< /callout >}}

## Key Features Overview

{{< cards >}}
  {{< card title="Promotional Campaigns" subtitle="Time-bound discounts and offers" link="#for-campaign-managers-setting-up-promotions" >}}
  {{< card title="Purchase with Purchase" subtitle="PWP rules and cross-selling" link="#purchase-with-purchase-pwp" >}}
  {{< card title="Customer Segmentation" subtitle="Targeted pricing for specific groups" link="#customer-segmentation" >}}
  {{< card title="Price Set Validation" subtitle="Automated expiry and limit controls" link="#price-set-validation" >}}
{{< /cards >}}

{{< figure src="/images/master-data/pricebook-overview-landscape.png" alt="From Messy Spreadsheets to Centralized Pricing: Your Guide to the Pricebook Applet" caption="From Manual Discounts to Centralized Campaigns: The Old Way (scattered notes, manual discount calculations, inconsistent pricing) vs The New Way (centralized digital pricebooks, automated campaign validity, structured customer segmentation)." >}}

## Key Concepts

### Understanding the Pricing Framework

Every advanced pricing system must address fundamental commercial rules. The Pricebook Applet provides structured handling through its internal modules:

| Aspect | Component | Practical Example |
|--------|-----------|------------------|
| **What** are the rules? | Price Book | "Year-End Clearance", "VIP Member Pricing" |
| **When** is it valid? | Price Set | Active from Dec 1st to Dec 31st |
| **Who** gets it? | Customer Segment | Retail Customers, Corporate Clients |

{{< callout type="tip" >}}
**Real-World Example**: A Pricing Admin (WHO) creates a "Festive Campaign" (WHAT) granting 15% off electronics. The Price Set limits this strictly to "VIP Members" (SEGMENT) and automatically expires on January 1st (WHEN). 
{{< /callout >}}

### Pricebook Hierarchy Structure

Think of the pricing promotion process as a structured flow:

```
Organization
│
├── Price Book ──→ WHAT is the pricing strategy/campaign?
│   │
│   └── Price Set ──→ WHEN is this active and under what conditions?
│       │
│       └── Validation Rules ──→ HOW are discounts capped?
│           │
│           └── Products/Categories ──→ WHAT items are affected?
│
└── Customer Segments ──→ WHO is eligible for this price?
    │
    └── Specific Entities ──→ WHICH exact customer ID?
```

**Flow Through the Hierarchy:**

1. **Organization**: Company-wide margin policies
2. **Price Book**: The container for a specific promotion type
3. **Price Set**: The specific instance (e.g., "Summer Sale 2024")
4. **Validation Rules**: Minimum purchase quantities or maximum usage limits
5. **Products**: The actual inventory SKUs receiving the markdown
6. **Customer Segments**: Broad grouping (e.g., "Wholesale")
7. **Specific Entities**: Overrides for exact customer accounts

### The "Golden Triangle" of Pricing

To effectively manage the discounting system, it is crucial to understand how the core modules work together to prevent pricing leaks.

| Component | Analogy | Definition | Example |
|-----------|---------|------------|---------|
| **Price Book** | The "Folder" | The overarching category or type of promotion. | **Purchase With Purchase (PWP)** |
| **Price Set** | The "Contract" | The specific active rule, defining dates and limits. | **Buy TV, Get Soundbar 50% Off (Nov)** |
| **Customer Segment** | The "VIP Pass" | The demographic that is allowed to use the Price Set. | **Gold Tier Loyalty Members** |

---

## Quick Start Guide

Get up and running quickly with these essential pricing workflows.

### For Pricing Administrators: Create a Price Book

**Goal:** Establish a new overarching category for a pricing strategy.

1. **Navigate**: Go to **Price Book** from the applet menu.
2. **Create New**: Click the **"+"** icon.
3. **Define Details**: name the Price Book (e.g., "Seasonal Promotions") and add a description.
4. **Save**: The Price Book is now available to host multiple specific "Price Sets".

### For Campaign Managers: Configure a Price Set

**Goal:** Launch a specific, time-bound promotion within a Price Book.

1. **Navigate**: Go to **Price Set** from the menu.
2. **Select Parent**: Choose which Price Book this belongs to.
3. **Set Validity**: Enter strict "Start" and "End" dates/times.
4. **Add Rules**: Define the items affected and exactly how much discount to apply.
5. **Activate**: Change status to Active to immediately push the new pricing to POS and Sales modules.

### For Sales Teams: Applying Customer Segments

**Goal:** Ensure a customer receives their targeted pricing.

1. **Review Customer File**: Verify the customer is tagged to the correct Segment (e.g., "Wholesale").
2. **Generate Quote/Order**: When adding items, the system will automatically query the Pricebook Applet.
3. **Auto-Calculation**: If the customer's Segment matches an Active Price Set, the discount is applied invisibly without manual calculation.

---

## For Campaign Managers

This section provides your guide to managing live promotions and specialized campaigns.

### Setting Up Promotions and PWP

**What is a Promotion vs PWP?**

* **Direct Promotion:** A straightforward markdown on an item or category during a specific period. (e.g., "20% off all Shoes in August")
* **Purchase With Purchase (PWP):** A conditional rule requiring a baseline action before unlocking a benefit. (e.g., "Spend RM 100 on Groceries, get a Umbrella for RM 5").

**Managing Purchase with Purchase (PWP):**

1. Ensure the parent **Price Book** is designated for PWP mechanics.
2. When creating the **Price Set**, configure the "Condition" items (the items that must be bought).
3. Configure the "Benefit" items (the items receiving the massive markdown).
4. Set usage limits (e.g., "Max 1 Umbrella per transaction") to prevent abuse.

{{< callout type="important" >}}
**PWP Integrity Protection:**
PWP limits are vital. If you do not cap the Benefit items, a customer who spends the baseline RM 100 could theoretically buy 50 discounted Umbrellas. Always utilize the "Max Quantity" validation rule available within the Price Set module.
{{< /callout >}}

### Customer Segmentation Validation

Campaigns are only as effective as their targeting. By linking a Price Set to a specific Customer Segment, you prevent standard retail buyers from accessing wholesale or VIP loyalty rates.

If a Sales Rep tries to quote a promotional item to a customer not in the assigned Segment, the Pricebook engine will reject the application and return the standard Base Price automatically.

---

## For Pricing Administrators

This section covers the technical setup and maintenance of the core engine.

### Price Set Validation and Expiry

Pricing errors directly impact the bottom line. The Pricebook Applet utilizes a strict state-machine to protect margins.

**The Lifecycle of a Price Set:**

1. **Draft:** The rule is being configured. It has no effect on live sales.
2. **Active:** The rule is live. It will automatically apply to any transaction that meets the Date, Segment, and Item criteria.
3. **Expired:** Once the "Valid To" timestamp passes, the system instantly reverts pricing back to the standard Item Master rate. No manual intervention is needed to end a sale.

**Prioritization Logic:**
What happens if an item is caught in *two* active Price Sets? (e.g., A "Clearance Sale" and a "VIP Discount"). The administrator must define the priority ranking within the settings so the system knows whether to stack discounts or apply the "best price" rule. 

### Integration Points

The Pricebook Applet works invisibly in the background, feeding data to frontline sales tools:
- **Internal Sales Quotation Applet:** Auto-populates line-item discounts during quoting.
- **POS General Applet:** instantly adjusts terminal pricing during cashier ringing.
- **Customer Maintenance Applet:** Determines segment eligibility based on CRM profiles.
