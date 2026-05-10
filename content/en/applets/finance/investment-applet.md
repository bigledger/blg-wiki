---
title: "Investment Applet"
description: "Comprehensive investment operations applet for deposit requisitions, deposit register lifecycle, category control, and depreciation reporting."
tags:
- investment-management
- deposit-requisition
- deposit-register
- fixed-asset-reporting
- finance-control
weight: 205
---

{{< callout type="warning" >}}
**Investment Applet user guide still under progress**

**Work in Progress: This documentation is currently under development. Visual assets (screenshots) and further details will be added soon.**
{{< /callout >}}

## Purpose and Overview

The Investment Applet centralizes investment and asset lifecycle operations in one workspace. It combines deposit requisition intake, deposit register lifecycle control, category governance, and reporting into a controlled finance process.

{{< callout type="info" >}}
**Core Concept**: The applet links the request stage (Deposit Requisition), the live lifecycle stage (Deposit Register), and reporting controls (Depreciation and status analytics) so finance can operate with traceability.
{{< /callout >}}

### Who Benefits from This Applet?

**Treasury and Finance Officers:**
- Create and track deposit requisitions
- Convert approved items into active register records
- Maintain evidence through attachments and transaction history

**Finance Managers and Controllers:**
- Control posting states and lifecycle transitions
- Review depreciation and asset status trends in reports
- Reduce operational risk with standardized workflows

**Accounting Operations:**
- Align register records with company, branch, location, category, and GL mapping
- Run depreciation schedules and monitor register consistency
- Support period-end reconciliation with structured data

**Administrators:**
- Maintain deposit categories and status governance
- Configure field visibility, defaults, and feature-level controls
- Set personalization defaults to reduce entry errors

### What Problems Does This Solve?

**The Fragmented Investment Operations Problem:**

When requisition, register, and reporting are managed in separate tools, teams face:
- Broken traceability between request and active lifecycle
- Inconsistent category and status usage
- Delays in depreciation review and monthly close
- Manual consolidation for management reporting
- Higher risk of invalid master data or incomplete records

**The Investment Applet Solution:**

- **Structured requisition intake** for claim-style request lifecycle
- **Controlled register lifecycle** for active investment and asset records
- **Category governance** to standardize investment classification
- **Built-in reporting** for depreciation month-based analysis
- **Configurable settings and defaults** for consistent multi-branch operations

## Key Features Overview

{{< cards >}}
  {{< card title="Deposit Requisition" subtitle="Create and submit requisitions with line and attachment control" link="#deposit-requisition-workspace" >}}

  {{< card title="Deposit Register" subtitle="Manage active register lifecycle, status, and depreciation configuration" link="#deposit-register-workspace" >}}

  {{< card title="Deposit Category" subtitle="Maintain category master data and active/inactive governance" link="#deposit-category-workspace" >}}

  {{< card title="Reports" subtitle="Analyze depreciation by month, company, method, and asset status" link="#reports-workspace" >}}

  {{< card title="Configuration" subtitle="Field settings, default selection, feature visibility, and permissions" link="#configuration--settings" >}}

  {{< card title="Personalization" subtitle="Personal defaults and sidebar preferences" link="#personalization" >}}
{{< /cards >}}

{{< figure src="/images/investment-applet/investment-applet-overview-infographic.png" alt="Investment Applet overview placeholder showing Deposit Requisition, Deposit Register, Category, and Reports flow" caption="Investment Applet operational flow (placeholder image path ready for design handoff)." >}}

## Key Concepts

### Investment Flow Structure

```text
Deposit Requisition
  -> Review and lifecycle status progression
  -> Deposit Register activation and lifecycle management
      -> Transaction, attachment, related-doc, depreciation configuration
  -> Reporting and depreciation analysis
```

### The Four Core Areas

| Area | Purpose | Typical Owner |
|------|---------|---------------|
| **Deposit Requisition** | Intake and request lifecycle for investment placement | Treasury / Finance Officer |
| **Deposit Register** | Active lifecycle record with status, depreciation, and transaction tracking | Finance Operations |
| **Deposit Category** | Master data governance for investment grouping | Finance Admin |
| **Reports** | Periodic analysis for depreciation and asset visibility | Finance Manager / Controller |

{{< callout type="tip" >}}
Treat Requisition as the request truth and Register as the operational truth. This improves auditability and avoids reporting mismatches.
{{< /callout >}}

---

## Quick Start Guide

### For Finance Officers: Submit a Deposit Requisition

**Goal:** Create a new requisition and progress it for review.

1. Open **Deposit Requisition** from the sidebar.
2. Click **Add** to create a new request.
3. Fill required header fields: claimant, cost center, title, and entity context.
4. Add claim lines and supporting attachments.
5. Save as draft, then submit when complete.

**What you can track in listing:** Claim ID, Claimant, Claim Title, Created Date, and Status.

---

### For Finance Operations: Create and Maintain Deposit Register

**Goal:** Build and maintain an active register record with depreciation configuration.

1. Open **Deposit Register** from the sidebar.
2. Click **Add** to create a register item.
3. Fill asset details: code, name, category, company, branch, location, currency, and status.
4. Configure depreciation details for registered assets.
5. Save and maintain lifecycle updates as transactions evolve.

**What you can track in listing:** Asset Code, Asset Name, Category, Company, Location, Purchase Date, Purchase Price, Depreciation Method, and Asset Status.

---

### For Admins: Set Up Category and Controls

**Goal:** Ensure consistent category usage and field behavior.

1. Open **Deposit Category** and create categories with code, name, and status.
2. Set category statuses to ACTIVE or INACTIVE as governance requires.
3. Go to **Settings** and configure field/default controls.
4. Validate with one requisition and one register test flow.

---

## Deposit Requisition Workspace

The Deposit Requisition module behaves like a claim-style request lifecycle.

### Listing View

Key listing columns:
- Claim ID
- Claimant
- Claim Title
- Created Date
- Status

Supported search and filters:
- Keyword
- Creation Date range
- Modified Date range

### Create View (My Claim Create)

Main fields:
- Employee name and employee code (from entity profile)
- Cost center branch
- Claim title
- Claim status defaulted to DRAFT

When created, the system initializes request context with:
- Active status
- Transaction date
- Claimant entity linkage

### Edit View (My Claim Edit)

Key actions:
- Save updates
- Submit requisition
- Delete requisition (with confirmation)
- Return to listing

Common statuses in code-driven flows:
- TEMP
- DRAFT
- SUBMITTED
- APPROVED
- CLOSED

### Line and Attachment Subflows

Line and attachment workspaces include:
- Claim line create/edit
- Alternate line input UI (second UI)
- Attachment edit at header and line level
- Approvals history view per line

## Deposit Register Workspace

The Deposit Register module manages active investment and asset lifecycle records.

### Listing View

Key listing columns:
- Asset Code
- Asset Name
- Category
- Company
- Location
- Purchase Date
- Purchase Price
- Depreciation Method
- Asset Status

Search model supports:
- Company, Branch, Location
- Purchase Date range
- Asset Code range

### Create Register View

Core detail fields and mappings:
- Identity: asset code, asset name, type, serial number
- Organization: company, branch, location
- Classification: category
- Finance fields: currency, GL code, descriptive notes
- Assignment fields: employee GUID and PIC name
- Optional dimensions: segment, dimension, project, profit center

Lifecycle defaults on create path include draft-ready values for:
- Fixed asset status
- Purchase date and purchase price
- Depreciation method, averaging method, rate, and useful life

### Edit Register View

Core actions:
- Save register updates
- Update depreciation configuration
- Handle status transitions (including disposal paths via transaction type logic)
- Return to listing

Validation behavior from source:
- Draft state can save with details validity
- Registered state requires valid details plus valid depreciation configuration

### Register Sub-Tabs and Related Sections

The register view model includes supporting actions for:
- Add and edit transaction
- Add attachment
- Add related document link
- Add other journal entries
- Add depreciation schedule entries

## Deposit Category Workspace

This module controls category master data used by register records.

### Category Listing

Key columns:
- Category Code
- Category Name
- Creation Date
- Modified Date
- Status

### Category Create

Required fields:
- Category code
- Category name
- Status

Optional field:
- Description

### Category Edit

Editable fields:
- Code
- Name
- Description
- Status

Audit fields shown as read-only:
- Created by
- Modified by
- Date created
- Date updated

Additional action:
- Delete category

## Reports Workspace

Reports provide grouped and filterable depreciation analysis.

### Report Filters

Available filters include:
- Company (multi-select)
- Depreciation month range
- Category
- Asset status

The report input model supports month/year range filters used to generate depreciation-period results.

### Report Output Fields

Common report columns include:
- Company
- Category Code
- Asset Code
- Asset Name
- Asset Status
- Depreciation Method
- Averaging Method
- Purchase Date
- Disposal Date
- Useful Life
- Purchase Price
- Residual Value
- Depreciation Month / Year
- Depreciation Amount

## Configuration & Settings

### Settings Menu

From **Settings**, teams can access:
- Field Settings
- Default Selection
- Webhook
- Feature Visibility
- Permission Set Listing
- User Permission Listing
- Team Permission Listing
- Role Permission Listing

### Key Control Areas

Settings control:
- Default branch and location behavior
- Inclusion and enablement of segment/dimension/project/profit center
- Custom status flags at header and line level
- Printable and workflow behavior switches

## Personalization

From **Personalization**, users can configure:
- Personal Default Selection
- Sidebar layout preferences

This helps reduce repetitive setup for day-to-day workflows.

## Scenario Playbooks

### Manager Playbook: Requisitions Not Progressing

**Symptoms:** Many requisitions remain in draft or temp state for long periods.

1. Filter requisitions by created date and status.
2. Identify missing required fields (claim title, cost center, entity linkage).
3. Check whether required line or attachment details are incomplete.
4. Coach users to move TEMP to DRAFT and then SUBMITTED promptly.
5. Track weekly aging report for unresolved drafts.

### Finance Playbook: Register Validation Failures

**Symptoms:** Register entries fail save or cannot transition to registered workflows.

1. Validate detail fields first (code, category, organization, currency, GL, status).
2. Confirm depreciation config is complete for registered-state records.
3. Review transaction type effects for disposal scenarios.
4. Re-run save after correcting missing depreciation configuration.
5. Confirm listing reflects updated status and values.

### Finance Close Playbook: Depreciation Reporting Gaps

**Symptoms:** Report output is incomplete or missing expected records.

1. Verify company selection is provided (required in report search flow).
2. Confirm month range values are correctly set.
3. Check asset status and category filters are not overly restrictive.
4. Re-run report and compare against register listing counts.
5. Escalate mismatches with sample GUIDs for data correction.

## FAQ

**Q: Why do I see both claim-style and asset-style terms?**  
A: The investment applet source combines requisition workflows (claim-style states) and register workflows (asset lifecycle states).

**Q: What is the main difference between Deposit Requisition and Deposit Register?**  
A: Requisition is the request workflow, while Register is the active lifecycle record used for ongoing management and reporting.

**Q: Can I save a register item without depreciation setup?**  
A: Draft flows can be saved with detail validity, but registered-state workflows require valid depreciation configuration.

**Q: Why is company required in reports?**  
A: The report flow enforces company context before generating depreciation analysis.

**Q: Why are some settings not visible?**  
A: Visibility may be tenant-controlled by feature visibility and permission configuration.

## Related Documentation

- [Deposit Applet](/applets/finance/deposit-applet/)
- [MM Deposit Applet](/applets/finance/mm-deposit-applet/)
- [Fixed Asset Applet](/applets/finance/fixed-asset-applet/)
- [Investment Applet User Guide](/applets/finance/investment-guide/)
