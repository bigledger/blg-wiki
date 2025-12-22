---
title: "Claim Module"
description: "Complete expense claim management solution from submission through batch processing and reimbursement"
weight: 35
---

The Claim Module provides a comprehensive expense claim management solution that covers the entire lifecycle of employee expense claims—from initial submission through approval, batch processing, and final reimbursement. This module integrates individual claim management with batch processing workflows and project-based expense tracking.

## Overview

The Claim Module delivers:
- **End-to-End Claim Processing** - From submission to reimbursement
- **Entitlement Management** - Budget tracking and limit enforcement
- **Batch Processing** - Efficient cycle-based claim handling for finance teams
- **Project-Based Tracking** - Engagement-linked expense management
- **Comprehensive Reporting** - Analytics, audit trails, and financial exports

{{% callout type="info" %}}
**Module Scope**: This module covers all aspects of expense claim management, integrating employee self-service, manager approvals, finance processing, and project-based billing.
{{% /callout %}}

---

## Who Benefits from This Module?

### Employees
- Easy expense submission with receipt capture
- Real-time entitlement balance visibility
- Transparent approval tracking
- Quick reimbursement processing

### Managers & Approvers
- Streamlined approval workflows
- Clear visibility into team expenses
- Delegation capabilities for leave periods
- Policy compliance enforcement

### Finance Teams
- Batch processing of approved claims
- Multi-format report generation (Bank, PV, Cross-Billing)
- Audit sampling and verification
- Integration with payroll systems

### Executive Leadership
- Expense analytics and trend analysis
- Budget oversight and control
- Risk management through sampling
- Policy compliance monitoring

---

## Core Applets

The Claim Module consists of three specialized applets that work together:

{{< cards >}}
  {{< card title="Claim Applet" subtitle="Individual claim submission and management" link="/applets/claim-applet/" >}}

  {{< card title="Claim Cycle Applet" subtitle="Batch processing and finance workflows" link="/applets/claim-cycle-applet/" >}}

  {{< card title="Engagement Applet" subtitle="Project-based expense tracking" link="/applets/engagement-applet/" >}}
{{< /cards >}}

---

## Module Architecture

```
┌─────────────────────────────────────────────────────────────────────┐
│                         CLAIM MODULE                                 │
├─────────────────────────────────────────────────────────────────────┤
│                                                                      │
│  ┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐  │
│  │  CLAIM APPLET   │    │ CLAIM CYCLE     │    │  ENGAGEMENT     │  │
│  │                 │───▶│ APPLET          │◀───│  APPLET         │  │
│  │  • Submit       │    │                 │    │                 │  │
│  │  • Approve      │    │  • Batch        │    │  • Projects     │  │
│  │  • Track        │    │  • Reports      │    │  • Clients      │  │
│  │  • Entitlements │    │  • Sampling     │    │  • Billing      │  │
│  └─────────────────┘    └─────────────────┘    └─────────────────┘  │
│          │                      │                      │             │
│          ▼                      ▼                      ▼             │
│  ┌─────────────────────────────────────────────────────────────────┐│
│  │                    INTEGRATED OUTPUTS                           ││
│  │  • Entitlement Tracking    • Bank Reports     • Cross-Billing  ││
│  │  • Approval Workflows      • PV Details       • Pivot Reports  ││
│  │  • Audit Trails            • Payroll Export   • Project Costs  ││
│  └─────────────────────────────────────────────────────────────────┘│
└─────────────────────────────────────────────────────────────────────┘
```

---

## Applet Details

### 1. Claim Applet

**Purpose**: Complete employee claim management system for expense reimbursements, approvals, and entitlement tracking.

The [Claim Applet](/applets/claim-applet/) is the primary interface for employees to submit expense claims and for managers to approve them. It provides:

**Key Features:**
- **Claim Submission** - Easy digital claim creation with OCR support for receipts
- **Approval Workflow** - Multi-level approval and delegation
- **Entitlement Tracking** - Monitor claim limits and balances in real-time
- **Engagement Reports** - Project-based expense claiming
- **Travel Allowance** - Dedicated travel claim management with per-diem rates
- **Cut-Off Management** - Period-based claim controls

**Primary Users:**
- Employees (claim submission)
- Managers (approval)
- HR Teams (entitlement management)

**Documentation**: [Claim Applet →](/applets/claim-applet/)

---

### 2. Claim Cycle Applet

**Purpose**: Streamlined claim processing, cycle management, and approval workflows with comprehensive reporting and sampling analysis.

The [Claim Cycle Applet](/applets/claim-cycle-applet/) is designed for finance teams to process approved claims in batches. It consolidates individual claims into processing cycles for efficient payment generation.

**Key Features:**
- **Cycle Management** - Create and manage claim processing cycles
- **Claim Lines** - View and process individual claims in batch
- **Checking Reports** - Inbox, Approved, and On-Hold workflows
- **Payroll Payment** - Integration with salary processing
- **Sampling & Audit** - Random and targeted claim auditing
- **Multi-Format Reports** - Bank, PV Details, Cross-Billing, Pivot, Professional Subscription

**Primary Users:**
- Finance Teams (batch processing)
- Reviewers (claim verification)
- Auditors (sampling and compliance)

**Documentation**: [Claim Cycle Applet →](/applets/claim-cycle-applet/)

---

### 3. Engagement Applet

**Purpose**: Complete client engagement and project management for tracking billable and non-billable expenses against specific clients or projects.

The [Engagement Applet](/applets/engagement-applet/) enables project-based expense tracking, particularly useful for professional services firms (audit, consulting, legal) where expenses may be billable to clients.

**Key Features:**
- **Engagement Management** - Create and manage client projects
- **Fiscal Year End** - Track audit and financial year cycles
- **Employee Assignment** - Assign team members to engagements
- **Engagement Roles** - Define Partner, Manager, Director roles
- **Document Generation** - Create engagement documents
- **Entity Details** - Access client information

**Primary Users:**
- Partners & Directors (client oversight)
- Engagement Managers (project management)
- Finance Teams (billing)

**Documentation**: [Engagement Applet →](/applets/engagement-applet/)

---

## How the Applets Work Together

### Workflow Overview

```
Employee Submits Claim (Claim Applet)
         │
         ▼
Manager Approves (Claim Applet)
         │
         ▼
┌────────┴────────┐
│  Standard       │  Project-Based
│  Claims         │  Claims
│         │       │       │
│         ▼       │       ▼
│  Claim Cycle    │  Engagement
│  Applet         │  Applet
│         │       │       │
│         └───────┴───────┘
│                 │
│                 ▼
│         Finance Processing
│                 │
│                 ▼
│         Payment/Billing
└─────────────────────────────
```

### Integration Points

| From | To | Integration |
|------|----|-----------| 
| **Claim Applet** | **Claim Cycle Applet** | Approved claims flow into cycles for batch processing |
| **Claim Applet** | **Engagement Applet** | Engagement-linked claims tie to specific projects |
| **Claim Cycle Applet** | **Payroll** | Bank reports and payment exports |
| **Engagement Applet** | **Billing** | Cross-billing reports for client invoicing |

---

## Common Use Cases

### Use Case 1: Standard Employee Reimbursement

**Scenario**: Monthly medical and transport claims

1. **Employee** submits claims via [Claim Applet](/applets/claim-applet/)
2. **Manager** approves claims
3. **Finance** creates monthly cycle in [Claim Cycle Applet](/applets/claim-cycle-applet/)
4. **Finance** reviews, generates bank report
5. **Payroll** processes reimbursement

### Use Case 2: Project-Based Billing

**Scenario**: Consulting firm billing travel expenses to client

1. **Consultant** submits travel claim linked to engagement
2. **Manager** approves in [Claim Applet](/applets/claim-applet/)
3. Project tracked in [Engagement Applet](/applets/engagement-applet/)
4. [Claim Cycle Applet](/applets/claim-cycle-applet/) generates cross-billing report
5. Client invoiced for billable expenses

### Use Case 3: Audit Firm Year-End Processing

**Scenario**: Processing staff claims for audit engagements

1. **Engagements** created per client in [Engagement Applet](/applets/engagement-applet/)
2. **Audit staff** submit claims against engagements
3. **Engagement Manager** approves via [Claim Applet](/applets/claim-applet/)
4. **Finance** processes in [Claim Cycle Applet](/applets/claim-cycle-applet/)
5. Billable claims added to client invoice

---

## Implementation Approach

### Phase 1: Foundation Setup

1. **Configure Claim Applet Settings**
   - Set up Claim Items and Categories
   - Define Claim Accounts and Entitlements
   - Configure Approval Workflows
   - Set up Cut-Off Dates

2. **Configure Claim Cycle Applet**
   - Define Reviewer Settings
   - Set up Default Settings
   - Configure Report Templates

### Phase 2: Entitlement Management

3. **Upload Employee Entitlements**
   - Bulk import via Excel
   - Set up auto top-up rules
   - Configure entitlement periods

4. **Define Travel Allowances**
   - Set per-diem rates by destination
   - Configure meal allowances
   - Set up inconvenience allowances

### Phase 3: Project-Based Claims (Optional)

5. **Configure Engagement Applet**
   - Set up Engagement Categories
   - Define Engagement Roles
   - Configure Field Visibility

6. **Link Claim Items to Engagements**
   - Set up Engagement PIC workflow
   - Configure billable/non-billable settings
   - Set up cross-billing parameters

### Phase 4: Go-Live and Training

7. **User Training**
   - Employee claim submission training
   - Manager approval workflow training
   - Finance cycle processing training

8. **Pilot Run**
   - Test full workflow
   - Verify report outputs
   - Validate payroll integration

---

## Key Features Comparison

| Feature | Claim Applet | Claim Cycle Applet | Engagement Applet |
|---------|:------------:|:------------------:|:-----------------:|
| Claim Submission | ✓ | - | - |
| Approval Workflow | ✓ | ✓ | - |
| Entitlement Tracking | ✓ | - | - |
| Batch Processing | - | ✓ | - |
| Bank Reports | - | ✓ | - |
| Sampling/Audit | - | ✓ | - |
| Project Tracking | ✓ (via engagement) | ✓ (cross-billing) | ✓ |
| Client Billing | - | ✓ | ✓ |
| Fiscal Year Tracking | - | - | ✓ |
| Team Assignment | - | - | ✓ |

---

## Reporting Capabilities

### Claim Applet Reports
- My Claims Report
- Line Report (expense details)
- Entitlement Balance Report
- Staff Reports (for managers)

### Claim Cycle Applet Reports
- Bank Report (payment file)
- PV Details Report (accounting)
- Cross-Billing Report (inter-company)
- Pivot Report (analytics)
- Professional Subscription Report
- Sampling Analysis Report

### Engagement Applet Reports
- Engagement Listing
- Project Cost Summary
- Employee Assignment Report

---

## Related Documentation

### Applet Documentation
- [Claim Applet - Complete Guide](/applets/claim-applet/)
- [Claim Cycle Applet - Complete Guide](/applets/claim-cycle-applet/)
- [Engagement Applet - Complete Guide](/applets/engagement-applet/)

### Setup Guides
- *Claim Module Implementation Guide* - TODO
- *Entitlement Configuration Guide* - TODO
- *Approval Workflow Setup* - TODO

### Training Materials
- *Employee Claim Submission Training* - TODO
- *Manager Approval Training* - TODO
- *Finance Processing Training* - TODO

---

## Next Steps

After implementing the Claim Module:

1. **Start with Claim Applet** - Configure basic claim items and workflows
2. **Set up Entitlements** - Define employee allowances and limits
3. **Train Employees and Managers** - Ensure smooth adoption
4. **Configure Claim Cycle Applet** - Set up finance processing workflows
5. **Add Engagement Applet** (if needed) - For project-based tracking
6. **Monitor and Optimize** - Review reports and adjust configurations

{{% callout type="tip" %}}
**Pro Tip**: Start with a pilot group before rolling out to the entire organization. This helps identify configuration issues and refine workflows before full deployment.
{{% /callout %}}

{{% callout type="warning" %}}
**Important**: Ensure all Claim Items, Accounts, and Entitlements are properly configured before going live. Incorrect setup can lead to rejected claims and employee frustration.
{{% /callout %}}
