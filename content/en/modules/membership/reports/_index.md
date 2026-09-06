---
aliases:
- /modules-v2/membership/reports/
title: "Reports & Analytics"
description: "Practical scenario guide and reporting matrix for membership points auditing, tier movement tracking, and loyalty ROI."
weight: 45
bookCollapseSection: false
---

The Membership Module provides loyalty managers and marketers with detailed reporting tools to audit points liability, analyze customer tier retention, and evaluate campaign voucher redemptions.

## Reporting Scenario Decision Matrix ("Which Report to Use When")

Select the appropriate report based on your specific operational or business decision scenario:

| Business Scenario / Question | Recommended Report | Primary Applet | Key Metrics & Decision Value | Actionable Business Outcome |
|------------------------------|--------------------|----------------|------------------------------|-----------------------------|
| **"What is our total outstanding unredeemed points liability on our financial balance sheet?"** | Points Currency Liability & Balance Summary | [Membership Admin Applet](/applets/membership/membership-admin-applet/) | Total points in circulation, points-to-money monetary valuation, expired points total. | Establishes financial ledger accruals for outstanding customer loyalty reward liabilities. |
| **"Which member loyalty tiers (Gold, Platinum) generate the highest repeat purchase revenue?"** | Tier Retention & Revenue Breakdown | [Membership Admin Applet](/applets/membership/membership-admin-applet/) | Member count by class, total sales volume by tier, average order value (AOV) per member. | Helps evaluate tier benefit structures and design target campaigns for upgrading Standard members. |
| **"How many promotional campaign vouchers were issued versus actually redeemed?"** | Voucher Redemption & Campaign ROI Log | [Voucher Management Applet](/applets/membership/voucher-management-applet/) | Issued voucher serials, redemption rate %, discount cost vs. generated basket revenue. | Identifies underperforming promotional campaigns and optimizes discount budget allocations. |
| **"Did a specific customer earn or redeem points accurately on a recent store transaction?"** | Individual Member Points Audit Trail | [Membership Admin Applet](/applets/membership/membership-admin-applet/) | Transaction timestamp, POS receipt ID, points earned (+), points redeemed (-), net balance. | Resolves customer inquiries at store counters with complete audit transparency. |

---

## Detailed Operational Reporting Guides

### 1. Points Currency Ledger Auditing
- **Purpose:** Tracks all points accruals (sales earnings) and adjustments (manual credits/debits, expired points).
- **Key Parameters:** Filter by Date Range, Points Currency ID, and Transaction Type (Earn vs. Redeem vs. Manual Adjustment).
- **Operational Utility:** Prevents points fraud and verifies that automated POS earning rules are firing accurately.

### 2. Campaign Voucher Analytics
- **Purpose:** Evaluates promotion effectiveness by tracking voucher serial claims and counter redemptions.
- **Key Parameters:** Filter by Voucher Header Campaign Code, Branch Location, and Date Range.
- **Operational Utility:** Enables marketing teams to track campaign redemption velocity and calculate return on marketing investment (ROMI).
