---
title: "Purchase Report Applet"
description: "Consolidated purchase analysis, supplier performance tracking, and procurement reporting for AP teams, finance managers, and purchasing administrators"
tags:
- purchase-report
- procurement
- accounts-payable
- supplier-performance
- financial-reporting
weight: 180
---

## Purpose and Overview

The **Purchase Report Applet** is the consolidated reporting workspace for your organization's procurement spend. It answers two of the most critical procurement questions: **"What did we buy, from whom, and at what cost?"** and **"How does our actual purchase activity compare to what was ordered or received?"**

{{< figure src="/images/purchase-report-applet/purchase-report-infographic.jpg" alt="Mastering the Purchase Report Applet: A User's Guide to Procurement Insights" caption="Mastering the Purchase Report Applet: A comprehensive guide to procurement insights, covering report selection, role-based workflows, and real-world reconciliation scenarios." >}}

Instead of manually reconciling purchase orders, invoices, and GRNs across multiple screens, this applet brings together purchase document data into structured report views — giving AP teams, finance managers, and purchasing administrators a single place to review purchase activity, analyze supplier spend, and export data for audit or planning purposes.

{{< callout type="info" >}}
**Core Concept: Choose the report by your procurement question**
- Use **Purchase Summary Report** when the question is: "How much did we spend by supplier, item, or period?"
- Use **Purchase Detail Report** when the question is: "What specific transactions make up this spend?"
- Use **Purchase vs GRN Report** when the question is: "Did we receive everything we ordered and invoiced?"
{{< /callout >}}

### Which Report Should I Use First?

| If the user needs to know... | Start here | Why this is the right report |
|------|-----------------|------------------------------|
| Total spend by supplier or category | **Purchase Summary Report** | It is the high-level aggregated view of what was purchased. |
| Line-item details behind a purchase figure | **Purchase Detail Report** | It shows the individual transactions that make up the total. |
| Whether a PO was fully received and invoiced | **Purchase vs GRN Report** | It links purchase orders to GRN receipts for reconciliation. |
| Who approved the spend | Any report filtered by **Approver** or **Company** | Filter the relevant report to focus on the approval chain. |

### Who Benefits from This Applet?

| Role | How they use it |
|------|-----------------|
| **AP Officers** | Review purchase invoices and supplier spend, verify amounts before payment processing. |
| **Purchasing Managers** | Monitor purchase order fulfillment, compare ordered vs received vs invoiced quantities. |
| **Finance Managers** | Run period-end purchase summaries for cost-of-goods calculations and budget reviews. |
| **Finance Admins** | Set default branch and location values and configure printable formats for exported reports. |
| **Auditors and Reviewers** | Open purchase document details, drill into line items, and trace document links for traceability. |

---

## What Problems Does This Solve?

**Without This Applet:**
- Procurement teams pull data from purchase orders, GRNs, and invoices separately and reconcile manually in spreadsheets.
- Finance cannot quickly answer "How much did we spend with Supplier X this quarter?" without running multiple reports.
- AP teams struggle to identify mismatches between what was ordered, what was received, and what was invoiced.
- Period-end purchase reviews require effort from multiple teams to compile reliable numbers.

**With the Purchase Report Applet:**
- You get a **shared purchase reporting workspace** with filters for **Supplier**, **Company**, **Branch**, and **Date Range**.
- You can move from **summary totals** to **document-level detail** without leaving the applet.
- The report views support **Export** actions for Excel-compatible outputs at every level.
- The document and drill-down views support **PRINT** actions where the workflow needs a shareable output.

{{< callout type="warning" >}}
**Best used for operational review and period reporting**
This applet is designed for review, export, and analysis of completed or finalized purchase transactions. It does not expose edit or posting actions on source purchase documents.
{{< /callout >}}

---

## The Reporting Framework: Understanding the Screens

Before jumping into each report, it helps to understand what filters and behaviors are shared across the applet.

### Common Filters Across the Listings

All main report listings use a shared advanced-search model.

| Filter / Search | What it does |
|--------|---------|
| **Keyword Search** | Searches the listing. Keyword must be at least 3 characters to be effective. |
| **Supplier** | Limits results to selected supplier entities. |
| **Company** | Limits results to selected companies. |
| **Branch** | Narrows results to one or more branches. |
| **Date Range** | Sets the start and end date for the report period. |
| **Document Type** | Switches the view between purchase order, purchase invoice, GRN, and related document types where applicable. |

{{< callout type="warning" >}}
**Important:** Always set the **Date Range** before running any purchase report. The listing defaults may show a narrow current-period slice. Use a full month or quarter range for period reviews.
{{< /callout >}}

### What Users Can and Cannot Do Here

| This applet is good for... | This applet is not for... |
|--------|---------|
| Reviewing supplier spend by document type, date, or amount | Editing source purchase transactions |
| Drilling into line items and document detail for specific purchases | Posting payments, creating GRNs, or approving purchase orders |
| Exporting purchase data for audit, reconciliation, or planning | Replacing the source purchase order or invoice applets |
| Generating printable purchase summaries | Changing purchase document status or finalizing documents |

---

## Role-Based Quick Start Guides

### For AP Officers: Review Purchase Transactions by Period

Your goal is to review finalized purchase invoices and supplier amounts for a given period.

1. Open **Purchase Detail Report** from the sidebar.
2. Set **Supplier**, **Company**, and **Date Range** to narrow the results.
3. If you use keyword search, enter at least 3 characters.
4. Run the search and review the listing columns: **Document**, **Txn Date**, **Supplier**, **Amount**, and **Status**.
5. Click a document row to open the detail view.
6. Review the tabs: **Details**, **Line Items**, **Account**, **Settlement**, and **Doc Link**.
7. Use the listing-level **Export** button to export the current result set if needed.

### For Purchasing Managers: Reconcile Orders Against Receipts

Your goal is to identify whether purchase orders are fully fulfilled — matched against GRNs and invoices.

1. Open **Purchase vs GRN Report** from the sidebar.
2. Filter by **Company**, **Branch**, and **Date Range**.
3. Review the columns: **PO Number**, **Ordered Qty**, **Received Qty**, **Invoiced Qty**, and any variance columns.
4. Click a row to drill into the document link details.
5. Use **Doc Link** to trace the PO → GRN → Invoice chain for any gaps.
6. Export the result set to Excel for further reconciliation if needed.

### For Finance Managers: Period-End Purchase Summary

Your goal is to produce a supplier or category spend summary for cost-of-goods or budget review.

1. Open **Purchase Summary Report** from the sidebar.
2. Set **Company**, **Branch**, and **Date Range** to cover the full review period.
3. Review the aggregated spend totals by supplier or category.
4. Use **Export** to download the summary as an Excel file.
5. If the applet shows **Please setup the default printable format**, go to **Settings > Printable Format Settings** and configure the required format first before generating printable output.

---

## Deep-Dive: The Report Workspaces

### 1. Purchase Detail Report (The Transaction-Level Workspace)

This is the default landing view for document-level purchase investigation.

**Use this report when:**
- AP needs to verify one specific invoice or credit note
- Finance needs to see the exact line items and amounts behind a purchase total
- An auditor requests the supporting documents for a purchase transaction
- A reviewer wants a printable document-level view

**Report Columns:**

| Column | What it shows |
|--------|---------------|
| **Document** | The purchase document identifier (invoice number, PO number, etc.). |
| **Txn Date** | The transaction date for the document. |
| **Supplier Code** | The entity code of the supplier. |
| **Supplier Name** | The supplier or vendor name. |
| **Company Name** | Company code and company name combined in one column. |
| **Branch** | The branch associated with the document. |
| **Currency** | Transaction currency. |
| **Amount** | Document total amount. |
| **Status** | Current document status (e.g., Finalized, Draft, Cancelled). |

**Document Detail Tabs:**

| Tab | Purpose |
|-----|---------|
| **Details** | Main document-level header information. |
| **Account** | GL account breakdown and accounting entries for the document. |
| **Line Items** | Individual line items on the purchase document. Users can drill into **View Item** for item-level detail. |
| **Delivery Details** | Delivery-related information when present. |
| **Settlement** | Settlement records linked to the document. |
| **Department** | Department and cost-center allocation. |
| **Contra** | Contra entries or offsetting records. |
| **Doc Link** | Linked documents and document relationships, tracing the PO → GRN → Invoice chain. |

{{< callout type="tip" >}}
**Best use case:** Start in **Purchase Detail Report** when the question is "What exactly is behind this purchase amount?" rather than "How much did we spend in total?"
{{< /callout >}}

### 2. Purchase Summary Report (The Spend Summary Workspace)

This screen is the aggregated view of procurement spend by supplier, category, or period.

**Use this report when:**
- Finance wants total spend by supplier for the month or quarter
- Purchasing wants to identify top vendors by volume or amount
- Management wants a cost-of-goods summary for budget review

**Report Columns:**

| Column | What it shows |
|--------|---------------|
| **Supplier Code** | Derived supplier entity code. |
| **Supplier Name** | Supplier entity name. |
| **Company** | Company code and name combined. |
| **Currency** | Currency code for the totals. |
| **Total Amount** | Aggregated total purchase amount for the period and filters. |
| **Doc Count** | Number of purchase documents included in the total. |

{{< callout type="tip" >}}
**What to tell users:** Use the **Date Range** filter and set **Company** before running the summary. A summary without a date range may return unexpectedly large data sets depending on your historical data volume.
{{< /callout >}}

### 3. Purchase vs GRN Report (The Fulfillment Reconciliation Workspace)

This screen links purchase orders to goods received notes and purchase invoices, showing ordered vs received vs invoiced quantities for each line.

**Use this report when:**
- Purchasing wants to find PO lines that have not been received yet
- Finance wants to identify invoices with no matching GRN
- AP teams need to resolve "invoice without receipt" discrepancies
- An auditor requires the complete order-to-receipt-to-invoice paper trail

**Report Columns:**

| Column | What it shows |
|--------|---------------|
| **PO Number** | The purchase order document identifier. |
| **Supplier** | Supplier entity linked to the PO. |
| **Item** | The item or service on the PO line. |
| **Ordered Qty** | Quantity from the original purchase order. |
| **Received Qty** | Quantity from linked GRN records. |
| **Invoiced Qty** | Quantity from linked purchase invoices. |
| **Variance** | Difference between ordered, received, and invoiced quantities showing open or over-received lines. |

**Drill-Down:**

- Click any row to open the related document link view.
- Use **Doc Link** to trace full PO → GRN → Invoice relationships.

---

## Applet Configuration (For Admins)

Navigate to **Settings** in the sidebar to configure the applet.

### Default Selection

This screen provides applet-wide default values.

| Setting | Purpose |
|---------|---------|
| **Default Branch** | Preselects a branch for the applet. |
| **Default Location** | Preselects a location for the applet. |

### Field Settings

The field-settings screen controls which optional columns or fields appear in the report listings.

| Group | Available toggles |
|-------|-------------------|
| **Report Settings** | Column visibility toggles specific to each report listing. |
| **Department Settings** | `Segment`, `G/L Dimension`, `Profit Center`, `Project` |

### Printable Format Settings

This setup is important if users need to generate printable report outputs.

| Area | What users see |
|-----|-----------------|
| **Listing** | `Format Code`, `Format Name`, `File Name`, `File Size`, `Uploaded Date`, and `Uploaded By` |
| **Add Printable Format** | `Format Code`, `Format Name`, `Type`, `Default`, and file upload / drag-and-drop |
| **Edit Printable Format** | The same fields plus download and delete actions |

The uploaded file must be a **`.jrxml`** file. Mark the format as **Default** if you want report print actions to use it automatically.

### Personalization

Users also have a personalization area.

| Section | Purpose |
|---------|---------|
| **Default Selection** | User-level default **Branch** and **Location** that override the applet defaults for that user. |

{{< callout type="info" >}}
Depending on deployment and permissions, administrators may also have access to additional routes such as **Webhook**, permission pages, and **Release Notes**. These are part of the applet routing but may not appear for every user in the standard menu.
{{< /callout >}}

---

## Common Real-World Scenarios

### Scenario 1: Month-End Purchase Spend by Supplier

**The Situation:** Finance needs total procurement spend per supplier for the month to support cost-of-goods calculations.
**The Workflow:**
1. Open **Purchase Summary Report**.
2. Set **Company** and **Date Range** to cover the full month.
3. Review the aggregated spend totals by supplier.
4. Export to Excel for further analysis or upload to the finance reporting tool.

**Why this report fits the scenario:** Summary-level aggregation is faster than totaling individual documents, and the export supports downstream reconciliation.

### Scenario 2: Identify Unmatched Purchase Invoices

**The Situation:** AP discovers invoices from a supplier that do not have a matching GRN, and the team needs to find and resolve the discrepancy quickly.
**The Workflow:**
1. Open **Purchase vs GRN Report**.
2. Filter by the specific **Supplier** and the relevant **Date Range**.
3. Review **Invoiced Qty** against **Received Qty** to find lines with mismatches.
4. Click the affected row and use **Doc Link** to trace the chain from PO to GRN to Invoice.
5. Escalate to the warehouse or procurement team to resolve the missing receipt before payment.

**Why this report fits the scenario:** This is the reconciliation workspace. It answers "did we receive what we were invoiced for?" directly.

### Scenario 3: Audit Trail for a Specific Purchase Document

**The Situation:** An external auditor requests the full supporting documentation for a large purchase invoice — including the original PO, the GRN receipt, and the invoice.
**The Workflow:**
1. Open **Purchase Detail Report**.
2. Search for the invoice document number or filter by supplier and date.
3. Open the document row in the detail view.
4. Use **Doc Link** to show the full PO → GRN → Invoice trail.
5. Use **PRINT** to generate a shareable output of the document detail.

**Why this report fits the scenario:** This is the document investigation workspace. It provides the complete audit trail without leaving the applet.

---

## FAQs

**Q: Which report should I open first?**
Start with the question you need to answer. Use **Purchase Detail Report** for one specific transaction, **Purchase Summary Report** for aggregated spend totals, and **Purchase vs GRN Report** for fulfillment reconciliation between orders and receipts.

**Q: What filters are available on the listing pages?**
The shared listing filters are **Supplier**, **Company**, **Branch**, **Date Range**, and **Document Type**, plus keyword search. Keyword searches must be at least 3 characters long.

**Q: Why does my purchase total not match the GL balance?**
Check three things:
1. Ensure you are using the exact same date range in both the purchase report and the GL.
2. Ensure you are filtering by the same **Company** and **Currency**.
3. Verify that all relevant invoices have been **Finalized/Posted**. Draft or unposted documents may not appear in purchase reports but may exist in the GL.

**Q: Can I generate a printable purchase statement from this applet?**
Yes, if printable formats are configured. Go to **Settings > Printable Format Settings**, upload a `.jrxml` file for the required report type, and mark it as **Default**. Then use the **PRINT** action in the report or document detail view.

**Q: Can I edit or post documents from this applet?**
No. This applet is for review, drill-down, export, and print. It does not expose posting or edit actions on source purchase documents. Use the relevant purchase order, GRN, or invoice applet for those actions.

**Q: What is the difference between Purchase Detail Report and Purchase Summary Report?**
**Purchase Detail Report** is document-level and used for transaction investigation and audit. **Purchase Summary Report** is aggregated by supplier or category and used for spend analysis and period-end reviews.

**Q: Can I export the report results?**
Yes. Each main listing screen includes an **Export** button for the current grid results.

**Q: Why are some purchase documents not showing in the report?**
Check the **Date Range**, **Company**, and **Document Type** filters. Draft or unposted documents may be excluded from finalized report views. If records are still missing, ask your administrator to review the applet's data scope configuration.
