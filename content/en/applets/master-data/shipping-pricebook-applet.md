---
title: "Shipping Pricebook Applet"
description: "Comprehensive shipping fee engine for managing complex delivery costs, handling charges, and fuel surcharges with granular rule-based logic."
tags:
- shipping-management
- logistics-controls
- fee-automation
- pricebook-rules
- surcharge-calculation
weight: 150
---

## Purpose and Overview

The **Shipping Pricebook Applet** is a sophisticated logistics engine designed to automate and standardize the calculation of shipping-related fees. In a modern trading or e-commerce environment, shipping costs are rarely static; they fluctuate based on delivery regions, item characteristics, customer profiles, and service levels.

{{< callout type="info" >}}
**Core Concept**: The system allows you to define a hierarchy of **Pricebooks** and **Pricesets** that use complex **Rules** to trigger specific **Treatments** (Fees) automatically during document creation.
{{< /callout >}}

## Key Features Overview

### Who Benefits from This Applet?

**Logistics & Operations Managers:**
- **Automated Precision**: Eliminate manual fee entry errors and ensure consistent application of delivery charges.
- **Dynamic Surcharges**: Easily manage fluctuating costs like fuel surcharges or peak-season handling fees without changing base prices.
- **Zonal Control**: Define specific rates for different geographic regions (e.g., local delivery vs. international sea freight).

**Sales & Customer Service Teams:**
- **Real-time Quotes**: Instantly provide accurate shipping and handling costs to customers during the order process.
- **Policy Enforcement**: Automatically apply "Free Shipping" or discounted rates for VIP customers or high-value orders based on predefined rules.
- **Transparency**: Clear visibility into why specific fees were applied, reducing customer disputes.

**Finance & Accounting Teams:**
- **Full Cost Recovery**: Ensure that all logistics-related expenses (handling, fuel, transport) are captured and recovered from the customer.
- **Audit Integrity**: Maintain a complete audit trail of fee calculations for every transaction.
- **Revenue Protection**: Prevent under-billing caused by missing or outdated shipping rates.

### What Problems Does This Solve?

**The "Manual Shipping Guesswork" Problem:**
Traditional systems often rely on staff to "eye-ball" shipping costs. Common issues include:
- Inconsistent charging between different sales reps.
- Forgotten fuel surcharges leading to margin erosion.
- Difficulties in handling complex "if-this-then-that" shipping logic manually.

**The Shipping Pricebook Solution:**
- **Logic-Driven Fees** - Fees are triggered only when specific conditions (Rules) are met.
- **Priority Logic** - Multiple pricebooks can coexist, with the system intelligently selecting the most relevant one.
- **Multi-Layered Calculations** - Combine standard shipping, handling, and fuel surcharges into a single automated workflow.
- **Granular Control** - Apply rules at the Header (entire order), Multi-Line (item groups), or Single-Line (specific product) level.

## Key Features Inventory

{{< cards >}}
  {{< card title="Pricebook Hierarchy" subtitle="Organize rates by customer type or service level" link="#pricebook-hierarchy-structure" >}}

  {{< card title="Granular Rules" subtitle="Define rules for Header, Multi-Line, and Single-Line items" link="#understanding-the-rules-engine" >}}

  {{< card title="Flexible Treatments" subtitle="Configure Shipping, Handling, and Fuel Fees" link="#understanding-treatment-fees" >}}

  {{< card title="Priority Logic" subtitle="Manage which pricebook takes precedence" link="#the-golden-triangle-of-shipping-logic" >}}

  {{< card title="Regional Zonal Pricing" subtitle="Apply fees based on delivery destination zones" link="#regional-rules-deep-dive" >}}

  {{< card title="Distance-Based Support" subtitle="Calculate fees based on warehouse-to-destination distance" link="#step-2-define-logic-context-settings--applet-settings" >}}
{{< /cards >}}

{{< figure src="/images/shipping-pricebook-applet/shipping-pricebook-applet-overview-infographic.png" alt="Shipping Pricebook Applet Overview: Before and After" caption="From Manual Guesswork to Automated Precision: How the Shipping Pricebook Applet transforms your logistics fee calculations and empowers your Logistics, Sales, and Finance teams." >}}

---

## Key Concepts

### Understanding the Shipping Framework

Every shipping calculation must address three fundamental aspects. The Shipping Pricebook Applet provides structured handling:

| Aspect | Component | Practical Example |
|--------|-----------|------------------|
| **Who** is it for? | Pricebook Group | VIP Customers, Retail Outlets, International Dealers |
| **What** triggers it? | Rules Logic | If Region is "North America" AND Order Weight > 100kg |
| **How** is it charged? | Treatment Type | Flat $50 fee OR 5% of Transaction Amount |

---

### Pricebook Hierarchy Structure

Think of the shipping fee logic as a structured flow that narrows down from general categories to specific charges:

```mermaid
graph TD
    PB[Shipping Pricebook] --> PS1[Priceset: Free Shipping]
    PB --> PS2[Priceset: Heavy Goods Surcharge]
    PB --> PS3[Priceset: Standard Logistics]
    
    PS1 --> R1[Rule: Amount > $1000]
    PS1 --> T1[Treatment: $0 Fee]
    
    PS2 --> R2[Rule: Weight > 50kg]
    PS2 --> T2[Treatment: $50 Handling]
    
    PS3 --> R3[Rule: Default]
    PS3 --> T3[Treatment: $15 Shipping]
```

**Flow Through the Hierarchy:**

1.  **Pricebook**: The broad container (e.g., "B2B Standard Rates").
2.  **Priceset**: A specific scenario (e.g., "West Malaysia Distribution").
3.  **Rules**: The "If" conditions (e.g., "Must be Branch HQ").
4.  **Priority**: Lower numerical value = Higher precedence.
5.  **Treatment**: The final financial calculation logic.

---

### Pricebook vs Priceset: What is the Difference?

A common point of confusion is the relationship between a **Pricebook** and a **Priceset**. They serve distinct roles in the pricing hierarchy:

| Aspect | Pricebook | Priceset |
|--------|-----------|----------|
| **Role** | The master container or category | A specific rule instance within a Pricebook |
| **Analogy** | A filing cabinet drawer labelled by topic | An individual policy document inside that drawer |
| **Quantity** | You create one per shipping strategy | You create many within a single Pricebook |
| **Contains** | One or more Pricesets | Rules, Treatments, and Priority settings |
| **Example** | "Domestic Shipping Rates" | "Free Shipping for Orders > RM 500" |

{{< callout type="tip" >}}
**Think of it this way:** The Pricebook answers *"What category of shipping logic is this?"* while the Priceset answers *"What is the specific rule, when does it apply, and how much does it charge?"*
{{< /callout >}}

**Scenario: Two Shipping Pricebooks for a Multi-Channel Business**

A company sells both domestically and internationally. They set up two separate Shipping Pricebooks to keep the logic clean and manageable:

```
Pricebook A: "Domestic Shipping"
├── Priceset 1: "West Malaysia Standard" (Priority 100)
│   Rule: Delivery Region = Selangor, KL, Penang
│   Treatment: Standard Shipping = RM 8 (Absolute)
│
├── Priceset 2: "East Malaysia Surcharge" (Priority 50)
│   Rule: Delivery Region = Sabah, Sarawak
│   Treatment: Standard Shipping = RM 25 (Absolute) + Handling = RM 10 (Absolute)
│
└── Priceset 3: "Free Domestic Shipping" (Priority 1)
    Rule: Transaction Amount > RM 500
    Treatment: Standard Shipping = RM 0 (Absolute)

Pricebook B: "International Shipping"
├── Priceset 1: "ASEAN Countries" (Priority 100)
│   Rule: Delivery Region = Singapore, Thailand, Indonesia
│   Treatment: Standard Shipping = RM 45 (Absolute) + Fuel Surcharge = 3% of Transaction Amount
│
└── Priceset 2: "Rest of World" (Priority 200)
    Rule: Default (no region filter)
    Treatment: Standard Shipping = RM 120 (Absolute) + Fuel Surcharge = 5% of Transaction Amount
```

In this setup:
- **Pricebook A** handles all domestic delivery logic. Its three Pricesets cover West Malaysia, East Malaysia, and a free-shipping override. Because "Free Domestic Shipping" has the lowest Priority number (1), it wins whenever a domestic order exceeds RM 500 — regardless of region.
- **Pricebook B** handles international orders separately. ASEAN countries get a lower base rate and fuel surcharge compared to the rest of the world.

By separating domestic and international into two Pricebooks, the logistics team can manage, audit, and update each strategy independently without affecting the other.

---

### The "Golden Triangle" of Shipping Logic

To effectively manage the system, it is crucial to understand how **Rules**, **Priority**, and **Treatments** interact.

| Component | Analogy | Definition | Example |
|-----------|---------|------------|---------|
| **Rules** | The "Gatekeeper" | The specific conditions that must be true for a fee to apply. | **Region = "Sabah"** |
| **Priority** | The "Tie-Breaker" | Decides which rule wins if multiple match an order. | **Priority 1 vs Priority 100** |
| **Treatment** | The "Bill" | The actual math of the fee calculation. | **5% Fuel Surcharge** |

---

## Quick Start Guide

Get up and running quickly with these essential workflows.

### For Sales Team: Check Applied Fees

**Goal:** Understand why a shipping fee was applied to your order in 3 steps.

1.  **Open Document**: Go to your **Sales Order** or **Invoice**.
2.  **Review Header**: Look for the **Shipping Info** tab.
3.  **Check Details**: The system displays the active **Pricebook Header** and the breakdown of Shipping, Handling, and Fuel charges.

**Pro Tip:** If fees seem missing, verify that the **Customer Member Class** matches the rules in the active pricebook.

---

### For Logistics Managers: Create a Regional Surcharge

**Goal:** Add a $20 handling fee for all deliveries to "East Malaysia" in 5 steps.

1.  **Navigate**: Go to **Shipping Pricebook Listing** and open your primary pricebook.
    {{< figure src="/images/shipping-pricebook-applet/shipping-pricebook-applet-priceset-listing.png" alt="Priceset Listing" caption="Navigate to the Priceset module to manage all your pricing scenarios." >}}
2.  **Create Priceset**: Click **"+" (Add Priceset)** → Name it "East Malaysia Surcharge" → Set Priority to `50`.
    {{< figure src="/images/shipping-pricebook-applet/shipping-pricebook-applet-priceset-add.png" alt="Add a new Priceset" caption="Configure priority and negate logic for your new handling fee rule." >}}
3.  **Add Regional Rule**: 
    - Go to **Rules - Doc Hdr** tab.
    - Click **"Add Delivery Region Rule"**.
    - Select "Sabah" and "Sarawak" from the list.
4.  **Set Treatment**:
    - Go to **Treatment** tab.
    - Check **Handling Fee**.
    - Set Price Source to **Absolute** and Value to `20.00`.
5.  **Finalize**: Click **Create**.

---

### For Admins: Initial System Setup

**Goal:** Configure the foundational settings for the Shipping Pricebook engine.

1.  **Prepare Master Data**: Ensure all **Delivery Regions**, **Zonal Codes**, and **Member Classes** are up to date.
2.  **Toggle Applet Settings** (`Settings > Applet Settings`):
    - **Default Branch/Location**: Pre-fills origin data for new pricebooks.
    - **Visibility Rules**: Hide specific pricing fields if sales reps should only see the final total.
3.  **Validate Logic**:
    - Create a "Draft" Priceset with a high priority (e.g., `1`).
    - Attempt to create a mock Sales Order matching the draft rules.
    - Verify fees appear correctly before setting the Priceset to `Active`.

---

## Understanding the Rules Engine

The Applet provides layers of rules to handle every possible business scenario.

### 1. Header Rules (Doc Hdr)
Logic that applies to the **entire document as a whole**. When a user selects a Header Rule, the system evaluates the order-level attributes — not individual line items. If the rule matches, the Treatment applies once to the entire order.

**Supported Rule Types:**
- **Valid Date Range**: Trigger specific rates only during promotional periods.
- **Delivery Region**: Destination-based pricing (States, Cities, Postcodes).
- **Entity Rules**: Special rates for specific Member Classes, Member Labels, or Entity Types.
- **Corporate Rules**: Restrict pricebooks to specific Branches or Companies.

**Effect When Selected:** The system reads the document header fields (delivery address, customer entity, branch, order date) and checks them against the rule conditions. If all conditions pass, the associated Treatment fee is applied once to the entire order total.

{{< figure src="/images/shipping-pricebook-applet/shipping-pricebook-applet-priceset-edit-rules-doc-hdr.png" alt="Document Header Rules Configuration" caption="Configuring rules that evaluate the entire order, such as Delivery Region or Valid Date Range." >}}

**Scenario: Holiday Surcharge for a Specific Branch**
```
Situation: During the year-end holiday season, the KL warehouse has 
limited staffing, causing higher fulfillment costs.

Rule Setup:
  - Type: Header Rule (Doc Hdr)
  - Condition 1 (Valid Date Range): Dec 20 – Jan 5
  - Condition 2 (Corporate Rule): Branch = "Kuala Lumpur HQ"

Treatment: Handling Fee = RM 15 (Absolute)

How It Works:
  - A sales order created on Dec 22 from the KL branch → Both conditions 
    match → RM 15 handling fee is added to the order total.
  - A sales order created on Dec 22 from the Penang branch → Branch 
    condition fails → No surcharge applied.
  - A sales order created on Feb 10 from the KL branch → Date condition 
    fails → No surcharge applied.

Result: Only KL-originated orders during the holiday window incur the 
extra handling fee. All other orders are unaffected.
```

### 2. Multi-Line Rules
Logic that checks for **combinations of items across the entire cart**. When a user selects a Multi-Line Rule, the system scans all line items in the order, groups them by the matching criteria, and evaluates the aggregated result (e.g., total quantity, total weight). The Treatment is applied once based on the grouped outcome, not per individual line.

**Supported Rule Types:**
- **Item Matches**: Group by specific Item, Item Category, or use Regex on Item Code/Name.

**Effect When Selected:** The system iterates through every line item in the order, filters those matching the rule criteria, then aggregates their quantities or values. If the aggregated result meets the threshold, the Treatment is triggered once for the entire group.

{{< figure src="/images/shipping-pricebook-applet/shipping-pricebook-applet-priceset-edit-rules-multi-line.png" alt="Multi-Line Rules Configuration" caption="Setting up rules that group items together across the document to calculate accumulated metrics." >}}

**Scenario: Bulk Office Supplies Handling Fee**
```
Situation: Orders containing more than 10 units of office supplies 
require special palletized packaging, adding to handling costs.

Rule Setup:
  - Type: Multi-Line Rule
  - Condition: Item Category = "Office Supplies", Total Quantity > 10

Treatment: Handling Fee = RM 20 (Absolute)

How It Works:
  - Order with 5x Printer Paper + 8x Ink Cartridges (both "Office 
    Supplies") → Total = 13 units → Exceeds 10 → RM 20 handling fee 
    applied once to the order.
  - Order with 3x Printer Paper + 2x Ink Cartridges → Total = 5 units 
    → Below threshold → No handling fee.
  - Order with 15x Laptop Bags (category "Electronics Accessories") → 
    Does not match "Office Supplies" → No handling fee.

Result: The fee is evaluated across all matching lines combined and 
charged once — not per line item.
```

### 3. Single-Line Rules
Logic that applies **individually to each specific item** within the cart. When a user selects a Single-Line Rule, the system evaluates each line item independently. If a line matches the rule criteria, the Treatment is calculated and applied to that specific line. Multiple matching lines each incur their own fee.

**Supported Rule Types:**
- **Item & Item Category**: Target explicit products or broad classes.
- **Regex Matching**: Code/Name matching via Item Code Regex, Item Name Regex, Category Code Regex, or Category Name Regex.

**Effect When Selected:** The system checks each line item one by one. For every line that matches, the Treatment fee is calculated based on that line's own values (its quantity, unit cost, or amount). This means a single order can generate multiple fee entries if multiple lines match.

{{< figure src="/images/shipping-pricebook-applet/shipping-pricebook-applet-priceset-edit-rules-single-line.png" alt="Single-Line Rules Configuration" caption="Defining rule conditions for individual lines within the order." >}}

**Scenario: Fragile Item Special Handling**
```
Situation: Glassware items require individual bubble-wrap packaging, 
costing RM 3 per unit.

Rule Setup:
  - Type: Single-Line Rule
  - Condition: Item Category = "Glassware"

Treatment: Handling Fee = RM 3, Price Source = Base Quantity, 
           Operator = Multiply

How It Works:
  - Order contains: 10x Wine Glasses ("Glassware") + 5x Dinner Plates 
    ("Ceramics") + 2x Crystal Vases ("Glassware")
  - Line 1: Wine Glasses → Matches → 10 × RM 3 = RM 30 handling fee
  - Line 2: Dinner Plates → Does not match "Glassware" → No fee
  - Line 3: Crystal Vases → Matches → 2 × RM 3 = RM 6 handling fee
  - Total handling fee on this order = RM 36

Result: Each matching line is evaluated and charged independently, 
based on its own quantity.
```

### Choosing the Right Rule Type

| Question | Use This Rule Type |
|----------|-------------------|
| Does the condition depend on the order as a whole (date, region, customer)? | **Header Rule (Doc Hdr)** |
| Does the condition depend on the combined total of specific items? | **Multi-Line Rule** |
| Should the fee be calculated per individual item line? | **Single-Line Rule** |

---

## Regional Rules Deep Dive

The regional engine is the most common way to trigger shipping fees. It supports three levels of geographic granularity.

### How Regional Rules Work
When an order is created, the system checks the **Delivery Address** of the customer and maps it against the Rules in the active Priceset.

**Visual Example:**
```
Order Destination: 88000, Kota Kinabalu, Sabah
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Rule A: State = Sabah (Match!)
Rule B: Postcode = 88xxx (Match!)
Rule C: Zone = East Malaysia (Match!)
```

### Real-World Scenarios

**Scenario 1: The "Free Shipping" Threshold**
```
Strategy: Give free shipping to Selangor customers for orders > RM 500.
Rule Logic: 
  - Rule 1 (Doc Hdr): Delivery Region = "Selangor"
  - Rule 2 (Doc Hdr): Transaction Amount > 500
Treatment: 
  - Standard Shipping = Absolute 0.00
Result: Orders meeting both criteria get RM 0 shipping fees automatically.
```

**Scenario 2: The Fuel Surcharge Adjustment**
```
Strategy: Apply 5% fuel surcharge to all heavy equipment shipments.
Rule Logic: 
  - Rule 1 (Single Line): Item Category = "Heavy Equipment"
Treatment: 
  - Fuel Surcharge = Multiply (0.05) against Transaction Amount
Result: Every heavy item in the cart adds 5% of its value to the Fuel Surcharge line.
```

---

## Configuration & Settings

### Creating a Shipping Pricebook

The pricebook serves as the master container for all subsequent policies.

{{< figure src="/images/shipping-pricebook-applet/shipping-pricebook-applet-pricebook-create.png" alt="Create Shipping Pricebook" caption="Creating a new pricebook container to group relevant geographical logic." >}}

{{< figure src="/images/shipping-pricebook-applet/shipping-pricebook-applet-pricebook-listing.png" alt="Shipping Pricebook Listing View" caption="The Shipping Pricebook list displays all active and inactive logistics containers." >}}

| Field | Purpose | Example |
| :--- | :--- | :--- |
| **Code** | Unique ID for the pricebook | `DOMESTIC_STD_2024` |
| **Name** | Descriptive name for users | `Standard Domestic Rates` |
| **Status** | Controls if the engine uses this book | `ACTIVE` |
| **Icon** | Visual indicator on the dashboard | `airplane-outline` |

{{< figure src="/images/shipping-pricebook-applet/shipping-pricebook-applet-pricebook-edit-details.png" alt="Shipping Pricebook Details Editor" caption="Define the core attributes of the Pricebook to manage its visibility and validity." >}}

### Setting up a Priceset

Within each Pricebook, you build nested Pricesets representing unique scenarios.

{{< figure src="/images/shipping-pricebook-applet/shipping-pricebook-applet-pricebook-edit-add-priceset.png" alt="Adding a Priceset to the Pricebook" caption="Easily insert new structured scenarios (Pricesets) into a master Pricebook logic tree." >}}

| Field | Purpose | Importance |
| :--- | :--- | :--- |
| **Priority Level** | Order of execution | Critical: A Priceset with Priority 1 will override Priority 100. |
| **Rules Logic** | How rules combine | `AND` (All must match) vs `OR` (Any can match). |
| **Negation Logic** | Reverse the rule | `Enabled` means "Apply to everything EXCEPT the selected rule". |

{{< figure src="/images/shipping-pricebook-applet/shipping-pricebook-applet-priceset-edit-details.png" alt="Shipping Priceset Editor" caption="Set Priority Levels to control execution hierarchy within a Pricebook." >}}

### Understanding Treatment Calculations
After rules are matched, the system applies the configured **Treatments**. You can enable up to three distinct fee types per Priceset: **Standard Shipping Fee**, **Handling Fee**, and **Fuel Surcharge**. 

Each fee is calculated using a combination of **Price Sources** and **Operators**:

{{< figure src="/images/shipping-pricebook-applet/shipping-pricebook-applet-priceset-edit-treatment.png" alt="Priceset Treatment Setup" caption="Specify the financial action to take (e.g., standard amounts, quantities, percentage operators) once a rule evaluates as true." >}}

| Price Source | Operator Options | Real-Life Example |
| :--- | :--- | :--- |
| **Standard Amount** | Multiply, Absolute, Add, Subtract | Fixed $15 Standard Shipping Fee using `Absolute`. |
| **Base Quantity** | Multiply, Absolute, Add, Subtract | $2 Handling Fee per item, using `Multiply` by Quantity. |
| **Transaction Amount** | Multiply, Absolute, Add, Subtract | 5% Fuel Surcharge, using `Multiply` against Transaction Amount (*0.05*). |
| **Pricing Scheme** | N/A (Uses linked scheme table) | Complex weight-based logic reading from a dynamic Tier Scheme. |
| **Price Unit Cost / Net Amount**| Multiply, Absolute, Add, Subtract | Advanced margin-based freight adjustments. |

### Where Does Each Price Source Come From?

The **Price Source** determines which value the system uses as the base number for the fee calculation. Each source pulls its data from a different part of the ERP ecosystem:

| Price Source | What It Reads | Where It Comes From | Related Applet |
| :--- | :--- | :--- | :--- |
| **Standard Amount** | A fixed value you enter directly in the Treatment field | Defined within the **Shipping Pricebook Applet** itself — no external data needed | Shipping Pricebook Applet |
| **Base Quantity** | The quantity of items on the order line (e.g., 10 units) | Pulled from the line item data on the **Sales Order** or **Invoice** document | Internal Sales Quotation Applet / Sales Order |
| **Transaction Amount** | The total monetary value of the order or line (e.g., RM 1,500) | Calculated from line item prices and quantities on the active document | Internal Sales Quotation Applet / Sales Order |
| **Pricing Scheme** | A tiered rate table (e.g., weight bands, distance tiers) | Reads from a pre-configured **Pricing Scheme** table linked to the Priceset | Pricebook Applet (Pricing Scheme module) |
| **Price Unit Cost** | The cost price of the item (what you paid the supplier) | Pulled from the item's cost record in the **Item Master** | Item Maintenance Applet |
| **Net Amount** | The net line amount after discounts but before tax | Calculated from the document line after applying any active promotions | Internal Sales Quotation Applet / Pricebook Applet |

{{< callout type="info" >}}
**How the Operator Works with the Price Source:** The Price Source provides the base value and the Operator determines the math. For example, if Price Source = **Transaction Amount** (RM 1,000) and Operator = **Multiply** with value `0.05`, the resulting fee = RM 1,000 × 0.05 = **RM 50**. If the Operator is **Absolute**, the Price Source is ignored and the fee is the fixed value you entered (e.g., RM 15 regardless of order size).
{{< /callout >}}

### Applet Integration & Permissions
The Shipping Pricebook Applet includes built-in settings for deeper system integration:
- **Webhooks**: Automatically push shipping fee calculations to external 3PL or e-commerce systems in real-time.
- **Feature Visibility**: Toggle specific pricing fields on/off depending on the user's role to simplify the interface.
- **Granular Permissions**: Control exactly who can view, create, or modify pricebooks using User, Team, and Role permission sets.
- **Field Settings**: Customize the mandatory/optional status of form fields to match your organization's workflow.

---

## FAQ

**Q1: What happens if two pricesets have the same priority?**
**A:** The system will select the first one created. It is **Best Practice** to always give unique priority numbers to avoid ambiguity.

**Q2: Can I charge a handling fee ONLY for fragile items?**
**A:** Yes. Use a **Single-Line Rule** targeting the "Fragile" item category. The handling fee will only be calculated for those specific items in the cart.

**Q3: Does the system support "Weight-Based" shipping?**
**A:** Yes, via the **Pricing Scheme** integration. You can map weight bands (e.g., $5 per kg) to the Treatment value.

**Q4: Can I test rules without affecting the entire company?**
**A:** Yes. Create a Priceset and add a **Member Class Rule** where the class is "UAT_TESTING". Only customers assigned that class will trigger the new rates.

**Q5: How are taxes handled on shipping fees?**
**A:** Shipping fees inherit the tax settings from the **G/L Account** and **Financial Item** they are mapped to in the Finance module.

---

## Summary

The **Shipping Pricebook Applet** transforms shipping from a manual guesswork process into a precise, automated financial control. By leveraging a hierarchy of rules and flexible fee treatments, BigLedger ensures your logistics team maintains healthy margins while providing transparent pricing to your customers.

{{< callout type="tip" >}}
**Implementation Tip**: Combine the Shipping Pricebook with the **Notification Applet** to alert your logistics manager whenever a "High-Priority" surcharge (e.g., Priority <10) is triggered on a large order.
{{< /callout >}}
