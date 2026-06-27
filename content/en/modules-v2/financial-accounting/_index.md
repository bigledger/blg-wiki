---
title: "Financial Accounting Module"
description: "Complete financial management — ledger, journals, vouchers, bank reconciliation, budgets, and regulatory reporting."
weight: 20
---

## 1. Module Overview

The **Financial Accounting Module** is the financial backbone of BigLedger. It records every accounting transaction — from journal entries and payment vouchers to bank reconciliation and financial reporting. It is the destination where every other module posts its financial impact.

**Business Value:**
- Real-time financial position visible at any moment — no waiting for month-end close
- Complete audit trail from source document to general ledger entry
- Multi-currency and multi-entity support for regional and international operations
- Integrated budgetary controls prevent unauthorized spending before it happens

> 📌 **Important relationship:** Financial Accounting does **not** own master data. The Chart of Accounts, Cashbooks, Tax Codes, Customer and Supplier records all live in the [Core Module](/modules-v2/core/). Finance *uses* them. Read **Section 3 — Master Data Dependencies** to understand this critical relationship before going further.

---

## 2. Key Concepts & Terminology

| Term | Definition |
|------|-----------|
| **General Ledger (GL)** | The master record of all financial transactions, organized by account. |
| **Journal Entry** | A manual or system-generated double-entry record that debits and credits accounts. |
| **Payment Voucher (PV)** | A document authorizing and recording an outgoing payment to a supplier or employee. |
| **Receipt Voucher (RV)** | A document recording an incoming payment received from a customer. |
| **Bank Reconciliation** | The process of matching bank statement lines to internal records to ensure accuracy. |
| **Statement of Account** | A periodic summary of all transactions between the company and a customer or supplier. |
| **Budget** | A planned financial target set for specific accounts, departments, or projects. |
| **Vote Book** | A budgetary commitment register tracking allocated vs. spent amounts per budget line. |
| **SST** | Sales and Service Tax — Malaysia's indirect tax regime. |
| **Transaction Reconciliation** | The matching of related transaction records across modules (e.g., invoice to payment). |
| **Posting Status** | A document state — `DRAFT` (editable, not in GL) or `FINAL` (posted to GL, immutable). |
| **Period Cut-off** | The date after which no transactions can be backdated into a closed period. |
| **Dr (Debit)** | The accounting side that *receives* value — increases assets and expenses, decreases liabilities, equity, and revenue. Always the left side of a journal entry. |
| **Cr (Credit)** | The accounting side that *gives* value — increases liabilities, equity, and revenue, decreases assets and expenses. Always the right side of a journal entry. Every entry must have `Total Dr = Total Cr`. |

---

## 3. Master Data Dependencies (What Finance Borrows from Core)

Finance has **no master data of its own**. Every transaction relies on master records configured in the [Core Module](/modules-v2/core/). Understanding this relationship is the single most important thing for any new user.

### What flows from Core into every Finance transaction

| Master Data | Owned By (Core Applet) | Used By (Finance) | What It Decides |
|-------------|------------------------|-------------------|-----------------|
| **Chart of Accounts** | [Chart of Accounts Applet](/applets/master-data/chart-of-account-applet/) | Every Journal, PV, RV, and posting | Which GL account is debited/credited |
| **Cashbook** | [Cashbook Applet](/applets/master-data/cashbook-applet/) | Every PV, RV, Bank Reconciliation | Which bank account / cash drawer is touched |
| **Tax Codes** | [Tax Configuration Applet](/applets/master-data/tax-configuration-applet/) | Every taxable invoice, PV, RV | Tax rate, tax account, SST treatment |
| **Customer Records** | [Customer Maintenance Applet](/applets/master-data/customer-maintenance-applet/) | RVs, Debtor Report, Statement of Account | Who owes you, credit terms, statement target |
| **Supplier Records** | [Supplier Maintenance Applet](/applets/master-data/supplier-applet-1/) | PVs, Creditor Report | Who you pay, payment terms, bank details |
| **Doc Item Mapping** | [Doc Item Maintenance Applet](/applets/master-data/doc-item-maintenance-applet/) | Any document with line items | Default revenue/expense account per item, default tax code |
| **Organisation Structure** | [Organisation Applet](/applets/master-data/organisation-applet/) | All transactions and reports | Branch / location / department tagging for segmented reporting |
| **Workflows** | [Workflow Design Applet](/applets/master-data/workflow-design-applet/) | PV approval, RV approval, journal approval | Who approves what, in what order |

### How a Cashbook becomes a GL Bank Account

This is the most commonly misunderstood relationship in BigLedger:

```
Core: [Cashbook Applet]                          Core: [Chart of Accounts Applet]
   "Maybank Current Account"                          "1010 - Bank: Maybank Current"
              │                                               │
              └─────────────── linked via ───────────────────┘
                              GL account mapping

When you create a Payment Voucher and pick "Maybank Current Account" as the
payment method, the system automatically posts:
       Dr  Accounts Payable        (from supplier line)
       Cr  1010 Bank: Maybank      (from the cashbook's mapped GL account)
```

> ⚠️ **Common pitfall:** A new bank account requires **two** setup steps in Core: (1) create the GL account in Chart of Accounts, then (2) create the Cashbook and link it to that GL account. Skipping step 2 means transactions cannot be paid through that bank, even though the GL account exists.

### How a Tax Code becomes a GL Tax Account

```
Core: [Tax Configuration Applet]                 Core: [Chart of Accounts Applet]
   "SST-OUT 6%"                                     "2210 - SST Output Payable"
              │                                               │
              └─────────────── linked via ───────────────────┘
                              tax-to-GL mapping
```

When a Sales Invoice with `SST-OUT` is finalized, the tax portion automatically credits `2210 SST Output Payable` — without anyone keying it in.

---

## 4. Anatomy of a Transaction

Every finance transaction is a story made of six pieces. Knowing them helps you debug any posting issue.

{{< figure src="/images/user-guide/financial-accounting/anatomy-of-transaction.png" alt="The Anatomy of an Accounting Transaction" caption="The Anatomy of an Accounting Transaction: inputs, GL posting, and downstream financial outputs." >}}

> 💡 **How to read this:** All six pieces (top row) feed into a single GL posting (middle). That posting then surfaces in every downstream report and reconciliation (bottom row). If any input is wrong or missing, the downstream outputs are wrong — this is your debugging map.

**Example — A single Payment Voucher to Acme Supplies for RM 1,060 (incl. 6% SST):**

| Piece | Value | Source |
|-------|-------|--------|
| WHO (Entity) | Acme Supplies (SUP-014) | [Supplier Maintenance](/applets/master-data/supplier-applet-1/) |
| WHEN | 2026-03-15, Period: March-2026 | [Ledger & Journal](/applets/finance/ledger-and-journal-applet/) period control |
| WHAT (Account) | 5310 Office Supplies | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) default mapping |
| WHAT (Tax) | SST-IN 6% | [Tax Configuration](/applets/master-data/tax-configuration-applet/) |
| HOW MUCH | RM 1,000 + RM 60 SST = RM 1,060 | Calculated by line + tax engine |
| HOW (Cashbook) | Maybank Current → GL 1010 | [Cashbook Applet](/applets/master-data/cashbook-applet/) |
| WHERE | Branch: HQ | [Organisation Applet](/applets/master-data/organisation-applet/) |

**Resulting GL posting (automatic):**
```
Dr  5310 Office Supplies         1,000.00
Dr  2310 SST Input Receivable       60.00
   Cr  1010 Bank: Maybank             1,060.00
```

That entry then flows into the **P&L** (via 5310), the **Balance Sheet** (via 1010 and 2310), the **SST Return** (via the tax code), and **Bank Reconciliation** (waiting to be matched).

---

## 5. Applet Dependency Map

Finance applets stack into four layers, plus a cross-cutting compliance layer. Data flows downward — from configuration to transactions to verification to reporting.

{{< figure src="/images/user-guide/financial-accounting/applet-dependency-map.jpg" alt="The Finance ERP Ecosystem: Applet Dependency and Data Flow" caption="The Finance ERP Ecosystem: Applet Dependency and Data Flow showing 4 structural layers plus cross-cutting tax compliance." >}}

---

## 6. The Applet Layers Explained

### Layer 1 — Foundation

Rules and envelopes that govern every transaction posted later.

| Applet | Purpose |
|--------|---------|
| [Tax Configuration Applet](/applets/finance/tax-config-applet/) | Advanced tax configuration for multi-jurisdiction compliance. |
| [Budget Applet](/applets/finance/budget-applet/) | Create, monitor, and control budgets across departments and projects. |
| [Vote Book Applet](/applets/finance/vote-book-applet/) | Track budgetary commitments and available balances in real time. |

### Layer 2 — Transactional

**Payables**

| Applet | Purpose |
|--------|---------|
| [Purchase Invoice (Internal) Applet](/applets/finance/internal-purchase-invoice-applet/) | Record supplier invoices entering the AP ledger. |
| [Payment Voucher (Internal) Applet](/applets/finance/internal-payment-voucher-applet/) | Create and approve outgoing payments to suppliers and employees. |

**Receivables**

| Applet | Purpose |
|--------|---------|
| [Receipt Voucher (Internal) Applet](/applets/finance/internal-receipt-voucher-applet/) | Record incoming customer payments. |
| [Accounts Receivable Applet](/applets/finance/accounts-receivable-applet/) | Track customer receivables and collection workflow. |
| [Statement of Account Applet](/applets/finance/statement-of-account-applet/) | Generate and send periodic account statements. |
| [E-Mandate Applet](/applets/finance/e-mandate-applet/) | Manage recurring direct debit mandates. |

**Core Ledger**

| Applet | Purpose |
|--------|---------|
| [Ledger & Journal Applet](/applets/finance/ledger-and-journal-applet/) | View the general ledger, create journals, manage posting periods. |

**Assets & Treasury**

| Applet | Purpose |
|--------|---------|
| [Fixed Asset Applet](/applets/finance/fixed-asset-applet/) | Manage fixed assets, depreciation schedules, and disposals. |
| [Investment Applet](/applets/finance/investment-applet/) | Manage corporate investment holdings. |
| [MM Deposit Applet](/applets/finance/mm-deposit-applet/) | Manage money market deposits and fixed deposit placements. |
| [Deposit Applet](/applets/finance/deposit-applet/) | Manage deposit instruments and balances. |

**Specialty**

| Applet | Purpose |
|--------|---------|
| [Revenue Management Applet](/applets/finance/revenue-management-applet/) | Define revenue recognition rules and track deferred vs. recognized revenue. |

### Layer 3 — Verification & Matching

Confirm that internal records match external reality.

| Applet | Purpose |
|--------|---------|
| [Bank Reconciliation Applet](/applets/finance/bank-reconciliation-applet/) | Match bank statement entries against internal payment and receipt records. |
| [Transaction Reconciliation Applet](/applets/finance/txn-recon-applet/) | Cross-reference and reconcile related transactions across modules. |

### Layer 4 — Reporting & Output

See **Section 7 — Reports Catalog** below for a full breakdown of every report, when to run it, and who uses it.

### Cross-Cutting — Tax Compliance

| Applet | Purpose |
|--------|---------|
| [SST Applet](/applets/finance/sst-applet/) | Malaysian Sales and Service Tax reporting, filing, and reconciliation. |

---

## 7. Reports Catalog — What, When, Who

Reports turn posted data into decisions. They fall into five categories — each answers a different business question.

### 7.1 Statutory Reports (the official numbers)

| Report | Generated From | Primary Audience | Frequency | Decision It Drives |
|--------|----------------|------------------|-----------|--------------------|
| **Balance Sheet** | [Financial Report Applet](/applets/finance/financial-report-applet/) | Directors, auditors, banks | Month-end, year-end | Financial position, solvency, audit |
| **Profit & Loss (Income Statement)** | [Financial Report Applet](/applets/finance/financial-report-applet/) | Directors, finance manager | Monthly, quarterly, yearly | Profitability, performance vs. target |
| **Trial Balance** | [Financial Report Applet](/applets/finance/financial-report-applet/) | Accountant, auditor | Monthly (close), continuously | Confirms debits = credits before reports |
| **Cash Flow Statement** | [Financial Report Applet](/applets/finance/financial-report-applet/) | CFO, board, lenders | Monthly, quarterly | Operating / investing / financing health |

### 7.2 Operational Reports (the working numbers)

| Report | Generated From | Primary Audience | Frequency | Decision It Drives |
|--------|----------------|------------------|-----------|--------------------|
| **Debtor Aging** | [Debtor Report Applet](/applets/finance/debtor-report-applet/) | AR Clerk, Finance Manager | Weekly | Who to chase for collection |
| **Creditor Aging** | [Creditor Report Applet](/applets/finance/creditor-report-applet/) | AP Clerk, Finance Manager | Weekly | What to pay this week |
| **Combined AR/AP** | [Debtor & Creditor Report Applet](/applets/finance/debtor-and-creditor-report-applet/) | Finance Manager | Weekly | Net cash position by counterparty |
| **Statement of Account** | [Statement of Account Applet](/applets/finance/statement-of-account-applet/) | AR Clerk → sent to customer | Monthly | Customer reconciliation and dispute resolution |
| **Bank Reconciliation Summary** | [Bank Reconciliation Applet](/applets/finance/bank-reconciliation-applet/) | AP/AR Clerk, Accountant | Monthly | Confirms book balance = bank statement balance |

### 7.3 GL Inquiry & Drill-Down (the investigative tools)

| Report | Generated From | Primary Audience | Frequency | Use Case |
|--------|----------------|------------------|-----------|----------|
| **GL Account Inquiry** | [General Ledger Applet](/applets/finance/general-ledger-applet/) | Accountant, Auditor | Ad-hoc | "Why does account 5310 show RM 12,400 this month?" |
| **Transaction Drill-Down** | [General Ledger Applet](/applets/finance/general-ledger-applet/) | Auditor | Ad-hoc | Trace a GL line back to its source document |
| **Journal Listing** | [Ledger & Journal Applet](/applets/finance/ledger-and-journal-applet/) | Accountant | As needed | Review all manual journals in a period |

### 7.4 Compliance & Tax Reports

| Report | Generated From | Primary Audience | Frequency | Decision It Drives |
|--------|----------------|------------------|-----------|--------------------|
| **SST Return (SST-02)** | [SST Applet](/applets/finance/sst-applet/) | Accountant → submit to RMCD | Bi-monthly (MY) | Tax liability filing |
| **Tax Code Summary** | [SST Applet](/applets/finance/sst-applet/), [Tax Config](/applets/finance/tax-config-applet/) | Accountant | Each return cycle | Reconcile output vs. input tax |

### 7.5 Budget & Treasury Reports

| Report | Generated From | Primary Audience | Frequency | Decision It Drives |
|--------|----------------|------------------|-----------|--------------------|
| **Budget vs. Actual** | [Budget Applet](/applets/finance/budget-applet/) | Budget Controller, Dept Heads | Monthly | Identify overspend, reforecast |
| **Vote Book Balance** | [Vote Book Applet](/applets/finance/vote-book-applet/) | Budget Controller | Real-time | Confirm budget available before approving spend |
| **Investment Holdings** | [Investment Applet](/applets/finance/investment-applet/) | Treasurer, CFO | Monthly | Treasury position |
| **MM Deposit Schedule** | [MM Deposit Applet](/applets/finance/mm-deposit-applet/) | Treasurer | Monthly | Maturity planning, liquidity |

### 7.6 Cost of Goods Sold (COGS) — Where to Find It

COGS does not have its own applet — it is **calculated automatically** by every Sales Invoice and posted to the GL alongside the revenue entry. You read it back from three different places depending on the level of detail you need.

**How COGS is generated**

Every time a Sales Invoice goes `FINAL`, the system posts **two** journals at the same time:

```
Revenue posting:                            COGS posting (automatic, same instant):
   Dr  Accounts Receivable                     Dr  5000 Cost of Goods Sold
      Cr  Sales Revenue                           Cr  Inventory (Stock on Hand)
      Cr  SST Output Payable                   Amount = Unit Cost (MA) × Qty Sold
```

The COGS amount uses the **Moving Average (MA) unit cost** of the item at the moment of sale. The COGS GL account is the one mapped against the item / inventory category in [Chart of Accounts Applet](/applets/master-data/chart-of-account-applet/) — BigLedger supports multiple COGS variants (Retail COGS, Stock Adjustment COGS, Raw Material COGS, WIP COGS, Finished Goods COGS, NSTI COGS).

**Where to read COGS**

| What You Want | Where to Look | How |
|---------------|---------------|-----|
| **Aggregated COGS for the period (P&L view)** | [Financial Report Applet](/applets/finance/financial-report-applet/) | Run the P&L — COGS appears as a row group between Revenue and Gross Profit. Configure which 5xxx accounts roll up in the Row Definitions. |
| **COGS by account, with drill-down to source** | [General Ledger Applet](/applets/finance/general-ledger-applet/) | Select the COGS account (e.g. 5000), pick the period — every line shows the source Sales Invoice. Click through to inspect. |
| **COGS per item / per sale / per branch** | [Stock Report Applet](/applets/inventory-workflow/stock-report-applet/) | Use the "Cost" column (permission-controlled) — shows `Unit Cost (MA) × Qty Sold` per stock movement. |
| **Gross Margin** | [Financial Report Applet](/applets/finance/financial-report-applet/) | P&L automatically calculates Gross Profit = Revenue − COGS once both row groups are defined. |

> ⚠️ **COGS data hygiene** — if your P&L COGS looks wrong, the cause is almost always one of three things: (1) an item has no MA cost yet (first sale before any purchase), (2) the item is mapped to the wrong COGS account in [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/), or (3) Sales Invoices are still `DRAFT` and not yet posted.

### Reporting tips

- **Branch filtering** — every report supports branch / location / department filters. Use them when consolidating multi-entity figures.
- **Period selection** — reports respect the period selector. Closed periods give "as-at" snapshots; open periods change as new transactions post.
- **Draft vs. Final** — `DRAFT` documents do **not** appear in any report. If a figure looks low, check for unposted drafts.

---

## 8. Who Uses This Module?

| Role | Lane |
|------|------|
| **Accounts Payable Clerk** | Supplier invoices, payments, payable reconciliation |
| **Accounts Receivable Clerk** | Customer receipts, statements, collections |
| **General Accountant** | Manual journals, GL inquiry, tax filing, fixed assets |
| **Budget Controller** | Budget setup, commitment monitoring, treasury |
| **Finance Manager / Controller** | Approvals, cross-module review, financial reports |
| **Auditor (Read-Only)** | Drill-down on GL, reports, and reconciliations |

---

## 9. Role-Based User Journeys

### Journey: Accounts Payable Clerk (Daily)

```
[Purchase Invoice] ──▶ [Payment Voucher] ──▶ Approval ──▶ [Bank Reconciliation]
                                                            │
                                                            └──▶ [Creditor Report] (weekly aging)
```

1. Open [Purchase Invoice (Internal) Applet](/applets/finance/internal-purchase-invoice-applet/) to log the supplier invoice.
2. Create a Payment Voucher in [Payment Voucher (Internal) Applet](/applets/finance/internal-payment-voucher-applet/) referencing that invoice — pick the correct **Cashbook** (this is what determines which bank account is credited).
3. Once approved and paid, match the bank movement in [Bank Reconciliation Applet](/applets/finance/bank-reconciliation-applet/).
4. Weekly: review supplier aging in [Creditor Report Applet](/applets/finance/creditor-report-applet/).

### Journey: Accounts Receivable Clerk (Daily)

```
[Receipt Voucher] ──▶ [Statement of Account] ──▶ [E-Mandate] ──▶ [Debtor Report]
```

1. Record the incoming customer payment in [Receipt Voucher (Internal) Applet](/applets/finance/internal-receipt-voucher-applet/) — pick the receiving **Cashbook**.
2. Send periodic statements via [Statement of Account Applet](/applets/finance/statement-of-account-applet/).
3. For recurring billing, manage mandates in [E-Mandate Applet](/applets/finance/e-mandate-applet/).
4. Chase overdue accounts using [Debtor Report Applet](/applets/finance/debtor-report-applet/).

### Journey: General Accountant (Daily and Periodic)

```
[Ledger & Journal] ──▶ [General Ledger] (inquiry) ──▶ [Tax Config] / [SST] ──▶ [Fixed Asset] / [Revenue Mgmt]
```

1. Post manual adjustments and accruals in [Ledger & Journal Applet](/applets/finance/ledger-and-journal-applet/).
2. Investigate balances and transactions in [General Ledger Applet](/applets/finance/general-ledger-applet/).
3. File tax returns via [Tax Configuration Applet](/applets/finance/tax-config-applet/) and [SST Applet](/applets/finance/sst-applet/).
4. Maintain depreciation schedules in [Fixed Asset Applet](/applets/finance/fixed-asset-applet/) and recognition rules in [Revenue Management Applet](/applets/finance/revenue-management-applet/).

### Journey: Budget Controller (Continuous)

```
[Budget] ──▶ [Vote Book] ──▶ [Investment] / [MM Deposit] / [Deposit]
```

1. Define budgets per department, project, or cost centre in [Budget Applet](/applets/finance/budget-applet/).
2. Monitor live commitments and remaining balances in [Vote Book Applet](/applets/finance/vote-book-applet/).
3. Manage treasury placements in [Investment Applet](/applets/finance/investment-applet/), [MM Deposit Applet](/applets/finance/mm-deposit-applet/), and [Deposit Applet](/applets/finance/deposit-applet/).

### Journey: Finance Manager / Controller (Daily approvals + monthly close)

```
PV / RV Approval Queue ──▶ [Txn Recon] ──▶ [Financial Report Applet]
```

1. Clear pending PV and RV approvals from the workflow queue.
2. Run cross-module sanity checks in [Transaction Reconciliation Applet](/applets/finance/txn-recon-applet/).
3. Generate Balance Sheet, P&L, Trial Balance, and Cash Flow in [Financial Report Applet](/applets/finance/financial-report-applet/).

### Journey: Auditor (Read-Only)

```
[Financial Report Applet] ──▶ [General Ledger] (drill-down) ──▶ [Bank Reconciliation] (verify)
```

1. Tie out statutory figures in [Financial Report Applet](/applets/finance/financial-report-applet/).
2. Drill down on account balances in [General Ledger Applet](/applets/finance/general-ledger-applet/) — every figure traces back to its source document.
3. Verify cash positions in [Bank Reconciliation Applet](/applets/finance/bank-reconciliation-applet/).

---

## 10. Cross-Module Data Flow

Finance is the financial endpoint of every other module. Knowing what flows in helps diagnose missing or wrong figures.

### Inbound — Data flowing INTO Financial Accounting

> 📘 **Reading the GL Impact column:** `Dr` = **Debit** (account receives value), `Cr` = **Credit** (account gives value). Every entry balances — total Dr always equals total Cr. Example: `Dr Cash · Cr Sales` means cash increased and sales revenue was recorded for the same amount.

| From Module | Source Document | Becomes in Finance | GL Impact |
|-------------|-----------------|--------------------|-----------|
| **Sales & CRM** | Sales Invoice — revenue side | AR balance, revenue recognition | Dr AR · Cr Revenue · Cr SST Output |
| **Sales & CRM** | Sales Invoice — **COGS side** (automatic, same instant) | COGS expense, inventory reduction | Dr COGS · Cr Inventory · Amount = MA Cost × Qty |
| **Sales & CRM** | Sales Credit Note | AR reduction, COGS reversal | Dr Revenue · Dr SST Output · Cr AR · (Cr COGS · Dr Inventory on returned items) |
| **Purchasing** | Purchase Invoice | AP balance, expense recognition, inventory increase | Dr Expense / Inventory · Dr SST Input · Cr AP |
| **Purchasing** | Purchase Debit Note | AP reduction | Dr AP · Cr Expense · Cr SST Input |
| **Inventory** | Stock Adjustment (write-off, write-on) | Stock adjustment COGS variant | Dr Stock Adjustment COGS · Cr Inventory (and reverse) |
| **Manufacturing** | Production order completion | WIP and finished goods movements | Dr Finished Goods · Cr WIP (with Raw Material / WIP / FG COGS variants per stage) |
| **HR-Payroll** | Payroll posting | Salary expense, statutory deductions | Dr Salaries · Cr Bank · Cr EPF/SOCSO payables |
| **POS** | Daily takings | Cash sales, daily Z-reads | Dr Cash · Cr Sales · Cr SST Output |
| **Claims** | Approved claim | Reimbursement payable | Dr Expense · Cr Employee Payable |

### Outbound — Data flowing OUT of Financial Accounting

| To Module / Destination | What Goes Out | Purpose |
|-------------------------|---------------|---------|
| **E-Invoice Module** | Final Sales Invoice, Credit Note | Regulatory submission (MyInvois, etc.) |
| **Dashboards / BI** | GL balances, KPI feeds | Real-time financial visibility |
| **External Auditors** | Trial Balance, GL listing, supporting docs | Annual audit |
| **Tax Authority (RMCD)** | SST-02 returns | Statutory filing |
| **Banks** | Audited financials | Loan covenants, banking facilities |
| **Vote Book** | Posted commitments | Budget consumption tracking |

> 💡 **Debugging tip:** If a sale appears in Sales but not in Finance, check: (1) is the Sales Invoice `FINAL` (not `DRAFT`)? (2) is the transaction date inside an open period? (3) does the customer record have a valid mapping to AR account?

---

## 11. Period Management & Posting Mechanics

How BigLedger keeps the books trustworthy — and how to work within those rules.

### Posting Status — DRAFT vs. FINAL

| Status | What It Means | Where It Appears |
|--------|---------------|------------------|
| **DRAFT** | Document saved but **not posted to GL**. Editable. Deletable. | Visible in source applet only |
| **FINAL** | Posted to GL. **Immutable**. Audit trail locked. | Appears in GL, all reports, all reconciliations |

> ⚠️ A `DRAFT` document does **not** affect the trial balance, debtor/creditor reports, bank balance, or financial statements. If a figure is missing — first check for unposted drafts.

### Period Cut-off

Periods (months) are opened and closed via the [Ledger & Journal Applet](/applets/finance/ledger-and-journal-applet/).

- **Open period** — any user with permission can post transactions dated in this period.
- **Closed period** — no new transactions or backdated entries. Reports become a fixed "as-at" snapshot.
- **Cut-off discipline** — finance teams typically close a period 5–10 working days into the next month, after all accruals, bank recs, and adjustments are in.

### Correcting a Posted Entry

Posted entries cannot be edited or deleted (audit trail rule). The correct procedure:

```
Wrong entry posted ──▶ Create REVERSING journal (same period, opposite signs)
                                          │
                                          └──▶ Post the corrected entry
```

This preserves the audit trail while still arriving at the right balance.

### Multi-Currency & Multi-Entity

- Each transaction stores a **document currency** and an **exchange rate** (set at posting).
- The GL posts in **functional currency** (the company's base currency).
- Revaluation journals at period-end adjust foreign currency balances to the closing rate.
- Multi-entity setups consolidate via inter-company eliminations defined in the [Chart of Accounts Applet](/applets/master-data/chart-of-account-applet/).

---

## 12. Prerequisites & Setup

Financial Accounting requires the [Core Module](/modules-v2/core/) to be live first.

### Pre-Go-Live Checklist

- [x] **Core Module** configured — Organisation, COA, Cashbook, Tax Codes, Doc Item mappings, Customer & Supplier records
- [ ] Every bank account registered as a Cashbook in Core, **linked to a GL account**
- [ ] Every Tax Code mapped to its GL Output/Input Tax account
- [ ] Doc Item Maintenance configured with default revenue/expense accounts per item
- [ ] Approval workflows for Payment Vouchers configured in [Workflow Design Applet](/applets/master-data/workflow-design-applet/)
- [ ] Budget structure defined (if using budgetary controls)
- [ ] Financial report templates configured in [Financial Report Applet](/applets/finance/financial-report-applet/)
- [ ] SST registration details entered (for Malaysian entities)
- [ ] Period control set — first open period defined in [Ledger & Journal Applet](/applets/finance/ledger-and-journal-applet/)
- [ ] Opening balances imported (see below)

### Opening Balance Migration

Before go-live, historical balances must be brought forward from the previous system in this sequence: **Stock ▶ AR ▶ AP ▶ Cashbook ▶ General Ledger**.

📖 Full step-by-step guide: **[Opening Balance Migration Guide →](/modules-v2/financial-accounting/opening-balance/)**

---

## 13. FAQs & Troubleshooting

**Q: I created a Payment Voucher and approved it, but the bank balance in the Bank Reconciliation Applet hasn't changed. Why?**
A: Two different things. The PV posts the *accounting* entry (debit AP, credit GL Bank). The bank balance shown in [Bank Reconciliation Applet](/applets/finance/bank-reconciliation-applet/) only updates when you import or enter the bank *statement* and match it to the PV. The GL balance updates immediately; the "matched bank balance" updates at reconciliation time.

**Q: Why does my GL Bank account balance not equal my actual bank statement balance?**
A: This is normal between recs. The difference is made up of: (1) cheques issued but not yet cleared, (2) deposits in transit, (3) bank charges not yet booked, (4) errors. The [Bank Reconciliation Applet](/applets/finance/bank-reconciliation-applet/) produces the reconciling items list.

**Q: The Trial Balance isn't balancing. What should I check?**
A: In order: (1) verify all journals in [Ledger & Journal Applet](/applets/finance/ledger-and-journal-applet/) have matching debits = credits, (2) check for documents stuck in `DRAFT` that you expected to be posted, (3) check for transactions posted to a suspense or "unmapped" account due to a missing tax-code or doc-item mapping.

**Q: How do I correct a posted journal entry?**
A: BigLedger does not allow editing or deleting posted entries (audit trail compliance). Create a **reversing journal entry** in the same period, then post the corrected entry.

**Q: I closed last month's period but the auditor needs me to post one more adjustment. What now?**
A: A user with period-management permission can temporarily reopen the period in [Ledger & Journal Applet](/applets/finance/ledger-and-journal-applet/), post the adjustment, then re-close. Every reopen is logged in the audit trail.

**Q: Can I generate financial reports for a specific branch only?**
A: Yes. Every report in [Financial Report Applet](/applets/finance/financial-report-applet/) supports branch / location / department filters.

**Q: A new bank account isn't showing as a payment option on Payment Vouchers. What's missing?**
A: A new bank requires two setup steps in Core: (1) create the GL account in [Chart of Accounts](/applets/master-data/chart-of-account-applet/), then (2) create the Cashbook in [Cashbook Applet](/applets/master-data/cashbook-applet/) and **link it to that GL account**. Without step 2 the bank exists in the books but not as a payable cashbook.

**Q: My P&L shows revenue I don't recognize. How do I find where it came from?**
A: Open [General Ledger Applet](/applets/finance/general-ledger-applet/), select the revenue account, drill into the period — every line shows the source document and module (Sales Invoice, POS Z-read, etc.). Click through to inspect.

**Q: A customer paid via direct debit but the receipt isn't showing. Where is it?**
A: Direct debit collections come through the [E-Mandate Applet](/applets/finance/e-mandate-applet/) which generates Receipt Vouchers. Check the mandate run log first, then the resulting RVs in [Receipt Voucher (Internal) Applet](/applets/finance/internal-receipt-voucher-applet/).

**Q: The SST Return total doesn't match the SST Output account in my GL.**
A: Common causes: (1) some invoices are still `DRAFT`, (2) the return period and the GL period don't match exactly, (3) a manual journal touched the SST account without a tax code attached. Use the [SST Applet](/applets/finance/sst-applet/) reconciliation report to identify the gap.

**Q: I see a transaction in the GL but the source document doesn't exist anymore. What happened?**
A: Posted source documents cannot be deleted — only reversed. If you cannot find it, check whether you're filtering by `FINAL` only and whether the document was reversed (the reversal would also appear in the GL with opposite signs).

**Q: Where do I find the Cost of Goods Sold (COGS) report?**
A: BigLedger has no standalone COGS report — COGS is a P&L line generated automatically when Sales Invoices post. You read it back from three places depending on what you need:
- **Aggregated by period (P&L view):** [Financial Report Applet](/applets/finance/financial-report-applet/) → Profit & Loss → COGS row group.
- **Account-level detail with drill-down:** [General Ledger Applet](/applets/finance/general-ledger-applet/) → select the COGS account (usually 5000 series) → drill into any line to reach the originating Sales Invoice.
- **Per item / per sale / per branch:** [Stock Report Applet](/applets/inventory-workflow/stock-report-applet/) → "Cost" column (permission-controlled) — shows `Unit Cost (MA) × Qty Sold` per movement.

See **Section 7.6 — Cost of Goods Sold (COGS)** above for the full posting flow.

**Q: My Gross Margin looks wrong / COGS seems too low. What should I check?**
A: Common causes, in order:
1. An item has **no Moving Average cost yet** — usually the first sale before any purchase. The Sales Invoice posts COGS as zero, inflating margin. Check the item in [Stock Report Applet](/applets/inventory-workflow/stock-report-applet/) for MA cost.
2. Some Sales Invoices are still in `DRAFT` — they don't post Revenue or COGS, so both are understated.
3. The item is mapped to the wrong COGS variant in [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) (e.g. landing in Stock Adjustment COGS instead of Retail COGS), splitting the figures across accounts your P&L row definition doesn't include.
4. A purchase return or stock adjustment after the sale reset the MA cost retroactively — drill the GL on the COGS account by date to see which entry is the outlier.
