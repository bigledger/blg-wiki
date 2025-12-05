---
title: "Accounts Receivable (Receipt Module)"
description: "Evaluate debtor management, billing, collections, and receipt processing"
weight: 4
---

This section covers the Accounts Receivable functionality, including debtor/customer registration as specified in UTM Tender Requirement 9.16(a). Our system provides comprehensive receivables management with robust collection tools and e-invoice compliance.

## Overview

The Accounts Receivable module provides:
- **Debtor Registration** - Complete customer/debtor master management
- **e-Perolehan Integration** - Ready to sync with UTM's procurement system for registered suppliers as debtors
- **Invoice Generation** - Various invoice types (Tax Invoice, Debit Note, Credit Note)
- **Receipt Processing** - Multiple payment methods and automatic allocation
- **Collection Management** - Aging analysis, reminders, and collection workflows
- **E-Invoice Compliance** - LHDN MyInvois integration

## Test Scenario 1: Debtor Registration

### Objective
Verify the debtor registration and management capabilities (Requirement 9.16a).

### Steps to Follow

1. **Login** to the demo system
2. **Navigate** to: `Sales` → `Customer Maintenance` → `New Customer`
3. **Enter** customer/debtor details:
   - **Customer Name:** XYZ Corporation Sdn Bhd
   - **Registration No:** 987654-X
   - **Tax ID (TIN):** C98765432
   - **Contact Person:** Fatimah binti Hassan
   - **Address:** Business address
   - **Credit Terms:** 30 days

### What to Verify

**Registration Capabilities (9.16a):**

| Requirement | System Feature |
|-------------|----------------|
| e-Perolehan Integration | API ready for registered debtor sync |
| Complete debtor data | Comprehensive profile fields |
| Credit management | Credit limits and terms |
| Document attachment | Supporting documents upload |

### Expected Results
- Comprehensive debtor profile created
- Validation of mandatory fields
- Customer code generated automatically
- Credit limit assigned

---

## Test Scenario 2: Debtor Profile Management

### Objective
Test the complete debtor information management.

### Steps to Follow

1. **Navigate** to: `Sales` → `Customer Maintenance`
2. **Search** for an existing customer
3. **Explore** all tabs:
   - Main Information
   - Contact Persons
   - Addresses (Billing, Delivery)
   - Credit Management
   - Transaction History

### What to Verify

**Debtor Data Elements:**
| Category | Fields |
|----------|--------|
| **Identity** | Company name, Registration no., TIN |
| **Contact** | Multiple contact persons |
| **Addresses** | Billing, Shipping, Service addresses |
| **Financial** | Credit limit, Payment terms, Currency |
| **History** | Past transactions, Payment patterns |

### Expected Results
- All customer data accessible
- Transaction history visible
- Credit status clearly displayed
- Outstanding balance shown

---

## Test Scenario 3: Invoice Generation

### Objective
Test the billing/invoice creation process.

### Steps to Follow

1. **Navigate** to: `Sales` → `Sales Invoice` → `New Invoice`
2. **Create** an invoice:
   - **Customer:** Select from master
   - **Invoice Date:** Today
   - **Due Date:** Based on credit terms
   - **Items:** Services or products
   - **Tax:** SST as applicable
3. **Save and Post**

### What to Verify

**Invoice Features:**
| Feature | Capability |
|---------|------------|
| Invoice Types | Tax Invoice, Proforma, Debit Note, Credit Note |
| Line Items | Multiple items with descriptions |
| Tax Calculation | Automatic SST calculation |
| Currency | Multi-currency support |
| E-Invoice | Automatic LHDN submission |

### Expected Results
- Invoice generated with proper numbering
- Tax calculated correctly
- E-invoice submitted to LHDN (if applicable)
- GL posting created automatically
- Customer balance updated

---

## Test Scenario 4: E-Invoice Generation and Submission

### Objective
Test the e-invoice compliance workflow.

### Steps to Follow

1. **Create** an invoice as in Scenario 3
2. **Observe** the e-invoice status
3. **Navigate** to: `Finance` → `E-Invoice` → `Submission Status`
4. **Track** the invoice through the LHDN MyInvois process

### What to Verify

**E-Invoice Workflow:**
| Stage | Status |
|-------|--------|
| Posting Queue | Initial validation |
| Submitted | Sent to LHDN |
| Validated | LHDN approved |
| Rejected | If errors (72-hour correction window) |

### Expected Results
- Automatic e-invoice generation
- Real-time submission status
- QR code generated upon validation
- Complete audit trail

---

## Test Scenario 5: Receipt Processing

### Objective
Test the payment receipt and allocation process.

### Steps to Follow

1. **Navigate** to: `Finance` → `Accounts Receivable` → `Receipts` → `New Receipt`
2. **Record** a payment:
   - **Customer:** Select debtor
   - **Amount:** Payment amount
   - **Payment Method:** Bank transfer, Cheque, Cash, etc.
   - **Reference:** Bank reference or cheque number
3. **Allocate** to outstanding invoices
4. **Save**

### What to Verify

**Receipt Features:**
| Feature | Capability |
|---------|------------|
| Payment Methods | Bank transfer, Cheque, Cash, Credit card, E-wallet |
| Auto-Allocation | Automatic matching to oldest invoices |
| Partial Payment | Support for partial payments |
| Advance Payment | Handle deposits/advances |
| Multi-Invoice | Apply to multiple invoices |

### Expected Results
- Receipt recorded with reference
- Automatic GL posting (Bank Dr, AR Cr)
- Customer balance updated
- Invoice status updated (Partial/Paid)

---

## Test Scenario 6: Debtor Aging Analysis

### Objective
Test the receivables aging and monitoring capabilities.

### Steps to Follow

1. **Navigate** to: `Finance` → `Accounts Receivable` → `Reports` → `Aging Analysis`
2. **Configure** report:
   - **As of Date:** Current date
   - **Aging Buckets:** Current, 30, 60, 90, 120+ days
   - **Customer:** All or specific

### What to Verify

**Aging Report Features:**
- Outstanding invoices by age
- Customer-wise breakdown
- Summary and detailed views
- Overdue highlighting

### Expected Results
- Clear aging buckets display
- Drill-down to invoice details
- Export to Excel/PDF
- Collection action triggers

---

## Test Scenario 7: Collection Management

### Objective
Test the collection workflow and reminder system.

### Steps to Follow

1. **Navigate** to: `Finance` → `Accounts Receivable` → `Collections`
2. **View** the collection queue
3. **Select** an overdue account
4. **Generate** reminder letter

### What to Verify

**Collection Features:**
| Feature | Capability |
|---------|------------|
| Collection Queue | Prioritized list of overdue accounts |
| Reminder Letters | Automated reminder generation |
| Communication Log | Track all collection activities |
| Promise to Pay | Record payment commitments |
| Escalation | Workflow for escalating cases |

### Expected Results
- Prioritized collection list
- Automated reminder templates
- Activity logging
- Payment promise tracking

---

## Test Scenario 8: Customer Statement Generation

### Objective
Test the statement of account generation.

### Steps to Follow

1. **Navigate** to: `Finance` → `Accounts Receivable` → `Statements`
2. **Select** customer(s)
3. **Generate** statement:
   - **Period:** Select date range
   - **Format:** Summary or Detailed
   - **Delivery:** Print, Email, Portal

### What to Verify

**Statement Features:**
- Opening balance
- All transactions in period
- Payments received
- Closing balance
- Aging summary

### Expected Results
- Professional statement format
- Multiple delivery options
- Automatic email capability
- Customer portal access

---

## Key Features Demonstrated

### Debtor Master Data
- Comprehensive profile management
- Credit limit management
- Payment terms configuration
- Transaction history tracking
- Document attachments

### Billing & Invoicing
- Multiple invoice types
- Automatic tax calculation
- E-invoice compliance
- Credit/Debit notes
- Recurring billing

### Receipt Management
- Multiple payment methods
- Automatic allocation
- Partial payments
- Advance payments
- Bank reconciliation integration

### Collection Management
- Aging analysis
- Automated reminders
- Collection workflows
- Payment promises
- Legal action tracking

---

## Advanced Features

### Credit Management
- Credit limit monitoring
- Credit hold automation
- Credit scoring
- Risk assessment
- Credit insurance integration ready

### E-Invoice Features
- Individual and consolidated e-invoices
- B2B and B2C support
- Self-billed for supplier payments
- 72-hour rejection handling
- Complete audit trail

### Integration Points
- General Ledger posting
- Budget validation (for internal billings)
- Bank reconciliation
- LHDN MyInvois
- Customer portal

---

## Navigation Tips

| Task | Menu Path |
|------|-----------|
| Customer List | Sales → Customer Maintenance |
| New Customer | Sales → Customer Maintenance → New |
| Sales Invoices | Sales → Sales Invoice |
| Receipts | Finance → Accounts Receivable → Receipts |
| Aging Report | Finance → Accounts Receivable → Reports → Aging |
| Statements | Finance → Accounts Receivable → Statements |
| Collections | Finance → Accounts Receivable → Collections |

---

## Related Documentation

For detailed technical documentation:
- [Customer Maintenance Applet](/applets/customer-maintenance-applet/)
- [Accounts Receivable Applet](/applets/accounts-receivable-applet/)
- [E-Invoice Guide](/guides/einvoice-guides/malaysia-e-invoice-guide/)

---

## Next Steps

After evaluating the Accounts Receivable module, proceed to:

{{< cards >}}
  {{< card link="../journal-module" title="Journal Module" subtitle="Test auto and manual journal entries" >}}
  {{< card link="../cash-management" title="Cash Management" subtitle="Test banking and reconciliation" >}}
{{< /cards >}}
