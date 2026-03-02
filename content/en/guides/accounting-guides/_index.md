---
title: "Accounting Guides"
description: "Setup your chart of accounts, manage daily journal entries, reconcile bank statements, and generate financial reports"
tags:
- user-guide
- accounting
weight: 30
bookCollapseSection: false
---

Manage your financial accounting processes — from initial chart of accounts setup to daily transaction recording, bank reconciliation, and financial reporting.

---

## 🚀 Get Started / Setup

New to accounting in BigLedger? Begin here to set up your financial foundation.

{{< cards >}}
  {{< card link="chart-of-accounts-setup" title="📋 Chart of Accounts Setup" subtitle="Design your account structure — the foundation for all financial reporting" >}}
{{< /cards >}}

**What you'll set up:**
- Account groups and categories (Assets, Liabilities, Equity, Revenue, Expenses)
- Account numbering conventions
- Default accounts for automated posting
- Opening balances for migration

{{< callout type="tip" >}}
**First time?** Complete the Chart of Accounts setup before recording any transactions. All journal entries, invoices, and payments post to accounts defined here.
{{< /callout >}}

---

## 📝 Daily Tasks

Guides for everyday accounting activities your team performs regularly.

{{< cards >}}
  {{< card link="journal-entries" title="📝 Journal Entries" subtitle="Record financial transactions — adjustments, accruals, reclassifications, and corrections" >}}
  {{< card link="bank-reconciliation-guide" title="🏦 Bank Reconciliation" subtitle="Match bank statements to system records — detect discrepancies and ensure accuracy" >}}
{{< /cards >}}

**Typical daily workflow:**
1. Record journal entries for non-automated transactions
2. Review and approve pending entries
3. Reconcile bank transactions against statements
4. Investigate and resolve discrepancies

---

## ⚠️ Common Scenarios / Pitfalls

Watch out for these frequent accounting issues:

| Scenario | What Happens | How to Handle |
|----------|-------------|---------------|
| **Unbalanced journals** | Debit ≠ Credit, entry rejected | Double-check amounts before posting |
| **Wrong period posting** | Transaction appears in wrong month | Verify posting date matches correct period |
| **Duplicate entries** | Inflated balances | Search for existing entries before creating new ones |
| **Missed bank items** | Reconciliation won't balance | Check date range and filter settings |
| **Opening balance errors** | Reports incorrect from day one | Verify trial balance after migration |

{{< callout type="warning" >}}
**Month-End Reminder**: Always complete bank reconciliation before running monthly financial reports. Unreconciled items will cause report discrepancies.
{{< /callout >}}

---

## 📊 Reporting Usage

Generate and analyze your financial statements.

{{< cards >}}
  {{< card link="financial-reporting" title="📊 Financial Reporting" subtitle="Generate Balance Sheet, Profit & Loss, Trial Balance, and Cash Flow statements" >}}
{{< /cards >}}

**Available Reports:**
- **Trial Balance** — Verify all accounts balance before month-end close
- **Profit & Loss Statement** — Revenue and expenses for any period
- **Balance Sheet** — Snapshot of financial position at any date
- **Cash Flow Statement** — Cash movements by operating, investing, and financing activities
- **General Ledger Report** — Detailed transaction listing per account

**Reporting tips:**
- Run Trial Balance first to check for imbalances
- Use date range filters to match your reporting period
- Compare against prior periods to spot anomalies
- Export to Excel for further analysis

---

## Related Resources

- **[Financial Accounting Module](/modules/financial-accounting/)** — Module overview and capabilities
- **[Chart of Account Applet](/applets/chart-of-account-applet/)** — Applet reference documentation
- **[General Ledger Applet](/applets/general-ledger-applet/)** — Transaction ledger reference
- **[Advanced Financial Reporting](/guides/advanced/financial-reporting/)** — Power-user analytics and custom reports
- **[Compliance & Audit](/guides/advanced/compliance-audit/)** — Regulatory compliance and audit preparation