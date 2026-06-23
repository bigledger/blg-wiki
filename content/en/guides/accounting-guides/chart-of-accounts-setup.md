---
description: Step-by-step guide to setting up the Chart of Account applet in BigLedger — from a fresh tenant to a working hierarchy ready for posting.
tags:
- user-guide
- accounting
- chart-of-accounts
title: Chart of Accounts Setup Guide
weight: 10
---

This guide walks a new tenant through getting the **Chart of Account Applet** into a state where the first transaction can post correctly. For field-by-field reference, see the [Chart of Account Applet](/applets/master-data/chart-of-account-applet/) documentation.

{{< callout type="info" >}}
**The Golden Rule**
Every transaction must end up in a **GL Code**. Every GL Code must belong to a **GL Category**. Every GL Category must be linked to a **GL Section**. If any link in that chain is missing, posting will fail.
{{< /callout >}}

## What you are building

BigLedger uses a strict three-level hierarchy plus an organisation layer:

| Level | Object | Purpose |
| :--- | :--- | :--- |
| 1 | **GL Section** | Top-level grouping for financial statement presentation (Assets, Liabilities, Equity, Revenue, Expenses) |
| 2 | **GL Category** | Logical subgrouping for subtotals (Current Assets, Fixed Assets, Trade Debtors) |
| 3 | **GL Code** | The transactional bucket. Every debit and credit lands here (e.g. `1001 Petty Cash`) |

Sitting alongside that hierarchy:

- **Companies** — legal entities; each holds the default GL Code mappings that drive automated posting
- **Set of Books** — accounting book containers; ledgers from one or more companies are linked here
- **Fiscal Year / Fiscal Period** — the calendar the system posts into, with per-period lock controls

## Prerequisites

Before you start, confirm:

- Organisation setup is complete (see the [Organisation Applet](/applets/master-data/organisation-applet/))
- You know your reporting currency and fiscal year start/end dates
- You have either an existing chart of accounts to import, or a clean list of GL Sections, Categories, and Codes to create
- You have decided which accounts will serve the system roles (retained earnings, trade debtor, trade creditor, output tax, etc.) — see [Step 6](#step-6-map-default-gl-codes) below

The applet is at **Master Data → Chart of Account Applet**.

## Step 1: Review or create GL Sections

*Sidebar → GL Section*

GL Sections are usually pre-populated for a new tenant (Current Assets, Fixed Assets, Long Term Liabilities, Equity, Revenue, Expenses, etc.). Open the listing and verify what's there.

- **To edit**: change the **Name** or **Account No**.
- **To add**: click **New**, then fill in the Code, Name, and (optionally) Account No.

Keep the section list short — these map directly to financial statement headings.

## Step 2: Create GL Categories

*Sidebar → GL Category*

Categories group accounts for subtotals (e.g. *Current Assets*, *Fixed Assets*, *Trade Debtors*, *Operating Expenses*).

| Field | Notes |
| :--- | :--- |
| **GL Category Code** | Required. **Immutable after save** — pick carefully. |
| **GL Category Name** | Required. |
| **Description** | Optional. |
| **Account No** | Optional. Used by certain printable formats and report layouts. |

Categories are created independently of sections. Link them in the next step.

### Bulk import

To migrate an existing chart, use *Sidebar → Import GL Category*. Download the **Sample Format** CSV from the import screen, fill it in, and upload.

## Step 3: Link Categories to Sections

*GL Category → open a category → GL Section tab*

This is the step that's easy to miss. A category that is not linked to a section will not appear on the financial statements.

1. Open the category you just created.
2. Switch to the **GL Section** tab.
3. Add the appropriate GL Section.

Repeat for every category. Verify by opening the **Chart of Account** tree view (*Sidebar → Chart of Account*) — every category should now appear under its parent section.

## Step 4: Create GL Codes

*Sidebar → GL Code* (or open a Category and use its **GL Code** tab)

GL Codes are the actual accounts that transactions post to.

| Field | Notes |
| :--- | :--- |
| **GL Code** | Required. **Immutable after save**. |
| **GL Name** | Required. |
| **Chart of Account** | Required. The COA container the code belongs to. |
| **GL Category** | Required. Drives where the account rolls up. |
| **Description** | Optional. |
| **Account No** | Optional. |
| **Status** | `ACTIVE` or `INACTIVE`. |

### Bulk import

For migration, use *Sidebar → Import GL Code*. Download the sample CSV, populate it, and upload. The import will validate that referenced Charts and Categories exist before creating any rows.

{{< callout type="tip" >}}
There is no enforced numbering convention. Common practice is to leave gaps (use `1100`, `1110`, `1120` rather than `1101`, `1102`, `1103`) so new accounts can slot in without disturbing the order.
{{< /callout >}}

## Step 5: Configure the Company and Ledgers

*Sidebar → Companies*

The Company record is what ties posting to a legal entity.

1. Open the company in the listing.
2. Verify the **Main** tab: Company Code, Name, Registration No, Currency.
3. Open the **Ledgers** tab and create at least one ledger:
   - **Ledger Code, Ledger Name** — required
   - **Ledger Type** — Primary / Secondary / Consolidated
   - **Currency** — must match a configured currency
4. Most setups need one **Primary** ledger; add Secondary or Consolidated only if you have a specific reporting need.

Then create the Set of Books:

*Sidebar → Set Of Books → New*

- Enter a **Name** (e.g. *Main Books FY2026*).
- Open the **Ledgers** tab and link the ledger(s) you just created.

## Step 6: Map Default GL Codes

*Companies → open company → Default GL Codes*

This step is the one most often skipped, and the one that causes the most posting failures later. The applet needs to know which GL Code to use whenever the system auto-posts a transaction (an invoice, a stock receipt, a forex revaluation, etc.).

The mapping is split across several tabs. Map every role that applies to your business:

**General**
- `RETAINED_EARNING`, `PROFIT_LOSS`
- `FIXED_ASSET_REGISTER`, `ROUNDING`, `SETTLEMENT_CHARGES`
- `NSTI` (non-stock items)

**Entity (AR/AP)**
- `DEBTOR`, `CREDITOR` — trade
- `DEBTOR_NON_TRADE`, `CREDITOR_NON_TRADE`
- `DEBTOR_NOT_INVOICED`, `CREDITOR_NOT_INVOICED` — accruals
- `DEBTOR_NON_TRADE_NOT_INVOICED`, `CREDITOR_NON_TRADE_NOT_INVOICED`
- `MERCHANT_RECEIVABLE`, `MERCHANT_PAYABLE`
- `EMPLOYEE_OTHER_PAYABLE`

**Sales / Purchase**
- `SALES`, `SALES_RETURN`, `SALES_DISCOUNT`, `OUTPUT_TAX`
- `PURCHASE`, `PURCHASE_RETURN`, `PURCHASE_DISCOUNT`, `INPUT_TAX`

**Stock**
- `STOCK_BALANCE`, `COGS`, `STOCK_ADJUSTMENT`, `RESET_MA`
- `INVENTORY_NOT_INVOICED` (GR/IR)
- Raw / WIP / FG / NSTI variants if you use manufacturing:
  `STOCK_BALANCE_RAW`, `COGS_RAW`,
  `STOCK_BALANCE_WIP`, `COGS_WIP`,
  `STOCK_BALANCE_FG`, `COGS_FG`,
  `STOCK_BALANCE_NSTI`, `COGS_NSTI`

**Forex**
- `FOREX_GAIN`, `FOREX_LOSS`

**Consignment** (if applicable)
- `CONSIGNMENT_STOCK`, `CONSIGNMENT_LIABILITY`

{{< callout type="warning" >}}
A missing default mapping will surface as a posting error the first time the relevant transaction type runs — often days or weeks after setup. Map everything that applies *before* going live.
{{< /callout >}}

## Step 7: Create the Fiscal Year

*Sidebar → Fiscal Year → New*

1. Select the **Company**.
2. Enter a **Name** (e.g. `FY 2026`).
3. Enter **Date Start** and **Date End**.
4. Save — the system auto-generates the fiscal periods.

Open the new fiscal year and switch to the **Fiscal Period** tab to verify the periods were created with the right boundaries. Each period has a **Closing Status** dropdown — see below.

### Period closing status

| Status | Effect | When to use |
| :--- | :--- | :--- |
| **OPEN** | Anyone can post; auto-posting and manual journals both work | Current active period |
| **LOCK_GL** | System auto-posting still allowed; manual journals blocked | Month-end soft close |
| **LOCK_TXN** | New operational documents (invoices, GRNs, etc.) cannot be dated into this period | Cut-off enforcement |
| **LOCK_ALL** | Hard close. Nothing posts. | Year-end final close |

{{< callout type="warning" >}}
`LOCK_ALL` is the hard close. It cannot be reopened without administrator intervention. Confirm month-end reconciliations, accruals, and reports are signed off before applying it.
{{< /callout >}}

## Step 8: Post opening balances

Once Steps 1–7 are complete, post your migration opening balances as a manual journal entry through the **Ledger and Journal Applet**. The journal must:

- Be dated on or before your cutover date
- Balance (total debits = total credits)
- Reference the GL Codes you created above

See the [Journal Entries guide](/guides/accounting-guides/journal-entries/) for the full workflow.

## Step 9: Verify before going live

Before allowing operational transactions:

1. **Tree view check** — open *Chart of Account* and confirm every Category sits under a Section, and every Code sits under a Category.
2. **Default GL Codes check** — re-open *Companies → Default GL Codes* and confirm there are no blank rows for roles you intend to use.
3. **Trial balance check** — run the Trial Balance report; opening balances should reconcile to your migration source.
4. **Test transaction** — create one test sales invoice and one test purchase invoice. Confirm they post without error and land in the expected accounts.

## Maintenance

### Merging duplicate codes

*Sidebar → GL Code Merge*

Use this when the same account exists twice (typically discovered after migration).

1. Select the **Chart of Account** and **GL Category**.
2. Pick **Source GL Code** (the duplicate to retire) and **Target GL Code** (the survivor).
3. Click **MERGE**, then **CLICK AGAIN TO CONFIRM**.

All transaction history moves from Source to Target. The Source code is deactivated, not deleted, so the audit trail remains intact.

### Deactivating an account

You cannot delete a GL Code that has posted history. Set its **Status** to `INACTIVE` instead. Inactive codes stay in reports for historical periods but no longer appear in pickers for new transactions.

## Malaysian compliance notes

BigLedger does not enforce a specific account numbering scheme. Statutory requirements you need to satisfy yourself:

- **SST**: configure the tax types and rates in the [Tax Config Applet](/applets/finance/tax-config-applet/), then map the tax accounts to `INPUT_TAX` and `OUTPUT_TAX` in Default GL Codes. SST filing is handled by the [SST Applet](/applets/finance/sst-applet/).
- **E-Invoice (MyPEPPOL)**: requires the [MyPEPPOL Admin Applet](/applets/e-invoice/mypeppol-admin-applet/) and entity-level setup.
- **MFRS / MPERS reporting**: choose your category and code structure to match the disclosure lines required by the standard you report under.

## Related documentation

- [Chart of Account Applet](/applets/master-data/chart-of-account-applet/) — full field reference and screenshots
- [Journal Entries](/guides/accounting-guides/journal-entries/) — post opening balances and manual adjustments
- [Bank Reconciliation](/guides/accounting-guides/bank-reconciliation-guide/) — match bank activity once posting starts
- [Financial Reporting](/guides/accounting-guides/financial-reporting/) — Trial Balance, P&L, Balance Sheet
- [Tax Config Applet](/applets/finance/tax-config-applet/) — SST / input / output tax setup
