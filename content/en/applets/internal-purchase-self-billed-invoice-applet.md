---
title: "Internal Purchase Self Billed Invoice Applet"
description: "Comprehensive internal self-billed purchase invoice management for AP teams, with knock-off linking, posting controls, and file import support."
tags:
- finance
- purchase-workflow
- self-billed-invoice
- accounts-payable
- knock-off
- e-invoice
weight: 161
---

{{< callout type="warning" >}}
**Work in progress**: This applet documentation needs detailed expansion. This is a placeholder with basic structure and key information.
{{< /callout >}}

## Purpose and Overview

The **Internal Purchase Self Billed Invoice Applet** streamlines end-to-end self-billed invoice processing, from draft capture and source-document knock-off to posting, payment tracking, and compliance follow-up.

{{< callout type="info" >}}
**Core Concept**: The applet connects **document header control** (who and when), **line-level source matching** (what is billed), and **posting/settlement status** (how finance closes the transaction).
{{< /callout >}}

## Key Features Overview

### Who Benefits from This Applet?

**AP Clerks and Invoice Processors:**
- Create and finalize self-billed invoices in a guided tab flow
- Pull or reconcile lines from upstream documents using KO options
- Monitor status from draft to final without switching modules

**Finance Reviewers and Controllers:**
- Validate posting status, ARAP figures, and document totals
- Enforce FINAL, DISCARD, and VOID rules with audit traceability
- Review linked documents and posting checkpoints before close

**Procurement and Operations Teams:**
- Verify supplier, branch, and item-level details before posting
- Preserve quantity and source-document traceability at line level
- Reduce mismatch risk between procurement and finance records

**System Admins and Applet Owners:**
- Configure default branch/location/company and tab order
- Control feature visibility, field behavior, and printable setup
- Manage permissions and role-based access in one settings area

### What Problems Does This Solve?

**The Manual Processing Problem:**

Without a dedicated workflow, teams usually rely on spreadsheets, email threads, and repeated key-in. That creates:
- Inconsistent supplier and invoice data
- Weak line-to-source traceability
- Posting delays caused by missing validations
- Hard-to-track settlement and outstanding balances
- Limited visibility of import and submission progress

**The Applet Solution:**

- **Structured invoice lifecycle** - Create, Save, Final, Discard, and Void with clear controls
- **KO-driven data integrity** - Link lines to GRN, PO, PR, and Supplier DO sources
- **Operational visibility** - Track posting status, ARAP figures, and document references
- **Import acceleration** - Use file import templates and monitor processing results
- **Configurable governance** - Apply settings, permission, and personalization controls

## Key Features Overview

{{< cards >}}
  {{< card title="Invoice Lifecycle" subtitle="Create, save, final, discard, and void with controls" link="#invoice-lifecycle-management" >}}

  {{< card title="KO and Source Linking" subtitle="Reconcile with GRN, PO, PR, and Supplier DO" link="#knock-off-ko-linking" >}}

  {{< card title="Line Item Control" subtitle="Serial checks, costing, pricing, and issue links" link="#line-item-control" >}}

  {{< card title="File Import" subtitle="Upload, process, and review import outcomes" link="#file-import-workbench" >}}

  {{< card title="E-Invoice Workflow" subtitle="Submission, progress, communication, cancellation" link="#e-invoice-workflow" >}}

  {{< card title="Configuration and Permissions" subtitle="Defaults, field visibility, and access rules" link="#configuration--settings" >}}

  {{< card title="Audit and Traceability" subtitle="Posting checks, references, and linked docs" link="#audit--traceability" >}}

  {{< card title="Personalization" subtitle="User-level default branch/location preferences" link="#personalization" >}}
{{< /cards >}}

{{< figure src="/images/internal-purchase-self-billing-invoice-applet/internal-purchase-self-billed-invoice-overview.png" alt="Internal Purchase Self Billed Invoice infographic showing process challenges, applet solutions, and user roles." caption="Internal Purchase Self Billed Invoice Overview: Challenges solved, key capabilities, and the teams that benefit." >}}

## Key Concepts

### Understanding the Self-Billed Invoice Framework

| Aspect | Component | Practical Example |
|--------|-----------|------------------|
| **Who** is transacting? | Supplier + Purchaser + Branch | AP selects supplier, purchaser, and branch before line capture |
| **What** is billed? | Invoice lines + KO sources | Lines are added directly or linked from GRN/PO/PR/Supplier DO |
| **How** is it completed? | Posting + Payment + E-Invoice | Save draft, validate, Final, then monitor posting/submission progress |

{{< callout type="tip" >}}
**Real-World Example**: AP creates a self-billed invoice, links item lines from approved procurement documents, validates supplier and currency details, finalizes, then tracks posting and E-Invoice progress in the same document.
{{< /callout >}}

### Lifecycle Status Model

| State | Meaning | What You Can Do |
|------|---------|-----------------|
| **DRAFT** | Working version | Add/edit details, lines, payment, and attachments |
| **FINAL** | Posted for accounting workflow | Review posting and E-Invoice progress, controlled follow-up |
| **VOID** | Finalized document reversed | Retained for compliance and audit history |
| **DISCARDED** | Draft canceled | Preserved as inactive record |

---

## Quick Start Guide

Get up and running with these role-specific flows.

### For AP Clerks: Create and Finalize Your First Invoice

**Goal:** Create a valid self-billed invoice and move it to FINAL.

1. Open **Internal Purchase Self Billed Invoice** from the sidebar.
2. Click **Create** from listing.
3. In **Main Details**, set transaction date, branch/location, purchaser, and currency.
4. In **Account**, select supplier and confirm billing and shipping information.
5. In **Line Items**, add lines manually or via KO source lists.
6. Review **Delivery Details**, **ARAP**, and **Payment** if required.
7. Click **Save** first, then click **Final** after validation.
8. Re-open the document and confirm **Posting Status** and **Status** are correct.

### For Finance Reviewers: Validate Posting and Amount Integrity

**Goal:** Confirm the document is accounting-ready.

1. Open a target invoice from listing filters.
2. Check **Posting Status**, **Status**, and key references.
3. Review line-level values, quantities, and tax-impacting fields.
4. Validate ARAP figures and payment totals.
5. Open **Posting**, **TraceDocument**, and **Doc Link** tabs for control checks.
6. If correction is needed, use **Discard** for drafts or **Void** for eligible finals.

### For System Admins: Configure a Safe Baseline

**Goal:** Prepare a controlled production setup.

1. Go to **Settings > Default Selection** and set default branch/location/company.
2. Configure **Settings > Application Settings** for field visibility and feature behavior.
3. Set print behavior in **Settings > Printable Format Settings**.
4. Configure KO toggles in **Settings > Knock Off Settings** if enabled in your tenant menu.
5. Review **Feature Visibility**, **Webhook**, and permission listings.
6. Set user-level overrides in **Personalization > Default Selection**.

{{< callout type="tip" >}}
**Rollout Tip**: Run a pilot cycle using Create -> Save -> Final -> Posting review before enabling all departments.
{{< /callout >}}

---

## Invoice Lifecycle Management

### Listing and Search Controls

The listing supports day-to-day AP operations with:
- Status and posting status visibility per document
- Multi-column filtering for references, supplier, branch, and amounts
- Bulk operations such as Final, Discard, Void, and printing (permission dependent)
- ARAP-related columns for settlement and balance visibility

{{< figure src="/images/internal-purchase-self-billing-invoice-applet/internal-purchase-self-billed-invoice-listing.png" alt="Internal Purchase Self Billed Invoice listing with filters, statuses, and bulk actions." caption="Main Listing Page: Search, monitor, and process invoice records at scale." >}}

### Create and Edit Workspace

The edit workspace is tab-driven and includes:
- Main Details
- E-Invoice
- Account
- Line Items
- Delivery Details
- ARAP
- Payment
- Department Hdr
- Posting
- TraceDocument
- Contra
- Doc Link
- Attachment
- Export

{{< figure src="/images/internal-purchase-self-billing-invoice-applet/internal-purchase-self-billed-invoice-create-edit-form.png" alt="Create/Edit invoice workspace with tabbed sections for details, lines, payment, posting, and links." caption="Create/Edit Form: Complete invoice details with structured tabs and control points." >}}

### Action Rules

- **Save** requires valid core details and line conditions.
- **Final** is constrained by status and validation logic.
- **Discard** applies to eligible draft records.
- **Void** applies to eligible finalized records with control checks.

## Knock-Off (KO) Linking

KO supports controlled line sourcing from:
- Purchase GRN
- Purchase Order
- Purchase Requisition
- Supplier Delivery Order

This reduces manual keying and improves source-document traceability.

## Line Item Control

Line workflows provide:
- Item search and detailed line editing
- Serial scan/import and serial validation behaviors
- Batch and bin handling
- Costing and pricing detail sections
- Issue-link support (details, planning, comments, activity, worklog)

## File Import Workbench

Use file import for bulk document loading:
1. Open **File Import**.
2. Choose delimiter (**COMMA** or **PIPE**).
3. Download the sample template.
4. Upload file and submit.
5. Review process status and error message columns.

{{< figure src="/images/internal-purchase-self-billing-invoice-applet/internal-purchase-self-billed-invoice-create-edit-form.png" alt="File Import screen with delimiter options, template download, upload controls, and process status listing." caption="File Import: Bulk upload with delimiter selection and status/error monitoring." >}}

## E-Invoice Workflow

The E-Invoice tab supports:
- Submission setup
- Queue/progress stages
- Communication history
- Cancellation handling

Typical progress stages include pending queue states and submitted state tracking.

---

## Configuration & Settings

{{< figure src="/images/internal-purchase-self-billed-invoice-applet/internal-purchase-self-billed-invoice-settings.png" alt="Settings page with default selection, application settings, and printable format controls." caption="Settings Page: Configure defaults, visibility behavior, KO options, and governance controls." >}}

### Application Settings (`Settings > Application Settings`)

Use this for field-level and behavior-level controls such as visibility toggles, action controls, and tab display settings.

### Default Selection (`Settings > Default Selection`)

Set system defaults for:
- Branch
- Location
- Company
- Detail tab ordering

### Printable Format Settings (`Settings > Printable Format Settings`)

Manage print templates and default printable behavior for document output.

### Knock Off Settings (`Settings > Knock Off Settings`)

Configure KO by/for source-document behavior for GRN, PO, PR, and Supplier DO flows.

### Feature Visibility, Webhook, and Permissions (`Settings`)

Govern applet access with:
- Feature Visibility
- Webhook configuration
- Client-side permission listing
- Permission wizard, set, user, team, and role pages
- Role pricing scheme link listing

---

## Audit & Traceability

The applet supports audit readiness through:
- Listing-level status and posting checkpoints
- Posting tab visibility and document references
- TraceDocument and Doc Link relationship views
- Retained lifecycle history for Final, Void, and Discard flows

## Personalization

### Default Preferences

Users can set personal defaults under **Personalization > Default Selection** for faster day-to-day processing.

---

## FAQ

**Q: Why is the Create button missing in listing?**  
A: Create visibility is permission-driven. Check role permissions and feature visibility settings first.

**Q: Why can I save but cannot click Final?**  
A: Final depends on status and validation rules, including line-level checks and serial-related validation constraints.

**Q: Why is Void not available for my finalized document?**  
A: Void availability is governed by status eligibility, policy restrictions, and linked document conditions.

**Q: Where do I troubleshoot failed file imports?**  
A: Open **File Import** listing and review the **Process Status** and **Error Message** columns for each uploaded file.

**Q: Can I change tab order for the edit screen?**  
A: Yes. Configure tab order in **Settings > Default Selection**, then save to apply the new sequence.

**Q: Where are localization labels maintained for this applet?**  
A: Most UI labels are defined in applet code (`menu-items.ts`, search model label objects, and component panel arrays). The repo only includes a shared i18n template, not dedicated per-language applet packs.
