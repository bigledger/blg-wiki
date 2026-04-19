---
title: "Purchase Refund Note (Internal) Applet"
description: "Manage incoming intercompany refund documents, return overcharges, and keep AP and inter-branch balances synchronized."
tags:
- purchase-management
- intercompany
- refund-note
- accounts-payable
- internal-procurement
weight: 110
---

## Purpose and Overview

The **Purchase Refund Note (Internal) Applet** is used by a receiving branch to manage intercompany purchase-side refunds. It records situations where your branch should pay less (or recover value) due to returns, overcharges, pricing corrections, or cancellation adjustments from an internal supplier branch.

{{< callout type="info" >}}
**Core Concept**: This applet represents an **Incoming Credit Adjustment** for procurement. When finalized, it reduces your branch's payable exposure and keeps intercompany records aligned with the supplier branch's side of the transaction.
{{< /callout >}}

### When is this applet used?

This applet is commonly used in these scenarios:

- **Overcharge corrections**: Supplier branch billed too high and sends a reduction.
- **Purchase return settlements**: Goods were returned and must reduce the original payable.
- **Post-invoice pricing revision**: A discount or rebate is granted after posting.
- **Service cancellation adjustments**: Internal service fees are partially reversed.
- **Intercompany reconciliation cleanup**: Month-end balancing adjustments between branches.

### Why this matters for accounting

- **Accounts Payable accuracy**: Refund notes reduce liabilities that should no longer be owed.
- **Intercompany balancing**: Supplier and receiver branches stay synchronized for consolidation.
- **Audit traceability**: Each adjustment has a clear document trail and status lifecycle.
- **Controlled posting**: Final/void workflow ensures valid and reversible accounting events.

## Key Features Overview

### Who benefits from this applet?

**Procurement & Operations Teams:**
- Review internal refund notes and supporting document links
- Validate line-item level return/price adjustments
- Track document status from draft to final/void

**Finance & Accounting Teams:**
- Keep payable records accurate through controlled posting statuses
- Monitor settlement and payment-related adjustments
- Maintain complete auditability with attachments and trace links

**Branch Managers & Controllers:**
- Approve or oversee high-impact refund adjustments
- Enforce branch-level controls through settings and permissions
- Ensure intercompany reconciliation discipline

### What problems does this solve?

**Manual intercompany refund handling often causes:**
- Missing reduction entries after supplier-side adjustments
- Mismatch between branch payable and supplier receivable records
- Weak approval controls for sensitive reversals
- Delays in month-end intercompany reconciliation

**The applet solves this with:**
- **Centralized refund note management** in one listing
- **Structured document lifecycle** (`DRAFT` -> `FINAL` -> `VOID`)
- **Guided document tabs** for account, lines, settlement, ARAP, and traceability
- **Import support** for operational bulk upload (`Import PRN`)
- **Branch and applet settings** for behavior, visibility, and defaults

## Key Features Overview

{{< cards >}}
  {{< card title="Purchase Refund Note Listing" subtitle="Create, open, search, and manage refund notes" link="#sidebar-menu-reference" >}}

  {{< card title="Status Lifecycle" subtitle="Draft, final, and void controls with posting protection" link="#document-lifecycle" >}}

  {{< card title="Document Tabs" subtitle="Main details, account, lines, settlement, ARAP, and more" link="#document-tabs-overview" >}}

  {{< card title="Import PRN" subtitle="Bulk-upload refund note data for operations" link="#file-import-prn" >}}

  {{< card title="Branch Settings" subtitle="Control branch behavior and defaults" link="#settings-and-personalization" >}}

  {{< card title="Printable Format" subtitle="Configure output templates for print/export" link="#settings-and-personalization" >}}
{{< /cards >}}

{{< figure src="/images/internal-purchase-refund-note-applet/Main_Listing_Main_Tab.png" alt="Purchase Refund Note main listing page showing transaction records and summary columns" caption="Purchase Refund Note Listing: Central workspace to view, search, and manage refund note documents." >}}

## Key Concepts

### Intercompany refund relationship

At business level, this applet captures the receiving branch side of an intercompany reduction:

```
Supplier Branch Adjustment                  Receiving Branch (This Applet)
--------------------------                  ------------------------------
Issues internal refund/credit              Records Purchase Refund Note
to reduce charge                           to reduce payable/offset amount
          |                                           |
          v                                           v
Supplier side reflects reduction            AP and related balances are reduced
```

### Document lifecycle

| Status | Meaning | Outcome |
|--------|---------|---------|
| **DRAFT** | Document is editable and not yet posted | Users can update details, lines, account, and links |
| **FINAL** | Document is finalized and posted | Financial impact is committed |
| **VOID** | Finalized document is reversed | Reversal logic is applied for correction control |

{{< callout type="warning" >}}
A document must be finalized before it can be voided. Use void only when a posted refund note was finalized in error.
{{< /callout >}}

### Document tabs overview

The edit workflow contains operational tabs/panels for full control:

- **Main Details**: Header-level document information
- **E-invoice**: E-invoice related references and controls
- **Account**: Entity, billing/shipping addresses, contact linkage
- **Revenue / Expenses**: Financial grouping views (based on settings visibility)
- **Settlement**: Settlement method and allocation behavior
- **ARAP**: Receivable/payable style balancing links
- **Department Hdr**: Departmental posting metadata
- **Trace Document**: Cross-reference to related source documents
- **Contra**: Contra-link controls for document offsetting
- **Doc Link**: Additional related document relationships
- **Export**: Output and export actions
- **Attachments**: Evidence and supporting files

{{< figure src="/images/internal-purchase-refund-note-applet/e-invoice.png" alt="E-invoice tab in Purchase Refund Note edit view showing e-invoice related fields and status" caption="E-invoice Tab: Manage e-invoice references and submission-related details for refund notes." >}}

{{< figure src="/images/internal-purchase-refund-note-applet/Account_tab.png" alt="Account tab showing supplier, billing, shipping, and contact details for purchase refund note" caption="Account Tab: Verify supplier entity, billing and shipping addresses, and contact assignments." >}}

{{< figure src="/images/internal-purchase-refund-note-applet/revenue_tab.png" alt="Revenue tab displaying revenue-related lines and allocations in purchase refund note" caption="Revenue Tab: Review and maintain revenue-side allocations where enabled by settings." >}}

{{< figure src="/images/internal-purchase-refund-note-applet/expenses.png" alt="Expenses tab showing expense lines and financial distribution for purchase refund note" caption="Expenses Tab: Manage expense-side adjustments and ensure posting values are correct." >}}

{{< figure src="/images/internal-purchase-refund-note-applet/settlement.png" alt="Settlement tab showing settlement methods and payment allocation details" caption="Settlement Tab: Configure settlement method and review allocation details before finalization." >}}

{{< figure src="/images/internal-purchase-refund-note-applet/arap.png" alt="ARAP tab showing receivable and payable linkage details in purchase refund note" caption="ARAP Tab: Validate receivable/payable linkage and balancing behavior for the document." >}}

## Sidebar Menu Reference

| Menu Item | Description |
| :--- | :--- |
| **Purchase Refund Note** | Main transaction listing for creating and managing refund notes. |
| **Import PRN** | Upload files to import purchase refund note data in bulk. |
| **Settings** | Applet-wide configuration for behavior, defaults, branch setup, and printable formats. |
| **Personalization** | User-specific default selection and UI preferences. |

---

## Quick Start Guide

{{< figure src="/images/internal-purchase-refund-note-applet/supplier_selecting.png" alt="Supplier selection screen for choosing entity during purchase refund note creation" caption="Supplier Selection: Choose the correct internal supplier entity during document setup." >}}

### For Procurement/Operations: Process a refund note

**Goal:** Create or review a purchase refund note and finalize it correctly.

1. Open **Purchase Refund Note** from the sidebar.
2. Create a new entry or open an existing draft.
3. Complete **Main Details** and **Account** information.
4. Add and verify **Line Items** (including item details and amounts).
5. Review **Settlement**, **ARAP**, and **Trace Document** links where applicable.
6. Attach supporting files in **Attachments**.
7. Save, then click **FINAL** when validated.

{{< figure src="/images/internal-purchase-refund-note-applet/select_revenue.png" alt="Revenue selection screen used when adding or selecting revenue information in purchase refund note" caption="Revenue Selection: Add or pick revenue details to complete document financial context." >}}

### For Finance: Validate posting and control reversals

**Goal:** Ensure payable adjustments are accurate and controlled.

1. Check document status and header details.
2. Verify line-level values and account mapping.
3. Confirm document is ready for posting, then finalize.
4. If a posted document is wrong, perform **VOID** (only after `FINAL`).
5. Keep records complete with trace links and attachments for audit.

### For Admins: Configure the applet

**Goal:** Prepare settings so teams can use the applet consistently.

1. Go to **Settings > Application Settings** to manage field visibility/rules.
2. Configure **Settings > Default Selection** for applet defaults.
3. Set up **Settings > Branch Settings** for branch-specific behavior.
4. Maintain templates in **Settings > Printable Format Settings**.
5. Review permissions and feature visibility under settings modules.

---

## Settings and Personalization

### System Configuration

The applet exposes these core configuration areas:

- **Application Settings** (`field-settings`)
- **Default Selection** (`default-selection`)
- **Branch Settings** (`branch-settings`)
- **Printable Format Settings** (`printable-format-settings`)

These controls determine what users see, what is required, and how documents behave for each branch context.

{{< figure src="/images/internal-purchase-refund-note-applet/Settings.png" alt="Settings page showing application settings, default selection, branch settings, and printable format settings" caption="Settings Overview: Configure applet behavior, defaults, branch-specific rules, and print templates." >}}

### Personalization

Users can configure **Personal Default Selection** to speed up repetitive entry patterns and keep their preferred defaults.

{{< figure src="/images/internal-purchase-refund-note-applet/personalization.png" alt="Personalization page showing personal default selection options for user-level preferences" caption="Personalization: Save user-level defaults to speed up repetitive Purchase Refund Note workflows." >}}

## File Import (PRN)

Use **Import PRN** to upload refund note data for batch processing. This is useful for operational migrations, reconciliation batches, or high-volume correction cycles.

Recommended practice:
- Validate source file content and mapping before upload
- Use import for bulk operational loads, then review each resulting document in listing
- Finalize only after line and account verification

## Audit and Control Notes

- Maintain attachments and trace links for every material adjustment.
- Keep finalize/void actions restricted via permissions.
- Use branch settings consistently across entities to reduce process drift.
- Periodically review posting status trends for unresolved drafts.
