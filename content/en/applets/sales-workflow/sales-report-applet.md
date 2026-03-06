---
title: "Sales Report Applet"
description: "Comprehensive sales analytics and reporting for revenue tracking, performance monitoring, and data-driven decision-making"
tags:
- sales-reporting
- revenue-tracking
- performance-analytics
- sales-management
- financial-reporting
weight: 120
---

## Purpose and Overview

The **Sales Report Applet** is a powerful tool designed to analyze sales records and performance. It helps teams track revenue, monitor trends, and spot opportunities or issues over time. The applet lets users review, compare figures and periods; and assess team or product performanceâ€”providing the data and views needed to support data-driven decisions.

{{< callout type="info" >}}
**Core Concept**: The applet links **what** you sold (transactions and items) to **who** sold it (salesperson or team), **where** (branch or channel), and **when** (daily, monthly, yearly)â€”so you can slice and analyze performance from every angle.
{{< /callout >}}

## Key Features Overview

### Who Benefits from This Applet?

**Business Owners & Directors:**
- Real-time visibility into overall sales performance
- Clear revenue tracking across periods (daily, monthly, yearly)
- Identification of top-performing products, branches, or sales teams
- Data-driven strategic decision-making
- Improved financial control and business growth planning

**Sales Managers:**
- Monitor team sales performance efficiently
- Track achievement against sales targets
- Analyze sales trends and product performance
- Identify underperforming areas and take corrective action
- Generate performance reports for review meetings

**Sales Executives / Sales Staff:**
- View personal sales performance and transaction history
- Track progress toward assigned sales targets
- Improve accountability and performance transparency
- Access historical sales data for customer follow-up

**Finance & Accounts Teams:**
- Accurate revenue verification and reconciliation
- Exportable sales reports for accounting and audit purposes
- Support tax reporting and financial statement preparation
- Reduced manual compilation of sales data
- Improved reporting accuracy and consistency

**Operations & Inventory Teams:**
- Identify fast-moving and slow-moving products
- Support demand forecasting and stock planning
- Monitor the impact of sales on inventory levels
- Improve replenishment planning

### What Problems Does This Solve?

**The Manual Sales Reporting Problem:**

Traditional sales reporting often relies on spreadsheets and manual compilation. Common issues include:
- Delayed compilation of daily and monthly sales reports
- Human errors in manual calculations
- Limited visibility into real-time sales performance
- Inconsistent data across branches or departments
- Difficulty tracking historical sales records
- Time-consuming reconciliation with finance and inventory teams
- Lack of centralized reporting for management review

**The Sales Report Applet Solution:**

- **Automated calculations** - Accurate totals, summaries, and performance metrics without manual errors
- **Centralized data management** - All sales records stored securely in one system
- **Advanced filtering & analysis** - Analyze sales by date, branch, product, salesperson, or customer
- **Performance visibility** - Monitor individual, team, and company-wide sales performance
- **Historical tracking** - Access and compare past sales data for trend analysis
- **Export-ready reports** - Generate reports suitable for finance, audit, and management review
- **Integration ready** - Seamlessly supports accounting, inventory, and financial modules

## Key Features Overview

{{< cards >}}
  {{< card title="Reporting & History" subtitle="Daily/weekly/monthly and document-level views of past and current sales" link="#reporting--history" >}}

  {{< card title="Cashflow & Profitability Analysis" subtitle="Daily sales with cashflow insight and GP by salesman" link="#cashflow--profitability-analysis" >}}

  {{< card title="Multi-Dimensional Reporting" subtitle="Focused views by item code, salesman, document, serial, and branch" link="#multi-dimensional-reporting" >}}

  {{< card title="Advanced Search & Filtering" subtitle="Filter by calculation set, type, and more for precise analysis" link="#advanced-search--filtering" >}}
{{< /cards >}}

{{< figure src="/images/sales-report-applet/sales-report-overview-infographic.png" alt="Infographic showing before and after view of manual sales reporting versus using the Sales Report Applet, and the user roles who benefit" caption="From Manual Spreadsheets to Clear Insights: Before (delayed, error-prone reports) vs After (automated calculations, centralized records, advanced analysis) and who benefits from the Sales Report Applet." >}}

## Key Concepts

### Understanding the Sales Report Framework

The Sales Report Applet organizes data so you can answer the right business questions:

| Aspect | Component | Practical Example |
|--------|-----------|-------------------|
| **Who** sold? | Salesperson / Team / Branch | Top performer this month, branch comparison |
| **What** was sold? | Product / Item / Document | Best-selling SKU, revenue by item code |
| **When** did it sell? | Date / Period / Year | Daily figures, month-over-month, YoY |
| **How much?** | Revenue / Quantity / Margin | Totals, summaries, profitability |

A **calculation set** is the rule that defines *how* your figures are produced (e.g., by invoice date vs delivery date, and which document types count). Picking the same calculation set as your team or finance ensures you are all looking at the same definition of "sales."

{{< callout type="tip" >}}
**Real-World Example**: A sales manager (WHO) checks October sales (WHEN) for the Northern branch (WHERE). The report shows product X (WHAT) contributed 30% of revenue with strong margin (HOW MUCH)â€”enabling a decision to increase stock and set higher targets for Q4.
{{< /callout >}}

### Report Hierarchy at a Glance

```
Organization
â”‚
â”œâ”€â”€ Period (Daily / Monthly / Yearly) â”€â”€â†’ WHEN
â”‚
â”œâ”€â”€ Dimension (Branch / Team / Product / Document) â”€â”€â†’ WHO / WHAT
â”‚   â”‚
â”‚   â””â”€â”€ Figures (Revenue, Quantity, Margin) â”€â”€â†’ HOW MUCH
â”‚
â””â”€â”€ Calculation Set & Type â”€â”€â†’ HOW figures are derived
```

**Flow Through the Hierarchy:**

1. **Period** - Choose the time slice (daily, monthly, yearly)
2. **Dimension** - Slice by salesman, branch, product, or document
3. **Figures** - Revenue, quantity, marginâ€”calculated from your chosen basis
4. **Calculation Set** - Defines *how* figures are derived (e.g., invoiced vs delivered sales)

This structure enables:
- **Accurate comparisons** across periods and dimensions
- **Flexible reporting** by salesman, document, item code, or serial number
- **Clear traceability** via audit trail and report history
- **Consistent metrics** for finance and operations

---

## Quick Start Guide

Get up and running quickly with these essential workflows.

{{< figure src="/images/sales-report-applet/main-listing.png" alt="Sales Report Applet main listing page showing report list or summary view with period and filters" caption="Sales Report main listing: View reports, select period, and apply filters from the main screen." >}}

### For Business Owners & Directors: View Overall Performance

**Goal:** See real-time sales performance and key metrics in a few steps.

1. **Navigate**: Go to **Sales Report** (or **Reports** > **Sales Report**) from the sidebar
2. **Select period**: Use the period selector to choose date range (e.g., This Month, Last Quarter, YTD)
3. **View summary**: Review revenue totals, trends, and top performers (branches, products, or teams)
4. **Drill down**: Click into a row or use filters to compare periods or assess team/product performance
5. **Export**: Click **Export** (or **Print**) to generate reports for board meetings or strategic planning

**What happens next?** Exported reports can be shared with stakeholders or used for month-end review. Refresh the view to see the latest data.

**Pro Tip:** Set default date ranges and favorite views in settings to speed up daily review.

---

### For Sales Managers: Monitor Team Performance

**Goal:** Track team sales, targets, and trends for review meetings.

1. **Navigate**: Go to **Sales Report** and select **By Salesperson** or **Team** view from the dimension dropdown or sidebar
2. **Set period**: Select the reporting period (e.g., current month) in the date range filter
3. **Review performance**: Check the listing or summary for individual and team figures; compare to targets if displayed
4. **Identify gaps**: Use filters (branch, product, date) to spot underperforming areas or products
5. **Generate report**: Click **Export** or **Print** to create performance reports for team meetings

**Going on Leave?** Ensure your deputy has access to the same report views or use delegation if supported.

---

### For Sales Executives: Check Personal Performance

**Goal:** View your own sales figures and progress toward targets.

1. **Navigate**: Go to **My Sales** (if available) or **Sales Report** and ensure the view is filtered to your user
2. **Select period**: Choose daily, weekly, or monthly view from the period selector
3. **Review figures**: See your transaction history and running totals in the listing or summary
4. **Track targets**: Compare your numbers to assigned targets if your organization displays them in the applet
5. **Use history**: Open past periods to pull data for customer follow-up or dispute resolution

**Pro Tip:** Bookmark or add **My Sales** / **Sales Report** to your favorites for quick access.

---

### For Finance & Operations: Verify and Export Data

**Goal:** Reconcile revenue and export reports for accounting or inventory planning.

1. **Navigate**: Go to **Sales Report** and apply filters (e.g., by document type, branch) from the filter bar
2. **Verify totals**: Cross-check revenue and figures with source documents or the general ledger
3. **Select calculation set**: Choose the correct calculation set (e.g., invoiced sales, delivered sales) so the basis matches finance
4. **Export**: Click **Export** and select format (e.g., Excel, PDF) for accounting, audit, or tax
5. **Share**: Send the exported file to finance or operations using your organizationâ€™s process

**Pro Tip:** Use the same calculation set and date range as your accounting period for consistent reconciliation.

---

### For Admins: Initial System Setup

**Goal:** Get the Sales Report applet ready for users in 4 steps.

**Step 1: Configure Report Types & Dimensions** (`Settings > Application Setting` > **Report Types** / **Dimensions**)
- Enable the dimensions you need: by salesman, by document, by item code, by serial number
- Set default report type or template if the applet supports it

{{< figure src="/images/sales-report-applet/application-setting.png" alt="Application setting where the user can hide and shown which side bar menu they want to have in the applet" >}}

**Step 2: Set Access & Permissions** (`Settings > Access` or role permission settings)
- Grant view access by role (e.g., all staff can view; managers see team data)
- Allow export for users who need to share reports

{{< figure src="/images/sales-report-applet/role-perm.png" alt="Seeting which the admin or other staff can set which user can access and have permission on specific setting" >}}

**Step 3: Set Defaults** (`Settings > Sales Report` > **Default Settings**)
- Set default date range (e.g., current month) and default calculation set
- Configure export formats (Excel, PDF) if applicable

{{< figure src="/images/sales-report-applet/set-default.png" alt="Set the default setting on the applet, eg: set default branch and default location on the applet" >}}

**Step 4: Test**
- Run a report as a business owner, sales manager, and salesperson
- Export a sample report and confirm figures match expectations

{{< figure src="/images/sales-report-applet/export-1.png" alt="Export reports in pdf" >}}

{{< figure src="/images/sales-report-applet/export-2.png" alt="Export reports in pdf" >}}

**Ongoing:** Review calculation sets when you add new document types or change accounting rules so reports stay aligned with finance.

---

{{< callout type="tip" >}}
**New to the system?** Start with the basics:
1. Business owners should open **Sales Report** and review the default summary view
2. Sales managers should run a **By Salesperson** or **By Team** report for the current month
3. Admins should complete **Initial System Setup** above, then review **Configuration & Settings** for detailed options
{{< /callout >}}

---

## Reporting & History

**Enable accurate review of past and current sales.**

Reporting & History gives you a single place to review and compare sales over time, with full traceability.

**What you get:**
- Centralized storage of sales records
- Detailed transactional analytics
- Historical data comparison across selected periods
- Built-in audit trail for report traceability

**Typical use:**
- Review daily or monthly figures before closing the period
- Compare this month vs last month, or this year vs last year
- Support audits with a clear report history

---

## Cashflow & Profitability Analysis

**Helps management understand revenue flow and product profitability.**

Use the applet to see not just *how much* was sold, but *how* it contributes to cashflow and profit.

**What you get:**
- Revenue by period (daily, monthly, yearly)
- Contribution by product, branch, or channel
- Margin or profitability views where configured
- Support for cashflow planning and strategic decisions

---

## Multi-Dimensional Reporting

**Generate reports across multiple business perspectives.**

Slice sales data the way your business runs:

| Dimension | Use Case |
|-----------|----------|
| **By Salesman** | Individual performance, target vs actual |
| **By Document** | Invoice-level or order-level analysis |
| **By Item Code** | Product performance, fast/slow movers |
| **By Serial Number** | Traceability, warranty or service follow-up |

Choose the dimension that answers your questionâ€”whether for sales meetings, inventory planning, or finance reconciliation.

---

### Core Report Views in This Applet

Under the hood, the Sales Report Applet exposes several focused views (routes) that answer different business questions:

| Report View | Route (for reference) | What It Shows | Typical Questions Answered |
|-------------|------------------------|---------------|----------------------------|
| **Sales Report by Item Code** | `sales-report-by-item-code` | Sales and margin by item/SKU, with category breakdowns and optional landed cost | Which products are fast/slow movers? Which SKUs drive the most revenue or margin? |
| **Sales Report by Salesman** | `sales-report-by-salesman` | Net sales, cost, GP, GP%, and deltas by salesperson | Who are my top performers? Where is margin leaking by salesperson? |
| **Daily Sales Report with Cashflow Analysis** | `daily-sales-report-cashflow` | Daily sales transactions with cashflow-related fields (payment info, document links) | What was sold today and how did it impact cashflow? Which branches or customers drove collections? |
| **Sales Report by Document** | `sales-report-by-document` | Sales grouped at document level (invoices, etc.) with document metadata | Which invoices contribute most to revenue? Which documents need follow-up? |
| **Sales Report by Serial Number** | `sales-report-by-serial-number` | Sales and movement by serialised items | Where is each serialised unit now? Which customer bought a specific serial number? |
| **Daily/Weekly/Monthly Summary** | `sales-report-by-daily-weekly-monthly` | Aggregated sales by period | How are sales trending day by day, week by week, or month by month? |
| **Daily GP by Salesman** | `daily-gp-by-salesman` | Gross profit and GP% by salesperson on a daily basis | Which days and which salespeople are driving (or dragging) profitability? |
| **Multi-Branch Sales, Purchase & Collection** | `multi-branch-sales-purchase-collection` | Consolidated view across branches for sales, purchases, and collections | How is each branch performing, and where are collections lagging? |
| **Daily Collection Summary & Collection with Invoice Detail** | `daily-collection-summary`, `collection-with-invoice-detail` | Collections by day, with drill-down to invoice-level detail | How much was collected today and which invoices were settled? |
| **Receipt with Credit Card & Sales Item Collection Invoice** | `receipt-with-credit-card`, `sales-item-collection-invoice` | Card-based receipts and item-level collection details | How much of todayâ€™s sales were paid by card? Which items are tied to each collection invoice? |

These views all share a common pattern: advanced search at the top, a configurable ag-grid listing, and optional column visibility based on permissions.

---

### Sales Report by Item Code

Use **Sales Report by Item Code** when you want a detailed product lens on performance.

- See sales, returns, net sales, cost, GP, and GP% per SKU, with category breakdowns.
- Optionally include landed cost and landed GP for a more realistic margin picture.
- Ideal for product managers and inventory teams deciding which items to promote, phase out, or reprice.
- Route reference (for admins): `sales-report-by-item-code`.

{{< figure src="/images/sales-report-applet/sales-report-by-item-code-report.png" alt="Sales Report by Item Code view showing product-level sales, returns, net sales, cost and GP in a grid" caption="Sales Report by Item Code: Analyze product-level sales, returns, and margins in a configurable grid view." >}}

---

### Sales Report by Salesman

Use **Sales Report by Salesman** to understand how each salesperson or team is performing.

- View net sales, cost, GP, GP%, and delta metrics per salesperson.
- Combine with **Daily GP by Salesman** to see profitability trends by day and by person.
- Great for sales managers tracking targets, coaching, and incentive plans.
- Route references: `sales-report-by-salesman`, `daily-gp-by-salesman`.

{{< figure src="/images/sales-report-applet/sales-report-by-salesman.png" alt="Sales Report by Salesman view showing net sales, cost, GP and GP% per salesperson in a grid" caption="Sales Report by Salesman: View individual and team performance with net sales, cost, and gross profit metrics." >}}

---

### Daily GP by Salesman

Use **Daily GP by Salesman** to see gross profit and GP% by salesperson on a daily basis.

- Identify which days and which salespeople drive or drag profitability.
- Complements the main Sales Report by Salesman with a time-sliced view.
- Route reference: `daily-gp-by-salesman`.

{{< figure src="/images/sales-report-applet/daily-gp-by-salesman.png" alt="Daily GP by Salesman view showing gross profit and GP% by salesperson per day" caption="Daily GP by Salesman: Track daily profitability by salesperson for coaching and target review." >}}

---

### Sales Report by Document

Use **Sales Report by Document** when you need invoice-level or order-level analysis.

- See sales grouped by document (invoices, orders) with document metadata.
- Identify which invoices or documents contribute most to revenue.
- Useful for finance reconciliation, follow-up, and audit trails.
- Route reference: `sales-report-by-document`.

{{< figure src="/images/sales-report-applet/sales-report-by-document.png" alt="Sales Report by Document view showing sales grouped by document with document numbers and details" caption="Sales Report by Document: Analyze sales at document level with invoice and order details." >}}

---

### Daily Sales Report with Cashflow Analysis

Use **Daily Sales Report with Cashflow Analysis** when you care about both revenue and cash movement.

- Shows daily sales transactions with rich document metadata and payment information.
- Helps finance and operations see how sales translate into cash, by branch and customer.
- Useful for daily cashflow monitoring, reconciliation, and spotting collection issues early.
- Route reference: `daily-sales-report-cashflow`.

{{< figure src="/images/sales-report-applet/daily-sales-report-cashflow.png" alt="Daily Sales Report with Cashflow Analysis view showing daily sales transactions and payment information" caption="Daily Sales Report with Cashflow Analysis: View daily sales with cashflow and payment details by branch and customer." >}}

---

### Daily / Weekly / Monthly Summary

Use the **Daily/Weekly/Monthly** summary view when you want a clean time-based picture.

- Aggregate sales at the day, week, or month level.
- Quickly compare recent periods without diving into line-level detail.
- Helpful for management dashboards, performance reviews, and trend spotting.
- Route reference: `sales-report-by-daily-weekly-monthly`.

{{< figure src="/images/sales-report-applet/sales-report-by-daily-weekly-monthly-1.png" alt="Daily Weekly Monthly summary view showing aggregated sales by day, week or month" caption="Daily/Weekly/Monthly Summary: Compare sales trends across periods in a single view." >}}

---

### Multi-Branch Sales, Purchase & Collection

Use **Multi-Branch Sales, Purchase & Collection** to see the bigger picture across locations.

- Consolidates sales, purchases, and collections by branch in a single view.
- Makes it easy to compare branches, identify underperforming locations, and plan support or investment.
- Often used by regional managers and finance teams for branch reviews.
- Route reference: `multi-branch-sales-purchase-collection`.

{{< figure src="/images/sales-report-applet/multi-branch-sales-purchase-collection.png" alt="Multi-Branch Sales Purchase and Collection view showing consolidated sales, purchases and collections by branch" caption="Multi-Branch Sales, Purchase & Collection: Compare branch performance and collections in one consolidated view." >}}

---

## Advanced Search & Filtering

**Improves efficiency and enables precise data analysis.**

Narrow down reports so you see only what matters:

- **By calculation set** â€“ Use the correct basis (e.g., invoiced sales, delivered sales) as configured in the applet
- **By type** â€“ Filter by document type, transaction type, or category
- **By date range** â€“ Daily, weekly, monthly, custom range
- **By branch, team, product, or customer** â€“ Focus on a specific segment

Consistent use of filters ensures that comparisons and exports are accurate and aligned across teams.

{{< figure src="/images/sales-report-applet/advanced-search.png" alt="Advanced Search and Filtering panel showing filters for calculation set, date range, branch and other criteria" caption="Advanced Search & Filtering: Refine report results using calculation set, date range, branch, and other filters." >}}

---

## Configuration & Settings

Configure how sales data is aggregated, who can see what, and how reports behave.

{{< figure src="/images/sales-report-applet/settings-page.png" alt="Sales Report Applet Settings page showing configuration options such as Calculation Sets and Report Types" caption="Settings page: Access calculation sets, report types, and other Sales Report configuration options." >}}

#### Report Definitions & Calculation Sets (`Settings > Sales Report`)

**Where:** `Settings > Sales Report` (or equivalent) â€” **Calculation Sets** / **Report Definitions**

**What:** A **calculation set** defines how sales figures are calculatedâ€”for example, by invoice date, delivery date, or document typeâ€”and which source documents feed the report. This ensures that "sales" means the same thing across the organization (e.g., invoiced vs delivered). Everyone using the same set gets comparable numbers.

**Typical options:**
- Calculation set name and description
- Source (e.g., invoiced sales, delivery orders)
- Date basis (document date, posting date, etc.)
- Inclusion/exclusion of certain document types

---

#### Report Types & Dimensions (`Settings > Sales Report`)

**Where:** `Settings > Sales Report` â€” **Report Types** / **Dimensions**

**What:** Configure which dimensions are available (by salesman, by document, by item code, by serial number) and any report templates or default views. Controls what appears in multi-dimensional reporting and dropdowns.

---

#### Access & Permissions (`Settings > Access` or role/permission settings)

**Where:** `Settings > Access` or **Role / Permission** settings for the Sales Report Applet

**What:** Define who can:
- View sales reports (all branches vs own branch, all team vs own)
- Export reports
- Change calculation set or sensitive filters

---

#### Default Periods & Favorites (`Settings > Sales Report`)

**Where:** `Settings > Sales Report` â€” **Default Settings** or **User Preferences**

**What:** Set default date range (e.g., current month), default calculation set, and optional favorite views so users land on the right report quickly.

---

#### Export & Integration (`Settings > Sales Report`)

**Where:** `Settings > Sales Report` â€” **Export Formats** / **Integration**

**What:** Configure export formats (e.g., PDF, Excel) and any integration with accounting, inventory, or BI tools so that reports are export-ready and consistent with downstream systems.

---

## FAQ

**Q: Why do my sales figures differ from the finance teamâ€™s numbers?**  
A: You are likely using a different **calculation set** or date range. Finance often uses a set based on invoice date or posting date. In Sales Report, select the same calculation set and period that finance uses for reconciliation, and ensure filters (branch, document type) match. If numbers still differ, compare source documents or check with your admin.

**Q: How do I run a report for one branch only?**  
A: Use the **Branch** (or **Location**) filter on the main Sales Report screen. Select the branch you want before applying the date range and calculation set. The listing and totals will then show only that branchâ€™s sales.

**Q: How do I compare this month to last month (or this year to last year)?**  
A: Use the period selector and any **comparison** or **variance** option in the Sales Report. Select the two periods (e.g., This Month vs Last Month); the report will show both figures and variance where the applet supports it. If there is no comparison view, run two reports (one per period) and compare the exported totals.

**Q: Can I export to Excel for month-end close?**  
A: Yes. Open Sales Report, set the calculation set and date range to match your closing period, apply any filters (e.g., branch), then click **Export** and choose Excel (or the format your finance team uses). Use the same settings every month for consistent month-end reports.

**Q: How do I see only my own sales as a salesperson?**  
A: If your organization uses **My Sales**, open that from the sidebarâ€”it shows only your transactions. Otherwise, open **Sales Report**, use the **By Salesperson** (or similar) filter, and select your name. If your role is restricted to â€œownâ€ data, you may already see only your sales by default.

