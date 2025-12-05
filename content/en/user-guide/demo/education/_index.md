---
title: "UTM Integrated Financial System Evaluation Guide"
description: "Step-by-step test scripts for evaluating BigLedger's SAGA-compliant Integrated Financial System"
weight: 25
bookCollapseSection: false
---

## Welcome, Evaluators!

Thank you for taking the time to evaluate the **BigLedger Integrated Financial System** for Universiti Teknologi Malaysia (UTM). This guide will walk you through each module with clear, step-by-step instructions.

{{< callout type="info" >}}
**Estimated Total Evaluation Time:** 2-3 hours for all modules, or 15-20 minutes per module if evaluating individually.
{{< /callout >}}

---

## Before You Start

### Who Is This Guide For?

This guide is designed for **all evaluators**, regardless of accounting background:
- **Finance professionals** - You'll find detailed test scenarios aligned with SAGA requirements
- **IT administrators** - Look for integration, security, and technical specifications
- **Management** - Focus on dashboards, reports, and ease of use
- **Non-technical evaluators** - Follow the step-by-step instructions; we explain everything

### Quick Glossary

Not familiar with accounting terms? Here's a quick reference:

| Term | Simple Explanation |
|------|-------------------|
| **General Ledger (GL)** | The main record book of all financial transactions |
| **Chart of Accounts** | The list of all account categories (like folders for organizing money) |
| **SAGA** | Standard Accounting System for Government Agencies - Malaysia's government accounting rules |
| **Vote Book (Buku Vot)** | Government budget tracking - ensures you don't overspend |
| **Accounts Payable (AP)** | Money you owe to suppliers (bills to pay) |
| **Accounts Receivable (AR)** | Money owed to you (invoices sent, waiting for payment) |
| **E-Invoice** | Electronic invoice required by LHDN (Malaysian tax authority) |

---

## Step 1: Access the Demo System

### Get Your Login Credentials

{{< callout type="warning" >}}
**Action Required:** Contact our demo coordinator to receive your login details.
{{< /callout >}}

**Contact:** fatimah@bigledger.com

Once you receive your credentials, you'll have access to one of these accounts:

| Role | What You Can Do |
|------|-----------------|
| **Finance Officer** | Create transactions, invoices, payments, and run reports |
| **Finance Manager** | Everything above, plus approvals and advanced reports |

**Demo URL:** [https://akaun.com](https://akaun.com)

### Login to the Demo

1. **Open your browser** and go to: [https://demo-v1.bigledger.com](https://demo-v1.bigledger.com)
2. **Enter your email** and password (provided by our coordinator)
3. **Click "Sign In"**
4. You should see the main dashboard

{{< callout type="info" >}}
**Tip:** The demo contains sample data from a fictional university similar to UTM. Feel free to explore without worrying about breaking anything!
{{< /callout >}}

---

## Step 2: Understand What You're Evaluating

### What is BigLedger?

BigLedger is a **cloud-based financial management system** designed specifically for Malaysian organizations, including government agencies and universities.

**In simple terms:** It's like an online accounting system where your finance team can:
- Record all income and expenses
- Track budgets and ensure you don't overspend
- Generate reports for auditors and management
- Process payments and receipts
- Manage university assets

### Why Cloud-Based Matters

| Traditional System | BigLedger Cloud |
|-------------------|-----------------|
| Need to install on servers | Access from any browser |
| IT team maintains updates | We handle all updates automatically |
| Backup responsibility is yours | Automatic daily backups |
| Server downtime = no access | 99.9% uptime guarantee |
| Limited remote access | Work from anywhere |

---

## Step 3: Choose What to Evaluate

### Evaluation Modules

Each module below has its own test script. **Click on any module to start evaluating:**

{{< cards >}}
  {{< card link="general-ledger" title="General Ledger & Chart of Accounts" subtitle="Start here - the foundation of all accounting" >}}
  {{< card link="budget-management" title="Budget & Vote Book" subtitle="Essential for government budget control" >}}
  {{< card link="accounts-payable" title="Accounts Payable (Payments)" subtitle="How you pay your suppliers" >}}
  {{< card link="accounts-receivable" title="Accounts Receivable (Collections)" subtitle="How you collect money owed" >}}
  {{< card link="journal-module" title="Journal Entries" subtitle="Recording adjustments and corrections" >}}
  {{< card link="cash-management" title="Cash & Banking" subtitle="Managing bank accounts and reconciliation" >}}
  {{< card link="asset-management" title="Asset Management" subtitle="Track equipment, furniture, and property" >}}
  {{< card link="financial-reporting" title="Financial Reports" subtitle="Generate statements and compliance reports" >}}
  {{< card link="user-access-control" title="Security & Access Control" subtitle="User permissions and audit trails" >}}
  {{< card link="tax-management" title="Tax Configuration" subtitle="SST, withholding tax, and e-invoice" >}}
{{< /cards >}}

{{< callout type="info" >}}
**Recommended Starting Point:** If you're new to the system, start with **General Ledger & Chart of Accounts** - it's the foundation that all other modules build upon.
{{< /callout >}}

---

## Your Evaluation Checklist

Use this checklist to track your progress:

| Module | Status | UTM Requirements |
|--------|--------|------------------|
| General Ledger & Chart of Accounts | ⬜ Not Started | 9.18, 9.19 |
| Budget & Vote Book Management | ⬜ Not Started | 9.23-9.55 |
| Accounts Payable | ⬜ Not Started | 9.16b |
| Accounts Receivable | ⬜ Not Started | 9.16a |
| Journal Module | ⬜ Not Started | 9.21, 9.22 |
| Cash Management | ⬜ Not Started | 9.56 |
| Asset Management | ⬜ Not Started | 9.57-9.65 |
| Financial Reporting | ⬜ Not Started | 9.20 |
| User Access Control | ⬜ Not Started | 9.15 |
| Tax Management | ⬜ Not Started | 9.17 |

---

## What Makes BigLedger Different?

### Built for Malaysian Government & Universities

| Feature | Why It Matters |
|---------|----------------|
| **SAGA Compliant** | Meets all government accounting standards |
| **Malay & English** | Full bilingual support |
| **E-Invoice Ready** | Integrated with LHDN MyInvois Portal |
| **Multi-Campus** | Handle JB, KL, and other campuses in one system |
| **Vote Book** | Real-time budget control prevents overspending |

### Enterprise-Grade Security

| Security Feature | What It Means |
|-----------------|---------------|
| **Bank-Level Encryption** | Your data is protected like online banking |
| **Complete Audit Trail** | Every action is recorded for auditors |
| **Role-Based Access** | Staff only see what they need |
| **Auto-Logout** | Inactive sessions are logged out automatically |

---

## Need Help During Evaluation?

We're here to support your evaluation:

| Contact | Purpose |
|---------|---------|
| **fatimah@bigledger.com** | Demo access and coordination |
| **support@bigledger.com** | Technical questions |
| **sales@bigledger.com** | Business and pricing inquiries |

**Reference:** UTM Tender B.30/2024

---

## Ready to Start?

Click on the **General Ledger & Chart of Accounts** module below to begin your evaluation:

{{< cards >}}
  {{< card link="general-ledger" title="Start Evaluation: General Ledger" subtitle="Begin with the foundation of the financial system" >}}
{{< /cards >}}

