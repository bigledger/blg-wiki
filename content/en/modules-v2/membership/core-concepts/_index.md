---
title: "Core Concepts"
description: "Fundamental principles and design patterns of BigLedger's Membership Module — read this before configuring anything."
weight: 20
bookCollapseSection: false
---

Understanding these concepts is essential before configuring your loyalty program. They explain **how the system thinks** about membership, which directly shapes how you set up tiers, currencies, and redemption logic.

## The Three-Layer Model

BigLedger separates loyalty into three distinct layers. Each layer has its own rules:

![Three-Layer ERP Membership Architecture](/images/membership/membership_core_concepts_architecture.png)

| Layer | What it represents | Where it lives |
|-------|--------------------|----------------|
| **Customer** | The business relationship — contact info, transaction history | Core Module |
| **Member** | A customer's participation record in a program | Membership Module |
| **Program** | The rules: what currencies are active, how earning works, expiry | Membership Configuration |

---

## Multi-Level Marketing (MLM) & Referral Network Architecture

Businesses often ask how standard member loyalty differs from **Multi-Level Marketing (MLM)** or direct-selling referral trees:

```
                  ┌───────────────────────────────┐
                  │   Sponsor / Upline Member     │
                  └───────────────┬───────────────┘
                                  │ Direct Referral Link
                  ┌───────────────┴───────────────┐
                  │  Downline Member (Level 1)    │
                  └───────────────┬───────────────┘
                                  │ Indirect Referral Link
                  ┌───────────────┴───────────────┐
                  │  Downline Member (Level 2)    │
                  └───────────────────────────────┘
```

- **Single-Tier Loyalty:** A member earns points or tier status based solely on their own personal purchases.
- **Multi-Level Referral (MLM):** Members build hierarchical downline teams (Genealogy Trees). When a downline member makes a purchase, the system calculates multi-tier override points or cash commissions up the sponsor chain.
- **How BigLedger Handles MLM:** Member referral links and sponsor hierarchies are managed in the [Membership Admin Applet](/applets/membership/membership-admin-applet/), while multi-level override calculations and financial commission payouts integrate directly with the [Commission Scheme Applet](/applets/membership/commission-scheme-applet/) and [Sales Commission Applet](/applets/sales-workflow/sales-commission-applet/).

---

## Key Concepts at a Glance

| Concept | You need it because... |
|---------|------------------------|
| **Customer vs Member** | You must understand the link before creating member records |
| **Member Class vs Member Label** | Classes are tiers (Gold/Silver). Labels are tags (VIP/Newsletter). They work differently. |
| **Points Currencies** | You can have multiple point types with different rules. Design this before setup. |
| **Points Expiry** | Expiry drives redemption behavior and affects financial liability. |
| **Reward Types** | There are three redemption mechanisms. Pick the right one for your business model. |
| **MLM Referral Networks** | Structures upline sponsor trees for multi-tier commission and override points. |

---

## Three Redemption Paths

BigLedger supports three distinct mechanisms for converting membership value into benefits:

| Method | How it works | Best for |
|--------|-------------|----------|
| **Member Pricing (Pricebook)** | Item price automatically changes based on tier | Ongoing tier discounts |
| **Points Redemption** | Member uses accumulated balance to offset the bill | Flexible spend-and-burn programs |
| **Voucher** | Points fund a voucher that the member presents at checkout | Promotions, birthday rewards, campaigns |

---

## What to Read Next

1. [Configuration](/modules-v2/membership/configuration/) — start building your classes, points currencies, and conversion rates.
2. [Use Cases](/modules-v2/membership/use-cases/) — review reference architectures for retail loyalty and MLM referral networks.
