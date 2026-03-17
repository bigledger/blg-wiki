---
title: "Debtor and Creditor Report Applet"
description: "Real-time aging analysis, outstanding balance tracking, and financial health reporting for Accounts Receivable and Accounts Payable teams"
tags:
- accounts-receivable
- accounts-payable
- debtor-report
- creditor-report
- aging-analysis
- financial-reports
weight: 70
---

## Purpose and Overview

The **Debtor and Creditor Report Applet** is a current-state reporting workspace for reviewing open Accounts Receivable (AR) and Accounts Payable (AP) positions. It is designed for the daily finance questions teams ask during collection follow-up, vendor payment planning, dispute handling, month-end review meetings, and statement preparation.

In this applet, debtor and creditor analysis is handled through the same shared screens rather than separate debtor-only and creditor-only menus. Users change perspective with **ARAP Type** instead of switching to a different applet menu.

{{< callout type="info" >}}
**Core Concept: choose the report by finance question**
- Use **Outstanding Document Report** when the question is: "Which exact invoice, bill, or transaction is still open?"
- Use **Outstanding Aging Report** when the question is: "How old is the balance, and which items should we prioritize next?"
- Use **Outstanding Entity Report** when the question is: "What is the total position for this customer, supplier, or entity, and do we need a statement?"
{{< /callout >}}

### Which Report Should I Use First?

| If the user needs to know... | Start here | Why this is the right report |
|------|-----------------|------------------------------|
| Which exact document is still open | **Outstanding Document Report** | It is the document-level investigation workspace and the default landing page. |
| Which balances are oldest or should be chased first | **Outstanding Aging Report** | It shows aging by dynamic month columns and leads into the related outstanding documents. |
| What one customer or supplier owes overall | **Outstanding Entity Report** | It summarizes the balance by entity and exposes **Statement** actions. |
| Whether AR or AP should be reviewed | Any of the three listings with **ARAP Type** | The shared filter switches the same report between receivable and payable perspectives. |

### Who Benefits from This Applet?

| Role | How they use it |
|------|-----------------|
| **AR Collection Officers** | Review outstanding customer balances, drill into supporting documents, and export current results. |
| **AP Payment Officers** | Filter payable records by entity, company, and ARAP type to review what is still open. |
| **Finance Managers** | Use the three report views together to review balances by document, by aging bucket, and by entity. |
| **Finance Admins** | Configure default branch/location values and the printable formats required for statements. |
| **Auditors and Reviewers** | Open document details, settlement records, contra records, and document links for traceability. |

---

## What Problems Does This Solve?

**Without This Applet:**
- Teams have to switch between multiple screens to understand whether an amount is still open, how old it is, and which entity it belongs to.
- Users often review balances only at summary level and then spend extra time hunting for the source document.
- Statement generation depends on setup that is easy to miss if there is no clear printable-format workflow.
- AR and AP teams can waste time opening the wrong report first because the difference between "document", "aging", and "entity" is not explained clearly enough.

**With Debtor and Creditor Report Applet:**
- You get a **shared AR/AP reporting workspace** with filters for **Entity**, **Company**, and **ARAP Type**.
- You can move from **entity summary** to **document detail** without leaving the applet.
- The aging report shows **dynamic month columns**, a **Days** value, and the underlying outstanding documents.
- Each listing includes an **Export** action for the current grid results.
- The document and drill-down views support **PRINT** or **EXPORT** actions where the workflow needs a shareable output.
- The entity view supports **Statement** and **Statement(aging)** actions once printable formats are configured.

{{< figure src="/images/debtor-and-creditor-report-applet/debtor-creditor-infographic.jpg" alt="Debtor and Creditor Report Applet overview" caption="Debtor and Creditor Report Applet overview. The applet centers on outstanding documents, month-based aging, entity summaries, and statement generation." >}}

{{< callout type="warning" >}}
**Best used for live outstanding review**
Because the current applet does **not** expose an **As of Date** filter, this workspace is best for current-state review, operational follow-up, and present-day statement preparation rather than historical cutoff snapshots.
{{< /callout >}}

---

## The Reporting Framework: Understanding the Screens

Before jumping into each report, it helps to understand what is shared across the applet and what the applet is meant to support.

### Common Filters Across the Listings

All three main listings use the same advanced-search model.

| Filter / Search | What it does |
|--------|---------|
| **Keyword Search** | Searches the listing. If you type a keyword, it must be at least 3 characters long. |
| **Entity** | Limits results to selected entities. |
| **Company** | Limits results to selected companies. |
| **ARAP Type** | Switches the report between receivable and payable record types such as `AR_TRADE`, `AR_OTHER`, `AP_TRADE`, and related values. |

{{< callout type="warning" >}}
**Important:** The current applet screens do **not** expose an **As of Date** filter. Each listing shows a **Current DateTime** label and works with the current outstanding data returned by the applet.
{{< /callout >}}

### What Users Can and Cannot Do Here

| This applet is good for... | This applet is not for... |
|--------|---------|
| Reviewing open balances by document, aging pattern, or entity | Editing source transaction content |
| Drilling into supporting line items, settlement records, contra, and linked documents | Posting settlements or changing balances from within the report |
| Exporting current grids and printing drill-down details | Producing a historical cutoff view with a user-entered reporting date |
| Generating statement outputs once printable formats are configured | Replacing the source sales, purchase, or finance transaction applets |

### How Aging Is Shown in This Applet

The current aging screen is month-based. It does not present the classic `Current`, `1-30`, `31-60`, `61-90`, and `90+` buckets.

| Aging element | What users see |
|--------|---------|
| **Days** | Number of days between today and the transaction date shown in the row. |
| **Dynamic month columns** | Six columns named from the current month backward using the live month names shown in the grid. |
| **6 Month+** | Amounts tied to transactions from six months ago or earlier. |
| **ARAP Doc Open / ARAP Balance** | Open amount and balance amount shown beside the month buckets. |

{{< callout type="tip" >}}
**Practical reading tip:** If users are expecting separate debtor and creditor aging menus, direct them to **Outstanding Aging Report** and have them switch perspective with **ARAP Type** instead.
{{< /callout >}}

---

## Role-Based Quick Start Guides

{{< figure src="/images/debtor-and-creditor-report-applet/arap-reporting-quick-guide.jpg" alt="Quick Guide: Master Your AR & AP Reporting Operations" caption="Quick Guide: Master Your AR & AP Reporting Operations. This guide outlines the primary workflows for Accounts Receivable (AR) and Accounts Payable (AP) reporting, streamlining balance reviews, document tracing, and statement generation." >}}

### For AR or AP Officers: Review Monthly Outstanding Balances
Your goal is to review current outstanding balances by month and decide which accounts or documents need follow-up first.

1. Open **Outstanding Aging Report** from the sidebar.
2. Use **Entity**, **Company**, and **ARAP Type** to narrow the results.
3. If you use keyword search, enter at least 3 characters.
4. Run the search and review the **Days**, month columns, **6 Month+**, **ARAP Doc Open**, and **ARAP Balance** values.
5. Click a row to open **Aging Report Transactions**.
6. Use the **Main** tab for the selected record summary.
7. Use **Outstanding Docs** to review the linked outstanding documents.
8. Use the listing-level **Export** button if you need the current result set outside the applet.

### For Finance Users: Trace a Specific Outstanding Document
Your goal is to understand one outstanding transaction in detail, especially during a dispute, reconciliation, or audit check.

1. Open **Outstanding Document Report**.
2. Search by keyword or filter by **Entity**, **Company**, and **ARAP Type**.
3. Click the document row you want to inspect.
4. Review the tabs in **View Outstanding Document**: **Details**, **Account**, **Line Items**, **Delivery Details**, **Settlement**, **Department**, **Contra**, and **Doc Link**.
5. If needed, open deeper drill-downs from the **Line Items** or **Settlement** tabs.

### For Teams Sending Statements by Entity
Your goal is to review one entity as a whole and generate the available statement output for communication or confirmation.

1. Open **Outstanding Entity Report**.
2. Filter the grid and select the required entity row.
3. Review **Entity Details** and **Transaction Docs** in the entity view.
4. Use **Statement** for the transaction-based statement action.
5. Use **Statement(aging)** for the aging-based statement action.
6. If the applet shows **Please setup the default printable format**, go to **Settings > Printable Format Settings** and configure the required default format first.

---

## Deep-Dive: The Report Workspaces

### 1. Outstanding Document Report (The Transaction-Level Workspace)
This is the default landing page when the applet opens. It is the investigation workspace for document-level questions.

**Use this report when:**
- a customer or supplier disputes one specific document
- finance needs to understand why a balance is still open
- users need to inspect settlement, contra, delivery, or linked-document details before escalating an issue
- a reviewer wants a printable document-focused view

**Report Columns:**

| Column | What it shows |
|--------|---------------|
| **Entity Code** | The entity code derived from the available customer, supplier, merchant, or employee code. |
| **Entity Name** | The entity name for the outstanding document. |
| **Company Name** | Company code and company name combined in one column. |
| **Document** | The document identifier shown in the listing. |
| **Txn Date** | The transaction date. |
| **Aging** | The aging value shown for the document row. |
| **Currency** | Transaction currency. |
| **ARAP Doc Open** | Open outstanding amount. |
| **ARAP Contra** | Contra amount. |
| **ARAP Balance** | Remaining balance amount. |

**Document Detail Tabs (8 Tabs):**

| Tab | Purpose |
|-----|---------|
| **Details** | Main document-level information for answering "What is this transaction and what is still open?" |
| **Account** | Account-related information for the selected document, including entity details plus `Bill To` and `Ship To` views. |
| **Line Items** | Transaction lines for the document. Users can drill further into **View Item** for item-level detail. |
| **Delivery Details** | Delivery-related information when present. |
| **Settlement** | Settlement records tied to the document. Users can drill further into **View Settlement** to inspect one settlement row. |
| **Department** | Department allocation details. |
| **Contra** | Contra information for the document. |
| **Doc Link** | Linked documents and document relationships, split into `Copied From` and `Copied To`. |

The document view header also includes **PRINT**, which is useful when users need a shareable document-level output rather than a grid export.

{{< callout type="tip" >}}
**Best use case:** Start in **Outstanding Document Report** when the question is "Which exact document is still open?" rather than "Which entity has the balance?"
{{< /callout >}}

### 2. Outstanding Aging Report (The Month-Based Aging Workspace)
This screen is the prioritization workspace. Use it when the main question is not "Which exact invoice?" but "How old is this exposure, and which balances need attention first?"

**Use this report when:**
- AR teams want a collections priority view
- AP teams want to understand how vendor balances are aging before payment planning
- managers want a fast aging trend view for review meetings
- users need to move from an aged balance into the supporting outstanding documents

**Report Columns:**

| Column | What it shows |
|--------|---------------|
| **Entity Code** | Derived entity code. |
| **Entity Name** | Grouped entity name in the grid. |
| **Company** | Company code and company name combined. |
| **Document** | The displayed document identifier. |
| **Date** | Transaction date used in the row. |
| **Days** | Day difference from today to the transaction date. |
| **Current month and previous five month columns** | Dynamic month buckets named from the current month backward. |
| **6 Month+** | Amounts that fall six months or earlier. |
| **ARAP Doc Open** | Open amount. |
| **ARAP Balance** | Current balance. |

**Drill-Down Tabs (Click on any row):**

| Tab | Purpose |
|-----|---------|
| **Main** | Summary view for the selected aging row. |
| **Outstanding Docs** | Linked outstanding documents for the selected row. From there, users can continue into printable document-level drill-downs if needed. |

The aging row view header includes **EXPORT**, so users can take the current row-level drill-down outside the applet when needed.

{{< callout type="tip" >}}
**What to tell users:** There is no separate **Debtor Aging Report** or **Creditor Aging Report** menu in this applet. Use **ARAP Type** on **Outstanding Aging Report** to get the view you need.
{{< /callout >}}

### 3. Outstanding Entity Report (The Entity Summary and Statement Workspace)
This screen is the relationship-level workspace by entity. It is the best starting point when finance wants to talk about one customer or supplier as a whole instead of one document at a time.

**Use this report when:**
- managers need a summary by customer, supplier, merchant, or employee entity
- teams want to prepare statement output for communication or confirmation
- finance wants to review total balance, settlements, contra, and open docs before contacting the entity
- users need a quick summary before drilling into the related transaction documents

**Report Columns:**

| Column | What it shows |
|--------|---------------|
| **Entity Code** | Derived entity code. |
| **Entity Name** | Name of the selected entity. |
| **Company** | Company code and company name combined. |
| **Currency** | Currency code. |
| **PNS Amount** | PNS amount shown in the listing. |
| **Settlement Amount** | Total settlement amount. |
| **Docs Open** | Total open documents amount. |
| **Contra** | Total contra amount. |
| **Balance** | Overall balance amount. |

**Entity Detail Tabs:**

| Tab | Purpose |
|-----|---------|
| **Entity Details** | Summary details for the selected entity. |
| **Transaction Docs** | The entity's related transaction documents. This tab supports **EXPORT** for the current transaction list and allows deeper document drill-down. |

**Statement Actions in the View Header:**

| Action | What it requires |
|--------|------------------|
| **Statement** | A default printable format for `STATEMENT_OF_ACCOUNT_TRANSACTION`. |
| **Statement(aging)** | A default printable format for `STATEMENT_OF_ACCOUNT_AGING`. |

{{< callout type="warning" >}}
If users click **Statement** or **Statement(aging)** without a configured default printable format, the applet shows the message **Please setup the default printable format**.
{{< /callout >}}

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
The current screen shows two setting groups.

| Group | Available toggles |
|-------|-------------------|
| **Lines Settings** | `Unit Discount`, `SST/VAT/GST`, `WHT`, `Blanket Order` |
| **Department Settings** | `Segment`, `G/L Dimension`, `Profit Center`, `Project` |

### Printable Format Settings
This setup is important if users need the entity-level statement actions. Without it, the statement buttons in **Outstanding Entity Report** will not work.

| Area | What users see |
|-----|-----------------|
| **Listing** | `Format Code`, `Format Name`, `File Name`, `File Size`, `Uploaded Date`, and `Uploaded By` |
| **Add Printable Format** | `Format Code`, `Format Name`, `Type`, `Default`, and file upload / drag-and-drop |
| **Edit Printable Format** | The same fields plus download and delete actions |

Use **Type** to choose one of the two statement formats supported in this applet:
- `STATEMENT_OF_ACCOUNT_TRANSACTION`
- `STATEMENT_OF_ACCOUNT_AGING`

The uploaded file must be a **`.jrxml`** file. In the current UI, **Add** and **Save** stay disabled until a valid `.jrxml` file is attached. Mark the format as **Default** if you want the entity view buttons to use it automatically.

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

### Scenario 1: Review Current AR or AP Balances by Month
**The Situation:** The team needs a fast view of what is still open this month and what has rolled into older month buckets.
**The Workflow:**
1. Open **Outstanding Aging Report**.
2. Filter by **Company** and set **ARAP Type** to the required AR or AP value.
3. Review the dynamic month columns and **6 Month+**.
4. Click a row to open **Aging Report Transactions**.
5. Use **Outstanding Docs** to see the linked records behind the selected balance.

**Why this report fits the scenario:** This is the report for prioritization. It helps users decide which balances to chase, discuss, or escalate first.

### Scenario 2: Investigate a Disputed Outstanding Document
**The Situation:** A customer or supplier disputes one document and the team needs the supporting detail quickly.
**The Workflow:**
1. Open **Outstanding Document Report**.
2. Search for the document or filter by entity and company.
3. Open the row in **View Outstanding Document**.
4. Check **Details** for the header information.
5. Check **Settlement** for matching settlement records.
6. Check **Contra** and **Doc Link** if the balance depends on linked or offsetting transactions.

**Why this report fits the scenario:** This is the document investigation workspace. It answers the question "what exactly is behind this open balance?"

### Scenario 3: Prepare Statement Actions for Entity Review
**The Situation:** The finance team wants to use the statement buttons in the entity view, but the actions must be ready before users rely on them.
**The Workflow:**
1. Admin opens **Settings > Printable Format Settings**.
2. Add or edit the required **`.jrxml`** format for `STATEMENT_OF_ACCOUNT_TRANSACTION` and/or `STATEMENT_OF_ACCOUNT_AGING`.
3. Mark the correct format as **Default**.
4. User opens **Outstanding Entity Report** and selects an entity row.
5. User clicks **Statement** or **Statement(aging)** from the entity view header.

**Why this report fits the scenario:** This is the entity communication workspace. It is designed for account-level review and statement output rather than single-document investigation.

---

## FAQs

**Q: Which report should I open first?**  
A: Start with the question you need to answer. Use **Outstanding Document Report** for one exact transaction, **Outstanding Aging Report** for aging and follow-up priority, and **Outstanding Entity Report** for one customer or supplier's overall position plus statement actions.

**Q: Why do I not see separate Debtor Aging Report and Creditor Aging Report menu items?**  
A: This applet uses shared report screens for both sides. Use **ARAP Type** to switch between AR and AP results.

**Q: What filters are available on the listing pages?**  
A: The shared listing filters are **Entity**, **Company**, and **ARAP Type**, plus keyword search. If users type a keyword, it must be at least 3 characters long.

**Q: How is aging shown in this applet?**  
A: The current aging screen shows **Days**, six dynamic month columns based on the current month and previous months, plus **6 Month+**. It does not show the classic `Current`, `1-30`, `31-60`, `61-90`, and `90+` layout.

**Q: Can I generate a formal statement from this applet?**  
A: Yes. Open **Outstanding Entity Report**, select an entity row, and use **Statement** or **Statement(aging)**. If the applet shows **Please setup the default printable format**, configure the required default format first in **Printable Format Settings**.

**Q: Can I edit, settle, or post transactions from this applet?**  
A: No. This applet is for review, drill-down, export, print, and statement generation. It does not expose posting or settlement actions for the source transactions.

**Q: Can I use this as a historical month-end or prior-date aging snapshot?**  
A: Not directly from the current UI. The listing screens do not expose an **As of Date** filter, so the applet is best for current outstanding review rather than user-entered historical cutoff reporting.

**Q: What is the difference between Outstanding Document Report and Outstanding Entity Report?**  
A: **Outstanding Document Report** is document-level and is used for detailed transaction review. **Outstanding Entity Report** is grouped by entity and is used for entity summary review plus statement actions.

**Q: Can I export the report results?**  
A: Yes. Each main listing screen includes an **Export** button for the current grid results.
