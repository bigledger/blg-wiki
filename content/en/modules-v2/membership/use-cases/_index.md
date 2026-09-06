---
title: "Use Cases"
description: "Real-world business reference architectures for retail loyalty, F&B rewards, and Multi-Level Marketing (MLM) referral networks."
weight: 40
bookCollapseSection: false
---

The Membership Module flexibly supports diverse loyalty and member referral models. Below are reference operational architectures for common industry applications.

## 1. Retail Store Tiered Loyalty (Spend & Earn)

**Business Scenario:** A fashion retailer operates a 3-tier customer loyalty program (Standard, Silver, Gold) where points earned at store checkout unlock tier discounts and birthday vouchers.

- **Primary Applets:** [Membership Admin Applet](/applets/membership/membership-admin-applet/), [POS General Applet](/applets/sales-workflow/pos-general-applet/), [Voucher Management Applet](/applets/membership/voucher-management-applet/)
- **Operational Flow:** Customer identifies via mobile number at POS register → system checks tier class → tier pricing or point accrual applies → annual spend thresholds automatically upgrade member class.

---

## 2. Multi-Level Marketing (MLM) & Referral Network Sales

**Business Scenario:** A direct-selling network marketing company organizes members into sponsor downline genealogies, awarding referral bonus points and multi-tier cash override commissions.

- **Primary Applets:** [Membership Admin Applet](/applets/membership/membership-admin-applet/), [Commission Scheme Applet](/applets/membership/commission-scheme-applet/), [Sales Commission Applet](/applets/sales-workflow/sales-commission-applet/)
- **Operational Flow:** Member registers new downline members using unique referral IDs → downline purchase executed → Membership Admin tracks referral genealogy → Commission Scheme engine calculates multi-tier override payouts.

---

## 3. F&B Frequency Rewards (Digital Stamp Card)

**Business Scenario:** A coffee chain issues digital stamps for every beverage purchase, rewarding customers with a free drink voucher after 10 stamps.

- **Primary Applets:** [Membership Admin Applet](/applets/membership/membership-admin-applet/), [Voucher Management Applet](/applets/membership/voucher-management-applet/)
- **Operational Flow:** Customer buys beverage → 1 stamp currency credited → upon 10 stamps, automated voucher generation issues a single-use free drink voucher.
