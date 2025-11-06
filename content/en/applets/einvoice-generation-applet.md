---
title: "My E-invoice Admin Applet"
description: "Electronic invoice creation and formatting for BigLedger compliance operations"
tags:
- einvoice-module
- electronic-invoicing
- compliance
- digital-transformation
- regulatory
weight: 400
---

## **Purpose and Scope**

The effective management of e-invoices is a strategic imperative for maintaining compliance with the Lembaga Hasil Dalam Negeri (LHDN) and ensuring operational efficiency.  

This user guide provides a comprehensive overview of how to use the **My E-Invoice Admin Applet**, the central tool for this process.  

The **My E-Invoice Admin Applet** is designed to manage both individual and consolidated transaction submissions to LHDN. It serves as the primary interface for users to manage, review, and cancel their e-invoice submissions, ensuring that all activities adhere to LHDN requirements.  

## 🚦 Quick Start: Issue and Submit Your First E‑Invoice

{{< callout type="tip" >}}
Time to complete: 3–7 minutes. Use this when you need to issue a validated e‑invoice quickly for a B2B sale.
{{< /callout >}}

### Prerequisites
- Customer record has `ID Type`, `Registration/ID`, `TIN`, `Email`, `Address`
- Item(s) have `Tax Type Code` and `UOM`
- Organization has `TIN`, `BRN`, `MSIC` and branch address

### Steps
1. Sales Applet → `New Sales Invoice`.
2. Fill Main, Account, Lines tabs. Confirm SST code and prices.
3. Click `Save`, then `FINAL` to lock the document.
4. My E‑invoice Admin Applet → `Posting Queue`.
   - Status shows `PROCESSED` (ready) or `UNPROCESSED` (fix required).
   - If `UNPROCESSED`, open the invoice → read Validation Errors → fix source document → Save and return.
5. In `Posting Queue`, select the invoice → click `Submit`.
6. Monitor in `To IRB E‑Invoice`.
   - Watch for `Document Accepted` then `Document is Valid`.
   - Open the invoice to view QR code and IRBM Reference.
7. Post‑validation actions:
   - `Send Notification` to email the buyer.
   - `Export` to download the official PDF.

### What confirms success?
- Status shows `Document is Valid` in Internal Submission History
- IRBM Reference Number present
- QR code and validation URL visible

---

## 📋 **Supported Document Types**

### **Sales Documents**

{{< cards >}}
  {{< card title="Cash Bills" >}}
  {{< card title="Sales Invoices" >}}
  {{< card title="Sales Credit Notes" >}}
  {{< card title="Sales Debit Notes" >}}
  {{< card title="Sales Return" >}}
  {{< card title="Sales Refund Notes" >}}
{{< /cards >}}

### **Self-Billed Purchase Documents**

{{< cards >}}
  {{< card title="Self-Billed Purchase Invoices" >}}
  {{< card title="Self-Billed Purchase Debit Notes" >}}
  {{< card title="Self-Billed Purchase Credit Notes" >}}
  {{< card title="Self-Billed Purchase Return" >}}
{{< /cards >}}

---

## 🔄 **E-Invoice Lifecycle Overview**

The e-invoice process flows through four distinct stages:

{{< steps >}}
### Pre-Submission
**Posting Queue & Batch Pool**
Collection and validation point for all transactions.
---
### LHDN Submission
**Internal Submission Queue & To IRB E-Invoice**
Final gateway for transmitting to LHDN and monitoring status.
---
### Post-Submission
**Internal Submission History**
Permanent archive for all successfully validated e-invoices.
---
### Rejection & Cancellation
**Rejection Request & Cancellation Queue**
Manages time-sensitive rejections and cancellations.
{{< /steps >}}

## 👤 Role‑Based Playbooks

{{< tabs items="Counter Sales (B2C), Accounts Receivable (B2B), Finance Manager, Procurement (Self‑Billed), Auditor & Compliance" >}}
{{< tab >}}
### Counter Sales (B2C)
Use `Single-General` for walk‑in buyers where full identity is not provided.

- POS Applet → `Cash Bill`
- If buyer requests named invoice within 72 hours, convert to `Individual` by updating customer fields and resubmitting from Batch Pool
- Monthly: Review `Batch Pool` → consolidated submission by 7th
{{< /tab >}}
{{< tab >}}
### Accounts Receivable (B2B)
Issue `Individual` e‑invoices for business customers.

- Pre‑check customer master: `ID Type`, `Reg/ID`, `TIN`, `Email`, `Address`
- Create `Sales Invoice` → `FINAL`
- `Posting Queue` → Submit → Monitor `To IRB E‑Invoice`
- Send buyer notification and archive PDF
{{< /tab >}}
{{< tab >}}
### Finance Manager
Owns monthly consolidated flow and overall metrics.

- Daily: Check `Posting Queue` and error backlog
- Weekly: Clear `Batch Pool` exceptions
- Monthly: Run auto consolidated submission (or manual batch) and verify by 7th
- KPIs: Success rate, mean time to validate, rejection rate
{{< /tab >}}
{{< tab >}}
### Procurement (Self‑Billed)
Create self‑billed purchase documents when supplier doesn’t issue.

- Enable `E‑invoice Self‑Billed = TRUE` in Supplier
- Create `Purchase Invoice (Self‑Billed)` → `FINAL`
- `Posting Queue` → Submit → Reconcile via `Peppol Incoming` / email OCR
{{< /tab >}}
{{< tab >}}
### Auditor & Compliance
Verify traceability and export evidence.

- `Internal Submission History` → filter by date/document
- Confirm `Document is Valid` and IRBM Ref No
- Export PDF and structured data (XML/JSON if available)
{{< /tab >}}
{{< /tabs >}}

---

## 📊 **Pre-Submission Transaction Management**

### **Posting Queue - Initial Checkpoint**

The **Posting Queue** is the first critical control point where all finalized transactions from various source applets initially appear.

{{< callout type="info" >}}
**Core Functions:**
- **Transaction Aggregation**: Consolidates all finalized documents into a single, manageable list
- **Verification**: Ensures mandatory fields required for LHDN submission are populated
- **Manual Submission**: Users can manually select transactions for direct submission or batch processing
- **Automated Processing**: System processes valid transactions every 15-20 minutes
- **Detailed Review**: Click any transaction to review comprehensive details including document information, buyer details, and line items
{{< /callout >}}

**Next Steps**: Validated transactions proceed to **Internal Submission Queue**. Failed validations move to **Batch Pool**.

### **Batch Pool - Consolidated & Error Management**

The **Batch Pool** handles two key scenarios:

#### 📦 **Consolidated Submissions**
- Stores documents designated for consolidated e-invoice submission
- Must be submitted to LHDN before the 7th of the following month
- Customers can request individual e-invoices by removing from pool

#### ⚠️ **Error Handling**
Documents with missing mandatory fields are held here for correction:

1. Click document in Batch Pool to open details
2. Navigate to **Validation Error** section at bottom
3. Review specific error message (e.g., "missing item classification")
4. Update original source document with correct information
5. Resubmit transaction from Batch Pool

---

## 🚀 **LHDN Submission and Verification**

### **Internal Submission Queue - Final Gateway**

The **Internal Submission Queue** is the final stage before LHDN transmission.

**Submission Flow:**
- **Arrival**: Transactions arrive via manual submission or automated processing
- **Success**: Transaction removed and transferred to **Internal Submission History**
- **Failure**: Remains in queue with "submission failed" status

**Error Resolution:**
- Click failed transaction → Navigate to **from lhdn** tab
- Review specific LHDN error message (e.g., "CD required" = missing buyer's city)
- Correct data in original source document and resubmit

### **To IRB E-Invoice - Monitoring Dashboard**

The **To IRB E-Invoice** menu provides central dashboard for monitoring submissions and post-submission actions within the critical **72-hour window**.

{{< cards >}}
  {{< card title="📊 View Submission Status" subtitle="Real-time status monitoring. `in queue` = not sent, `submitted` = sent to LHDN" >}}
  {{< card title="📧 Send Buyer Notification" subtitle="Email e-invoice to buyer via notification section" >}}
  {{< card title="📄 Export E-Invoice" subtitle="Download PDF copy of official e-invoice" >}}
  {{< card title="🔄 Request Rejection" subtitle="Initiate rejection request for validated e-invoices only" >}}
{{< /cards >}}

### **Internal Submission History - Permanent Archive**

The **Internal Submission History** serves as the official archive for all successfully validated transactions.

**Validation Status Indicators:**
- **Document Accepted**: Initial acceptance, pending full LHDN validation
- **Document is Valid**: Confirmed LHDN validation - view **from lhdn** tab for detailed response

---

## ⚠️ **Post-Validation: Rejection and Cancellation**

### **72-Hour Rule for Rejection Requests**

{{< callout type="warning" >}}
**⏰ Critical Time Limit**
Rejection requests must be initiated within **72 hours** of LHDN validation. System automatically blocks cancellations after this window expires.
{{< /callout >}}

**Request Sources:**
- Internal staff via system interface
- Customers via customer portal
- All requests appear in **Rejection Request** menu under **Cancellation** tab

**Applicable Documents:**
- Sales Invoices, Credit Notes, Debit Notes, Sales Credit Notes
- **Not applicable**: Self-billed and consolidated e-invoices

### **Processing Logic Options**

When approving rejection requests, choose from three processing methods:

{{< cards >}}
  {{< card title="1️⃣ Regenerate New E-Invoice" subtitle="**Action**: Cancel current e-invoice and auto-create new one\n**Impact**: Original document unchanged\n**Use**: Minor error corrections" >}}
  {{< card title="2️⃣ Void Original Document" subtitle="**Action**: Cancel e-invoice and void source document\n**Impact**: **Irreversible** - new document required\n**Use**: Major corrections requiring restart" >}}
  {{< card title="3️⃣ New Reversal Document" subtitle="**Action**: Create reversal document instead of cancellation\n**Impact**: Generates offsetting document (e.g., Credit Note for Invoice)\n**Use**: Maintain audit trail while correcting" >}}
{{< /cards >}}

---

## 🔧 **Troubleshooting Common Issues**

### **Resolving LHDN Submission Failures**

Submission failures are normal and provide direct LHDN feedback for quick resolution.

**Resolution Process:**
1. **Identify Failure**: Navigate to **Internal Submission Queue** → Find `submission failed` transaction
2. **Diagnose Error**: Click transaction → Go to **from lhdn** tab → Read specific LHDN error
3. **Correct Data**: Fix missing/invalid data in original source document
4. **Resubmit**: Process corrected transaction through submission queue

**Common Error Examples:**
- "CD is required" → Missing buyer's city
- "Missing TIN" → Incomplete taxpayer identification
- "Invalid format" → Data format validation issues

### Error Code Matrix and Quick Fixes

| Message / Code | What it means | Where to fix | Quick fix |
|---|---|---|---|
| "CD is required" | Buyer city missing | Customer → Address | Add City, Save, Resubmit |
| Missing TIN | Taxpayer ID not provided | Customer/Supplier → Tax | Enter TIN (e.g., `C1234567890`) |
| Invalid ID Type | Wrong ID type (BRN/NRIC/Passport) | Customer/Supplier → Identity | Set correct ID Type |
| Currency not supported | Unsupported/incorrect currency | Organization/Document → Currency | Use supported currency, ensure forex rate recorded |
| Amount rounding mismatch | Totals don’t match line sums | Lines Tab / Tax calc | Correct decimals and round rule, re-save |
| Invalid UOM | Unit of measure not valid | Doc Item Maintenance → UOM | Use valid UOM (e.g., `PCS`, `KG`) |
| Tax code mismatch | Wrong SST/Tax mapping | Doc Item Maintenance → Tax | Map to correct Tax Type Code |
| Duplicate document number | Existing invoice number reused | Numbering / Source doc | Use unique number, verify history |
| Document not FINAL | Submission from draft status | Source document | Click `FINAL` then submit |
| Self-billed flag missing | Supplier not marked self‑billed | Supplier → Flags | Set `E‑invoice Self‑Billed = TRUE` |
| Invalid email/contact | Buyer contact missing/invalid | Customer → Contact | Add valid email and phone |
| Credentials/Intermediary not set | MyInvois not configured | MyInvois Portal Setup | Set intermediary, complete registration |
| 429 Too Many Requests | Rate limit exceeded | Submission Processor | Retry with backoff; stagger batches |
| Network/Timeout | Connectivity issue | Infra / Endpoint | Check network, retry submission |

{{< callout type="info" >}}
Rapid resolution steps:
- Open `Internal Submission Queue` → pick `submission failed`
- Read LHDN error in `from lhdn` tab
- Fix at the master/source document
- `Save` and `Resubmit` via queue or Batch Pool
{{< /callout >}}

---

## 📚 **Complete Setup and Configuration Guide**

### **1. MyInvois Portal Configuration**

**Environment URLs:**
- **Sandbox**: https://preprod-mytax.hasil.gov.my/
- **Production**: https://mytax.hasil.gov.my/

**Setup Requirements:**
- Set Bigledger as "Intermediary" for both environments
- Complete digital certificate registration process
- Configure company and representative access

### **2. Master Data Configuration**

#### **Organization Applet**
Configure company profiles with:
- Branch information
- Business Registration Numbers (BRN)
- Tax Identification Number (TIN)
- Business Activity Description (MSIC code)

#### **Customer Maintenance**
**Mandatory E-Invoice Fields:**
- Buyer's ID Type and Registration Number
- Buyer's TIN (Tax Identification Number)
- Contact Number and Email
- MSIC Code and Complete Address

#### **Supplier Maintenance**
**Self-Billed E-Invoice Requirements:**
- Enable "E-invoice Self-Billed" = TRUE
- Supplier's ID Type and Registration Number
- Supplier's TIN, Contact Number, Email
- MSIC Code and Complete Address

#### **Document Item Maintenance**
Configure item classifications:
- Item Classification Description
- E-invoice Tax Type Code
- E-invoice Unit of Measure (UOM)

### Field Mapping Reference (What to fill, Where to fill)

| Scenario | Field | Where to set | Example |
|---|---|---|---|
| B2B (Individual) | Buyer ID Type | Customer → Identity | `BRN` / `NRIC` / `Passport` |
| B2B (Individual) | Buyer Registration/ID | Customer → Identity | `1234567890` |
| B2B (Individual) | Buyer TIN | Customer → Tax | `C1234567890` |
| B2B/B2C | Buyer Email | Customer → Contact | `buyer@company.com` |
| B2B/B2C | Buyer Address | Customer → Address | Street, City, Postcode, Country |
| Self‑Billed | E‑invoice Self‑Billed | Supplier → Flags | `TRUE` |
| Self‑Billed | Supplier TIN | Supplier → Tax | `C0987654321` |
| All | Item Tax Type Code | Doc Item Maintenance → Tax | `SST-STD` |
| All | Item UOM | Doc Item Maintenance → UOM | `PCS`, `KG` |

{{< callout type="info" >}}
Tips:
- For exports, ensure currency is set from Customer and forex rate is recorded for historical transactions.
- Always keep MSIC updated for Organization and Entities.
{{< /callout >}}

---

## 📝 **Document Creation Workflow**

### **Transaction Processing Steps**

#### **Main Tab Configuration**
- Select company, branch, and location
- Configure currency (based on customer settings for exports)
- Set forex rates for historical transactions

#### **Account Tab Setup**
- Choose Entity ID based on applet and document type
- Search customer by phone, name, or IC number
- Verify auto-filled customer details
- Complete billing address information

#### **Lines Tab Entry**
- Search and select items from catalog
- Configure pricing scheme and UOM
- Apply appropriate SST tax codes
- Add line items to transaction

#### **Finalization Process**
1. **Save**: Create draft document with all entered data
2. **Review**: Verify all mandatory fields are complete
3. **Finalize**: Click "FINAL" to lock document
4. **Generate**: System creates printable version with codes

---

## 🔄 **Submission Process Management**

### **Queue-Based Processing System**

#### **Posting Queue Operations**
- **Auto-processing**: Every 15-20 minutes
- **Status Indicators**: PROCESSED (success) / UNPROCESSED (failure)
- **Manual submission**: Select invoices and click "Submit"

#### **Batch Pool Scenarios**

**Auto Consolidated Submission:**
- System submits all as consolidated e-invoice
- Processes via E_INVOICE_BATCH_PROCESSING_CYCLE_RUN_PROCESSOR
- Submits next month for previous month's transactions

**Manual Consolidated Submission:**
- User selects specific transactions
- Processes immediately without monthly waiting
- Ideal for urgent consolidation needs

**Individual E-invoice Submission:**
- Updates entity details for specific transactions
- Submits as individual after corrections
- Provides immediate validation feedback

#### **Specialized Pools**

**Individual Pool:**
- Documents with einvoice submission type = INDIVIDUAL
- Missing LHDN mandatory fields
- Resolution: Fix customer data → "Save And Resubmit"

**Single General Pool:**
- Documents with einvoice submission type = SINGLE-GENERAL
- High probability of missing customer data (TIN, ID, address)
- Resolution: Fix data → "Save And Resubmit" → Consolidated if needed

---

## 📅 Month-End Closing & Consolidation Checklist

{{< callout type="tip" >}}
Target completion by the 7th of the following month. Use auto consolidated submission if enabled; otherwise run manual batch.
{{< /callout >}}

- D0–D3: Finalize all documents; clear `Posting Queue` validation errors
- D4: Review `Batch Pool` → resolve incomplete records and confirm consolidation scope
- D5–D6: Run consolidated submission (auto processor or manual batch)
- D7: Verify in `Internal Submission History` → `Document is Valid` for all

Navigation
- Create/Finalize → `Sales/Purchase Applet`
- Validate/Submit → `Posting Queue` → `Submit`
- Consolidate → `Batch Pool` → `Consolidated Submission`
- Monitor/Act → `To IRB E-Invoice` and `Internal Submission History`

Artifacts to generate
- Consolidation summary (CSV)
- Validation status report
- Exceptions log (failed submissions and unresolved validation)

Roles & ownership
- Accounts Receivable → Individual submissions
- Finance Manager → Consolidation, verification and KPIs
- Auditor → History export and evidence archive

KPIs
- Success rate ≥ 98%
- Mean time to validation ≤ 2 hours
- Rejection rate ≤ 1%

---

## 📋 **Reconciliation and Cancellation Management**

### **Purchase Document Reconciliation**

**Matching Criteria:**
- Self-billed = FALSE, null, or empty
- Supplier einvoice_tax_id_no is not NULL or empty

**Process Flow:**
- System extracts from Peppol Incoming Documents
- Processes email notifications via OCR
- Provides auto/manual matching with sales transactions

### **Cancellation Request Management**

**Request Sources:**
- Customer Portal submissions
- MyInvois Portal requests
- Unified Contact Centre (UCC) tickets

**Processing Requirements:**
- Must process within 72-hour validation window
- System provides request approval/rejection workflow
- Tracks all cancellation activities in audit log

---

## 🧪 **Comprehensive Test Scenarios**

### **Core Functionality Tests**

| Test Case | Description | Expected Result |
|------------|-------------|-----------------|
| **TC001** - Create Sales Invoice | Complete mandatory fields in Main/Account/Lines tabs | Invoice saved in DRAFT status |
| **TC002** - Finalize Invoice | Click "FINAL" on draft invoice | Document locked, printable version available |
| **TC003** - Submit to IRB | Select invoice in Posting Queue → "Submit" | Status updates to "PROCESSED" |
| **TC004** - Self-Billed Workflow | Enable self-billing → Create invoice | Self-billed invoices show "Yes" label |
| **TC005** - Consolidated Submission | Select multiple transactions → Submit batch | Consolidated e-invoice processed successfully |
| **TC006** - Purchase Reconciliation | Use auto/manual match on purchase docs | Documents reconciled with status confirmation |
| **TC007** - Cancellation Process | Process cancellation request within 72hrs | Request approved, cancellation completed |

### **Advanced Validation Tests**

| Test Case | Focus Area | Validation Criteria |
|------------|------------|---------------------|
| **TC008** - Invoice Validation | Posting Queue accuracy | All invoices have correct details before progression |
| **TC009** - Failed Submission Recovery | Error handling workflow | Failed submissions successfully reprocessed |
| **TC010** - QR Code Generation | Validation output | QR codes and URLs generated after IRB submission |
| **TC011** - Audit History | Traceability requirements | Complete submission history with timestamps |

---

## 📊 **Performance Metrics and Monitoring**

### **Key Performance Indicators**
- **Submission Success Rate**: Percentage of successful LHDN submissions
- **Processing Time**: Average time from creation to validation
- **Error Resolution Time**: Average time to resolve submission failures
- **Rejection Rate**: Percentage of documents requiring cancellation/rejection

### **System Health Monitoring**
- Queue processing status and backlog monitoring
- Automated submission processor performance
- Integration endpoint availability with LHDN systems
- Document validation pipeline efficiency

---

## 🔗 **Integration Points**

### **External System Connections**
- **LHDN MyInvois Portal**: Primary submission endpoint
- **Peppol Network**: Document exchange for reconciliation
- **Email Systems**: Notification and OCR processing
- **Customer Portal**: Self-service access for document viewing

### **Internal System Dependencies**
- **Organization Management**: Company and branch configuration
- **Customer/Supplier Master**: Entity data validation
- **Item Master**: Product and service classification
- **Tax Configuration**: SST and other tax code mappings

---

## 📚 **Additional Resources**

### **Quick Reference Guides**
- [E-Invoice Format Requirements](#format-requirements)
- [Mandatory Field Checklist](#mandatory-fields)
- [Error Code Reference](#error-codes)
- [Submission Timeline Guidelines](#timelines)

### **Support and Documentation**
- **Technical Support**: Contact information for system issues
- **LHDN Guidelines**: Official regulatory documentation
- **Training Materials**: Video tutorials and user guides
- **API Documentation**: Developer integration resources

## ❓ FAQs
- Which document type for walk‑in retail? Use `Cash Bill` with `Single‑General`. If buyer later requests named invoice, update customer details and resubmit as `Individual` within 72 hours.
- Individual vs Consolidated — when? `Individual` for B2B named invoices; `Consolidated` for aggregated retail (Single‑General) submitted monthly.
- Where do I get the QR code? Monitor in `To IRB E‑Invoice`; once `Document is Valid`, open the transaction to view QR code and IRBM Reference.
- What is the 72‑hour window? The period after validation to request rejection/cancellation. Not extendable.
- Can I cancel consolidated e‑invoices? Not via rejection workflow. Use reversal/adjustment documents.
- How do I submit self‑billed purchases? Flag supplier `E‑invoice Self‑Billed = TRUE`, create purchase doc, finalize, submit via queue, monitor in `To IRB E‑Invoice`/History.
- How to convert a walk‑in sale to named invoice? Update customer identity/tax in source doc, mark `Individual`, resubmit; keep original Cash Bill as source.
- How to correct a validated invoice? Process a rejection request and choose logic: Regenerate, Void original, or New reversal document.
- Where is the official archive? `Internal Submission History` with status `Document is Valid`, validation URL and QR code.
- How to automate monthly consolidation? Enable auto consolidated submission (or run manual batch) and verify by the 7th.

## 📖 Glossary
- `BRN`: Business Registration Number
- `TIN`: Tax Identification Number
- `MSIC`: Malaysia Standard Industrial Classification
- `SST`: Sales and Services Tax
- `UOM`: Unit of Measure (e.g., PCS, KG)
- `QR code`: Machine-readable validation token generated by LHDN
- `IRBM Reference Number`: Official identifier returned upon validation
- `Individual E‑Invoice`: Named invoice validated per transaction
- `Consolidated E‑Invoice`: Aggregated transactions (often retail) submitted monthly
- `Posting Queue`: Pre‑submission validation queue
- `Batch Pool`: Staging for consolidated or incomplete transactions
- `Internal Submission Queue`: Final gateway for LHDN submission
- `Internal Submission History`: Permanent archive of validated documents
- `To IRB E‑Invoice`: Monitoring and post‑submission actions dashboard
- `Rejection Request`: Time‑bound cancellation flow (within 72 hours)

---

*This documentation is continuously updated to reflect the latest LHDN requirements and system enhancements. For the most current information, always refer to the latest version available in your system.*

---

{{< details title="Legacy: Original Outline (collapsed)" >}}

## Complete E-Invoice Workflow Guide

### 1. Introduction to E-Invoicing

#### Overview of E-Invoice
E-invoicing is the digital representation of transactions between suppliers and buyers. It replaces traditional paper or electronic documents. The IRBM will adopt the Continuous Transaction Control (CTC) model for near real-time validation through the MyInvois Portal or API. The e-Invoice will enable instant or near-instant validation and storage of transactions, catering to Business-to-Business (B2B), Business-to-Consumer (B2C), and Business-to-Government (B2G) transactions.

#### E-invoicing Format
E-invoices require a standardized format and a system that can process them.

**Accepted Formats:**
- XML
- JSON

**Unaccepted Formats:**
- PDF
- DOC
- JPG
- Other general formats such as email, etc.

#### E-invoicing Documents and Types
The following types of e-invoices must be issued in electronic format:
- Invoice
- Credit/Debit Note
- Refund Note

### 2. My Invoice Portal Setup

Completing this configuration makes it possible to submit documents using our Applets.

#### MyInvois Portal Configuration
- Need to set Bigledger as "Intermediary" for both Sandbox and Production Environment (in the MyInvois Portal)
- **Sandbox Portal:** https://preprod-mytax.hasil.gov.my/
- **Production Portal:** https://mytax.hasil.gov.my/

**Setup Process:**
1. Select your identity type from the drop-down menu, usually the IC number.
2. For first-time users, the portal will request a digital certificate, which will be sent to your registered email address.
3. Once you receive the PIN via email, use it to log in and proceed accordingly.

#### Submitting a New Company
Once you log in to the MyInvois portal for the first time, you will not have any company registered under your profile. To add a company:

1. Go to the Profile icon from the main page.
2. Navigate to the Role Application tab.
3. Fill in the following details:
   - Select Role Type: Choose New Application.
   - Select Application Type: Choose the Director of the Company
   - Enter the TIN Number: Input the company's Tax Identification Number.
   - Upload the necessary supporting documents.
   - Acknowledge the box and Click Submit to complete the process.

**Important Note:** If a tenant wants to use N companies (bl_fi_mst_comp) for e-invoice, they need N taxpayer profiles on the portal.

#### Adding Representative
After successfully submitting the company, follow these steps to add representatives:

1. Go back to the Tax Main Page.
2. Under the Individual section, select your newly created company from the list.
3. Navigate to the Profile icon once again.
4. Select the Appointment of Representative tab.
5. From here, you can add staff members by:
   - Selecting the representative's ID number or Passport number.
   - Entering their name and IC number.
   - Click Submit to complete the process.

#### Bigledger Integration
- Add Bigledger as the intermediary and grant all permissions for full access.
- This setup allows our digital certificate to submit documents to LHDN.
- Validate company TIN using the organization applet, and select the LHDN Environment, which will do the company-to-intermediary linking using bl_fi_mst_comp_einvoice_intermediary_system.

### 3. Master Applets Configuration

#### Organization Applet
The Organization Applet is essential for managing and configuring key details for companies and their branches. It streamlines the setup and maintenance of company profiles, including:
- Branch information
- Business registration numbers (BRN)
- Tax Identification Number (TIN)
- Business Activity Description (MSIC code)

#### Customer Maintenance Applet
This applet plays a critical role in efficiently managing customer information. **Mandatory customer information required for E-invoice:**
- Buyer's ID Type
- Buyer's Reg./ID/Passport
- Buyer's TIN
- Buyer's Contact Number
- Buyer's Email
- MSIC Code
- Address

#### Supplier Maintenance Applet
Vital tool for managing supplier information. **Mandatory information required for self-billed E-invoice:**
- E-invoice Self Billed set to TRUE
- Supplier's ID Type
- Supplier's Reg./ID/Passport Number
- Supplier's TIN
- Contact Number
- Email
- MSIC code
- Address

#### Doc Item Maintenance Applet
Essential for managing and configuring document types and item details:
- Item Classification Description
- E-invoice Tax Type Code
- E-invoice UOM

### 4. E-Invoice Creation Process

#### Available Document Types
Once your company, customer, and supplier profiles are created, you can issue various document types:

**Sales Documents:**
- POS General
- Internal Sales Order
- Internal Sales Return
- Internal Sales Debit Note
- Internal Sales Credit Note
- Internal Sales Refund Note

**Purchase Documents:**
- Internal Purchase Invoice
- Internal Purchase Return
- Internal Purchase Debit Note
- Internal Purchase Credit Note
- Purchase Refund Note

#### Sales/Purchase Transaction Workflow

**Main Tab Requirements:**
- Select your company, branch, and location.
- Currency: When performing an export transaction, the currency is based on the customer setting.
- Forex history: For historical transactions configured under the Forex applet, you can fetch the live rate from the applet.

**Account Tab Requirements:**
- Choose the Entity ID: The entity depends on which applet the user is in and on the document type.
- Search for the customer by phone number, customer name, or IC number.
- Once you choose the customer entity ID, the details will be auto-filled.
- Bill to: Ensure the billing address information is complete.

**Lines Tab Requirements:**
- Search for the item you want to add.
- Select your item from the list.
- Specify the pricing scheme, experience UOM, and SST code.
- Click 'Add' once you finish.

**Save and Finalize Process:**
1. After completing the required fields in the three necessary tabs click 'SAVE' to save your changes.
2. The document will initially be in DRAFT status.
3. To finalize it, check the box and click the "FINAL" button.
4. After clicking 'Final', a printable version will be available for download.
5. The Branch and Company Code will be generated (replacing NAN).

#### Self-Billed Workflow

To enable a Supplier to have self-billed E-Invoice:

1. Create a new Supplier or click into an existing one using the Supplier Maintenance Applet.
2. Navigate to the 'E-Invoice' tab.
3. Look for the field called 'E-Invoice Self-Billed', select 'True'.
4. Click on 'Save'.

**Manual Self-Bill Setting:**
1. Look for the invoice you wish to make self-billed.
2. Tick the checkbox on the left.
3. Click on the 'Self-Billed' button.
4. The Self-Billed column will be labeled as 'Yes'.

**Available in these applets:**
- Purchase Credit Note Applet
- Purchase Debit Note Applet
- Purchase Return Applet
- Refund Note Applet

### 5. Detailed E-Invoice Submission Process

#### Posting Queue Operations
When the applet initially opens, the 'Posting Queue' listing is displayed. Key features:

- All transactions are automatically processed every 15-20 minutes.
- PROCESSED indicates a successful update.
- UNPROCESSED means the update was not successful.
- Manual submission: Check the boxes of invoices you wish to submit to IRB, then click 'Submit'.

#### Batch Pool Management

The Batch Pool handles multiple scenarios:

**Scenario i) Auto Consolidated Submission:**
- The system submits all transactions as a consolidated E-invoice.
- E_INVOICE_BATCH_PROCESSING_CYCLE_RUN_PROCESSOR takes all "UNPROCESSED" batch pools.
- Consolidated submission occurs in the next month for previous month's transactions.

**Scenario ii) Manual Consolidated Submission:**
- Users can select certain transactions and process/submit those as consolidated immediately.
- No need to wait for the end of the month.

**Scenario iii) Individual E-invoice Submission:**
- Users can update Entity details for any transaction.
- Submit as an Individual E-invoice after corrections.

#### Individual Pool

**When documents go to Individual Pool:**
- When SINV, SCN etc. have einvoice submission type set to INDIVIDUAL.
- Documents don't fulfill LHDN mandatory fields.

**Resolution:**
1. Fix customer data with missing fields.
2. Do "Save And Resubmit" to have individual einvoice.
3. If customer details cannot be found, move to batch pool for consolidated submission.

#### Single General Pool

**When documents go to Single General Pool:**
- When einvoice submission type is set to SINGLE-GENERAL.
- High chance that customer data (TIN, ID Type, ID Value, address) cannot be retrieved.

**Resolution:**
1. Fix customer data with missing fields.
2. Do "Save And Resubmit" for individual einvoice.
3. If individual einvoice fails, do "Resubmit as new Einvoice" for consolidated submission.

#### Internal Submission Process

**Queue Management:**
- All transactions come to Queue first after processing.
- Waiting for processor to submit to LHDN (Individual or Consolidated).

**History Tracking:**
- After submitting to LHDN, transactions move to History.
- Submission status shows as "SUBMITTED".

**Validation Queue:**
- System processes transactions and generates Validation URL and QR code.

**Consolidated Submission Queue:**
- Contains transactions processed by E_INVOICE_BATCH_PROCESSING_CYCLE_RUN_PROCESSOR.
- Failed submissions are handled by "EInvoiceSubmissionFailureProcessor" for single general submission.

### 6. Reconciliation and Cancellation

#### Purchase Reconciliation
This Menu allows users to "Reconcile" Purchase Documents:

**Matching Criteria:**
- Self-billed is FALSE, null, NOT SPECIFIED or empty string.
- Supplier einvoice_tax_id_no is not NULL or empty.

**Process:**
- System extracts from Peppol Incoming Doc, Email Notification using OCR.
- Users can Match with Sales Transactions (Auto or Manual Match Option).

#### Cancellation Management
This Menu allows users to view and process E-invoice cancellation requests:

**Request Sources:**
- Customer Portal
- MyInvois Portal
- Unified Contact Centre (UCC)

**Processing Options:**
- Users can select requests and process accordingly.
- Must be processed within 72-hour window.

### 7. Test Cases and Validation

#### Core Test Scenarios

**TC001 - Create and Save Sales Invoice:**
- **Precondition:** Customer profiles are preconfigured.
- **Steps:** Open Sales Invoice Applet, complete mandatory fields in Main/Account/Lines tabs, save invoice.
- **Expected:** Invoice saved in draft status with all required fields validated.

**TC002 - Finalize Sales Invoice:**
- **Precondition:** A draft sales invoice exists.
- **Steps:** Open draft invoice, click "FINAL" button, confirm finalization.
- **Expected:** Invoice finalized, becomes non-editable, printable version available.

**TC003 - Submit E-Invoice to IRB:**
- **Precondition:** A finalized sales invoice exists.
- **Steps:** Navigate to Posting Queue, select invoice, click "Submit".
- **Expected:** Invoice successfully submitted to IRB, status updates to "PROCESSED".

**TC004 - Self-Billed E-Invoice Workflow:**
- **Precondition:** Supplier configured for self-billing.
- **Steps:** Enable "E-Invoice Self-Billed", create self-billed invoice, review Posting Queue.
- **Expected:** Self-billed invoices appear in Posting Queue with "Yes" label.

**TC005 - Consolidated E-Invoices:**
- **Precondition:** Multiple transactions exist in Batch Pool.
- **Steps:** Navigate to Batch Pool, select transactions for consolidation, submit batch.
- **Expected:** Consolidated E-Invoice successfully submitted, status updates to "PROCESSED".

**TC006 - Purchase Document Reconciliation:**
- **Precondition:** Purchase documents with mismatched details exist.
- **Steps:** Navigate to Purchase Doc Matching Queue, use auto/manual match option, reconcile documents.
- **Expected:** Documents reconciled, status updated to indicate successful matching.

**TC007 - E-Invoice Cancellation:**
- **Precondition:** Cancellation requests exist in system.
- **Steps:** Navigate to Cancellation menu, select request, process cancellation.
- **Expected:** Cancellation request processed successfully, status updated.

#### Advanced Test Scenarios

**TC008 - Invoice Validation in Posting Queue:**
- Validate all invoices have correct details before moving to next stage.
- Resolve any validation errors that appear.

**TC009 - Failed Submission Processing:**
- Navigate to "Submission Failure" queue.
- Reprocess failed submissions and verify successful resubmission.

**TC010 - QR Code and Validation URL Generation:**
- Submit invoice successfully to IRB.
- Navigate to Validation Queue and verify QR code and URL generation.

**TC011 - Audit History Verification:**
- Open "History" tab in Internal Submission.
- Verify submission history displays timestamps, status, and traceability details.



### **Sales Documents**

{{< cards >}}
  {{< card title="Cash Bills" >}}
  {{< card title="Sales Invoices" >}}
  {{< card title="Sales Credit Notes" >}}
  {{< card title="Sales Debit Notes" >}}
  {{< card title="Sales Return" >}}
  {{< card title="Sales Refund Notes" >}}
{{< /cards >}}

---

### **Self-Billed Purchase Documents**

{{< cards >}}
  {{< card title="Self-Billed Purchase Invoices" >}}
  {{< card title="Self-Billed Purchase Debit Notes" >}}
  {{< card title="Self-Billed Purchase Credit Notes" >}}
  {{< card title="Self-Billed Purchase Return" >}}
{{< /cards >}}



---

## Key Process Stages Overview

The e-invoice lifecycle is structured across several distinct stages:

{{< steps >}}
### Pre-Submission
**Posting Queue & Batch Pool**
Collection and validation point for all transactions.
---
### LHDN Submission
**Internal Submission Queue & To IRB E-Invoice**
Final gateway for transmitting to LHDN and monitoring status.
---
### Post-Submission
**Internal Submission History**
Permanent archive for all successfully validated e-invoices.
---
### Rejection & Cancellation
**Rejection Request & Cancellation Queue**
Manages time-sensitive rejections and cancellations.
{{< /steps >}}

## Pre-Submission Transaction Management

{{< tabs items="Posting Queue, Batch Pool" >}}
{{< tab >}}
### The Posting Queue - The Initial Checkpoint

The **Posting Queue** is the first critical control point where all finalized transactions from various source applets (e.g., POS applet, sales applet) initially appear. Its primary function is to verify data integrity and ensure all mandatory fields are present before submission to LHDN.

**Core Functions:**

- **Transaction Aggregation**: Consolidates all finalized documents into a single, manageable list.
- **Verification**: The system verifies that mandatory fields required for LHDN submission have been populated.
- **Manual Submission**: Users can manually select a transaction and submit it directly to the Internal Submission Queue or move it to the Batch Pool.
- **Automated Submission**: The system can be configured to automatically process and submit valid transactions, typically every 15 to 20 minutes.
- **Reviewing Details**: Click on any transaction to review comprehensive details, including the core document information, buyer details, and all associated line items.

Transactions designated for consolidated submission or that fail initial validation are moved to the **Batch Pool**.
{{< /tab >}}
{{< tab >}}
### The Batch Pool - Managing Consolidated & Incomplete Transactions

The **Batch Pool** is the primary staging area for two key scenarios:

1.  Managing documents for a planned **consolidated submission**.
2.  Holding transactions that have **failed initial validation** due to missing information.

#### Consolidated Submissions

The Batch Pool stores documents designated for consolidated e-invoice submission. These must be submitted to LHDN before the 7th of the following month. If a customer requests an individual e-invoice, that transaction can be removed from the pool and processed for immediate submission.

#### Error Handling

The Batch Pool also holds documents with missing mandatory fields. To correct these errors:

1.  Click on a document in the Batch Pool to open its details.
2.  Scroll to the **Validation Error** section at the bottom.
3.  The system will display a specific error message (e.g., "missing some item classification item text type").
4.  Navigate back to the original source document, update it with the correct information, and then resubmit the transaction from the Batch Pool.

Once a transaction is validated, it proceeds to the **Internal Submission Queue**.
{{< /tab >}}
{{< /tabs >}}

## LHDN Submission and Verification

{{< tabs items="Submission Queue, Monitoring, History" >}}
{{< tab >}}
### The Internal Submission Queue - The Final Gateway to LHDN

The **Internal Submission Queue** is the final stage before a transaction is transmitted to the LHDN/IRB system.

-   **Submission Methods**: Transactions arrive here either through manual submission or the system's automated process.
-   **Successful Submission**: Upon success, the transaction is removed from this queue and transferred to the **Internal Submission History**.
-   **Failed Submission**: If LHDN rejects a submission, the transaction remains in this queue with a "submission failed" status. To resolve this, click the transaction and navigate to the **from lhdn** tab to see the specific error message from LHDN (e.g., "CD is required," which indicates the buyer's city is missing).

All transactions being submitted can be monitored in the **To IRB E-Invoice** menu.
{{< /tab >}}
{{< tab >}}
### Monitoring in the "To IRB E-Invoice" Menu

The **To IRB E-Invoice** menu is the central dashboard for monitoring active submissions and performing immediate post-submission actions, especially within the critical **72-hour window** following LHDN validation.

{{< cards >}}
  {{< card title="View Submission Status" subtitle="Users can view the real-time status. `in queue` indicates the transaction is not yet sent to LHDN, while `submitted` confirms it has been sent." >}}
  {{< card title="Send Buyer Notification" subtitle="To email the e-invoice to the buyer, click into a transaction, navigate to the notification section, and click **send**." >}}
  {{< card title="Export E-Invoice" subtitle="Download a PDF copy of the official e-invoice at any time by clicking the **export** button." >}}
  {{< card title="Request Rejection" subtitle="Initiate a rejection request directly from this screen. This is only available for successfully validated e-invoices." >}}
{{< /cards >}}
{{< /tab >}}
{{< tab >}}
### Reviewing in the Internal Submission History

The **Internal Submission History** is the official, permanent archive for all transactions successfully submitted to and validated by LHDN.

Users can verify the final validation status:

-   **Document Accepted**: Initial status indicating the submission is accepted by the system, pending full LHDN validation.
-   **Document is Valid**: Definitive confirmation that LHDN has validated the e-invoice. Click the transaction and view the **from lhdn** tab for the detailed validation response.
{{< /tab >}}
{{< /tabs >}}

## Post-Validation: Rejection and Cancellation

### Initiating a Rejection Request

The process for rejecting or canceling a validated e-invoice is highly time-sensitive.

{{< callout type="warning" >}}
**The 72-Hour Rule**
A rejection request must be initiated within **72 hours** of the e-invoice's validation by LHDN. The system automatically blocks any cancellation attempts after this window has expired.
{{< /callout >}}

**Key Rules:**

1.  **Request Origin**: Requests can be initiated by internal staff or customers (via the customer portal). All requests appear in the **Rejection Request** menu under the **Cancellation** tab.
2.  **Applicable Documents**: Cancellation can be requested for Sales Invoices, Credit Notes, Debit Notes, and Sales Credit Notes. Self-billed and consolidated e-invoices cannot be canceled this way.
3.  **Reviewing a Request**: Click on any request to view its details, the reason for cancellation, and a timer showing the remaining time to process it.

### Processing a Rejection Request

It is the user's responsibility to act on all rejection requests within the 72-hour window. When reviewing a request, a user can **approve**, **reject**, or place the request **on hold**.

If approved, select one of three **Processing Logic** options:

{{< cards >}}
  {{< card title="1. Regenerate new e-invoice" subtitle="**Action**: Cancels the current e-invoice with LHDN and automatically creates a new one for resubmission. **Impact**: The original source document is not modified. Ideal for correcting minor errors." >}}
  {{< card title="2. Void original document" subtitle="**Action**: Cancels the e-invoice and voids the original source document. **Impact**: **Irreversible**. A new source document must be created to restart the process." >}}
  {{< card title="3. New reversal document" subtitle="**Action**: Does not cancel the current e-invoice. Instead, it creates and submits a corresponding reversal document to neutralize the original. **Impact**: The system generates a reversal document (e.g., a Sales Invoice creates a Sales Credit Note)." >}}
{{< /cards >}}

Failures during cancellation are tracked in the **Cancellation Queue**.

## Troubleshooting Common Failures

### Resolving LHDN Submission Failures

Submission failures are a normal part of the process. The system provides direct feedback from LHDN to help resolve issues quickly.

1.  **Identify the Failure**: Navigate to the **Internal Submission Queue** and find the transaction marked `submission failed`.
2.  **Diagnose and Correct**: Click the transaction and go to the **from lhdn** tab. Read the specific error message from LHDN (e.g., "CD is required," means the buyer's city is missing). Correct the data in the original source document and resubmit.

{{< /details >}}
