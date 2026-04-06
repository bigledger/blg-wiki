---
title: "Forex Applet"
description: "Comprehensive foreign exchange and multi-currency management system for exchange rates, currency conversions, and forex gain/loss tracking"
tags:
- forex-management
- currency-exchange
- multi-currency
- exchange-rates
- financial-control
weight: 65
---

## Purpose and Overview

The **Forex Applet** is a powerful tool designed to streamline foreign exchange and multi-currency management across your entire organization. It moves beyond simple currency conversion by integrating automated exchange rate updates, real-time forex gain/loss calculations, and comprehensive multi-currency reporting capabilities.

### Strategic Overview of the Forex Applet

Within the BigLedger ecosystem, maintaining financial consistency requires a centralized approach to currency management. The Forex Applet serves as the definitive single source of truth for exchange rates, ensuring that every financial interaction—from procurement to sales—is grounded in accurate, synchronized data. By centralizing this function, the system prevents the accounting discrepancies that arise when disparate departments utilize conflicting rate sources, thereby safeguarding the integrity of the master ledger.

The applet is architected around two primary functional pillars:

* **Forex Live**: A market observation module providing "Reference" data. It allows users to monitor real-time global sentiments without altering internal financial records.
* **Forex Data Source**: A configuration module for "Transactional" data. Here, users establish the specific currency pairs and rates that are operationalized across business modules.

This dual-structure ensures that while the organization remains informed by global market movements, the rates used for actual accounting remain controlled, validated, and auditable.

{{< callout type="info" >}}
**Core Concept**: The system manages **where** exchange rates come from (Rate Sources), **how** currencies are converted (Conversion Rules), and **when** forex gains/losses are recognized (Revaluation).
{{< /callout >}}

## Key Features Overview

### Who Benefits from This Applet?

**Finance Teams:**
- Real-time exchange rate management
- Automated forex gain/loss calculations
- Simplified multi-currency reconciliation
- Reduced manual rate entry errors

**Accountants & Controllers:**
- Accurate multi-currency transaction recording
- Automated forex revaluation processes
- Complete audit trail for exchange rates
- Streamlined period-end closing

**Treasury Staff:**
- Centralized exchange rate management
- Multiple rate source integration
- Currency exposure monitoring
- Forex risk assessment tools

**CFOs & Financial Managers:**
- Better control over currency risk
- Improved financial reporting accuracy
- Data-driven currency decisions
- Consolidated multi-currency insights

### What Problems Does This Solve?

**The Manual Forex Management Problem:**

Traditional multi-currency management relies on manual rate lookups and spreadsheet tracking. Common issues include:
- Outdated exchange rates leading to inaccurate valuations
- Manual data entry errors in currency conversions
- Inconsistent rate application across departments
- Time-consuming forex gain/loss calculations
- Difficulty tracking currency exposure

**The Forex Applet Solution:**

- **Automated rate updates** - Connect to live exchange rate feeds for real-time accuracy
- **Centralized rate management** - Single source of truth for all exchange rates
- **Automatic conversions** - System calculates conversions using configured rules
- **Forex gain/loss tracking** - Automated recognition and posting of unrealized/realized gains and losses
- **Multi-currency reporting** - Analyze financial data in any supported currency
- **Integration ready** - Seamlessly works with Ledger, Cashbook, and Chart of Accounts applets

## Key Features Overview

{{< cards >}}
  {{< card title="Exchange Rate Management" subtitle="Maintain and update currency exchange rates" link="#exchange-rate-management" >}}

  {{< card title="Multi-Currency Transactions" subtitle="Record transactions in any currency" link="#multi-currency-transactions" >}}

  {{< card title="Forex Gain/Loss Calculation" subtitle="Automated unrealized and realized gain/loss" link="#forex-gainloss-tracking" >}}

  {{< card title="Currency Conversion" subtitle="Automatic currency conversion with configurable rules" link="#currency-conversion" >}}

  {{< card title="Automated Rate Updates" subtitle="Connect to live exchange rate feeds" link="#automated-rate-updates" >}}

  {{< card title="Multi-Currency Reporting" subtitle="Financial reports in multiple currencies" link="#reporting--analytics" >}}

  {{< card title="Revaluation Processing" subtitle="Period-end forex revaluation" link="#configuration--settings" >}}

  {{< card title="Currency Configuration" subtitle="Supported currency setup and management" link="#currency-configuration" >}}
{{< /cards >}}

## Key Concepts

### Understanding the Forex Framework

Every multi-currency system must address three fundamental aspects. The Forex Applet provides structured handling:

| Aspect | Component | Practical Example |
|--------|-----------|-------------------|
| **What** currencies are supported? | Currency Configuration | USD, EUR, GBP, MYR, SGD |
| **How** are rates determined? | Exchange Rate Management | Daily rates from central bank feed |
| **When** are gains/losses recognized? | Forex Revaluation | Month-end unrealized gain/loss posting |

{{< callout type="tip" >}}
**Real-World Example**: A Malaysian company (base currency MYR) receives USD 10,000 from a US customer. The system records the transaction at today's rate (1 USD = 4.50 MYR = 45,000 MYR). At month-end, if the rate changes to 1 USD = 4.60 MYR, the system automatically calculates and posts a 1,000 MYR unrealized forex gain.
{{< /callout >}}

### The Forex Management Triangle

To effectively manage the system, it is crucial to understand how **Exchange Rates**, **Currency Conversion**, and **Forex Gain/Loss** work together.

| Component | Analogy | Definition | Example |
|-----------|---------|------------|---------|
| **Exchange Rate** | The "Price" | The current value of one currency relative to another. | **1 USD = 4.50 MYR** |
| **Currency Conversion** | The "Calculator" | The rule for converting amounts from one currency to another. | **USD 100 × 4.50 = MYR 450** |
| **Forex Gain/Loss** | The "Difference" | The profit or loss arising from exchange rate changes. | **Rate changed to 4.60: gain of MYR 10** |

**How they link:**
1. You configure **supported currencies** (e.g., USD, EUR, GBP)
2. You maintain **exchange rates** for each currency pair (e.g., USD/MYR = 4.50)
3. When recording **transactions**, the system automatically converts using current rates
4. At period-end, the system calculates **forex gain/loss** based on rate changes

---

## Quick Start Guide

Get up and running quickly with these essential workflows.

### For Finance Teams: Set Up Exchange Rates

**Goal:** Configure and maintain exchange rates in 4 simple steps.

1. **Navigate**: Go to **Forex** → **Exchange Rates** from the sidebar
2. **Select Currency Pair**: Choose base currency (e.g., MYR) and target currency (e.g., USD)
3. **Enter Rate**: 
   - Input exchange rate (e.g., 1 USD = 4.50 MYR)
   - Set effective date (today or future date)
   - Choose rate type (Buying/Selling/Average)
4. **Save**: Click **Save** → Rate is now active for all transactions

**What happens next?** All new multi-currency transactions will automatically use this rate. You'll be notified if rates need updating.

**Pro Tip:** Enable "Auto-Update from Feed" to automatically refresh rates daily from your configured rate source.

---

### For Accountants: Record Multi-Currency Transactions

**Goal:** Record a foreign currency transaction in 3 steps.

1. **Create Transaction**: 
   - Navigate to the transaction module (e.g., Sales Invoice, Purchase Invoice)
   - Select customer/supplier with foreign currency
2. **Enter Amount in Foreign Currency**:
   - Input amount in the foreign currency (e.g., USD 1,000)
   - System automatically converts to base currency using current rate
   - View both amounts: Foreign (USD 1,000) and Base (MYR 4,500)
3. **Post Transaction**:
   - Review the conversion
   - Click **Post** → Transaction recorded in both currencies

**Automatic Handling:** The system creates journal entries in base currency while maintaining the original foreign currency reference for reconciliation and reporting.

---

### For Admins: Initial System Setup

**Goal:** Get the forex system ready for multi-currency operations in 5 steps.

**Step 1: Configure Base Currency** (`Settings > Base Currency`)
- Set your organization's primary currency (e.g., MYR)
- This is the currency for all financial reports

**Step 2: Add Supported Currencies** (`Settings > Currency Configuration`)
- Add all currencies you transact in (USD, EUR, GBP, SGD, etc.)
- Set currency codes, symbols, and decimal precision

**Step 3: Set Up Exchange Rate Sources** (`Settings > Rate Sources`)
- Configure automatic rate feeds (e.g., Central Bank API)
- Or set up manual rate entry workflow
- Set update frequency (daily, weekly, real-time)

**Step 4: Enter Initial Exchange Rates** (`Forex > Exchange Rates`)
- Input current rates for all currency pairs
- Set rate types (buying, selling, average)
- Verify rates are active

**Step 5: Configure Forex Accounts** (`Settings > Forex Accounts`)
- Specify GL accounts for realized forex gain/loss
- Specify GL accounts for unrealized forex gain/loss
- Set revaluation rules (monthly, quarterly, yearly)

**Step 6: Test**
- Create a test multi-currency invoice
- Verify currency conversion is correct
- Test forex gain/loss calculation

**Ongoing:** Schedule monthly forex revaluation for accurate financial reporting.

---

{{< callout type="tip" >}}
**New to the system?** Start with the basics:
1. Finance teams should set up initial exchange rates
2. Accountants should practice recording multi-currency transactions in a test environment
3. Admins should review **Configuration & Settings** below for detailed setup guides
{{< /callout >}}

---

## Exchange Rate Management

**Maintain accurate and up-to-date exchange rates for all currency pairs.**

### What is Exchange Rate Management?

Exchange Rate Management is the central hub for maintaining all currency exchange rates used throughout the system. Think of it as your organization's "currency price list" that determines how foreign currency amounts are converted to your base currency.

**For Finance Teams:**
- Maintain daily exchange rates for all active currencies
- Track historical rate changes for audit purposes
- Configure different rates for buying, selling, and average

**For Accountants:**
- Use system-maintained rates for accurate transaction recording
- Reference historical rates for period-specific transactions
- Ensure compliance with accounting standards (IFRS, GAAP)

**For Treasury Staff:**
- Monitor exchange rate trends and volatility
- Set up alerts for significant rate changes
- Manage currency risk exposure

---

### Market Monitoring and Reference via "Forex Live"

The "Forex Live" menu serves as a non-volatile reference tool, providing a strategic window into real-time market sentiment and historical fluctuations. Because this module is decoupled from the transaction engine, it allows for high-level analysis and trend observation without the risk of affecting live financial documents.

To utilize the Forex Live diagram for market analysis:

1. **Select the Base Currency**: Define the primary currency for comparison (e.g., MYR).
2. **Select the Target Currency**: Choose the currency to evaluate (e.g., USD or CNY).
3. **Define Observation Timeframes**: Set the desired period for analysis, such as one week or one month.
4. **Execute Search**: Click "Search" to generate the rate diagram. Users can hover over specific data points on the diagram to view tooltips revealing the exact rate for any given date.

It is important to note that the Forex Live module is a search-only interface with no "save" functionality. This limitation is a deliberate architectural safeguard, ensuring that external market fluctuations do not accidentally corrupt the organization’s internal master exchange rate settings.

---

### Managing Rate Accuracy and Historical Data

The "History Data" tab is the engine of the Forex Applet. This is where the Middle Rate—the primary value pulled by the transaction engine—is managed. Because these rates directly impact the company’s bottom line, the system provides two distinct methodologies for data population:

| Method | Source | Use Case |
|--------|--------|----------|
| **Automated Search** | Global Market Data | Rapidly updating standard rates based on current market movements. |
| **Manual Override** | Banking Partners | Inputting specific rates obtained via negotiated bank contracts or specialized agreements. |

The system operates on the **"Latest Entry Rule"**: the system logic prioritizes the entry with the most recent chronological date in the history list. For example, if a rate is entered today for a date occurring next week, the system will automatically utilize that rate once the specified date is reached.

Furthermore, the Chart functionality within the History tab provides an internal data visualization. Unlike the "Forex Live" chart which shows external market trends, this chart visualizes the movement of the organization's saved history data. By defining a "From" and "To" transaction date range, users can audit how their specific internal exchange rates have evolved over time.

---

### How to Manage Exchange Rates

**Manual Rate Entry:**
1. Go to **Forex** → **Exchange Rates**
2. Click **"+ Add Rate"**
3. Select **Currency Pair** (e.g., USD/MYR)
4. Enter **Rate** (e.g., 4.50)
5. Set **Effective Date** (when this rate becomes active)
6. Choose **Rate Type**:
   - **Buying Rate**: Rate when buying foreign currency
   - **Selling Rate**: Rate when selling foreign currency
   - **Average Rate**: Midpoint rate for accounting
7. Click **Save**

**Automatic Rate Updates:**
1. Configure **Rate Source** (e.g., Central Bank feed)
2. Set **Update Schedule** (e.g., daily at 9:00 AM)
3. Enable **Auto-Update**
4. System fetches and updates rates automatically

**Rate History:**
```
USD/MYR Exchange Rate History
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Date          | Rate   | Type    | Source
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
2024-12-15   | 4.60   | Average | Auto
2024-12-14   | 4.58   | Average | Auto
2024-12-13   | 4.55   | Average | Manual
2024-12-12   | 4.52   | Average | Auto
```

---

### Key Features

**Multiple Rate Types:**
- Support for buying, selling, and average rates
- Configure which rate type to use for different transaction types
- Historical tracking of all rate changes

**Rate Sources:**
- Manual entry by authorized users
- Automatic feeds from central banks or financial data providers
- API integration with currency exchange services
- Import from CSV/Excel files

**Validation Rules:**
- Maximum rate variance checks (e.g., alert if rate changes > 5% in one day)
- Mandatory approval for manual rate overrides
- Effective date controls prevent backdating beyond allowed period

**Audit Trail:**
- Complete history of all rate changes
- User tracking for manual entries
- Source tracking for automatic updates
- Timestamp for all rate modifications

---

### Common Scenarios

**Scenario 1: Daily Rate Update**

```
Finance team's morning routine:
09:00 AM - System auto-fetches rates from central bank
09:05 AM - Rates updated for USD, EUR, GBP, SGD
09:10 AM - Email notification sent to finance team
All day - New transactions use updated rates automatically
```

**Scenario 2: Historical Rate Lookup**

```
Accountant needs to verify December invoice:
Task: Find the rate used on Dec 10, 2024
Action: 
  1. Navigate to Exchange Rates
  2. Filter: Currency = USD, Date = Dec 10, 2024
  3. Result: 1 USD = 4.55 MYR (Average rate, Auto-updated)
Use case: Verify invoice conversion was correct
```

**Scenario 3: Manual Rate Override**

```
Special situation: Bank offers better rate for large transaction
Normal rate: 1 USD = 4.50 MYR
Bank rate: 1 USD = 4.48 MYR (better for buying USD)

Action:
1. Create new rate entry
2. Rate Type: "Buying Rate"
3. Apply to specific transaction only
4. Document reason: "Large FX transaction with Bank ABC"
```

---

### Summary of Best Practices for FX Governance

To effectively mitigate exchange rate risk, organizations must maintain a consistent cadence for currency updates. Inaccurate or stale data can lead to significant financial exposure.

* **Frequency of Updates**: Perform daily or weekly entries to ensure the "Latest" rate in the history list accurately reflects current conditions.
* **Data Integrity**: It is recommended to keep all historical data rather than deleting it. Maintaining a deep history allows the internal Chart module to provide a clearer visual trend of rate movements.
* **Standardization**: Utilize consistent, specific codes (e.g., MYR_CNY) when establishing new pairs to prevent confusion across different organizational applets.
* **Review Rates Daily**: Even with auto-update, verify rates make sense.
* **Document Manual Overrides**: Always add notes explaining why rates were manually adjusted.

By following these protocols, the Forex Applet transforms volatile market data into stable, actionable business intelligence, providing the control and transparency required for modern fintech operations.

---

## Multi-Currency Transactions

**Record and manage transactions in multiple currencies seamlessly.**

### What are Multi-Currency Transactions?

Multi-currency transactions allow you to record business activities in the actual currency used, while the system automatically handles conversion to your base currency for accounting purposes.

**Common Multi-Currency Transactions:**
- ✓ Sales invoices to foreign customers
- ✓ Purchase orders from international suppliers
- ✓ Foreign currency bank receipts and payments
- ✓ Multi-currency expense claims
- ✓ International wire transfers
- ✓ Foreign currency loan transactions

---

### How Multi-Currency Transactions Work

**Transaction Recording Process:**

**Step 1: Initiate Transaction**
- Create invoice, payment, or journal entry
- System detects customer/supplier currency setting

**Step 2: Enter Foreign Currency Amount**
- Input amount in the foreign currency (e.g., USD 1,000)
- Select or verify exchange rate to use
- System shows both foreign and base currency amounts

**Step 3: System Conversion**
```
Foreign Currency: USD 1,000.00
Exchange Rate: 1 USD = 4.50 MYR
Base Currency: MYR 4,500.00
```

**Step 4: Posting**
- Transaction posted to general ledger in base currency
- Foreign currency amount stored for reference and reconciliation
- Both amounts appear on reports

---

### Integration Workflow: Applying Forex Data to Purchase Orders

The ultimate objective of the Forex Applet is the seamless application of rates to live transactions. By locking exchange rates within documents like Purchase Orders (PO), the system enforces corporate financial policy and ensures audit compliance.

To integrate a Forex Data Source into a Purchase Order:

1. **Navigate** to the Main Details section of the Purchase Order.
2. **Scroll** to the Forex Data Source selection field.
3. **Select the Pair**: Choose the specific pre-configured data source (e.g., CNY or USD).

Upon selection, the system triggers a **System Lock**. The currency rate is populated automatically based on the latest chronological history entry and becomes **Read-only**. The end-user cannot manually change or overwrite this rate. This field lock ensures that the transaction adheres strictly to the organization's established FX governance, moving the rate from market observation to a fixed, transactional finality.

---

### Transaction Examples

**Example 1: Foreign Sales Invoice**

```
Customer: ABC Inc (USA)
Invoice Date: Dec 15, 2024
Currency: USD

Line Items:
  Product A: USD 500.00
  Product B: USD 300.00
  Subtotal:  USD 800.00
  Tax (6%):  USD  48.00
  Total:     USD 848.00

Exchange Rate: 1 USD = 4.50 MYR

Accounting Entry:
  Dr. Accounts Receivable  MYR 3,816.00  (USD 848.00)
     Cr. Sales Revenue     MYR 3,600.00  (USD 800.00)
     Cr. Tax Payable       MYR   216.00  (USD  48.00)
```

**Example 2: Foreign Currency Payment**

```
Supplier: XYZ GmbH (Germany)
Payment Date: Dec 20, 2024
Invoice Amount: EUR 2,000.00
Rate when invoiced: 1 EUR = 5.00 MYR (Invoice MYR 10,000)
Rate when paid: 1 EUR = 4.90 MYR (Payment MYR 9,800)

Accounting Entry:
  Dr. Accounts Payable     MYR 10,000.00  (Original invoice)
     Cr. Bank Account      MYR  9,800.00  (Actual payment)
     Cr. Forex Gain        MYR    200.00  (Realized gain)
```

---

### Multi-Currency Reporting

View transaction data in different currencies:

**Base Currency View (MYR):**
```
Customer        | Invoice Amt | Paid    | Balance
────────────────|─────────────|─────────|─────────
ABC Inc (USA)   | MYR 4,500   | MYR 0   | MYR 4,500
XYZ GmbH (EUR)  | MYR 10,000  | MYR 10k | MYR 0
Total           | MYR 14,500  | MYR 10k | MYR 4,500
```

**Foreign Currency View:**
```
Customer        | Currency | Invoice | Paid    | Balance
────────────────|──────────|─────────|─────────|─────────
ABC Inc (USA)   | USD      | 1,000   | 0       | 1,000
XYZ GmbH (EUR)  | EUR      | 2,000   | 2,000   | 0
```

---

## Forex Gain/Loss Tracking

**Automatically calculate and record exchange rate gains and losses.**

### What is Forex Gain/Loss?

Forex gain/loss arises when exchange rates change between the date a foreign currency transaction is recorded and when it's settled (realized), or at period-end for outstanding balances (unrealized).

**Types of Forex Gain/Loss:**

| Type | Definition | Recognition | Example |
|------|------------|-------------|---------|
| **Realized** | Actual gain/loss when transaction settled | At payment/receipt | Invoice at 4.50, paid at 4.40 = gain of 0.10 per USD |
| **Unrealized** | Potential gain/loss on unsettled balances | At period-end revaluation | Outstanding USD invoice at month-end revalued at new rate |

{{< callout type="tip" >}}
**Accounting Standard Compliance**: The Forex Applet follows IFRS and GAAP requirements for forex gain/loss recognition, ensuring your financial statements are compliant.
{{< /callout >}}

---

### How Forex Gain/Loss is Calculated

**Realized Forex Gain/Loss:**

```
Scenario: Foreign Currency Purchase Invoice

Invoice Date: Nov 15, 2024
Supplier: UK Company
Amount: GBP 1,000
Rate on Nov 15: 1 GBP = 6.00 MYR
Recorded amount: MYR 6,000

Payment Date: Dec 15, 2024
Rate on Dec 15: 1 GBP = 5.80 MYR
Payment amount: MYR 5,800

Realized Forex Gain: MYR 6,000 - MYR 5,800 = MYR 200 GAIN

Accounting Entry (at payment):
  Dr. Accounts Payable     MYR 6,000
     Cr. Bank Account      MYR 5,800
     Cr. Forex Gain        MYR   200
```

**Unrealized Forex Gain/Loss:**

```
Scenario: Outstanding Foreign Currency Receivable

Invoice Date: Dec 5, 2024
Customer: Singapore Company
Amount: SGD 10,000
Rate on Dec 5: 1 SGD = 3.40 MYR
Recorded amount: MYR 34,000

Month-End: Dec 31, 2024
Still unpaid
Rate on Dec 31: 1 SGD = 3.50 MYR
Current value: MYR 35,000

Unrealized Forex Gain: MYR 35,000 - MYR 34,000 = MYR 1,000 GAIN

Accounting Entry (at month-end):
  Dr. Accounts Receivable      MYR 1,000
     Cr. Unrealized Forex Gain MYR 1,000

(This entry is reversed on Jan 1, 2025)
```

---

### Automatic Forex Gain/Loss Processing

**Realized Gain/Loss (Automatic):**
- Calculated automatically when payment/receipt is posted
- System compares original transaction rate vs. settlement rate
- Posted to configured Realized Forex Gain/Loss account

**Unrealized Gain/Loss (Month-End Process):**
1. **Run Forex Revaluation** (Settings > Run Month-End Revaluation)
2. System identifies all unsettled foreign currency balances:
   - Outstanding receivables (invoices not yet paid)
   - Outstanding payables (bills not yet paid)
   - Foreign currency bank accounts
3. System revalues each item using current period-end rate
4. Calculates difference from original/last revalued amount
5. Posts unrealized gain/loss journal entries
6. Reverses previous period's unrealized entries (if applicable)

**Revaluation Report Preview:**
```
Foreign Currency Balances - Dec 31, 2024
═══════════════════════════════════════════════════════════
Account          | Fgn Amt   | Orig Rate | New Rate | Gain/Loss
─────────────────|───────────|───────────|──────────|───────────
A/R - ABC Inc    | USD 5,000 | 4.50      | 4.60     | +500 MYR
A/P - XYZ GmbH   | EUR 3,000 | 5.00      | 4.95     | +150 MYR
Bank USD Account | USD 10,000| 4.50      | 4.60     | +1,000 MYR
─────────────────|───────────|───────────|──────────|───────────
Total Unrealized Forex Gain                         | +1,650 MYR
```

---

### Common Scenarios

**Scenario 1: Favorable Exchange Rate Movement**

```
Month: December 2024
Outstanding USD Receivables: USD 50,000
November rate: 1 USD = 4.50 MYR (MYR 225,000)
December rate: 1 USD = 4.70 MYR (MYR 235,000)

Unrealized Gain: MYR 10,000

Interpretation: If customers paid today, we'd receive MYR 10,000 more than originally recorded.
```

**Scenario 2: Unfavorable Exchange Rate Movement**

```
Month: December 2024
Outstanding EUR Payables: EUR 20,000
November rate: 1 EUR = 5.00 MYR (MYR 100,000)
December rate: 1 EUR = 5.20 MYR (MYR 104,000)

Unrealized Loss: MYR 4,000

Interpretation: If we paid suppliers today, we'd pay MYR 4,000 more than originally recorded.
```

---

## Currency Conversion

**Automatic currency conversion with configurable business rules.**

### Currency Conversion Methods

The Forex Applet supports multiple conversion methods:

**1. Spot Rate (Default)**
- Uses exchange rate effective on transaction date
- Most common method for day-to-day transactions
- Automatically applied to invoices, payments, receipts

**2. Average Rate**
- Uses monthly or yearly average exchange rate
- Useful for budgeting and forecasting
- Can be configured for specific transaction types

**3. Fixed Rate**
- Uses predetermined rate for specific contracts or periods
- Common for long-term contracts with fixed pricing
- Manually defined and applied

**4. Custom Rate**
- Manual override for special circumstances
- Requires approval and documentation
- Tracked separately in audit trail

---

### Conversion Configuration

**Set Default Conversion Rules:**

Navigate to `Settings > Currency Conversion Rules`

**Configure by Transaction Type:**
```
Transaction Type        | Conversion Method | Rate Type
────────────────────────|───────────────────|───────────
Sales Invoice           | Spot Rate         | Average
Purchase Invoice        | Spot Rate         | Average
Customer Receipt        | Spot Rate         | Buying
Supplier Payment        | Spot Rate         | Selling
Journal Entry           | Manual Selection  | Any
Expense Claim           | Spot Rate         | Average
```

**Rounding Rules:**
- Set decimal precision per currency (e.g., 2 decimals for USD, 0 for JPY)
- Configure rounding method (nearest, up, down)
- Handle rounding differences in designated variance account

---

## Reporting & Analytics

**Comprehensive multi-currency financial reporting and analysis.**

### Available Reports

**1. Exchange Rate Reports**
- Exchange Rate History
- Rate Variance Analysis
- Rate Source Performance
- Rate Update Audit Trail

**2. Forex Gain/Loss Reports**
- Realized Forex Gain/Loss Summary
- Unrealized Forex Gain/Loss by Currency
- Forex Gain/Loss Trend Analysis
- Month-End Revaluation Report

**3. Multi-Currency Transaction Reports**
- Transactions by Currency
- Foreign Currency Aging (Receivables/Payables)
- Currency Exposure Report
- Multi-Currency Trial Balance

**4. Currency Performance Analytics**
- Currency Movement Dashboard
- Forex Risk Exposure Summary
- Currency Profitability Analysis
- Cross-Currency Comparison

---

### Multi-Currency Financial Statements

**Balance Sheet (Multi-Currency View):**
```
                       | MYR        | USD      | EUR      | GBP
───────────────────────|────────────|──────────|──────────|──────────
ASSETS
Cash & Bank            | 100,000    | 10,000   | 5,000    | 2,000
Accounts Receivable    | 450,000    | 50,000   | 20,000   | 15,000
───────────────────────|────────────|──────────|──────────|──────────
Total Assets           | 550,000    | 60,000   | 25,000   | 17,000

LIABILITIES
Accounts Payable       | 200,000    | 20,000   | 15,000   | 5,000
───────────────────────|────────────|──────────|──────────|──────────
Total Liabilities      | 200,000    | 20,000   | 15,000   | 5,000
```

**Consolidated View (All in Base Currency MYR):**
```
Item                   | MYR Amount | Notes
───────────────────────|────────────|──────────────────────────
Cash & Bank            | 100,000    | Base currency
                       |  45,000    | USD 10,000 @ 4.50
                       |  25,000    | EUR 5,000 @ 5.00
                       |  12,000    | GBP 2,000 @ 6.00
───────────────────────|────────────|──────────────────────────
Total Cash             | 182,000    |
```

---

## Configuration & Settings

**Complete system configuration for forex management.**

### Base Currency Setup

**Navigate:** `Settings > Organization > Base Currency`

**Configuration:**
1. Select your organization's primary currency (e.g., MYR)
2. This currency is used for:
   - All financial reports
   - General ledger posting
   - Consolidated financial statements
3. **Important:** Base currency cannot be changed once transactions exist

---

### Architecting Currency Pairs in "Forex Data Source"

Establishing a "Forex Data Source" is the critical first step in institutionalizing currency rates for use across the enterprise. Structured data entry at this stage ensures that every applet—whether handling procurement or revenue—draws from a standardized set of currency pairs.

**Navigate:** `Settings > Forex > Currency Configuration`

To create a new currency pair, adhere to the following requirements:

1. Click **"+ Add Currency"**
2. Configure the identifiers:
   - **Establish Unique Currency Pair Codes**: Every pair must have a distinct identifier (e.g., "MYR_CNY" or "MYR_USD").
   - **Define the Base Currency**: Explicitly set the starting currency for the exchange (e.g., MYR).
   - **Adherence to Unique Constraints**: The system prevents the creation of duplicate pairs. If a variation of an existing pair is required for a specific business case, a new unique code must be utilized to maintain data clarity.
   - **Status**: Active/Inactive
3. Click **Save**

This module offers significant versatility; once a data source is created, it can be deployed across both "Purchase Site" and "Sales Site" applets. This ensures inter-departmental parity, as a single exchange rate definition governs the entire lifecycle of a transaction.

**Common Currencies:**
```
Code | Name                    | Symbol | Decimals
-----|-------------------------|--------|----------
USD  | United States Dollar    | $      | 2
EUR  | Euro                    | €      | 2
GBP  | British Pound Sterling  | £      | 2
SGD  | Singapore Dollar        | S$     | 2
JPY  | Japanese Yen            | ¥      | 0
CNY  | Chinese Yuan            | ¥      | 2
AUD  | Australian Dollar       | A$     | 2
```

---

### Exchange Rate Sources

**Navigate:** `Settings > Forex > Rate Sources`

**Manual Rate Entry:**
- No configuration needed
- Users enter rates directly in Exchange Rate Management
- Suitable for small organizations with few currencies

**Automatic Rate Feeds:**

**Option 1: Central Bank API**
```
Source Name: Bank Negara Malaysia
API Endpoint: https://api.bnm.gov.my/exchange-rates
Update Frequency: Daily at 11:00 AM
Currencies: USD, EUR, GBP, SGD, JPY
Status: Active
```

**Option 2: Financial Data Provider**
```
Source Name: XE Currency Data Feed
API Endpoint: https://api.xe.com/rates
Update Frequency: Real-time (every 15 minutes)
Currencies: All supported
API Key: ************************
Status: Active
```

**Option 3: CSV Import**
```
Import Schedule: Daily
File Location: FTP Server / Shared Drive
File Format: CSV (Date, Currency, Rate)
Processed By: Automated Task
Status: Active
```

---

### Forex Account Setup

**Navigate:** `Settings > Forex > Forex Accounts`

**Required GL Accounts:**

| Account Type | Purpose | Example GL Code |
|--------------|---------|-----------------|
| **Realized Forex Gain** | Profitable settled transactions | 7100 - Forex Gain |
| **Realized Forex Loss** | Loss-making settled transactions | 8100 - Forex Loss |
| **Unrealized Forex Gain** | Period-end revaluation gains | 7200 - Unrealized Forex Gain |
| **Unrealized Forex Loss** | Period-end revaluation losses | 8200 - Unrealized Forex Loss |
| **Forex Rounding** | Small rounding differences | 8300 - Forex Rounding |

{{< callout type="important" >}}
**Accounting Standards**: Realized forex gains/losses are typically recognized in the income statement immediately. Unrealized gains/losses may be recognized in income or other comprehensive income depending on your accounting framework (IFRS vs. GAAP).
{{< /callout >}}

---

### Revaluation Settings

**Navigate:** `Settings > Forex > Revaluation Settings`

**Configuration Options:**

**1. Revaluation Frequency**
- Monthly (most common)
- Quarterly
- Yearly
- On-demand only

**2. Revaluation Scope**
```
☑ Accounts Receivable (Customer invoices)
☑ Accounts Payable (Supplier invoices)
☑ Foreign Currency Bank Accounts
☐ Foreign Currency Loans
☐ Foreign Currency Investments
```

**3. Reversal Method**
- Automatic reversal on first day of next period (recommended)
- Manual reversal (for review before posting)
- No reversal (permanent adjustment)

**4. Approval Workflow**
- Auto-post (for established processes)
- Require approval (for first-time or significant amounts)
- Multi-level approval (for large organizations)

---

### Automated Rate Updates

**Navigate:** `Settings > Forex > Automated Updates`

**Schedule Configuration:**
```
Update Schedule: Daily
Update Time: 09:00 AM (Organization timezone)
Retry on Failure: Yes (3 attempts, 30 min intervals)
Rate Source: Central Bank API
Fallback Source: Financial Data Provider
Email Notifications: Yes
Recipients: finance@company.com
```

**Update Rules:**
```
☑ Update only if rate change > 0.1%
☑ Alert if rate change > 5% from previous day
☑ Require manual approval for alerts
☐ Update historical rates (not recommended)
```

---

## FAQ

**Frequently asked questions about the Forex Applet.**

### General Questions

**Q: How do I set up exchange rates for the first time?**  
A: Navigate to **Forex > Exchange Rates**, click **"+ Add Rate"**, select your currency pair (e.g., USD/MYR), enter the exchange rate, set effective date, and save. You can also configure automatic rate feeds in **Settings > Rate Sources** for daily updates.

**Q: Can I use different exchange rates for different transaction types?**  
A: Yes. Configure rate types (Buying, Selling, Average) in **Exchange Rate Management**, then set which rate type to use for each transaction type in **Settings > Currency Conversion Rules**. For example, use "Buying Rate" for customer receipts and "Selling Rate" for supplier payments.

**Q: What happens if I forget to update exchange rates?**  
A: The system will use the most recent available rate for the currency pair. You'll receive warnings when rates are outdated (configurable threshold, e.g., 7 days). For compliance, it's recommended to enable automatic rate updates or set up daily rate entry reminders.

**Q: How often should I run forex revaluation?**  
A: Best practice is monthly revaluation to align with your financial close process. This ensures unrealized forex gains/losses are properly reflected in your financial statements each month. You can also run quarterly or yearly revaluations depending on your reporting requirements.

---

### Forex Gain/Loss Questions

**Q: What's the difference between realized and unrealized forex gain/loss?**  
A: 
- **Realized**: Actual gain/loss when a transaction is settled. Example: Invoice was MYR 4,500 (at rate 4.50), payment received was MYR 4,600 (at rate 4.60) = MYR 100 realized gain.
- **Unrealized**: Potential gain/loss on unsettled balances at period-end. Example: Outstanding invoice of USD 1,000 valued at MYR 4,500 (rate 4.50), but period-end rate is 4.60 = MYR 100 unrealized gain. This reverses next period.

**Q: How are forex gains and losses calculated?**  
A: 
1. **Realized**: (Settlement Rate - Original Rate) × Foreign Currency Amount
2. **Unrealized**: (Period-End Rate - Original/Last Revalued Rate) × Outstanding Foreign Currency Balance

The system automatically calculates both types and posts to the configured GL accounts.

**Q: Where do forex gains and losses appear in financial reports?**  
A: Realized forex gains/losses appear in the **Profit & Loss Statement** under "Other Income" or "Other Expenses". Unrealized forex gains/losses may appear in P&L or **Other Comprehensive Income** depending on your accounting framework (IFRS vs. GAAP) and can be configured in Settings.

**Q: Can I manually adjust forex gain/loss entries?**  
A: Automatic forex calculations should not be manually adjusted as this breaks the audit trail. If you believe a calculation is incorrect, verify the exchange rates used. If you need to make corrections, use a manual journal entry with proper documentation and approval, posting to a separate "Forex Adjustment" account.

---

### Multi-Currency Transaction Questions

**Q: How do I record a transaction in a foreign currency?**  
A: When creating an invoice, payment, or journal entry, select the customer/supplier with foreign currency setting, enter the amount in their currency (e.g., USD 1,000), and the system automatically converts to base currency using the current exchange rate. Both amounts are recorded for future reference.

**Q: Can I override the automatic exchange rate for a specific transaction?**  
A: Yes, you can manually override the rate for a specific transaction. When entering the transaction, click "Edit Rate", input your custom rate, and add a reason (e.g., "Bank-negotiated rate for large transaction"). This requires proper authorization and is tracked in the audit trail.

**Q: What if I need to invoice a customer in multiple currencies?**  
A: Each invoice must be in a single currency (the customer's default currency or your base currency). For customers who transact in multiple currencies, you can create separate customer records for each currency or change the currency per invoice (if allowed in your configuration).

**Q: How do I handle multi-currency bank reconciliation?**  
A: The Bank Reconciliation Applet integrates with the Forex Applet. Bank transactions in foreign currencies are automatically converted using the transaction date's exchange rate. The reconciliation shows both foreign and base currency amounts, and any forex differences are posted to the configured variance account.

---

### Configuration Questions

**Q: Can I change my base currency after I've started recording transactions?**  
A: No, the base currency cannot be changed once transactions exist in the system. This is to maintain data integrity and prevent historical transaction corruption. If you absolutely need to change base currency, you must:
1. Close the current fiscal year
2. Export all data
3. Set up a new company with the desired base currency
4. Import opening balances

**Q: How many currencies can I support?**  
A: There's no system limit on the number of supported currencies. However, for practical management, most organizations support 5-15 active currencies. You can add currencies as needed and set unused currencies to "Inactive" status.

**Q: Do I need to set up exchange rates for all currency pairs?**  
A: You only need to maintain rates between your base currency and each foreign currency (e.g., MYR/USD, MYR/EUR). The system can calculate cross-currency rates automatically if needed (e.g., USD/EUR derived from MYR/USD and MYR/EUR rates).

**Q: What happens if the automatic rate feed fails?**  
A: The system will:
1. Retry the update (configurable attempts and intervals)
2. Fall back to the secondary rate source (if configured)
3. Send email alerts to designated users
4. Continue using the most recent available rates
5. Display warnings that rates are outdated

You can always manually update rates in **Exchange Rate Management** as a backup.

---

### Best Practices

**Q: What are the best practices for forex management?**  
A:
1. **Set up automatic rate updates** to ensure rates are always current
2. **Run monthly revaluation** to properly reflect unrealized gains/losses
3. **Review forex reports** regularly to monitor currency exposure
4. **Document manual overrides** with clear business justifications
5. **Set up alerts** for significant rate movements (e.g., > 5% change)
6. **Reconcile foreign currency bank accounts** monthly
7. **Train staff** on proper multi-currency transaction recording
8. **Maintain rate history** - never delete old rates
9. **Test your configuration** before going live with real transactions
10. **Review GL account mappings** to ensure forex entries post to correct accounts

---

## Integration with Other Applets

The Forex Applet seamlessly integrates with other BigLedger applets:

### Chart of Accounts Applet
- Define GL accounts for forex gains, losses, and rounding
- Multi-currency account setup and classification
- Foreign exchange account configuration

### Ledger and Journal Applet
- Automatic journal entries for forex transactions
- Forex gain/loss posting to general ledger
- Multi-currency trial balance support

### Cashbook Applet
- Foreign currency bank account management
- Multi-currency receipts and payments
- Bank reconciliation with forex handling

### Accounts Receivable Applet
- Multi-currency customer invoicing
- Foreign currency receipt processing
- Customer forex exposure reporting

### Accounts Payable Applet
- Multi-currency supplier invoicing
- Foreign currency payment processing
- Supplier forex exposure reporting

### Claim Applet
- Multi-currency expense claims and reimbursements
- Travel allowance with forex handling
- Foreign currency receipt attachments

---

## Summary

The Forex Applet is a comprehensive, mission-critical tool for multi-currency management that ensures:

**Accuracy**: Through automatic exchange rate updates, real-time conversion calculations, and systematic forex gain/loss recognition, the applet maintains accurate financial records across all currencies.

**Efficiency**: By integrating with other applets, supporting automatic rate feeds, and automating revaluation processes, the applet significantly reduces manual effort and speeds up period-end closing.

**Compliance**: With complete audit trails, support for IFRS and GAAP standards, proper gain/loss recognition, and comprehensive reporting, the applet helps organizations meet accounting standards and regulatory requirements.

**Insight**: Through multi-currency reporting, currency exposure analysis, forex trend tracking, and gain/loss analytics, the applet transforms raw exchange rate data into actionable business intelligence.

**Risk Management**: The applet's real-time rate monitoring, exposure tracking, variance alerts, and historical analysis capabilities allow organizations to actively manage currency risk.

Whether you're a finance team managing exchange rates, an accountant recording multi-currency transactions, a treasury staff member monitoring currency exposure, or a CFO analyzing forex impact on profitability, the Forex Applet provides the tools and structure needed to manage foreign exchange effectively.

By maintaining accurate exchange rates, automating currency conversions, systematically tracking forex gains and losses, and connecting seamlessly with related applets, this tool forms the backbone of sound multi-currency financial management and informed decision-making.
