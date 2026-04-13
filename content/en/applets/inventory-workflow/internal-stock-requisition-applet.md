---
title: "Stock Requisition (Internal) Applet"
description: "Create and manage internal outbound stock requisitions between locations, including line item tracking, knock-off (KO) import from Purchase GRN, attachments, printing, and stock transfer creation."
weight: 10
tags:
- inventory-workflow
- stock-requisition
- internal-stock-transfer
- outbound-requisition
- file-import
---

## Purpose and Overview

The **Stock Requisition (Internal) Applet** supports internal stock movements by letting teams create an **Internal Outbound Stock Requisition** (often shown as **Requisition Out**) from one location to another.

It is designed to:
- Capture the intent to move stock (**what** items, **how many**, **from** which location, **to** which location)
- Track line-level progress (ordered / received / outstanding)
- Convert approved requisitions into an operational **Stock Transfer** (via **CREATE ST**)

{{< callout type="info" >}}
**Core Concept**: A requisition is a controlled request/record of an outbound internal movement. You typically draft it, finalize it for approval/control, then create a stock transfer from it.
{{< /callout >}}

---

## Key Features Overview

### Who Benefits from This Applet?

**Warehouse / Storekeepers**
- Create requisitions for inter-location stock movement
- Add and adjust requested quantities by item
- Print requisitions for picking/dispatch

**Inventory Controllers**
- Monitor outstanding quantities by requisition and by line item
- Identify bottlenecks (unfulfilled requests, partial receipts)
- Use KO (knock-off) to link and reconcile against upstream documents

**Branch Operations / Managers**
- Ensure transfers are finalized before processing
- Maintain traceability with reference numbers, tracking IDs, and attachments

### What Problems Does This Solve?

Without a requisition workflow, internal stock movement is often tracked via spreadsheets or informal messaging, causing:
- Missing audit trail for “who requested what”
- Difficulty tracking partial fulfillment
- Inconsistent documentation across locations

This applet provides a structured flow with clear **posting status** (Draft/Final/Void), searchable listings, and line item reporting.

---

## Feature Navigation

The main left menu entries in the applet are:

{{< cards >}}
  {{< card title="Requisition Out" subtitle="Create, finalize, void, print, and create Stock Transfer (ST)" link="#requisition-out-internal-outbound-stock-requisition" >}}
  {{< card title="Line Items" subtitle="Line-level listing for analysis (qty ordered/received/outstanding)" link="#line-items" >}}
  {{< card title="File Import" subtitle="Bulk import interface and processing status" link="#file-import" >}}
  {{< card title="Settings" subtitle="Default selection, field settings, printable formats" link="#settings" >}}
{{< /cards >}}

---

## Key Concepts

### 1. Locations: Sending vs Receiving

Every requisition is defined by two required locations:

| Field | Meaning |
| --- | --- |
| **Location (Sending)** | Where stock will be issued from |
| **Location (Receiving)** | Where stock is requested to |

Access to available locations may be constrained by tenant permission targets (for example, some users may only be allowed to create/see documents for specific locations).

### 2. Posting Status (Draft / Final / Void)

The listing and view screens use posting status as a control mechanism:

| Status | Typical meaning |
| --- | --- |
| **DRAFT** | Editable working state |
| **FINAL** | Confirmed state used for downstream processing |
| **VOID** | Cancelled / invalidated document |

{{< callout type="warning" >}}
Most action buttons (for example **FINAL**, **VOID**, **DISCARD**, **DRAFT**) appear or are enabled based on status and tenant settings.
{{< /callout >}}

### 3. Line-level fulfillment

The applet provides a dedicated **Line Items** view with operational quantities:
- **Qty Ordered**
- **Qty Received**
- **Qty Outstanding**

This is useful for exception handling (partial fulfillment, delayed transfers).

### 4. Knock-Off (KO) for Purchase GRN

During creation, there is a **KO For** tab that supports importing/knocking-off against **Purchase GRN** (Goods Received Note) queues. This helps link requisitions to upstream documents for reconciliation and traceability.

---

## Quick Start Guide

### For Warehouse Users: Create a Requisition Out

**Goal:** Create an internal outbound stock requisition from one location to another.

1. Open **Requisition Out**.
2. Click **Create** ("+").
3. In **Details**:
	- Select **Location (Sending)**.
	- Select **Location (Receiving)**.
	- (Optional) Fill **Driver Code**, **Tracking ID**, **Reference #**, **Doc Description**, **Remarks** (visibility may depend on settings).
4. In **Line**:
	- Add items and quantities.
	- Use the quick search and line selection to review line details.
5. (Optional) In **KO For**:
	- Open **Purchase GRN** and select items/documents to import/knock-off.
6. Click **CREATE**.

### Finalize and Print

**Goal:** Finalize a draft requisition, then print for operations.

1. Return to **Internal Outbound Requisition Listing**.
2. Select one or more requisitions.
3. Click **FINAL** to confirm.
4. Click **PRINT** to generate/print output for dispatch.

### Create Stock Transfer (ST)

If enabled for your tenant and the document status allows it, you can select requisitions and click **CREATE ST** to generate a Stock Transfer downstream document.

{{< callout type="tip" >}}
If **CREATE ST** is disabled, it is commonly due to status (not finalized), permissions, or applet settings that hide/disable the action.
{{< /callout >}}

---

## Requisition Out (Internal Outbound Stock Requisition)

This workspace is the main operational area of the applet.

### Listing

From **Internal Outbound Requisition Listing**, common actions include:
- **Create** ("+") — start a new requisition
- **FINAL** — finalize selected draft documents
- **DISCARD** — discard selected draft documents
- **VOID** — void selected finalized documents
- **DRAFT** — return selected documents to draft (only when enabled)
- **CREATE ST** — create stock transfer from selected requisitions (when enabled)
- **PRINT** — print selected documents

### Create / View screen layout

Create and view screens support two layouts depending on tenant settings:
- **Tabbed layout** (horizontal tabs)
- **Panel layout** (vertical expansion panels)

In **Create**, the main sections are:
- **Details** — locations and document header fields
- **Line** — line item entry and review
- **KO For** — KO import from **Purchase GRN**

In **View**, additional sections are commonly available:
- **Doc Link** — document link visibility
- **Attachment** — attachment management
- **Export** — export-related tools (when enabled)

---

## Line Items

Use **Line Items** when you need a line-level operational view across documents.

Typical use cases:
- Find items with high **Qty Outstanding**
- Filter by transaction date and locations
- Export grids for analysis (Ag-Grid export features may be available depending on tenant configuration)

---

## File Import

Use **File Import** to manage bulk import jobs.

The listing includes operational fields such as:
- **File Name / Size**
- **Format**
- **Status / Process Status**
- **Error Message**
- **Created / Updated Date**

This is typically used for high-volume initialization or corrections where manual entry is not practical.

---

## Settings

The applet exposes standard configuration areas (availability depends on tenant policy):

| Area | What it controls |
| --- | --- |
| **Application Settings** | Field configuration / field visibility rules |
| **Default Selection** | Default company/branch/location selections |
| **Printable Format Settings** | Printing layout selection and configuration |
| **Webhook / Feature Visibility** | System integration and feature toggles |
| **Permissions** | Permission wizard, permission sets, user/team/role permissions |
| **Release Notes / Applet Log** | Change history and operational logs |

---

## Personalization

Personalization allows user-level preferences (for example **Personal Default Selection**) so different users can work faster without changing tenant-wide defaults.

---

## FAQ

**Q: Why can’t I see or select certain locations?**  
A: Location lists can be restricted by permission targets. Tenant Admin/Owner users may have broader access compared to standard users.

**Q: What’s the recommended workflow: Draft or Final?**  
A: Use **DRAFT** while preparing and checking items. Use **FINAL** when the requisition is confirmed and ready for downstream processing (printing and stock transfer creation).

**Q: Why is the “KO For” tab only showing Purchase GRN?**  
A: In the current applet implementation, the KO import tab is configured for **Purchase GRN**.

**Q: Why are some tabs or buttons missing?**  
A: Many screens and actions are controlled by tenant settings (hide/show flags) and by permissions. For example, document actions can be hidden via settings, and some detail fields (Tracking ID, Doc Description, Reference #) can be hidden per tenant policy.
