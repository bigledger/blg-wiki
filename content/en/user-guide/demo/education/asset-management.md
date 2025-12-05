---
title: "Asset Management"
description: "Evaluate asset tracking, depreciation, and lifecycle management"
weight: 7
---

## What You'll Learn

In this module, you'll explore how UTM tracks its physical assets - from computers and furniture to vehicles and buildings. You'll see how BigLedger manages the complete asset lifecycle from purchase to disposal.

{{< callout type="info" >}}
**Time Required:** 20 minutes | **Skill Level:** Beginner-friendly | **UTM Requirements:** 9.57-9.65
{{< /callout >}}

---

## Before You Begin: Key Terms Explained

| Term | What It Means |
|------|---------------|
| **Asset** | Something of value owned by UTM (equipment, vehicles, buildings) |
| **Depreciation** | The decrease in value of an asset over time |
| **Net Book Value (NBV)** | Original cost minus accumulated depreciation |
| **Asset Register** | The complete list of all assets |
| **QR Code** | Scannable code attached to each asset for easy identification |
| **Custodian** | The person or department responsible for an asset |
| **Disposal** | Removing an asset from the register (sold, scrapped, donated) |

---

## Why This Module Matters

Asset Management is essential for:

- **Tracking valuable equipment** - Know where everything is
- **Financial accuracy** - Proper depreciation for financial statements
- **Audit compliance** - Complete history of all assets
- **Budget planning** - Know when assets need replacement

{{< callout type="info" >}}
**For UTM:** This addresses requirements 9.57-9.65 covering asset receipt, registration, transfer, loan, maintenance, disposal, inspection, and loss reporting.
{{< /callout >}}

---

## Test Scenario 1: View the Asset Register

**Objective:** See all registered assets

**Time:** 3 minutes

### Step-by-Step Instructions

1. **Navigate to:** Assets → Asset Register

2. **View** the list of assets

3. **Use filters** to find specific assets:
   | Filter | Example |
   |--------|---------|
   | Category | Office Equipment |
   | Location | Block A |
   | Custodian | Finance Department |
   | Status | Active |

4. **Click** on any asset to see details

### What You'll See

| Information | Description |
|-------------|-------------|
| Asset Code | Unique identifier |
| Description | What the asset is |
| Location | Where it's located |
| Custodian | Who's responsible |
| Purchase Date | When acquired |
| Cost | Original purchase price |
| Net Book Value | Current value after depreciation |

{{< callout type="info" >}}
**BigLedger Advantage:** Every asset has a QR code that can be scanned with a mobile phone for instant lookup.
{{< /callout >}}

---

## Test Scenario 2: Register a New Asset

**Objective:** Add a new asset to the system

**Time:** 5 minutes

### Step-by-Step Instructions

1. **Navigate to:** Assets → Asset Registration → New Asset

2. **Fill in asset details:**
   | Field | Example |
   |-------|---------|
   | Description | Dell Computer Workstation |
   | Category | Office Equipment |
   | Location | Block A, Room 101 |
   | Custodian | Finance Department |
   | Purchase Date | Today |
   | Cost | RM 5,000 |

3. **Set depreciation:**
   | Field | Example |
   |-------|---------|
   | Method | Straight-Line |
   | Useful Life | 5 years |
   | Residual Value | RM 500 |

4. **Save** the registration

### What Happens

- Unique asset code is generated
- QR code is created for the asset
- Depreciation schedule is calculated
- GL entries are posted (Debit: Asset, Credit: Bank/AP)

---

## Test Scenario 3: Transfer an Asset

**Objective:** Move an asset to a different location or department

**Time:** 3 minutes

### When You'd Do This

- Staff moves to a different office
- Department reorganization
- Equipment relocated to another building

### Step-by-Step Instructions

1. **Navigate to:** Assets → Asset Transfer → New Transfer

2. **Fill in transfer details:**
   | Field | Example |
   |-------|---------|
   | Asset | Select the asset |
   | From Location | Block A, Room 101 |
   | To Location | Block B, Room 205 |
   | From Custodian | Finance Department |
   | To Custodian | HR Department |
   | Reason | Staff relocation |

3. **Submit** the transfer

4. **Wait for approval** (if required)

### What Happens

- Transfer request is routed for approval
- Both parties are notified
- Once approved, asset record is updated
- Complete history is maintained

{{< callout type="info" >}}
**UTM Requirement (9.60):** The system must support asset transfer with notifications and workflow.
{{< /callout >}}

---

## Test Scenario 4: Asset Loan

**Objective:** Temporarily assign an asset to someone

**Time:** 3 minutes

### When You'd Do This

- Laptop loaned to staff for event
- Projector borrowed for meeting
- Equipment for off-site work

### Step-by-Step Instructions

1. **Navigate to:** Assets → Asset Loan → New Loan

2. **Fill in loan details:**
   | Field | Example |
   |-------|---------|
   | Asset | Projector P-001 |
   | Borrower | Ahmad bin Ali |
   | Loan Date | Today |
   | Expected Return | 3 days from now |
   | Purpose | Conference presentation |

3. **Process** the loan

### What to Notice

- Asset status changes to "On Loan"
- Reminder is scheduled for return date
- Overdue items are flagged
- Complete loan history is kept

---

## Test Scenario 5: Run Depreciation

**Objective:** Calculate monthly depreciation

**Time:** 3 minutes

### Step-by-Step Instructions

1. **Navigate to:** Assets → Depreciation → Run Depreciation

2. **Select options:**
   | Field | Example |
   |-------|---------|
   | Period | Current month |
   | Category | All (or specific) |

3. **Preview** the depreciation amounts

4. **Post** the depreciation

### What Happens

| Action | Result |
|--------|--------|
| Calculation | System calculates based on each asset's method |
| Journal Entry | Debit: Depreciation Expense, Credit: Accumulated Depreciation |
| Asset Update | Net Book Value is reduced |
| Reports | Depreciation schedule is updated |

{{< callout type="info" >}}
**BigLedger Advantage:** Supports multiple depreciation methods - Straight-Line, Declining Balance, Units of Production.
{{< /callout >}}

---

## Test Scenario 6: Dispose of an Asset

**Objective:** Remove an asset from service

**Time:** 3 minutes

### When You'd Do This

- Asset is sold
- Asset is scrapped (no longer usable)
- Asset is donated
- Asset is written off

### Step-by-Step Instructions

1. **Navigate to:** Assets → Asset Disposal → New Disposal

2. **Fill in disposal details:**
   | Field | Example |
   |-------|---------|
   | Asset | Select the asset |
   | Disposal Type | Sale / Write-Off / Donation |
   | Disposal Date | Today |
   | Proceeds | RM 500 (if sold) |
   | Reason | End of useful life |

3. **Submit** for approval

### What Happens

- Gain/Loss is calculated automatically
- GL entries are posted
- Asset is marked as disposed
- History is retained for audit

---

## Test Scenario 7: Physical Inspection

**Objective:** Verify assets exist and are in their recorded locations

**Time:** 3 minutes

### Step-by-Step Instructions

1. **Navigate to:** Assets → Asset Inspection → New Inspection

2. **Select** a location to inspect

3. **Generate** the inspection checklist

4. **For each asset:**
   - Scan QR code (or search manually)
   - Mark as Found / Not Found
   - Note any discrepancies

5. **Submit** the inspection results

### What to Notice

- System shows expected assets for that location
- QR scanning speeds up verification
- Missing assets are flagged for investigation
- Reports show inspection coverage

{{< callout type="info" >}}
**UTM Requirement (9.64):** The system must support physical verification with location lists and variance reporting.
{{< /callout >}}

---

## Your Progress Checklist

Mark off what you've completed:

| Scenario | Status |
|----------|--------|
| 1. Viewed asset register | ⬜ |
| 2. Registered a new asset | ⬜ |
| 3. Created an asset transfer | ⬜ |
| 4. Processed an asset loan | ⬜ |
| 5. Ran depreciation | ⬜ |
| 6. Disposed of an asset | ⬜ |
| 7. Performed physical inspection | ⬜ |

---

## Key Takeaways

After completing this module, you've seen that BigLedger:

| UTM Requirement | How BigLedger Meets It |
|-----------------|----------------------|
| **9.57** Asset Receipt | Record incoming assets from purchases |
| **9.58** Asset Registration | Complete registration with QR codes |
| **9.59** Asset Update | Maintain and update asset information |
| **9.60** Asset Transfer | Move assets with workflow |
| **9.61** Asset Loan | Temporary assignments with tracking |
| **9.62** Asset Maintenance | Service and repair history |
| **9.63** Asset Disposal | End-of-life processing |
| **9.64** Asset Inspection | Physical verification |
| **9.65** Asset Loss | Lost asset reporting |

---

## Quick Reference: Navigation

| What You Want to Do | Where to Find It |
|---------------------|------------------|
| View all assets | Assets → Asset Register |
| Register new asset | Assets → Asset Registration |
| Transfer asset | Assets → Asset Transfer |
| Loan asset | Assets → Asset Loan |
| Run depreciation | Assets → Depreciation |
| Dispose asset | Assets → Asset Disposal |
| Physical count | Assets → Asset Inspection |

---

## What's Next?

You've completed the Asset Management evaluation. Choose your next module:

{{< cards >}}
  {{< card link="../financial-reporting" title="Financial Reporting" subtitle="Generate financial statements" >}}
  {{< card link="../user-access-control" title="Security & Access" subtitle="See security features" >}}
  {{< card link="../" title="Back to Overview" subtitle="Choose a different module" >}}
{{< /cards >}}

---

## Questions?

If anything wasn't clear or you'd like a live demonstration:

- **Demo Coordinator:** fatimah@bigledger.com
- **Technical Support:** support@bigledger.com

