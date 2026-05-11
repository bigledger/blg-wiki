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
**Work in progress**: This applet documentation needs changes and more explaination.
{{< /callout >}}

## Purpose and Overview

The **OCR Cash Bill Applet** helps teams convert receipt images into structured financial records with a controlled review workflow. Instead of manual key-in, users upload receipts, review OCR output, map line items, apply process decisions, and finalize documents for downstream processing.

{{< callout type="info" >}}
**Core Concept**: Convert receipt images into structured OCR documents, then move them through **review**, **status control**, **line-item mapping**, and **final posting lock**.
{{< /callout >}}

### Who Benefits from This Applet?

**Operations / Shared Service Teams:**
- Upload and process receipt images quickly
- Reduce repetitive manual data entry
- Monitor processing outcomes from listing views
- Standardize review decisions with clear statuses

**Finance Reviewers / AP Teams:**
- Validate extracted document details before posting
- Review OCR output side-by-side with receipt images
- Apply rejection reasons consistently
- Finalize review-complete records with lock control

**Master Data Admins:**
- Maintain OCR Company references
- Maintain OCR Item references
- Improve line-item mapping quality
- Standardize merchant and item references for accounting use

**Audit, Compliance, and Finance Leadership:**
- Monitor verification and process outcomes
- Export report files for reconciliation and audit follow-up
- Preserve auditability with finalization controls

### What Problems Does This Solve?

**The Manual Receipt Processing Problem:**

Traditional cash bill handling is often fragmented and error-prone:
- Receipt quality is inconsistent (blurred, cropped, incomplete)
- Manual key-in causes delays and data entry errors
- Duplicate and invalid submissions are hard to control consistently
- Review decisions vary without standardized status usage
- Reporting and audit evidence extraction is slow

**The OCR Cash Bill Applet Solution:**

- **Receipt digitization** - Upload once, process through a structured workflow
- **Controlled statuses** - Standard process states and rejection reasons
- **Line-level mapping** - Link OCR lines to financial items for cleaner accounting
- **Finalization lock** - Prevent post-review accidental edits
- **Master data governance** - Keep company/item references consistent
- **Exportable reporting** - Generate CSV outputs for follow-up and reconciliation

## Key Features Overview

{{< cards >}}
  {{< card title="Scanned Receipt Intake" subtitle="Upload receipt images and trigger OCR processing" link="#for-operations-users-upload-your-first-receipt" >}}

  {{< card title="OCR Generic Doc Review" subtitle="Review header-level OCR output with process controls" link="#for-finance-reviewers-process-an-ocr-generic-doc" >}}

  {{< card title="Line Item Mapping" subtitle="Map OCR lines to financial items and refine extracted values" link="#ocr-generic-doc-line-item---line-mapping-workspace" >}}

  {{< card title="Master Data Setup" subtitle="Maintain OCR Company and OCR Item references" link="#master-data-setup" >}}

  {{< card title="Finalization Control" subtitle="Set posting status to FINAL and lock reviewed records" link="#finalization-control" >}}

  {{< card title="OCR Report Export" subtitle="Generate and download scanned document CSV reports" link="#reporting" >}}

  {{< card title="Configuration & Settings" subtitle="Manage defaults, field settings, and permissions" link="#configuration--settings" >}}

  {{< card title="FAQ" subtitle="Common processing and status handling questions" link="#faq" >}}
{{< /cards >}}

{{< figure src="/images/ocr-cash-bill-applet/ocr-cash-bill-overview.png" alt="OCR Cash Bill Applet overview showing upload, review, mapping, and finalization flow" caption="OCR Cash Bill Applet Overview: From receipt upload to finalized posting-ready records." >}}

## Key Concepts

### Understanding the OCR Processing Framework

| Aspect | Component | Practical Example |
|--------|-----------|------------------|
| **What is uploaded?** | Scanned Receipt | Cashier receipt image from a retail purchase |
| **What is reviewed?** | OCR Generic Doc | Extracted doc no, date, amount, and company |
| **What is mapped?** | OCR Generic Doc Line Item | OCR line linked to a financial item |
| **How is it controlled?** | Process + Posting Status | `REJECTED` with reason, then `FINAL` after review |

{{< callout type="tip" >}}
**Practical Example**: Operations uploads a receipt with `RUN_NOW`, Finance reviews OCR header data, maps line items, sets process status, and finalizes the document when complete.
{{< /callout >}}

### OCR Hierarchy Structure

Think of OCR cash bill processing as a structured flow:

```
Receipt Upload
  -> Scanned Receipt
  -> OCR Generic Doc (Header Review)
  -> OCR Generic Doc Line Item (Line Review)
  -> Company/Item Mapping + Process Decision
  -> FINAL Posting Status (Lock)
  -> OCR Scanned Doc Report Export
```

**Flow Through the Hierarchy:**

1. **Scanned Receipt**: Upload and process image
2. **OCR Generic Doc**: Validate extracted header data
3. **OCR Generic Doc Line Item**: Validate and map extracted lines
4. **Process Status**: Set review decision (`PENDING_REVIEW`, `DUPLICATE`, `REJECTED`)
5. **Finalization**: Set posting lock as `FINAL`
6. **Reporting**: Generate CSV for tracking and audit

### The "Golden Triangle" of OCR Processing

| Component | Analogy | Role | Example |
|-----------|---------|------|---------|
| **Scanned Receipt** | The "Source Image" | Input document for OCR | Uploaded receipt photo |
| **OCR Generic Doc** | The "Review Header" | Header-level validation and status decision | Process status + rejection reason |
| **OCR Generic Doc Line Item** | The "Accounting Mapping" | Line-level mapping for posting quality | Financial item mapping + quantity/unit price |

**How they link:**
1. The source image creates the scanned receipt record.
2. OCR extraction generates header and line records.
3. Reviewers validate and map extracted data.
4. Finalization locks approved review output.

### Sidebar Menu and Route Reference

| Navigation Group | Menu Label | Route | Typical Owner | What It Is Used For |
|---|---|---|---|---|
| Main Sidebar | Scanned Receipt | `/scanned-receipt` | Operations / Shared Service | Upload receipts and monitor process status |
| Main Sidebar | OCR Generic Doc | `/ocr-generic-doc` | Finance Reviewer | Validate OCR header data and status |
| Main Sidebar | OCR Generic Doc Line Item | `/ocr-generic-doc-line-item` | Finance Reviewer | Refine line-level details and mapping |
| Main Sidebar | OCR Company | `/ocr-company` | Master Data Admin | Maintain merchant/company references |
| Main Sidebar | OCR Item | `/ocr-item` | Master Data Admin | Maintain OCR item references |
| Main Sidebar | OCR Scanned Doc Report | `/ocr-report` | Reporting / Compliance | Generate and download CSV reports |
| Routed (Hidden by Default) | OCR Branch | `/ocr-branch` | Admin / Data Setup | Branch-level reference maintenance |
| Routed (Hidden by Default) | Inventory Item Listing | `/inv-item` | Admin / Data Setup | Inventory item lookup route |

### Standardized Rejection Reasons

Use one of these reasons when setting process status to `REJECTED`:
- Rejected - Duplicated receipt
- Rejected - Incomplete details
- Rejected - Non-related receipt
- Rejected - Outdated receipt
- Rejected - Exceeded Monthly Submission Limit (Max. 7 receipts per month)
- Rejected - More than 1 receipt

---

## Quick Start Guide

Get up and running quickly with these essential workflows.

Navigation note: If direct URL navigation redirects, open modules from the applet sidebar.

[![Quick Start Guide video thumbnail for OCR Cash Bill Applet](https://img.youtube.com/vi/2lvMSe6y97U/hqdefault.jpg)](https://youtu.be/2lvMSe6y97U?si=ptozYiPHTFgClxQg)

Quick Start Guide video: Click the thumbnail to watch on YouTube.

### For Operations Users: Upload Your First Receipt

**Goal:** Create a scanned receipt and trigger OCR processing.

1. Go to **Scanned Receipt**.
2. Click **+ (Create)**.
3. Set **Status** (default `ACTIVE`).
4. Select **Execution Strategy**:
   - `RUN_NOW` for immediate OCR processing
   - `INSERT_TO_QUEUE` for deferred/queued processing
5. Upload receipt image in **Receipts Upload**.
6. Click **CREATE**.

{{< figure src="/images/ocr-cash-bill-applet/scanned-receipt-listing.png" alt="Scanned Receipt Listing page showing uploaded documents and processing statuses" caption="Scanned Receipt Listing: Track uploaded receipts and process status in one view." >}}

{{< figure src="/images/ocr-cash-bill-applet/scanned-receipt-create-form.png" alt="Scanned Receipt Create form with status, execution strategy, and receipt upload area" caption="Scanned Receipt Create: Upload receipt and choose processing strategy before creating record." >}}

**What happens next?** The document appears in listing and is ready for reviewer validation in **OCR Generic Doc**.

### For Finance Reviewers: Process an OCR Generic Doc

**Goal:** Validate OCR output, apply process status, and finalize correctly.

1. Open **OCR Generic Doc**.
2. Search by Doc No, Process Status, Verification Status, or date ranges.
3. Open target record and review **Main Details** (amount, receipt date, company, confidence level, status).
4. Set **Process Status** to `PENDING_REVIEW`, `DUPLICATE`, or `REJECTED`.
5. If `REJECTED`, select **Reason to Reject**.
6. Open **Line Items** tab and validate mapping/values.
7. Click **UPDATE**.
8. Click **FINAL** once review is complete.

{{< figure src="/images/ocr-cash-bill-applet/ocr-generic-doc-listing.png" alt="OCR Generic Doc Listing with search filters and document statuses" caption="OCR Generic Doc Listing: Review extracted documents with process and verification visibility." >}}

{{< figure src="/images/ocr-cash-bill-applet/ocr-generic-doc-edit-form.png" alt="OCR Generic Doc Edit form showing process status and final button" caption="OCR Generic Doc Edit: Validate details, update process status, and finalize reviewed documents." >}}

### For Master Data Admins: Set Up OCR Company and OCR Item

**Goal:** Build clean references for stable line-item mapping.

1. Open **OCR Company** and maintain company master details.
2. Open **OCR Item** and maintain item master records linked to company.
3. Run a sample receipt and verify expected company/item mapping behavior.

### For Reporting Users: Generate OCR Scanned Doc Report CSV

**Goal:** Export OCR process data for operational analysis and audit.

1. Open **OCR Scanned Doc Report**.
2. Set optional created/updated date filters.
3. Click **Generate CSV**.
4. Wait for background processing to complete.
5. Download from listing **Actions**.

### For Applet Admins: Initial System Setup

**Goal:** Prepare production-ready defaults and governance controls.

1. Configure `Settings > Default Selection` (branch, location, timezone).
2. Configure `Settings > Field Settings` for advanced search behavior.
3. Configure user/team/role permissions for Operations, Finance, and Admin users.
4. Load baseline OCR Company and OCR Item records.
5. Test upload -> review -> map -> finalize.
6. Generate a test CSV report to verify reporting access.

---

{{< callout type="tip" >}}
**New to the system?** Start with this sequence:
1. Operations uploads 5-10 sample receipts.
2. Finance reviews and applies process statuses.
3. Admin validates master data and permission controls.
4. Reporting users verify CSV outputs before go-live.
{{< /callout >}}

---

## Processing Status Tracking

**Monitor review, quality, and lock status clearly before finalization.**

### What is Processing Status Tracking?

Processing status tracking helps teams distinguish OCR quality state from operational decision state and final posting lock state.

| Status Type | Values | Usage |
|-------------|--------|-------|
| **Verification Status** | `PASS`, `FAIL`, `FLAGGED` | OCR quality/validation result |
| **Process Status** | `PENDING_REVIEW`, `DUPLICATE`, `REJECTED`, `APPROVED` | Operational review state |
| **Posting Status** | `FINAL` | Finalized lock control |

### How to Check Processing Status

1. Open **Scanned Receipt** to check intake progress.
2. Open **OCR Generic Doc** for verification and process decisions.
3. Review **OCR Generic Doc Line Item** for mapping completeness.
4. Confirm posting status before and after finalization.

### Key Features

- Clear separation between OCR quality and process decision states
- Standardized rejection reason selection
- Finalization lock to protect reviewed data
- Status-driven report export visibility

### Common Scenarios

**Scenario 1: Duplicate Submission**
```
Process Status: DUPLICATE
Action: Mark duplicate and keep audit notes
Outcome: Prevents duplicate posting flow
```

**Scenario 2: Incomplete OCR Data**
```
Verification Status: FLAGGED
Process Status: REJECTED
Reason: Rejected - Incomplete details
Outcome: Controlled rejection with clear audit reason
```

**Scenario 3: Review Completed**
```
Process Status: PENDING_REVIEW -> APPROVED (system flow)
Posting Status: FINAL
Outcome: Record is locked and ready for reporting/reconciliation
```

### Tips for Reviewers

- Use the most specific rejection reason available
- Complete line-item mapping before finalization
- Avoid setting `FINAL` until process checks are complete
- Re-check process and posting statuses before exporting reports

---

## For Operations Users

### Scanned Receipt - Your Intake Workspace

{{< figure src="/images/ocr-cash-bill-applet/scanned-receipt-edit.png" alt="Scanned Receipt Edit page showing uploaded image preview and OCR output JSON" caption="Scanned Receipt Edit: Inspect uploaded images and OCR output during receipt review." >}}

**What You Can Do:**
- Upload receipt files and preview images
- Set execution strategy (`RUN_NOW` or `INSERT_TO_QUEUE`)
- Track process status from listing
- View OCR output JSON during review
- Rotate and zoom image previews

**Listing Highlights:**
- Scanned Doc No.
- Process Status
- Creation Date
- Modified Date
- Created By

**Edit Behavior:**
- Process status can be updated during review
- Approved records are treated as locked for process-status edits
- OCR output remains read-only for traceability

### Automated Intake with CP-COM Widget (If Enabled)

In CP-COM-enabled deployments:
- Receipt image can be captured/submitted via CP-COM flow
- Scanned receipt record is created automatically in this applet
- OCR processing continues through the same review pipeline

If CP-COM integration is not enabled, use manual upload in **Scanned Receipt Create**.

---

## For Finance Reviewers

### OCR Generic Doc - Header Review Workspace

{{< figure src="/images/ocr-cash-bill-applet/ocr-generic-doc-main-details.png" alt="OCR Generic Doc Main Details tab with doc number, amount, company, and statuses" caption="OCR Generic Doc Main Details: Central workspace for header validation and process control." >}}

**Main Details Tab includes:**
- Doc No
- Amount (calculated from line totals)
- Receipt Date
- Created Date
- Company
- Verification Status
- Process Status
- Reason to Reject (when rejected)
- Updated By

**Line Items Tab:**
- Opens line-level records for mapping and value refinement

{{< figure src="/images/ocr-cash-bill-applet/ocr-generic-doc-line-items-tab.png" alt="OCR Generic Doc Line Items tab listing extracted OCR lines" caption="OCR Generic Doc Line Items: Review and drill into extracted line-level details." >}}

**Key Controls:**
- **UPDATE** saves reviewer changes
- **FINAL** locks reviewed record
- Process status updates sync to linked scanned receipt status
- `FINAL` posting status restricts editable actions

### Rejection Handling Guide

1. Set **Process Status** to `REJECTED`.
2. Select **Reason to Reject**.
3. Click **UPDATE**.

| Rejection Reason | Use This When | Example Scenario |
|---|---|---|
| Rejected - Duplicated receipt | Same receipt already processed | User uploads the same image twice |
| Rejected - Incomplete details | Key data missing or unreadable | Amount/date/merchant text is unclear |
| Rejected - Non-related receipt | Receipt not valid for this process | Non-cash-bill document uploaded |
| Rejected - Outdated receipt | Submission outside allowed period | Receipt date is beyond policy window |
| Rejected - Exceeded Monthly Submission Limit (Max. 7 receipts per month) | Monthly cap exceeded | 8th receipt submitted in one month |
| Rejected - More than 1 receipt | One upload contains multiple receipts | Single image contains two receipts |

---

### OCR Generic Doc Line Item - Line Mapping Workspace

{{< figure src="/images/ocr-cash-bill-applet/ocr-line-item-edit.png" alt="OCR Generic Doc Line Item Edit page with financial item mapping and quantity price fields" caption="OCR Line Item Edit: Map OCR lines to financial items and adjust key values before finalization." >}}

**Editable Fields:**
- Financial Item
- Item Name
- Remarks
- Quantity
- Unit Price
- Status

**Read-Only Context Fields:**
- OCR Generic Doc No
- OCR Item Code
- Description
- Company
- Updated By

**Mapping Workflow:**
1. Open a line-item record.
2. Click **Financial Item**.
3. Select item from financial item listing.
4. Save update.
5. Use **RESET** if remapping is required.

{{< figure src="/images/ocr-cash-bill-applet/select-financial-item-dialog.png" alt="Select Financial Item listing screen used for mapping OCR line items" caption="Select Financial Item: Choose correct financial item for standardized posting and reporting." >}}

**Finalization Rule:**
If posting status is `FINAL`, line-item updates are disabled.

---

## Master Data Setup

### OCR Company

Maintain company/merchant references used by OCR documents.

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

{{< figure src="/images/ocr-cash-bill-applet/ocr-company-listing.png" alt="OCR Company Listing showing company code name country and status" caption="OCR Company Listing: Maintain retailer/company references used during OCR review." >}}

### OCR Item

Maintain OCR item references linked to OCR Company records.

**Typical fields:**
- Item Code
- Item Name
- Description
- Company
- Remarks
- Status

{{< figure src="/images/ocr-cash-bill-applet/ocr-item-listing.png" alt="OCR Item Listing showing item code name linked company and status" caption="OCR Item Listing: Keep item references clean for reliable line-item mapping." >}}

---

## Reporting

### OCR Scanned Doc Report - CSV Export Workflow

Use this module to generate and download report files.

{{< figure src="/images/ocr-cash-bill-applet/ocr-scanned-doc-report-listing.png" alt="OCR Scanned Doc Report page with date filters Generate CSV button and report status listing" caption="OCR Scanned Doc Report: Generate CSV exports and monitor report processing status." >}}

**Report Workflow:**
1. Set optional created/updated date filters.
2. Click **Generate CSV**.
3. Wait for background generation.
4. Download from listing action button.

**Listing Columns:**
- Report Name
- Status
- Error Message
- Created Date
- Updated Date
- Actions (download/delete)

**Operational Tip:**
If generation is delayed, check row status and error message before regenerating.

---

## Finalization Control

Finalization is a critical safeguard for downstream accounting quality.

### What FINAL Does

- Marks posting status as `FINAL`
- Restricts edits on key header and line-item flows
- Triggers finalization checks and moves the document into a locked state
- In current flow, rejection reason is cleared during finalization handling before posting update

### When to Use FINAL

Use `FINAL` only after:
- Process status and rejection logic are complete
- Company/item mapping is validated
- Quantity and unit price checks are complete
- Reviewer confirms no further corrections are needed

### What to Follow Up After FINAL

1. Confirm document appears as `FINAL` in listing/search view.
2. Verify line-item update actions are locked.
3. Generate/download report output if reconciliation is required.
4. Escalate corrections through admin/support flow instead of in-place edits.

---

## Configuration & Settings

Use the applet left sidebar to open **Settings** and **Personalization** pages.

{{< figure src="/images/ocr-cash-bill-applet/settings-field-settings.png" alt="Field Settings page with advanced search toggle options" caption="Field Settings: Configure advanced search behavior for OCR Generic Doc listing." >}}

### Field Settings (`Settings > Field Settings`)

Control advanced search behavior for OCR listing. Current UI includes:
- `HIDE_CUSTOMER_ADVANCED_SEARCH`
- `ENABLE_MEMBER_ADVANCED_SEARCH`

### Default Selection (`Settings > Default Selection`)

Set applet-wide defaults for:
- `DEFAULT_BRANCH`
- `DEFAULT_LOCATION`
- `DEFAULT_TIMEZONE`

`DEFAULT_COMPANY` can be tenant-dependent and may be auto-derived from branch.

{{< figure src="/images/ocr-cash-bill-applet/settings-default-selection.png" alt="Default Selection settings page for branch location company and timezone" caption="Default Selection: Set applet-wide defaults to reduce repetitive user input." >}}

### Personalization > Default Selection

Users can set personal overrides for:
- Default Branch
- Default Location

These personal values override applet-level defaults for the user.

{{< figure src="/images/ocr-cash-bill-applet/personal-default-selection.png" alt="Personal Default Selection page for user-level branch and location preferences" caption="Personal Default Selection: User-level defaults that override applet-wide settings." >}}

### Access, Permission, and Integration Controls

Use admin controls for:
- Webhook
- Client-side permission listing
- Permission sets
- User/team/role permission controls
- Sidebar personalization

### Labels and Localization Notes

- No applet-specific i18n JSON is currently defined under this applet's `src/assets`.
- Shared template exists at `micro-fe/src/assets/i18n/template.json` and is currently `{}`.
- Most labels are defined directly in templates, listing column headers, and advanced search label maps.

---

## Audit

### Audit Trail (`Settings > Applet Log`)

Use Applet Log to track:
- Who performed each action
- What fields changed
- When changes occurred
- Which document/status was affected

This supports compliance checks, investigation workflows, and operational troubleshooting.

---

## Personalization

### Default Selection

Set personal default branch and location to speed up daily processing. Personalization values override applet defaults for the specific user.

---

## FAQ

**Q: Why is the `CREATE` button disabled in Scanned Receipt Create?**
A: At least one receipt image must be uploaded before creation is allowed.

**Q: What is the difference between `Verification Status` and `Process Status`?**
A: `Verification Status` represents OCR quality (`PASS`, `FAIL`, `FLAGGED`), while `Process Status` represents reviewer decision flow (`PENDING_REVIEW`, `DUPLICATE`, `REJECTED`, `APPROVED`).

**Q: Why can I not edit some OCR Generic Docs or line items?**
A: If posting status is `FINAL`, editing is restricted to protect finalized data integrity.

**Q: When should I choose `RUN_NOW` vs `INSERT_TO_QUEUE`?**
A: Use `RUN_NOW` for immediate processing and `INSERT_TO_QUEUE` for deferred or batched processing.

**Q: How do I map OCR lines to accounting items correctly?**
A: Open line item, click **Financial Item**, select correct mapping from list, and update. Use **RESET** if remapping is needed.

**Q: Why can't I set process status to `APPROVED` directly in some screens?**
A: Reviewer flows typically use `PENDING_REVIEW`, `DUPLICATE`, or `REJECTED`. In current behavior, `APPROVED` is generally system-controlled.

**Q: A generated report is not downloadable yet. What should I check?**
A: Check row `Status` and `Error Message` in **OCR Scanned Doc Report**. Download is available only after successful generation.

**Q: Which rejection reason should I use for too many submissions in one month?**
A: Use **Rejected - Exceeded Monthly Submission Limit (Max. 7 receipts per month)**.

**Q: I selected the wrong company on OCR Generic Doc. What should I do?**
A: Open the document, choose the correct company, then recheck line mapping before updating or finalizing.

**Q: A receipt looks duplicated. What is the correct handling flow?**
A: Set process status to `DUPLICATE`, provide a clear remark or rejection context if required, then save for audit traceability.
