---
title: "Purchase Return Supplier Access (Internal) Applet"
description: "Secure purchase return visibility and debit note management for suppliers"
tags:
- supplier-portal
- purchase-returns
- debit-notes
- procurement-transparency
- vendor-management
weight: 280
---

{{< callout type="warning" >}}
**Internal Purchase Return Supplier Access Applet user guide still under progress**

**Work in Progress: This documentation is currently under development. Visual assets (screenshots) and further details will be added soon.**
{{< /callout >}}

## Purpose and Overview

The **Internal Purchase Return Supplier Access Applet** is a specialized procurement tool designed to manage the return of goods to suppliers. It provides vendors with immediate visibility into rejected items, return reasons, and associated debit notes, ensuring clear communication and financial reconciliation.

{{< callout type="info" >}}
**Core Concept**: A **Supplier Purchase Return Account** provides a transparent view of all items being returned, allowing for faster credit note issuance and account balancing.
{{< /callout >}}

## Key Features Overview

### Who Benefits from This Applet?

**Vendors & Suppliers:**
- Prompt notification of rejected goods and return shipments
- Clear itemized list of return reasons (damaged, incorrect, oversupply)
- Access to digital debit notes for their accounts payable

**Procurement & Quality Control:**
- Reduced disputes over return shipments
- Automated documentation for vendor performance reports
- Improved inventory accuracy through formal return records

**Finance & AP Teams:**
- Real-time visibility into expected supplier credits
- Shared "gold standard" for debit note amounts
- Faster reconciliation of supplier statements

### What Problems Does This Solve?

**The Return Management Friction Problem:**
Without a dedicated supplier return portal:
- Suppliers are often unaware of returns until invoices are disputed
- Manual communication of return reasons leads to long email chains
- Debit notes and credit notes often don't match, causing financial gaps

**The Supplier Return Access Solution:**
- **Instant Awareness** - Suppliers see return requests as they are created
- **Standardized Reason Codes** - No ambiguity on why items are being sent back
- **Digital Financial Links** - Debit notes are linked directly to the return record

## Key Features Overview

{{< cards >}}
  {{< card title="Return Listing" subtitle="View all current and historical purchase returns" link="#return-listing" >}}

  {{< card title="Debit Note Center" subtitle="View and download associated debit notes" link="#debit-notes" >}}

  {{< card title="Reason Codes" subtitle="Clear explanation for every returned item" link="#reasons" >}}

  {{< card title="Document Download" subtitle="Access official return notes and shipping labels" link="#documents" >}}
{{< /cards >}}

## Key Concepts

### Return Workflow

| Step | Action | System Impact |
|-----------|------------|-----------------|
| **Initiated** | Quality Control flags items for return. | Record created, Supplier notified. |
| **Shipped** | Physical items dispatched back. | Inventory removed from warehouse. |
| **Acknowledged**| Supplier confirmed receipt of return. | Awaiting Credit Note. |
| **Settled** | Debit Note matched to Supplier Credit Note. | Accounts Payable updated. |

## Quick Start Guide

### For Suppliers: Reviewing a New Return

**Goal:** Understand why items were sent back in 3 steps.

1. **Access**: Go to **Supplier Portal > My Purchase Returns**
2. **Review**: Open the newest return record and check the **"Reason Code"** column
3. **Verify**: Download any attached photos or quality reports if provided

---

### For Internal Admins: Processing a Return

**Goal:** Ensure the supplier has all they need for a return.

1. **Create Return**: Use the **Purchase Return** applet as usual
2. **Flag for Portal**: Most systems auto-publish returns to the portal once authorized
3. **Notify Supplier**: Use the **"Send Alert"** function to email the portal link to the vendor

---

## Configuration & Settings

Fine-tune your return management in **Settings**:
- **Reason Mapping**: Define the list of "Standard Reason Codes" shown to suppliers.
- **Auto-Email Defaults**: Set who from the supplier side receives return notifications.
- **Document Rules**: Choose if debit notes are generated automatically or manually.

---

## FAQ

**Q: Can a supplier dispute a return?**
A: Yes, suppliers can use the **Dispute** function in the portal to provide counter-evidence or request further clarification.

**Q: Do suppliers get a notification for every return?**
A: This is configurable—you can set the applet to send individual alerts or a daily summary of all returns.

**Q: Can I see if a supplier has downloaded the debit note?**
A: Yes, the **Download Log** in the admin console tracks which documents have been accessed by each vendor.

**Q: What if the supplier doesn't use the portal?**
A: You can still use the applet to manage the return internally and manually email the generated PDFs as needed.
