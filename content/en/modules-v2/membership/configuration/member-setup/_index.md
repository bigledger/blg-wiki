---
title: "Member Setup"
description: "Creating and organizing member records, including classes, labels, and bulk import"
weight: 10
bookCollapseSection: false
---

Member Setup is the foundation of your membership program. This section covers everything related to creating, organizing, and managing member records in BigLedger.

## What You'll Configure

**Member Records** are the individual profiles that link customers to your membership program. Each member record connects to a customer master record and tracks membership-specific information like join date, tier status, and point balances.

**Member Classes** define tiers or categories within your program. Classes enable tier-based benefits, segment members by subscription level, and control access to exclusive rewards.

**Member Labels** provide flexible segmentation orthogonal to classes. Use labels to tag members for marketing campaigns, track special interests, or flag operational attributes without changing their class status.

**Bulk Import** processes large volumes of member data from CSV files, making it practical to launch programs with thousands of existing customers or migrate from legacy systems.

## Configuration Sequence

Follow this recommended sequence when setting up members:

1. **Define Member Classes** if you're implementing a tier-based program
2. **Create Member Labels** for segmentation needs
3. **Create Individual Members** for small programs or testing
4. **Perform Bulk Import** for large-scale member creation

This sequence ensures that classes and labels exist before you assign members to them, preventing referential integrity issues.

## Multiple Memberships Per Customer

BigLedger's architecture supports multiple memberships per customer, enabling sophisticated program designs:

A retail customer might hold both a general loyalty membership and a VIP wholesale membership, each with separate point balances and reward eligibility. An individual might be a member in both a corporate program (through their employer) and a personal consumer program.

Each membership operates independently with its own:
- Point balances across all currencies
- Tier status and class assignment
- Label tags and segmentation
- Transaction history and redemption activity

When implementing multiple memberships per customer, carefully plan how you'll differentiate them in transactions and communications to avoid confusion.

## Explore This Section

The Member Setup subsection contains detailed guides for each aspect of member management:

- **Member Creation** - Creating individual member records and linking them to customers
- **Member Classes** - Defining tiers and configuring class-based benefits
- **Member Labels** - Implementing flexible segmentation with labels
- **Bulk Import** - Importing large member databases from CSV files

Work through these topics in sequence for initial setup, or reference specific guides when modifying your existing program.
