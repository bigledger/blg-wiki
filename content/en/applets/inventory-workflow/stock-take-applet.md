---
title: "Stock Take Applet"
description: "Comprehensive stock counting and variance management system for session-based inventory audits, device-driven counting, and reconciliation reporting"
tags:
- stock-take
- inventory-control
- variance-management
- cycle-count
- warehouse-operations
weight: 165
---

{{< callout type="warning" >}}
**Work in progress**: This applet documentation is in review.
{{< /callout >}}

## Purpose and Overview

The **Stock Take Applet** is a practical, operations-ready tool for running accurate inventory counts without relying on spreadsheets and manual reconciliation. It supports session-based counting, device-driven workflows, and fast variance analysis so teams can count faster and close faster.

{{< callout type="info" >}}
**Core Concept**: The applet links your count process end-to-end: **Session** (when/where you count), **Device** (who counts), **Records** (what was counted), and **Report** (how variance is reconciled).
{{< /callout >}}

{{< figure src="/images/stock-take-applet/stock-take-main-overview.png" alt="Stock Take Applet landing view showing module navigation for sessions, devices, reports, settings, and personalization." caption="Stock Take Applet Overview: Access all core stock take workflows from a single operational workspace." >}}

### About the Applet

- **Purpose**: Digitize stock count operations and reduce mismatch between physical stock and system balance.
- **Target Users**: Warehouse teams, inventory controllers, finance/audit teams, and operations leaders.
- **Key Features**:
  - Session-based stock take execution with `OPEN` and `CLOSED` controls
  - Device assignment for controlled multi-counter operations
  - Fast item capture via scan form or structured manual entry
  - Serial and batch-aware validation for traceable counting
  - Variance reporting with reason capture and Excel-based bulk reason upload

## Key Features Overview

### Who Benefits from This Applet?

**Warehouse Staff & Stock Counters:**
- Faster counting with barcode/manual scan workflows
- Less data entry fatigue with optional auto-scan behavior
- Better serialized and batch stock handling

**Inventory Supervisors & Store Managers:**
- Structured counting sessions by location
- Device assignment and progress visibility
- Controlled session closure for governance

**Finance & Internal Audit Teams:**
- Clear variance views (qty and serial variance)
- Cost impact visibility and reconciliation support
- Reason capture for exception and audit trails

**Operations Leadership:**
- Better inventory accuracy and fewer adjustment surprises
- More predictable stock reconciliation timelines
- Cleaner decision-making from reliable stock reports

### What Problems Does This Solve?

**The Manual Stock Count Problem:**

Traditional stock take processes usually involve disconnected sheets, delayed updates, and weak traceability. Common issues include:
- Duplicate or missed item counts
- Slow end-of-day reconciliation
- Serial mismatch without root-cause evidence
- No consistent reason capture for variances
- Delayed visibility for management decisions

**The Stock Take Applet Solution:**

- **Session control** - Run stock takes in structured `OPEN` and `CLOSED` cycles
- **Guided counting** - Assign devices and route counters through controlled flows
- **Flexible capture** - Use scan-first or manual count entry based on scenario
- **Serial-aware validation** - Improve confidence for serialized and batch inventory
- **Variance intelligence** - Analyze quantity and serial variance with cost impact
- **Bulk reconciliation** - Export, fill reason, and import reconciliation updates via Excel

## Key Features Overview

{{< cards >}}
  {{< card title="Session Management" subtitle="Create, run, and close controlled stock take sessions" link="#session-management" >}}

  {{< card title="Device Assignment" subtitle="Attach active devices to each session for clean execution" link="#device-management" >}}

  {{< card title="Fast Counting" subtitle="Scan form and structured entry for high-speed counting" link="#counting-workflows" >}}

  {{< card title="Serial and Batch Control" subtitle="Track serialized and batch variance with better traceability" link="#counting-workflows" >}}

  {{< card title="Variance Reporting" subtitle="See min/max, counted qty, system qty, and variance in one view" link="#reporting-and-reconciliation" >}}

  {{< card title="Reason Upload" subtitle="Export and import reason updates in Excel" link="#reporting-and-reconciliation" >}}

  {{< card title="Configurable Rules" subtitle="Control scan behavior, validation, workflow, and visibility" link="#configuration--settings" >}}

  {{< card title="Personal Defaults" subtitle="Set branch and location defaults per applet and user" link="#configuration--settings" >}}
{{< /cards >}}

## Key Concepts

### Understanding the Stock Take Framework

| Aspect | Component | Practical Example |
|--------|-----------|------------------|
| **When/Where** to count | Stock Take Session | "KL Warehouse - April Cycle Count" |
| **Who** is counting | Assigned Devices / Users | Counter Device A, Counter Device B |
| **What** is counted | Session Records | Item code, quantity, UOM, serial/batch |
| **How** results are reconciled | Session Report | Variance, serial variance, reason, cost impact |

### Stock Take Hierarchy Structure

```
Stock Take Applet
|
|-- Stock Take Session
|   |-- Details (name, code, location, status, workflow)
|   |-- Devices (assigned active counting devices)
|   |-- Records (all counted lines)
|   `-- Report (variance and reconciliation)
|
|-- Devices (master device setup)
|
`-- Report (cross-session listing and exports)
```

### Statuses and Report Types

| Type | Values | Meaning |
|------|--------|---------|
| **Session Status** | `OPEN`, `CLOSED` | Open sessions allow active counting and edits |
| **Variance Status** | `YES`, `NO` | Indicates whether a session has variance |
| **Report Type** | `Scanned Items`, `Active Items`, `All Items` | Controls report scope during analysis/export |

---

## Quick Start Guide

Use these role-specific workflows to go live quickly.

### For Stock Counters: Start Counting Items

**Goal:** Capture accurate stock records quickly using scan or manual entry.

1. Go to **Stock Take Session** and open the assigned session.
2. In **Devices** tab, select your assigned active device.
3. Open **Records** and start from **Scan Form** or **Add Item**.
4. Scan or enter item code, select UOM, then enter quantity.
5. For serialized/batch items, enter serial or batch details as required.
6. Save and verify the line appears in the list.

**Tip:** For serialized items, keep quantity and serial list aligned to avoid save errors.

---

### For Inventory Supervisors: Run a Session End-to-End

**Goal:** Set up a controlled stock take and monitor execution.

1. Open **Stock Take Session** and click **Create**.
2. Fill **Session Name**, **Session Code**, **Location**, and keep status as `OPEN`.
3. Save session, then open the **Devices** tab.
4. Add active devices for each counting team.
5. Monitor **Records** as counters submit lines.
6. In **Report** tab, click **GENERATE** or **REGENERATE** to refresh variance.
7. After review and reconciliation, change status to `CLOSED`.

---

### For Admins: Configure the Applet Before Go-Live

**Goal:** Ensure the applet is correctly configured before teams start counting.

1. Open **Settings > Field Settings**.
2. Set required toggles:
   - `ENABLE_AUTO_SCAN` (if you want scan-to-list automation)
   - `ENABLE_VALIDATE_SERIAL` (for serialized stock control)
   - `SCAN_CODE_MOBILE_VIEW` (if mobile camera scanning is used)

3. Configure `WORKFLOW_PROCESS_GUID` if workflow control is required for session progression.

{{< figure src="/images/stock-take-applet/auto-scan.png" alt="Field Settings screen with auto scan, serial validation, mobile scan, and workflow process configuration options." caption="Field Settings: Configure scan behavior, validation controls, and workflow process linking before go-live." >}}

4. Open **Settings > Default Selection** and set default Branch and Location.
5. Open **Personalization > Default Selection** and verify user-level overrides for pilot users.
6. Test end-to-end with one sample session:
   - Create session
   - Assign device
   - Add records
   - Generate report
   - Fill reason
   - Close session

---

### For Finance/Audit: Reconcile Variance and Close Exceptions

**Goal:** Complete variance review with evidence-ready notes.

1. Open the target session and go to **Report** tab.

{{< figure src="/images/stock-take-applet/session-report.png" alt="Session Report tab displaying generated report lines, variance columns, and reconciliation context for a selected stock take session." caption="Session Report View: Analyze item-level variance and prepare reconciliation within the active stock take session." >}}

2. Filter by report type (`Scanned Items`, `Active Items`, or `All Items`).


{{< figure src="/images/stock-take-applet/session-report-search.png" alt="Session Report advanced search with report type filters for Scanned Items, Active Items, or All Items." caption="Session Report Search: Filter report scope quickly to focus on the exact reconciliation set." >}}

3. Review quantity variance, serial variance, and total cost impact.
4. Enter reasons inline for key exceptions, or click **UPLOAD REASON**.
5. Export report template, fill `TotalQty` and `reason`, then import it back.
6. Confirm report lines are updated and export final report if needed.

{{< callout type="tip" >}}
**Practical Rollout Order**: Start with one pilot location and one counting team. Validate process timing, then scale to all locations.
{{< /callout >}}

---

## Session Management

### Session Listing

The session grid gives a quick operational view with fields such as:
- Session Name and Session Code
- Location and Company
- Status (`OPEN` / `CLOSED`)
- Start Date and Modified Date

{{< figure src="/images/stock-take-applet/stock-take-session-listing.png" alt="Stock Take Session listing with searchable records, session metadata, and operational status tracking." caption="Session Listing Page: Review active and completed sessions with filtering and quick access actions." >}}

### Session Details

The **Details** tab includes:
- Session identity: name, code, description
- Operational context: location and company
- Control fields: status, start/end date
- Workflow fields: status and resolution
- Audit fields: created/modified by and timestamps

{{< figure src="/images/stock-take-applet/stock-take-session-create-form.png" alt="Create Stock Take Session form with core fields such as session code, location, and workflow details." caption="Create Session Form: Configure a new stock take session with required operational information." >}}

{{< figure src="/images/stock-take-applet/stock-take-session-edit-form.png" alt="Edit Stock Take Session form showing update controls for status, details, and linked counting tabs." caption="Edit Session Form: Maintain session details and control progression from open counting to closure." >}}

### Devices Tab

Use this tab to attach active devices to the session. A device can then be used by counters to record stock lines during that session.

{{< figure src="/images/stock-take-applet/device-tab.png" alt="Devices tab inside Session Edit showing assigned counting devices and their current statuses." caption="Session Devices Tab: Attach and review active counting devices for the selected stock take session." >}}

### Records Tab

Provides session-wide visibility of counted lines across assigned devices. Supervisors can spot missing lines, mismatches, and outliers quickly.

{{< figure src="/images/stock-take-applet/session-record.png" alt="Records tab showing counted item lines with item code, quantity, UOM, and last updated information." caption="Session Records Tab: Track captured stock counts and review record-level details during execution." >}}

### Report Tab

This is the reconciliation workspace:
- Generate or regenerate report lines
- Filter and inspect variance
- Capture reasons
- Launch reason upload flow

{{< figure src="/images/stock-take-applet/session-report-tab.png" alt="Session Report tab controls with Generate/Regenerate actions, report listing, and reason update flow." caption="Session Report Tab: Generate variance output and manage reconciliation actions from one tab." >}}

## Device Management

The **Devices** menu manages your master stock take devices:
- Create device profiles (name, code, brand, model, status)
- Keep only valid and active devices for assignment
- Maintain device status for controlled session usage

{{< figure src="/images/stock-take-applet/stock-take-device-listing.png" alt="Stock Take Device listing with device code, model information, and active status used for assignment." caption="Device Listing Page: Manage available counting devices before assigning them to stock take sessions." >}}

{{< figure src="/images/stock-take-applet/stock-take-device-create-form.png" alt="Create Device form with device name, code, brand, model, and status fields for new counting devices." caption="Create Device Form: Register a new stock take device for assignment into session workflows." >}}

{{< figure src="/images/stock-take-applet/stock-take-device-edit-form.png" alt="Edit Device form showing existing device details, status updates, and audit metadata fields." caption="Edit Device Form: Maintain device profile details and activation status for ongoing operations." >}}

## Counting Workflows

### Structured Entry (Add Item)

Best when counters need guided, line-by-line entry:
- Scan Code lookup
- UOM selection
- Quantity scan/manual handling
- Serialized number list handling
- Save options such as **Save & Continue** and **Save & New**

### Fast Scan Form

Best for speed-heavy count environments:
- Optional mobile camera scan mode
- Reader type selection for barcode formats
- Quick add with quantity, remarks, and serial/batch input
- Inline list editing for remarks in scanned list

### Edit and Correction

Count lines can be reviewed and corrected from record edit screens. When a session is `CLOSED`, create/update/remove actions are restricted to protect finalization.

## Reporting and Reconciliation

### Session-Level Report

Report lines include:
- Item details: item name, code, EAN
- Quantity signals: Min, Max, Counted, EMP/System quantity
- Variance measures: Variance, Variance 2, SN Variance
- Serial analysis: system-only vs stock-take-only serials
- Financial signal: cost value and total cost impact
- Reason field for reconciliation notes

{{< callout type="info" >}}
**Terminology Note**: In report screens, **EMP Quantity** refers to the system ending balance used for variance comparison.
{{< /callout >}}

{{< figure src="/images/stock-take-applet/stock-take-session-report-details.png" alt="Stock Take Session report details showing item-level quantities, variance metrics, and reason fields." caption="Session Report Details Page: Reconcile counted quantities against system balances at item level." >}}

### Cross-Session Report Listing

The top-level **Report** menu helps compare sessions by:
- Location
- Date
- Session status
- Variance status

It also supports direct report export.

{{< figure src="/images/stock-take-applet/stock-take-report-listing.png" alt="Stock Take Report listing with variance status, grouped views, and export-ready reporting layout." caption="Report Listing Page: Analyze stock take outcomes and identify sessions requiring reconciliation." >}}

### Excel Reason Upload Flow

The applet supports reconciliation at scale:
1. Choose report type and export file.
2. Fill key fields (`itemCode`, `TotalQty`, `reason`).
3. Import file to update report lines in bulk.
4. Re-open report to verify updates.

{{< figure src="/images/stock-take-applet/stock-take-upload-reason.png" alt="Upload reason screen for importing Excel-based variance notes and quantity adjustments." caption="Upload Reason Page: Import reconciliation reasons in bulk using the stock take report template." >}}

{{< figure src="/images/stock-take-applet/stock-take-upload-reason-1.png" alt="Upload Reason follow-up screen showing selected file state and import action readiness." caption="Upload Reason Confirmation: Validate the prepared file and proceed with bulk reason import." >}}

## Configuration & Settings

### `Settings > Field Settings`

Control runtime behavior through these toggles:

| Setting | Impact |
|---------|--------|
| `ENABLE_AUTO_SCAN` | Automatically pushes scanned items into listing |
| `ENABLE_VALIDATE_SERIAL` | Enables serial validation logic |
| `STOCK_DURING_OPENING_SHOP` | Allows configuration for count timing policy |
| `SERIALIZED_ITEM_EXT` | Reads serialized behavior from item extension |
| `SCAN_CODE_MOBILE_VIEW` | Enables camera/mobile scan view |
| `HIDE_ADD_BUTTON` | Hides manual add action in scan form |
| `WORKFLOW_PROCESS_GUID` | Connects session flow to workflow configuration |

{{< figure src="/images/stock-take-applet/stock-take-settings-page.png" alt="Stock Take Applet settings with field configuration, workflow control, and default selection options." caption="Settings Page: Configure scan behavior, validation rules, and applet-level default controls." >}}

### `Settings > Default Selection`

Set applet-level defaults:
- Default Branch
- Default Location

### Permission and Integration Utilities

The settings route also exposes operational controls such as:
- Feature visibility
- Webhook setup
- Permission wizard, permission sets, and role/user/team permission views

## Audit & Traceability

The applet supports audit-focused operations through:
- Session and record timestamps (`created` and `modified`)
- User attribution on key records (`created by` and `modified by`)
- Variance reason capture at report line level
- Controlled finalization using session status (`OPEN` vs `CLOSED`)

**Practical Audit Flow:**
1. Confirm session status and closure date.
2. Review report line variances and reason fields.
3. Validate serial variance for serialized items.
4. Export final report for audit evidence.

---

## Troubleshooting Flow

Use this quick decision flow when users report stock take issues.

```text
Start
  |
  +-- What is the issue type?
      |
      +-- Scan Issue
      |    |
      |    +-- Item code not recognized?
      |    |    -> Check code exists and item is active
      |    |
      |    +-- Mobile scan not opening?
      |    |    -> Check `SCAN_CODE_MOBILE_VIEW` in Field Settings
      |    |
      |    +-- Add button not visible?
      |         -> Check `HIDE_ADD_BUTTON` in Field Settings
      |
      +-- Serial Issue
      |    |
      |    +-- Save blocked with serial error?
      |    |    -> Ensure qty matches serial count
      |    |
      |    +-- Serial validation failing?
      |         -> Check `ENABLE_VALIDATE_SERIAL`
      |         -> Verify serial belongs to the selected item
      |
      +-- Report Issue
           |
           +-- GENERATE/REGENERATE disabled?
           |    -> Confirm session status is `OPEN`
           |
           +-- Variance lines missing?
           |    -> Regenerate report and check selected report type
           |
           +-- Reason import failed?
                -> Validate Excel template columns (`itemCode`, `TotalQty`, `reason`)
                -> Re-import and review error rows
```

{{< callout type="tip" >}}
If issue persists after this flow, capture session code, device code, and a screenshot of the error state before escalating.
{{< /callout >}}

---

## FAQ

**Q: Why can I not add records in a session?**  
A: Most commonly the session is `CLOSED`. Reopen workflow/status only if your governance policy allows it.

**Q: Why does my serialized item fail to save?**  
A: Quantity and serial entries are likely imbalanced, or one/more serial values are invalid for that item.

**Q: What is the difference between Variance and Variance 2?**  
A: Variance checks counted quantity against min/max calculated range, while Variance 2 compares counted quantity directly against system ending balance.

**Q: Can I reconcile reasons in bulk instead of editing line by line?**  
A: Yes. Use **Upload Reason** to export report data, fill quantity/reason in Excel, then import.

**Q: Why is the Add button hidden in scan mode?**  
A: `HIDE_ADD_BUTTON` is likely enabled in Field Settings.

**Q: How do I include only active inventory in a report?**  
A: Use report type filters and select **Active Items** before generating/exporting.

**Q: Why can I not click GENERATE/REGENERATE in the report tab?**  
A: Report generation is available only while the session is `OPEN`.

**Q: Why are no devices available for assignment in my session?**  
A: Only active devices are available. Check the device master listing and activate the required device.

**Q: Why is my scanned item marked invalid in Scan Form?**  
A: The code may not match an active item setup, or item/serial validation rules are blocking it.

**Q: Which report type should I use: Scanned, Active, or All Items?**  
A: Use **Scanned Items** for captured-only analysis, **Active Items** for current active inventory scope, and **All Items** for full reconciliation coverage.

**Q: Can I edit or remove records after session closure?**  
A: No. Closing a session is designed to lock operational edits and preserve reconciliation integrity.
