---
title: "Direct Invoice Workflow"
description: "Process purchases without PO or GRN - ideal for services, utilities, subscriptions, and non-stock expense purchases"
weight: 30
---

The Direct Invoice Workflow is the simplest purchasing process, going straight from invoice receipt to payment. This workflow is designed for purchases that don't involve physical goods receipt or where creating a PO and GRN would add no value.

## When to Use Direct Invoice Workflow

This workflow is perfect for:

- **Professional services** (legal, accounting, consulting)
- **Utilities** (electricity, water, gas, internet)
- **Subscriptions** (software licenses, cloud services, memberships)
- **Insurance premiums**
- **Rent and lease payments**
- **Marketing services** (advertising, media buys)
- **Bank charges and fees**
- **Professional development** (training, conferences)
- **Outsourced services** (cleaning, security, maintenance contracts)

{{< callout type="info" >}}
**Key Characteristic**: Use Direct Invoice for purchases where there's nothing physical to receive into inventory, or where the "receipt" is simultaneous with invoice (like utility consumption).
{{< /callout >}}

## When NOT to Use This Workflow

Avoid Direct Invoice for:

- **Physical goods** requiring inventory tracking
- **High-value purchases** needing approval trail
- **Capital equipment** requiring asset tracking
- **Inventory items** for resale or production
- **Items with serial numbers** needing warranty tracking

For these, use:
- [Standard Procurement Workflow](/guides/purchasing-guides/standard-procurement-workflow) - For goods with PO
- [Direct GRN Workflow](/guides/purchasing-guides/direct-grn-workflow) - For goods without PO

## Process Flow

```
Step 1: Receive Invoice → Step 2: Verify Service/Expense → Step 3: Enter Invoice → Step 4: Get Approval → Step 5: Make Payment
    ↓                          ↓                             ↓                    ↓                     ↓
Supplier Sends         Staff Confirms               Create in System     Manager Approves      Pay Supplier
Invoice               Service Received             Record Expense       Based on Rules        Per Terms
```

**Key Difference**: No goods receipt process, invoice goes directly to approval and payment.

---

## Step 1: Receive Invoice from Supplier

**Responsible Role**: Administrative Staff / Accounts Payable

### Invoice Receipt Channels

Invoices arrive through various channels:

#### Email
- Most common for services and subscriptions
- PDF attachments
- Save to designated folder
- Forward to AP email address

#### Mail/Post
- Traditional invoices
- Original hard copy
- Scan immediately upon receipt
- Date stamp physical copy

#### Supplier Portal
- Download from supplier website
- Online billing systems
- Electronic invoicing platforms
- Save PDF copy

#### Hand Delivery
- Walk-in service providers
- On-site contractors
- Physical copy received
- Get acknowledgment receipt

{{< callout type="tip" >}}
**Email Management**: Set up email rules to automatically route supplier invoices to AP inbox. Use subject line keywords: "Invoice", supplier names, common terms.
{{< /callout >}}

### Initial Invoice Screening

Before processing, verify invoice validity:

#### Valid Tax Invoice Requirements
- [ ] Supplier name and address
- [ ] Tax registration number (if applicable)
- [ ] Unique invoice number
- [ ] Invoice date
- [ ] Your company name
- [ ] Description of service/expense
- [ ] Amount before tax
- [ ] Tax amount (if applicable)
- [ ] Total amount due
- [ ] Payment terms
- [ ] Payment details (bank account)

#### Red Flags to Watch For
- **Duplicate invoice numbers**: Check if already processed
- **Incorrect company name**: Might be for wrong entity
- **Missing tax details**: Can't claim input tax
- **Unusual supplier**: Verify legitimacy
- **Amount seems high**: Compare to previous invoices
- **Different bank account**: Fraud risk - verify with supplier

{{< callout type="warning" >}}
**Fraud Alert**: Email invoice fraud is common. If supplier's bank account suddenly changes, CALL the supplier (don't email) to verify before paying.
{{< /callout >}}

---

## Step 2: Verify Service or Expense Received

**Responsible Role**: Service Recipient / Department Manager

Before processing invoice, confirm the underlying service or expense:

### Service Verification

For professional services:

#### Consulting/Professional Services
- [ ] Service was actually provided
- [ ] Service meets agreed scope
- [ ] Hours/days match agreement
- [ ] Quality is acceptable
- [ ] Deliverables received (reports, documents)

**Verification method**:
- Contact service recipient (the person who engaged service)
- Review project completion status
- Check deliverables against contract
- Confirm satisfaction before approving payment

#### Recurring Services
- [ ] Service continues to be provided
- [ ] No quality issues
- [ ] Contract is still active
- [ ] Price matches agreement

**Examples**:
- **Cleaning service**: Site manager confirms service performed
- **Security service**: HR confirms guards present per schedule
- **Maintenance contract**: Facility manager confirms uptime

### Expense Verification

For non-service expenses:

#### Utilities
- [ ] Meter readings reasonable
- [ ] Usage aligns with operations
- [ ] No unusual spikes (investigate if yes)
- [ ] Charges match rate card

**Verification steps**:
1. Compare to previous months
2. Check for seasonal variations
3. Verify meter readings if possible
4. Investigate anomalies before paying

#### Subscriptions and Licenses
- [ ] Service is still needed
- [ ] Users are actively using it
- [ ] No duplicate subscriptions
- [ ] Price matches agreement

**Review questions**:
- Are we still using this software/service?
- Can we consolidate with another subscription?
- Is renewal automatic or can we negotiate?
- Do we need this many licenses?

#### Insurance Premiums
- [ ] Policy is current and correct
- [ ] Coverage matches requirements
- [ ] Premium matches quotation
- [ ] Policy period is correct

### Contract Reference

If invoice is for contracted services:

1. **Locate contract/agreement**
2. **Verify invoice terms match**:
   - Service description
   - Pricing/rates
   - Payment terms
   - Billing frequency
3. **Check contract value**:
   - Running total of invoices
   - Not exceeding contract value
   - Budget remaining

{{< callout type="info" >}}
**Contract Management**: Maintain a contract register linking invoices to contracts. This ensures you don't overpay and helps track contract utilization.
{{< /callout >}}

---

## Step 3: Enter Invoice in System

**Responsible Role**: Accounts Payable Clerk

### Navigation
`[Accounts Payable > Purchase Invoices > New Direct Invoice]`

or

`[Purchasing > Purchase Invoices > New Invoice > Without PO/GRN]`

### Invoice Header

#### Document Information
- **Invoice Number**: Exactly as on supplier invoice
- **Invoice Date**: Date on invoice
- **Received Date**: When you received it
- **Due Date**: Invoice date + payment terms
- **GL Date**: Accounting period to record expense

#### Supplier Information
- **Supplier**: Select from supplier master
- **Supplier Contact**: If specific contact
- **Currency**: Base or foreign currency
- **Exchange Rate**: If foreign currency (auto-filled or manual)

#### Reference Information
- **Your Reference**: Internal reference (PO number if informal PO, project code, etc.)
- **Their Reference**: Supplier's reference from invoice
- **Contract Number**: If under contract
- **Description**: Brief description of invoice

{{< callout type="tip" >}}
**Period Control**: Pay attention to GL Date, especially near month-end. Ensure expenses are recorded in the correct accounting period for accurate financial reporting.
{{< /callout >}}

### Invoice Line Items

For each line on the invoice:

#### Line Item Entry
- **Description**: Clear description of service/expense
  - Example: "Legal services - contract review"
  - Example: "Office cleaning services - March 2024"
  - Example: "AWS cloud hosting - March 2024"

- **Quantity**: Usually 1 for services, or actual quantity
  - 1 month of service
  - 40 hours of consulting
  - 5 user licenses

- **Unit Price**: Price per unit
  - Monthly fee
  - Hourly rate
  - Per-license cost

- **Amount**: Total line amount (Qty × Price)

- **Tax Code**: VAT/GST treatment
  - Standard rated (most services)
  - Zero-rated (exports, some services)
  - Exempt (financial services, education)

- **Tax Amount**: Calculated or manual entry

#### Account Coding

Critical for proper expense classification:

**G/L Account**: Select appropriate expense account
- Professional fees
- Utilities
- Software subscriptions
- Insurance
- Rent
- Marketing expenses
- Bank charges
- Training & development

**Cost Center**: Department or cost center
- Administration
- Sales & Marketing
- IT Department
- Human Resources
- Production
- Research & Development

**Project Code**: If applicable
- Specific client project
- Internal initiative
- Capital project

**Additional Dimensions** (if used):
- Business unit
- Location
- Fund/grant code

{{< callout type="warning" >}}
**Accounting Accuracy**: Incorrect G/L coding creates incorrect financial statements and management reports. Take time to code correctly - corrections are time-consuming.
{{< /callout >}}

### Common Invoice Types and Coding

#### Professional Services

**Legal Fees**:
```
Description: Legal services - contract drafting
G/L Account: Professional Fees - Legal
Cost Center: Administration
Amount: $2,500
```

**Accounting Services**:
```
Description: Monthly accounting services
G/L Account: Professional Fees - Accounting
Cost Center: Finance
Amount: $3,000
```

**Consulting**:
```
Description: IT consulting - 40 hours
G/L Account: Consulting Fees
Cost Center: IT Department
Project: ERP Implementation
Amount: $6,000
```

#### Utilities

**Electricity**:
```
Description: Electricity - March 2024
G/L Account: Utilities - Electricity
Cost Center: Facilities
Amount: $1,200
```

**Internet/Telecom**:
```
Description: Internet service - March 2024
G/L Account: Utilities - Telecommunications
Cost Center: IT
Amount: $500
```

#### Subscriptions

**Software as a Service**:
```
Description: Salesforce CRM - 10 users monthly
G/L Account: Software Subscriptions
Cost Center: Sales & Marketing
Amount: $150
```

**Cloud Hosting**:
```
Description: AWS cloud hosting - March
G/L Account: IT Infrastructure - Cloud
Cost Center: IT
Amount: $850
```

#### Rent and Leases

**Office Rent**:
```
Description: Office rent - April 2024
G/L Account: Rent Expense
Cost Center: Administration
Amount: $5,000
```

**Equipment Lease**:
```
Description: Forklift lease - monthly
G/L Account: Equipment Lease
Cost Center: Warehouse
Amount: $800
```

### Split Invoices

If one invoice covers multiple departments/projects:

**Example**: Electricity bill split by department

```
Line 1:
Description: Electricity - Production area (60%)
G/L Account: Utilities - Electricity
Cost Center: Production
Amount: $720

Line 2:
Description: Electricity - Office area (30%)
G/L Account: Utilities - Electricity
Cost Center: Administration
Amount: $360

Line 3:
Description: Electricity - Warehouse (10%)
G/L Account: Utilities - Electricity
Cost Center: Warehouse
Amount: $120

Total: $1,200
```

{{< callout type="info" >}}
**Allocation Keys**: Set up standard allocation percentages for recurring split invoices (like utilities). This ensures consistent and fair cost distribution.
{{< /callout >}}

### Tax Handling

#### Standard Rated Services
Most services subject to VAT/GST:
- Professional services
- Most utilities
- Advertising
- Software subscriptions

**Entry**:
```
Net Amount: $1,000
Tax (18%): $180
Total: $1,180
```

#### Zero-Rated Services
Tax rate = 0%, but invoice must show this:
- Exported services
- International freight
- Some education services

**Entry**:
```
Net Amount: $1,000
Tax (0%): $0
Total: $1,000
```

#### Exempt Services
No tax charged, invoice may not mention tax:
- Financial services (some jurisdictions)
- Insurance (some jurisdictions)
- Medical services

**Entry**:
```
Amount: $1,000
(No tax line)
```

#### Withholding Tax
For some professional services, you may need to withhold tax:

**Example** (10% withholding):
```
Invoice Amount: $1,000
Withholding Tax: -$100
Net Payment: $900
```

System entries:
- Debit: Professional Fees $1,000
- Credit: Withholding Tax Payable $100
- Credit: Accounts Payable $900

{{< callout type="warning" >}}
**Withholding Tax Compliance**: Failing to withhold required tax makes your company liable. Check regulations for which services require withholding.
{{< /callout >}}

### Document Attachment

Attach supporting documentation:

#### Required Documents
1. **Supplier Invoice** (PDF or scan)
   - Must be clear and legible
   - All pages included
   - Tax invoice requirements met

2. **Service Confirmation** (if applicable)
   - Service completion certificate
   - Deliverables received acknowledgment
   - Timesheet (for hourly services)
   - Usage reports (for utilities)

3. **Contract/Agreement** (for first invoice)
   - Master service agreement
   - Statement of work
   - Quotation or proposal
   - Rate card

4. **Approval Documentation**
   - Email approval
   - Approval form
   - Board resolution (for major expenses)

#### Upload Process
1. Click **Attachments** tab
2. For each document:
   - Add document
   - Select type
   - Choose file
   - Add description
   - Upload
3. Verify all critical docs attached

---

## Step 4: Invoice Approval Workflow

**Responsible Role**: Approving Managers (per approval matrix)

### Approval Routing Rules

System routes based on:

#### Invoice Value
| Amount | Approver | Typical Time |
|--------|----------|--------------|
| < $500 | Supervisor | Same day |
| $500 - $2,000 | Department Manager | 1 day |
| $2,000 - $10,000 | Senior Manager | 2 days |
| $10,000 - $50,000 | CFO | 3 days |
| > $50,000 | CEO/Board | 5+ days |

#### Expense Type
Some expenses require specific approvers:
- **Legal fees**: Legal counsel + CFO
- **IT subscriptions**: IT Manager + CFO
- **Insurance**: Risk Manager + CFO
- **Marketing**: Marketing Director + CFO

#### Budget Control
- **Within budget**: Normal routing
- **Over budget**: Additional approval from budget holder
- **No budget**: CFO or CEO approval required

### Approval Process

#### For Approvers

When notification received:

1. **Review invoice details**:
   - Supplier is legitimate
   - Service/expense is business-related
   - Amount is reasonable
   - Coding is correct

2. **Verify business need**:
   - Service was authorized
   - Expense is necessary
   - Budget is available
   - Contract terms met (if applicable)

3. **Check supporting documents**:
   - Invoice is attached
   - Service confirmation provided
   - Contract is referenced
   - All requirements met

4. **Take action**:
   - **Approve**: If all is correct
   - **Reject**: If issues found
   - **Query**: If more information needed

5. **Add approval notes**:
   - Confirm service received
   - Note any concerns
   - Reference authorization source

{{< callout type="tip" >}}
**Approval Best Practice**: Don't just rubber-stamp. Actually verify service was received and needed. This is your control point to prevent waste and fraud.
{{< /callout >}}

### Handling Approval Issues

#### Issue: Approver Not Available
**Solutions**:
- Use delegation feature (pre-setup)
- Route to backup approver
- Escalate to higher authority
- Request temporary delegation

#### Issue: Invoice Lacks Information
**Action**:
1. Reject with clear comments
2. Request missing information
3. AP follows up with supplier
4. Resubmit when complete

#### Issue: Service Not Verified
**Action**:
1. Query to service recipient
2. Wait for confirmation
3. Keep invoice on hold
4. Follow up if no response

#### Issue: Budget Exceeded
**Action**:
1. Check YTD spend vs. budget
2. If truly over budget:
   - Seek budget virement (transfer)
   - Get CFO approval
   - Document justification
3. If within budget: Approve normally

---

## Step 5: Post Invoice and Schedule Payment

**Responsible Role**: Accounts Payable

### Invoice Posting

Once fully approved:

1. **Final review**:
   - All approvals received
   - Documents attached
   - Coding verified
   - No outstanding queries

2. **Post invoice**:
   - Click **Post Invoice**
   - System creates accounting entries
   - Invoice becomes payable
   - Payment scheduled

3. **Accounting entries**:
```
Debit: Expense Account (per coding)   $1,000
Debit: Input Tax (if applicable)         $180
Credit: Accounts Payable                        $1,180
```

4. **Invoice status**:
   - Posted
   - Awaiting payment
   - Due date set

### Payment Processing

**Navigation**: `[Accounts Payable > Payment Processing]`

#### Payment Scheduling

**Immediate payment** (urgent):
- Same-day payment required
- Special approval obtained
- Process individually

**Normal payment cycle**:
- Weekly payment runs
- Twice-monthly runs
- Monthly payment (for monthly invoices)

**Scheduled for due date**:
- System flags on due date
- Included in payment run
- Avoids late payment

#### Payment Methods

**Bank Transfer** (most common):
1. Create payment batch
2. Generate bank file
3. Upload to online banking
4. Authorize payment
5. Record in system

**Check Payment**:
1. Generate check
2. Get signatures
3. Mail to supplier
4. Record check number

**Credit Card**:
1. Pay via company card
2. Record payment
3. Reconcile with card statement

**Direct Debit**:
1. Supplier auto-debits account
2. Receive notification
3. Record in system
4. Reconcile with bank

{{< callout type="info" >}}
**Payment Timing**: For services already consumed (utilities, past services), pay on or before due date to maintain good supplier relations and credit terms.
{{< /callout >}}

### Payment Posting

After payment executed:

1. **Record payment**:
   - Payment date
   - Payment reference (bank confirmation)
   - Payment amount
   - Payment method

2. **System creates entry**:
```
Debit: Accounts Payable   $1,180
Credit: Bank Account              $1,180
```

3. **Invoice status**: Paid

4. **Supplier account**: Updated

### Remittance Advice

Send payment confirmation to supplier:

**Auto-generation**:
- System generates remittance
- Shows: Payment date, amount, invoices paid, reference
- Email to supplier automatically

**Manual process**:
- Print remittance advice
- Mail with check or separately
- Email PDF to supplier

---

## Special Scenarios

### Scenario 1: Monthly Software Subscription

**Supplier**: SaaS Provider
**Service**: Project management software
**Billing**: Monthly auto-invoice

**Process**:
1. **Auto-invoice received** via email on 1st of month
2. **AP enters invoice**:
   - Description: "PM Software - March 2024 - 10 users"
   - Amount: $100/month
   - G/L: Software Subscriptions
   - Cost Center: IT
3. **Auto-routed** to IT Manager
4. **IT Manager approves** (confirms still using)
5. **Posted** to payables
6. **Paid** via company credit card (auto-payment setup)
7. **Payment recorded** from card statement

**Timeline**: Received to paid = 2 days

### Scenario 2: Legal Services Invoice

**Supplier**: Law Firm ABC
**Service**: Contract review and negotiation
**Billing**: Upon completion

**Process**:
1. **Invoice received** via email: $5,500 for 22 hours work
2. **AP enters invoice** with timesheet attachment
3. **Routed** to Legal Counsel
4. **Legal reviews**:
   - Verifies work was done
   - Checks hours reasonable
   - Confirms rate matches agreement
   - Approves
5. **Routed** to CFO (amount > $5,000)
6. **CFO approves** (budget available)
7. **Posted** to payables
8. **Withholding tax calculated**: 10% = $550
9. **Payment scheduled**: $4,950 net of withholding
10. **Paid** via bank transfer on due date
11. **Withholding remitted** to tax authority

**Timeline**: Received to paid = 30 days (Net 30 terms)

### Scenario 3: Electricity Bill

**Supplier**: Power Company
**Service**: Electricity consumption
**Billing**: Monthly based on meter reading

**Process**:
1. **Invoice received** via email: $3,600
2. **AP enters invoice**
3. **Routed** to Facility Manager
4. **Facility Manager**:
   - Checks meter reading (actual vs. invoice)
   - Compares to last month (within expected range)
   - Verifies rate (no unusual charges)
   - **Sees spike**: 50% higher than usual
5. **Investigates spike**:
   - Checks production schedule (was there overtime?)
   - Reviews HVAC logs (cooling season started?)
   - Identifies: New equipment installed (legitimate increase)
   - Documents reason
6. **Approves** with notation
7. **Posted** with split coding:
   - 70% Production ($2,520)
   - 30% Administration ($1,080)
8. **Paid** via bank transfer

**Timeline**: Received to paid = 15 days

### Scenario 4: Annual Insurance Premium

**Supplier**: Insurance Company XYZ
**Service**: Commercial general liability insurance
**Billing**: Annual premium

**Process**:
1. **Renewal invoice received**: $24,000
2. **AP checks**:
   - Compares to prior year ($22,000 - increased 9%)
   - Verifies policy number
   - Checks coverage period (correct dates)
3. **Enters invoice** with policy schedule attached
4. **Routed** to Risk Manager
5. **Risk Manager verifies**:
   - Coverage amounts correct
   - Premium matches quotation
   - Policy terms acceptable
   - Approves
6. **Routed** to CFO (high value)
7. **CFO approves**
8. **Posted** but...
9. **Accounting treatment**: Prepaid expense
```
Debit: Prepaid Insurance        $24,000
Credit: Accounts Payable                 $24,000

(Then monthly amortization:)
Debit: Insurance Expense         $2,000
Credit: Prepaid Insurance                 $2,000
```
10. **Paid** before policy inception date

**Special note**: Insurance must be paid to keep coverage active, so ensure payment before current policy expires.

---

## Controls and Compliance

### Segregation of Duties

Even without PO/GRN, maintain control:

**Different people for**:
1. **Service recipient**: Confirms service received
2. **Invoice entry**: AP staff enters invoice
3. **Approval**: Manager approves expense
4. **Payment**: Treasury processes payment
5. **Reconciliation**: Different person reconciles

{{< callout type="warning" >}}
**Fraud Risk**: Direct invoice process is vulnerable to fraud (fake invoices, personal expenses). Strong approval process and segregation of duties are critical.
{{< /callout >}}

### Key Controls

#### 1. Supplier Master Verification
- Only pay to verified suppliers in master file
- Require new supplier setup process
- Verify bank account changes before payment

#### 2. Duplicate Check
- System checks for duplicate invoice numbers
- Manual review of similar amounts/dates
- Query if invoice seems duplicate

#### 3. Service Confirmation
- Require confirmation from service recipient
- Don't pay for undelivered services
- Verify quality before payment

#### 4. Budget Control
- Check budget availability before approval
- Flag over-budget expenses
- Require additional approval for overruns

#### 5. Contract Compliance
- Match invoice to contract terms
- Verify rates and amounts
- Track contract cumulative value

#### 6. Tax Compliance
- Verify valid tax invoice
- Check tax calculation
- Apply withholding tax where required
- Maintain tax documentation

### Monthly Compliance Checklist

- [ ] All invoices have approvals
- [ ] All invoices have supplier documents attached
- [ ] Service confirmations documented
- [ ] Tax invoices valid for input tax claims
- [ ] Withholding taxes calculated and withheld
- [ ] No duplicate invoices paid
- [ ] All expenses properly coded
- [ ] Accruals made for services received but not invoiced

---

## Accruals and Deferrals

### Period-End Accruals

For services received but not yet invoiced:

**Example**: Legal services provided in March, invoice in April

**March accrual entry**:
```
Debit: Professional Fees - Legal   $3,000
Credit: Accrued Expenses                     $3,000
```

**April (when invoice received)**:
```
Debit: Accrued Expenses           $3,000
Credit: Accounts Payable                    $3,000
```

{{< callout type="info" >}}
**Matching Principle**: Accrue expenses in the period services are consumed, not when invoiced. This gives accurate period profitability.
{{< /callout >}}

### Prepayments

For services paid in advance:

**Example**: Annual insurance paid in January

**January (payment)**:
```
Debit: Prepaid Insurance         $12,000
Credit: Bank                                $12,000
```

**Each month (amortization)**:
```
Debit: Insurance Expense          $1,000
Credit: Prepaid Insurance                  $1,000
```

### Tracking Required

**Maintain schedule of**:
- Recurring monthly invoices expected
- Services received but not invoiced
- Prepayments requiring amortization
- Accruals to reverse next period

---

## Best Practices

### For Service Recipients

1. **Engage vendors properly**: Get proper quotes, written agreements
2. **Confirm service completion**: Before invoice arrives, confirm satisfactory delivery
3. **Report promptly**: Alert AP when service is complete so invoice is expected
4. **Review invoices**: When routed for approval, actually review
5. **Track budgets**: Know your budget status before approving expenses

### For Accounts Payable Staff

1. **Process promptly**: Don't let invoices accumulate
2. **Verify documents**: Check every invoice meets requirements
3. **Code carefully**: Accurate coding is critical for reporting
4. **Follow up**: Chase missing confirmations or approvals
5. **Communicate**: Keep suppliers informed of payment status

### For Approvers

1. **Actually approve**: Don't auto-approve; review each invoice
2. **Verify receipt**: Confirm service was actually received
3. **Check reasonableness**: Is amount reasonable for service?
4. **Watch for patterns**: Recurring overruns or unusual expenses
5. **Respond promptly**: Don't delay approvals; suppliers depend on payment

### For Management

1. **Set clear policies**: When to use direct invoice, approval limits, documentation requirements
2. **Monitor compliance**: Review that policies are followed
3. **Analyze spend**: Regular review of service spend by category
4. **Optimize contracts**: Negotiate better terms for recurring services
5. **Prevent fraud**: Strong controls and regular audits

---

## Reporting and Analysis

### Key Reports

#### AP Aging Report
Shows outstanding invoices by age:
- Current (not yet due)
- 1-30 days overdue
- 31-60 days overdue
- >60 days overdue

**Use**: Ensure timely payment, maintain supplier relations

#### Expense Analysis Report
Shows expenses by:
- G/L account
- Cost center
- Supplier
- Time period

**Use**: Budget variance analysis, cost control

#### Vendor Spend Report
Total spend by supplier:
- Year-to-date
- Comparison to prior year
- Trend analysis

**Use**: Supplier relationship management, negotiation leverage

#### Invoice Approval Status
Shows invoices in workflow:
- Pending approval
- Approver name
- Days pending
- Value

**Use**: Chase delayed approvals, identify bottlenecks

### Key Metrics

| Metric | Target | Purpose |
|--------|--------|---------|
| **Invoice Processing Time** | < 2 days | Efficiency measure |
| **Approval Cycle Time** | < 3 days | Workflow effectiveness |
| **On-Time Payment Rate** | > 95% | Supplier relations |
| **Duplicate Payment Rate** | 0% | Control effectiveness |
| **Invoice Exception Rate** | < 5% | Data quality |

---

## Advantages and Limitations

### Advantages of Direct Invoice

**Speed**: Fastest processing, no PO or GRN steps
**Simplicity**: Least administrative burden
**Appropriateness**: Matches nature of service purchases
**Efficiency**: Reduced paperwork and data entry

### Limitations

**Less Control**: No upfront approval of expense
**Budget Risk**: Expense incurred before approval
**Fraud Risk**: Easier to submit fake invoices
**Tracking**: Harder to track commitments

**Mitigation**: Strong approval process, segregation of duties, regular review

---

## Related Documentation

### Similar Workflows
- [Standard Procurement Workflow](/guides/purchasing-guides/standard-procurement-workflow) - Full PO and GRN process
- [Direct GRN Workflow](/guides/purchasing-guides/direct-grn-workflow) - Skip PO but record goods receipt

### Daily Operations
- [Purchase Invoice Processing](/user-guide/daily-tasks/purchase-invoice-processing) - Detailed invoice procedures

### Module Documentation
- [Purchasing Module](/modules/purchasing/) - Complete purchasing capabilities
- [Financial Accounting Module](/modules/financial-accounting/) - AP and expense management
- [Supplier Maintenance](/applets/supplier-maintenance-applet/) - Supplier setup

{{< callout type="success" >}}
**Workflow Mastery**: Direct Invoice workflow provides efficient processing for service purchases while maintaining necessary controls through approval workflows and proper documentation.
{{< /callout >}}
