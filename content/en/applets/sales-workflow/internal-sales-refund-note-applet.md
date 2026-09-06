---
title: "Sales Refund Note (Internal) Applet"
description: "Comprehensive workflow for managing customer refunds, returns, LHDN E-Invoice credit notes, PNS vs STL amount balancing, and payment adjustments."
weight: 120
tags:
- sales
- refund
- finance
- accounts-receivable
- e-invoice
---

## Purpose and Overview

The **Sales Refund Note (Internal) Applet** is an essential financial control module within the BigLedger Sales Workflow. It is designed to document, authorize, and process customer refunds and financial credit adjustments with complete audit control. 

Rather than processing uncontrolled cash pay-outs or unverified ledger deductions, this applet enforces strict financial balancing rules while natively integrating with statutory **LHDN E-Invoice** credit note requirements.

{{< callout type="info" >}}
**Core Concept**: A Sales Refund Note is the financial counterpart to a Sales Return. While a *Sales Return* handles the physical receiving and inventory reversal of returned goods, the *Sales Refund Note* manages the financial reversal of cash, credit card settlements, customer store credit, and Accounts Receivable (AR).
{{< /callout >}}

![BigLedger Sales Refund Note Applet Operational Overview](/images/internal-sales-refund-note-applet/refund-note-overview-infographic.png)

---

### Who Benefits from This Applet?

**Finance & Accounts Receivable (AR) Teams:**
- **Ledger Precision:** Accurate reconciliation of customer account balances and automated General Ledger (GL) posting entries.
- **Over-Refund Prevention:** Built-in validation safeguards ensure refund amounts never exceed the original customer payment.
- **Contra Matching:** Direct linking to original sales invoices for instant debt offsetting.

**Customer Service & Sales Operations:**
- **Fast Lookup:** Rapid search tools to pull historical sales invoices and delivery orders to process refunds against.
- **Status Transparency:** Clear tracking of pending, draft, and finalized customer refund requests.
- **Flexible Store Credit:** Option to issue direct cash/bank refunds or log customer account credits for future purchases.

**Tax Compliance Officers:**
- **LHDN E-Invoice Compliance:** Native **E-Invoice** integration to automatically submit, track, and validate statutory tax credit notes with IRB Malaysia.
- **Audit Trails:** Permanent read-only archive of voided and finalized refund transactions.

---

### What Problems Does This Solve?

| The Manual Refund Problem | The Sales Refund Note Solution |
| :--- | :--- |
| **Unbalanced Refunds**: Risk of staff refunding a customer more than they paid, or issuing cash without corresponding returned items. | **Strict PNS vs. STL Balancing Rule**: Built-in validation locks requiring product line totals (PNS) to match settlement amounts (STL) exactly. |
| **Manual Tax Credit Note Errors**: Discrepancies between physical refund vouchers and official SST/LHDN tax submission records. | **Integrated E-Invoice Engine**: Direct API submission to IRB Malaysia with real-time status tracking (Pending, Validated, Rejected). |
| **Complex Cross-Entity Refunds**: Difficulty handling customer returns where the selling branch and refunding branch belong to different GL entities. | **Native Intercompany Support**: Dedicated intercompany routing to process multi-branch and multi-entity customer refunds smoothly. |
| **Slow Mass Product Recalls**: Processing hundreds of customer returns individually during warranty recalls or batch returns. | **Bulk Import/Export**: Built-in CSV file processing tools to batch-create and post mass customer refund requests. |

---

## Key Features Overview

{{< cards >}}
  {{< card title="E-Invoice Integration" subtitle="LHDN compliant credit note tracking and IRB validation" link="#3-e-invoice-panel" >}}

  {{< card title="PNS vs STL Balancing" subtitle="Strict Product vs Settlement amount validation locks" link="#the-amount-balancing-rule-pns-vs-stl" >}}

  {{< card title="Intercompany Processing" subtitle="Handle cross-entity customer returns and GL routing" link="#sidebar-routes" >}}

  {{< card title="Bulk Batch Import" subtitle="Process mass customer refunds via CSV files" link="#sidebar-routes" >}}

  {{< card title="ARAP Adjustments" subtitle="Modify customer credit ledgers and store credits directly" link="#7-arap-panel" >}}

  {{< card title="Applet Settings" subtitle="Configure return reasons, branch defaults, and permissions" link="#configuration--settings" >}}
{{< /cards >}}

---

## Core Concepts

### The Amount Balancing Rule (PNS vs. STL)

To protect your organization against revenue leakage, the Sales Refund Note Applet enforces a strict mathematical balancing rule before any document can be posted (`FINAL`).

![Sales Refund Note PNS vs STL Balancing Engine](/images/internal-sales-refund-note-applet/pns-stl-balancing-infographic.png)

1. **PNS (Product / Non-Stock Lines):** The total monetary value of items or service fees added to the **Lines** tab (e.g., Laptop RM 2,000 + Warranty Fee RM 100 = **RM 2,100**).
2. **STL (Settlement / Payments):** The total monetary value returned to the customer via the **Payment** tab (outgoing cash/bank transfer) or pushed to their account ledger via the **ARAP** tab (store credit).

{{< callout type="warning" >}}
**Hard Validation Lock**: If a user attempts to finalize a refund document where PNS lines total RM 2,100 but the Payment settlement is RM 2,000, the system blocks finalization with a strict validation error.
{{< /callout >}}

---

## Quick Start Guide

Follow these role-based workflows for common refund operations.

### For Finance Users: Processing a Standard Customer Refund

1. Navigate to **Sales Refund Note (Internal)** from the left sidebar menu and click **Create ("+")**.
2. **Search Panel**: Enter the customer's original Sales Invoice or Delivery Order number, then select the record to auto-fill header and item details.
3. **Lines Panel**: Review the item lines. Adjust quantities or remove items that the customer is not returning.
4. **Payment / ARAP Panel**: 
   - Open the **Payment** tab to record an outgoing bank transfer or credit card reversal.
   - Alternatively, open the **ARAP** tab to issue the refund as store credit on the customer's ledger.
5. **Verify Balance**: Confirm that the total settlement in Payment/ARAP matches the PNS line total exactly.
6. **Save & Finalize**: Click **Save** to store the draft record, then click **FINAL** to post the transaction to the General Ledger and generate the credit note.

---

## Workspace & Workspace Panels Breakdown

The applet provides specialized operational views via sidebar routes and detailed document editing panels.

### Sidebar Routes
- **Sales Refund Note (Internal):** Main document management listing for creating, viewing, and posting refund notes.
- **Line Items:** Cross-document reporting grid listing every individual refunded item across all notes.
- **Intercompany:** Dedicated workspace for managing cross-entity refunds between separate company subsidiaries.
- **File Export & Import:** Batch operations module for mass CSV refund imports.

{{< figure src="/images/internal-sales-refund-note-applet/sales-refund-note-listing-view.png" alt="Sales Refund Note Applet Workspace - showing the Sales Refund Note Listing grid and the Edit Internal Sales Refund Note workspace" caption="Sales Refund Note Listing & Edit Workspace. The primary document management interface featuring the document listing grid on the left and the Main Details editing panel on the right." >}}

{{< figure src="/images/internal-sales-refund-note-applet/line-items-view.png" alt="Line Items Workspace Interface - showing cross-document line listing grid" caption="Line Items Reporting Workspace. Enterprise-wide reporting grid displaying individual refunded item lines across all sales refund notes." >}}

---

### Detailed Workspace Panels (15-Panel Workspace)

When creating or editing a Sales Refund Note, information is organized across 15 operational panels:

| # | Panel Name | Purpose & Function |
| :-: | :--- | :--- |
| **1** | **Search** | Query and pull historical sales invoices and delivery orders to auto-populate refund records. |
| **2** | **Main Details** | Core transaction metadata including document dates, branch routing, and internal references. |
| **3** | **E-Invoice** | Statutory tax compliance panel displaying real-time LHDN status (*Pending IRB*, *Submitted*, *Validated*, *Rejected*) and buyer notification tracking. |
| **4** | **Account** | Customer entity master data, default billing addresses, and contact profiles. |
| **5** | **Lines (PNS)** | Itemized list of returned products, non-stock items, or service fee reversals. |
| **6** | **Payment (STL)** | Outgoing settlement entries detailing cash, cheque, bank transfer, or card reversal transactions. |
| **7** | **ARAP (STL)** | Accounts Receivable ledger adjustment tools for applying store credit directly to customer balances. |
| **8** | **Delivery Details** | Return logistics information, carrier tracking numbers, and warehouse receiving notes. |
| **9** | **Payment Adjustment** | Manages edge-case payment discrepancies, currency conversion rounding, or bank processing fees. |
| **10**| **Department Hdr** | Multi-dimension cost allocation mapping the financial impact of the refund to specific internal profit centres. |
| **11**| **Trace Document** | Historical audit trail tracing the step-by-step evolution of the refund transaction. |
| **12**| **Contra** | Direct ledger matching tools linking the refund note to offset original sales invoice debits. |
| **13**| **Doc Link** | Cross-document references connecting upstream sales orders or external warranty tickets. |
| **14**| **Attachments** | Digital file repository for uploading bank transfer slips, customer return letters, and receipt photos. |
| **15**| **Export** | Document rendering engine for generating official customer-facing Credit Note PDFs. |

---

## Configuration & Settings

System administrators can configure applet parameters by clicking **Settings** at the bottom of the left navigation pane:

| Setting Area | Config Key / Menu | Purpose & Description |
| :--- | :--- | :--- |
| **Branch Defaults** | `Default Selection & Branch` | Pre-selects default operating branches and inventory locations for refund routing. |
| **Return Reasons** | `Return Reasons Settings` | Configures mandatory dropdown categories for returns (e.g., *Defective Product*, *Service Cancelled*, *Duplicate Charge*). |
| **Workflow Status** | `Workflow Settings` | Attaches a workflow process to the company so refund notes carry a Workflow Status. It is a status label filtered by role — it defines no approval hierarchy and does not gate the **FINAL** button. Refund notes have no approval engine; see [Document Approvals](/guides/document-approvals/). |
| **Permissions** | `SHOW_GENDOC_FINAL_BUTTON` | Restricts document finalization and GL posting authority strictly to authorized Senior Finance staff. |
| **Permissions** | `SHOW_EDIT_SETTLEMENT_FINAL` | Highly restricted permission allowing post-finalization settlement edits for auditing corrections. |
| **Audit Logs** | `Applet Log & Release Notes` | Displays system-level release logs and backend API transaction audit histories. |

---

## FAQ & Troubleshooting

**Q: Why does the system throw a validation error when I click FINAL?**  
A: This occurs when the **PNS vs. STL Balancing Rule** is violated. Verify that the total line amount in the **Lines** tab (PNS) equals the total settlement amount in the **Payment** or **ARAP** tabs (STL) down to the exact cent.

**Q: Why is the FINAL button hidden or disabled?**  
A: The FINAL button may be restricted due to two reasons:
1. Your user role lacks the `SHOW_GENDOC_FINAL_BUTTON` permission.
2. The applet setting `HIDE_GENDOC_FINAL_BUTTON` is switched on, or the document is not in the workflow status named by `FINAL_STATUS_GUID`. Neither of these is an approval — refund notes have no approval workflow.

**Q: How do I check if an E-Invoice Credit Note was approved by LHDN?**  
A: Open the document in edit mode and select Panel 3 (**E-Invoice**). The panel displays live status badges from IRB Malaysia along with the unique Unique Identifier Number (UUID) and validation timestamp.
