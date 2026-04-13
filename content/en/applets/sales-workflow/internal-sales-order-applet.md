---
title: "Sales Order (Internal)"
description: "Full lifecycle sales order management for Wavelet ERP covering order entry, fulfillment, delivery, and reporting"
tags:
- sales-order
- order-management
- fulfillment
- delivery-planning
- ecomsync
weight: 20
---

{{< callout type="warning" >}}
**Under Review**: This applet is still under review.
{{< /callout >}}

## Purpose and Overview

The **Sales Order (Internal) Applet** is a full lifecycle sales order management module for Wavelet ERP. It covers order creation, editing, approval, fulfillment, delivery planning, e-commerce synchronization, reporting, and file import/export. It is designed to centralize sales order data, enforce operational controls (credit limits, workflow status, posting status), and connect downstream processes such as pick/pack, delivery, invoicing, and accounting.

{{< callout type="info" >}}
**Core Concept**: A Sales Order is the master document that links **who** is buying (customer), **what** is being sold (items and prices), **how** it is fulfilled (delivery and pick/pack), and **how** it is settled (AR/AP, receipt vouchers, and posting status).
{{< /callout >}}

## Key Features Overview

### Who Benefits from This Applet?

**Sales Operations and Order Entry:**
- Structured sales order creation and editing
- Fast search and listing of orders and line items
- Customer, billing, and shipping details in one place
- Quick conversion to downstream documents

**Warehouse and Fulfillment Teams:**
- Pick Pack Queue with grouped sales orders
- Delivery Items listing and printing
- Delivery plans and calendar view
- Accurate stock and delivery status visibility

**Finance and AR/AP Teams:**
- Posting status control (DRAFT, FINAL, VOID, DISCARD, CLOSE)
- Credit limit enforcement
- Settlement, ARAP, receipt voucher, and contra visibility
- Audit-ready reporting and export

**E-commerce Operations:**
- Marketplace order visibility and sync status
- Ecomsync dashboard, scheduler, and review management
- Lazada and Shopee order handling

**Management and Admins:**
- Detailed reports and line-level analytics
- Configurable settings and permissions
- Clear audit trail and operational control

### What Problems Does This Solve?

**The Manual Sales Order Problem:**

Traditional sales order handling is fragmented across spreadsheets, email threads, and disconnected systems. Common issues include:
- Duplicate data entry and inconsistent documents
- Delayed fulfillment due to missing delivery details
- Inaccurate stock and pricing updates
- Poor visibility into approval status and credit limits
- Difficulty tracking order history and changes

**The Sales Order (Internal) Applet Solution:**

- **Single source of truth** - One centralized sales order record across teams
- **Controlled posting** - DRAFT, FINAL, VOID, DISCARD, CLOSE with rules
- **Integrated fulfillment** - Pick/pack queue, delivery plans, and delivery items
- **E-commerce ready** - Marketplace integration and status visibility
- **Financial control** - Credit limit checks and settlement management
- **Reporting and export** - Detailed analytics and file exports

## Key Features Overview

{{< cards >}}
  {{< card title="Sales Order Core" subtitle="Create, edit, finalize, and control posting status" link="#sales-order-core" >}}

  {{< card title="Line Item Management" subtitle="Pricing, serial, batch, bin, and stock control" link="#line-item-management" >}}

  {{< card title="Delivery and Fulfillment" subtitle="Pick/pack, delivery items, and planning" link="#delivery-and-fulfillment" >}}

  {{< card title="E-commerce Sync" subtitle="Marketplace orders and sync status" link="#e-commerce-integration" >}}

  {{< card title="Reports and Analytics" subtitle="Detailed reporting and line-level visibility" link="#reports-and-analytics" >}}

  {{< card title="File Import and Export" subtitle="Bulk import and export of sales orders" link="#file-import-and-export" >}}

  {{< card title="Approval and Permissions" subtitle="Approval queues and permission control" link="#approval-and-permissions" >}}

  {{< card title="Settings and Personalization" subtitle="Configurable defaults and system control" link="#configuration--settings" >}}
{{< /cards >}}

{{< figure src="/images/internal-sales-order-applet/internal-sales-order-overview.png" alt="Sales Order (Internal) Applet overview showing the flow from order entry to fulfillment and reporting" caption="Sales Order (Internal) Applet: Order creation, fulfillment, delivery planning, and reporting in one flow." >}}

## Key Concepts

### Understanding the Sales Order Framework

| Aspect | Component | Practical Example |
|--------|-----------|------------------|
| **Who** is buying? | Customer / Entity | Retail customer or wholesale account |
| **What** is sold? | Line Items | Item A (Qty 10), Item B (Qty 5) |
| **How** is it fulfilled? | Delivery / Pick Pack | Delivery plan with assigned branch and location |
| **How** is it settled? | Posting / Settlement | FINAL status with settlement lines |

{{< callout type="tip" >}}
**Real-World Example**: A sales admin creates an Sales Order (Internal) for Customer X. The order is DRAFT until approved, then FINAL. Warehouse picks items using Pick Pack Queue, delivery is scheduled, and finance records settlement and invoices.
{{< /callout >}}

### Sales Order Lifecycle

```
Draft -> Final -> Fulfillment -> Delivery -> Settlement/Invoice -> Close
  |       |           |             |              |               |
  |       |           |             |              |               +--> Close (if enabled)
  |       |           |             |              +--> Receipt vouchers and ARAP
  |       |           |             +--> Delivery items and tracking
  |       |           +--> Pick/pack and warehouse posting
  |       +--> Credit limit and workflow validation
  +--> Edit and discard if required
```

---

## Quick Start Guide

Get started fast based on your role.

[![Sales Order (Internal) Applet Video](https://img.youtube.com/vi/L7nSvCluFbM/hqdefault.jpg)](https://youtu.be/L7nSvCluFbM?si=L5-JHPl_Yvp9oeGf)

{{< callout type="note" >}}
**Before you start**: Make sure the customer/entity exists, items are set up, and you have permission to create and FINAL orders.
{{< /callout >}}

### For Sales and Order Entry: Create Your First Sales Order

**Goal:** Create a valid sales order and submit it for fulfillment.

1. **Navigate**: Go to **Sales Order** from the sidebar
{{< figure src="/images/internal-sales-order-applet/so-create-1.png" alt="Sales Order sub menu" caption="Sales Order in Sales Order Applet." >}}

2. **Create**: Click **Create** and fill in Main Details
{{< figure src="/images/internal-sales-order-applet/so-create-2.png" alt="Create button" caption="Create button for creating new sales order." >}}

{{< figure src="/images/internal-sales-order-applet/so-create-form.png" alt="Create form in Sales Order Applet" caption="Create form on sales order applet." >}}
   - Branch, location, transaction date
{{< figure src="/images/internal-sales-order-applet/so-branch.png" alt="branch dropdown, location and transaction date" caption="Dropdown for user to choose the branch, delivery location and also transaction date." >}}
   - Customer/entity selection (from Customer Applet)
{{< figure src="/images/internal-sales-order-applet/so-entity.png" alt="Entity details field" caption="Entity Details for user to choose, which are created from Customer Applet." >}}
   - Sales agent and reference
{{< figure src="/images/internal-sales-order-applet/so-sales-agent.png" alt="Sales Agent in the create/edit Sales Order form. User can choose the Sales Agent either from dropdown or it will be auto populated from the Entity Details." >}}


3. **Confirm Billing & Shipping**:
   - Select billing and shipping addresses
{{< figure src="/images/internal-sales-order-applet/so-bill-to.png" alt="Bill to and Ship to tab" caption="Billing address and Shipping address tab" >}}

{{< figure src="/images/internal-sales-order-applet/so-select-billing.png" alt="Select Billing button" caption="Select Billing address" >}}

   - Copy billing to shipping if applicable

4. **Add Line Items**:
{{< figure src="/images/internal-sales-order-applet/so-line.png" alt="line items tab" caption="Add line items in the Sales Order" >}}
   - Search items or scan code
   {{< figure src="/images/internal-sales-order-applet/so-line-search.png" alt="SO line search" caption="Search line items which will be added in the Sales Order" >}}
   - Set quantity, price, discounts
   {{< figure src="/images/internal-sales-order-applet/so-quantity.png" alt="line items tab" caption="Set quantity, price, and discounts for the line item" >}}
   - Enter serial/batch/bin if required
   {{< figure src="/images/internal-sales-order-applet/so-batch.png" alt="batch tab" caption="Set batch number, quantity, issue date, expiry date and quantity" >}}


5. **Delivery Details**:
   - Select delivery branch and location
   {{< figure src="/images/internal-sales-order-applet/so-delivery.png" alt="delivery branch and location field" caption="User can choose the delivery branch and location from the drop down" >}}
   - Set requested delivery date and instructions
{{< figure src="/images/internal-sales-order-applet/so-create-4.png" alt="Input for billing address" caption="Fill up the Delivery Details in Ship To tab." >}}

6. **Optional Add-ons**:
   - Add settlement lines or attachments if required
   {{< figure src="/images/internal-sales-order-applet/so-settlement.png" alt="Settlement tab" caption="Add settlement type and choose the type from the dropdown" >}}

   {{< figure src="/images/internal-sales-order-applet/so-cash.png" alt="cash type settlement type" caption="Example of Settlement type: Cash." >}}
7. **Review**: Check totals, taxes, and any credit limit warnings
8. **Save**: Click **Create** to save as DRAFT
{{< figure src="/images/internal-sales-order-applet/so-create-5.png" alt="Save button to save the sales order" caption="Save created sales order." >}}

9. **Finalize and Verify**: Click **FINAL** to post the order and confirm it appears in Pick Pack Queue or Delivery Items (if you have access)

{{< figure src="/images/internal-sales-order-applet/so-create-6.png" alt="Final button" caption="Final button to post the order in Sales Order Applet." >}}

---

### For Warehouse and Fulfillment: Process Pick Pack Queue

**Goal:** Prepare and dispatch items for delivery.

1. **Navigate**: Go to **Pick Pack Queue**
2. **Filter**: Search by branch, date, or customer
{{< figure src="/images/internal-sales-order-applet/pick-pack.png" alt="Search filter in Pick Pack Queue" caption="Search filter in Pick Pack Queue." >}}
3. **Select Orders**: Grouped by Sales Order number

{{< figure src="/images/internal-sales-order-applet/so-pick-pack.png" alt="Pick Pack Queue listing with grouped sales orders and line items" caption="Pick Pack Queue: Grouped line items for fulfillment and delivery preparation." >}}

4. **Set Qty to Deliver**: Confirm delivery quantities
5. **Confirm Delivery Details**: Ensure delivery branch and location match
6. **Ready to Ship**: Create delivery jobs
7. **Post to Warehouse Picking Queue**: Send to WMS if enabled
8. **Print Delivery Items**: Generate delivery documents for dispatch
9. **Update Delivery Status**: Record delivered/partial status and remarks

**Result:** Orders move from sales entry to fulfillment and delivery execution.

---

### For Finance and AR/AP: Finalize and Settle

**Goal:** Ensure orders are financially valid and settled.

1. **Review Final Orders**: Ensure posting status is FINAL
2. **Check Credit Limit**: Verify credit limit checks passed
3. **Settlement**: Add settlement lines or receipt vouchers
4. **Generate Sales Invoice**: Use **Generate Sales Invoices** if enabled
5. **Export**: Use File Export or reports for reconciliation
6. **Audit**: Review **Events** and **Trace Document** for status changes and downstream links
7. **Close**: Set **CLOSE** when delivery and invoicing are complete (if enabled)

**Result:** Sales orders are financially closed and audit-ready.

---

### For Admins: Initial Setup

**Goal:** Configure the applet for consistent order processing.

1. **Set Defaults**: Branch, location, currency, posting status
2. **Configure Workflow**: Approval routing and finalization rules
3. **Enable Key Tabs**: Delivery, settlement, attachments, and ecomsync
4. **Define Printables**: Sales order and delivery formats
5. **Configure Email Templates**: Sales order email formats and recipients
6. **Set Permissions**: Role and team access controls
7. **Test Flow**: Create a test order and run through FINAL → Pick Pack → Delivery

**Result:** Users see the right menus, and orders follow a controlled lifecycle.

---

## Sales Order Core

### Sales Order Listing

The listing is the operational dashboard for sales orders. It provides advanced search and bulk actions:
- Search by document number, customer, date, or status
- Bulk actions: FINAL, DRAFT, DISCARD, VOID, PRINT
- Send email with template and printable format
- Marketplace bulk updates (if enabled)

{{< figure src="/images/internal-sales-order-applet/so-main-listing.png" alt="Sales Order main listing page with filters, bulk actions, and grid results" caption="Main Listing: Search and manage sales orders with bulk actions and filters." >}}

### Create and Edit Sales Orders

The edit screen uses tabs (or accordion panels in simplified UI). Tab order and visibility are controlled by settings and permissions, so some tabs may be hidden or re-ordered.

**Edit Sales Order: Tabs and What They Do**

| Tab | What it is for | Typical Actions |
|---|---|---|
| **Search Document** | Search and reference other documents during draft creation | Find a source document to base the order on (visible for TEMP/DRAFT only) |
| **Main Details** | Core header data for the sales order | Set branch, location, transaction date, customer, sales agent, currency, credit terms/limit, and posting actions (DRAFT/FINAL/VOID/CLOSE) |
| **Account** | Billing and shipping details | Manage bill-to/ship-to contacts and addresses, copy billing to shipping |
| **Lines** | Sales order line items | View and edit item lines, pricing, taxes, discounts, serial/batch/bin handling, line-level delivery fields |
| **ARAP** | Receivables/payables context | Review AR/AP balance or related financial info tied to the order |
| **Delivery Details** | Delivery-specific fields | Set delivery branch/location, requested dates, delivery logic, PIC details |
| **Delivery Plans** | Delivery scheduling | Create and view delivery plan entries and scheduling |
| **Settlement** | Payment/receipt entries | Add settlement lines, manage receipts, review settlement totals |
| **KO For** | Knock-off references | Match or import knock-off allocations (visible for TEMP/DRAFT only) |
| **Receipt Voucher** | Receipt voucher listing | View related receipt vouchers for this order |
| **Department Hdr** | Header-level department tagging | Apply department or cost center allocation at header level |
| **Trace Document** | Posting and traceability | Trace document flow, posting linkage, and downstream documents |
| **Contra** | Contra entries | View or add contra offsets linked to the order |
| **Doc Link** | Related documents | See linked documents (quotations, invoices, delivery docs, etc.) |
| **Attachments** | Supporting files | Upload and manage attachments for the order |
| **Export** | Export utilities | Export the order data when enabled |
| **Ecomsync** | Marketplace sync | View marketplace status, sync details, and printables for e-commerce orders |
| **Status** | Custom status tracking | Update configured custom status fields |
| **Events** | Activity history | View system events and status changes |
| **Gross Profit** | Profit visibility | View gross profit for the order (permission-based) |

**Line Item Editor Tabs (inside a line item)**

| Tab | What it is for | Typical Actions |
|---|---|---|
| **Item Details** | Core line item data | Quantity, unit price, discount, tax, UOM |
| **Grouped Item** | Bundle contents | Review child items for grouped or bundle items |
| **Serial Number** | Serial-controlled items | Scan or select serial numbers |
| **Batches** | Batch-controlled items | Assign batches and quantities |
| **Bin** | Bin-controlled items | Assign bin locations |
| **Stock Availability** | Availability check | View stock balance and availability by location |
| **MRP** | MRP linkage | Link to job orders if enabled |
| **Costing Details** | Cost and margin context | Review costing values when enabled |
| **Issue Link** | Issue/task linkage | Link this line to an issue or task record |
| **Sales History** | Historical sales data | Review past sales for the item |


### Posting Status Controls

| Status | Meaning | Typical Use |
|--------|---------|-------------|
| **DRAFT** | Draft document | Used during data entry and review |
| **FINAL** | Posted document | Approved and ready for fulfillment |
| **VOID** | Cancelled document | Cancelled after posting |
| **DISCARD** | Deleted draft | Removes draft before posting |
| **CLOSE** | Closed order | Prevent further processing |

## Approval and Permissions

Use approvals and permissions to control who can finalize, edit, or void orders.

- **Approval flow**: Configure routing and FINAL rules in settings to enforce checks before posting.
- **Credit limit control**: FINAL is blocked when customer credit limits are exceeded (if enabled).
- **Role permissions**: Restrict access to sensitive tabs (Settlement, Gross Profit, Export) and actions (VOID, CLOSE).
- **Audit visibility**: Use **Events** and **Status** tabs to review status history and changes.

## Line Item Management

Line items are the heart of the sales order. Use them to control pricing, fulfillment rules, and item-level validation:
- Edit existing line items; new lines are created in the Sales Order.
- Control pricing, tax, and discounts
- Group discount at document level
- Serial number validation
- Batch and bin handling
- Stock availability checks
- Costing details and sales history
- MRP job order linkage (if enabled)

{{< figure src="/images/internal-sales-order-applet/so-line-manage.png" alt="Line item management" caption="Line item listing." >}}

{{< figure src="/images/internal-sales-order-applet/so-line-edit.png" alt="Line item edit" caption="Edit line item in the applet." >}}

---

## Delivery and Fulfillment

### Delivery Details

- Delivery branch and location
- Requested delivery dates
- Delivery instructions and tracking

### Pick Pack Queue

- Grouped sales orders and line items
- Quantity to deliver vs balance
- Stock visibility at location and company level

{{< figure src="/images/internal-sales-order-applet/so-pick-pack.png" alt="Pick Pack Queue listing with grouped sales orders and line items" caption="Pick Pack Queue: Grouped line items for fulfillment and delivery preparation." >}}

### Delivery Items

- Delivery item listing for shipment
- Printable delivery documents
- Quick visibility of delivery status and remarks

{{< figure src="/images/internal-sales-order-applet/so-delivery-plan.png" alt="Delivery Items listing showing items prepared for shipment" caption="Delivery Items: Line-level delivery list with printing support." >}}

### Delivery Plan and Calendar

- Plan delivery sessions and schedules
- Calendar view for dispatch planning

{{< figure src="/images/internal-sales-order-applet/so-delivery-plan.png" alt="Delivery plan to create and view scheduled delivery sessions" caption="Delivery Plan: Schedule and manage delivery sessions." >}}

{{< figure src="/images/internal-sales-order-applet/so-calendar.png" alt="Delivery plan calendar view showing scheduled delivery sessions" caption="Delivery Plan Calendar: To view the schedule delivery on the calendar." >}}

---

## E-commerce Integration

- Ecomsync dashboard and scheduler
- Marketplace order visibility
- Reply to reviews and review tracking
- Lazada and Shopee order handling

{{< figure src="/images/internal-sales-order-applet/so-shopee-ecomsync.png" alt="Ecomsync dashboard showing marketplace sync status and order updates" caption="Shopee Ecomsync Dashboard: Marketplace sync status and order monitoring." >}}

{{< figure src="/images/internal-sales-order-applet/so-lazada-ecomsync.png" alt="Ecomsync dashboard showing marketplace sync status and order updates" caption="Lazada Ecomsync Dashboard: Marketplace sync status and order monitoring." >}}

---

## Reports and Analytics

- **Sales Order Detailed Report**: Date range filtering
- **SO Line with SI KO Report**: Knock-off and outstanding tracking
- **Line Items Listing**: Open qty and line-level visibility
- **Gross Profit View**: Enabled in order view (if permitted)

{{< figure src="/images/internal-sales-order-applet/so-detailed-report.png" alt="Sales Order Detailed Report with date range filtering and grouped results" caption="Sales Order Detailed Report: Detailed, grouped reporting by order and line." >}}

---

## File Import and Export

### File Import

- Upload CSV file
- Select delimiter
- Validate with helper checking and error list
- Use sample format for correct template

{{< figure src="/images/internal-sales-order-applet/so-file-import.png" alt="File Import page with CSV upload and delimiter selection" caption="File Import: Upload CSV files and validate sales order data." >}}

### File Export

- Generate export by transaction date range
- Track generation status
- Download export files for reconciliation

{{< figure src="/images/internal-sales-order-applet/so-file-export.png" alt="File Export listing showing report generation status and download actions" caption="File Export: Generate and download sales order exports." >}}

---

## Configuration & Settings

The Sales Order (Internal) Applet is highly configurable. Settings are accessed under:
`Settings`

{{< figure src="/images/internal-sales-order-applet/so-setting-page.png" alt="Settings page for Sales Order (Internal) Applet showing configuration modules" caption="Settings: Configure defaults, workflow, printables, and feature visibility." >}}

### Application Settings

Common toggles and defaults:
- Default branch and location
{{< figure src="/images/internal-sales-order-applet/so-def-branch.png" alt="Settings for default branch and location" caption="Settings: Configure default branch and location for the applet." >}}
- Column visibility and advanced search controls
{{< figure src="/images/internal-sales-order-applet/so-set-vis.png" alt="Applet sub menu setting" caption="Settings: Configure feature visibility." >}}

### Printable Format Settings

- Configure sales order print layouts
- Enable auto preview and batch printing

{{< figure src="/images/internal-sales-order-applet/so-print.png" alt="Printable format setting" caption="Settings: Configure printable format. Tick the printable format to set it as default." >}}

{{< figure src="/images/internal-sales-order-applet/so-add-print.png" alt="Add printable format setting" caption="Settings: Add and configure new printable format." >}}

### Branch and Settlement Settings

- Branch-specific settlement behavior
- Payment and receipt voucher defaults

{{< figure src="/images/internal-sales-order-applet/so-set-branch.png" alt="Add or edit branch" caption="Settings: Configure branch." >}}

### Email Templates

- Templates for sales order emails
- Configure recipients (billing, shipping)

{{< figure src="/images/internal-sales-order-applet/so-email-temp.png" alt="Add email template to be used in the applet" caption="Settings: Configure email templates used by the applet." >}}

### Sales Order Status

- Custom order status list
- Status tagging for reporting and tracking

{{< figure src="/images/internal-sales-order-applet/so-status.png" alt="Add or edit Sales Order Status" caption="Settings: Configure Sales Order status." >}}


### Feature Visibility and Permissions

- Feature visibility configuration
- Role and team permission sets
- Client-side permission controls

{{< figure src="/images/internal-sales-order-applet/so-perm.png" alt="Add or edit user permission" caption="Settings: Configure user permission and role." >}}

### Personalization

- Set default branch, location, and currency for faster order entry
- Customize visible columns and advanced search fields for your team
- Use role-based menus to simplify the UI for specific users

---

**Recommended setup checklist:**

1. **Set Defaults**: Branch, location, currency, and posting status
2. **Enable Required Tabs**: Delivery, settlement, and attachments
3. **Configure Approval Rules**: Workflow and permission controls
4. **Define Printables**: Sales order and delivery formats
5. **Validate Credit Limits**: Enable credit limit checks if required
6. **Enable Ecomsync**: For marketplace integration and tracking

---

## Audit and History

Use built-in tracing and history tools to track changes and downstream documents.

- **Events tab**: Review status changes, edits, and system actions on the order
- **Trace Document**: Follow the document flow to delivery, invoices, and settlements
- **Listing export**: Export filtered orders for reconciliation or audit sampling

---

## FAQ

**Q: Why can I not see the FINAL button?**  
A: The FINAL action may be hidden by settings or restricted by your permissions.

**Q: How do I enable delivery details on the order?**  
A: Enable **Delivery Details** in `Settings > Application Settings`.

**Q: Why does the order fail credit limit checks?**  
A: The customer credit limit may be exceeded. Update credit limits or reduce order value.

**Q: Can I edit a FINAL order?**  
A: In most setups, FINAL orders are locked. If changes are needed, use permitted actions (VOID/CLOSE) and re-create or issue a new order per your policy.

**Q: Why can’t I change the delivery date after FINAL?**  
A: Delivery fields may be locked after posting. Update via Delivery Plan/Delivery Items or adjust settings if your workflow allows edits.

**Q: Can I print multiple sales orders at once?**  
A: Yes. Use **Batch Printing** from the menu or **SINGLE/MULTIPLE PRINT** in the listing.

**Q: How do I import sales orders in bulk?**  
A: Use **File Import**, upload CSV, and validate via helper checking.

**Q: Why can’t I see Pick Pack Queue or Delivery Items?**  
A: These menus can be hidden by applet settings or restricted by permissions. Check **Feature Visibility** and role permissions.

**Q: How do I send a Sales Order email to the customer?**  
A: From the listing, select the order, choose an email template, pick Billing or Shipping recipient, then click **Send Email**.

**Q: How do I re-sync a marketplace order?**  
A: Open the order and use the **Ecomsync** tab to review sync status and re-run sync actions (if enabled).
