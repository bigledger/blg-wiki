---
title: "Deposit Applet"
description: "Integrated lifecycle management for Money Market (MM) deposit requisitions, registers, and strategic investment workflows"
tags:
- treasury-operations
- deposit-management
- interest-tracking
- financial-controls
- money-market
weight: 210
---

{{< callout type="warning" >}}
**Deposit Applet user guide still under progress**

**Work in Progress: This documentation is currently under development. Visual assets (screenshots) and further details will be added soon.**
{{< /callout >}}

### 🚀 TL;DR: What Is This Applet For?

**This applet is for placing your company's spare cash into fixed deposits at a bank — and keeping your accounting system fully in sync with what the bank holds.**

When a company has idle cash sitting in a current account earning nothing, the treasury team places it into a **Money Market (MM) deposit** at a bank to earn interest. The bank manages the actual money. This applet manages everything on your side: the request, the bank's confirmation details, the interest calculations, and the accounting entries — so your system always reflects the true state of your cash.

**The simple flow of how it works — step by step for a new employee:**

**Step 1 — Finance team decides to place cash** ✅ *in this applet*
> The finance team opens the **MM Deposit Requisition** and fills in how much they want to place, for how long, and what interest rate they expect. Think of it like filling in a form that says "we want to invest RM5 million for 3 months."

**Step 2 — System emails banks to compete for your money** ✅ *in this applet (bank responds via external link)*
> The finance team adds the banks they want to invite (e.g. Maybank, CIMB, RHB) in the **Invitee tab**. The system emails **each bank individually** with a secure link. Each bank clicks that link, fills in their offered interest rate and terms, and submits. Their response syncs back into the Invitee tab automatically — so you can see all offers side by side without any back-and-forth emails.

**Step 3 — Finance team picks the best offer and transfers the money** ⚠️ *cash transfer is external — done via your banking system or manually*
> The finance team compares the quotes and picks the best rate. The actual transfer of RM5 million to the bank is done **outside this applet** — through your company's internet banking or bank instruction. The bank then sends a **confirmation letter** with the agreed rate, start date, and maturity date.

**Step 4 — Finance team inputs the bank's confirmation into the system** ✅ *in this applet*
> The finance team opens the **MM Deposit Register**, creates a new entry, and inputs the details from the bank's confirmation letter. They click **FINAL** — and the system automatically calculates all the interest, creates the accounting journal entries, and starts tracking the deposit.

**Step 5 — At maturity, bank returns the money** ⚠️ *cash receipt is external — bank transfers back to your account*
> When the deposit matures, the bank transfers the principal + interest back to your company's bank account. This happens outside the applet. The finance team then records the receipt in the **Payment/Receipt tab**, or triggers a **Rollover** to place the money again automatically.

```
[THIS APPLET]  Finance team creates Requisition — defines amount, rate, duration
                    ↓
[THIS APPLET]  Invitee tab — system emails banks, banks submit quotes via link
                    ↓
[THIS APPLET]  Finance team compares quotes, selects best bank
                    ↓
[EXTERNAL: Your company's internet banking]  Actual RM transfer to bank
                    ↓
[EXTERNAL: Bank sends you a confirmation letter]  Rate, dates, amount confirmed
                    ↓
[THIS APPLET]  Finance team inputs confirmation → MM Deposit Register → FINAL
                    ↓
[THIS APPLET]  System auto-calculates interest, posts accounting entries automatically
                    ↓
[EXTERNAL: Bank transfers money back to your account at maturity]
                    ↓
[THIS APPLET]  Finance team records receipt (Payment/Receipt tab) or triggers Rollover
                    ↓
[OTHER APPLETS]  General Ledger + Financial Reports reflect updated cash position
```

**Related applets involved in this flow:**

| Applet | What it does in plain English |
| :--- | :--- |
| **This Applet (Deposit Applet)** | Manages the full deposit lifecycle — request, tracking, interest, rollover |
| **Internal Payment Voucher Applet** | Records the cash going OUT to the bank when you make the placement. Think of it as the "we paid the bank" receipt inside the system. |
| **Internal Receipt Voucher Applet** | Records the cash coming BACK from the bank at maturity. The "we received money from the bank" receipt. |
| **General Ledger Applet** | The master accounting book. All the automatic entries created by this applet end up here. Finance uses it to see the full picture of all money movements. |
| **Bank Reconciliation Applet** | A checking tool. It compares what your system says happened against what the bank's actual statement says. If they match, everything is correct. If they don't, something needs to be investigated. Think of it like checking your bank app against your own spending notes. |
| **Cashbook Applet** | Shows your company's overall bank account balances — including how much is currently locked up in deposits and unavailable for spending. |

| If you want to... | Use this section | Role |
| :--- | :--- | :--- |
| **Request a new deposit placement** and invite banks to submit quotes | **MM Deposit Requisition** | The **Request** |
| **Activate and monitor a live deposit** after a bank is chosen | **MM Deposit Register** | The **Live Asset** |
| **Organise deposits into groups** for reporting | **MM Deposit Category** | The **Label** |

---

## Purpose and Overview

The **Deposit Applet** centralizes and automates the company's short-term cash placement activities. It streamlines the entire process from raising Money Market (MM) deposit requisitions and comparing counterparty offers to managing live placements in the register and maintaining category metadata. It enforces strict form validation, complex interest rate logic, and permissioned state changes to ensure financial integrity.

**Important distinction**: The bank holds the actual money. This applet holds the mirror image of that money inside your accounting system. When the bank gives you a confirmation letter with the rate, amount, and maturity date — you input those details here. From that point, the system knows exactly how much cash is tied up, where, at what rate, and when it comes back. Your finance team always has an accurate picture of the company's full cash position without calling the bank.

Beyond just recording, the applet actively:
- **Calculates** interest and maturity amounts automatically — you don't do the math
- **Posts GL journal entries** automatically when a deposit is finalised — no manual journaling
- **Manages the competitive process** — emails multiple banks, collects their rate quotes back into the system for comparison
- **Handles renewal** — automatically rolls over deposits at maturity so cash is never sitting idle

### The "Fixed Deposit at a Bank" Analogy

Think of it exactly like placing a personal fixed deposit — but at a corporate scale with multiple banks competing for your business:

#### 1. MM Deposit Requisition (The Application Form)
*   **The Analogy**: You walk into a bank and fill in a **Fixed Deposit Application Form**. You write down how much you want to place, for how long, and what interest rate you expect. But instead of going to just one bank, you send this form to **multiple banks** and ask them to compete for your money.
*   **The Reality**: The Requisition is where you define the terms of the deposit (amount, duration, interest type) and invite counterparties (banks/financial institutions) to submit their quotes via a secure link.
*   **Accounting Importance**: This creates a formal, auditable record of the investment decision **before** any money moves. It prevents ad-hoc placements made over the phone with no paper trail.

#### 2. MM Deposit Register (The Active Deposit Certificate)
*   **The Analogy**: Once you pick the best bank offer, they give you a **Fixed Deposit Certificate**. This certificate shows your principal, the interest rate, the maturity date, and every interest payment you receive along the way.
*   **The Reality**: The Register is the live record of the active deposit. It tracks the principal, calculates interest, generates accounting transactions automatically, and manages the rollover when the deposit matures.
*   **Accounting Importance**: Every interest earned is automatically posted to the correct GL account. Without this, the finance team would have to manually journal every interest receipt — a major source of errors.

| Feature | **MM Deposit Requisition** | **MM Deposit Register** |
| :--- | :--- | :--- |
| **Stage** | Before placement | After placement (live) |
| **Purpose** | Define terms, collect bank quotes | Track the active deposit |
| **Analogy** | The Application Form | The FD Certificate |
| **Key Action** | Invite banks, compare offers | Generate transactions, manage rollover |

{{< callout type="info" >}}
**Core Concept**: The system manages the transition from a **Requisition** (the request for placement) to the **Register** (the active financial asset), ensuring consistent interest calculation and auditability at every step.
{{< /callout >}}

---

## Key Features Overview

### Who Benefits from This Applet?

**Treasury Managers:**
- Efficiently prepare and approve placements
- Compare fixed vs. floating interest offers from multiple counterparties
- Manage renewal and rollover strategies with automated assistance
- Maintain a balanced investment ladder

**Finance Controllers:**
- Ensure GL and currency integrity across all transactions
- Standardize rounding and formatting for financial reports
- Maintain a complete, immutable audit trail of all modifications
- Enforce strict SAVE and FINAL governance rules

**Financial Analysts:**
- Review interest rate effectiveness over time
- Export consistent, formatted listings for stakeholders
- Analyze deposit categories to optimize cash placement strategies
- Monitor transaction histories including inflation and compound adjustments

### What Problems Does This Solve?

**The Manual Spreadsheet Risk:**

Managing deposits across multiple banks using ad-hoc spreadsheets leads to significant operational risks:
- Fragmented records of counterparty offers and email-based quotes
- Manual calculation errors in interest rates and maturity amounts
- Inconsistent GL mapping leading to month-end reconciliation headaches
- Lack of visibility into maturity dates, resulting in stagnant cash
- Difficulties in maintaining a reliable audit trail for compliance

**The Deposit Applet Solution:**

- **Centralized Requisition Workflow** - Consolidate all investment requests and invitee quotes in one place
- **Mutually Exclusive Interest Logic** - Support for both FIXED and FLOATING rates with automated computation
- **Automated Transaction Generation** - System-generated placements, interest, and inflation entries upon finalization
- **Strict Data Parity** - Ensures invitee details match requisition constraints, preventing data drift
- **Strategic Auto-Rollover** - Configurable logic to keep funds invested according to schedule until stopped

---

## Key Concepts

### Understanding Interest Logic

The applet supports two distinct interest types, each with its own validation and behavior:

| Interest Type | Behavior | Key Fields |
|---------------|----------|------------|
| **Fixed** | You define a static percentage rate that does not change for the life of the deposit. | Interest Rate (%) |
| **Floating** | The rate moves with a market reference (e.g. KLIBOR) plus a margin you negotiate. | Ref Value + Ref Delta |

**Plain English**: Fixed = "the bank pays me 3.5% no matter what." Floating = "the bank pays me KLIBOR + 0.5%, so if KLIBOR goes up, I earn more."

{{< callout type="tip" >}}
**Precision Rule**: The system enforces programmatic rounding to two decimals for all interest rates and effective values to prevent floating-point artifacts and ensure audit consistency.
{{< /callout >}}

### The Requisition-to-Register Flow

The lifecycle of a deposit moves through clear stages:

```
MM Deposit Category (grouping label)
│
├── MM Deposit Requisition (DRAFT/TEMP)
│   ├── Define terms: amount, currency, interest type, dates
│   └── Invite counterparties to submit quotes (Invitee tab)
│       │
│       └── Requisition (FINAL) ──→ Lock details, quotes collected
│           │
│           └── MM Deposit Register ──→ Select requisition, activate placement
│               ├── Transactions auto-generated (Placement, Interest, Compound)
│               ├── Payment/Receipt recorded
│               └── Maturity → Rollover or Settlement
```

---

## Detailed Menu & Tab Explanation

The applet has three main sections accessible from the sidebar.

---

## 1. MM Deposit Requisition

This is where you **request** a new deposit placement and collect quotes from banks.

**Think of it as**: Sending out a tender to multiple banks — "we have RM5 million to place for 3 months, who gives us the best rate?"

### Requisition — Details Tab

The core form for defining the deposit terms.

| Field | What it is |
|-------|-----------|
| **Deposit Name** | A descriptive name for this placement (e.g. "Q2 2026 Short Term Placement") |
| **Deposit Code** | A short reference code for internal tracking |
| **Company** | Which company entity is making the placement |
| **GL Code** | Short for "General Ledger Code." Think of it as a **category label for your accounting book**. Every transaction in a company is filed under a code so the system knows which "bucket" it belongs to (e.g. "Short Term Investments" or "Cash at Bank"). This is auto-filled based on the Company you select. |
| **Currency** | The currency of the deposit |
| **Amount Initial Deposit** | How much cash you are placing |
| **Amount Upon Maturity** | Auto-calculated: what you get back at the end (principal + interest). You don't type this — the system works it out. |
| **Interest Type** | The category of interest (e.g. Simple, Compound) |
| **Interest Payout Frequency** | How often interest is paid — monthly, quarterly, or only at the end when the deposit matures |
| **Interest Calculation** | **FIXED** = the rate stays the same for the whole deposit. **FLOATING** = the rate moves with a market benchmark (like a base rate set by the central bank). |
| **Interest Rate %** | Your agreed rate (for FIXED only). e.g. 3.75% per year. |
| **Ref Type / Source / Delta / Value** | For FLOATING rate only — which market benchmark to follow, and by how much to add on top of it. e.g. "KLIBOR + 0.5%" |
| **Interest Rate Effective %** | The actual final rate after applying the benchmark + delta. Read-only, calculated by the system. |
| **Interest Convert to Principal** | If YES, the interest you earn gets added back to your deposit amount, so next period you earn interest on a bigger amount. This is called **compounding** — your money grows faster. |
| **Est Start Date / Est End Date** | The planned start and end of the deposit period |
| **Term (Days)** | How many days the deposit runs. Auto-calculated from the dates — you don't type this. |
| **Inflation Rate** | Optional. If you want to track the real value of your return after accounting for rising prices. Most users leave this blank. |
| **Auto Rollover Logic** | What happens automatically when the deposit matures. See the Rollover section below. |

### Requisition — Invitee Tab

*(Appears after the record is saved, not in TEMP status)*

*   **What it is**: A list of banks or financial institutions you are inviting to submit their deposit rate quotes.
*   **The Analogy**: The **Tender Invitation List** — you send each bank a secure link, they log in and submit their offered rate, and it flows back into this tab for comparison.
*   **Key Actions**:
    *   **Add Invitee** — Enter the bank's name and email address.
    *   **Edit Invitee** — Update contact details or review submitted quotes.
*   **Accounting Importance**: Creates a documented, competitive selection process. If an auditor asks "why did you choose Bank X over Bank Y?", the Invitee tab shows all offers received and the rates submitted.

{{< callout type="warning" >}}
Once a Requisition is set to **FINAL**, the interest type and core terms are locked. This preserves the integrity of the counterparty agreement.
{{< /callout >}}

---

## 2. MM Deposit Register

This is where you **activate and monitor** a live deposit after selecting a bank from the requisition quotes.

**Think of it as**: The actual Fixed Deposit Certificate — the live record of money that is currently placed at a bank, earning interest.

### Register — Details Tab

Contains all the same core fields as the Requisition (amount, interest, dates) plus additional fields that only apply once the deposit is live:

| Additional Field | What it is |
|-----------------|-----------|
| **Financial Institution** | The specific bank where the money is placed (e.g. Maybank, CIMB) |
| **Deposit Category** | The group/folder this deposit belongs to (from MM Deposit Category). e.g. "Short Term" or "USD Placements" |
| **Deposit Status** | Current state of the deposit: ACTIVE (running), INACTIVE (ended), etc. |
| **Interest Amount** | Total interest you will earn over the full deposit period. Auto-calculated. |
| **Interest Earned** | How much interest has actually been received so far (for deposits that pay out in multiple instalments) |
| **Rollover Options** | Specific settings for what happens at renewal — appears only when Auto Rollover is set to YES |
| **GL Code for Interest** | The accounting category where interest income gets filed. Think of it as telling the system "when we earn interest, put it in the 'Interest Income' bucket." |
| **GL Code for Interest Expense** | The accounting category for any interest costs (rare for deposits, but used in some structures). "When we pay interest costs, put it in the 'Interest Expense' bucket." |
| **Collaterals** | Any assets pledged as security for this deposit arrangement |
| **Approval Workflow** | The chain of people who need to approve this deposit before it goes live |
| **Description / Supervisor Remarks** | Free-text notes for internal reference |

### Register — Transactions Tab

*(Appears after the record is saved, not in TEMP status)*

*   **What it is**: An auto-generated ledger of every financial transaction created by this deposit — the initial placement, each interest payment, and any compound entries.
*   **The Analogy**: The **transaction history** on your bank statement for this specific FD account.
*   **Accounting Importance**: These transactions are the actual journal entries posted to the GL. When the register is set to FINAL, the system automatically creates: (1) a Placement transaction (cash out), (2) Interest transactions (income), and (3) Compound transactions if interest converts to principal. Finance does not need to manually journal any of these.

### Register — Payment/Receipt Tab

*(Appears after the record is saved, not in TEMP status)*

*   **What it is**: Records of actual cash movements — money paid out to place the deposit, and money received back (principal + interest) at maturity or on interest payment dates.
*   **The Analogy**: The **bank receipts** — proof that the money actually moved, as opposed to the Transactions tab which shows the accounting entries.
*   **Accounting Importance**: Reconciles the accounting entries (Transactions tab) against actual bank movements. If the GL shows interest income but no receipt was recorded, there is a reconciliation gap.

### Register — Attachment Tab

*(Appears after the record is saved, not in TEMP status)*

*   **What it is**: File uploads for supporting documents — the bank's FD confirmation letter, the signed placement agreement, bank statements, etc.
*   **Accounting Importance**: Supporting documents are required for audit purposes. The FD confirmation letter from the bank is the primary evidence that the placement exists and the terms are as recorded.

### Register — Rollover Tab

*(Appears after the record is saved, not in TEMP status)*

*   **What it is**: Settings and history for what happens automatically when the deposit matures.
*   **What is a Rollover?** When your deposit reaches its end date, you have two choices: (1) take the money back, or (2) place it again immediately into a new deposit. Choosing option 2 is called a **rollover** — like renewing a subscription automatically instead of cancelling and re-subscribing manually.
*   **Why it matters**: If you don't set up a rollover, the money sits in your current account doing nothing between the old deposit ending and the new one starting. Even a few days of idle cash at corporate scale means lost interest income.
*   **Key Options**:
    *   **Principal only** — only your original amount (e.g. RM5 million) rolls into the new deposit. The interest earned (e.g. RM15,000) gets paid out to your account separately.
    *   **Principal + Interest** — the full maturity amount (RM5,015,000) rolls into the new deposit. Next period you earn interest on the bigger amount. This is compounding — your money grows faster over time.
*   **Accounting Importance**: Prevents **cash drag** — idle cash between maturity and the next placement earns nothing. Auto-rollover ensures continuous investment without manual intervention each time.

### Register — Action Buttons

| Button | When it appears | What it does |
|--------|----------------|--------------|
| **Select Requisition** | When not yet FINAL and not INACTIVE | Links this register entry to an approved requisition, importing its terms |
| **SAVE** | When not yet FINAL | Saves the current state as a draft |
| **FINAL** | When status is ACTIVE and not yet FINAL | Activates the deposit — auto-generates all Placement, Interest, and Compound transactions |
| **DELETE** | On draft entries (bottom of page) | Permanently removes the register entry. Requires a second click to confirm. |

{{< callout type="warning" >}}
Clicking **FINAL** on the Register is the most consequential action in this applet. It triggers automatic GL transaction generation. Ensure all details — especially the GL codes and interest rate — are correct before finalising.
{{< /callout >}}

---

## 3. MM Deposit Category

*   **What it is**: A simple master data list for grouping and labelling deposits. Each category has a Code, Name, and Description.
*   **The Analogy**: **Folders** for your deposits. You might have categories like "Short Term (< 3 months)", "Medium Term (3–12 months)", or "USD Placements" — so you can filter and report by group.
*   **Why it matters**: Without categories, all deposits appear in one undifferentiated list. With categories, treasury managers can quickly see "how much do we have in short-term placements right now?" without manually filtering.
*   **Action Buttons**: SAVE, FINAL (locks the category), DELETE (with confirmation).

---

## Quick Start Guide

### For Treasury: Creating a Placement Request

**Goal:** Set up a new deposit requisition and collect bank offers.

1. **Navigate**: Go to **MM Deposit Requisition** and click **"+"**.
2. **Fill Details Tab**: Enter Deposit Name, Code, Company, Currency, and Amount.
3. **Configure Interest**:
   - Select **FIXED** → enter the Interest Rate %.
   - Select **FLOATING** → enter the Reference Type, Source, and Delta %.
4. **Set Dates**: Enter Est Start Date and Est End Date. Term (Days) calculates automatically.
5. **Set Rollover**: Choose Auto Rollover Logic (Principal only or Principal + Interest).
6. **Save**: Click **SAVE** to create the record.
7. **Add Invitees**: Go to the **Invitee** tab → click **"+"** → enter each bank's name and email.
8. **Finalise**: Click **FINAL** to lock the requisition and automatically email all invitees with their secure quote submission link.

---

### For Finance: Activating a Live Deposit

**Goal:** Convert an approved requisition into a live deposit register entry.

1. **Navigate**: Go to **MM Deposit Register** and click **"+"**.
2. **Select Requisition**: Click **Select Requisition** and choose the approved requisition.
3. **Verify Details**: Confirm the Financial Institution, GL Codes, and interest terms are correct.
4. **Assign Category**: Select the appropriate **Deposit Category**.
5. **Save**: Click **SAVE** to create the draft register entry.
6. **Finalise**: Click **FINAL** to activate — the system auto-generates all Placement, Interest, and Compound transactions.
7. **Monitor**: Use the **Transactions** tab to verify all GL entries were created correctly.

---

## Configuration & Settings

### Default Selection
Set the default Branch and Location pre-filled when creating new records.

### Application Settings (Field Configuration)
Toggle visibility of optional fields:

| Setting Group | Options |
|--------------|---------|
| **Lines Settings** | Unit Discount, SST/VAT/GST, WHT, Blanket Order |
| **Department Settings** | Segment, G/L Dimension, Profit Centre, Project |

### Email Template
Configure the email sent to bank invitees when a Requisition is finalised — including the subject line, body text, and the secure quote submission link.

### Printable Format Settings
Configure the layout and content of printed deposit documents for record-keeping and audit submission.

---

## FAQ

**Q: Why is the FINAL button disabled?**
A: The FINAL button requires the form to be fully valid — all required fields filled and no validation errors. Check that Company, GL Code, Currency, Amount, Interest Rate, and Dates are all complete.

**Q: Can I change a deposit from Fixed to Floating after finalisation?**
A: No. Once a record reaches FINAL state, the interest type is locked to preserve the audit trail and counterparty agreement terms.

**Q: What transactions does FINAL automatically generate on the Register?**
A: The system creates: (1) a **Placement** transaction (the cash going out to the bank), (2) **Interest** transactions for each payout period, and (3) **Compound** transactions if "Interest Convert to Principal" is enabled.

**Q: What happens when an invitee receives the invitation email?**
A: They receive a secure, expiring link that lets them submit their quoted rate directly into the system. Their submission syncs back to the Invitee tab in your Requisition for comparison.

**Q: What is the difference between Transactions and Payment/Receipt tabs?**
A: **Transactions** are the accounting journal entries (what the GL records). **Payment/Receipt** are the actual cash movements (what the bank processed). Both should match — if they don't, there is a reconciliation issue to investigate.

**Q: What does Auto Rollover do exactly?**
A: When the deposit matures, instead of the money sitting idle, the system automatically creates a new Register entry. You choose whether to roll over the original principal only, or the full maturity amount (principal + interest earned).

**Q: Can I delete a finalised deposit?**
A: No. Once FINAL, the record cannot be deleted — only voided or marked inactive. This preserves the audit trail of the investment decision and the GL transactions it generated.

---
