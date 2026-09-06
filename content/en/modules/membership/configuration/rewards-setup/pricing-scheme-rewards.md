---
aliases:
- /modules-v2/membership/configuration/rewards-setup/pricing-scheme-rewards/
title: "Pricing Scheme Rewards"
description: "How to configure member-specific item pricing through the pricing scheme method."
weight: 10
---

The pricing scheme method lets you set a different unit price for specific items based on member class. Unlike a voucher (which the member must present) or points redemption (which consumes balance), pricing scheme rewards apply automatically at the point of sale when the member is identified — the member simply sees a lower price.

> [!NOTE]
> Pricing scheme rewards are configured in the **Doc Item Maintenance Applet** (Core), not in the Membership Admin Applet. Membership defines who qualifies (via class); Core defines what the price is (via the scheme).

## Where to do this

The pricing scheme is configured in Core and linked to the Membership class:

**[Membership Admin Applet → Key Concepts](/applets/membership/membership-admin-applet/#key-concepts)** — understand the three reward path model

For the actual pricing configuration, refer to:
- **Doc Item Maintenance Applet** — set up the pricing scheme on the item
- **Core Pricebook Configuration** — link the pricebook to the relevant member class
