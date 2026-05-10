---
title: "Car Workshop Applet"
description: "End-to-end workshop operations applet for consultation intake, job sheet execution, checklist control, and billing-ready document flow."
tags:
- automotive
- workshop-management
- consultation
- internal-jobsheet
- service-operations
weight: 205
---

## Purpose and Overview

The Car Workshop Applet helps service centers run workshop operations from intake to execution in one flow. It connects customer and vehicle consultation records with job sheets, checklist control, and downstream financial documents.

{{< callout type="info" >}}
**Core Concept**: The applet captures service reality first (consultation and job details), then connects it to finance-ready documents for billing and control.
{{< /callout >}}

### Who Benefits from This Applet?

**Front Desk and Service Advisors:**
- Register consultation cases quickly
- Select or create vehicle and customer records on the spot
- Capture checklist findings before workshop work starts

**Workshop Supervisors and Technicians:**
- Convert consultation outcomes into actionable job sheets
- Track line items, labor, and materials in one job record
- Maintain consistent inspection and quality control workflow

**Finance and Back Office Teams:**
- Receive cleaner source data for invoices and vouchers
- Trace service events to financial documents
- Reduce billing disputes with checklist and attachment evidence

**Management:**
- Monitor service pipeline and posting progress
- Improve branch-level service consistency
- Standardize workshop process across locations

### What Problems Does This Solve?

**The Typical Workshop Operations Problem:**

Many workshops use disconnected tools for intake, service execution, and billing. This causes:
- Incomplete intake information
- Lost service details between advisor and technician
- Delayed billing because records are not ready
- Inconsistent inspection quality between branches
- Weak traceability when disputes happen

**The Car Workshop Applet Solution:**

- **Structured consultation intake** with customer, member, and vehicle context
- **Checklist-driven control** for pre-inspection, condition, safety, and quality
- **Job sheet lifecycle management** from draft to final and void control
- **Integrated document handoff** to quotation, invoice, purchase, and receipt flows
- **Configurable settings** for field visibility and process defaults

## Key Features Overview

{{< cards >}}
  {{< card title="Consultation Intake" subtitle="Capture customer, vehicle, consultant, and workshop context" link="#consultation-workspace" >}}

  {{< card title="Checklist Control" subtitle="Pre-inspection, car condition, safety, and quality checkpoints" link="#consultation-checklist" >}}

  {{< card title="Job Sheet Management" subtitle="Create, edit, finalize, and void internal job sheets" link="#job-sheet-workspace" >}}

  {{< card title="Document Handoff" subtitle="Connect workshop records to quotation, invoice, purchase, and receipt flows" link="#document-handoff" >}}

  {{< card title="Settings" subtitle="Field settings, checklist settings, and default selection" link="#configuration--settings" >}}

  {{< card title="Personalization" subtitle="Personal defaults and sidebar layout" link="#personalization" >}}
{{< /cards >}}

{{< figure src="/images/car-workshop-applet/infographics.png" alt="Car Workshop Applet infographic showing intake to invoice flow from consultation to checklist, job sheet, and financial documents" caption="Car Workshop Applet overview: from consultation intake to checklist control, job sheet execution, and financial handoff." >}}

## Key Concepts

### Workshop Flow at a Glance

```text
Consultation
  -> Checklist (pre-inspection, condition, safety, quality)
  -> Internal Job Sheet
  -> Downstream documents (as needed)
       - Internal Sales Quotation
       - Internal Sales Invoice
       - Internal Purchase Invoice
       - Internal Receipt Voucher
```

### The Four Core Records

| Record | Purpose | Typical Owner |
|--------|---------|---------------|
| **Consultation** | Intake and service context before execution | Front Desk / Service Advisor |
| **Checklist** | Structured quality and safety findings | Service Advisor / Technician |
| **Internal Job Sheet** | Work execution details and costing basis | Workshop Supervisor / Technician |
| **Financial Documents** | Billing and financial settlement chain | Finance / Back Office |

{{< callout type="tip" >}}
Use Consultation as the service truth source and Job Sheet as the execution truth source. This keeps downstream billing accurate and auditable.
{{< /callout >}}

---

## Quick Start Guide

### For Front Desk: Create a Consultation

**Goal:** Register a new workshop case with vehicle and customer context.

1. Open **Consultation** from the sidebar.
2. Click **Add** to start a new consultation draft.
3. Select branch, consultant, member (if applicable), and vehicle.
4. If needed, create or update customer and address details during selection.
5. Save and proceed to checklist capture.

**What you can track in listing:** Consultation No, Branch, Consultant, Member, Vehicle Plate, Last Update, Created Date, and Status.

{{< figure src="/images/car-workshop-applet/consultation-listing.png" alt="Consultation listing with consultation number, branch, consultant, member, vehicle plate, status, and timestamps" caption="Consultation listing: monitor open and active workshop consultations at a glance." >}}

{{< figure src="/images/car-workshop-applet/consulation-details.png" alt="Create or edit consultation details tab with branch, vehicle plate, consultant, member card, and posting status" caption="Consultation details tab: capture the primary intake context for each workshop case." >}}

{{< figure src="/images/car-workshop-applet/consulation-account.png" alt="Consultation account tab showing linked entity details such as status, type, currency, contact, and phone" caption="Consultation account tab: verify linked customer account information before downstream billing." >}}

{{< figure src="/images/car-workshop-applet/consultation-requests.png" alt="Consultation requests tab showing issue descriptions, remarks, status flags, and created date" caption="Consultation requests tab: track customer-reported issues and request statuses." >}}

---

### For Service Team: Build and Progress a Job Sheet

**Goal:** Convert operational details into a complete workshop job sheet.

1. Open **Job Sheet** from the sidebar.
2. Click **Add** to create a new internal job sheet.
3. Fill main details, account details, and line items.
4. Add payment/contra/attachments where required.
5. Review posting status and mark to **FINAL** when ready.
6. Use **VOID** only for finalized records that must be reversed by policy.

**Common posting statuses in workshop flows:** DRAFT, FINAL, VOID, DISCARDED.

---

### For Admin: Configure Checklist and Defaults

**Goal:** Standardize workshop quality process and data entry behavior.

1. Go to **Settings**.
2. Configure **Checklist Settings** for workshop inspection templates.
3. Configure **Field Settings** to show or hide process fields.
4. Set **Default Selection** for company/branch/location and workflow behavior.
5. Validate with a test consultation and a test job sheet.

{{< figure src="/images/car-workshop-applet/checklisting-settings-predefined.png" alt="Applet settings checklist screen with checklist listing and editable checklist details" caption="Checklist settings: maintain predefined checklist headers and descriptions for workshop quality control." >}}

{{< figure src="/images/car-workshop-applet/predefined-checklist-lines.png" alt="Checklist settings lines tab showing predefined checklist line items" caption="Checklist lines: standardize line-level checks under each checklist template." >}}

{{< figure src="/images/car-workshop-applet/add-checklist-lines.png" alt="Add checklist line form with name, remarks, and description fields" caption="Add checklist line: define new inspection checks and remarks structure." >}}

---

## Consultation Workspace

The Consultation screen is the intake center for workshop operations.

{{< figure src="/images/car-workshop-applet/consultation-listing.png" alt="Consultation listing screen with branch, consultant, member, vehicle plate, status, and update timestamps" caption="Consultation workspace listing: search and open consultation records for execution." >}}

### What You Can Do

- Create consultation drafts for new service visits
- Search by branch, consultant, customer, vehicle, and date ranges
- Track posting-related consultation status such as OPEN, CLOSE, and DRAFT
- Load linked member and vehicle context for downstream processing
- Trigger related data loading for sales quotation, sales invoice, purchase invoice, and job sheet workflows

### Why It Matters

Consultation quality directly affects job sheet quality and billing quality. Better intake data means fewer rework cycles later.

### Consultation Create/Edit Tabs and Fields

The consultation flow is tab-oriented. Typical tabs and key fields are:

| Tab | Key Fields | Why It Matters |
|-----|------------|----------------|
| **Main Details** | Branch, Consultant, Customer/Member, Vehicle, Consultation reference fields | Establishes the operational context for the entire workshop transaction |
| **Select Vehicle** | Vehicle Plate No, Brand, Model Year, Engine Capacity | Ensures job details are tied to the correct vehicle |
| **Select Customer** | Customer entity, contact details, billing and shipping addresses | Prevents billing and communication errors |
| **Select Member** | Membership card/profile (if used) | Applies member-based workshop or pricing logic |
| **Consultation Checklist** | Pre-inspection, car condition, safety, quality control checklists | Standardizes intake quality and protects service consistency |
| **Related Docs Panel** | Linked quotation/invoice/job-sheet views (tenant dependent) | Enables quick transition from intake to downstream execution |

### Consultation Listing Fields (Operator View)

| Field | Meaning | Typical Action |
|-------|---------|----------------|
| **Consultation No** | System running number for consultation | Use when coordinating with workshop floor |
| **Branch** | Branch handling the case | Filter workload by branch |
| **Consultant** | Advisor handling intake | Track assignment quality and speed |
| **Member** | Membership holder linked to case | Validate entitlement or profile details |
| **Vehicle Plate** | Vehicle registration number | Match physical vehicle at workshop gate |
| **Last Update / Created Date** | Timing of last modification and creation | Identify stalled or old drafts |
| **Status** | Consultation progression status | Move items from open intake to execution |

{{< figure src="/images/car-workshop-applet/vehicle-listing.png" alt="Select vehicle listing with plate number, brand, model year, and engine capacity" caption="Vehicle selection: choose the correct vehicle record during consultation intake." >}}

{{< figure src="/images/car-workshop-applet/create-vehicel.png" alt="Create or edit consultation with side panel vehicle selection and select mode options" caption="Vehicle selection panel: link the intake record to an existing or newly created vehicle." >}}

{{< figure src="/images/car-workshop-applet/vehicle-entity-link.png" alt="View or edit vehicle account tab with entity details and bill-to or ship-to fields" caption="Vehicle-to-entity link: connect vehicle records with customer entity profile details." >}}

## Consultation Checklist

The checklist framework enforces service consistency before and during work.

### Checklist Areas

- **Pre-Inspection**: Baseline checks before work starts
- **Car Condition**: Vehicle condition observations, including image capture flows
- **Safety**: Critical safety checks and pass/fail control points
- **Quality Control**: Verification before release or billing handoff

{{< figure src="/images/car-workshop-applet/consulation-pre-inspect-car-condition.png" alt="Consultation checklist pre-inspection details tab with technician, date, description, and status" caption="Pre-inspection details: record baseline technical findings and intake condition notes." >}}

{{< figure src="/images/car-workshop-applet/car-pre-inspection-details.png" alt="Consultation checklist pre-inspection screen with details tab and technician assignment" caption="Pre-inspection checklist details: capture technician ownership and inspection status." >}}

{{< figure src="/images/car-workshop-applet/checklist-pre-insepect-car-condition.png" alt="Car condition checklist screen with image list and add image panel for position and description" caption="Car condition capture: attach condition photos and labeled positions for service evidence." >}}

{{< figure src="/images/car-workshop-applet/preinspection-checklist-selection.png" alt="Checklist selection panel showing predefined checklist groups and selectable checklist lines" caption="Checklist selection: apply predefined checklist groups and lines to each consultation." >}}

### Checklist Settings

Admins can maintain checklist templates from Settings:
- Checklist header (name, description, remarks)
- Checklist lines for each checklist template
- Ongoing edits for process updates by branch or policy

### Checklist Settings: Tab-by-Tab

| Tab/Screen | Key Fields | Operational Use |
|------------|------------|-----------------|
| **Checklist Listing** | Name, Description, Remarks, Updated Date, Updated By | Identify active templates and ownership |
| **Checklist Create** | Checklist name, description, remarks | Create a new inspection template |
| **Checklist Edit** | Checklist header updates | Keep templates aligned to workshop policy |
| **Checklist Line Listing** | Checklist line rows by category | Control inspection granularity |
| **Checklist Line Create/Edit** | Line label, sequence, expected response setup | Define what technicians must verify |

## Job Sheet Workspace

Internal Job Sheet is the operational execution record for workshop work.

### Listing and Actions

The job sheet listing supports:
- Search by job sheet number, branch, customer, date range, and creator
- Visibility of posting status and transaction dates
- Batch or row-level action flow for **FINAL** and **VOID** processing

### Core Job Sheet Areas

- Main details and transaction context
- Account, billing, and shipping details
- Line items with pricing and inventory detail support
- Payment and contra handling
- Attachments for evidence and support files
- Document links for upstream and downstream traceability
- Export and print paths via printable format setup

### Job Sheet Tabs and Field Explanations

| Tab | Key Fields | Why It Matters |
|-----|------------|----------------|
| **Main Details** | Company, Branch, Location, Reference, Transaction Date, Credit Terms, Currency, Sales Agent, CRM Contact, Permit No, Vehicle Plate | Controls accounting and operational header correctness |
| **Department** | Segment, Dimension, Profit Center, Project | Supports branch-level and management-level cost reporting |
| **Account** | Customer entity, contact, billing address, shipping address | Ensures customer and address accuracy before billing |
| **Line Item** | Item/service rows, quantity, unit price, discount, tax/wht controls, bin/batch options | Captures labor and materials precisely for cost and invoice integrity |
| **Payment** | Settlement method and payment details (tenant configuration dependent) | Captures immediate payment or staged settlement details |
| **Contra** | Contra source selection and contra line mapping | Supports netting workflows and offset scenarios |
| **Attachments** | Photos, reports, supporting documents | Provides evidence trail for service and dispute handling |
| **Doc Link / Trace** | Upstream source and downstream generated docs | Provides full transaction lineage for audit and troubleshooting |
| **Export** | Printable format selection and PDF output | Generates customer-ready and audit-ready document copies |

### Job Sheet Listing Fields (Manager View)

| Field | Meaning | Typical Decision Use |
|-------|---------|----------------------|
| **Doc Short Code** | Document type shorthand | Confirm workflow category at a glance |
| **Job Sheet No** | Primary document number | Cross-reference with operations and billing |
| **Posting Status** | DRAFT / FINAL / VOID / DISCARDED | Detect documents ready for billing handoff |
| **Transaction Date** | Effective business date | Tie job cost and revenue period correctly |
| **Branch / Customer Name** | Business context | Validate routing and ownership |
| **Updated Date / Created Date** | Timeline visibility | Escalate overdue or stale records |
| **Created By** | Record owner | Improve accountability and coaching |

{{< callout type="info" >}}
In most implementations, job sheets remain editable in draft stage and become controlled records after finalization.
{{< /callout >}}

## Document Handoff

Workshop operations in this applet connect to additional internal document types.

| Related Document | Typical Purpose |
|------------------|-----------------|
| **Internal Sales Quotation** | Prepare customer quote based on workshop findings |
| **Internal Sales Invoice** | Bill customer for completed work |
| **Internal Purchase Invoice** | Capture supplier costs related to workshop operations |
| **Internal Receipt Voucher** | Record receipt/collection scenarios in workshop flow |

This structure supports an operational-to-financial chain without retyping core workshop context.

## Configuration & Settings

### Settings Menu

From **Settings**, administrators can manage:

- **Field Settings**: control field visibility and behavior across pages
- **Checklist Settings**: maintain checklist templates and lines
- **Default Selection**: define default branch/location/company behavior
- Optional shared platform settings such as permissions and webhook configuration (tenant-dependent)

### Field and Process Controls

The applet supports extensive setting-driven visibility and behavior controls, including:
- Department dimensions (segment, dimension, project, profit center)
- Payment and settlement field controls
- Main details visibility controls
- Tab visibility for line item, account, payment, attachment, and trace sections
- Default decimal precision and step behavior

Use these controls to simplify UI for frontline users while retaining advanced capability for power users.

### Detailed Field Controls by Functional Area

| Functional Area | Typical Control Flags | Business Impact |
|-----------------|-----------------------|-----------------|
| **Main Details** | Hide/show credit terms, permit no, currency, member card, sales lead, CRM contact, tracking ID | Keeps intake form focused for each branch workflow |
| **Line Item Tabs** | Hide/show costing, pricing, issue link, delivery instruction, department, bin/batch/serial | Limits complexity for non-technical users while preserving advanced flows |
| **Header Tabs** | Hide/show account, payment, department header, attachment, export, convert, trace, doc link | Controls process governance and user responsibility boundaries |
| **Settlement Fields** | Mandatory or hidden card/payment fields, editable payment/settlement dates | Enforces compliance for payment capture |
| **Precision and Order** | Decimal precision, decimal step, detail tab order | Standardizes data entry quality across branches |

## Personalization

From **Personalization**, users can configure:

- **Personal Default Selection** for faster data entry
- **Sidebar preferences** to match frequent workflow paths

Personalization helps each role reduce repetitive input without changing global policy.

## Reporting and Audit Readiness

The applet supports audit-friendly operations through:
- Posting status progression records
- Document linkage between operational and financial records
- Attachment evidence at transaction level
- Export/print paths for offline documentation

## Manager Troubleshooting Playbooks

### Playbook 1: Too Many Job Sheets Stuck in Draft

**Symptoms:** High draft count, delayed invoicing, repeated follow-ups from finance.

1. Open **Job Sheet** listing and filter by posting status = DRAFT.
2. Group by branch and created-by to identify concentration points.
3. Spot-check missing sections: account details, line items, payment fields, or required attachments.
4. Review settings to confirm critical tabs are not hidden accidentally.
5. Set an operational cutoff: all service-complete drafts must be finalized by end of shift/day.

**Expected outcome:** Lower draft backlog and faster invoice readiness.

### Playbook 2: Consultation-to-Execution Delay

**Symptoms:** Consultations stay OPEN/DRAFT while workshop queue is full.

1. Filter consultation listing by status and last update date.
2. Validate whether checklist completion is blocking handoff.
3. Confirm vehicle and customer records are complete (especially addresses/contact).
4. Escalate stale cases to assigned consultant based on listing ownership fields.
5. Introduce a supervisor checkpoint for consultations older than agreed SLA.

**Expected outcome:** Faster conversion from intake to executable job sheets.

### Playbook 3: Inconsistent Checklist Usage Between Branches

**Symptoms:** Quality discrepancies, repeated post-service issues, weak inspection evidence.

1. Compare checklist templates in **Checklist Settings** across active use cases.
2. Lock minimum required lines for pre-inspection and safety controls.
3. Require car-condition image capture where policy demands evidence.
4. Train branch leads on checklist line intent, not just checkbox completion.
5. Run monthly review on failed/repeated quality checks.

**Expected outcome:** More consistent service quality and better quality-control traceability.

## Finance Troubleshooting Playbooks

### Playbook 1: Billing Rejection Due to Incomplete Job Data

**Symptoms:** Finance cannot invoice due to missing customer/account/line details.

1. Identify rejected job sheets and inspect missing fields.
2. Verify account tab completeness: entity, billing address, shipping address if required.
3. Validate line item pricing and tax configuration fields.
4. Return records to operations with a fixed correction checklist.
5. Add mandatory field controls in settings for repeated error patterns.

**Expected outcome:** Higher first-pass billing acceptance.

### Playbook 2: Finalized Record Requires Reversal

**Symptoms:** Pricing or item mistake found after FINAL status.

1. Verify whether policy allows direct reversal only via VOID.
2. Document reason and approval trail before voiding.
3. Perform **VOID** action on finalized document as per role authority.
4. Recreate corrected document with proper references.
5. Confirm downstream invoice/voucher chain is aligned after correction.

**Expected outcome:** Controlled correction without breaking audit trail.

### Playbook 3: Audit Evidence Gap

**Symptoms:** Missing proof for billed service lines during audit or dispute.

1. Review attachment completeness on affected job sheets.
2. Check doc-link trace from consultation to final financial document.
3. Reconcile posting status timeline with created/updated metadata.
4. Enforce attachment minimums for high-risk service categories.
5. Add periodic pre-audit sampling by branch.

**Expected outcome:** Stronger audit posture and faster dispute resolution.

## FAQ

**Q: Why do I not see some buttons or tabs?**  
A: Your tenant may have field/tab visibility controls or permission restrictions enabled. Ask your applet admin.

**Q: Can I use this applet without checklists?**  
A: Technically possible in some setups, but checklist usage is strongly recommended for quality and safety consistency.

**Q: When should I finalize a Job Sheet?**  
A: Finalize when work details are complete and approved for financial handoff.

**Q: Can finalized records be changed directly?**  
A: Most setups control this strictly. Use void/reversal process according to company policy.

**Q: Why is a consultation still in draft/open flow?**  
A: Usually because checklist or required operational details are not complete, or process steps are still pending.

**Q: Does this applet support multiple branches?**  
A: Yes, branch is part of both consultation filtering and transaction context.

## Related Documentation

- [Internal Jobsheet Applet](/applets/sales-workflow/internal-jobsheet-applet/)
- [Internal Sales Quotation Applet](/applets/sales-workflow/internal-sales-quotation-applet/)
- [Internal Sales Invoice Applet](/applets/sales-workflow/internal-sales-invoice-applet/)
- [Internal Purchase Invoice Applet](/applets/finance/internal-purchase-invoice-applet/)
- [Internal Receipt Voucher Applet](/applets/finance/internal-receipt-voucher-applet/)
