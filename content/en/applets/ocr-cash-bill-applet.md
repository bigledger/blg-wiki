---
title: "OCR Cash Bill Applet"
description: "Comprehensive OCR-driven cash bill processing applet for receipt capture, verification workflows, and reporting exports"
tags:
- ocr
- cash-bill
- receipt-processing
- document-verification
- finance-operations
weight: 170
---

{{< callout type="warning" >}}
**Work in progress**: This is just a draft. More detail explanation and screenshot for ocr cashbill applet userguide is needed.
{{< /callout >}}

## Purpose and Overview

The **OCR Cash Bill Applet** helps teams digitize and process cash bill receipts end-to-end. Instead of manually keying every receipt, users can upload scanned receipts, review OCR-extracted details, map line items to financial items, and control processing through clear status workflows.

{{< callout type="info" >}}
**Core Concept**: The applet turns receipt images into structured transaction documents, then guides users through **verification**, **process review**, and **final posting control**.
{{< /callout >}}

## Key Features Overview

### Who Benefits from This Applet?

**Operations / Back Office Teams:**
- Upload and track scanned receipt batches quickly
- Reduce manual data entry from paper receipts
- Review OCR output directly against the source image

**Finance Reviewers:**
- Validate extracted document details before finalization
- Apply process statuses (Pending Review, Duplicate, Rejected)
- Record standardized rejection reasons for auditability

**Master Data Admins:**
- Maintain OCR Company and OCR Item master data
- Map OCR line items to valid financial items
- Improve recognition quality with cleaner reference data

**Audit & Compliance Teams:**
- Monitor confidence and verification statuses
- Track who updated documents and when
- Export processing reports for evidence and reconciliation

### What Problems Does This Solve?

**The Manual Receipt Processing Problem:**

Without OCR workflow tooling, receipt handling is often slow and inconsistent:
- Data entry bottlenecks from image/PDF receipts
- Inconsistent item naming and retailer mapping
- Limited visibility into verification and rejection decisions
- Difficult tracking of what is pending vs finalized
- No simple way to generate exportable processing logs

**The OCR Cash Bill Applet Solution:**

- **Receipt digitization** - Upload receipts and capture OCR output in one flow
- **Structured review workflow** - Manage process and verification statuses systematically
- **Master data mapping** - Standardize OCR company and item references
- **Line-level control** - Map to financial items and adjust quantity/unit price where allowed
- **Finalization control** - Lock finalized records to preserve posting integrity
- **Exportable reporting** - Generate and download OCR scanned document reports

## Key Features Overview

{{< cards >}}
  {{< card title="Scanned Receipt" subtitle="Upload receipts and review OCR output with status control" link="#scanned-receipt" >}}

  {{< card title="OCR Generic Doc" subtitle="Review extracted header details, process status, and rejection reason" link="#ocr-generic-doc" >}}

  {{< card title="Line Item Mapping" subtitle="Map OCR lines to financial items with qty and unit price updates" link="#ocr-generic-doc-line-item" >}}

  {{< card title="OCR Company Master" subtitle="Maintain retailer/company reference data for matching" link="#ocr-company" >}}

  {{< card title="OCR Item Master" subtitle="Maintain OCR item catalog linked to OCR companies" link="#ocr-item" >}}

  {{< card title="OCR Scanned Doc Report" subtitle="Generate CSV files and download export history" link="#ocr-scanned-doc-report" >}}

  {{< card title="Settings & Defaults" subtitle="Configure field behavior and branch/location defaults" link="#configuration--settings" >}}
{{< /cards >}}

## Key Concepts

### OCR Workflow Pipeline

The applet follows a practical processing sequence:

```
Receipt Image Upload
        ->
Scanned Receipt Record
        ->
OCR Generic Doc (Header)
        ->
OCR Generic Doc Line Items
        ->
Financial Item Mapping + Review
        ->
Process Decision (Pending / Duplicate / Rejected / Approved)
        ->
Final Posting Status (FINAL locks editing)
        ->
CSV Export & Audit Reporting
```

### Status Model You Should Know

| Status Type | Purpose | Values Seen in Applet |
|--------|---------|------------------|
| **Verification Status** | OCR verification result | PASS, FAIL, FLAGGED |
| **Process Status** | Operational review stage | PENDING_REVIEW, DUPLICATE, REJECTED, APPROVED |
| **Posting Status** | Posting lock control | FINAL (record becomes non-editable) |

{{< callout type="tip" >}}
**Practical Tip**: Treat `Process Status` as operational workflow, and `Posting Status` as accounting control. Once posting is `FINAL`, edits are restricted.
{{< /callout >}}

---

## Quick Start Guide

### For Operations Users: Upload Your First Receipt

**Goal:** Create a scanned receipt record and trigger OCR processing.

1. Go to **Scanned Receipt** from the sidebar
2. Click **Add** and open **Scanned Receipt Create**
3. Set **Status** and **Execution Strategy** (`RUN_NOW` or `INSERT_TO_QUEUE`)
4. Upload the receipt image in **Receipts Upload**
5. Click **CREATE**

**Outcome:** The receipt appears in Scanned Receipt Listing with a process status and can be reviewed in detail.

---

### For Finance Reviewers: Review and Process an OCR Generic Document

**Goal:** Validate OCR output and move document through review workflow.

1. Open **OCR Generic Doc** and select a document
2. In **Main Details**, review:
   - Doc No, Amount, Receipt Date
   - Company, Confidence Level, Verification Status
   - Current Process Status and Reason to Reject (if applicable)
3. Update **Process Status** as needed (e.g., `PENDING_REVIEW`, `DUPLICATE`, `REJECTED`)
4. If rejected, choose a **Reason to Reject**
5. Review **Line Items** tab and adjust mapped lines where needed
6. Click **UPDATE**, then click **FINAL** when ready for posting lock

**Outcome:** Document is reviewed, traceable, and protected after finalization.

---

### For Master Data Admins: Set Up OCR Company and OCR Item Mapping

**Goal:** Maintain high-quality reference data for better matching.

1. Go to **OCR Company** and create/update company records:
   - Company Code, Company Name, Country
   - Address, Postal Code, City, State, Contact No., Status
2. Go to **OCR Item** and create/update item records:
   - Item Code, Item Name, Description, Company, Status
3. During line-item review, use **Select Financial Item** to map OCR lines to valid financial items
4. Save updates and verify mappings in subsequent OCR Generic Doc reviews

**Outcome:** Better standardization and cleaner downstream posting data.

---

### For Reporting Users: Generate and Download OCR Processing CSV

**Goal:** Export OCR processing logs for follow-up and audit.

1. Open **OCR Scanned Doc Report**
2. Set any date filters:
   - Created Date From/To
   - Updated Date From/To
3. Click **Generate CSV**
4. Wait for background processing (status updates in listing)
5. Download file from **Actions** once complete

**Outcome:** Shareable report file with processing status history.

---

## Core Modules

### Scanned Receipt

Use this module to ingest receipt images and manage early-stage OCR processing.

**Key capabilities:**
- Upload receipt images during creation
- Choose execution strategy (`RUN_NOW` or `INSERT_TO_QUEUE`)
- Track receipt-level process status
- View raw OCR output JSON in edit mode
- Preview uploaded image while reviewing

**Listing highlights:**
- Scanned Doc No.
- Process Status
- Creation Date / Modified Date
- Created By

---

### OCR Generic Doc

This is the main review workspace for OCR-converted document headers.

**Main Details tab includes:**
- Doc No, Amount, Receipt Date, Created Date
- OCR retailer/company reference
- Verification Status and Confidence Level
- Process Status and Reason to Reject
- Updated By and active/inactive status control

**Line Items tab includes:**
- Line-level review and edit flow
- Jump to line item edit for mapping and amount refinement

**Important behavior:**
- `FINAL` posting status locks editing behavior
- Rejection reason is shown when process status is `REJECTED`
- Standardized rejection reasons include cases like duplicate receipt, incomplete details, and exceeded monthly submission limit

---

### OCR Generic Doc Line Item

This module controls line-level refinement and mapping.

**What you can edit:**
- Financial Item mapping
- Item Name
- Quantity
- Unit Price
- Remarks
- Line status

**What is read-only:**
- OCR Generic Doc No
- Item Code (OCR extracted)
- Description
- Company
- Updated By

**Additional behavior:**
- Reset financial item mapping when needed
- If posting status is `FINAL`, update action is disabled

---

### OCR Company

Maintain OCR retailer/company master records used in document review.

**Company fields supported:**
- Company Code, Company Name, Description
- Country
- Status
- Address, Postal Code, City, State, Contact No.

**Listing supports:**
- Search by code, name, and country
- Quick visibility into status and contact details

---

### OCR Item

Maintain OCR item master records and tie them to OCR companies.

**Item fields supported:**
- Item Code, Item Name
- Description, Remarks
- Linked OCR Company
- Status

**Listing supports:**
- Search by item code/name and company
- View standardized item metadata for mapping consistency

---

### OCR Scanned Doc Report

Use this module to generate and download CSV report files.

**Report workflow:**
1. Set date filters (created/updated ranges)
2. Trigger **Generate CSV**
3. Monitor report queue status
4. Download completed files from Actions

**Listing columns:**
- Report Name
- Status
- Error Message
- Created Date / Updated Date
- Actions (download/delete)

---

## Configuration & Settings

### Field Settings (`Settings > Field Settings`)

Control OCR Generic Doc listing behavior with toggles:
- `HIDE_CUSTOMER_ADVANCED_SEARCH`
- `ENABLE_MEMBER_ADVANCED_SEARCH`

Use this when you want to simplify or expand search options for end users.

---

### Default Selection (`Settings > Default Selection`)

Configure applet-wide defaults:
- `DEFAULT_BRANCH`
- `DEFAULT_LOCATION`
- `DEFAULT_COMPANY` (derived from branch selection)
- `DEFAULT_TIMEZONE`

This helps reduce repetitive input and keeps list/report contexts consistent.

---

### Personal Defaults (`Personalization > Default Selection`)

Each user can set personal overrides for:
- Default Branch
- Default Location

These values override applet defaults for that specific user session.

---

### Additional Admin Controls

The applet routing includes standard platform admin areas for:
- Webhook settings
- Permission set/user/team/role permissions
- Client-side permission listing
- Sidebar personalization

Use these when rolling out the applet to different teams with different access scopes.

---

## FAQ

### 1. Why is the **CREATE** button disabled in Scanned Receipt Create?

The button stays disabled until at least one receipt image is uploaded.

---

### 2. What is the difference between `Verification Status` and `Process Status`?

`Verification Status` reflects OCR validation outcome (`PASS`, `FAIL`, `FLAGGED`). `Process Status` reflects operational decision flow (`PENDING_REVIEW`, `DUPLICATE`, `REJECTED`, `APPROVED`).

---

### 3. Why can I no longer edit some OCR Generic Docs or line items?

When posting status is `FINAL`, editing is restricted to protect finalized posting data.

---

### 4. How do I map an OCR line to the right financial item?

Open the line item edit screen, click **Financial Item**, select from the financial item listing, then update and save.

---

### 5. Where do I set default branch and location for all users?

Use `Settings > Default Selection` for applet-wide defaults. Users can still override via `Personalization > Default Selection`.

---

### 6. I generated a report but cannot download it yet. What should I check?

Open **OCR Scanned Doc Report** and check the report row status and error message. Download becomes available after generation completes successfully.
