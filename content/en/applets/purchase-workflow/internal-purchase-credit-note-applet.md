---
title: "Internal Purchase Credit Note Applet"
description: "Create and manage internal purchase credit notes (PCN) with posting controls (Final/Void/Discard), E-Invoice, ARAP, KO import, attachments, contra, export, and supporting menus for line-item analysis and CSV file import."
weight: 80
tags:
- purchase-workflow
- purchase-credit-note
- internal-purchase
- e-invoice
- arap
- file-import
- line-items
---

## Purpose and Overview

The **Internal Purchase Credit Note Applet** supports preparing and managing internal **Purchase Credit Notes (PCN)**.

It is designed to:
- Create purchase credit notes with structured **Main Details**, **Account**, and **Line Items**
- Control the document lifecycle through standard posting controls (**Draft/Final/Void/Discard**) depending on tenant settings and permissions
- Support operational sections such as **E-Invoice**, **ARAP**, **Contra**, **Doc Link**, **Attachments**, and **Export** (availability depends on settings)
- Provide supporting work pages such as **Line Items** (cross-document analysis) and **File Import** (CSV upload and checking)

{{< callout type="info" >}}
This applet uses standard BigLedger document controls. Buttons, tabs, and menu items can be hidden by tenant settings and client-side permissions.
{{< /callout >}}

---

## Key Features Overview

### Who Benefits from This Applet?

**Purchasers / Procurement team**
- Create credit notes and maintain supplier/account details
- Add and review credit note lines
- Use KO (Knock-Off) import when enabled

**Finance / Controllers**
- Enforce posting controls and audit actions (Final/Void/Discard)
- Manage settlement-related views in **ARAP** (when enabled)
- Support e-invoice workflows (when enabled)

**Operations**
- Attach supporting documents and export documents for downstream processing
- Use **File Import** for bulk input when enabled

---

## Feature Navigation

The main left menu entries in the applet are:

{{< cards >}}
	{{< card title="Internal Purchase Credit Note" subtitle="PCN listing + create/edit workflow" link="#internal-purchase-credit-note" >}}
	{{< card title="Line Items" subtitle="Cross-document line analysis + edit line details" link="#line-items" >}}
	{{< card title="File Import" subtitle="CSV upload, import tracking, and checking results" link="#file-import" >}}
	{{< card title="Settings" subtitle="Default selection, field settings, printable formats, branch settings" link="#settings" >}}
{{< /cards >}}

---

## Key Concepts

### 1. Status vs Posting Status

In this applet you may see both:

| Concept | Typical values | What it means |
| --- | --- | --- |
| **Status** | `TEMP`, `ACTIVE` | Working state of the record |
| **Posting Status** | `DRAFT`, `FINAL` | Posting control state (locking / downstream controls) |

### 2. Tabs vs Panels (Orientation)

The edit screen supports two layouts depending on tenant settings:
- **Tabbed layout** (horizontal tabs)
- **Panel layout** (vertical expansion panels)

In panel layout, default expansion behavior is controlled by settings (for example which panels expand by default).

### 3. Feature visibility (settings + permissions)

Many UI areas are condition-based:
- Listing buttons such as **FINAL**, **VOID**, **DISCARD**, and **SAVE** can be hidden by settings and/or exposed by client-side permissions.
- The **File Import** menu can be hidden by settings and also depends on having a permission that allows it.
- Several edit tabs (ARAP / Payment / Contra / Doc Link / Attachment / Export) are controlled by hide/show flags.

---

## Quick Start Guide

### Create a Purchase Credit Note

1. Open **Internal Purchase Credit Note**.
2. Click **Create** ("+").
3. Fill **Main Details**.
4. Fill **Account** (Entity Details, Bill To, Ship To).
5. Add **Line Items**.
6. (Optional) Fill **Payment**, **Department Hdr**, or **KO For** (these tabs may be hidden by settings).
7. Click **CREATE**.

### Finalize or Void

From the listing or edit screen (depending on tenant configuration), you may use:
- **FINAL** to confirm/post the document
- **VOID** or **DISCARD** to cancel a draft/active document (availability depends on status and settings)

---

## Internal Purchase Credit Note

### Listing

The listing provides:
- **Create** ("+") (requires create permission)
- **FINAL**, **DISCARD**, **VOID** (can be hidden by settings)
- **SELF-BILLED** action
- Advanced search, pagination, and column toggle

The grid is Ag-Grid based and commonly includes document numbers (tenant/company/branch), e-invoice fields (when enabled), posting status, transaction date, reference fields, and amounts (exact columns depend on settings and permissions).

{{< callout type="warning" >}}
If some buttons or columns are missing, it is often due to tenant settings or client-side permissions (for example hide/show flags for posting buttons or document number fields).
{{< /callout >}}

### Create screen tabs

Create uses a tabbed layout with these common sections:
- **Main Details**
- **Account**
- **Line Items**
- **Payment** (optional)
- **Department Hdr** (optional)
- **KO For** (optional; uses a generic KO/import component)

### Edit screen tabs/panels

Edit extends create with additional operational sections depending on settings:
- **E-Invoice**
- **ARAP** (optional)
- **Trace Document** (optional)
- **Contra** (optional)
- **Doc Link** (optional)
- **Attachment** (optional)
- **Export** (optional)

The edit header also includes **SAVE** (can be hidden by settings) and may show a currency/forex control when applicable.

---

## Line Items

The **Line Items** menu is a cross-document line analysis page (separate from the per-document lines tab). It supports:
- Advanced search
- Column toggling and pagination
- Row-click drill-in to an **Edit Line Item** screen

### Edit Line Item

The line editor provides a structured set of sections (tabbed or panel layout depending on settings), commonly including:
- **Item Details**
- **Serial Number / Batch Number / Bin Number** (only when the item type supports it and not hidden)
- **Costing Details** and **Pricing Details** (can be hidden)
- **Issue Link** (can be hidden)

There is also a **DELETE** action that uses a confirm-on-second-click pattern.

---

## File Import

The **File Import** menu provides import tracking and CSV upload.

### Listing

The listing provides:
- **Create** ("+") to start a new import
- Server-side grid with import rows

### Create (Upload)

The upload screen supports:
- Selecting a CSV **Delimeter**
- Drag-and-drop file upload
- A **Sample Format** link
- **SUBMIT** to start processing

### Edit (Details + Checking)

Each import record supports:
- **Details** (File Name, File Size, Import Format, Process Status, Error Message, Created By, Creation Date)
- **Checking** results (grid-based checking output)

{{< callout type="info" >}}
The File Import menu can be hidden by tenant settings and may also depend on client-side permission configuration.
{{< /callout >}}

---

## Settings

The applet exposes standard configuration areas (availability depends on tenant policy):

| Area | What it controls |
| --- | --- |
| **Application Settings** | Field configuration / field visibility rules |
| **Default Selection** | Default company/branch/location selections |
| **Printable Format Settings** | Printing layout selection and configuration |
| **Branch Settings** | Branch-scoped defaults and behavior |
| **Webhook / Feature Visibility** | Integration and feature toggles (if enabled) |
| **Permissions** | Permission sets, user/team/role permissions, and permission wizard (if enabled) |
| **Release Notes / Applet Log** | Change history and operational logs (if enabled) |

---

## Personalization

Personalization allows user-level defaults (for example **Personal Default Selection**) without changing tenant-wide settings.

---

## i18n / Labels

UI labels in this applet are primarily defined directly in templates/components (static English strings). No applet-local translation bundle (for example `assets/i18n/en.json`) was found in the source tree.

---

## FAQ

**Q: Why can’t I create a Purchase Credit Note?**  
A: Create can be disabled by missing permissions or missing required fields/lines.

**Q: Why is FINAL / VOID / DISCARD / SAVE missing?**  
A: These can be hidden by tenant settings and/or controlled by client-side permission flags.

**Q: Why don’t I see ARAP / Contra / Doc Link / Attachment / Export / Payment / Department Hdr / KO For?**  
A: These sections are controlled by tenant hide/show flags.

**Q: Why don’t I see File Import?**  
A: The File Import menu can be hidden by settings and may also require a client-side permission to show it.
