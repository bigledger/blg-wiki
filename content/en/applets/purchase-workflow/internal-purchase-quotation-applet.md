---
title: "Internal Purchase Quotation Applet"
description: "Create and manage internal purchase quotations (PQ), including supplier/account details, line items, delivery/payment details, contra, attachments, KO import (Purchase Requisition), and line-level analysis."
weight: 90
tags:
- purchase-workflow
- purchase-quotation
- internal-purchase
- line-items
- knock-off
---

## Purpose and Overview

The **Internal Purchase Quotation Applet** supports preparing and managing **Purchase Quotations (PQ)** in a controlled workflow.

It is designed to:
- Create purchase quotation documents with structured header, account, and line details
- Manage document lifecycle with **Draft/Final/Void/Discard** controls (availability depends on tenant settings)
- Provide operational tools such as **contra**, **attachments**, **doc links**, and **export**
- Support **KO (Knock-Off)** import from **Purchase Requisition** when enabled
- Provide a cross-document **Line Items** page for analysis

{{< callout type="info" >}}
This applet uses standard BigLedger posting controls: documents are prepared in a draft state and then **FINAL** is used to post/confirm them. Some actions (SAVE / VOID / DISCARD / KO For) can be hidden by tenant settings.
{{< /callout >}}

---

## Key Features Overview

### Who Benefits from This Applet?

**Purchasers / Procurement team**
- Create and revise purchase quotations
- Maintain supplier, billing, and shipping information
- Build line items with pricing and tax totals

**Finance / Controllers**
- Enforce posting controls (Draft vs Final)
- Use contra and document links for traceability

**Operations**
- Use attachments and exports for supporting documents

---

## Feature Navigation

The main left menu entries in the applet are:

{{< cards >}}
  {{< card title="Purchase Quotation" subtitle="Listing + create/edit workflow (Final / Void / Discard)" link="#purchase-quotation" >}}
  {{< card title="Line Items" subtitle="Cross-document line analysis (item, qty, price, tax, amount)" link="#line-items" >}}
  {{< card title="Settings" subtitle="Default selection, field settings, printable format, branch settings" link="#settings" >}}
{{< /cards >}}

---

## Key Concepts

### 1. Document status vs posting status

In this applet you may see both:

| Concept | Typical values | What it means |
| --- | --- | --- |
| **Status** | `TEMP`, `ACTIVE` | Working state of the record (e.g., newly created vs activated) |
| **Posting Status** | `DRAFT`, `FINAL` | Posting control state used for operational locking / downstream controls |

{{< callout type="warning" >}}
Action buttons such as **FINAL**, **VOID**, **SAVE**, **DISCARD**, and the **KO For** tab are condition-based (status/posting status) and may be hidden by tenant settings.
{{< /callout >}}

### 2. Minimum data to create/save

The create/edit screens enforce basic validation. For example, **CREATE/SAVE** is typically disabled when:
- Main details form is invalid
- Account (supplier/entity) selection is incomplete
- No line items exist

---

## Quick Start Guide

### Create a Purchase Quotation

1. Open **Purchase Quotation**.
2. Click **Create** ("+") in the listing.
3. Fill **Main Details** (common fields):
	- **Branch** and **Location**
	- **Purchaser**
	- **Transaction Date**
	- **Credit Terms** (may require supplier/entity selection first)
	- **Reference**, **Remarks**
	- (Optional) **Permit No**, **Tracking ID** (can be hidden by settings)
	- **Currency**
4. Fill **Account**:
	- **Entity Details** (supplier)
	- **Bill To** and **Ship To**
5. In **Lines**:
	- Add line items and quantities
	- Review **Tax** and **Total** summaries
6. (Optional) Fill **Delivery Details**, **Payment**, **Department Hdr**.
7. Click **CREATE**.

### Save, Finalize, Void, Discard

- **SAVE** updates the document (for `TEMP` documents, SAVE may convert it to active depending on tenant logic)
- **FINAL** posts the document (typically available when posting status is **DRAFT**)
- **VOID** is available from the listing when enabled
- **DISCARD** is available from the listing and also from within the edit screen when enabled

---

## Purchase Quotation

### Listing

The listing provides:
- **Create** ("+")
- **FINAL**
- **VOID** (when enabled)
- **DISCARD** (when enabled)
- Advanced search and column toggles

Common listing columns include:
- Doc short code / document number
- Posting status (shows **DRAFT** when empty)
- Branch code, supplier name, purchaser
- Transaction date, created/updated info
- Amount (may be hidden by settings)

{{< callout type="tip" >}}
The listing refresh logic typically loads a recent time window (e.g., last ~3 months by updated date), then you can widen via search/filters.
{{< /callout >}}

### Create screen tabs

Create uses a tabbed layout with these main sections:
- **Main Details**
- **Account**
- **Lines**
- **Delivery Details**
- **Payment**
- **Department Hdr**

### Edit screen tabs

Edit extends the create tabs with operational sections:
- **KO For** (only for `TEMP` status and when not hidden)
- **Contra**
- **Doc Link**
- **Attachments**
- **Export**

---

## KO For (Knock-Off)

When enabled by tenant settings and available for the current document state, the **KO For** tab supports importing/knocking-off lines from **Purchase Requisition**.

Key behaviors:
- KO availability is controlled by both applet settings (for example `HIDE_KO_FOR_TAB`) and KO flow settings
- KO may support **single** or **multiple** selection depending on a setting (for example `ENABLE_MULTIPLE_KO`)

{{< callout type="warning" >}}
Even if additional KO flows (for example Blanket Purchase Order / Purchase Quotation) are enabled at the configuration layer, the current UI implementation focuses on **Purchase Requisition** KO.
{{< /callout >}}

---

## Line Items

The **Line Items** menu is a cross-document analysis page (separate from the per-document **Lines** tab).

Typical columns include:
- Purchase quotation number
- Transaction date
- Item code, item name
- Quantity
- Unit price, tax amount, amount (can be hidden by settings/permissions)

The grid supports grouping and common Ag-Grid tools (filters, export where enabled).

---

## Settings

The applet exposes standard configuration areas (availability depends on tenant policy):

| Area | What it controls |
| --- | --- |
| **Application Settings** | Field configuration / field visibility rules |
| **Default Selection** | Default company/branch/location selections |
| **Printable Format Settings** | Printing layout selection and configuration |
| **Branch Settings** | Branch-scoped defaults and behavior |
| **Webhook / Feature Visibility** | Integration and feature toggles |
| **Permissions** | Permission wizard, permission sets, user/team/role permissions |

---

## Personalization

Personalization allows user-level defaults (for example **Personal Default Selection**) without changing tenant-wide settings.

---

## i18n / Labels

This applet uses `@ngx-translate` for UI labels (for example, button text and column headers). English strings are provided in the applet’s translation bundle (for example `src/assets/i18n/en.json`).

---

## FAQ

**Q: Why is VOID/DISCARD missing?**  
A: These actions can be hidden by tenant settings (for example `HIDE_GENDOC_VOID_BUTTON` / `HIDE_GENDOC_DISCARD_BUTTON`) and may also depend on document state.

**Q: Why can’t I SAVE/CREATE?**  
A: The applet disables SAVE/CREATE when the document is incomplete (main details invalid, supplier/account selection incomplete, or no line items).

**Q: Why don’t I see the KO For tab?**  
A: KO For is only shown for `TEMP` documents and when KO is enabled and not hidden by settings.

