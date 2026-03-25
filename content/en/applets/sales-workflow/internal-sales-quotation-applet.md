---
title: "Internal Sales Quotation Applet"
description: "Manage the creation, review, and lifecycle of sales quotations, including granular line item details and bulk file operations for the sales team"
weight: 50
tags:
- sales
- quotation
- quote-management
- internal-sales
---

> [!WARNING]
> **Work in Progress:** This documentation is currently under development. Visual assets (screenshots) and further details will be added soon.

## Purpose and Overview

The **Internal Sales Quotation Applet** is the primary workspace for sales representatives, managers, and administrative staff to create, review, and manage sales quotations before they become confirmed orders. 

It provides a centralized location to track what has been quoted to customers, drill down into specific quoted line items, and manage bulk quotation data through import and export capabilities.

### Who Benefits from This Applet?

| Role | How they use it |
|------|-----------------|
| **Sales Representatives** | Create and issue quotations to customers, track the status of quoted deals, and review specific line items they have offered. |
| **Sales Managers** | Review overall quotation pipelines, verify discount levels applied to line items, and approve high-value quotes if workflow rules are enabled. |
| **Sales Administrators** | Perform bulk updates or mass quotation creations using the File Import and File Export tools. |
| **System Administrators** | Configure application defaults, printable statement formats, and workflow routing rules for the quotation process. |

---

## What Problems Does This Solve?

**Without This Applet:**
- Sales teams manage quotes in external spreadsheets or standalone word processors, leading to lost data and pricing inconsistencies.
- Managers cannot easily see a pipeline of open quotes or drill down into specific items being offered at a discount.
- Bulk updates to existing quotes or importing hundreds of standard quotes requires manual, error-prone data entry.
- Generating a professional, printable quotation document is a disjointed process outside of the core ERP system.

**With Internal Sales Quotation Applet:**
- You get a **centralized repository** for all sales quotations, with standardized formats and pricing controls.
- You can instantly switch between a **document-level view** (the whole quote) and a **line-item-level view** (individual products/services quoted).
- You can leverage **File Import** and **File Export** to handle bulk quotation operations rapidly.
- You can seamlessly generate statements and quote PDFs using configured **Printable Format Settings**.

---

## Role-Based Quick Start Guides

### For Sales Representatives: Creating and Sending a Quote
Your goal is to formalize an offer for a customer and generate the document for their review.

1. Open **Sales Quotations** from the sidebar.
2. Click **Create** to start a new quotation document.
3. Select the target customer entity and fill in the required header details (e.g., validity date, currency).
4. Add the requested products or services in the line items section, adjusting pricing or discounts as permitted.
5. Save the document. Once saved, use the **Print/Export** action to generate the PDF based on the predefined printable format, and send it to the customer.

### For Sales Managers: Reviewing Quoted Items
Your goal is to analyze what specific products or services are being quoted across the team, especially to monitor pricing trends.

1. Open the **Line Items** workspace from the sidebar.
2. Use the advanced filters to search by specific item codes, date ranges, or sales representatives.
3. Review the grid to see the exact unit prices, discounts, and quantities offered to various customers without having to open every single quotation document individually.
4. Export the resulting grid if further external analysis is required.

### For Administrators: Executing Bulk Imports
Your goal is to upload a large batch of predefined quotations provided by a partner or generated from an external system.

1. Navigate to **File Import** in the sidebar.
2. Download the standard quotation import template if you do not already have it.
3. Prepare your spreadsheet offline, ensuring all mandatory fields (Item Code, Quantity, Customer ID) are filled.
4. Upload the file and monitor the import log for any validation errors.
5. Successfully imported records will immediately appear in the **Sales Quotations** listing.

---

## Deep-Dive: The Report Workspaces

### 1. Sales Quotations Workspace
This is the default landing page and document-level view. It lists all quotation headers (e.g., Quotation Number, Customer Name, Total Amount, Date, Status). Use this view to search for a specific quote document to edit, print, or convert into a sales order.

### 2. Line Items Workspace
This is the granular reporting view. Instead of listing one row per document, it lists one row per product/service quoted. 
- **Use Case**: If an item price changes globally, use this view to find all open quotations that currently contain the old price so the sales reps can be notified to update their offers.

### 3. File Import and File Export
These dedicated workspaces handle bulk data orchestration.
- **File Import**: Supports uploading `.csv` or `.xlsx` files to mass-create or mass-update quotations.
- **File Export**: Provides a background-processed export of quotation data, ideal for very large datasets that might time out a standard grid export.

---

## Applet Configuration (For Admins)

Navigate to **Settings** in the sidebar to configure the applet's behavior and defaults.

### Application Settings (Field Settings)
Control the visibility and mandatory status of fields across the quotation screens. You can simplify the UI for your sales team by hiding fields your organization does not use (e.g., complex shipping dimensions on a quote).

### Default Selection
Set applet-wide defaults for new quotations, such as the default branch, default currency, or default validity period (e.g., quotes expire in 30 days).

### Printable Format Settings
Crucial for sales operations, this is where you upload the **`.jrxml`** template for the quotation PDF. Once set as the default, this template is used whenever a sales rep clicks "Print" on a quotation document.

### Branch Settings
Restrict or configure quotation behaviors specific to certain operating branches relative to the overall organization.

### Workflow Settings
Configure approval routing. For example, you can set a rule that any quotation with a total discount exceeding 15% must be routed to a Sales Manager for approval before its status can be changed to "Approved/Sent."

---

## Common Real-World Scenarios

### Scenario 1: Transitioning a Quote to an Order
**The Situation:** A customer has accepted a quotation, and the sales team needs to proceed.
**The Workflow:** The sales representative locates the quote in the **Sales Quotations** listing, opens it, and uses the action menu (if configured in the workflow) to push or convert the quote into a resulting Sales Order, preventing double data entry.

### Scenario 2: Updating a Quotation Template
**The Situation:** The marketing team has redesigned the company logo and legal terms, requiring an update to the PDF layout sent to customers.
**The Workflow:** The administrator receives the new `.jrxml` file, navigates to **Settings > Printable Format Settings**, uploads the new format, and marks it as the new default. All subsequent prints by the sales team will instantly use the new design.

---

## FAQs

**Q: Can I see exactly what someone quoted for "Product A" last week?**  
A: Yes. Use the **Line Items** menu from the sidebar, and filter the grid by "Product A" and the date range. This will show all instances where the product was quoted, saving you from opening individual quote documents.

**Q: Do I have to manually enter 500 lines for a massive B2B quote?**  
A: No. You can construct the quote offline in a spreadsheet and use the **File Import** tool to upload the header and all 500 line items directly into the system.

**Q: Why isn't the "Print" button working on my quotation?**  
A: A system administrator must first upload a valid `.jrxml` layout file in **Settings > Printable Format Settings** and set it as the default output format.
