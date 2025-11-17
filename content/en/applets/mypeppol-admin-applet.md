---
title: "My Peppol Admin Applet"
description: "End-user Peppol document management and trading partner administration"
tags:
  - peppol-module
  - document-management
  - user-interface
  - trading-partners
  - b2b-operations
weight: 420
---

## **Purpose and Scope**

The **My Peppol Admin Applet** provides an intuitive user interface for managing daily Peppol operations, including sending documents, monitoring deliveries, managing trading partners, and maintaining compliance records.

While the Peppol AP Admin Applet handles technical infrastructure, this applet focuses on business user operations and document lifecycle management.

### Why This Applet Matters: Business Value Proposition

{{< cards >}}
  {{< card title="📤 Easy Document Sending" subtitle="Send invoices, orders, and other business documents to partners with just a few clicks." >}}
  {{< card title="📥 Inbox Management" subtitle="Centralized inbox for all incoming Peppol documents with automatic categorization and routing." >}}
  {{< card title="👥 Partner Directory" subtitle="Manage trading partner relationships, preferences, and document exchange settings." >}}
  {{< card title="📊 Real-Time Tracking" subtitle="Monitor document status from submission to delivery confirmation with detailed audit trail." >}}
  {{< card title="🔍 Search & Filter" subtitle="Powerful search across all documents with advanced filtering by date, partner, type, and status." >}}
  {{< card title="📈 Analytics Dashboard" subtitle="Visualize document exchange volumes, delivery performance, and partner activity metrics." >}}
{{< /cards >}}

### Key Stakeholder Benefits

**For Finance Teams:**
- Send invoices and credit notes directly to partners
- Track payment-related documents
- Export data for reconciliation
- Automated reminders for unpaid invoices

**For Procurement:**
- Manage purchase orders and order responses
- Track despatch advice and deliveries
- Maintain supplier communication history
- Monitor order fulfillment status

**For Operations:**
- Centralized document repository
- Quick access to document history
- Partner performance metrics
- Exception handling workflows

**For Compliance:**
- Complete audit trail for all transactions
- Document retention management
- Regulatory reporting tools
- Proof of delivery archive

---

## 8. Step-by-Step Demo Scenarios

### Overview of Demo Scenarios

{{< cards >}}
  {{< card title="📤 Scenario 1: Sending Cross-Border Invoice" subtitle="Complete workflow for sending invoice to German trading partner with automatic UBL conversion." >}}
  {{< card title="📥 Scenario 2: Processing Incoming Purchase Order" subtitle="Receive, review, and respond to EU supplier order with conditional acceptance." >}}
  {{< card title="👥 Scenario 3: Onboarding New Trading Partner" subtitle="Add partner to directory, configure preferences, and verify connectivity." >}}
  {{< card title="📊 Scenario 4: Monthly Reconciliation" subtitle="Generate analytics reports and reconcile 500+ documents for month-end closing." >}}
{{< /cards >}}

---

### 📼 Demo Scenario 1: Sending Cross-Border Invoice to German Partner

#### Business Context

{{< callout type="example" >}}
**Scenario Profile:**
- **Business Type**: Malaysian electronics exporter
- **Objective**: Send invoice for €25,000 shipment to German buyer
- **Document Type**: Commercial Invoice (UBL 2.1)
- **Estimated Total Time**: 8-10 minutes
{{< /callout >}}

#### Step-by-Step Walkthrough

{{< steps >}}

### Step 1: Create Invoice from ERP (3 minutes)

**Select Source Document:**

```
Send Documents → Create from ERP

┌────────────────────────────────────────────────────────┐
│  SELECT SOURCE INVOICE                                 │
├────────────────────────────────────────────────────────┤
│  Search: [INV-2025-10-_______________] [🔎]            │
│                                                        │
│  Recent Invoices:                                      │
│  ┌──────────────┬─────────────┬───────────┬─────────┐ │
│  │ Invoice No   │ Customer    │ Amount    │ Status  │ │
│  ├──────────────┼─────────────┼───────────┼─────────┤ │
│  │ INV-10-0234  │ ABC GmbH    │ €25,000   │ Final   │ │
│  │ INV-10-0233  │ XYZ Ltd     │ £18,500   │ Final   │ │
│  │ INV-10-0232  │ DEF AG      │ CHF30,000 │ Paid    │ │
│  └──────────────┴─────────────┴───────────┴─────────┘ │
│                                                        │
│  [Select INV-10-0234]                                  │
└────────────────────────────────────────────────────────┘
```

**Invoice Details Loaded:**

```
┌────────────────────────────────────────────────────────┐
│  INVOICE PREVIEW: INV-10-0234                          │
├────────────────────────────────────────────────────────┤
│  Invoice Date:    2025-10-28                           │
│  Due Date:        2025-11-27 (Net 30)                  │
│  Customer:        ABC Trading GmbH                     │
│  Currency:        EUR (€)                              │
│                                                        │
│  Line Items:                                           │
│  ┌──────────────────────────────────────────────────┐ │
│  │ No  Description         Qty    Price    Amount  │ │
│  ├──────────────────────────────────────────────────┤ │
│  │ 1   Electronics PCB     500    €35.00   €17,500 │ │
│  │ 2   LED Components      1000   €5.50    €5,500  │ │
│  │ 3   Shipping & Handling  1     €2,000   €2,000  │ │
│  │                                                  │ │
│  │                          Subtotal:      €25,000 │ │
│  │                          VAT (0%):      €0      │ │
│  │                          Total:         €25,000 │ │
│  └──────────────────────────────────────────────────┘ │
│                                                        │
│  [Generate UBL XML]                                    │
└────────────────────────────────────────────────────────┘
```

### Step 2: Validate and Prepare Peppol Document (2 minutes)

**UBL Conversion:**

```
Generating UBL 2.1 XML...

[██████████] 100%

Validation Results:
✅ Invoice header complete
✅ Party information (Supplier/Buyer) valid
✅ Line items formatted correctly
✅ Tax information present
✅ Payment terms included
✅ Schema validation: PASSED
✅ Schematron validation: PASSED

Document ready for Peppol transmission!
```

**Select Recipient:**

```
┌────────────────────────────────────────────────────────┐
│  SELECT RECIPIENT                                      │
├────────────────────────────────────────────────────────┤
│  Customer: ABC Trading GmbH                            │
│                                                        │
│  Peppol ID:        9933:DE123456789                    │
│  Country:          Germany                             │
│  Network Status:   ✅ Active                           │
│  Last Exchange:    2025-10-25 (3 days ago)             │
│  Documents Sent:   47                                  │
│  Success Rate:     100%                                │
│                                                        │
│  Preferred Settings:                                   │
│  ☑️ Email notification on send                         │
│  ☑️ Request delivery confirmation                      │
│                                                        │
│  [Select Partner]                                      │
└────────────────────────────────────────────────────────┘
```

### Step 3: Review and Send (3 minutes)

**Final Review:**

```
┌────────────────────────────────────────────────────────┐
│  DOCUMENT READY TO SEND                                │
├────────────────────────────────────────────────────────┤
│  From:                                                 │
│  Your Company Sdn Bhd                                  │
│  Peppol ID: 9915:MY987654321                           │
│  Kuala Lumpur, Malaysia                                │
│                                                        │
│  To:                                                   │
│  ABC Trading GmbH                                      │
│  Peppol ID: 9933:DE123456789                           │
│  Munich, Germany                                       │
│                                                        │
│  Document Details:                                     │
│  ┌──────────────────────────────────────────────────┐ │
│  │ Document Type:    Invoice (UBL 2.1)              │ │
│  │ Document ID:      INV-10-0234                    │ │
│  │ Issue Date:       2025-10-28                     │ │
│  │ Due Date:         2025-11-27                     │ │
│  │ Currency:         EUR                            │ │
│  │ Total Amount:     €25,000.00                     │ │
│  │ Line Items:       3                              │ │
│  │ XML Size:         42 KB                          │ │
│  └──────────────────────────────────────────────────┘ │
│                                                        │
│  Recipient Endpoint:                                   │
│  AP: Peppol Access Point Germany                       │
│  Status: ✅ Online and reachable                       │
│  Avg Response: 2.3 seconds                             │
│                                                        │
│  [⬅️ Back] [📧 Preview Email] [📤 Send Document]       │
└────────────────────────────────────────────────────────┘
```

**Transmission Progress:**

```
Sending Invoice INV-10-0234...

[15:42:01] 🔄 Creating AS4 message envelope
[15:42:02] 🔒 Encrypting document (AES-256)
[15:42:03] ✍️  Applying digital signature
[15:42:04] 🌐 Looking up recipient endpoint (SML)
[15:42:05] ✅ Endpoint found: ap.peppol.de
[15:42:06] 📤 Transmitting to recipient AP
[15:42:09] ✅ Delivery confirmation received
[15:42:10] 💾 Storing in Sent Documents
[15:42:11] 📧 Email notification sent to customer

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🎉 SUCCESS! Invoice delivered successfully
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Delivery Details:
Message ID:      7f3e8c9a-1b2d-4e5f-9a7b-3c4d5e6f7a8b
Delivered At:    2025-10-28 15:42:09 UTC
Delivery Time:   10 seconds
Status:          DELIVERED
```

{{< /steps >}}

#### Expected Results

✅ Invoice generated from ERP in correct UBL 2.1 format  
✅ Document validated against Peppol specifications  
✅ Recipient endpoint discovered automatically  
✅ Document delivered within 10 seconds  
✅ Delivery confirmation received and logged  
✅ Customer email notification sent  

#### Business Outcomes

**Efficiency Metrics:**
- **Manual Process**: Print → Post → 5-7 days delivery
- **Peppol Process**: 10 seconds digital delivery
- **Cost Savings**: €15 per invoice (postage + processing)
- **Customer Experience**: Instant receipt, faster payment

---

### 📼 Demo Scenario 2: Processing Incoming Purchase Order from EU Supplier

#### Business Context

{{< callout type="example" >}}
**Scenario Profile:**
- **Business Type**: Manufacturing company receiving component orders
- **Objective**: Process purchase order from French supplier
- **Transaction Value**: €35,000 for 1,000 units
- **Estimated Total Time**: 12-15 minutes
{{< /callout >}}

#### Processing Timeline

```
[00:00]  📥 Order received in Peppol inbox
           ↓
[02:00]  👀 Procurement team notified
           ↓
[05:00]  📋 Order details reviewed
           ↓
[08:00]  🔄 ERP stock check completed
           ↓
[10:00]  ⚖️  Decision: Conditional acceptance
           ↓
[12:00]  📤 Order Response sent via Peppol
           ↓
[12:05]  ✅ Confirmation delivered to supplier
```

#### Step-by-Step Walkthrough

{{< steps >}}

### Step 1: Inbox Notification (2 minutes)

**New Document Alert:**

```
┌────────────────────────────────────────────────────────┐
│  📬 NEW PEPPOL DOCUMENT RECEIVED                       │
├────────────────────────────────────────────────────────┤
│  From:          XYZ Composants SA (France)             │
│  Peppol ID:     9966:FR987654321                       │
│  Document Type: Purchase Order                         │
│  Document ID:   PO-FR-2025-1234                        │
│  Received:      2025-10-28 09:15:22 UTC                │
│  Value:         €35,000.00                             │
│                                                        │
│  [View Document] [Dismiss]                             │
└────────────────────────────────────────────────────────┘
```

### Step 2: Review Order Details (5 minutes)

**Open Document:**

```
┌────────────────────────────────────────────────────────┐
│  PURCHASE ORDER: PO-FR-2025-1234                       │
├────────────────────────────────────────────────────────┤
│  Status: 🔴 NEW - REQUIRES ACTION                      │
│                                                        │
│  Buyer Information:                                    │
│  Company:        XYZ Composants SA                     │
│  Address:        45 Rue de Commerce, Paris, France     │
│  Peppol ID:      9966:FR987654321                      │
│  Contact:        Marie Dubois (m.dubois@xyz.fr)        │
│                                                        │
│  Order Details:                                        │
│  ┌──────────────────────────────────────────────────┐ │
│  │ PO Number:        PO-FR-2025-1234                │ │
│  │ PO Date:          2025-10-28                     │ │
│  │ Required By:      2025-11-20 (23 days)           │ │
│  │ Payment Terms:    Net 45 days                    │ │
│  │ Delivery Terms:   DDP (Delivered Duty Paid)      │ │
│  │ Currency:         EUR (€)                        │ │
│  └──────────────────────────────────────────────────┘ │
│                                                        │
│  Line Items:                                           │
│  ┌──────────────────────────────────────────────────┐ │
│  │ No  Product Code    Description      Qty  Price │ │
│  ├──────────────────────────────────────────────────┤ │
│  │ 1   PCB-A2000      Circuit Board     500  €40   │ │
│  │ 2   LED-RGB-100    RGB LED           500  €30   │ │
│  │                                                  │ │
│  │                    Item Total:       €35,000    │ │
│  │                    Shipping:         Included   │ │
│  │                    VAT:              Reverse    │ │
│  │                    Grand Total:      €35,000    │ │
│  └──────────────────────────────────────────────────┘ │
│                                                        │
│  Delivery Address:                                     │
│  XYZ Warehouse, 12 Logistics Park                      │
│  Lyon, France                                          │
│                                                        │
│  Special Instructions:                                 │
│  "Please ship via DHL Express. Include COA for PCBs."  │
└────────────────────────────────────────────────────────┘
```

### Step 3: Stock Availability Check (3 minutes)

**ERP Integration:**

```
Checking inventory availability...

┌────────────────────────────────────────────────────────┐
│  INVENTORY CHECK RESULTS                               │
├────────────────────────────────────────────────────────┤
│  Product: PCB-A2000                                    │
│  Requested: 500 units                                  │
│  Available: 450 units ⚠️                               │
│  Lead Time: 2 weeks for additional 50 units            │
│                                                        │
│  Product: LED-RGB-100                                  │
│  Requested: 500 units                                  │
│  Available: 850 units ✅                               │
│  Lead Time: In stock                                   │
│                                                        │
│  Recommendation: Conditional Acceptance                │
│  - Ship 450 PCB-A2000 immediately                      │
│  - Ship remaining 50 in 2 weeks                        │
│  - Ship all 500 LED-RGB-100 immediately                │
└────────────────────────────────────────────────────────┘
```

### Step 4: Create Order Response (4 minutes)

**Select Response Type:**

{{< tabs items="Accept Order,Reject Order,Conditional Accept" >}}
{{< tab >}}
### Accept Order

For full acceptance (if stock was available):
- One-click acceptance
- Automatic order creation in ERP
- Immediate confirmation to supplier
{{< /tab >}}

{{< tab >}}
### Reject Order

If unable to fulfill:
- Select rejection reason
- Add explanation
- Suggest alternatives
{{< /tab >}}

{{< tab >}}
### Conditional Accept (Selected)

For partial fulfillment or modifications:

```
┌────────────────────────────────────────────────────────┐
│  CONDITIONAL ACCEPTANCE                                │
├────────────────────────────────────────────────────────┤
│  Response Code: CA (Conditionally Accepted)            │
│                                                        │
│  Modifications:                                        │
│  ┌──────────────────────────────────────────────────┐ │
│  │ Line 1: PCB-A2000                                │ │
│  │ Requested:  500 units                            │ │
│  │ Confirmed:  450 units (Ship immediately)         │ │
│  │ Backorder:  50 units (Ship Nov 12, +2 weeks)     │ │
│  │                                                  │ │
│  │ Line 2: LED-RGB-100                              │ │
│  │ Requested:  500 units                            │ │
│  │ Confirmed:  500 units ✅ (Full quantity)         │ │
│  └──────────────────────────────────────────────────┘ │
│                                                        │
│  Proposed Delivery Schedule:                           │
│  Shipment 1: Oct 30 - 450 PCB + 500 LED (€28,500)      │
│  Shipment 2: Nov 12 - 50 PCB (€2,000)                  │
│                                                        │
│  Message to Buyer:                                     │
│  ┌──────────────────────────────────────────────────┐ │
│  │ "Dear Marie,                                     │ │
│  │                                                  │ │
│  │ Thank you for your order PO-FR-2025-1234.        │ │
│  │                                                  │ │
│  │ We can ship 90% of your order immediately       │ │
│  │ (450 PCB-A2000 + 500 LED-RGB-100).               │ │
│  │                                                  │ │
│  │ The remaining 50 PCB-A2000 units will ship       │ │
│  │ Nov 12 (2 weeks lead time).                      │ │
│  │                                                  │ │
│  │ Please confirm if this is acceptable.            │ │
│  │                                                  │ │
│  │ Best regards,                                    │ │
│  │ Your Company"                                    │ │
│  └──────────────────────────────────────────────────┘ │
│                                                        │
│  [Cancel] [Send Order Response]                        │
└────────────────────────────────────────────────────────┘
```

{{< /tab >}}
{{< /tabs >}}

### Step 5: Send Order Response (2 minutes)

**Transmission:**

```
Sending Order Response via Peppol...

[09:27:01] 🔄 Generating Order Response UBL XML
[09:27:02] ✅ Response document validated
[09:27:03] 🌐 Looking up buyer's endpoint
[09:27:04] 📤 Transmitting to XYZ Composants SA
[09:27:06] ✅ Delivery confirmed

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Order Response sent successfully!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Next Steps:
✅ ERP order created (SO-2025-0892)
✅ Warehouse notified for picking
✅ Logistics scheduled for Oct 30 shipment
✅ Customer email sent to Marie Dubois
⏳ Awaiting buyer's confirmation of terms
```

{{< /steps >}}

#### Expected Results

✅ Order received and processed within 15 minutes  
✅ Inventory checked automatically via ERP integration  
✅ Conditional acceptance prepared with clear explanation  
✅ Order Response delivered to supplier via Peppol  
✅ Internal sales order created in ERP  
✅ Warehouse and logistics teams notified  

#### Business Outcomes

**Process Efficiency:**
- **Traditional**: Email → Manual review → Phone call → 2-3 days
- **Peppol**: Automated → 15 minutes → Instant response
- **Accuracy**: 100% (no manual data entry errors)
- **Customer Satisfaction**: Immediate, professional response

---

### 📼 Demo Scenario 3: Onboarding New Trading Partner

#### Business Context

{{< callout type="example" >}}
**Scenario Profile:**
- **Objective**: Add new Swiss supplier to Peppol network
- **Partner**: DEF Components AG, Zurich
- **Expected Volume**: 20-30 orders per month
- **Estimated Total Time**: 20 minutes
{{< /callout >}}

{{< steps >}}

### Step 1: Obtain Partner's Peppol ID (5 minutes)

**Contact Partner:**
```
Email to: procurement@def-components.ch

Subject: Peppol E-Procurement Setup

Dear DEF Components AG,

We'd like to set up Peppol e-procurement with you.

Please provide:
1. Your Peppol Participant ID
2. Document types you support (Orders, Invoices, etc.)
3. Preferred contact for technical coordination

Best regards,
Your Company
```

**Partner Response:**
```
From: procurement@def-components.ch

Our Peppol Details:
- Peppol ID: 9955:CH987654321
- Scheme: iso6523-actorid-upis
- Supported Documents:
  ✅ Purchase Orders (receiving)
  ✅ Order Responses (sending)
  ✅ Despatch Advice (sending)
  ✅ Invoices (sending)

Contact: Hans Mueller (h.mueller@def-components.ch)
```

### Step 2: Add to Partner Directory (10 minutes)

**Create New Partner:**

```
Trading Partners → ➕ Add New Partner

┌────────────────────────────────────────────────────────┐
│  NEW TRADING PARTNER                                   │
├────────────────────────────────────────────────────────┤
│  Peppol ID:          [9955:CH987654321_________]       │
│                      [Validate ID] ✅                   │
│                                                        │
│  Auto-Discovered Information:                          │
│  ┌──────────────────────────────────────────────────┐ │
│  │ Company Name:    DEF Components AG               │ │
│  │ Country:         Switzerland                     │ │
│  │ AP Provider:     Swiss Peppol Gateway            │ │
│  │ Status:          ✅ Active on network            │ │
│  │ Capabilities:    Orders, Invoices, Despatch      │ │
│  └──────────────────────────────────────────────────┘ │
│                                                        │
│  Your Configuration:                                   │
│  Relationship:       ⚪ Customer  ◉ Supplier  ⚪ Both   │
│  Nickname:           [DEF Swiss_________________]      │
│  Internal Code:      [SUPP-CH-001_______________]      │
│                                                        │
│  Contact Information:                                  │
│  Primary Contact:    [Hans Mueller______________]      │
│  Email:              [h.mueller@def-components.ch]     │
│  Phone:              [+41 44 123 4567___________]      │
│  Department:         [Procurement_______________]      │
│                                                        │
│  Business Details:                                     │
│  Product Category:   [Electronic Components____]      │
│  Payment Terms:      [Net 45 days______________]      │
│  Currency:           [CHF (Swiss Franc) ▼]             │
│  Expected Volume:    [20-30 orders/month_______]      │
│                                                        │
│  [Cancel] [Save Partner]                               │
└────────────────────────────────────────────────────────┘
```

### Step 3: Configure Document Exchange Preferences (3 minutes)

```
Document Exchange Settings for: DEF Components AG

┌────────────────────────────────────────────────────────┐
│  OUTBOUND DOCUMENTS (You → DEF)                        │
├────────────────────────────────────────────────────────┤
│  ☑️ Purchase Orders                                     │
│  ☐ Order Changes                                       │
│  ☐ Order Cancellations                                 │
│  ☐ Despatch Advice                                     │
│                                                        │
│  Automation:                                           │
│  ☑️ Auto-send orders when approved in ERP              │
│  ☑️ Email confirmation to supplier                     │
│  ☐ Require manual review before sending               │
└────────────────────────────────────────────────────────┘

┌────────────────────────────────────────────────────────┐
│  INBOUND DOCUMENTS (DEF → You)                         │
├────────────────────────────────────────────────────────┤
│  ☑️ Order Responses                                     │
│  ☑️ Despatch Advice                                     │
│  ☑️ Invoices                                            │
│  ☐ Credit Notes                                        │
│                                                        │
│  Automation:                                           │
│  ☑️ Auto-create GRN from Despatch Advice               │
│  ☑️ Auto-match invoices to POs                         │
│  ☑️ Notify procurement team on Order Response          │
│  ☑️ Send to AP system for payment processing           │
└────────────────────────────────────────────────────────┘

┌────────────────────────────────────────────────────────┐
│  NOTIFICATIONS                                         │
├────────────────────────────────────────────────────────┤
│  Email on document sent:      ☑️ Yes  Recipients:     │
│                               procurement@yourco.com   │
│                                                        │
│  Email on document received:  ☑️ Yes  Recipients:     │
│                               procurement@yourco.com   │
│                               ap@yourco.com            │
│                                                        │
│  Daily summary report:        ☐ Yes                    │
│  Weekly performance report:   ☑️ Yes (Every Monday)    │
└────────────────────────────────────────────────────────┘

[Save Preferences]
```

### Step 4: Test Connectivity (2 minutes)

**Send Test Document:**

```
Partner Actions → Send Test Document

Testing connectivity to DEF Components AG...

[██████████] 100%

Test Results:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✅ Peppol ID validated in SML
✅ Endpoint discovered: peppol.swiss-gateway.ch
✅ Test message created
✅ Transmission successful (3.2 seconds)
✅ Delivery confirmation received

Status: CONNECTIVITY VERIFIED ✅

Partner is ready for production document exchange!
```

{{< /steps >}}

#### Expected Results

✅ Partner added to directory with complete profile  
✅ Peppol ID validated on network  
✅ Document exchange preferences configured  
✅ Test connectivity successful  
✅ Automation rules activated  
✅ Team notifications configured  

#### Business Outcomes

**Onboarding Efficiency:**
- **Traditional EDI**: 2-4 weeks, $5,000-10,000 setup cost
- **Peppol**: 20 minutes, $0 setup cost
- **Scalability**: Can onboard unlimited partners
- **Maintenance**: Zero ongoing per-partner fees

---

### 📼 Demo Scenario 4: Month-End Reconciliation and Reporting

#### Business Context

{{< callout type="example" >}}
**Scenario Profile:**
- **Objective**: Generate month-end reports for 500+ documents
- **Period**: October 2025 (full month)
- **Stakeholders**: Finance, Procurement, Management
- **Estimated Total Time**: 15-20 minutes
{{< /callout >}}

{{< steps >}}

### Step 1: Generate Analytics Dashboard (5 minutes)

**Navigate to Reports:**

```
Reports & Analytics → Monthly Summary

Select Period: [October 2025 ▼]
[Generate Report]

┌────────────────────────────────────────────────────────┐
│  MONTHLY PEPPOL EXCHANGE SUMMARY - OCTOBER 2025        │
├────────────────────────────────────────────────────────┤
│  Report Generated: 2025-10-29 10:00 UTC                │
│                                                        │
│  📊 VOLUME METRICS                                     │
│  ┌──────────────────────────────────────────────────┐ │
│  │                                                  │ │
│  │  Total Documents:           542                  │ │
│  │  📤 Sent:                   298 (55%)            │ │
│  │  📥 Received:               244 (45%)            │ │
│  │                                                  │ │
│  │  Success Rate:              99.4%                │ │
│  │  Failed/Retry:              3 (0.6%)             │ │
│  │  Avg Delivery Time:         4.2 seconds          │ │
│  └──────────────────────────────────────────────────┘ │
│                                                        │
│  💰 FINANCIAL SUMMARY                                  │
│  ┌──────────────────────────────────────────────────┐ │
│  │  Invoices Sent:       189    Value: €2,450,000  │ │
│  │  Invoices Received:   67     Value: €890,000    │ │
│  │  Credit Notes:        12     Value: €45,000     │ │
│  │  Orders Received:     134    Value: €1,780,000  │ │
│  │  Orders Sent:         97     Value: €1,120,000  │ │
│  └──────────────────────────────────────────────────┘ │
│                                                        │
│  📈 TREND ANALYSIS                                     │
│  ┌──────────────────────────────────────────────────┐ │
│  │  vs September:  ⬆️ 12% increase in volume        │ │
│  │  vs October 2024: ⬆️ 45% YoY growth              │ │
│  │  Peak Day:      Oct 15 (34 documents)           │ │
│  │  Avg/Day:       17.5 documents                   │ │
│  └──────────────────────────────────────────────────┘ │
└────────────────────────────────────────────────────────┘
```

### Step 2: Partner Performance Analysis (5 minutes)

```
┌────────────────────────────────────────────────────────┐
│  TOP 10 TRADING PARTNERS - OCTOBER 2025                │
├────────────────────────────────────────────────────────┤
│  Rank │ Partner           │ Docs │ Value       │ On-Time│
│  ─────┼───────────────────┼──────┼─────────────┼────────│
│  1    │ ABC Trading GmbH  │ 89   │ €845,000    │ 100%  │
│  2    │ XYZ Ltd           │ 67   │ €620,000    │ 98%   │
│  3    │ DEF AG            │ 54   │ €480,000    │ 100%  │
│  4    │ GHI SA            │ 45   │ €390,000    │ 97%   │
│  5    │ JKL Inc           │ 38   │ €325,000    │ 100%  │
│  6    │ MNO GmbH          │ 31   │ €280,000    │ 95%   │
│  7    │ PQR Ltd           │ 28   │ €245,000    │ 100%  │
│  8    │ STU Components    │ 24   │ €210,000    │ 98%   │
│  9    │ VWX Trading       │ 21   │ €185,000    │ 100%  │
│  10   │ YZ Suppliers      │ 18   │ €160,000    │ 97%   │
└────────────────────────────────────────────────────────┘

Performance Insights:
✅ 7 partners with 100% on-time delivery
⚠️ 2 partners with 95-98% (investigate delays)
📊 Top 10 represent 74% of total volume
```

### Step 3: Export for Finance Reconciliation (5 minutes)

**Export Options:**

```
Export Reports:

☑️ Document Transaction Log (CSV)
   - All 542 documents with timestamps
   - Sender/Recipient details
   - Document IDs and references
   - Delivery statuses

☑️ Invoice Summary (Excel)
   - Sent invoices by customer
   - Received invoices by supplier
   - Amounts, currencies, due dates
   - Payment status (from ERP integration)

☑️ Audit Trail Report (PDF)
   - Compliance-ready format
   - Digital signatures included
   - Delivery confirmations
   - 7-year archival ready

☑️ Partner Exchange Matrix (Excel)
   - Documents by partner and type
   - Volume trends
   - Performance metrics

[📥 Download All Reports (ZIP)]
```

**Downloaded Files:**
```
peppol-reports-2025-10.zip (2.4 MB)
├── transaction-log-2025-10.csv
├── invoice-summary-2025-10.xlsx
├── audit-trail-2025-10.pdf
└── partner-matrix-2025-10.xlsx
```

### Step 4: Scheduled Reporting Setup (3 minutes)

**Automate Monthly Reports:**

```
Settings → Scheduled Reports

┌────────────────────────────────────────────────────────┐
│  SCHEDULED REPORT CONFIGURATION                        │
├────────────────────────────────────────────────────────┤
│  Report Name:        Monthly Peppol Summary            │
│  Frequency:          ◉ Monthly  ⚪ Weekly  ⚪ Daily     │
│  Run On:             1st of each month at 09:00        │
│                                                        │
│  Recipients:                                           │
│  ☑️ finance@yourcompany.com                            │
│  ☑️ procurement@yourcompany.com                        │
│  ☑️ cfo@yourcompany.com                                │
│                                                        │
│  Include:                                              │
│  ☑️ Transaction Summary (PDF)                          │
│  ☑️ Financial Analysis (Excel)                         │
│  ☑️ Partner Performance (Excel)                        │
│  ☑️ Compliance Audit Trail (PDF)                       │
│  ☐ Raw Data Export (CSV)                              │
│                                                        │
│  [Save Schedule]                                       │
└────────────────────────────────────────────────────────┘
```

{{< /steps >}}

#### Expected Results

✅ Complete month-end reports generated in 15 minutes  
✅ 542 documents reconciled and verified  
✅ Partner performance metrics calculated  
✅ Compliance-ready audit trail exported  
✅ Automated reporting scheduled for future months  

#### Business Outcomes

**Month-End Efficiency:**
- **Traditional**: 2-3 days manual reconciliation
- **Peppol**: 15 minutes automated reporting
- **Accuracy**: 100% (no manual entry errors)
- **Audit Trail**: Complete, immutable, compliance-ready
- **Time Saved**: 95% reduction in closing activities

---

## 9. Comprehensive Test Cases

### Test Case 1: Basic Invoice Transmission

```
Test ID: TC-MP-001
Objective: Verify successful invoice sending via Peppol network

Preconditions:
- User logged into My Peppol Admin
- Trading partner registered in directory
- Source invoice available in ERP

Test Steps:
1. Navigate to Send Documents → Create from ERP
2. Select invoice INV-TEST-001
3. Verify UBL conversion successful
4. Select registered trading partner
5. Review and send document
6. Monitor transmission status

Expected Results:
✅ Invoice converted to valid UBL 2.1 XML
✅ Recipient endpoint discovered automatically
✅ Document encrypted and signed
✅ Delivery confirmed within 10 seconds
✅ Email notification sent
✅ Document appears in Sent folder

Pass Criteria: Delivery confirmation received within 10 seconds
```

### Test Case 2: Process Incoming Purchase Order

```
Test ID: TC-MP-002
Objective: Verify order reception and response workflow

Preconditions:
- My Peppol Admin configured
- Test supplier can send orders
- ERP integration active

Test Steps:
1. Wait for test order from supplier
2. Check inbox for new document notification
3. Open received purchase order
4. Review line items and delivery requirements
5. Select "Accept Order" option
6. Verify Order Response generated
7. Confirm transmission to supplier
8. Check ERP for sales order creation

Expected Results:
✅ Order appears in inbox within 1 minute
✅ Email/desktop notification received
✅ Order details display correctly
✅ Inventory check runs automatically
✅ Order Response sent successfully
✅ Sales order created in ERP
✅ Warehouse team notified

Pass Criteria: End-to-end process completed in < 10 minutes
```

### Test Case 3: Partner Onboarding

```
Test ID: TC-MP-003
Objective: Verify new trading partner setup and validation

Preconditions:
- User has administrator privileges
- Test partner Peppol ID available
- Network connectivity to SML/SMP

Test Steps:
1. Navigate to Trading Partners → Add New Partner
2. Enter test Peppol ID
3. Click "Validate ID"
4. Fill in contact and preference details
5. Configure document exchange settings
6. Save partner profile
7. Run connectivity test

Expected Results:
✅ Peppol ID validated against SML
✅ Company details auto-populated
✅ Endpoint discovered successfully
✅ Partner saved to directory
✅ Test document transmitted
✅ Delivery confirmation received

Pass Criteria: Partner active and verified in < 20 minutes
```

### Test Case 4: Monthly Reporting

```
Test ID: TC-MP-004
Objective: Verify analytics report generation and export

Preconditions:
- System has 100+ documents from previous month
- User has reporting privileges

Test Steps:
1. Navigate to Reports & Analytics
2. Select previous month date range
3. Generate monthly summary
4. Review volume metrics
5. Check partner performance data
6. Export all reports
7. Verify downloaded files

Expected Results:
✅ Report generated within 30 seconds
✅ Accurate document count displayed
✅ Financial summaries calculated correctly
✅ Partner rankings shown
✅ All export formats available (CSV, Excel, PDF)
✅ Files downloadable and readable

Pass Criteria: Complete reports generated and exported in < 5 minutes
```

### Test Case 5: Search and Filter

```
Test ID: TC-MP-005
Objective: Verify advanced search functionality

Preconditions:
- System contains diverse document types
- Documents from multiple partners
- Date range spans 90 days

Test Steps:
1. Navigate to document search
2. Enter search criteria:
   - Partner name
   - Date range (last 30 days)
   - Document type (Invoice)
   - Status (Delivered)
3. Apply filters
4. Review search results
5. Export filtered results
6. Test different filter combinations

Expected Results:
✅ Search returns accurate results
✅ Filters work correctly
✅ Results sorted by date
✅ Pagination works for large result sets
✅ Export includes only filtered documents
✅ Search performance < 2 seconds

Pass Criteria: Accurate results returned in < 2 seconds
```

### Test Case 6: Error Handling - Failed Transmission

```
Test ID: TC-MP-006
Objective: Verify system handles transmission failures gracefully

Preconditions:
- Test partner with intentionally invalid endpoint
- Document ready to send

Test Steps:
1. Attempt to send document to invalid endpoint
2. Observe error handling
3. Check error message clarity
4. Verify retry mechanism
5. Review failed documents queue
6. Correct partner endpoint
7. Retry transmission manually

Expected Results:
✅ Clear error message displayed
✅ Document queued for retry
✅ Automatic retry attempted (3 times)
✅ User notified of permanent failure
✅ Document appears in failed queue
✅ Manual retry successful after correction

Pass Criteria: Error handled gracefully, document eventually delivered
```

---

## 10. Best Practices and Recommendations

### 10.1 Daily Operations Checklist

**Morning Routine (5-10 minutes):**
```
☐ Check inbox for overnight documents
☐ Review pending order responses
☐ Process high-priority orders first
☐ Verify no failed transmissions
☐ Respond to urgent partner communications
```

**Throughout the Day:**
```
☐ Process incoming documents within 1 hour
☐ Send invoices immediately after ERP finalization
☐ Monitor real-time dashboard for issues
☐ Respond to document status queries
```

**End of Day (5 minutes):**
```
☐ Verify all outbound documents delivered
☐ Check for pending actions
☐ Review tomorrow's scheduled transmissions
☐ Clear processed notifications
```

### 10.2 Partner Management Best Practices

**Onboarding:**
- Always test connectivity with new partners
- Document internal contact persons
- Set up automation rules for routine documents
- Schedule quarterly partnership reviews

**Ongoing Management:**
- Monitor partner delivery performance
- Update contact information promptly
- Review and optimize automation settings
- Maintain partner preference documentation

### 10.3 Performance Optimization

**High-Volume Tips:**
- Batch similar documents together
- Schedule large transmissions during off-peak hours
- Use parallel processing for 100+ documents
- Pre-validate documents before submission

**System Maintenance:**
- Review analytics monthly
- Archive old documents annually
- Update partner information quarterly
- Test disaster recovery procedures semi-annually

---

## 11. Troubleshooting and FAQ

### 11.1 Common Issues

**Q: Document stuck in "Sending" status?**

A: Check the following:
1. Verify recipient Peppol ID is correct
2. Ensure recipient is active on Peppol network
3. Check system status page for network issues
4. Review error logs in document details
5. Contact support if issue persists > 1 hour

**Q: Partner not receiving my documents?**

A: Troubleshooting steps:
1. Confirm partner's Peppol ID in their profile
2. Ask partner to check their Peppol inbox
3. Verify delivery confirmation shows "DELIVERED"
4. Check if partner's AP has technical issues
5. Send test document to verify connectivity

**Q: Cannot accept received order?**

A: Common causes:
- Document validation errors
- Incomplete order information
- ERP integration issues
- Insufficient permissions

Resolution: Check error message details and contact your system administrator.

### 11.2 FAQ

**Q1: How quickly are documents delivered?**
A: Typically 3-10 seconds for delivery to recipient's AP. Partner's internal processing time varies.

**Q2: Can I recall a sent document?**
A: No. Once delivered via Peppol, documents cannot be recalled. You can send a Credit Note or corrected version.

**Q3: What file formats are supported?**
A: Only UBL 2.1 XML format. System can auto-convert from internal formats.

**Q4: Is there a document size limit?**
A: Yes, 10 MB per document (rarely reached with business documents).

**Q5: How long are documents retained?**
A: 7 years for compliance. Older documents can be archived offline.

**Q6: Can I send to non-Peppol partners?**
A: No. Both sender and recipient must be registered on the Peppol network.

**Q7: What if my ERP system changes?**
A: Contact support to update integration endpoints. Document exchange continues without interruption.

**Q8: How do I handle different currencies?**
A: Peppol supports all ISO currencies. System displays amounts in original currency.

---

## 12. Summary

The My Peppol Admin Applet provides comprehensive tools for:

✅ **Easy document exchange** with global trading partners  
✅ **Centralized inbox** for all incoming Peppol documents  
✅ **Partner management** with detailed profiles and preferences  
✅ **Real-time tracking** and delivery confirmation  
✅ **Powerful search** and filtering capabilities  
✅ **Business analytics** and performance metrics  
✅ **Seamless ERP integration** for automated workflows  

**Key Benefits:**
- 📉 Reduce manual processing time by 80%
- ⚡ Real-time document exchange (seconds vs. days)
- 🌍 Connect with 400,000+ businesses globally
- 💰 Lower costs compared to traditional EDI
- ✅ Complete audit trail for compliance
- 🔒 Secure, encrypted transmission

**Next Steps:**
1. Explore the dashboard and familiarize yourself with the interface
2. Add your key trading partners to the directory
3. Send a test invoice to verify connectivity
4. Configure notifications and preferences
5. Review analytics to track performance

---

**Document Version**: 2.0  
**Last Updated**: October 2025  
**Next Review**: January 2026

For training and support: [support@bigledger.com](mailto:support@bigledger.com)  
Quick Start Guide: [Download PDF](#)