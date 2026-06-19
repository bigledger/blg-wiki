---
title: "Membership & Loyalty Module"
description: "Comprehensive loyalty and membership management system with flexible points programs, tiered progression, and reward mechanisms."
weight: 45
---

## 1. Module Overview

The **Membership & Loyalty Module** provides a comprehensive loyalty and customer engagement framework. It enables businesses to build long-term relationships through structured rewards, points currencies, and tiered memberships. The module integrates directly with POS and E-Commerce storefronts for real-time points accumulation and redemption, while linking to Financial Accounting for points liability tracking.

**Business Value:**
- **Increase Customer Retention**: Reward loyal behavior with custom membership tiers and milestone progress.
- **Flexible Points Economics**: Support multiple points currencies (e.g., category-specific points) and automated conversion rates.
- **Omnichannel Loyalty**: Members can earn and redeem points seamlessly across physical retail stores (POS) and online web portals (E-Commerce).
- **Reduced Liability Risk**: Automated points expiry rules prevent ballooning financial liabilities on balance sheets.

### Core Capabilities

- **Multi-Membership Management**: Allow customers to hold multiple separate program cards or subscription classes simultaneously.
- **Tiered Progression Rules**: Automatically upgrade members (e.g., Bronze to Silver to Gold) based on annual spending or cumulative points.
- **Diverse Redemption Pathways**: Redeem points via product-specific discounts (Pricing Schemes), exclusive member catalogs (Pricebooks), or generated vouchers.
- **Partnership Loyalty Ecosystems**: Transfer or convert points currencies between partner merchant networks.

---

## 2. Key Concepts & Terminology

| Term | Definition |
|------|-----------|
| **Member Class** | A defined membership tier (e.g., VIP, Gold) that dictates discount eligibility and earning rates. |
| **Points Currency** | A digital token system used to calculate and reward loyalty value (can have multiple active currencies). |
| **Earning Rule** | A configuration mapping document triggers (e.g., spend $1, earn 1 point) to points accrual. |
| **Redemption Pathway** | The method used to spend points (Vouchers, Member-only Pricebooks, or cash conversion). |
| **Points Liability** | The balance-sheet accounting liability representing outstanding, unredeemed customer points. |
| **Points Expiry Policy** | Rule defining when unused points expire (e.g., end of calendar year, or 12 months from earning date). |

---

## 3. Included Applets

### Central Program Setup

| Applet | Purpose |
|--------|---------|
| [Membership Program Applet](/applets/membership/membership-program/) | Configure global loyalty rules, earning formulas, tier classes, and points expiry cycles. |
| [Membership Points Currency Applet](/applets/membership/membership-points-currency/) | Define currency tokens, currency symbols, conversion values, and partner exchange rates. |

### Operational Management

| Applet | Purpose |
|--------|---------|
| [Membership Admin Console Applet](/applets/membership/membership-admin-console-applet/) | Operational dashboard to view member directories, manually adjust points balances, and review tier status logs. |

### Shared & Related Applets

| Applet | Purpose |
|--------|---------|
| [Pricebook Applet](/applets/master-data/pricebook-applet/) | Define tier-specific discount catalogs linked to Member Classes. |
| [Voucher Maintenance Applet](/applets/sales-workflow/voucher-maintenance/) | Create, distribute, and track promotional vouchers issued via loyalty redemption. |
| [Doc Item Maintenance Applet](/applets/master-data/doc-item-maintenance-applet/) | Link item codes to specific points-earning rules and category rules. |

---

## 4. Standard Business Workflows

### Workflow 1: Customer Enrollment & Welcome Bonus

```
Customer Signs Up ──▶ Record Created ──▶ Program Assignment ──▶ Welcome Voucher Issued ──▶ Profile Activated
  (POS/Ecom Form)       (Customer App)    (Member Console)       (Voucher Applet)           (Ready for Use)
```

**Steps:**
1. Customer registers online or at a retail cashier counter.
2. A new customer profile is created in **Customer Maintenance**.
3. System assigns the profile to a default **Member Class** in the **Membership Admin Console**.
4. The welcome workflow triggers, automatically issuing a discount welcome voucher.
5. Membership is active, and the member receives their digital member card barcode.

### Workflow 2: Points Accrual on Sales Transaction

```
Invoice Mapped ──▶ Calculate Total ──▶ Earning Rules Applied ──▶ Ledger Posted ──▶ Points Added
 (POS or Invoice)     (Eligible Items)       (Membership App)       (Real-Time GL)     (Balance Updated)
```

**Steps:**
1. Cashier scans member card during a POS check-out or Sales Order process.
2. The transaction totals are calculated, excluding tax or ineligible items as configured.
3. System applies **Earning Rules** matching the customer's member tier.
4. The system calculates points earned, records the liability in Financial Accounting, and updates the customer's balance.

### Workflow 3: Rewards Redemption (Voucher Path)

```
Select Reward ──▶ Request Redemption ──▶ Validate Points Balance ──▶ Deduct Points ──▶ Generate Voucher
 (Member Portal)     (Cashier Console)        (Admin Console)          (Balance Update)   (Voucher Applet)
```

**Steps:**
1. A customer chooses a reward voucher from the catalog or requests a discount at the cashier.
2. The cashier requests points redemption.
3. The **Membership Admin Console** validates that the customer has sufficient active points.
4. Points are deducted from the customer's account balance.
5. System generates a unique single-use coupon code in the **Voucher Maintenance Applet** and applies it to the transaction.

### Workflow 4: Tier Progression & Expiry Processing

```
Transaction Posted ──▶ Check Cumulative Spend ──▶ Threshold Met ──▶ Upgrade Tier ──▶ Issue Notification
```

**Steps:**
1. A sales transaction is posted.
2. The system checks the member's cumulative spending or points count over the qualifying period.
3. If the next tier threshold is met, the system upgrades the Member Class.
4. The customer is automatically mapped to the new tier's Pricebook catalog and notified.

---

## 5. Roles & Permissions

| Role | Primary Applets | Key Responsibilities |
|------|----------------|---------------------|
| **Loyalty Program Manager** | Membership Program, Points Currency | Define tier boundaries, progression milestones, points economics, and expiry settings |
| **Customer Service Staff** | Membership Admin Console | Register new members, inspect point transaction histories, and resolve point discrepancy claims |
| **Store Cashier** | POS Terminal | Scan membership barcodes, apply member-only discounts, and process point redemptions |
| **Financial Controller** | Financial Report, Member Admin | Audit points ledger accounts, review outstanding points liabilities, and reconcile voucher expenses |

---

## 6. Prerequisites / Initial Setup

Before going live with the Membership & Loyalty Module, ensure:

- [x] **Core Module** — Customer Maintenance and Doc Item settings are established
- [ ] **Chart of Accounts** — Ledger accounts for loyalty expense and points liability are defined
- [ ] Points currency configurations (conversion factors, naming) are saved
- [ ] E-Commerce and POS terminal integrations are configured to request member verification
- [ ] Promotional print formats or email templates for welcome campaigns are uploaded

### Setup Sequence

1. **Points Currency Configuration**: Define currency types in the Points Currency Applet.
2. **Member Class Setup**: Define program tiers, progression thresholds, and benefits.
3. **Earning Rules**: Link document types and transaction values to specific point gains.
4. **Redemption Mapping**: Configure how points exchange for vouchers, cash value, or pricebook discounts.
5. **Testing**: Run a complete cycle of member registration, point accumulation on purchase, voucher redemption, and automatic tier upgrade to verify data flows.

---

## 7. FAQs & Troubleshooting

**Q: A customer was upgraded to the Gold tier but didn't receive Gold pricing.**
A: Verify that the customer record in **Customer Maintenance** is mapped to the correct Pricebook linked to the Gold member class. Also check if the pricebook contains active pricing for the products purchased.

**Q: Points balances aren't reflecting immediately at checkout.**
A: Check the synchronization settings between your POS terminal cache and the central **Membership Admin Console**. Real-time internet connection is required for instant balance updates; offline POS transactions queue points for processing once reconnected.

**Q: How do we handle points liability during accounting audits?**
A: All points transactions post financial journal entries representing loyalty expenses and deferred liability. Ensure your **Financial Reports** applet is configured to pull ledger balances representing points accounts for active balance sheets.

### Program Implementation Best Practices

- **Start Simple**: Implement a clear, simple progression tier (e.g., Silver, Gold) before layering complex point multiplier campaigns.
- **Review Expiry Rules**: Set expiry periods (e.g., 12 months rolling) to encourage repeat visits and manage balance sheet liabilities.
- **Audit Voucher Codes**: Set short validation windows on generated redemption vouchers to prevent duplicate claims.
