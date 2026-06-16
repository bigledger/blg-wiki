---
title: "Membership Admin Applet"
description: "Comprehensive administration system for managing member profiles, points, currencies, and privileges"
tags:
- membership-management
- loyalty-program
- points-system
- member-privileges
- customer-retention
weight: 10
---

## Purpose and Overview

The **Membership Admin Applet** is the central control hub for your organization's membership and loyalty programs. It empowers you to manage member data, define point systems, configure currency conversions, and orchestrate member privileges from a single interface.

**In Simple Terms:** Think of this applet as your loyalty program's control panel - like the dashboard of your car. Just as your car dashboard lets you control speed, music, and temperature from one place, this applet lets you control who your members are, what rewards they can earn, and how those rewards work.

{{< callout type="info" >}}
**Core Concept**: This applet acts as the **backend engine** (the behind-the-scenes system) for your loyalty ecosystem, handling the complex logic of **who** your members are, **what** they are entitled to, and **how** they earn and spend points.
{{< /callout >}}

{{< figure src="/images/membership-admin-applet/membership-admin-applet-overview.png" alt="Membership Admin Applet Overview: The Challenges (Scattered Data, Rigid Rules, Hidden Liability) vs The Solution (Centralized Profiles, Flexible Logic, Full Visibility, Targeted Tiers & Marketing Labels, Seamless POS & Mobile Integration)" caption="From Fragmented Data to Centralized Control: How the Membership Admin Applet solves common loyalty program challenges with flexible, integrated features." >}}

---

## Before You Begin

Before diving into the system, take time to make these key business decisions. These choices will shape how your entire loyalty program works:

### 1. Define Your Point Types (Currencies)

**Decision:** How many different types of points will you use?

**Common Options:**
- **Single Currency** (simplest): One type of point for everything (e.g., "Rewards Points")
- **Dual Currency**: Spending points (for rewards) + Status points (for tier upgrades)
- **Multiple Currencies**: Campaign-specific points, partner points, etc.

**Why This Matters:** You can't easily change this later without confusing members. Most businesses start with 1-2 types.

---

### 2. Plan Your Member Tiers (Classes)

**Decision:** What membership levels will you offer?

**Examples:**
- **3 Tiers**: Bronze -> Silver -> Gold
- **4 Tiers**: Standard -> Premium -> VIP -> Elite
- **No Tiers**: Everyone is equal (all members get the same benefits)

**Why This Matters:** Tiers create aspiration and reward loyalty. But more tiers = more complexity to manage.

---

### 3. Decide on Point Expiry Rules

**Decision:** Do points expire? If so, when?

**Common Options:**
- **No Expiry**: Points last forever (easiest for customers, but creates accounting liability)
- **Calendar Year**: Points expire December 31st each year
- **Rolling Expiry**: Points expire 12 months after earning
- **Mixed**: Status points don't expire, but spending points do

**Why This Matters:** Expiry drives urgency to redeem, but frustrates customers if poorly communicated.

---

### 4. Set Point-to-Money Conversion Rates

**Decision:** What are your points worth in real money?

**Examples:**
- 100 Points = $1.00 (common in retail)
- 1,000 Miles = $10.00 (common in travel)
- 50 Points = 1 item (non-monetary rewards)

**Why This Matters:** This determines your program's cost. Be realistic about what you can afford.

---

### 5. Choose Your Segmentation Strategy (Labels)

**Decision:** How will you tag members for targeted campaigns?

**Examples:**
- **Demographics**: Age Groups, Gender, Location
- **Behavior**: High Spenders, Frequent Visitors, Dormant
- **Preferences**: Vegetarian, Pet Owners, Sports Fans

**Why This Matters:** Labels let you send personalized offers. Plan these before member registration begins.

---

{{< callout type="warning" >}}
**Pro Tip:** Start simple! Many businesses launch with just **one point type**, **two tiers** (Regular and VIP), and **calendar-year expiry**. You can always add complexity later once you understand how members behave.
{{< /callout >}}

## Who Benefits and Problems Solved

### Who Benefits from This Applet?

**Marketing Managers:**
- Create and manage member labels for targeted campaigns
- Define membership classes and privileges
- Configure point earning and redemption rules

**Customer Support & Operations:**
- Quick access to member profiles and history
- Ability to perform manual point adjustments
- Manage member suspensions and status

**Tenant Administrators:**
- Configure system-wide settings and field visibility
- Set up permissions for teams and users

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
- **Connected to checkout** - Works with POS and Sales Order so members can earn and use points when they shop.
- **Audit capabilities** - Full visibility into point adjustments and member changes.

## Key Features Overview

{{< cards >}}
  {{< card title="Member Management" subtitle="Create, edit, and manage member profiles" link="#member-management" >}}

   {{< card title="Points & Currencies" subtitle="Configure point types and conversion rates" link="#points-currency-management" >}}

   {{< card title="Membership Edit View" subtitle="Open a member record and manage details across tabs" link="#membership-edit-member-detail-view" >}}

  {{< card title="Bulk Operations" subtitle="Upload master data and transactions" link="#bulk-operations" >}}

   {{< card title="Point Adjustments" subtitle="Add or deduct points with full audit trail" link="#manual-adjustments" >}}

   {{< card title="Reporting" subtitle="Membership insights and analytics" link="#reporting-and-data-export" >}}
{{< /cards >}}

{{< callout type="tip" >}}
**Before diving in:** If you're setting up a new loyalty program, review the [Before You Begin](#before-you-begin) section to make key business decisions first. It will save you time and prevent costly redesigns later.
{{< /callout >}}

---

## Quick Start in 5 Minutes

**New to this system?** Here's the absolute minimum to get started:

{{< figure src="/images/membership-admin-applet/sidebar-overview.png" alt="Membership Admin Applet left sidebar showing all menu items: Member Listing, Member Class, Member Label, Member Label List, PTS CCY Module, PTS to CCY Config, Membership Report, Upload Membership, Upload Member Point Transaction, and Settings" caption="The Membership Admin Applet sidebar - your starting point for all navigation." >}}

### For Admins (First-Time Setup)
**Goal:** Configure minimum settings and complete one end-to-end test flow.

1. **Create one point type**: Click **`PTS CCY Module`** in the left sidebar -> Click the **Create** button (add icon, top-left) -> Fill in the form:
   - **Membership Point Currency Code**: Short code in ALL-CAPS (e.g., `LPT`)
   - **Membership Point Currency Name**: Display name (e.g., `Loyalty Points`)
   - **Conversion Rate**: Enter `1`
   -> Click **CREATE**

{{< figure src="/images/membership-admin-applet/PTS-CCY-Module-Create-Form.png" alt="Create Membership Points Currency form showing fields: Membership Point Currency Code (e.g. RWD), Membership Point Currency Name (e.g. Reward Points), Conversion Rate, and Point to point cross-over conversion, with CREATE button" caption="PTS CCY Module - Create form. Fill in the Code, Name and Conversion Rate, then click CREATE." >}}

2. **Set the points-to-money rate**: Click **`PTS to CCY Config`** in the left sidebar -> Click **Create** -> Fill in the form:
   - **Point Currency**: Select the currency you just created (e.g., `LPT - Loyalty Points`)
   - **Conversion Rate**: How many points = 1 unit of money (e.g., `100` means 100 points = 1 MYR)
   - **Money Currency**: Select `MYR` (or your local currency)
   - **Status**: Select `ACTIVE`
   -> Click **SUBMIT**

{{< figure src="/images/membership-admin-applet/PTS-to-CCY-Config-Create-Form.png" alt="Add New Points to Money Currency Conversion form showing: 1X Point Currency (RWD - Reward Points) = Conversion Rate (100) Money Currency (MYR), with Status set to ACTIVE and SUBMIT button" caption="PTS to CCY Config - Set the exchange rate between your points and real money (e.g. 100 Reward Points = 1 MYR). Click SUBMIT." >}}

3. **Review field settings**: Click the **Settings** icon in the sidebar -> Select **`Field Settings`** from the sub-menu -> Review the **Details** tab with toggle switches for card number configuration -> Click **SAVE**

4. **Create minimum segmentation structure**: Add one **Member Class** (e.g., `Regular`) and one **Member Label** (e.g., `Newsletter`) so teams can test tiering and campaigns immediately.

5. **Run a 2-minute smoke test**:
   - Create a test member from **`Member Listing`**
   - Post `+100` points using **Add Point Adjustment**
   - Post `-20` points as a test redemption simulation
   - Confirm both entries appear in **Transaction History**

{{< figure src="/images/membership-admin-applet/create-member.png" alt="Member Create form opened from Member Listing with required fields such as Member Name, Phone Number, and IC or Passport" caption="Member Listing → + opens Member Create. Fill required fields, then click CREATE." >}}

{{< figure src="/images/membership-admin-applet/settings-field-settings.png" alt="Field Settings page showing tab navigation (Details, Member Photos, Labels, Point Transactions, Points Expiry, Member Suspension, Member Listing) and toggle switches under the Details tab for card number configuration" caption="Settings > Field Settings - use the tabs and toggle switches to configure field behaviour. Click SAVE when done." >}}

6. **Done!** You can now register real members and run controlled pilot transactions.

### For Support Staff (Daily Use)
**Goal:** Resolve common member requests with a complete audit trail.

1. **Find a member**: Click **`Member Listing`** in the left sidebar -> Use the search bar at the top to search by name, phone, or email -> Click on the member's row to open their profile

{{< figure src="/images/membership-admin-applet/Member-Listing-Page.png" alt="Member Listing page showing the search bar at the top, the Create (add) button on the left, total member count, and an ag-grid table listing member records" caption="Member Listing - use the search bar to find a member by name, phone, or email. Click any row to open their full profile." >}}

2. **Adjust points (if needed)**: From inside the member's profile, click the **Add Point Adjustment** button -> Fill in the form:
   - **Transaction Date**: Select today's date using the date picker
   - **Branch**: Select your branch from the dropdown
   - **Point Currency**: Select the point type (e.g., `LPT - Loyalty Points`)
   - **Item Code & Name**: Click the arrow icon to select an item/reason, or type it directly
   - **Point Adjustment**: Enter positive to add (e.g., `500`) or negative to deduct (e.g., `-500`)
   - **Remarks / Reason**: Type a clear explanation (e.g., `Goodwill for delayed order #ORD-123`)
   -> Click **Save**

{{< figure src="/images/membership-admin-applet/add-point-adjustment-form-1.png" alt="Add Point Adjustment form showing fields: Transaction Date, Branch, Point Currency (RWD - Reward Points), Reference Number, Item Code and Name, Point Adjustment (500), Valid Date From, Valid Date To, Remarks/Reason (Goodwill compensation for delayed order), Display Type, and Save button" caption="Add Point Adjustment - fill in all fields and always include a clear Remarks / Reason. Click Save to apply the adjustment." >}}

3. **Check transaction history**: Scroll down inside the member's profile to find the **Transaction History** section.

4. **Close the support loop**: Confirm the member can see the updated balance (if member app/web is enabled) and record your case/ticket reference in the adjustment remarks.

{{< figure src="/images/membership-admin-applet/Member-Profile-Transaction%20History.png" alt="Membership Edit screen showing the Point Transaction tab with point movement records" caption="Membership Edit - Point Transaction tab showing member point movement history." >}}

### For Marketing Teams
**Goal:** Build one campaign-ready segment and export it.

1. **Create a tier**: Click **`Member Class`** in the left sidebar -> Click the **Create** button -> Enter the class name (e.g., `Gold`) and configure benefits -> Click **SAVE**
 
{{< figure src="/images/membership-admin-applet/member-class-create-form.png" alt="Membership Class Create form showing fields for Membership Class Code (GOLD) and Membership Class Name (Gold Tier) with a CREATE button at the top right" caption="Membership Class Create - define the code and name for your membership levels (e.g. Bronze, Silver, Gold)." >}}
2. **Create a label**: Click **`Member Label`** in the left sidebar -> Click **Create** -> Enter a label name (e.g., `Frequent Shopper`) -> Click **SAVE**

{{< figure src="/images/membership-admin-applet/Member-Label-Create-Form.png" alt="Membership Label Create form showing fields for Label List, Label Name (Frequent Shopper), and Label Code (FREQ-SHOP) with a CREATE button at the top right" caption="Membership Label Create - use these for flexible marketing tags like 'Vegetarian' or 'Frequent Shopper'." >}}
3. **Member Export for Campaigns**: Navigate to **`Membership Report`** in the sidebar -> Select your filters (e.g. Join Date or DOB) -> Click **Generate CSV** -> Download the completed report from the list below.

4. **Validate campaign audience quality**: Spot-check at least 5 exported records to confirm the right class/labels are included before sending promotions.

{{< figure src="/images/membership-admin-applet/Membership-Report-Generate-CSV.png" alt="Membership Report page showing the date range filters (Join Date From/To) and the Generate CSV button at the top" caption="Membership Report - Use the filters (Join Date, End Date, DOB) to segment your audience, then click Generate CSV. Your report will appear in the list below for download." >}}

{{< callout type="tip" >}}
**For detailed explanations**: Read the full sections below. This quick start just gets you operational fast.
{{< /callout >}}

---

## Admin Setup Checklist

**Setting up a new loyalty program?** Complete these steps in order:

- [ ] **Step 1**: Review [Before You Begin](#before-you-begin) business decisions (30 mins)
- [ ] **Step 2**: Create point currencies -> [Guide](#points-currency-management)
- [ ] **Step 3**: Set up conversion rates -> [Guide](#points-currency-management)
- [ ] **Step 4**: Configure registration fields -> [Guide](#field-configuration-customizing-registration-forms)
- [ ] **Step 5**: Create member tiers (optional) -> [Guide](#member-class-vs-member-label-when-to-use-which)
- [ ] **Step 6**: Create member labels (optional) -> [Guide](#member-class-vs-member-label-when-to-use-which)
- [ ] **Step 7**: Set up permissions -> [Guide](#permission-setup-playbook)
- [ ] **Step 8**: Test with fake member account -> [Guide](#quick-start-in-5-minutes)
- [ ] **Step 9**: Train staff on daily operations
- [ ] **Step 10**: Launch to real customers!

**Estimated time**: 2-4 hours for basic setup

---

## Key Concepts

### Understanding the Membership Framework

To effectively manage the system, you need to understand the core building blocks of membership — including how members relate to each other through referrals and multi-level marketing programs.

{{< callout type="info" >}}
**Important Terminology Note:** In the system menus, you'll see the term **"Member Privilege"** - this is the same thing as **"Member Class"** (your membership tiers like Bronze/Silver/Gold). We'll use **"Member Class"** throughout this guide because it's clearer, but remember they refer to the same feature.
{{< /callout >}}

### The Six Building Blocks Explained

{{< figure src="/images/membership-admin-applet/the-six-blocks.png" alt="The six building blocks of membership: Member at the center with Member Class, Member Label, Points Currency, Referrals, and Multi-Level Marketing" caption="The six building blocks: Member, Member Class, Member Label, Points Currency, Referrals, and Multi-Level Marketing." >}}

| Building Block | What It Is (Plain English) | Example |
|----------------|----------------------------|---------|
| **Member** | An individual customer enrolled in your program | Sarah Chen, Customer #12345 |
| **Member Class (Tier)** | A membership level that grants specific benefits. Each member belongs to ONE class at a time. | Bronze, Silver, Gold, Platinum |
| **Member Label (Tag)** | A flexible category for grouping members. Each member can have MANY labels at once. | VIP Customer, Vegetarian, Golfer, Birthday This Month |
| **Referrals** | Tracks who a member invited and who invited them | Sarah invited Mike and Lisa; Tom invited Sarah |
| **Multi-Level Marketing** | A member's position in a referral program — members above them (Uplines) and below them (Downlines) | In Program "Partner Rewards", Bob's Upline is Alice; Carol is his Downline |
| **Points Currency** | A specific type of value a member can collect and spend | Reward Points, Status Miles, Gift Certificates |

---

### Referrals and Multi-Level Marketing

Some loyalty programs track member invite relationships. The Membership Admin Applet supports two features for this:

| Feature | What it does | Where to find it |
|---------|--------------|------------------|
| **Referrals** | Shows direct invite links between members | **Membership Edit** → **Referrals** tab |
| **Multi-Level Marketing** | Shows a member's network in a referral **Program** | **Membership Edit** → **MLM** tab |

**Referrals** answers two questions: who did this member invite (**Invited Members**), and who invited this member (**Invited By**). Each member can have a **Referral Code** on the **Details** tab.

**Multi-Level Marketing** goes further than a single referral link. Select a **Program**, then view **Uplines** (members above) and **Downlines** (members below). Each record shows **Level**, **Invite Method**, and **Invite Status**.

{{< callout type="tip" >}}
Use **Referrals** for direct invite history. Use **Multi-Level Marketing** when your business runs a formal **Program** with upline and downline structure.
{{< /callout >}}

---

### Member Class vs Member Label: When to Use Which?

**This is the #1 concept to master - it determines your entire program structure.**

{{< figure src="/images/membership-admin-applet/member-class-vs-label.png" alt="The Golden Rule: Class vs. Label - showing Member Class as linear hierarchy (Bronze to Silver to Gold, mutually exclusive, tied to benefits) versus Member Label as stackable tags (VIP, Vegetarian, Golfer - flexible, many per member, tied to marketing)" caption="The Golden Rule: Member Class (linear hierarchy, one per member, benefits-driven) vs. Member Label (stackable tags, many per member, marketing-driven)." >}}

{{< callout type="info" >}}
**Quick Definition:**
- **Member Class** = Membership tier (Bronze/Silver/Gold) - ONE per member, tied to benefits
- **Member Label** = Flexible tag (VIP/Vegetarian/Golfer) - MANY per member, for marketing
{{< /callout >}}

**Member Classes (Tiers)** - Use for **long-term status**
- Mutually exclusive: A member is Gold **OR** Silver, never both
- Usually tied to benefits: Gold members get 10% discount, Silver get 5%
- Hard to change: Moving tiers usually requires hitting spending thresholds
- Think: "What VIP level is this customer?"

**Member Labels (Tags)** - Use for **flexible segmentation**
- Stackable: A member can be "VIP" **AND** "Vegetarian" **AND** "Golfer" simultaneously
- Usually for marketing: Send golf promotions to all "Golfer" label holders
- Easy to add/remove: Apply or remove labels anytime
- Think: "What categories does this customer belong to?"

**Real-World Example:**
```
Sarah Chen is a:
- Member Class: GOLD (she's a high-value customer)
- Labels: Vegetarian, Birthday-March, Frequent-Online-Shopper

This means:
-> She gets Gold-tier discount (10% off) on all purchases [from her Class]
-> She receives vegetarian menu promotions [from Vegetarian label]
-> She gets a birthday gift in March [from Birthday-March label]
-> She sees online-exclusive deals [from Frequent-Online-Shopper label]
```

{{< callout type="tip" >}}
**Rule of Thumb:** Use **Member Classes** for things tied to money (discounts, earning rates). Use **Member Labels** for things tied to preferences and behavior (marketing campaigns, special interests).
{{< /callout >}}

---

### How Members, Classes, Labels, and Currencies Connect

Here's a visual map showing how these pieces fit together:

{{< figure src="/images/membership-admin-applet/Membership_Framework_Data_Flow_Guide.png" alt="Membership framework data flow: Member at the center, Member Class, Member Labels, Referrals, Multi-Level Marketing, and Points Wallet with Reward Points and Status Miles" caption="How membership data connects: one Member profile links to class, labels, referrals, MLM program position, and points wallets." >}}

**Flow Explanation:**
1. **Sarah** (Member) is assigned to the **Gold** tier (Member Class)
2. She is tagged with **Labels**: VIP, Vegetarian, Golfer
3. Her **Gold Class** gives her tier benefits (discounts, bonus earning rates)
4. Her **Labels** determine what promotions she receives
5. **Referrals** show Tom invited Sarah, and Sarah invited Mike and Lisa
6. **Multi-Level Marketing** shows Sarah's upline and downline position in **Partner Rewards**
7. She earns **Reward Points** (for spending) and **Status Miles** (for tier qualification)

---

### The "Points Ecosystem"

The system allows for complex point interactions:

1.  **Earning**: Members earn **Points** through actions (e.g., 1 Point per $1 spent, bonus points for birthdays, etc.)
2.  **Conversion** (optional): 
   -   **Points-to-Points**: Convert 1,000 Reward Points -> 500 Partner Miles
   -   **Points-to-Money**: Redeem 100 Points -> $1.00 off next purchase
3.  **Expiry**: Points can be set to expire based on rules you define (e.g., "Expires December 31" or "Expires 12 months after earning")
4.  **Balance Tracking**: Members see their current balance in real-time via mobile app or website

### Where members earn and spend points (POS and Sales Order) {#where-members-earn-and-spend-points-pos-and-sales-order}

Membership Admin is where you **configure** the program. When a **member** shops through **POS General Applet** or **Sales Order (Internal)**, they can **earn points** and **use their point balance** based on your settings.

**What you set up here → what the member gets at checkout**

| You configure in Membership Admin | What the member gets |
|-----------------------------------|----------------------|
| **Member Class** and **Labels** | Eligible **member pricing** (automatic discounts when they are linked to the sale) |
| **PTS CCY Module** + **Member Class** | **Points earned** on the purchase when the sale is completed |
| **PTS to CCY Config** | Option to **pay with their points** (money off the bill) |

**Member pricing vs points — do not mix them up**

- **Member pricing (Pricebook):** Automatic discounts on items for eligible members. This is a **lower price** on the receipt. It does **not** use the member's point balance.
- **Earn points:** After the member pays and the sale is finalized, points are added to **their wallet**. You can confirm in **Membership Edit → Point Transaction**.
- **Use points:** The member applies **their own** point balance toward payment using your **PTS to CCY** rate (for example, 100 points = RM1 off). Points are **deducted** from the member's wallet.

**Typical member experience at the counter (POS)**

1. The member identifies themselves at checkout (membership card, phone number, or app).
2. Items are rung up — member prices apply automatically if configured.
3. The member may choose to **use points** toward payment; any remainder is paid by cash, card, or other methods.
4. When the sale is **Final**, new points are **earned** and the member's balance updates.

**Typical member experience (Sales Order)**

1. The member is linked as the **Customer / Entity** on the order.
2. Line items show member pricing where configured.
3. The member may **use points** as part of **Settlement** if your program allows it.
4. When the order is **FINAL**, points are **earned** the same way as POS.

**Before go-live, confirm**

- **PTS to CCY Config** is **ACTIVE** if members can pay with points.
- Member **Class** and **Labels** match your pricebook rules (for discounts).
- Run a test purchase as a member in POS and Sales Order; verify **Point Transaction** on the member profile.

For pricebook setup, see [Pricebook Configuration](/modules/membership/configuration/rewards-setup/pricebook-configuration/). For POS earn and redeem detail, see [POS Integration](/modules/membership/integration/pos-integration/).

{{< callout type="info" >}}
When a member completes a purchase in **POS** or **Sales Order**, the system applies **Class**-based earning rules and updates their **Points Wallet**. Member **pricebook** discounts and **using points to pay** are separate — discounts change the item price; paying with points uses the member's own balance.
{{< /callout >}}



## Quick Reference Cards

### Point Adjustment Quick Reference

**When to Use:**
- Service failure compensation
- Fixing errors
- Goodwill gestures
- Birthday bonuses

**How:**
1. Find member in Member Listing
2. Click "Add Point Adjustment"
3. Enter amount (+positive or -negative)
4. Write clear reason
5. Submit

**Best Practices:**
- Always explain WHY
- Include reference numbers (order #, ticket #)
- Double-check amount
- Never use vague reasons like "adjustment"

---

### Bulk Import Checklist

**Before Upload:**
- [ ] Download CSV template first
- [ ] Test with 10 members before full upload
- [ ] Set Excel columns to "Text" format
- [ ] Verify dates are YYYY-MM-DD format
- [ ] Check phone numbers have country codes
- [ ] Check for duplicate name + phone combinations
- [ ] Save as CSV

**Common Errors:**
- Duplicate member -> Same name and phone updates the existing record
- Invalid email -> Check for @ and .com
- Wrong date format -> Use YYYY-MM-DD
- Missing required field -> Fill Member Name, Mobile No., IC/Passport, and End Date

---

### Permission Matrix Quick Guide

| Role | View Members | Delete Members | Configure System |
|------|-------------|----------------|------------------|
| **Cashier** | Yes | No | No |
| **Support Agent** | Yes | No | No |
| **Supervisor** | Yes | No | No |
| **Marketing Manager** | Yes | No | Limited (labels only) |
| **Tenant Admin** | Yes | Yes | Yes |

---

### Most Common Daily Tasks

**Task: Check a member's current details**
-> `Member Listing` -> Search -> Click row -> `Membership Edit` (Details tab)

**Task: Add compensation points**
-> `Member Listing` -> Find member -> `Add Point Adjustment` -> Enter amount & reason

**Task: Check why points were deducted**
-> `Member Listing` -> Click row -> `Membership Edit` -> `Point Transaction` tab -> Find transaction

**Task: Export members for campaign**
-> `Member Listing` -> Apply filters (tier/label) -> Click Export

**Task: Create a new promotion label**
-> `Member Label` -> Create -> Name it -> Save -> Assign to members

**Task: Upload new members in bulk**
-> `Upload Membership` -> Download template -> Fill data -> Upload

---

## Member Management

**The central directory of your customers and their loyalty data.**

### Create member

From **Member Listing**, click **+** to open **Member Create**. Complete required fields (your tenant may require phone, IC / Passport, branch, and other details from **Field Settings**), then click **CREATE**.

{{< figure src="/images/membership-admin-applet/create-member.png" alt="Member Create form opened from Member Listing with required fields such as Member Name, Phone Number, and IC or Passport" caption="Member Create: use + on Member Listing, complete required fields, then CREATE." >}}

### Membership Edit (Member Detail View)

**What it is:** The member record screen opened from **Member Listing**.

**How to access it:**
1. Go to **Member Listing**
2. Find the member (search by name, phone, or email)
3. Click the member row in the grid

**What is explicitly shown in source:**

- Screen title: **Membership Edit**
- Top actions: **Back** and **SAVE**
- Tabbed layout with these panel titles:
   - **Details**
   - **E-Invoice** (shown conditionally)
   - **Member Photos**
   - **Labels**
   - **Point Transaction**
   - **Points Expiry**
   - **Upload Attachments**
   - **Referrals**
   - **MLM** (Multi-Level Marketing)
   - **Member Suspension**

#### Referrals Tab

Open a member from **Member Listing**, then select the **Referrals** tab.

| Sub-tab | What it shows |
|---------|---------------|
| **Invited Members** | Members this person referred — Referred Member Card No, Member ID, Name, Email, Phone, Member Join Date |
| **Invited By** | Who referred this member — Inviter Member Card No, Member ID, Name, Email, Phone, Inviter Referral Code |

The member's **Referral Code** on the **Details** tab is the code used when linking new sign-ups to this member.

#### Multi-Level Marketing Tab

Open a member from **Member Listing**, then select the **MLM** tab. Select a **Program** from the dropdown first — **Uplines** and **Downlines** appear only after a program is selected.

| Sub-tab | What it shows |
|---------|---------------|
| **Uplines** | Members above this member — Upline, Level, Invite Method, Invite Status, Date Created, Date Updated |
| **Downlines** | Members below this member — Downline, Level, Invite Method, Invite Status, Date Created, Date Updated |

To add a link, click **Create** on the **Uplines** or **Downlines** listing. This opens **Add Upline** or **Add DownLine**. Click a row to open **Edit Upline** or **Edit DownLine**.

#### Member Suspension Tab

Open a member from **Member Listing**, then select the **Member Suspension** tab.

The listing shows suspension periods with **Start Date**, **End Date**, **Duration (in days)**, **Remarks**, **Created Date**, and **Created By**.

- Click **Create** to open **Create Suspension**. Enter **Start Date**, **End Date**, **Duration (in days)**, and **Remarks**, then click **SAVE**.
- Click a row to open **Edit Suspension** and update the record.

**Scenario:** A support officer needs to pause a member's account while a complaint is reviewed.

1. Open the member in **Membership Edit** → **Member Suspension** tab.
2. Click **Create**.
3. Set **Start Date** and **End Date** for the suspension period, add a **Remarks** note (for example, the case reference), then click **SAVE**.
4. Confirm the new row appears in the listing with the correct dates and **Duration (in days)**.

{{< figure src="/images/membership-admin-applet/member-suspension.png" alt="Member Suspension tab with Create Suspension form showing Start Date, End Date, Duration, and Remarks" caption="Member Suspension: open the tab from Membership Edit, click + to create a suspension, then SAVE." >}}

#### Points Expiry Tab

Open a member from **Member Listing**, then select the **Points Expiry** tab.

The listing shows **Balance Amount**, **Start Date**, **End Date**, **Next Expiry Date Check**, **Point Currency**, and **Created Date**. Use the search bar to filter records if needed.

- Click a row to open **Point Expiry Edit**, then click **SAVE** after reviewing the details.

**Scenario:** A member asks when their points will expire.

1. Open the member in **Membership Edit** → **Points Expiry** tab.
2. Find the row for the relevant **Point Currency**.
3. Check **Next Expiry Date Check** and **End Date** to answer the member.
4. Click the row to open **Point Expiry Edit** if you need to review the full record.

**Details tab includes fields such as:**
- Member Name, Card No, Customer Name, Member ID
- Branch, Phone Number, Email, IC / Passport, Date of Birth, Gender
- Card Type, Referral Code, Member Class, Verification Status
- Membership Join/Start/End Date (End Date visibility is permission-gated)
- Remarks and audit fields (Created By / Creation Date / Modified By / Modified Date)

### Manual Adjustments

**What it is:** The ability to add or remove points from a member's account directly (bypassing the normal earning process).

**When to use it:**
- Compensating for service failures ("Sorry your order was late - here's 500 points")
- Fixing errors ("We accidentally gave you 5,000 points instead of 500 - correction needed")
- Goodwill gestures ("Welcome back after being away - bonus 200 points")
- Promotional bonuses ("Happy birthday - 100 bonus points!")

**When NOT to use it:**
- Regular purchase earning (should come from POS automatically)
- Promotional campaigns (use bulk operations instead)
- Favoring specific customers without business justification (creates unfairness)

---

**How to Make an Adjustment:**

1. Open the member record in **Membership Edit** (see section above)
2. Click **Add Point Adjustment** button
3. Fill in the form:
   - **Select Currency**: Choose which type of points (e.g., "Loyalty Points")
   - **Amount**: 
     - Enter a **positive number** to add points (e.g., `500`)
     - Enter a **negative number** to remove points (e.g., `-500`)
   - **Reason/Notes**: Type a clear explanation (this is recorded forever for auditing)
   - **Reference Number** (optional): Link to an order number, ticket ID, or case number if relevant
4. Review your entry carefully (mistakes can upset members!)
5. Click **Submit**

**What happens immediately:**
- Member's balance updates in real-time
- They see the change in their app/account within seconds
- Transaction appears in their history with type "Adjusted"
- Your username and timestamp are recorded
- Email notification can be sent (if enabled in settings)

---

**Best Practices for Adjustments:**

**Always explain why**: Write reasons like "Compensation for delayed order #12345" instead of just "Adjustment"

**Be specific**: "Goodwill for 30-min wait time on 12/15/2025" is better than "Goodwill"

**Get approval for large amounts**: If your company policy requires manager approval for adjustments over 1,000 points, follow it

**Document everything**: If a member calls asking "Why did I lose points?", the reason field will have the answer

**Use reference numbers**: Link adjustments to support tickets or order numbers for easy tracking

**Double-check amounts**: Adding 50,000 instead of 5,000 is a costly mistake

**Common Mistakes to Avoid:**
- Adjusting the wrong member (always verify name before submitting)
- Forgetting the negative sign when deducting points
- Vague reasons like "error" (what kind of error?)
- Adjusting without checking current balance first

---

**Audit Trail:**

Every adjustment creates a permanent record showing:
- Who made the change (your username)
- When it happened (date and time)
- How much changed (amount and currency)
- Why it happened (your reason text)
- What the balance was before and after

**Why this matters:** If auditors or management ask "Why does this member have so many bonus points?", you can show the complete trail proving each adjustment was legitimate.

---

{{< callout type="warning" >}}
**Important Permission Note:** Not all staff should have adjustment rights. Typically, only supervisors and customer support leads can adjust points to prevent abuse. Check with your administrator if you don't see the "Add Point Adjustment" button.
{{< /callout >}}

---

## Points Currency Management

**The engine that powers how members earn and spend rewards.**

{{< callout type="info" >}}
**This section is detailed (380+ lines).** For most businesses:
- Use **single currency** strategy (simplest)
- Set **100 points = $1** conversion rate (easy math)
- Choose **calendar year expiry** (clean accounting)

[Skip to Configuration](#configuration-settings) if you just need basic setup.
{{< /callout >}}

### Understanding Point Currencies (Multiple "Wallets")

**What it is:** A Point Currency is a type of value members can collect, like different types of money in a wallet. Just like you might have dollars and euros in your wallet, members can have different types of points.

**Why use multiple currencies?**
- **Separation of purpose**: "Reward Points" for shopping discounts vs. "Status Points" for tier qualification
- **Different rules**: Shopping points expire annually, but status points never expire
- **Partner programs**: Your points + airline miles + hotel points all coexist
- **Campaign flexibility**: Launch temporary "Holiday Bonus Coins" without affecting main program

---

**Common Currency Strategies:**

**Strategy 1: Single Currency (Simplest)**
```
One type: "Loyalty Points"
- Earned: 1 point per $1 spent
- Redeemed: 100 points = $1 off
- Expiry: December 31st each year
- Best for: Small businesses, straightforward programs
```

**Strategy 2: Dual Currency (Most Common)**
```
Currency 1: "Reward Points" (for spending)
- Earned: 1 point per $1 spent
- Redeemed: 100 points = $1 off
- Expiry: Expires after 12 months

Currency 2: "Status Miles" (for tier upgrades)
- Earned: 1 mile per $10 spent
- Not redeemable: Only counts toward tier status
- Expiry: Never expires
- Example: 10,000 miles = Gold tier, 50,000 miles = Platinum

Best for: Businesses wanting to separate spending rewards from tier progression
```

**Strategy 3: Multiple Currencies (Advanced)**
```
Currency 1: "Shop Coins" (main currency)
Currency 2: "Referral Tokens" (earned by inviting friends)
Currency 3: "Birthday Bonus" (special annual gift)
Currency 4: "Partner Miles" (earned at partner locations)

Best for: Large enterprises, complex ecosystems
```

---

### Conversion Rules (How Points Become Value)

**What it is:** The exchange rate that determines what points are worth. Without conversion rules, points are just numbers with no value.

---

**Type 1: Points-to-Money Conversion** (Most Common)

**What it does:** Converts points into real money off purchases.

**Example Setup:**
```
Conversion Rule: "Loyalty Points -> MYR"
Rate: 100 points = 1.00 MYR
Valid: January 1 - December 31, 2025

What members see:
"You have 2,500 points = $25.00 in rewards!"

At checkout:
- Purchase total: $50.00
- Redeem 2,000 points: -$20.00
- Final payment: $30.00
```

**Advanced: Tiered Conversion Rates**
```
Regular Members: 100 points = $1.00 (1% value)
Gold Members:    100 points = $1.25 (1.25% value - better deal!)
Platinum:        100 points = $1.50 (1.5% value - best deal!)

This rewards high-tier members with better redemption value.
```

**Time-Limited Promotions:**
```
Normal rate (Always):  100 points = $1.00
Holiday rate (Dec only): 80 points = $1.00   <- Better value!

Use this to drive redemptions during slow periods.
```

---

**Type 2: Points-to-Points Conversion** (For Partner Programs)

**What it does:** Converts your points into a partner's points (like converting store points to airline miles).

**Example Setup:**
```
Conversion Rule: "Loyalty Points -> Airline Miles"
Rate: 1,000 Loyalty Points = 500 Airline Miles
Valid: All year

Member's choice:
Option A: Redeem 1,000 points for $10 off next purchase
Option B: Convert 1,000 points to 500 airline miles

This gives members flexibility to choose their preferred reward type.
```

**When to use this:**
- Partnership agreements with other brands
- Multi-brand loyalty programs
- Giving members more redemption options

---

**How to Set Up Conversions:**

**For Points-to-Money:**
1. Go to **`PTS to CCY Config`**
2. Click **Create New Conversion**
3. Fill in:
   - **From Currency**: Select your point type (e.g., "Loyalty Points")
   - **To Currency**: Select money (e.g., "MYR", "USD")
   - **Conversion Rate**: Enter the ratio (e.g., "100" points = "1.00" money)
   - **Valid From/To Dates**: Set when this rate applies
   - **Member Class Filter** (optional): Apply different rates to different tiers
4. Click **SAVE**

**For Points-to-Points:**
1. Go to **`PTS to PTS Config`** (if enabled in your menu)
2. Click **Create New Conversion**
3. Fill in:
   - **From Currency**: Your store points
   - **To Currency**: Partner points
   - **Conversion Rate**: Enter the ratio
4. Click **SAVE**

---

**Testing Conversions:**

Before launching, verify your rates make financial sense:

**Example Calculation:**
```
If you give 1 point per $1 spent, and 100 points = $1 off...
-> 1% reward rate (customer gets back 1% of spending)
-> For every $10,000 in sales, you give $100 in rewards
-> Is this sustainable for your margins?

If your margin is 30% ($3 profit per $10 sale):
-> $100 reward cost = 33 sales @ $3 profit each
-> You need the member to make 33+ purchases to break even
```

**Pro Tip:** Most retail programs use 1-2% reward rates. Airlines use 5-10% because they have high margins on loyalty redemptions (empty seats cost them almost nothing).

---

### Expiry Management (Preventing Liability Buildup)

**What it is:** Rules that automatically remove old points to prevent members from hoarding forever.

**Why expiry matters:**

**For Business (Accounting):**
- Outstanding points = Financial liability (debt on your books)
- If every member redeemed at once, could you afford it?
- Expiry reduces liability by removing unused points

**For Members (Psychology):**
- Expiry creates urgency: "Use it or lose it!"
- Drives redemption and store visits
- But can frustrate members if poorly communicated

---

**Expiry Strategies:**

**Option 1: No Expiry (Simplest, Highest Risk)**
```
Points never expire
Pros: Members love it, no confusion
Cons: Liability keeps growing, no urgency to redeem
Best for: New programs, luxury brands (where loyalty matters more than liability)
```

**Option 2: Calendar Year Expiry (Common)**
```
All points expire December 31st each year
Pros: Clean accounting, predictable liability
Cons: Members lose points on fixed date regardless of when earned
Best for: Annual-budget businesses, B2B programs
```

**Option 3: Rolling Expiry (Fairest)**
```
Points expire 12 months after earning date
Example: Points earned Jan 15, 2025 expire Jan 15, 2026
Pros: Fair to members, encourages regular engagement
Cons: Complex to communicate
Best for: Retail, restaurants, recurring-purchase businesses
```

**Option 4: Hybrid (Advanced)**
```
Reward Points: Expire after 12 months (rolling)
Status Points: Never expire
Campaign Points: Expire with campaign end date
Best for: Multi-currency programs
```

---

**Setting Up Expiry:**

1. When creating/editing a **Points Currency**, find the **Expiry Policy** section
2. Choose expiry type:
   - **"Never expires"**
   - **"Fixed date"** (enter a specific calendar date)
   - **"Relative"** (enter number of days/months from earning: e.g., "365 days" = 12 months)
3. Set **Warning Period** (optional): "Notify members 30 days before expiry"
4. Save

**What happens automatically:**
- System checks expiry daily
- Expired points are removed from member balances
- Members receive advance warnings (if enabled)
- Transactions show "Expired" in history

---

{{< callout type="warning" >}}
**Legal Compliance Note:** Some regions have laws restricting point expiry (e.g., California requires points be valid for at least 3 years). Check your local regulations before setting expiry policies. When in doubt, consult with your legal team.
{{< /callout >}}

---

### Currency Settings Reference

When creating a Points Currency, here's what each setting means:

| Setting | What It Controls | Example |
|---------|------------------|---------|
| **Currency Name** | Display name shown to members | "Loyalty Points", "Reward Coins" |
| **Currency Code** | Internal system identifier (like a nickname for the database) | "LP", "RC" |
| **Symbol** | Icon shown next to balance | Leave blank for just numbers or use simple text symbols |
| **Decimals** | Can members have fractional points? | 0 decimals = whole numbers only (1, 2, 3). 2 decimals = allows cents (1.25, 3.50) |
| **Expiry Policy** | When points expire (see Expiry Management above) | "12 months from earning" |
| **Transferability** | Can members gift points to others? | Usually "Disabled" to prevent fraud |
| **Visibility** | Show balance to members in app? | Usually "Visible" unless it's an internal currency |
| **Redemption Enabled** | Can members spend this currency? | "Yes" for Reward Points, "No" for Status Points (tracking only) |

---

{{< callout type="tip" >}}
**Starting Recommendation:** Launch with **one currency**, **12-month rolling expiry**, **100:1 conversion rate** (easy math for members), and **no transferability**. You can always add complexity later based on member behavior.
{{< /callout >}}

---

## Configuration & Settings

**Fine-tune how the system behaves to match your business rules.**

**Where to find settings:** Click **Settings** in the sidebar to access all configuration options.

---

### General Settings

**What it is:** Basic system-wide preferences that apply to everyone.

**Key Settings Explained:**

**Default Selections:**
- **Purpose:** Pre-fill forms to speed up data entry
- **Example:** If 90% of registrations happen at your Main Street branch, set "Default Branch: Main Street" so staff don't have to select it every time
- **What you can set as default:**
  - Default Branch
  - Default Member Class (tier for new sign-ups)
  - Default Currency (if you have multiple)
  - Default Status (Active vs. Pending Review)

**Card Type Configuration:**
- **Purpose:** Define if members get physical cards or just digital IDs
- **Options:**
  - **Physical Cards**: Members get plastic cards with magnetic strips or barcodes (requires card printer)
  - **Virtual Cards**: Members get a digital ID card shown in mobile app (no equipment needed)
  - **Both**: Members can choose physical or digital
- **Why it matters:** Physical cards cost money to produce; virtual cards are free but require members to have smartphones

**Date & Time Format:**
- **Purpose:** Match how your region displays dates
- **Examples:**
  - US format: 12/31/2025 (MM/DD/YYYY)
  - European format: 31/12/2025 (DD/MM/YYYY)
  - ISO format: 2025-12-31 (YYYY-MM-DD)
- **Impact:** Affects date displays throughout the system

---

### Field Configuration (Customizing Registration Forms)

**What it is:** Control which information you collect from members during sign-up.

**Why customize this:**
- Simplify registration (fewer fields = faster sign-ups)
- Comply with privacy laws (only collect what you legally need)
- Match your business needs (B2B might need company name, B2C doesn't)

---

**How Field Configuration Works:**

**Access:** `Settings > Field Configuration`

**For each field, you control three things:**

1. **Visibility** (Show or Hide?)
   - **Show**: Field appears on forms
   - **Hide**: Field doesn't exist for users
   - Example: If you don't need IC Number, hide it

2. **Requirement Level** (Can it be skipped?)
   - **Mandatory**: Must be filled before submission (red asterisk appears)
   - **Optional**: Can be left blank
   - Example: Email usually mandatory (for receipts), gender usually optional

3. **Editability** (Who can change it?)
   - **Member Can Edit**: Members can update this themselves
   - **Staff Only**: Only support staff can change it
   - **Read-Only**: Nobody can edit after creation (like Member ID)

---

**Standard Fields You Can Configure:**

| Field Name | What It Stores | Recommendation |
|------------|----------------|----------------|
| **Full Name** | Member's name | Mandatory, Member can edit (for corrections) |
| **Email** | Email address | Mandatory (needed for receipts and notifications) |
| **Phone Number** | Mobile or landline | Mandatory (for account recovery and OTP) |
| **Date of Birth** | Birthday | Optional (nice for birthday rewards, but sensitive) |
| **Gender** | Male/Female/Other | Optional (useful for demographic analysis, but can be sensitive) |
| **IC Number / National ID** | Government ID | Only if legally required (very sensitive - hide if not needed) |
| **Address (Line 1, 2, City, State, Postal Code)** | Mailing address | Optional (unless you ship physical rewards) |
| **Company Name** | Employer (for B2B) | Hide for B2C, Mandatory for B2B |
| **Member Since** | Join date | Read-only (auto-filled by system) |
| **Member ID** | Unique identifier | Read-only (auto-generated by system) |

---

**Decision Framework:**

Before configuring, ask yourself:

1. **Do we legally need this?** (Example: Age verification for alcohol sales -> Yes, collect Date of Birth)
2. **Will we use this data?** (Example: If you never send mail -> No, hide Address fields)
3. **Does this speed up or slow down sign-ups?** (Each extra field = more friction = fewer sign-ups)
4. **Is this sensitive information?** (IC Numbers, Date of Birth -> Only collect if necessary; consider privacy laws)

---

**Common Configurations by Business Type:**

**Retail Store (B2C):**
```
Mandatory: Name, Email, Phone
Optional: Date of Birth, Gender
Hidden: IC Number, Company Name, Address
```

**Online Business (eCommerce):**
```
Mandatory: Name, Email, Phone, Shipping Address
Optional: Date of Birth
Hidden: IC Number, Company Name
```

**B2B Membership Program:**
```
Mandatory: Name, Email, Phone, Company Name, Position/Title
Optional: Address
Hidden: IC Number, Date of Birth, Gender
```

**Loyalty Program Requiring Age Verification:**
```
Mandatory: Name, Email, Phone, Date of Birth, IC Number
Optional: Gender, Address
```

---

### Custom Status (Beyond Active/Inactive)

**What it is:** Create additional member statuses beyond the standard "Active" and "Inactive."

**Default Statuses:**
- **Active**: Member can earn and redeem points normally
- **Inactive**: Member account is suspended (no earning or redeeming)

**Why create custom statuses:**
- Temporarily suspend members without fully deactivating (e.g., "Under Review" for fraud investigation)
- Track special conditions (e.g., "VIP Review Pending" for potential upgrades)
- Manage probationary periods (e.g., "Trial Member" for first 30 days)

**Examples:**
- **"Pending Verification"**: New members awaiting ID verification
- **"Payment Overdue"**: B2B members with unpaid invoices
- **"Cooling Off Period"**: Members who requested temporary pause
- **"Closed - Voluntary"**: Member requested account closure (different from "Closed - Fraud")

**How to create:**
1. Go to `Settings > Custom Status`
2. Click **Create New Status**
3. Enter Status Name (e.g., "Pending Verification")
4. Choose behavior:
   - **Can Earn Points?**: Yes/No
   - **Can Redeem Points?**: Yes/No
   - **Show in App?**: Yes (visible to member) / No (internal only)
5. Save

---

### Permission Setup Playbook

**What this section covers:** How to configure access using the permission screens that are actually wired in this applet source.

**Why this matters:** If users cannot see features, buttons, or data scope they expect, the fix is usually in permission assignment, client-side permission, or feature visibility.

---

**Permission and visibility screens available in this applet:**

- **Settings > Permission Wizard**
- **Settings > Permission Set**
- **Settings > User Permission**
- **Settings > Team Permission**
- **Settings > Role Permission**
- **Settings > Client-Side Permission**
- **Settings > Feature Visibility**

**Step-by-step setup flow:**

1. Go to **Settings > Permission Wizard**.
2. Open the required template, then go to the **Targets** tab:
   - Select target rows using the grid checkboxes (or turn on **Select All**).
   - (Optional) tick **Auto Create Roles**.
   - Click **Generate Permission Sets**.
3. Go to **Settings > Permission Set**:
   - Click the **+** icon button (tooltip: **Create**).
   - Fill the form.
   - Click **SAVE**.
4. Assign at one level first (User **or** Team **or** Role) to avoid conflicts during rollout:
   - Go to **Settings > User Permission** (or **Team Permission** / **Role Permission**).
   - Click the **+** icon button (tooltip: **Create**).
   - Choose the permission set.
   - Click **SAVE**.
5. Configure UI-gated actions in **Settings > Client-Side Permission**:
   - Click the **+** icon button (tooltip: **Create**).
   - Select **Role** and **Client Side Permission**.
   - Click **SAVE**.
6. Configure **Settings > Feature Visibility** so users only see allowed menu modules.
7. Validate using a test login from the target group before assigning to production users.

**Common permission effects:**

| Setting | What it controls |
|---------|------------------|
| Read access | Which members and branches a user can view in **Member Listing** |
| Create / update access | Whether a user can register members or edit profiles |
| Client-side permissions | Specific buttons and fields (for example, editing **Membership End Date**) |
| Feature visibility | Which sidebar menus appear for each role |

---

**Troubleshooting: "I still can't see or do X"**

1. **Menu item missing** → check **Feature Visibility** first.
2. **Page opens but button or field missing** → verify **Client-Side Permission** and role assignment.
3. **Can open page but data scope is too narrow** → verify branch or target assignment with your administrator.
4. **Permission pages missing in Settings** → confirm your tenant exposes the permission menus.
5. **Changes not reflected** → log out and in, then retest with a clean user session.

---

{{< callout type="tip" >}}
**Operational tip:** Start with minimum access, test with one user, then scale to teams/roles. This reduces rollout risk and support tickets.
{{< /callout >}}

---

---

## Bulk Operations

**Import member records or point transactions from CSV files.**

### Upload Membership

**What it is:** Import many member records at once from a CSV file.

**Download the template:**

1. Click **Upload Membership** in the sidebar to open **Member Master Data Listing**.
2. Click **Create** to open **Upload Master Data**.
3. Click **Sample Format** to download the CSV template (`Member_Master_Data_Template.csv`).
4. Open the file in Excel or Google Sheets. Each row is one member — fill in the columns shown in the template header row.
5. Save the file as `.csv`.

**Required fields:**

| Column | Required? | What to enter |
|--------|-----------|---------------|
| Member Name | Yes | Full name |
| Mobile No. | Yes | Phone number (include country code, e.g. 60…) |
| IC/Passport | Yes | ID or passport number |
| End Date | Yes | Membership end date (YYYY-MM-DD) |

All other columns are optional. If you use **Member Class** or **Label 1–3**, enter codes that already exist in the applet (not display names).

**Example:**

| Column | Example value |
|--------|---------------|
| Member Name | Sarah Chen |
| Gender | Female |
| Date of Birth | 1990-03-15 |
| Country Code | 60 |
| Mobile No. | 0123456789 |
| IC/Passport | A12345678 |
| Email | sarah@example.com |
| Member Class | GOLD |
| Join Date | 2024-01-01 |
| Start Date | 2024-01-01 |
| End Date | 2099-12-31 |
| Member Status | Active |
| Remarks | Leave blank |
| Label 1 | VIP |
| Label 2 | Leave blank |
| Label 3 | Leave blank |

**Tips:**
- Do not change column order or header names
- Use YYYY-MM-DD for dates
- Test with about 10 rows before uploading a large file

**Upload the file:**

1. On **Upload Master Data**, drag and drop your `.csv` file or click **Upload File**.
2. Click **ADD**.

Uploaded files appear in **Member Master Data Listing** with **File Name**, **Size**, **Import Format**, **Status**, **Uploaded Date**, and **Uploaded By**.

**Scenario:** You need to register 200 members from a spreadsheet export.

1. Go to **Upload Membership** → **Create**.
2. Click **Sample Format** to download the template, add your member rows, and save as `.csv`.
3. Upload the file on **Upload Master Data** and click **ADD**.
4. Return to **Member Master Data Listing** and check **Status** for the uploaded file.

{{< figure src="/images/membership-admin-applet/upload-membership.png" alt="Upload Master Data screen with Sample Format link, Upload File, and ADD button beside Member Master Data Listing" caption="Upload Membership: download Sample Format, upload your CSV on Upload Master Data, click ADD, then check Status in Member Master Data Listing." >}}

---

### Upload Member Point Transaction

**What it is:** Import point transactions for many members at once from a CSV file.

**Download the template:**

1. Click **Upload Member Point Transaction** in the sidebar to open **Membership Point Txn File Listing**.
2. Click **Create** to open **Upload Member Point Transaction Import**.
3. Under **Sample Format**, click **Member Point Txn** to download the CSV template.
4. Open the file in Excel or Google Sheets. Each row is one transaction — fill in the columns shown in the template header row.
5. Save the file as `.csv`.

**Required fields:**

| Column | Required? | What to enter |
|--------|-----------|---------------|
| Member Card No. | Yes | Member's card number from **Member Listing** |
| Branch Code | Yes | Branch code from your setup |
| Point Value | Yes | Points to add or deduct |
| Point Balance | Yes | Resulting balance after the transaction |

Other columns (Company Code, Point Currency, Transaction Type, dates, description, document fields) are optional — use the template or leave blank where not needed.

**Example:**

| Column | Example value |
|--------|---------------|
| Member Card No. | MC-000123 |
| Company Code | COMP01 |
| Branch Code | HQ01 |
| Point Currency | REWARDS |
| Point Value | 500 |
| Point Balance | 1500 |
| Transaction Type | BONUS |
| Date of Transaction | 2024-06-01 |
| Description | Anniversary bonus |
| Date Valid From | Leave blank |
| Date Valid To | Leave blank |
| Document fields | Leave blank |

If the upload fails, open the file row in the listing and check **Error Message** for details.

**Upload the file:**

1. On **Upload Member Point Transaction Import**, drag and drop your `.csv` file or click **Upload File**.
2. Click **Submit**.

Uploaded files appear in **Membership Point Txn File Listing** with **File Name**, **File Size**, **Format**, **Status**, **Process Status**, **Error Message**, **Created Date**, and **Updated Date**. Click a row to view the file details.

**Scenario:** Marketing runs an anniversary campaign and needs to credit bonus points to many members.

1. Go to **Upload Member Point Transaction** → **Create**.
2. Under **Sample Format**, click **Member Point Txn** to download the template, add one row per member transaction, and save as `.csv`.
3. Upload the file and click **Submit**.
4. Check **Membership Point Txn File Listing** for **Status** and **Process Status**. If **Error Message** is shown, open the file row to review the details.

{{< figure src="/images/membership-admin-applet/upload-member-point-transaction.png" alt="Upload Member Point Transaction Import with Member Point Txn sample format, Upload File, and Submit" caption="Upload Member Point Transaction: download Member Point Txn under Sample Format, upload your CSV, click Submit, then check Status in the listing." >}}

---

### Reporting and Data Export

**Member List Export:**
- Go to **Member Listing**
- Apply filters (e.g., "Gold tier only", "Joined last 30 days")
- Click **Export**
- Choose format: CSV or Excel
- File downloads with all filtered member data

**Transaction History Export:**
- Go to any member's profile or **Membership Report**
- Select date range (e.g., "Last month")
- Click **Export Transactions**
- Get detailed report of all point movements

**Analytics Reports:**
- Go to **Membership Report**
- Choose report type:
  - Member Demographics (age, gender distribution)
  - Point Liability Report (total outstanding points)
  - Tier Distribution (how many in each class)
  - Redemption Rate (% of members actively redeeming)
  - Inactive Members (haven't transacted in 90 days)
- Set date range and filters
- Click **Generate & Export**

---

{{< callout type="info" >}}
**Data Privacy Note:** Exported files contain personal information. Always:
- Store exports securely (don't leave on unencrypted USB drives)
- Delete exports after use (don't let old reports accumulate on desktops)
- Follow your company's data protection policies
- Never share exports via unsecured email
{{< /callout >}}

---

## FAQ

**Q: Can I support multiple types of points?**

A: Yes. You can create multiple currencies (e.g., Loyalty Points, Store Credit, Status Miles) and manage each one with its own expiry and conversion rules.

---

**Q: How do I bulk import members from an old system?**

A: Use **Upload Membership**:
1. Download the CSV template
2. Fill required fields in the same column order
3. Upload the file and review validation results
4. Fix failed rows and re-upload only those rows

**Tip:** Test with 10 records first before uploading a large file.

---

**Q: My bulk upload failed. What should I do first?**

A: Start with the validation report and fix errors in this order:
1. Duplicate Member ID
2. Missing required fields
3. Invalid date/email formats
4. Unknown class/label/currency values

Then re-upload only corrected rows so you do not create duplicates.

---

**Q: Can I set points to expire automatically?**

A: Yes. In **Points Currency** settings, choose an expiry mode:
- **Never expires** - points are permanent
- **Calendar year** - all points expire on a fixed date
- **Rolling expiry** - points expire after a period (e.g., 12 months)
- **Custom date** - campaign or policy-specific date

The system processes expiry automatically and can notify members before expiry when enabled.

---

**Q: A member says points are missing after checkout. How do I troubleshoot?**

A: Use this quick checklist:
1. Confirm the POS transaction completed successfully
2. Verify the correct member ID/phone was used
3. Check **Transaction History** for delayed sync entries
4. Confirm the earning rule and member class were active at transaction time
5. If still missing, create a documented manual adjustment and escalate integration logs to IT

---

**Q: I adjusted the wrong member by mistake. How do I reverse it safely?**

A: Create a reversal adjustment immediately:
1. Open the incorrect member profile and post the exact opposite value
2. Add a clear remark: `Reversal for mistaken adjustment ref #...`
3. Apply the intended adjustment to the correct member
4. Record both transaction references in your support ticket

Do not edit or delete historical transactions; always reverse with an equal opposite entry.

---

**Q: Why can a member have balance but still cannot redeem?**

A: Common causes are:
- Currency is not marked redeemable
- Conversion rule is inactive or outside validity dates
- Member status blocks redemption (e.g., suspended)
- Tier/class rule restricts redemption type
- Balance is in a different currency than the redemption channel expects

---

**Q: What's the difference between `Member Privilege` in the menu and `Member Class` in this guide?**

A: They refer to the same feature. The menu label is **Member Privilege**, while this guide uses **Member Class** for clarity.

---

**Q: How does this integrate with POS?**

A: You configure points and conversion rates in this applet. When a **member** shops at POS:
1. The member identifies at checkout (card, phone, or app).
2. Member pricing applies if configured.
3. The member may **use their points** toward payment.
4. When the sale is completed, the member **earns new points** on the purchase.
5. The updated balance appears in **Membership Edit → Point Transaction** (and in the member app if enabled).

See [Where members earn and spend points (POS and Sales Order)](#where-members-earn-and-spend-points-pos-and-sales-order) for the full flow.

---

**Q: Can I test changes without affecting real members?**

A: Yes. Use a test member set and a test branch/profile:
1. Create test members (e.g., `test+loyalty01@yourcompany.com`)
2. Run earn, redeem, expiry, and adjustment scenarios
3. Validate reports and exports
4. Promote settings only after test sign-off

---

**Q: What happens if I change a conversion rate from 100:1 to 200:1?**

A: Redemptions use the rate active at redemption time (based on rule validity dates). Existing transaction history remains unchanged.

---

**Q: Do members see changes immediately?**

A: Most operational changes are immediate (adjustments, labels, tier moves). Some UI areas may require app refresh or re-login, especially after configuration updates.

---

**Q: Can members transfer points to each other?**

A: Only if transferability is enabled on that currency. Most organizations keep it disabled to reduce fraud risk.

---

**Q: How do I identify manual adjustments during audit?**

A: Filter transaction history by type = **Adjusted** and export with fields for user, timestamp, reason, and reference number.

---
