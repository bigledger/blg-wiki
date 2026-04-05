---
title: "Merchant Applet"
description: "Comprehensive management system for platform merchant onboarding, administration, and contract lifecycle management"
tags:
- master-data
- merchant-management
- platform-administration
- onboarding-workflow
- contract-lifecycle
weight: 150
---

{{< callout type="warning" >}}
**Daily cashier report applet user guide still under progress**

**Work in Progress: This documentation is currently under development. Visual assets (screenshots) and further details will be added soon.**
{{< /callout >}}

## Purpose and Overview

The **Merchant Applet** is a specialized tool designed to manage the entire lifecycle of merchants within a business or payment platform. It serves as the primary administrative hub for onboarding new merchants, configuring their technical and financial parameters, and managing formalized service agreements or contracts.

{{< callout type="info" >}}
**Core Concept**: A **Merchant** represents a distinct partner entity identified by a unique **Merchant ID** and secured by **Merchant Keys** and **PGW Merchant Codes** for integration into the platform ecosystem.
{{< /callout >}}

## Key Features Overview

### Who Benefits from This Applet?

**Platform Administrators:**
- Centralized control of merchant registrations
- Management of secure API keys and gateway credentials
- Real-time status monitoring (Active vs. Inactive)
- Efficient configuration of merchant types and classifications

**Merchant Relationship Managers:**
- Seamless onboarding process for new partners
- Visibility into valid and expiring contracts or agreements
- Ability to update merchant profiles and contact details
- Detailed auditing of all administrative changes or interactions

**Compliance & Audit Teams:**
- Complete audit trails of every modification in the system
- Centralized repository of all merchant-related contracts
- Verification of account status and eligibility periods
- Identification of unauthorized changes through transaction logs

### What Problems Does This Solve?

**The Partner Management Friction Problem:**

Managing a large ecosystem of merchants often becomes difficult using spreadsheets or fragmented systems. Common issues include:
- Scattered merchant profile data across multiple departments
- Manual handling of sensitive Merchant Keys leading to security risks
- Lost or undocumented contractual agreements
- Lack of a formal approval process for merchant state changes
- Difficulty in verifying compliance for every registered merchant

**The Merchant Applet Solution:**

- **Structured Onboarding Workflow** - Standardized field-driven creation of merchant identities
- **Secure Key Repository** - Dedicated storage of Payment Gateway (PGW) codes and keys
- **Contract Lifecycle Hub** - Integrated tracking of formalized agreements with start and end date controls
- **Comprehensive Event Logging** - Advanced audit trails for every profile and contract modification
- **Flexible Segmentation** - Define merchants by type (Direct vs. Indirect), entity types, and AR/AP categories

## Key Features Overview

{{< cards >}}
  {{< card title="Merchant Admin" subtitle="Centralized profile creation and profile lifecycle management" link="#merchant-administration" >}}

  {{< card title="Contract Tracking" subtitle="Manage formal agreements and service level commitments" link="#merchant-contracts" >}}

  {{< card title="Secure Keys" subtitle="Centralize PGW Codes and sensitive integration keys" link="#payment-gateway-configuration" >}}

  {{< card title="Audit Trail" subtitle="Deep visibility into every configuration change and state transition" link="#audit-trails" >}}

  {{< card title="Merchant Reports" subtitle="Analyze merchant distributions and performance trends" link="#reporting-and-analytics" >}}

  {{< card title="System Personalization" subtitle="Customize dashboard views for specific admin roles" link="#personalization" >}}
{{< /cards >}}

## Key Concepts

### Understanding the Merchant Framework

The system ensures security and operational integrity through a structured hierarchy of information for every merchant:

| Component | Definition | Management Goal |
|-----------|------------|-----------------|
| **Merchant ID** | The unique internal identifier for the entity. | Uniqueness and traceability. |
| **Merchant Key/Key Material** | Secret credentials for technical integration. | Security and controlled rotates. |
| **Merchant Contract** | The formal agreement defining terms and validity. | Compliance and renewal management. |

{{< callout type="tip" >}}
**Real-World Example**: A relationship manager onboards a new Retailer (MERCHANT). They define the unique **Merchant ID**, set up the **PGW Code** for payment routing, and upload the signed **Contract**. The system then manages the transition to an "ACTIVE" state once compliance is verified.
{{< /callout >}}

### Lifecycle Progression

The applet manages the strategic movement of merchants through various operational states:

```
Platform Onboarding
│
├── Identity Registry ──→ Creation of ID, Name, and Company links
│   │
│   └── Technical Configuration ──→ Security Keys and PGW Setup
│       │
│       └── Contract Activation ──→ Formality of agreements and terms
│           │
│           └── Ongoing Audit ──→ Real-time tracking of modifications
```

---

## Quick Start Guide

### For Platform Admins: Registering a New Merchant

**Goal:** Create a profile and activate a merchant in 5 steps.

1. **Navigate**: Go to **Merchant Admin** and click **"Create Merchant"**.
2. **Identity Entry**: Enter the **Merchant ID**, **Merchant Name**, and **Merchant Company** details.
3. **Configure Technicals**: Provide the **PGW Merchant Code** and the **Merchant Key**.
4. **Define Types**: Select the appropriate **Entity Type** (e.g., Sole Proprietor, Sdn Bhd) and **Merchant Type**.
5. **Set Status**: Mark the status as **Active** or **Pending** and click **CREATE**.

---

### For Compliance Officers: Reviewing a Contract

**Goal:** Verify and monitor partner agreements.

1. **Access Contracts**: Navigate to the **Contract Container** tab.
2. **Review Listing**: Use the **Contract Listing** to search for a specific merchant’s agreement.
3. **Check Validity**: Open the contract to see the **Start Date**, **End Date**, and associated documentation.
4. **Audit History**: Use the **Audit Trail** tab to see who activated or modified the contract parameters.

---

## Configuration & Settings

Tailor your merchant management platform through the **Settings** hub:

- **Merchant Type Config**: Define the categorization rules used for merchant types.
- **Contract Templates**: Standardize the data fields required for new merchant agreements.
- **Entity Type Management**: Maintain the listing of legal entities (e.g., LLP, Private Limited).
- **Listing Personalization**: Define which columns are visible (e.g., "ID", "Name", "Key Last Updated") to optimize admin efficiency.

---

## FAQ

**Q: Can a merchant have multiple contracts?**
A: Yes, the applet's contract container allows you to track successive contracts, ensuring historical continuity as agreements renew over time.

**Q: What happens if I change a Merchant Key?**
A: Any modification to sensitive keys is logged in the Audit Trail. Ensure you update any connected services to prevent downtime during the key rotation.

**Q: Can I deactivate a merchant immediately?**
A: Yes. Changing the **Status** to **INACTIVE** in the profile will disable their operational capabilities on the platform while preserving their data for audit purposes.

**Q: Is there support for multi-currency merchants?**
A: Merchant profiles support specific **Currency** and **AR/AP Type** definitions to facilitate correct financial settlement processes within the larger ecosystem.

---
