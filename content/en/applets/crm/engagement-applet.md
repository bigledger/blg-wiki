---
title: "Engagement Applet"
description: "Complete client engagement and project management system for professional services firms"
tags:
- engagement-management
- client-projects
- fiscal-year-tracking
- employee-assignment
- professional-services
weight: 110
---

## Purpose and Overview

The **Engagement Applet** is a specialized project and portfolio management module designed specifically for professional services firms (such as audit, accounting, legal, consulting, and tax advisory). It transitions client onboarding and project assignment from manual spreadsheets to a central database linked directly to your organization's billing and resource pools.

{{< callout type="info" >}}
**Core Concept**: An **Engagement** acts as the master record for a client contract or project. It links the client (Entity) with operational branch boundaries, tracks statutory deadlines via fiscal year cycles, and handles detailed staff resource allocations.
{{< /callout >}}

{{< figure src="/images/engagement-applet/engagement-applet-overview.png" alt="Quick-Start Guide: Mastering the Engagement Applet infographic. Details the 3-step onboarding workflow, yearly vs perpetual tracking, specialized staffing tiers, and key leadership roles." caption="Quick-Start Guide: An overview infographic outlining client onboarding steps (create file, allocate teams, automate documents), tracking types, specialized staffing tiers, and key leadership roles." >}}


### Who Benefits from This Applet?

**Partners and Directors:**
- **Portfolio Oversight**: Monitor all active engagements and critical status indicators at a glance.
- **Risk Management**: Track critical compliance dates and assign an Engagement Quality Control Reviewer (EQCR) to high-risk files.
- **Leadership Assignment**: Maintain sign-off accountability by assigning key leadership roles.

**Engagement Managers:**
- **Resource Management**: Assign teams and coordinate staff allocations across active client files.
- **Statutory Tracking**: Manage annual client audits using automated year-end intervals.
- **Administrative Operations**: Auto-generate client paperwork using standard document templates.

**Finance and Billing Teams:**
- **Billing Boundaries**: Link engagements directly to specific business branches and job groups.
- **Revenue Recognition**: Monitor engagement progression statuses to align with progress billings.

**HR and Resource Managers:**
- **Capacity Planning**: View employee workloads across different client engagements.
- **Skills Matching**: Filter and search the employee registry to match project needs.

### What Problems Does This Solve?

| The Spreadsheet-Based Project Problem | The Engagement Applet Solution |
| :--- | :--- |
| **Scattered Client Records**: Project codes, partner sign-offs, and client accounts are stored in siloed files, leading to metadata drift. | **Single Source of Truth**: All engagement data is housed in a central system, directly integrated with client master profiles (Entities). |
| **Missed Statutory Deadlines**: Annual audit cycles and tax filings depend on manual calendar reminders, leading to compliance slip-ups. | **Fiscal Year End (FYE) Cycles**: Tracks annual timelines dynamically, preserving individual history per fiscal year. |
| **Resource Double-Booking**: Employees are assigned to overlapping audits without central visibility into their total workload. | **Unified Team Allocations**: Direct query profiles display team allocations and allow filtering by availability and charge rates. |
| **Manual Form Generation**: Drafting engagement letters and sign-off checklists requires manual data copying, increasing typo risks. | **Gen Doc Automation**: Integrates with document templates to generate and store engagement letters directly within the record. |

---

## Key Features Overview

{{< cards >}}
  {{< card title="Engagement Registry" subtitle="Log and track client engagements with status controls" link="#engagement-listing" >}}

  {{< card title="Fiscal Year End (FYE) Tracking" subtitle="Manage yearly cycles and compliance deadlines" link="#fiscal-year-end-tab" >}}

  {{< card title="Role and Team Assignment" subtitle="Assign Partners, Managers, and audit staff" link="#employee-management" >}}

  {{< card title="Gen Doc Automation" subtitle="Create engagement letters and project documentation" link="#gen-doc-tab" >}}

  {{< card title="Categorization Settings" subtitle="Organize engagements by service line (e.g. Audit, Tax)" link="#engagement-category" >}}

  {{< card title="Applet Settings" subtitle="Configure branch rules, custom naming, and field settings" link="#configuration-and-settings" >}}
{{< /cards >}}

---

## Key Concepts

### 1. FYE Type: Perpetual vs. Yearly

When onboarding an engagement, you must define its time-tracking behavior by selecting a Fiscal Year End (FYE) Type:

```
                          ┌── Yearly Type ─────→ Annual Cycles (e.g. Audits, Tax)
                          │                      Preserves separate team lists per year.
Engagement FYE Type ──────┤
                          │
                          └── Perpetual Type ──→ Ongoing Services (e.g. Monthly Retainers)
                                                 Single persistent team configuration.
```

- **Yearly**: Used for projects tied to strict annual accounting or tax periods. It enables the **Fiscal Year End** tab, allowing you to add yearly periods (e.g., Jan 1, 2024 - Dec 31, 2024). Each year maintains its own independent status and staff assignments.
- **Perpetual**: Used for continuous, ongoing services (e.g. monthly bookkeeping retainers or general advisory contracts). Staff and roles are assigned directly on the Main tab and remain active until manually changed.

### 2. Standardized Service Roles

To ensure clear ownership and audit accountability, the applet enforces structured role categories:

| Role | Abbreviation | Responsibility | Scope |
| :--- | :--- | :--- | :--- |
| **Engagement Partner** | EP | Ultimate file sign-off, client billing ownership, and project accountability. | Assignable |
| **Engagement Manager** | EM | Day-to-day coordination, project milestones, and staff management. | Assignable |
| **Engagement Director** | ED | High-level quality control, review procedures, and compliance sign-off. | Optional |
| **Managing Partner** | MP | General firm leadership oversight and executive review. | Optional |
| **EQCR** | EQCR | Engagement Quality Control Reviewer. Conducts independent file reviews. | High-Risk Files |
| **Key Audit Partner** | KAP | Specifically required for Public Interest Entity (PIE) statutory audits. | Statutory Audits |

### 3. Engagement Data Hierarchy

The database structures records as a nested hierarchy under the Client account:

```
Client Profile (Entity)
│
└── Engagement File (Main Details: Code, Name, Job Group, FYE Type, Status)
    │
    ├── Perpetual Type ──→ Assigned Roles & Team Members (Persistent)
    │
    ├── Yearly Type ─────→ Fiscal Year End periods (e.g. FY2023, FY2024)
    │                      │
    │                      ├── Yearly Roles (Partner, Manager per FY)
    │                      │
    │                      └── Yearly Employees (Audit Seniors/Associates)
    │
    └── Gen Docs ────────→ Historical archive of generated documents
```

---

## Quick Start Guide

Set up and coordinate engagements in a few simple steps.

### Step 1: Create the Engagement File

**Goal:** Onboard a client engagement file and select its time-tracking behavior.

1. Navigate to **Engagement Listing** from the left navigation panel.
2. Click the **Create ("+")** button in the header.
3. Click the **Customer Name** field, search for your client in the Entity popup, and select them.
4. Select the **Job Group** (representing the responsible branch office).
5. Choose your **FYE Type**:
   - Select **Perpetual** for ongoing services (e.g. advisory retainers).
   - Select **Yearly** for cycle-based projects (e.g. statutory audits).
6. Fill in optional fields like the **Alternate Code** and a detailed scope **Description**.
7. Click **SAVE** in the header.

---

### Step 2: Establish Years & Teams (For Yearly Type)

**Goal:** Create an annual audit period and allocate the audit team.

1. Open a Yearly engagement from the listing and select the **Fiscal Year End** tab.
2. Click **Create ("+")** in the FYE grid.
3. Enter the **Date Start** (e.g. `2024-01-01`) and **Date End** (e.g. `2024-12-31`).
4. Set the period status to **Draft** or **Active** and click **SAVE**.
5. Select the newly created year row and double-click to open the FYE Edit workspace:
   - **Assign Roles**: Select the **Engagement Role** sub-tab and assign the key Partner (EP) and Manager (EM) for this year.
   - **Assign Staff**: Select the **Employee** sub-tab, click **Add Employee**, search the staff registry, and select your audit associates.
6. Click **SAVE** in the header.

---

### Step 3: Automate Documentation

**Goal:** Generate an official engagement letter for the client.

1. Open the engagement file and select the **Gen Doc** tab.
2. Click the **Generate Document** trigger button.
3. Select your template (e.g., `Audit Engagement Letter V2`).
4. The system automatically extracts the client legal name, registration number, assigned partner, and fee details to construct the document.
5. Review the document status and click **Export as PDF** to download it.

---

## Create vs. Edit Workspace

The applet changes its layout and available tabs depending on whether you are editing the parent engagement file or managing an individual yearly period.

### Parent Engagement Workspace

Double-clicking an engagement from the listing opens the parent editor:

{{< figure src="/images/engagement-applet/engagement-listing.png" alt="Engagement Listing page showing client engagement files" caption="Engagement Listing: The main interface showing the portfolio of client engagements." >}}

#### 1. Main Tab
Captures the core metadata and administrative roles:
- **Customer Name**: Linked client entity profile.
- **Engagement Code**: Unique file ID.
- **Job Group**: The operating branch overseeing the project.
- **Engagement Name**: Auto-generated naming string combining the client, project, and branch.
- **Alternate Code**: Optional secondary accounting ref number.
- **FYE Type**: Sets either Perpetual or Yearly tracking.
- **Status**: The workflow state of the parent file (e.g., Draft, Active, Complete).
- **Description**: Scope and contract terms.
- **Engagement Roles (Perpetual only)**: Assigns the Partner, Manager, and Director directly on this screen when FYE Type is Perpetual.
- **Entity Details Button**: Launches a lookup window showing address and contact details of the selected client.

{{< figure src="/images/engagement-applet/edit-engagement-main.png" alt="Edit Engagement Main tab showing client and role details" caption="Main Tab: Manage engagement codes, customer entity linking, and perpetual role assignments." >}}

#### 2. Fiscal Year End Tab (Yearly only)
Lists all fiscal cycles configured for the client. Selecting a row and clicking edit opens the [FYE Sub-Workspace](#fye-sub-workspace-yearly-only).

{{< figure src="/images/engagement-applet/fiscal-year-end-tab.png" alt="Fiscal Year End tab showing configured audit periods" caption="Fiscal Year End Tab: Lists annual audit cycles for yearly engagements." >}}

#### 3. Gen Doc Tab
Lists and generates client documents (Letters of Engagement, planning documentation). The grid displays:
- **Doc Type**: The document template used.
- **Doc No**: Generated tracking ID.
- **Status**: Current document state.
- **Transaction Date**: Date of creation.

{{< figure src="/images/engagement-applet/gen-doc-tab.png" alt="Gen Doc tab showing generated letter templates" caption="Gen Doc Tab: Generate and archive official client letters and memos." >}}

---

### FYE Sub-Workspace (Yearly only)

Double-clicking a year row under the Fiscal Year End tab opens the yearly cycle workspace, containing these sub-tabs:

#### 1. Main Sub-tab
Controls the date boundaries of the annual cycle:
- **Date Start / Date End**: The fiscal period dates.
- **Status**: Cycle status (e.g. Draft, Active, Fieldwork, Complete).
- **Audit Logging**: Read-only tracking showing Created By, Modified By, Created Date, and Modified Date.
- **DELETE Button**: Trigger to delete the fiscal year. Requires double-clicking (**CLICK AGAIN TO CONFIRM**) to prevent accidental deletions.

#### 2. Engagement Role Sub-tab
Assigns the Partner (EP), Manager (EM), Director (ED), EQCR, and Key Audit Partner (KAP) responsible for this specific fiscal year. This allows firms to track partner rotations across different years for the same client.

#### 3. Employee Sub-tab
Lists all staff assigned to the fieldwork.
- **Add Employee**: Opens the resource allocation drawer.
- **Staff Filters**: Search by employee name, filter by department/role, and sort by billing charge rates.
- **Staff List Grid**: Displays name, role designation, and date assigned.

---

## Configuration and Settings

Administrators manage applet behaviors under the Settings workspace. They are configured via the following options:

| Configuration Area | Setting Key | Parameter Purpose | Path & Default Behavior |
| :--- | :--- | :--- | :--- |
| **Default Settings** | `DEFAULT_BRANCH` | Sets the default branch selected when creating a new engagement. | `Settings > Default Selection` <br> Defaults to the user's primary operating branch. |
| **Default Settings** | `DEFAULT_LOCATION` | Sets the default location. | `Settings > Default Selection` <br> Pre-populates default location for related operations. |
| **Field Configuration** | `HIDE_CUSTOMER_NAME` | Hides the Customer Name lookup field. | `Settings > Field Settings` <br> Default: `false`. Unhide to link client accounts. |
| **Field Configuration** | `HIDE_ENGAGEMENT_CODE` | Hides the unique Engagement Code. | `Settings > Field Settings` <br> Set to `true` to let the system auto-generate codes. |
| **Field Configuration** | `HIDE_MANAGING_PARTNER` | Hides the Managing Partner assignment role. | `Settings > Field Settings` <br> Default: `false`. Hide if leadership sign-off is not tracked. |
| **Field Configuration** | `HIDE_EQCR` | Hides the EQCR reviewer role. | `Settings > Field Settings` <br> Enable for audit firms; disable for standard consulting firms. |
| **Field Configuration** | `ENABLE_AUDIT_TRAIL` | Enables deep logging of all data edits. | `Settings > Field Settings` <br> Default: `false`. Toggle to `true` to track all record changes. |
| **Feature Visibility** | `HIDE_ENGAGEMENT_CREATE_BUTTON` | Prevents users from creating new engagements. | `Settings > Field Settings (Listing)` <br> Restricts creation to partners or admins. |
| **Feature Visibility** | `DISABLE_EDITING_ENGAGEMENTS` | Locks all existing engagements as read-only. | `Settings > Field Settings (Listing)` <br> Default: `false`. Set to `true` during post-audit reviews. |
| **Feature Visibility** | `RELABEL_COMPANY_TO_ENTITY` | Renames the 'Company' field to 'Entity'. | `Settings > Field Settings (Listing)` <br> Default: `false`. Toggle to fit professional jargon. |
| **Feature Visibility** | `RELABEL_BRANCH_TO_JOB_GROUP` | Renames 'Branch' field to 'Job Group'. | `Settings > Field Settings (Listing)` <br> Default: `false`. Toggle to match firm organization. |
| **Feature Visibility** | `HIDE_TOGGLE_BUTTON` | Hides the grid/list layout switch button. | `Settings > Field Settings (Listing)` <br> Default: `false`. Locks users to the standard grid view. |
| **Engagement Category**| `ENGAGEMENT_CATEGORIES` | Configures client category presets. | `Settings > Engagement Category` <br> Create categories like Audit, Tax, Advisory, Legal. |
| **Webhook Config** | `WEBHOOK_INTEGRATIONS` | Sets up automated webhooks. | `Settings > Webhook` <br> Triggers API calls on creation to sync with PM tools. |
| **Permissions** | `USER_PERMISSIONS_WIZARD` | Assigns User/Team roles. | `Settings > Permissions` <br> Map roles: Viewer (Read-only), Editor, Manager, Admin. |

---

## Personalization

Personalization allows users to customize their individual workspace:
- **Personal Default Settings** (`Personalization > Default Settings`): Set your preferred branch, company, and location. These will auto-populate on your screen when you create records.
- **Custom Sidebar** (`Personalization > Sidebar`): Rearrange sidebar menus, hide unused tabs, and bookmark your most frequently accessed client files.

---

## Frequently Asked Questions

**Q: Can I change an engagement's FYE Type after creation?**  
A: No. Changing the FYE Type between Perpetual and Yearly changes how the database structures team assignments and dates. If a change is required, you must create a new engagement file with the correct type.

**Q: How do I assign different staff teams for different years?**  
A: Ensure the parent engagement is set to **Yearly**. Create a Fiscal Year End record for each year. Double-click the year row to enter its workspace, and use the **Employee** tab to assign staff specifically to that year. 

**Q: What is the difference between Engagement Role and Employee tab?**  
A: The **Engagement Role** sub-tab is reserved for key leadership and compliance personnel (Partners, Managers, EQCR, Directors). The **Employee** sub-tab is for the execution team members (Seniors, Associates, and field staff).

**Q: Why can't I see the Fiscal Year End tab in my engagement?**  
A: This tab is conditional on the **FYE Type** field. If the engagement is set to **Perpetual**, the Fiscal Year End tab will not display. Set the field to **Yearly** during creation to enable it.