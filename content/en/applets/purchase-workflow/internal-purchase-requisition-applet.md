---
title: "Internal Purchase Requisition Applet"
description: "Create and manage internal purchase requisitions (PR) with posting controls, line item tracking, KO (Jobsheet), printing, approvals (request/history), and line item queue approvals."
weight: 10
tags:
- purchase-workflow
- purchase-requisition
- internal-purchase
- approvals
- line-items
- line-items-queue
- knock-off
---

## Purpose and Overview

The **Internal Purchase Requisition Applet** supports preparing and managing internal **Purchase Requisitions (PR)**, from draft creation through approval and posting.

It is designed to:
- Create PR documents with structured header, account, and line details
- Control document lifecycle via posting controls (Draft/Final/Void/Discard), depending on tenant settings
- Provide operational tools such as attachments, doc links, contra, export, and trace/posting views
- Support **KO (Knock-Off)** from **Jobsheet** (current implementation)
- Provide additional work queues: **Line Items**, **Line Items Queue**, and approvals (**Approval Request / Approval History**)

{{< callout type="info" >}}
This applet uses standard BigLedger document controls. Some buttons/tabs are condition-based (status/posting status) and may be hidden by tenant settings and permissions.
{{< /callout >}}

---

## Key Features Overview

### Who Benefits from This Applet?

**Purchasers / Procurement team**
- Create purchase requisitions and maintain supplier/account details
- Add line items and track requested quantities
- Submit for approval and follow status

**Approvers / Managers**
- Review and action pending approvals in **Approval Request**
- Audit past decisions in **Approval History**

**Controllers / Operations**
- Use **Line Items Queue** to approve line-level queues (when enabled)
- Print requisitions for operational processing

---

## Feature Navigation

The main left menu entries in the applet are:

{{< cards >}}
	{{< card title="Internal Purchase Requisition" subtitle="PR listing + create/edit workflow" link="#internal-purchase-requisition" >}}
	{{< card title="Line Items" subtitle="Cross-document PR line analysis" link="#line-items" >}}
	{{< card title="Line Items Queue" subtitle="Queue listing with line-level APPROVE action" link="#line-items-queue" >}}
	{{< card title="Approval Request" subtitle="Approve/Reject pending approval requests" link="#approval-request" >}}
	{{< card title="Approval History" subtitle="Review previous approval actions" link="#approval-history" >}}
	{{< card title="Settings" subtitle="Defaults, fields, printable format, workflow + approval settings" link="#settings" >}}
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

In panel layout, expansion defaults can be controlled by settings (for example which panels expand by default).

### 3. Permissions and feature visibility

Create/update actions can be restricted by permissions. Many listing columns and buttons are also controlled by settings + client-side permissions.

---

## Quick Start Guide

### Create a Purchase Requisition

1. Open **Internal Purchase Requisition**.
2. Click **Create** ("+").
3. Fill **Main Details**.
4. Fill **Account** (Entity Details, Bill To, Ship To).
5. Add **Line Items**.
6. (Optional) Fill **Delivery Details**, **Payment**, **Department Hdr** (these tabs can be hidden by settings).
7. (Optional) Use **KO For** to knock-off/import from **Jobsheet**.
8. Click **CREATE**.

### Finalize and Print

From the listing, select one or more documents and use:
- **FINAL** (when enabled)
- **SINGLE/MULTIPLE PRINT** (when enabled)

---

## Internal Purchase Requisition

### Listing

The listing provides:
- **Create** ("+") (requires create permission)
- **FINAL** and **VOID** (when enabled)
- **SINGLE/MULTIPLE PRINT** (when enabled)
- Advanced search and column toggles

The grid commonly includes document numbers (tenant/company/branch), posting status, status, print status, transaction date, quantities/amounts, and reference fields (exact columns depend on settings/permissions).

### Create screen tabs

Create uses a tabbed layout with these common sections:
- **Main Details**
- **Account**
- **Line Items**
- **Delivery Details** (optional)
- **Payment** (optional)
- **Department Hdr** (optional)
- **KO For** (optional)

### Edit screen tabs/panels

Edit extends create with additional operational sections depending on settings:
- **ARAP**
- **Trace Document / Posting**
- **Contra**
- **Doc Link**
- **Attachments**
- **Export**
- **Generic Doc Approval**

There is also an in-screen **DISCARD** action when enabled and applicable.

---

## KO For (Knock-Off)

The **KO For** section supports KO/import for upstream documents.

Current UI implementation:
- **Jobsheet** KO is available
- Other KO sources (Purchase GRN / Purchase Order / Purchase Quotation) are present in the codebase but currently disabled in the UI

---

## Line Items

The **Line Items** menu is a cross-document PR line analysis page (separate from the per-document **Line Items** tab). It is used for item-level review and reporting across documents.

---

## Line Items Queue

The **Line Items Queue** menu provides a queue-style listing (server-side grid) and can expose a bulk **APPROVE** action when the feature is enabled and not disabled by settings.

{{< callout type="warning" >}}
If Line Items Queue features are unavailable, it may be disabled by tenant settings (for example a setting that disables line item queue listing).
{{< /callout >}}

---

## Approval Request

**Approval Request** lists pending approval tasks. It supports:
- Searching within approval requests
- Selecting an entry and **Approve** or **Reject**

---

## Approval History

**Approval History** provides an audit-style listing of past approval actions with search and drill-in.

---

## Settings

The applet exposes standard configuration areas (availability depends on tenant policy):

| Area | What it controls |
| --- | --- |
| **Application Settings** | Field configuration / field visibility rules |
| **Default Selection** | Default company/branch/location selections |
| **Printable Format Settings** | Printing layout selection and configuration |
| **Workflow Settings** | Workflow behavior and feature controls |
| **Approval Settings** | Approval rules and routing |
| **Branch Designation / Branch Settings** | Branch-scoped defaults and behavior |
| **Webhook / Feature Visibility** | Integration and feature toggles |
| **Permissions** | Permission wizard, permission sets, user/team/role permissions |
| **Release Notes / Applet Log** | Change history and operational logs |

---

## Personalization

Personalization allows user-level defaults (for example **Personal Default Selection**) without changing tenant-wide settings.

---

## i18n / Labels

Unlike some other applets, this applet’s UI labels are primarily defined directly in templates/components (static English strings). No applet-local `en.json` translation bundle was found in the source tree.

---

## FAQ

**Q: Why can’t I create a PR?**  
A: The Create button can be disabled by missing permission (create target), missing required fields, or incomplete line items.

**Q: Why is FINAL/VOID/PRINT missing?**  
A: These can be hidden by tenant settings and permissions.

**Q: Why don’t I see Delivery Details / Payment / Department / KO For?**  
A: Those tabs are controlled by tenant settings (hide/show flags).

