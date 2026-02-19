---
title: "Internal RMA Applet"
description: "Return Merchandise Authorization management for internal stock returns and warranty claims processing"
tags:
- rma
- returns-management
- stock-returns
- warranty
- internal-logistics
---

## Purpose and Overview

### Who Benefits from This Applet?

**Warehouse Staff:**
- Process incoming returns efficiently
- Track return status and location
- Manage restock or disposal workflows

**Operations Managers:**
- Monitor return volumes and trends
- Identify product quality issues
- Optimize reverse logistics processes

**Customer Service Teams:**
- Create RMA requests on behalf of customers
- Track return status for customer inquiries
- Coordinate with warehouse for pickups

**Finance Teams:**
- Track credits and refunds from returns
- Monitor return-related costs
- Reconcile inventory adjustments

### What Problems Does This Solve?

**Traditional Return Challenges:**
- Untracked returns leading to inventory discrepancies
- Slow processing causing customer dissatisfaction
- No visibility into return reasons for quality improvement
- Manual coordination between departments

**The Internal RMA Solution:**
- **Centralized RMA tracking** - All returns in one system
- **Automated workflows** - Route returns to correct handlers
- **Reason tracking** - Capture return reasons for analysis
- **Inventory integration** - Automatic stock adjustments

## Key Features Overview

{{< cards >}}
  {{< card title="Service Note" subtitle="Log and track service requests from customers" link="#service-note" >}}

  {{< card title="Customer RMA" subtitle="Manage customer return merchandise authorizations" link="#customer-rma" >}}

  {{< card title="Supplier RTV" subtitle="Return to vendor management for supplier items" link="#supplier-rtv" >}}

  {{< card title="RMA Requests" subtitle="Centralized view of all submitted RMA requests" link="#rma-requests" >}}

  {{< card title="RMA Report" subtitle="Return trends and analytics reporting" link="#rma-report" >}}

  {{< card title="Settings" subtitle="Configure RMA policies and workflow rules" link="#configuration--settings" >}}
{{< /cards >}}

{{< figure src="/images/internal-rma-applet/rma-overview-infographic.png" alt="The RMA Applet: A Smarter Way to Manage Returns - showing the 6-step RMA lifecycle from Request Created to Resolved" caption="The RMA Applet: From chaos to control with a centralized return management system featuring the 6-step RMA lifecycle." >}}

---

## Key Concepts

### RMA Lifecycle

```
Request Created → Pending Approval → Approved → Item Received → Inspected → Resolved
        │               │              │            │           │           │
        │               │              │            │           │           └── Refund/Replace/Restock
        │               │              │            │           └── Quality check
        │               │              │            └── Item at warehouse
        │               │              └── Authorized for return
        │               └── Awaiting manager review
        └── Customer/Staff initiates
```

### Key Terms

| Term | Definition | Example |
|------|------------|---------| 
| **RMA Number** | Unique identifier for return request | RMA-2024-00123 |
| **Return Reason** | Why item is being returned | Defective, Wrong item, Changed mind |
| **Disposition** | What happens after return | Refund, Replace, Restock, Dispose |
| **Credit Note** | Financial document for refund | CN-2024-00456 |
| **RTV** | Return to Vendor — sending items back to supplier | Supplier defect claim |

---

## Quick Start Guide

### For Warehouse: Process a Return

**Goal:** Receive and process an incoming RMA item

1. **Navigate**: Go to **Service Note** from the sidebar
2. **Find Record**: Search by service note number or customer name
3. **Open Record**: Double-click a row to view details
4. **Receive Item**:
   - Verify item condition matches description
   - Add inspection notes if needed
5. **Resolve**: Select disposition (Refund, Replace, Restock)

### For Operations: Create an RMA Request

**Goal:** Initiate a return authorization

1. **Navigate**: Go to **Customer RMA** in the sidebar
2. **Create New**: Click **"+"** to create a new RMA
3. **Enter Details**:
   - Select **Customer/Source**
   - Add **Item(s)** being returned
   - Select **Return Reason**
   - Add **Notes** for context
4. **Submit**: Send for approval if required

---

## Service Note

The Service Note listing is the main entry point for logging and tracking all customer service-related return requests. Each row represents a service note from a customer.

{{< figure src="/images/internal-rma-applet/service-note-listing.png" alt="Service Note Listing showing all customer service notes with columns for Service No, Date, Branch, Customer, Email, Sender details, Serial No, and Reason" caption="Service Note Listing: All service notes with 271 records, searchable and filterable by date, branch, customer, and more." >}}

### Create Service Note

Click the **"+"** button to open the Create Service Note panel. Fill in the required details including Branch, Location, RMA Type, and Service Note Date.

{{< figure src="/images/internal-rma-applet/service-note-create.png" alt="Create Service Note panel showing fields for Branch, Location, External Service Note No, RMA Type, Faulty Goods Pickup Type, Service Note Date, Customer Request Start, and Service Note Closed date" caption="Create Service Note: Enter branch, location, RMA type, and dates in the Main Details panel. Account, Item Details, and Other Details sections are available below." >}}

### View Service Note

Double-click any row in the listing to open and view the full details of a service note record.

{{< figure src="/images/internal-rma-applet/service-note-view.png" alt="View Service Note showing the detailed record of an existing service note with all filled fields" caption="View Service Note: Full record details with all fields populated, showing item information, customer data, and service history." >}}

---

## Customer RMA

The Customer RMA section manages all customer-originated Return Merchandise Authorization records. Use this to track what customers are returning and why.

{{< figure src="/images/internal-rma-applet/customer-rma-listing.png" alt="Customer RMA Listing showing all customer return merchandise authorization records in a grid view" caption="Customer RMA Listing: All customer RMA records with search, filter, and column customization options." >}}

### Create Customer RMA

Click **"+"** to open the Add New Customer RMA panel and fill in the return details.

{{< figure src="/images/internal-rma-applet/customer-rma-create.png" alt="Add New Customer RMA panel showing the creation form for a new customer return merchandise authorization" caption="Create Customer RMA: Enter customer details, returned items, and return reason to initiate the RMA process." >}}

### View Customer RMA

Double-click any row to open the full details of a Customer RMA record.

{{< figure src="/images/internal-rma-applet/customer-rma-view.png" alt="View Customer RMA panel showing detailed RMA record with all fields and line items" caption="View Customer RMA: Full record showing return details, items, status, and associated notes." >}}

---

## Customer RMA Line

The Customer RMA Line listing provides a flattened view of all individual line items across all Customer RMA records. Useful for bulk analysis of which specific products are being returned most frequently.

{{< figure src="/images/internal-rma-applet/customer-rma-line-listing.png" alt="Customer RMA Line Listing showing individual line items from all Customer RMA records" caption="Customer RMA Line: A line-item level view across all RMAs, allowing analysis of individual returned products." >}}

---

## Supplier RTV

Supplier RTV (Return to Vendor) manages returns directed back to your suppliers — for defective goods, warranty claims, or over-supplied items.

{{< figure src="/images/internal-rma-applet/supplier-rtv-listing.png" alt="Supplier RTV Listing showing all supplier return to vendor records" caption="Supplier RTV Listing: All active and historical return-to-vendor requests for supplier-originated issues." >}}

### Create Supplier RTV

Click **"+"** to initiate a new Return to Vendor request against a supplier.

{{< figure src="/images/internal-rma-applet/supplier-rtv-create.png" alt="Create Supplier RTV form showing fields for supplier selection, items, and return reason" caption="Create Supplier RTV: Select the supplier, specify returned items, and document the return reason." >}}

---

## Supplier RTV Line

The Supplier RTV Line listing shows all individual line items across Supplier RTV records, giving a granular view of what products are being returned to vendors.

{{< figure src="/images/internal-rma-applet/supplier-rtv-line-listing.png" alt="Supplier RTV Line Listing showing individual product lines within all Supplier RTV records" caption="Supplier RTV Line: View individual product-level details for all supplier return requests." >}}

---

## RMA Requests

The RMA Requests page provides a consolidated view of all submitted RMA requests across the system, enabling centralized review and approval management.

{{< figure src="/images/internal-rma-applet/rma-requests-listing.png" alt="RMA Requests Listing showing all RMA submissions across the system" caption="RMA Requests: A unified view of all RMA submissions, with status tracking and approval management." >}}

---

## RMA Report

The RMA Report page provides analytics and reporting on return trends, processing times, and return reasons across the organization.

{{< figure src="/images/internal-rma-applet/rma-report.png" alt="RMA Report page showing analytics and reporting options for return merchandise analysis" caption="RMA Report: Analyze return trends by reason, period, and product category to identify quality improvement opportunities." >}}

---

## Configuration & Settings

The Settings page provides access to all system configuration options for the Internal RMA Applet, organized into System Configuration, Server Side Permissions, and Developer Tools sections.

{{< figure src="/images/internal-rma-applet/settings-overview.png" alt="Applet Settings overview page showing System Configuration links including Application Settings, Default Selection, Printable Format Settings, Return Reasons Settings, Request Action Settings, and Workflow Settings, plus Server Side Permissions and Developer Tools sections" caption="Settings Overview: All configuration options organized by category. Click any link to navigate to that sub-page." >}}

### Application Settings

Toggle visibility and access controls for each module within the RMA applet, including sidebar menus and functional areas.

{{< figure src="/images/internal-rma-applet/settings-application-settings.png" alt="Application Settings page showing toggle switches for Sidebar Menu, Service Note, Customer RMA, Supplier RTV, and other applet modules" caption="Application Settings: Enable or disable individual modules and menu items for the entire applet." >}}

### Default Selection

Configure the default Branch and Location values that will be pre-filled when creating new RMA records across the applet.

{{< figure src="/images/internal-rma-applet/settings-default-selection.png" alt="Default Selection settings page showing Branch and Location dropdown fields for setting applet-wide defaults" caption="Default Selection: Set the default branch and location for all new RMA record creation." >}}

### Printable Format Settings

Manage the available Jasper report print formats for RMA documents including Service Notes, Customer RMAs, and Supplier RTVs.

{{< figure src="/images/internal-rma-applet/settings-printable-format.png" alt="Printable Format Settings page listing available Jasper report formats for different RMA document types" caption="Printable Format Settings: Configure which print formats are available for each document type in the RMA applet." >}}

### Return Reasons Settings

Define and manage the list of available return reason codes that staff can select when creating RMA records.

{{< figure src="/images/internal-rma-applet/settings-return-reasons.png" alt="Return Reasons Settings page showing a listing of configured return reason codes such as faulty-product and screen-broken" caption="Return Reasons Settings: Manage the master list of return reason codes to standardize return classification across the team." >}}

### Request Action Settings

Configure the available actions that can be applied to resolved RMA requests, such as Replacement, Repair, or Refund.

{{< figure src="/images/internal-rma-applet/settings-request-action.png" alt="Request Action Settings page showing available RMA resolution actions including Replacement and Repair" caption="Request Action Settings: Define and manage the resolution actions available when closing out an RMA request." >}}

### Workflow Settings

Set up company-specific workflow rules and approval routing for different RMA document types.

{{< figure src="/images/internal-rma-applet/settings-workflow.png" alt="Workflow Settings page showing company-specific workflow configurations for different RMA document types" caption="Workflow Settings: Configure approval workflows and routing rules per company for Service Notes, Customer RMAs, and Supplier RTVs." >}}

---

## Personalization

The Personalization section lets individual users override applet-wide defaults with their own preferred settings.

{{< figure src="/images/internal-rma-applet/personalization.png" alt="Personalization overview page showing user-specific configuration options" caption="Personalization: Configure your personal preferences for the RMA applet, independent of the system-wide defaults." >}}

### Default Selection

Set your personal default Branch and Location, which will override the system defaults when you create new RMA records.

{{< figure src="/images/internal-rma-applet/personalization-default-selection.png" alt="Personalization Default Selection page showing user-specific Branch and Location override settings" caption="Personalization Default Selection: Set your own branch and location defaults that take priority over the system-wide settings." >}}

---

## FAQ

**Q: Can I bulk process multiple RMAs?**
A: Yes, select multiple RMAs from the listing and apply batch actions.

**Q: How do I track partial returns?**
A: Create line items for each product being returned — you can receive them individually.

**Q: What is the difference between Customer RMA and Service Note?**
A: A **Service Note** is the initial logging of a customer service request (often before the physical item is returned). A **Customer RMA** is a formal return authorization with tracking for the returned goods and their disposition.

**Q: What is Supplier RTV vs Customer RMA?**
A: **Customer RMA** manages returns FROM customers TO your company. **Supplier RTV** (Return to Vendor) manages returns FROM your company BACK TO the supplier — for defective goods or warranty claims.

**Q: How are refunds processed?**
A: After RMA resolution with a refund disposition, a credit note is generated for finance to process the refund.

**Q: Can customers initiate their own RMA requests?**
A: If integrated with a customer portal, yes. Otherwise, staff creates on their behalf via the Service Note or Customer RMA pages.
