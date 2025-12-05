---
title: "Accounts Payable (Payment Module)"
description: "Evaluate vendor management, invoice processing, payment workflows, and creditor registration"
weight: 3
---

This section covers the Accounts Payable functionality, including creditor/supplier registration as specified in UTM Tender Requirement 9.16(b). Our system provides comprehensive vendor management with seamless integration to procurement and payment processing.

## Overview

The Accounts Payable module provides:
- **Creditor/Supplier Registration** - Complete vendor master management
- **e-Perolehan Integration** - Ready to integrate with UTM's e-Procurement system
- **Invoice Processing** - Three-way matching (PO, GRN, Invoice)
- **Payment Workflows** - Multi-level approval and batch processing
- **Budget Validation** - Real-time budget checking before payment
- **E-Invoice Compliance** - LHDN MyInvois integration for self-billed invoices

## Test Scenario 1: Creditor/Supplier Registration

### Objective
Verify the system's supplier registration and management capabilities (Requirement 9.16b).

### Steps to Follow

1. **Login** to the demo system
2. **Navigate** to: `Purchasing` → `Supplier Maintenance` → `New Supplier`
3. **Enter** supplier details:
   - **Company Name:** ABC Supplies Sdn Bhd
   - **Registration No:** 123456-A
   - **Tax ID (TIN):** C12345678
   - **Contact Person:** Ahmad bin Ali
   - **Address:** Business address details
   - **Bank Details:** Account for payment

### What to Verify

**Registration Capabilities (9.16b):**

| Requirement | System Feature |
|-------------|----------------|
| e-Perolehan Integration | API ready for registered supplier sync |
| Complete supplier data | Comprehensive profile fields |
| Bank account management | Multiple bank accounts supported |
| Document attachment | SSM certificate, tax registration uploads |

### Expected Results
- Comprehensive supplier profile created
- Validation of mandatory fields (TIN, registration number)
- Automatic duplicate checking
- Supplier code generated automatically

---

## Test Scenario 2: Supplier Profile Management

### Objective
Test the complete supplier information management capabilities.

### Steps to Follow

1. **Navigate** to: `Purchasing` → `Supplier Maintenance`
2. **Search** for an existing supplier
3. **View** and explore all tabs:
   - Main Information
   - Contact Persons
   - Addresses (multiple locations)
   - Bank Accounts
   - Payment Terms
   - Documents

### What to Verify

**Supplier Data Elements:**
| Category | Fields |
|----------|--------|
| **Identity** | Company name, Registration no., TIN, SSM |
| **Contact** | Multiple contact persons with roles |
| **Addresses** | Business, Billing, Delivery addresses |
| **Financial** | Bank accounts, Payment terms, Credit limit |
| **Classification** | Supplier type, Industry, Status |

### Expected Results
- Comprehensive data capture
- Multiple addresses per supplier
- Multiple contact persons
- Document attachments viewable

---

## Test Scenario 3: Purchase Invoice Processing

### Objective
Test the invoice processing workflow with three-way matching.

### Steps to Follow

1. **Navigate** to: `Purchasing` → `Purchase Invoice` → `New Invoice`
2. **Create** an invoice:
   - **Supplier:** Select from master
   - **Reference:** Supplier invoice number
   - **PO Reference:** Link to Purchase Order
   - **GRN Reference:** Link to Goods Received Note
   - **Items:** Auto-populated from PO/GRN
3. **Submit** for approval

### What to Verify

**Three-Way Matching:**
| Document | Verification |
|----------|--------------|
| Purchase Order | Original order details |
| Goods Received Note | Actual receipt confirmation |
| Purchase Invoice | Supplier billing amount |

**System Validates:**
- Quantities match (PO vs GRN vs Invoice)
- Prices match (PO vs Invoice)
- Amounts within tolerance
- Budget availability

### Expected Results
- Automatic matching verification
- Variance highlighting if discrepancies exist
- Approval routing based on match status
- Budget validation performed

---

## Test Scenario 4: Budget Validation During Invoice

### Objective
Demonstrate budget checking during invoice processing.

### Steps to Follow

1. **Create** a purchase invoice for an amount that approaches budget limit
2. **Observe** the budget validation message
3. **Note** the available budget display

### What to Verify

**Budget Integration:**
- Current budget allocation displayed
- Committed amount (outstanding POs)
- Spent amount (processed invoices)
- Available balance shown
- Warning/block based on configuration

### Expected Results
- Clear budget status display
- Warning if near limit
- Block if over budget
- Option to request exception

---

## Test Scenario 5: Payment Processing

### Objective
Test the payment workflow from invoice to payment.

### Steps to Follow

1. **Navigate** to: `Finance` → `Accounts Payable` → `Payment Processing`
2. **Select** approved invoices for payment
3. **Choose** payment method:
   - Bank Transfer (IBG/GIRO)
   - Cheque
   - Online Banking
4. **Generate** payment batch

### What to Verify

**Payment Capabilities:**
| Payment Type | Features |
|--------------|----------|
| Bank Transfer | IBG, GIRO, RENTAS support |
| Cheque | Cheque printing, register |
| Online Banking | Bank file generation |
| Multi-Currency | Foreign currency payments |

### Expected Results
- Batch payment processing
- Payment file generation for bank upload
- Cheque printing capability
- Complete payment audit trail

---

## Test Scenario 6: Supplier Aging Analysis

### Objective
Test the creditor aging and liability reporting.

### Steps to Follow

1. **Navigate** to: `Finance` → `Accounts Payable` → `Reports` → `Aging Analysis`
2. **Configure** report parameters:
   - **As of Date:** Current date
   - **Aging Buckets:** Current, 30, 60, 90, 120+ days
   - **Supplier:** All or specific

### What to Verify

**Aging Report Features:**
- Outstanding invoices by age
- Supplier-wise breakdown
- Summary and detailed views
- Currency-wise analysis

### Expected Results
- Clear aging buckets display
- Drill-down to invoice details
- Export to Excel/PDF
- Payment scheduling integration

---

## Test Scenario 7: Self-Billed Invoice for E-Invoice

### Objective
Test the self-billed e-invoice functionality for non-compliant suppliers (Requirement for LHDN compliance).

### Steps to Follow

1. **Navigate** to: `Finance` → `E-Invoice` → `Self-Billed`
2. **Create** a self-billed invoice for a supplier who doesn't issue e-invoices
3. **Submit** to LHDN MyInvois

### What to Verify

**Self-Billed E-Invoice Process:**
- System generates e-invoice on behalf of supplier
- Proper document type (self-billed)
- LHDN MyInvois submission
- QR code generation
- Archive and retrieval

### Expected Results
- Compliant e-invoice generated
- Successful LHDN submission
- Validation status tracked
- Complete audit trail

---

## Test Scenario 8: Supplier Performance Tracking

### Objective
Demonstrate supplier evaluation and performance monitoring.

### Steps to Follow

1. **Navigate** to: `Purchasing` → `Supplier Maintenance`
2. **Select** a supplier
3. **View** the Performance tab

### What to Verify

**Performance Metrics:**
| Metric | Description |
|--------|-------------|
| Delivery Performance | On-time delivery rate |
| Quality Rating | Defect/return rate |
| Price Competitiveness | Market comparison |
| Invoice Accuracy | Matching success rate |
| Payment Terms Compliance | Discount utilization |

### Expected Results
- Historical performance data
- Scoring and rating display
- Trend analysis
- Supplier comparison reports

---

## Key Features Demonstrated

### Supplier Master Data
- Comprehensive profile management
- Multiple addresses and contacts
- Bank account management
- Document attachments
- Classification and categorization

### Invoice Processing
- Three-way matching
- Tolerance configuration
- Exception handling
- Budget validation
- Multi-currency support

### Payment Management
- Multiple payment methods
- Batch processing
- Bank file generation
- Payment scheduling
- Complete audit trail

### E-Invoice Integration
- LHDN MyInvois compliant
- Self-billed invoice capability
- Automated submission
- Status tracking
- 72-hour cancellation window

---

## Advanced Features

### Automated Workflows
- Invoice approval routing
- Payment authorization levels
- Exception escalation
- Email notifications

### Integration Points
- Procurement/e-Perolehan
- Budget management
- General Ledger
- Bank systems
- LHDN MyInvois

### Compliance Features
- Tax calculation (SST)
- Withholding tax support
- Government payment requirements
- Audit trail maintenance

---

## Navigation Tips

| Task | Menu Path |
|------|-----------|
| Supplier List | Purchasing → Supplier Maintenance |
| New Supplier | Purchasing → Supplier Maintenance → New |
| Purchase Invoices | Purchasing → Purchase Invoice |
| Payment Processing | Finance → Accounts Payable → Payment Processing |
| Aging Report | Finance → Accounts Payable → Reports → Aging |
| E-Invoice Self-Billed | Finance → E-Invoice → Self-Billed |

---

## Related Documentation

For detailed technical documentation:
- [Supplier Maintenance Applet](/applets/supplier-maintenance-applet/)
- [Purchasing Guides](/guides/purchasing-guides/)
- [E-Invoice Guide](/guides/einvoice-guides/malaysia-e-invoice-guide/)

---

## Next Steps

After evaluating the Accounts Payable module, proceed to:

{{< cards >}}
  {{< card link="../accounts-receivable" title="Accounts Receivable" subtitle="Test debtor and receipt management" >}}
  {{< card link="../cash-management" title="Cash Management" subtitle="Test banking and reconciliation" >}}
{{< /cards >}}
