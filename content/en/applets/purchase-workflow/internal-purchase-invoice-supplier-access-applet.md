---
title: "Purchase Invoice Supplier Access (Internal) Applet"
description: "Secure portal for suppliers to view and manage purchase invoices"
tags:
- supplier-portal
- purchase-invoices
- vendor-management
- financial-transparency
- invoice-tracking
weight: 260
---

{{< callout type="warning" >}}
**Internal Purchase Invoice Supplier Access Applet user guide still under progress**

**Work in Progress: This documentation is currently under development. Visual assets (screenshots) and further details will be added soon.**
{{< /callout >}}

## Purpose and Overview

The **Internal Purchase Invoice Supplier Access Applet** provides a secure, self-service interface for vendors and suppliers to view their financial transactions with your organization. This applet reduces administrative overhead by allowing suppliers to track invoice status and payment history directly.

{{< callout type="info" >}}
**Core Concept**: A **Supplier Portal** provides restricted, real-time access to purchase invoice (PI) data, ensuring transparency and reducing manual inquiries.
{{< /callout >}}

## Key Features Overview

### Who Benefits from This Applet?

**Suppliers & Their Finance Teams:**
- 24/7 visibility into invoice status (Submitted, Approved, Paid)
- Download PDF copies of finalized purchase invoices
- Reconcile their accounts receivable with your system

**Procurement & AP Teams:**
- Reduced volume of "where is my payment?" emails and calls
- Simplified dispute resolution through shared data
- Improved vendor relationships through financial transparency

**Finance Leaders & Controllers:**
- Real-time audit of vendor interactions
- Accelerated reconciliation processes
- Clearer visibility into upcoming payables

### What Problems Does This Solve?

**The Information Gap Problem:**
Without a supplier portal:
- Suppliers constantly call for payment updates
- Manual reconciliation is time-consuming and error-prone
- Disputes over invoice amounts take days to resolve via email

**The Supplier Access Solution:**
- **Shared Data Source** - One "gold standard" invoice record for both parties
- **Self-Service Status** - Suppliers check payment dates themselves
- **Secure File Access** - Instant download of official documents without manual sending

## Key Features Overview

{{< cards >}}
  {{< card title="Invoice Listing" subtitle="View all current and historical invoices" link="#invoice-listing" >}}

  {{< card title="Status Tracking" subtitle="Real-time payment and approval status" link="#status-tracking" >}}

  {{< card title="Document Center" subtitle="Download PDF invoices and supporting files" link="#documents" >}}

  {{< card title="Dispute Portal" subtitle="Communicate and resolve invoice queries" link="#disputes" >}}
{{< /cards >}}

## Key Concepts

### Invoice Awareness

| Aspect | Component | Practical Example |
|--------|-----------|------------------|
| **Who** is viewing? | Authorized Supplier User | Vendor's Accounts Receivable Manager |
| **What** is visible? | Finalized Purchase Invoices | Project PI #10234 for RM 5,000 |
| **How** is it accessed? | Secure Portal Login | Unique Supplier Access Link/Login |

## Quick Start Guide

### For Suppliers: Checking Invoice Status

**Goal:** Review your pending invoices in 3 steps.

1. **Login**: Access the **Supplier Portal** using your provided credentials
2. **Filter**: Go to **My Invoices** and filter by "Unpaid" or "Pending"
3. **Verify**: Click on an invoice to see its status and expected payment date

---

### For Internal Admins: Granting Access

**Goal:** Enable a supplier to use the portal in 3 steps.

1. **Identify**: Go to **Supplier Maintenance** and select the vendor
2. **Invite**: Click **"Enable Portal Access"** and enter the supplier's contact email
3. **Monitor**: Check the **Access Logs** to see when the supplier first logged in

---

## Configuration & Settings

Fine-tune your supplier portal in **Settings**:
- **Field Visibility**: Choose which invoice fields suppliers can see (e.g., exclude internal notes).
- **Notification Alerts**: Set automated emails for when an invoice is marked as "Paid".
- **Download Permissions**: Control which document types are available for download.

---

## FAQ

**Q: Can suppliers edit the invoices?**
A: No, the access is typically "Read-Only" to ensure financial integrity. Any changes must be requested through the **Dispute Portal** or via standard procurement channels.

**Q: What happens if a supplier forgets their password?**
A: They can use the "Forgot Password" link on the portal login page, or your internal admin can trigger a password reset from the **User Management** applet.

**Q: Is there a limit to how much history a supplier can see?**
A: This is configurable, but most systems show at least 12-24 months of historical financial data by default.

**Q: Can a supplier have multiple users?**
A: Yes, you can invite multiple contacts from the same supplier entity to have their own individual portal accounts.
