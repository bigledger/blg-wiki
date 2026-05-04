---
title: "OCR Cash Bill Applet"
description: "Comprehensive OCR-driven cash bill processing system for receipt ingestion, review workflows, line-item mapping, and exportable reporting"
tags:
- ocr
- cash-bill
- receipt-processing
- finance-operations
- document-verification
weight: 170
---

{{< callout type="warning" >}}
**Warning**: this documentation is still in review
{{< /callout >}}

## Purpose and Overview

The **OCR Cash Bill Applet** helps teams digitize physical receipts and process them through a controlled finance workflow. Instead of manually keying receipt details line-by-line, users upload images, review OCR output, map line items to financial items, and finalize records for downstream processing.

{{< callout type="info" >}}
**Core Concept**: Convert receipt images into structured documents, then move them through **review**, **status control**, **line-item mapping**, and **final posting lock**.
{{< /callout >}}

## Who Benefits and What Problems It Solves

### Who Benefits from This Applet?

**Operations / Shared Service Teams:**
- Upload receipt images quickly
- Track processing progress from listing views
- Reduce repetitive manual data entry
- Review raw OCR output beside the uploaded image

**Finance Reviewers / AP Teams:**
- Validate extracted document details before posting
- Control process status consistently (`PENDING_REVIEW`, `DUPLICATE`, `REJECTED`)
- Apply standardized rejection reasons
- Finalize approved records with posting lock

**Master Data Admins:**
- Maintain OCR Company master records
- Maintain OCR Item master records
- Improve line-item mapping quality
- Standardize retailer/item references for downstream finance use

**Audit, Compliance, and Finance Leadership:**
- Monitor verification and process outcomes
- Access status-driven report exports
- Preserve auditability with finalization controls
- Improve policy enforcement and reporting transparency

### What Problems Does This Solve?

**The Manual Receipt Processing Problem:**

Traditional cash bill handling is often fragmented and error-prone:
- Receipts arrive in image/PDF formats with inconsistent quality
- Teams manually key data, causing bottlenecks and key-in errors
- Duplicate and invalid submissions are hard to detect consistently
- Review decisions are not standardized across users
- Reporting and audit evidence extraction is time-consuming

**The OCR Cash Bill Applet Solution:**

- **Receipt digitization** - Upload once and process from a structured document flow
- **Controlled statuses** - Standard process states and rejection reasons
- **Line-level mapping** - Link OCR lines to financial items for better accounting quality
- **Finalization lock** - Prevent accidental post-review edits
- **Master data governance** - Keep company and item references clean
- **Exportable reporting** - Generate CSV outputs for follow-up, reconciliation, and audits

## Key Features Overview

{{< cards >}}
  {{< card title="Scanned Receipt Intake" subtitle="Upload receipt images and trigger OCR processing" link="#scanned-receipt" >}}

  {{< card title="OCR Generic Doc Review" subtitle="Review header-level OCR output with process controls" link="#ocr-generic-doc" >}}

  {{< card title="Line Item Mapping" subtitle="Map OCR lines to financial items and refine quantities/prices" link="#ocr-generic-doc-line-item" >}}

  {{< card title="Master Data Setup" subtitle="Maintain OCR Company and OCR Item references" link="#master-data-setup-ocr-company--ocr-item" >}}

  {{< card title="Finalization Control" subtitle="Set posting status to FINAL to lock edited data" link="#finalization-control" >}}

  {{< card title="OCR Report Export" subtitle="Generate and download scanned document CSV reports" link="#ocr-scanned-doc-report" >}}

  {{< card title="Configuration & Settings" subtitle="Manage field settings, defaults, and permissions" link="#configuration--settings" >}}
{{< /cards >}}

{{< figure src="/images/ocr-cash-bill-applet/ocr-cash-bill-overview.png" alt="OCR Cash Bill Applet overview showing upload, review, mapping, and finalization flow" caption="OCR Cash Bill Applet Overview: From receipt upload to finalized posting-ready records." >}}

## Key Concepts

### Understanding the OCR Processing Framework

| Aspect | Component | Practical Example |
|--------|-----------|------------------|
| **What is uploaded?** | Scanned Receipt | A cashier receipt image from a retail purchase |
| **What is reviewed?** | OCR Generic Doc | Auto-extracted doc number, date, amount, company |
| **What is mapped?** | OCR Generic Doc Line Item | OCR item line linked to a valid financial item |
| **How is it controlled?** | Process + Posting Status | `REJECTED` with reason, then `FINAL` after review |

{{< callout type="tip" >}}
**Practical Example**: Ops uploads a receipt with `RUN_NOW`, Finance reviews OCR output in `OCR Generic Doc`, maps line items to financial items, sets process decision, and then finalizes the record.
{{< /callout >}}

### OCR Workflow Pipeline

```
Receipt Image Upload
  -> Scanned Receipt Record
  -> OCR Generic Doc (Header Review)
  -> OCR Generic Doc Line Items (Line Review)
  -> Financial Item Mapping + Status Decision
  -> FINAL Posting Status (Lock)
  -> OCR Scanned Doc Report Export
```

### Module Visibility (Routed vs Menu)

The applet route configuration includes additional modules beyond the default sidebar menu:
- **Primary sidebar modules**: Scanned Receipt, OCR Generic Doc, OCR Generic Doc Line Item, OCR Company, OCR Item, OCR Scanned Doc Report
- **Routed but not shown by default in menu**: OCR Branch (`/ocr-branch`) and Inventory Item listing (`/inv-item`)

This is useful when troubleshooting environment differences between role-based menu visibility and direct route access.

### Status Model You Should Know

| Status Type | Values | Usage |
|-------------|--------|-------|
| **Verification Status** | `PASS`, `FAIL`, `FLAGGED` | OCR quality/validation result |
| **Process Status** | `PENDING_REVIEW`, `DUPLICATE`, `REJECTED`, `APPROVED` | Operational workflow state |
| **Posting Status** | `FINAL` | Accounting lock control |

**Important behavior:**
- In edit screens, users typically set `PENDING_REVIEW`, `DUPLICATE`, or `REJECTED`.
- `APPROVED` is usually system-driven and treated as read-only in the process flow.
- Once posting becomes `FINAL`, key edit actions are restricted.

### Standardized Rejection Reasons

When a document is rejected, use one of the configured reasons:
- Rejected - Duplicated receipt
- Rejected - Incomplete details
- Rejected - Non-related receipt
- Rejected - Outdated receipt
- Rejected - Exceeded Monthly Submission Limit (Max. 7 receipts per month)
- Rejected - More than 1 receipt

---

## Quick Start Guide

Get started quickly with the most important role-based workflows.

Navigation note: If direct URL navigation redirects, open modules from the applet sidebar.

[![Quick Start Guide video thumbnail for OCR Cash Bill Applet](https://img.youtube.com/vi/2lvMSe6y97U/hqdefault.jpg)](https://youtu.be/2lvMSe6y97U?si=ptozYiPHTFgClxQg)

Quick Start Guide video: Click the thumbnail to watch on YouTube.

### For Operations Users: Upload Your First Receipt

**Goal:** Create a scanned receipt and trigger OCR processing.

{{< figure src="/images/ocr-cash-bill-applet/scanned-receipt-listing.png" alt="Scanned Receipt Listing page showing uploaded documents and processing statuses" caption="Scanned Receipt Listing: Track uploaded receipts and their process status in one view." >}}

1. Go to **Scanned Receipt**
2. Click the **+ (Create)** button on the listing toolbar
3. Set **Status** (default `ACTIVE`)
4. Select **Execution Strategy**:
   - `RUN_NOW` for immediate OCR processing
   - `INSERT_TO_QUEUE` for queued processing
5. Upload receipt image in **Receipts Upload**
6. Click **CREATE**

{{< figure src="/images/ocr-cash-bill-applet/scanned-receipt-create-form.png" alt="Scanned Receipt Create form with status, execution strategy, and receipt upload area" caption="Scanned Receipt Create: Upload a receipt and choose processing strategy before creating the record." >}}

**What happens next?**
- The document appears in **Scanned Receipt Listing**
- Reviewers can open it in **OCR Generic Doc** for validation

**Note:** The `CREATE` button stays disabled until a receipt image is uploaded.

---

### For Finance Reviewers: Process an OCR Generic Doc

**Goal:** Validate OCR output, assign process status, and finalize.

{{< figure src="/images/ocr-cash-bill-applet/ocr-generic-doc-listing.png" alt="OCR Generic Doc Listing with search filters and document statuses" caption="OCR Generic Doc Listing: Review extracted documents with process and verification visibility." >}}

1. Open **OCR Generic Doc**
2. Use search filters (Doc No, Scanned Doc No, Process Status, Verification Status, date ranges) if needed
3. Click a row in **OCR Generic Doc Listing** to open the edit panel, then review **Main Details**:
   - Doc No, Amount, Receipt Date
   - Company, Confidence Level, Verification Status
   - Current Process Status and updated-by info
4. Set **Process Status** (`PENDING_REVIEW`, `DUPLICATE`, or `REJECTED`)
5. If `REJECTED`, choose **Reason to Reject**
6. Review **Line Items** tab and adjust mappings/amount details where required
7. Click **UPDATE**
8. Click **FINAL** when review is complete

{{< figure src="/images/ocr-cash-bill-applet/ocr-generic-doc-edit-form.png" alt="OCR Generic Doc Edit form showing main details, process status, rejection reason, and final button" caption="OCR Generic Doc Edit: Validate details, update process status, and finalize reviewed documents." >}}

{{< figure src="/images/ocr-cash-bill-applet/ocr-generic-doc-edit-form-line.png" alt="OCR Generic Doc Edit form showing main details, process status, rejection reason, and final button" caption="OCR Generic Doc Edit: Validate details, update process status, and finalize reviewed documents." >}}

**Outcome:** The document is controlled, traceable, and locked from further unintended edits after finalization.

---

### For Master Data Admins: Set Up OCR Company and OCR Item

**Goal:** Prepare reliable reference data for cleaner OCR mapping.

1. Open **OCR Company** and create supplier/retailer references
2. Maintain required details: company code, company name, country, and active status
3. Complete support details: address, postal code, city/state, contact number
4. Open **OCR Item** and create item references linked to OCR company records
5. Maintain required details: item code, item name, linked company, and active status
6. During line-item review, map OCR lines to valid financial items for consistent posting
7. Run a test receipt and confirm the expected company/item suggestions appear

**Outcome:** Better matching accuracy and reduced review friction for finance teams.

---

### For Reporting Users: Generate OCR Scanned Doc Report CSV

**Goal:** Export OCR process history for analysis and audit follow-up.

1. Open **OCR Scanned Doc Report**
2. Optionally set date filters:
   - Created Date From / To
   - Updated Date From / To
3. Click **Generate CSV**
4. Wait for background processing (status appears in listing)
5. Use **Actions** to download completed reports

**Outcome:** Downloadable report files with status and error visibility.

---

### For Applet Admins: Initial System Setup Checklist

**Goal:** Prepare the applet for production use with consistent defaults and access control.

1. From the applet left sidebar, go to `Settings > Default Selection` and set branch, location, and timezone defaults
2. From the same `Settings` menu, open `Field Settings` and decide how advanced search should behave
3. Configure permission sets and user/team/role permissions for Operations, Finance, and Admin users
4. Load baseline OCR Company and OCR Item master data
5. Run an end-to-end test cycle: upload -> review -> map -> finalize
6. Generate one test CSV report from **OCR Scanned Doc Report** to verify reporting access

**Outcome:** Teams start with correct defaults, right permissions, and a validated workflow.

---

{{< callout type="tip" >}}
**New rollout suggestion:**
1. Operations uploads 5-10 sample receipts
2. Finance practices process-status and rejection controls
3. Admins confirm master data quality
4. Reporting users validate CSV outputs before go-live
{{< /callout >}}

### Common Mistakes (Quick Start)

| Common Mistake | What Happens | How to Avoid It |
|---|---|---|
| Uploading without clear receipt image | OCR fields are incomplete or flagged | Use clear, well-lit images with visible date, amount, and merchant details |
| Finalizing too early | Needed corrections are blocked by `FINAL` lock | Complete status checks and line-item mapping before clicking **FINAL** |
| Missing rejection reason for rejected docs | Audit trail becomes unclear | Always set a standardized **Reason to Reject** when using `REJECTED` |
| Incorrect financial item mapping | Reporting and posting quality degrades | Verify selected financial item against item name/description before update |
| Skipping default settings setup | Users spend extra time fixing branch/location context | Configure `Settings > Default Selection` before production rollout |

---

## Scanned Receipt

This is the ingestion module for receipt images.

{{< figure src="/images/ocr-cash-bill-applet/scanned-receipt-edit.png" alt="Scanned Receipt Edit page showing uploaded image preview and OCR output JSON" caption="Scanned Receipt Edit: Inspect uploaded images and OCR output during receipt review." >}}

### What You Can Do

- Upload receipt files and preview the image
- Set execution strategy (`RUN_NOW` or `INSERT_TO_QUEUE`)
- Track process status in listing
- View OCR output JSON in edit mode
- Rotate and zoom uploaded images for better review

### Listing Highlights

- Scanned Doc No.
- Process Status
- Creation Date
- Modified Date
- Created By

### Edit Behavior

- Process status can be updated during review
- Approved records are treated as locked for process status edits
- OCR output is displayed as read-only text for traceability

---

## OCR Generic Doc

This is the main review workspace for OCR-converted header data.

{{< figure src="/images/ocr-cash-bill-applet/ocr-generic-doc-main-details.png" alt="OCR Generic Doc Main Details tab with doc number, amount, company, and statuses" caption="OCR Generic Doc Main Details: Central workspace for header-level OCR validation and process control." >}}

### Main Details Tab

- Doc No
- Amount (calculated from line totals)
- Receipt Date
- Created Date
- Company
- Verification Status
- Process Status
- Reason to Reject (shown when rejected)
- Status
- Updated By

### Line Items Tab

The line item tab opens detailed line-level records where users can map financial items and adjust key fields.

{{< figure src="/images/ocr-cash-bill-applet/ocr-generic-doc-line-items-tab.png" alt="OCR Generic Doc Line Items tab listing extracted OCR lines" caption="OCR Generic Doc Line Items: Review and drill into extracted line-level details." >}}

### Key Controls

- **UPDATE** saves review changes
- **FINAL** triggers posting lock flow
- Process status updates in this screen also sync to the linked **Scanned Receipt** process status
- If posting status is `FINAL`, selected fields and workflows become read-only

---

## OCR Generic Doc Line Item

Use this module to refine OCR line-level data.

{{< figure src="/images/ocr-cash-bill-applet/ocr-line-item-edit.png" alt="OCR Generic Doc Line Item Edit page with financial item mapping and quantity/price fields" caption="OCR Line Item Edit: Map OCR lines to financial items and adjust key values before finalization." >}}

### Editable Fields

- Financial Item (via selection dialog)
- Item Name
- Remarks
- Quantity
- Unit Price
- Status

### Read-Only Context Fields

- OCR Generic Doc No
- OCR Item Code
- Description
- Company
- Updated By

### Mapping Workflow

1. Open line item record
2. Click **Financial Item**
3. Select item from financial item listing
4. Save update
5. Use **RESET** if mapping should be cleared and remapped

{{< figure src="/images/ocr-cash-bill-applet/select-financial-item-dialog.png" alt="Select Financial Item listing screen used for mapping OCR line items" caption="Select Financial Item: Choose the correct financial item to standardize posting and reporting." >}}

### Finalization Rule

If posting status is `FINAL`, line-item update actions are disabled.

---

## Master Data Setup: OCR Company & OCR Item

{{< figure src="/images/ocr-cash-bill-applet/ocr-company-listing.png" alt="OCR Company Listing showing company code, name, country, and status" caption="OCR Company Listing: Maintain retailer/company references used during OCR review." >}}

### OCR Company

Maintain retailer/company references used by OCR documents.

**Typical fields:**
- Company Code
- Company Name
- Description
- Country
- Address
- Postal Code
- City
- State
- Contact No.
- Status

**Listing view includes:** code, name, description, status, country, and contact/address details.

### OCR Item

Maintain OCR item references linked to OCR companies.

{{< figure src="/images/ocr-cash-bill-applet/ocr-item-listing.png" alt="OCR Item Listing showing item code, name, linked company, and status" caption="OCR Item Listing: Keep OCR item references clean for more reliable line-item mapping." >}}

**Typical fields:**
- Item Code
- Item Name
- Description
- Company
- Remarks
- Status

**Listing view includes:** item code, name, company, description, and status.

---

## OCR Scanned Doc Report

Use this module for report generation and file download.

{{< figure src="/images/ocr-cash-bill-applet/ocr-scanned-doc-report-listing.png" alt="OCR Scanned Doc Report page with date filters, Generate CSV button, and report status listing" caption="OCR Scanned Doc Report: Generate CSV exports and monitor report processing status." >}}

### Report Workflow

1. Set optional created/updated date filters
2. Click **Generate CSV**
3. Wait for background generation
4. Download report from listing action button

### Listing Columns

- Report Name
- Status
- Error Message
- Created Date
- Updated Date
- Actions (download/delete)

### Operational Tip

If report generation is delayed, check status and error message in the listing before regenerating.

---

## Finalization Control

Finalization is a critical safeguard for downstream accounting quality.

### What FINAL Does

- Marks posting status as `FINAL`
- Restricts further edits on key header and line-item flows
- Preserves reviewed values for audit consistency

### When to Use FINAL

Use `FINAL` only after:
- Process status and rejection logic (if any) are complete
- Company/item mapping is validated
- Quantity and unit price checks are done
- Reviewer confirms no further corrections are needed

---

## Configuration & Settings

{{< figure src="/images/ocr-cash-bill-applet/settings-field-settings.png" alt="Field Settings page with advanced search toggle options" caption="Field Settings: Configure advanced search behavior for OCR Generic Doc listing." >}}

Use the left sidebar inside **OCR Cash Bill Applet** to open `Settings` and `Personalization` pages. Depending on role permissions, direct route links may not land on the expected sub-page.

### Field Settings (`Settings > Field Settings`)

Control advanced search behavior for OCR Generic Doc listing. In current UI, these appear under **OCR LIST ADVANCED SEARCH SETTING**:
- `HIDE_CUSTOMER_ADVANCED_SEARCH`
- `ENABLE_MEMBER_ADVANCED_SEARCH`

Use these toggles to simplify search UX or enable member-focused filtering.

---

### Default Selection (`Settings > Default Selection`)

Set applet-wide defaults for:
- `DEFAULT_BRANCH`
- `DEFAULT_LOCATION`
- `DEFAULT_TIMEZONE`

`DEFAULT_COMPANY` may be tenant-dependent (for some tenants it is auto-derived from branch and not shown as an editable field).

These reduce repetitive input and standardize user context.

{{< figure src="/images/ocr-cash-bill-applet/settings-default-selection.png" alt="Default Selection settings page for branch, location, company, and timezone" caption="Default Selection: Set applet-wide defaults to reduce repetitive user input." >}}

---

### Personalization > Default Selection

Users can set personal overrides for:
- Default Branch
- Default Location

These personal values override applet-level defaults for that user.

{{< figure src="/images/ocr-cash-bill-applet/personal-default-selection.png" alt="Personal Default Selection page for user-level branch and location preferences" caption="Personal Default Selection: User-level defaults that override applet-wide settings." >}}

---

### Access, Permission, and Integration Controls

The applet also includes standard admin routes for:
- Webhook
- Client-side permission listing
- Permission sets
- User/team/role permission controls
- Sidebar personalization

Use these during rollout to enforce role-based access and operational governance.

---

### Labels & Localization Notes

- No applet-specific i18n translation JSON file is currently defined under this applet's `src/assets`.
- A shared template file exists at `micro-fe/src/assets/i18n/template.json`, and it is currently empty (`{}`).
- In practice, labels are defined directly in:
  - Component templates (`mat-label`, button text, tab labels)
  - Listing column definitions (`headerName`)
  - Advanced search model label maps (for OCR Generic Doc, Scanned Receipt, OCR Company, OCR Item)

If multi-language support is planned later, these UI strings are the main extraction points.

---

## FAQ

### 1. Why is the **CREATE** button disabled in Scanned Receipt Create?

At least one receipt image must be uploaded before creation is allowed.

---

### 2. What is the difference between `Verification Status` and `Process Status`?

`Verification Status` indicates OCR validation quality (`PASS`, `FAIL`, `FLAGGED`). `Process Status` indicates review decision flow (`PENDING_REVIEW`, `DUPLICATE`, `REJECTED`, `APPROVED`).

---

### 3. Why can I not edit some OCR Generic Docs or line items?

If posting status is `FINAL`, editing is restricted to protect finalized data integrity.

---

### 4. When should I choose `RUN_NOW` vs `INSERT_TO_QUEUE`?

Use `RUN_NOW` for immediate processing. Use `INSERT_TO_QUEUE` when batching uploads or when processing should be deferred.

---

### 5. How do I map OCR lines to accounting items correctly?

Open the line item, click **Financial Item**, select the appropriate item from the financial item list, then update. Use **RESET** if you need to remap.

---

### 6. Why can't I set process status to `APPROVED` directly in some screens?

In the standard review flow, users typically set review statuses (`PENDING_REVIEW`, `DUPLICATE`, `REJECTED`). In current UI behavior, `APPROVED` is not offered in the reviewer dropdown and is generally system-controlled.

---

### 7. A generated report is not downloadable yet. What should I check?

Open **OCR Scanned Doc Report** and verify the row `Status` and `Error Message`. Download is available only after successful generation.

---

### 8. Which rejection reason should I use for too many submissions in one month?

Use: **Rejected - Exceeded Monthly Submission Limit (Max. 7 receipts per month)**.

---

### 9. I selected the wrong company on OCR Generic Doc. What should I do?

Open the document, click the **Company** field, choose the correct OCR Company, then recheck line mapping before updating/finalizing.

---

### 10. A receipt looks duplicated. What is the correct handling flow?

Set process status to `DUPLICATE`, add an appropriate rejection reason where required, and keep a short remark for audit clarity before saving.
