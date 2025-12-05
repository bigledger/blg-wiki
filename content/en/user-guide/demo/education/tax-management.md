---
title: "Tax Configuration"
description: "Evaluate tax rate management and government directive compliance"
weight: 10
---

## What You'll Learn

In this module, you'll explore how BigLedger handles taxes - from configuring SST rates to generating tax reports. You'll see how the system ensures compliance with government directives and LHDN requirements.

{{< callout type="info" >}}
**Time Required:** 15 minutes | **Skill Level:** Beginner-friendly | **UTM Requirements:** 9.17
{{< /callout >}}

---

## Before You Begin: Key Terms Explained

| Term | What It Means |
|------|---------------|
| **SST** | Sales and Service Tax - Malaysia's consumption tax |
| **Service Tax** | 6% tax on certain services |
| **Withholding Tax** | Tax deducted at source for certain payments |
| **Tax Code** | A shortcut code for a tax rate (e.g., "SST-6" for 6% service tax) |
| **E-Invoice** | Electronic invoice submitted to LHDN |
| **LHDN** | Lembaga Hasil Dalam Negeri - Malaysian tax authority |

---

## Why This Module Matters

Tax management is essential because:

- **Legal compliance** - Must charge and report correct taxes
- **E-Invoice requirement** - Tax codes must align with LHDN requirements
- **Audit readiness** - Tax records must be accurate and complete
- **Government reporting** - Regular submissions to tax authorities

{{< callout type="info" >}}
**For UTM:** This addresses requirement 9.17 for tax rate configuration based on government directives.
{{< /callout >}}

---

## Test Scenario 1: View Tax Rates

**Objective:** See configured tax rates

**Time:** 2 minutes

### Step-by-Step Instructions

1. **Navigate to:** Settings → Tax Configuration → Tax Rates

2. **View** the list of tax rates

3. **Notice** the key information:
   | Column | Description |
   |--------|-------------|
   | Tax Code | Short identifier (SST-6) |
   | Description | What the tax is for |
   | Rate | Percentage (6%) |
   | Effective Date | When this rate applies |
   | Tax Type | Service, Sales, Withholding |

### Common Tax Codes You'll See

| Code | Rate | Use |
|------|------|-----|
| SST-6 | 6% | Service tax |
| SST-0 | 0% | Zero-rated |
| EXEMPT | 0% | Tax exempt |
| WHT-10 | 10% | Withholding tax |

{{< callout type="info" >}}
**BigLedger Advantage:** Tax rates can have effective dates, so you can set up future rate changes in advance.
{{< /callout >}}

---

## Test Scenario 2: Create a New Tax Rate

**Objective:** Add a new tax rate (for finance staff, no IT needed)

**Time:** 3 minutes

### Step-by-Step Instructions

1. **Navigate to:** Settings → Tax Configuration → Tax Rates

2. **Click** "New Tax Rate"

3. **Fill in the details:**
   | Field | Example |
   |-------|---------|
   | Tax Code | SST-8 |
   | Description | Service Tax 8% |
   | Rate | 8% |
   | Tax Type | Service Tax |
   | Effective Date | Future date |
   | GL Account | Select tax payable account |

4. **Save** the tax rate

### What to Notice

- No technical skills required
- Clear form with help text
- Validation prevents duplicate codes
- Audit trail records who created it

{{< callout type="info" >}}
**UTM Requirement (9.17a,b):** The system must allow authorized financial staff to configure tax rates based on government directives, without technical support.
{{< /callout >}}

---

## Test Scenario 3: Tax in Sales Invoice

**Objective:** See how tax is automatically calculated

**Time:** 3 minutes

### Step-by-Step Instructions

1. **Navigate to:** Sales → Sales Invoice → New Invoice

2. **Add a line item** with a taxable service

3. **Select** the tax code (e.g., SST-6)

4. **Observe** the automatic calculation

### What You'll See

| Element | Amount |
|---------|--------|
| Net Amount | RM 1,000.00 |
| Tax (6%) | RM 60.00 |
| **Total** | **RM 1,060.00** |

### What Happens Behind the Scenes

- Tax amount calculated automatically
- Correct GL accounts used (Revenue vs Tax Payable)
- E-invoice generated with proper tax codes
- Tax reports updated

---

## Test Scenario 4: Tax in Purchase Invoice

**Objective:** See how input tax is handled

**Time:** 3 minutes

### Step-by-Step Instructions

1. **Navigate to:** Purchasing → Purchase Invoice → New Invoice

2. **Add a line item** with tax

3. **Observe** the tax treatment

### What You'll See

| Element | Amount |
|---------|--------|
| Net Amount | RM 5,000.00 |
| Input Tax (6%) | RM 300.00 |
| **Total** | **RM 5,300.00** |

### Input vs Output Tax

| Tax Type | Meaning |
|----------|---------|
| **Output Tax** | Tax you collect from customers (on sales) |
| **Input Tax** | Tax you pay to suppliers (on purchases) |

{{< callout type="info" >}}
**BigLedger Advantage:** The system tracks input and output tax separately for accurate reporting and potential claims.
{{< /callout >}}

---

## Test Scenario 5: Tax Exemptions

**Objective:** See how exemptions work

**Time:** 2 minutes

### Step-by-Step Instructions

1. **Navigate to:** Settings → Tax Configuration → Tax Exemptions

2. **View** the exemption categories:
   | Category | Treatment |
   |----------|-----------|
   | Zero-Rated | 0% tax, still reported |
   | Exempt | No tax, excluded from returns |
   | Out of Scope | Not subject to tax law |

3. **See** how exemptions are applied to customers or items

### When You'd Use This

- Educational services (often exempt)
- Government supplies
- Exported services (zero-rated)

---

## Test Scenario 6: Withholding Tax

**Objective:** See withholding tax configuration

**Time:** 3 minutes

### Step-by-Step Instructions

1. **Navigate to:** Settings → Tax Configuration → Withholding Tax

2. **View** the withholding tax rules

### What You'll See

| Payment Type | Rate | Notes |
|--------------|------|-------|
| Professional Fees | 10% | Deducted at payment |
| Contract Work | 10% | Foreign contractors may be higher |
| Interest | 15% | Bank interest payments |

### How It Works

When you pay a supplier subject to withholding tax:
1. System calculates the withholding amount
2. Net payment to supplier is reduced
3. Withheld amount posted to tax payable
4. Reports generated for LHDN submission

---

## Test Scenario 7: Tax Reports

**Objective:** Generate tax reporting

**Time:** 3 minutes

### Step-by-Step Instructions

1. **Navigate to:** Finance → Tax Reports

2. **Generate** available reports:
   | Report | Purpose |
   |--------|---------|
   | SST Summary | Total output and input tax |
   | Tax by Code | Breakdown by tax code |
   | Tax Ledger | Transaction details |
   | E-Invoice Summary | E-invoice tax totals |

3. **Export** for filing

### What to Notice

- Reports match LHDN required formats
- Can be exported for government submission
- Drill-down to individual transactions

---

## Your Progress Checklist

Mark off what you've completed:

| Scenario | Status |
|----------|--------|
| 1. Viewed tax rates | ⬜ |
| 2. Created a new tax rate | ⬜ |
| 3. Saw tax in sales invoice | ⬜ |
| 4. Saw tax in purchase invoice | ⬜ |
| 5. Explored tax exemptions | ⬜ |
| 6. Reviewed withholding tax | ⬜ |
| 7. Generated tax reports | ⬜ |

---

## Key Takeaways

After completing this module, you've seen that BigLedger:

| Feature | What It Does |
|---------|-------------|
| **Tax Configuration** | Multiple tax types and rates |
| **Effective Dates** | Schedule future rate changes |
| **Auto-Calculation** | Tax computed automatically in transactions |
| **E-Invoice Integration** | Proper tax codes for LHDN |
| **Exemption Handling** | Zero-rated, exempt, out of scope |
| **Withholding Tax** | Automatic deduction and reporting |
| **Tax Reports** | Compliance-ready outputs |

---

## Quick Reference: Navigation

| What You Want to Do | Where to Find It |
|---------------------|------------------|
| Tax rates | Settings → Tax Configuration → Tax Rates |
| Tax types | Settings → Tax Configuration → Tax Types |
| Exemptions | Settings → Tax Configuration → Exemptions |
| Withholding tax | Settings → Tax Configuration → Withholding Tax |
| Tax reports | Finance → Tax Reports |

---

## Congratulations!

You've completed all modules in the UTM Integrated Financial System evaluation!

{{< cards >}}
  {{< card link="../" title="Back to Overview" subtitle="Review all modules or restart" >}}
{{< /cards >}}

---

## Summary of What You've Evaluated

| Module | UTM Requirements |
|--------|------------------|
| General Ledger & COA | 9.18, 9.19 |
| Budget & Vote Book | 9.23-9.55 |
| Accounts Payable | 9.16b |
| Accounts Receivable | 9.16a |
| Journal Module | 9.21, 9.22 |
| Cash Management | 9.56 |
| Asset Management | 9.57-9.65 |
| Financial Reporting | 9.20 |
| Security & Access | 9.15 |
| Tax Management | 9.17 |

---

## Next Steps

For questions or to schedule a deeper demonstration:

- **Demo Coordinator:** fatimah@bigledger.com
- **Technical Support:** support@bigledger.com
- **Sales Inquiries:** sales@bigledger.com

**Reference:** UTM Tender B.30/2024

