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

The **Debtor and Creditor Report Applet** is a reporting applet for reviewing current outstanding Accounts Receivable (AR) and Accounts Payable (AP) records. In the actual applet, debtor and creditor analysis is handled through the same shared report screens rather than separate debtor-only and creditor-only menus.

The main workspaces users will see are:
- **Outstanding Document Report**
- **Outstanding Aging Report**
- **Outstanding Entity Report**

Use the **ARAP Type** filter to switch between receivable-focused and payable-focused results.

{{< callout type="info" >}}
**What users should expect in the sidebar**
- **Outstanding Document Report** shows document-level outstanding transactions.
- **Outstanding Aging Report** shows month-based aging buckets and drill-down details.
- **Outstanding Entity Report** shows balances grouped by entity and provides statement actions.
{{< /callout >}}

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

**With Debtor and Creditor Report Applet:**
- You get a **shared AR/AP reporting workspace** with filters for **Entity**, **Company**, and **ARAP Type**.
- You can move from **entity summary** to **document detail** without leaving the applet.
- The aging report shows **dynamic month columns**, a **Days** value, and the underlying outstanding documents.
- Each listing includes an **Export** action for the current grid results.
- The entity view supports **Statement** and **Statement(aging)** actions once printable formats are configured.

{{< figure src="/images/debtor-and-creditor-report-applet/debtor-creditor-infographic.jpg" alt="Debtor and Creditor Report Applet overview" caption="Debtor and Creditor Report Applet overview. The applet centers on outstanding documents, month-based aging, entity summaries, and statement generation." >}}

---

## The Reporting Framework: Understanding the Screens

Before jumping into each report, it helps to understand what is shared across the applet.

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

### For AR or AP Officers: Review Monthly Outstanding Balances
Your goal is to review current outstanding balances by month and then drill into the supporting records.

1. Open **Outstanding Aging Report** from the sidebar.
2. Use **Entity**, **Company**, and **ARAP Type** to narrow the results.
3. If you use keyword search, enter at least 3 characters.
4. Run the search and review the **Days**, month columns, **6 Month+**, **ARAP Doc Open**, and **ARAP Balance** values.
5. Click a row to open **Aging Report Transactions**.
6. Use the **Main** tab for the selected record summary.
7. Use **Outstanding Docs** to review the linked outstanding documents.
8. Use the listing-level **Export** button if you need the current result set outside the applet.

### For Finance Users: Trace a Specific Outstanding Document
Your goal is to understand one outstanding transaction in detail.

1. Open **Outstanding Document Report**.
2. Search by keyword or filter by **Entity**, **Company**, and **ARAP Type**.
3. Click the document row you want to inspect.
4. Review the tabs in **View Outstanding Document**: **Details**, **Account**, **Line Items**, **Delivery Details**, **Settlement**, **Department**, **Contra**, and **Doc Link**.
5. If needed, open deeper drill-downs from the **Line Items** or **Settlement** tabs.

### For Teams Sending Statements by Entity
Your goal is to open an entity summary and generate the available statement output.

1. Open **Outstanding Entity Report**.
2. Filter the grid and select the required entity row.
3. Review **Entity Details** and **Transaction Docs** in the entity view.
4. Use **Statement** for the transaction-based statement action.
5. Use **Statement(aging)** for the aging-based statement action.
6. If the applet shows **Please setup the default printable format**, go to **Settings > Printable Format Settings** and configure the required default format first.

---

## Deep-Dive: The Report Workspaces

### 1. Outstanding Document Report (The Transaction-Level Workspace)
This is the default landing page when the applet opens. It is the best starting point when users need document-level visibility.

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
| **Details** | Main document-level information. |
| **Account** | Account-related information for the selected document. |
| **Line Items** | Transaction lines for the document. |
| **Delivery Details** | Delivery-related information when present. |
| **Settlement** | Settlement records tied to the document. |
| **Department** | Department allocation details. |
| **Contra** | Contra information for the document. |
| **Doc Link** | Linked documents and document relationships. |

{{< callout type="tip" >}}
**Best use case:** Start in **Outstanding Document Report** when the question is "Which exact document is still open?" rather than "Which entity has the balance?"
{{< /callout >}}

### 2. Outstanding Aging Report (The Month-Based Aging Workspace)
This screen groups results by entity and then shows how open amounts fall into dynamic month buckets.

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
| **Outstanding Docs** | Linked outstanding documents for the selected row. |

{{< callout type="tip" >}}
**What to tell users:** There is no separate **Debtor Aging Report** or **Creditor Aging Report** menu in this applet. Use **ARAP Type** on **Outstanding Aging Report** to get the view you need.
{{< /callout >}}

### 3. Outstanding Entity Report (The Entity Summary and Statement Workspace)
This screen is the summary-level view by entity and the place where statement actions are exposed.

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
| **Transaction Docs** | The entity's related transaction documents. |

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
This setup is important if users need the entity-level statement actions.

| Area | What users see |
|-----|-----------------|
| **Listing** | `Format Code`, `Format Name`, `File Name`, `File Size`, `Uploaded Date`, and `Uploaded By` |
| **Add Printable Format** | `Format Code`, `Format Name`, `Type`, `Default`, and file upload / drag-and-drop |
| **Edit Printable Format** | The same fields plus download and delete actions |

Use **Type** to choose one of the two statement formats supported in this applet:
- `STATEMENT_OF_ACCOUNT_TRANSACTION`
- `STATEMENT_OF_ACCOUNT_AGING`

The uploaded file must be a **`.jrxml`** file. Mark the format as **Default** if you want the entity view buttons to use it automatically.

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

### Scenario 2: Investigate a Disputed Outstanding Document
**The Situation:** A customer or supplier disputes one document and the team needs the supporting detail quickly.
**The Workflow:**
1. Open **Outstanding Document Report**.
2. Search for the document or filter by entity and company.
3. Open the row in **View Outstanding Document**.
4. Check **Details** for the header information.
5. Check **Settlement** for matching settlement records.
6. Check **Contra** and **Doc Link** if the balance depends on linked or offsetting transactions.

### Scenario 3: Prepare Statement Actions for Entity Review
**The Situation:** The finance team wants to use the statement buttons in the entity view, but the actions must be ready before users rely on them.
**The Workflow:**
1. Admin opens **Settings > Printable Format Settings**.
2. Add or edit the required **`.jrxml`** format for `STATEMENT_OF_ACCOUNT_TRANSACTION` and/or `STATEMENT_OF_ACCOUNT_AGING`.
3. Mark the correct format as **Default**.
4. User opens **Outstanding Entity Report** and selects an entity row.
5. User clicks **Statement** or **Statement(aging)** from the entity view header.

---

## FAQs

**Q: Why do I not see separate Debtor Aging Report and Creditor Aging Report menu items?**  
A: This applet uses shared report screens for both sides. Use **ARAP Type** to switch between AR and AP results.

**Q: What filters are available on the listing pages?**  
A: The shared listing filters are **Entity**, **Company**, and **ARAP Type**, plus keyword search. If users type a keyword, it must be at least 3 characters long.

**Q: How is aging shown in this applet?**  
A: The current aging screen shows **Days**, six dynamic month columns based on the current month and previous months, plus **6 Month+**. It does not show the classic `Current`, `1-30`, `31-60`, `61-90`, and `90+` layout.

**Q: Can I generate a formal statement from this applet?**  
A: Yes. Open **Outstanding Entity Report**, select an entity row, and use **Statement** or **Statement(aging)**. If the applet shows **Please setup the default printable format**, configure the required default format first in **Printable Format Settings**.

**Q: What is the difference between Outstanding Document Report and Outstanding Entity Report?**  
A: **Outstanding Document Report** is document-level and is used for detailed transaction review. **Outstanding Entity Report** is grouped by entity and is used for entity summary review plus statement actions.

**Q: Can I export the report results?**  
A: Yes. Each main listing screen includes an **Export** button for the current grid results.
