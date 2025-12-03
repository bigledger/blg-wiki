---
title: "My E-invoice Admin Applet"
description: "A comprehensive step-by-step guide to creating, managing, and submitting electronic invoices for LHDN compliance using the My E-invoice Admin Applet."
tags:
- einvoice-module
- electronic-invoicing
- compliance
- digital-transformation
- regulatory
- user-guide
- lhdn
- myinvois
weight: 400
---

## **1. Introduction: What is the My E-Invoice Admin Applet?**

The **My E-Invoice Admin Applet** is your comprehensive digital command center for managing electronic invoices (e-invoices) in full compliance with the Lembaga Hasil Dalam Negeri (LHDN) of Malaysia's MyInvois system requirements. This powerful tool transforms the complex process of e-invoicing into a streamlined, automated workflow that handles everything from initial creation to final validation and archiving.

### **Why E-Invoicing Matters**

E-invoicing is now mandatory for all businesses in Malaysia under the MyInvois system. This digital transformation ensures:

*   **Real-time validation** of invoices by LHDN
*   **Immediate compliance verification** with tax regulations
*   **Automated fraud prevention** through digital signatures and QR codes
*   **Seamless integration** with your existing business processes
*   **Reduced processing time** from days to minutes

### **Who is this guide for?**

This comprehensive guide serves every stakeholder in your e-invoicing ecosystem:

*   **Accounts Receivable (B2B):** Perfect for issuing individual e-invoices to business customers with full validation tracking
*   **Counter Sales (B2C):** Ideal for managing walk-in customer transactions and monthly consolidated submissions
*   **Finance Managers:** Essential for overseeing the entire e-invoice workflow, monitoring key compliance metrics, and ensuring regulatory adherence
*   **Procurement Teams:** Streamlines self-billed e-invoice creation when suppliers don't issue E-invoices
*   **Auditors & Compliance Officers:** Provides complete traceability and evidence export capabilities for regulatory reviews

### **What can you do with the Applet?**

The My E-Invoice Admin Applet empowers you with comprehensive e-invoice management capabilities:

*   **Create and Submit:** Generate both individual and consolidated e-invoices for any transaction type with automated validation
*   **Manage and Review:** Monitor submission status in real-time with detailed progress indicators and error notifications
*   **Cancel and Reject:** Handle time-sensitive e-invoice cancellations and rejections within the critical 72-hour window
*   **Ensure Compliance:** Maintain full adherence to all LHDN requirements with built-in validation checks and automated error detection
*   **Archive and Export:** Access permanent digital records with QR codes, validation URLs, and complete audit trails

---

## **2. 🚦 Quick Start: Your First E-Invoice in 5 Steps**

Get up and running quickly with your first validated e-invoice for a B2B sale. This streamlined guide walks you through the essentials, assuming you have basic system access.

{{< callout type="tip" >}}
**Tip:** Prepare your master data in advance to avoid delays.
{{< /callout >}}

### **Prerequisites: What You Need Before Starting**

Before creating your first e-invoice, ensure these key elements are set up in your system. Missing information is the most common cause of validation errors.

*   **Customer Record (Use Customer Maintenance Applet to update):** Must include:
    *   `ID Type` (e.g., BRN, NRIC, Passport)
    *   `Registration/ID Number`
    *   `TIN` (Tax Identification Number)
    *   `Email Address` (for notifications)
    *   `Complete Address` (including city, state, postcode)

    ![Description](/images/einvoice-applet/customer-applet-1.png)

*   **Item Details (Use Doc Item Maintenance Applet to update > E-Invoice Tab):** Each item in the invoice needs:
    *   `CLASSIFICATION_CODE`
    *   `EINVOICE_TAXABLE_TYPE_CODE`
    *   `EINVOICE_UOM`

    ![Description](/images/einvoice-applet/doc-item-applet-1.png)

*   **Organization Profile (Use Organization Applet to update):** Your company's details should have:
    *   `TIN` (Tax Identification Number)
    *   `BRN` (Business Registration Number)
    *   `MSIC` (Malaysia Standard Industrial Classification code for business activity)
    *   `Company Address` (full address including Postal Code, City, State etc.)

    ![Description](/images/einvoice-applet/org-applet-1.png)


If any of these are missing, update them in the applets before proceeding.

### **Step-by-Step Instructions**

1.  **Create the Invoice:**
    *   Navigate to the **Sales Invoice Applet** in your akaun homepage.
    *   Click on `New Sales Invoice` to start a fresh document.
    *   Select the appropriate customer from your records.

2.  **Enter Invoice Details:**
    *   Fill in the **Main** tab with basic information like invoice date, due date, and reference numbers.
    *   In the **Account** tab, verify customer details and add any specific terms.
    *   Use the **Lines** tab to add items, quantities, prices, and confirm SST codes. Double-check calculations for accuracy.

3.  **Finalize the Document:**
    *   Click `Save` to store your changes.
    *   Then, click `FINAL` to lock the invoice – this step is crucial as only finalized documents can be submitted for e-invoicing.


    ![Description](/images/einvoice-applet/sales-invoice-finalization.png)

4.  **Submit the Invoice:**
    *   Switch to the **My E-invoice Admin Applet** and go to **Posting Queue**.
    *   Locate your invoice in the list.
    *   If the status is `PROCESSED` (meaning it passed initial validation), select it and click `Submit` to send to LHDN (this is for manual testing only, ideally this part will be done by our Cron Processors).
    *   If it's `UNPROCESSED`, click to open the invoice, review the listed **Validation Errors**, correct them in the source document, save changes, and refresh the queue.

    ![Description](/images/einvoice-applet/e-invoice-applet-posting-queue.png)

5.  **Monitor and Verify Submission:**
    *   Head to **To IRB E-Invoice** section to track progress.
    *   Watch the status update from `Document Accepted` (initial receipt) to `Document is Valid` (full LHDN approval).
    *   Once validated, open the invoice to access the generated **QR code** and **IRBM Reference Number**.

### **Confirmation of Success: How to Know It Worked**

*   Status in **Internal Submission History** shows `Document is Valid`.
*   An official **IRBM Reference Number** is assigned and visible.
*   A scannable **QR code** appears with a validation URL for verification.
*   You'll receive confirmation notifications via email or system alerts.

![Validated E-Invoice with QR Code](/images/einvoice-applet/validated-invoice-qr.png)
*Figure 3: Successfully validated e-invoice showing QR code and IRBM reference*

If you encounter issues, refer to the Troubleshooting section below.

---

## **3. 🔄 The E-Invoice Lifecycle: A Step-by-Step Overview**

Understanding the full lifecycle helps you navigate the system efficiently. The e-invoice process flows through four key stages, each with specific tools and queues in the applet. This structured approach ensures compliance and minimizes errors.

{{< tabs items="1. Pre-Submission,2. LHDN Submission,3. Post-Submission,4. Rejection & Cancellation" >}}
{{< tab >}}
### Preparation and Validation
**Key Tools: Posting Queue & Batch Pool**

This initial stage is where transactions are collected, checked for completeness, and prepared for submission. It's your opportunity to catch and fix errors before they reach LHDN.

- **What Happens Here:** Automatic validation scans for missing data, incorrect formats, or compliance issues.
- **Common Activities:** Reviewing unprocessed documents, fixing master data, and deciding between individual or consolidated submissions.
- **Tips:** Regularly check this queue to prevent backlogs.
{{< /tab >}}
{{< tab >}}
### Transmission and Monitoring
**Key Tools: Internal Submission Queue & To IRB E-Invoice**

This is the transmission phase where e-invoices are sent to LHDN's MyInvois system for official validation.

- **What Happens Here:** Documents are packaged, digitally signed, and submitted. Real-time status updates track progress.
- **Common Activities:** Monitoring for acceptance, handling initial rejections, and resubmitting corrected documents.
- **Tips:** Use filters to track high-priority submissions.
{{< /tab >}}
{{< tab >}}
### Archiving and Reporting
**Key Tools: Internal Submission History**

Once validated, e-invoices enter this permanent archive stage for record-keeping and auditing.

- **What Happens Here:** Storage of validated documents with QR codes, reference numbers, and full audit trails.
- **Common Activities:** Exporting PDFs, generating reports, and verifying compliance metrics.
- **Tips:** Set up automated backups for this archive.
{{< /tab >}}
{{< tab >}}
### Corrections and Adjustments
**Key Tools: Rejection Request & Cancellation Queue**

This stage handles post-validation changes within the 72-hour window.

- **What Happens Here:** Processing rejection requests, creating reversals, or voiding documents.
- **Common Activities:** Reviewing requests from staff or customers, choosing processing logic, and monitoring outcomes.
- **Tips:** Act quickly to stay within time limits.
{{< /tab >}}
{{< /tabs >}}

---

## **4. Submission Process Management**

The My E-Invoice Admin Applet employs an advanced queue-based system to handle e-invoice submissions with maximum efficiency and minimal errors. This section provides a detailed breakdown of how the various queues and pools interconnect, complete with best practices and troubleshooting tips to ensure smooth operations.

### **Understanding the Queue-Based Processing System**

At the heart of the applet is a multi-stage queue system that automates much of the submission process while allowing manual intervention when needed. This setup prevents bottlenecks and ensures compliance by validating data at each step.

#### **Posting Queue Operations: Your Entry Point**
The **Posting Queue** serves as the initial gateway for all newly created invoices, acting as a validation checkpoint before anything reaches LHDN.

![Posting Queue Interface](/images/einvoice-applet/posting-queue.png)
*Figure 1: Posting Queue - Your entry point for e-invoice submissions*

*   **Auto-Processing Mechanism:** The system runs automatic processing cycles every 15-20 minutes, scanning for new documents and validating them against LHDN requirements.
*   **Key Status Indicators:**
    *   `PROCESSED`: Indicates the document has passed all internal checks and is submission-ready. No action needed unless you want to submit immediately.
    *   `UNPROCESSED`: Signals validation errors. Review the error details to identify issues like missing fields or invalid data.
*   **Manual Submission Options:** For time-sensitive `PROCESSED` invoices, select them individually or in batches and click **Submit** to send directly to LHDN.
*   **Best Practices:** Set up notifications for unprocessed items to address errors promptly. Regularly clear this queue to maintain workflow efficiency.

#### **Batch Pool Scenarios: Handling Consolidated and Special Cases**
The **Batch Pool** functions as a flexible staging area for documents requiring grouping or additional processing, particularly useful for high-volume operations.

![Batch Pool Management](/images/einvoice-applet/batch-pool.png)
*Figure 2: Batch Pool - Managing consolidated submissions*

*   **Auto Consolidated Submission:**
    *   The system intelligently groups eligible transactions (e.g., B2C sales) into a single consolidated e-invoice.
    *   Powered by the `E_INVOICE_BATCH_PROCESSING_CYCLE_RUN_PROCESSOR` automation.
    *   Standard timeline: All transactions from one month are automatically consolidated and submitted by the 7th of the next month to meet LHDN deadlines.
    *   Benefits: Reduces submission volume and simplifies monthly reporting.
*   **Manual Consolidated Submission:**
    *   Select specific transactions from the pool and consolidate them on-demand.
    *   Perfect for scenarios like end-of-day closings or urgent regulatory needs outside the automated cycle.
    *   Steps: Filter transactions, select, and click **Consolidate Now**.
*   **Individual E-Invoice Submission from Batch:**
    *   For cases where a batched transaction needs individual treatment (e.g., customer requests a named invoice), update the entity details in the customer record.
    *   The system automatically reclassifies and submits it as a standalone e-invoice with instant validation feedback.
    *   Tip: This is common for upgrading B2C to B2B invoices within the 72-hour window.

### **Specialized Pools: Targeted Error Handling**

These dedicated pools isolate specific types of issues, making resolution faster and more organized.

#### **Individual Pool: For Standalone Submissions**
This pool captures documents set for individual submission (`einvoice submission type = INDIVIDUAL`) that fail initial validation due to missing LHDN-mandated fields.

*   **Common Problems:** Incomplete customer data such as TIN, ID Type, or address.
*   **Resolution Steps:** Update the customer master data directly, then use the **Save And Resubmit** button to re-validate and move the document forward.
*   **Tip:** Prevent entry by running pre-submission checks on customer records.

#### **Single General Pool: For Consolidated Candidates**
This pool holds documents earmarked for consolidation (`einvoice submission type = SINGLE-GENERAL`) but blocked by data deficiencies.

*   **Common Problems:** Often missing basic customer info like TIN, ID, or address, common in walk-in sales.
*   **Resolution Steps:** Correct the underlying data in the source document or master records, then **Save And Resubmit** to qualify it for the next consolidation batch.
*   **Tip:** Use this pool for quick fixes to maintain monthly submission schedules.

---

## **5. 👤 Role-Based Playbooks: Your E-Invoicing Workflow**

These tailored playbooks provide step-by-step guidance customized to your role in the organization. Each includes key responsibilities, daily/weekly/monthly tasks, and pro tips to optimize your workflow while ensuring LHDN compliance.

{{< tabs items="Counter Sales (B2C), Accounts Receivable (B2B), Finance Manager, Procurement (Self‑Billed), Auditor & Compliance" >}}
{{< tab >}}
### **Counter Sales (B2C): Managing Retail Transactions**

*   **Core Responsibility:** Handle high-volume walk-in sales using `Single-General` submission type for anonymous buyers.
*   **Step-by-Step Workflow:**
    1. Create a `Cash Bill` directly in the **POS Applet** for immediate transactions.
    2. If a buyer requests a personalized invoice within 72 hours, upgrade by updating customer fields (TIN, ID, etc.) and resubmit from the **Batch Pool** as `Individual`.
    3. At month-end, review the `Batch Pool` and initiate consolidated submission by the 7th of the following month.
*   **Best Practices:** Always capture basic buyer info at point-of-sale to simplify potential upgrades. Monitor the Batch Pool daily for exceptions.
*   **Pro Tip:** Set up alerts for requests exceeding the 72-hour window to avoid compliance issues.
{{< /tab >}}
{{< tab >}}
### **Accounts Receivable (B2B): Issuing Business Invoices**

*   **Core Responsibility:** Generate and track `Individual` e-invoices for named business customers.
*   **Step-by-Step Workflow:**
    1. Pre-verify customer master data for completeness (`ID Type`, `Reg/ID`, `TIN`, `Email`, `Address`).
    2. Create and detail a `Sales Invoice` in the Sales Applet, then `FINAL`ize it.
    3. Submit from the `Posting Queue` and track status in `To IRB E-Invoice`.
    4. Upon validation, send buyer notifications and archive the PDF with QR code.
*   **Best Practices:** Integrate with CRM for automated data checks. Batch submissions for efficiency.
*   **Pro Tip:** Use the Internal Submission History for quick status reports to stakeholders.
{{< /tab >}}
{{< tab >}}
### **Finance Manager: Overseeing Compliance**

*   **Core Responsibility:** Manage consolidated flows and monitor overall e-invoicing performance.
*   **Step-by-Step Workflow:**
    1. **Daily:** Review `Posting Queue` for errors and clear backlogs.
    2. **Weekly:** Address exceptions in the `Batch Pool` and run test consolidations.
    3. **Monthly:** Execute auto-consolidated submissions (or manual if needed) by the 7th, verifying all statuses.
    4. Track KPIs like success rate, average validation time, and rejection percentage.
*   **Best Practices:** Implement dashboard monitoring for real-time metrics. Conduct monthly compliance audits.
*   **Pro Tip:** Automate reports from Internal Submission History to streamline board presentations.
{{< /tab >}}
{{< tab >}}
### **Procurement (Self-Billed): Handling Supplier Invoices**

*   **Core Responsibility:** Create self-billed documents when suppliers fail to issue e-invoices.
*   **Step-by-Step Workflow:**
    1. In the supplier profile, enable `E-invoice Self-Billed = TRUE`.
    2. Create a `Purchase Invoice (Self-Billed)` in the Procurement Applet and `FINAL`ize.
    3. Submit via `Posting Queue` and reconcile incoming data through `Peppol Incoming` or email OCR scanning.
    4. Monitor validation in `To IRB E-Invoice`.
*   **Best Practices:** Maintain a supplier watchlist for frequent self-billing needs. Verify all tax codes before finalizing.
*   **Pro Tip:** Integrate with inventory systems for automatic self-billing triggers on receipts.
{{< /tab >}}
{{< tab >}}
### **Auditor & Compliance: Ensuring Traceability**

*   **Core Responsibility:** Verify transaction integrity and prepare audit evidence.
*   **Step-by-Step Workflow:**
    1. Use filters in `Internal Submission History` to search by date, document, or status.
    2. Confirm validation (`Document is Valid`) and presence of IRBM Reference Number.
    3. Export comprehensive records including PDFs, XML/JSON data, QR codes, and audit trails.
    4. Cross-reference with source documents for discrepancies.
*   **Best Practices:** Schedule regular exports for offsite backups. Use advanced filters for compliance reporting.
*   **Pro Tip:** Leverage the validation URL in QR codes for quick third-party verifications during audits.
{{< /tab >}}
{{< /tabs >}}

---

## **6. 🔧 Troubleshooting: Common Issues and Solutions**

### **Resolving LHDN Submission Failures**

Submission failures are a normal part of the process and provide direct feedback from LHDN for quick resolution.

**Resolution Process:**

1.  **Identify Failure:** Navigate to the **Internal Submission Queue** and find the transaction with a `submission failed` status.
2.  **Diagnose Error:** Click on the transaction and go to the **from lhdn** tab to read the specific LHDN error message.
3.  **Correct Data:** Fix the missing or invalid data in the original source document.
4.  **Resubmit:** Process the corrected transaction through the submission queue.

### **Common Error Codes and Quick Fixes**

| Message / Code | What it means | Where to fix | Quick fix |
|---|---|---|---|
| "CD is required" | Buyer city missing | Customer → Address | Add the city, save, and resubmit. |
| Missing TIN | Taxpayer ID not provided | Customer/Supplier → Tax | Enter the TIN (e.g., `C1234567890`). |
| Invalid ID Type | Wrong ID type (BRN/NRIC/Passport) | Customer/Supplier → Identity | Set the correct ID Type. |
| Currency not supported | Unsupported or incorrect currency | Organization/Document → Currency | Use a supported currency and ensure the forex rate is recorded. |
| Amount rounding mismatch | Totals don’t match the line sums | Lines Tab / Tax calc | Correct the decimals and rounding rule, then re-save. |
| Invalid UOM | Unit of measure not valid | Doc Item Maintenance → UOM | Use a valid UOM (e.g., `PCS`, `KG`). |
| Tax code mismatch | Wrong SST/Tax mapping | Doc Item Maintenance → Tax | Map to the correct Tax Type Code. |
| Duplicate document number | Existing invoice number reused | Numbering / Source doc | Use a unique number and verify the history. |
| Document not FINAL | Submission from draft status | Source document | Click `FINAL` before submitting. |
| Self-billed flag missing | Supplier not marked as self-billed | Supplier → Flags | Set `E-invoice Self-Billed = TRUE`. |
| Invalid email/contact | Buyer contact missing or invalid | Customer → Contact | Add a valid email and phone number. |
| Credentials/Intermediary not set | MyInvois not configured | MyInvois Portal Setup | Set the intermediary and complete the registration. |
| 429 Too Many Requests | Rate limit exceeded | Submission Processor | Retry with backoff; stagger batches. |
| Network/Timeout | Connectivity issue | Infra / Endpoint | Check the network and retry the submission. |

---

## **7. 📚 Setup and Configuration: A Complete Guide**

### **1. MyInvois Portal Configuration**

*   **Environment URLs:**
    *   **Sandbox:** https://preprod-mytax.hasil.gov.my/
    *   **Production:** https://mytax.hasil.gov.my/
*   **Setup Requirements:**
    *   Set Bigledger as the "Intermediary" for both environments.
    *   Complete the digital certificate registration process.
    *   Configure company and representative access.

### **2. Master Data Configuration**

#### **Organization Applet**

Configure your company profiles with:

*   Branch information
*   Business Registration Numbers (BRN)
*   Tax Identification Number (TIN)
*   Business Activity Description (MSIC code)

#### **Customer Maintenance**

The following fields are **mandatory** for e-invoices:

*   Buyer\'s ID Type and Registration Number
*   Buyer\'s TIN (Tax Identification Number)
*   Contact Number and Email
*   MSIC Code and Complete Address

#### **Supplier Maintenance**

For **self-billed e-invoices**, the following are required:

*   Enable "E-invoice Self-Billed" = TRUE
*   Supplier\'s ID Type and Registration Number
*   Supplier\'s TIN, Contact Number, and Email
*   MSIC Code and Complete Address

#### **Document Item Maintenance**

Configure your item classifications with:

*   Item Classification Description
*   E-invoice Tax Type Code
*   E-invoice Unit of Measure (UOM)

---

## **8. ⚠️ Post-Validation: Rejection and Cancellation**

### **The 72-Hour Rule for Rejection Requests**

{{< callout type="warning" >}}
**⏰ Critical Time Limit**
Rejection requests must be initiated within **72 hours** of LHDN validation. The system automatically blocks cancellations after this window expires.
{{< /callout >}}

*   **Request Sources:**
    *   Internal staff via the system interface
    *   Customers via the customer portal
    *   All requests appear in the **Rejection Request** menu under the **Cancellation** tab.
*   **Applicable Documents:**
    *   Sales Invoices, Credit Notes, Debit Notes, and Sales Credit Notes.
    *   **Not applicable** for self-billed and consolidated e-invoices.

### **Processing Logic Options**

When approving a rejection request, you can choose from three processing methods:

{{< cards >}}
  {{< card title="1️⃣ Regenerate New E-Invoice" subtitle="**Action**: Cancels the current e-invoice and auto-creates a new one. **Impact**: The original document is unchanged. **Use**: For minor error corrections." >}}
  {{< card title="2️⃣ Void Original Document" subtitle="**Action**: Cancels the e-invoice and voids the source document. **Impact**: **Irreversible** - a new document is required. **Use**: For major corrections that require a restart." >}}
  {{< card title="3️⃣ New Reversal Document" subtitle="**Action**: Creates a reversal document instead of a cancellation. **Impact**: Generates an offsetting document (e.g., a Credit Note for an Invoice). **Use**: To maintain an audit trail while making corrections." >}}
{{< /cards >}}

---

## **9. ❓ Frequently Asked Questions (FAQs)**

*   **Which document type should I use for a walk-in retail customer?**
    *   Use a `Cash Bill` with `Single-General`. If the buyer later requests a named invoice, you can update the customer details and resubmit it as `Individual` within 72 hours.
*   **What is the difference between an Individual and a Consolidated e-invoice?**
    *   `Individual` e-invoices are for B2B named invoices and are validated per transaction. `Consolidated` e-invoices are for aggregated retail transactions (Single-General) and are submitted monthly.
*   **Where can I find the QR code?**
    *   Monitor the transaction in `To IRB E-Invoice`. Once the status is `Document is Valid`, open the transaction to view the QR code and IRBM Reference.
*   **What is the 72-hour window?**
    *   This is the period after validation during which you can request a rejection or cancellation. It is not extendable.
*   **Can I cancel a consolidated e-invoice?**
    *   Not through the rejection workflow. You will need to use reversal or adjustment documents.
*   **How do I submit a self-billed purchase?**
    *   Flag the supplier with `E-invoice Self-Billed = TRUE`, create the purchase document, finalize it, and submit it via the queue. You can then monitor it in `To IRB E-Invoice` or the `Internal Submission History`.
*   **How do I correct a validated invoice?**
    *   Process a rejection request and choose one of the three logic options: Regenerate, Void original, or New reversal document.
*   **Where is the official archive of my e-invoices?**
    *   The `Internal Submission History` serves as the permanent archive, with the status `Document is Valid`, the validation URL, and the QR code.
