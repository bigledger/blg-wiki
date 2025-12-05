---
title: "Journal Module"
description: "Evaluate auto journal generation and manual journal entry capabilities"
weight: 5
---

This section covers the Journal Module functionality as specified in UTM Tender Requirements 9.21 (Auto Journal) and 9.22 (Manual Journal). Our system provides comprehensive journal management with full integration across all financial modules.

## Overview

The Journal Module provides:
- **Auto Journal Generation** - Automatic journal entries from source transactions
- **Manual Journal Entry** - For adjustments, accruals, and corrections
- **Inter-Module Integration** - Seamless posting from AR, AP, Inventory, Assets
- **Month-End Processing** - Depreciation, accruals, and closing entries
- **Complete Audit Trail** - Full tracking of all journal activities

## Test Scenario 1: Auto Journal from Sales Invoice

### Objective
Verify auto journal generation from sales transactions (Requirement 9.21a).

### Steps to Follow

1. **Create** a Sales Invoice (refer to AR module)
2. **Navigate** to: `Finance` → `Ledger and Journal` → `Journal Transaction`
3. **Search** for the auto-generated journal
4. **View** the journal details

### What to Verify

**Auto Journal Entry:**
| Account | Debit | Credit |
|---------|-------|--------|
| Accounts Receivable (1100) | Invoice Amount | - |
| Revenue (4000) | - | Net Amount |
| SST Payable (2200) | - | Tax Amount |

### Expected Results
- Journal automatically created upon invoice posting
- Correct account mapping based on configuration
- Balanced entry (Debits = Credits)
- Link to source document maintained

---

## Test Scenario 2: Auto Journal from Purchase Invoice

### Objective
Test auto journal generation from purchase transactions.

### Steps to Follow

1. **Create** a Purchase Invoice (refer to AP module)
2. **Navigate** to: `Finance` → `Ledger and Journal` → `Journal Transaction`
3. **Search** for the auto-generated journal
4. **View** the journal details

### What to Verify

**Auto Journal Entry:**
| Account | Debit | Credit |
|---------|-------|--------|
| Expense/Asset (5xxx/1xxx) | Net Amount | - |
| SST Input Tax (1300) | Tax Amount | - |
| Accounts Payable (2100) | - | Invoice Amount |

### Expected Results
- Journal automatically created
- Budget validation applied
- Correct expense/asset categorization
- Link to source PO and GRN

---

## Test Scenario 3: Auto Journal from External System

### Objective
Verify auto journal generation from integrated systems (Requirement 9.21b).

### Steps to Follow

1. **Navigate** to: `Finance` → `Ledger and Journal` → `Import Journal`
2. **View** the import template structure
3. **Observe** the integration capabilities

### What to Verify

**Integration Capabilities:**
| System | Integration Type |
|--------|-----------------|
| UTM HR (UTMHR) | API/File Import |
| Research (RADIS) | API Integration |
| Student System (MyAIMS) | API Integration |
| Payroll | Direct Integration |

### Expected Results
- Import template available
- Field mapping configuration
- Validation before posting
- Error handling and reporting

---

## Test Scenario 4: Manual Journal Entry

### Objective
Test manual journal entry for adjustments (Requirement 9.22).

### Steps to Follow

1. **Navigate** to: `Finance` → `Ledger and Journal` → `Journal Transaction` → `New`
2. **Create** a manual journal:
   - **Journal Type:** General Journal
   - **Reference:** ADJ-2025-001
   - **Description:** Monthly accrual adjustment
   - **Lines:** Add debit and credit entries
3. **Save and Post**

### What to Verify

**Manual Journal Capabilities (9.22a):**

| Use Case | Example |
|----------|---------|
| Monthly Account Closure | Period-end accruals |
| Annual Account Closure | Jernal Bulan 13 |
| Allocation Transfer | Cost allocation between PTJs |
| Accrual Adjustments | Prepaid/accrued expenses |
| Error Corrections | Reversing entries |

### Expected Results
- Free-form journal entry
- Multiple line items supported
- Balance validation (must equal)
- Audit trail created

---

## Test Scenario 5: Month 13 Closing Journal

### Objective
Test year-end adjustment journal capability (Jernal Bulan 13).

### Steps to Follow

1. **Navigate** to: `Finance` → `Ledger and Journal` → `Journal Transaction` → `New`
2. **Select** Period 13 (Year-End Adjustments)
3. **Create** closing entries
4. **Post** the journal

### What to Verify

**Year-End Journal Types:**
- Closing entries for revenue accounts
- Closing entries for expense accounts
- Transfer to retained earnings
- Audit adjustments

### Expected Results
- Period 13 available for posting
- Restricted to authorized users
- Complete audit trail
- Affects only equity/retained earnings

---

## Test Scenario 6: Reversal Journal Entry

### Objective
Test the void/reverse functionality for journals.

### Steps to Follow

1. **Navigate** to: `Finance` → `Ledger and Journal` → `Journal Transaction`
2. **Select** an existing journal
3. **Click** `Void (Reverse)`
4. **Confirm** the reversal

### What to Verify

**Reversal Features:**
- Original journal remains for audit
- New reversal journal created
- Opposite entries posted
- Link maintained between original and reversal

### Expected Results
- Reversal journal with reference to original
- GL balances correctly adjusted
- Complete audit trail
- No deletion of original entry

---

## Test Scenario 7: Journal Categories and Dimensions

### Objective
Test multi-dimensional journal posting.

### Steps to Follow

1. **Create** a new manual journal
2. **On the Lines tab**, expand the Categories section
3. **Assign** dimensions to each line

### What to Verify

**Available Dimensions:**
| Dimension | Purpose |
|-----------|---------|
| Segment | Organizational segment |
| Dimension | Additional classification |
| Project | Project code tracking |
| Profit Center | PTJ/Cost center |
| Category | Budget category |

### Expected Results
- All dimensions available per line
- Optional assignment
- Reporting by dimension
- Budget validation per dimension

---

## Test Scenario 8: Journal Import/Upload

### Objective
Test bulk journal import capability.

### Steps to Follow

1. **Navigate** to: `Finance` → `Ledger and Journal` → `Import Journal`
2. **Download** the import template
3. **Review** the template structure
4. **Observe** the import process flow

### What to Verify

**Import Template Fields:**
| Field | Description |
|-------|-------------|
| COMPANY_CODE | Company identifier |
| LEDGER_CODE | Ledger book |
| REFERENCE_NUMBER | Journal reference |
| CURRENCY_CODE | Transaction currency |
| GL_CODE | Account code |
| DEBIT | Debit amount |
| CREDIT | Credit amount |
| DESCRIPTION | Line description |

### Expected Results
- Clear template structure
- Validation before posting
- Error report for failed rows
- Successful rows posted automatically

---

## Test Scenario 9: Recurring Journal Setup

### Objective
Test recurring journal template functionality.

### Steps to Follow

1. **Navigate** to: `Finance` → `Ledger and Journal` → `Recurring Journals`
2. **Create** a recurring template:
   - **Name:** Monthly Depreciation
   - **Frequency:** Monthly
   - **Start Date:** Beginning of fiscal year
   - **Journal Lines:** Standard depreciation entries
3. **Activate** the template

### What to Verify

**Recurring Features:**
| Feature | Capability |
|---------|------------|
| Frequency Options | Daily, Weekly, Monthly, Quarterly, Annually |
| End Date | Fixed or indefinite |
| Auto-Post | Optional automatic posting |
| Notification | Alert when due |

### Expected Results
- Template saved successfully
- Generates journals per schedule
- Review queue before posting
- Audit trail of all generated journals

---

## Key Features Demonstrated

### Auto Journal Processing
- Source document integration
- Configurable account mapping
- Multi-module support
- Real-time posting

### Manual Journal Entry
- Flexible entry format
- Multi-line support
- Dimension assignment
- Approval workflow (if configured)

### Import Capabilities
- CSV template support
- Bulk processing
- Validation and error handling
- Audit trail

### Month-End Processing
- Depreciation calculation
- Stock valuation
- Accrual processing
- Period closing

---

## Advanced Features

### Journal Approval Workflow
- Configurable approval levels
- Amount-based routing
- Email notifications
- Mobile approval

### Error Checking & Validation
- Balanced entry validation
- Account code validation
- Period validation
- Duplicate detection

### Integration Points
- Sales/AR posting
- Purchase/AP posting
- Inventory movements
- Asset depreciation
- Payroll posting
- Bank transactions

---

## Navigation Tips

| Task | Menu Path |
|------|-----------|
| View All Journals | Finance → Ledger and Journal → Journal Transaction |
| Create Manual Journal | Finance → Ledger and Journal → Journal Transaction → New |
| Import Journals | Finance → Ledger and Journal → Import Journal |
| Recurring Templates | Finance → Ledger and Journal → Recurring Journals |
| View Ledger | Finance → Ledger and Journal → Ledger |
| View Sub-Ledger | Finance → Ledger and Journal → Sub-Ledger |

---

## Related Documentation

For detailed technical documentation:
- [Ledger and Journal Applet](/applets/ledger-and-journal-applet/)
- [Journal Entries Guide](/guides/accounting-guides/journal-entries/)

---

## Next Steps

After evaluating the Journal Module, proceed to:

{{< cards >}}
  {{< card link="../cash-management" title="Cash Management" subtitle="Test banking and reconciliation" >}}
  {{< card link="../financial-reporting" title="Financial Reporting" subtitle="Test financial statement generation" >}}
{{< /cards >}}
