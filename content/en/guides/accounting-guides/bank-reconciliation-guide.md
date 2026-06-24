---
title: Bank Reconciliation Guide
description: Match your March bank statement to BigLedger, find the variance, post the fix, and save the audit pack in about 30 minutes.
tags:
- user-guide
- accounting
- bank-reconciliation
weight: 30
---

By the end of this guide, you will have matched every line on your primary bank's March 2026 statement to your BigLedger cashbook, found the RM 450 difference that has been bothering your finance manager all week, posted the journal that explains it, and saved an audit pack ready for Friday's sign-off. Plan on about 30 minutes the first time you do this for a cashbook; once the routine sticks, you will be in and out in 15. You will work mostly in the Bank Reconciliation applet, with brief detours to the Cashbook and Ledger and Journal applets when the variance needs a fix.

## Meet GadgetSphere

GadgetSphere Sdn Bhd runs 22 consumer-electronics branches across Malaysia, with most receipts banking into the primary-bank account for each store. This morning the March 2026 statement for the Klang Valley branch 01 cashbook (GS-KV-01) landed in your inbox. The bank says the closing balance is RM 47,200; BigLedger says RM 47,650. The RM 450 gap has to be explained, the reconciliation has to be closed, and the audit pack has to sit on the finance manager's desk before Friday.

{{< callout type="info" >}}
Bank reconciliation is a comparison, not a calculation. Your job is to pair what BigLedger thinks happened with what the bank says happened, then explain every difference with a real journal. If you ever find yourself "adjusting the balance" without a journal, stop — you are hiding the problem, not solving it.
{{< /callout >}}

## A few terms to get straight

- **Reconciliation session** — one row that holds the work for a single cashbook over a single date range. It carries the four balances (your opening and closing, the bank's opening and closing) and is what you create, fill, and eventually mark Reconciled.
- **Cashbook line vs. cash statement line** — a cashbook line is what BigLedger thinks happened (a receipt, payment, or POS settlement that posted to the cashbook). A cash statement line is what the bank says happened (one row imported from the bank file). Reconciliation pairs the two.
- **Confirmed link vs. possible link** — a confirmed link is a saved pairing between a cashbook line and a statement line. A possible link is a candidate the auto-matcher found but is not confident enough to save on its own, so it parks the suggestion for you to review and confirm.

## Before you start

- The Chart of Accounts is set up and your sales, purchase, and POS (Point of Sale) documents are posting cleanly. See the Chart of Accounts Setup Guide if you are not sure.
- The cashbook for the branch you are reconciling exists in the Cashbook applet. For this guide, the cashbook code is GS-KV-01 and it points to your primary-bank current account.
- All settlement methods used by Receipt Voucher (Internal), Payment Voucher (Internal), and in-store POS terminals for GS-KV-01 already post to that same cashbook. If they post somewhere else, fix that first or your variance hunt will go nowhere.
- The company timezone is set to Asia/Kuala_Lumpur in the Organisation applet. Reconciliation uses this to decide which transactions fall inside March 2026.
- The February 2026 reconciliation for GS-KV-01 has been completed and marked Reconciled, so the March opening balance has something to inherit.
- Your March 2026 bank statement file is downloaded and ready, in either your primary bank's native format or the generic CSV (Comma-Separated Values) format.
- You have the Finance Manager or Accounts Clerk role, which grants the ability to create reconciliations and to confirm or undo matches. If you only have read-only access, ask your administrator before you start.

## Step 1: Confirm the cashbook is wired to the right bank account

*Master Data > Cashbook*

Open the Cashbook applet and find GS-KV-01. Check three things before you touch the reconciliation screen.

First, the cashbook's company is GadgetSphere Sdn Bhd (GS), the branch is Klang Valley 01, the currency is Malaysian Ringgit (RM), and the linked General Ledger account reads CASH-PRI-KV01 (cash, primary bank, KV branch 01).

Second, scroll to the settlement-method links and confirm that the POS card terminal, POS cash drawer, in-branch Receipt Voucher (Internal — the in-branch counterpart of the supplier-facing Payment Voucher, used by your cashiers and accounts clerks), and in-branch Payment Voucher (Internal) all point to GS-KV-01. If any of them point to a different cashbook, the receipts will never appear on this reconciliation and the variance hunt will lead you in circles.

Third, scroll to the automatching weightage section and confirm there is an active row. Without it, the auto-matcher falls back to a strict generic setting and almost everything ends up as a possible match instead of a confirmed one.

Fix anything wrong here before moving on. A misrouted settlement method is the single most common reason a reconciliation refuses to close.

If you see receipts in the branch's daily takings report that are missing from this cashbook, a settlement method is almost certainly wired to a different cashbook. Fix the mapping in Cashbook first, then come back.

## Step 2: Create the March 2026 reconciliation session for GS-KV-01

*Bank Reconciliation > New*

From the sidebar, open Bank Reconciliation. You should see February 2026 sitting at the top of the list as Reconciled. Click **New**. A two-step wizard appears.

On the first step (Cashbook Listing), pick GS-KV-01 from the list. The Company column reads GS and the Branch column reads KV-01; both are read-only because they are derived from the cashbook. Click **Next**.

The Details form opens. Stop here for a moment and read the page title bar; it should clearly show GS-KV-01. You cannot change the cashbook later without deleting the whole session, so getting this right now matters. If you accidentally picked the wrong cashbook, close the wizard with the X (do not save) and start again.

Once you are sure you have the right cashbook, you are ready to set the period.

If **New** does not appear, you are probably signed in with a read-only role. Ask your administrator to grant the Finance Manager or Accounts Clerk role before you continue.

## Step 3: Set the period and enter the four balances

*Bank Reconciliation > (your new session) > Details*

Set Opening Date to 1 March 2026 and Closing Date to 31 March 2026. The Name field auto-fills to March 2026 from the Opening Date. Leave it unless your team uses a different naming style.

Now the four balance fields. Two clickable hint chips appear beneath Cash Book Transaction Opening Balance and Cash Statement Opening Balance. Both are pulled from February's closing values for this cashbook. Click each chip to copy in the suggested number; for GS-KV-01, the February closing was RM 41,830 on both sides, so both opening fields land on RM 41,830.

Now type in the Cash Statement Closing Balance from your bank statement: RM 47,200. Leave Cash Book Transaction Closing Balance alone; it is read-only on this screen and will be calculated for you. The Status field defaults to Processing, which is correct for now. Do not change it until the work is done.

If the hint chip is empty or wrong, the February session was never marked Reconciled or its closing date is not 28 February 2026. Fix February first; otherwise March will inherit a bad opening balance.

## Step 4: Save and check the calculated cashbook balance

*Bank Reconciliation > (your new session) > Details > Save*

Click **Save**. BigLedger now adds up every active cashbook movement for GS-KV-01 dated 1 March to 31 March (in your Kuala Lumpur timezone) and writes the result into Cash Book Transaction Closing Balance. Voided receipts, payments, and POS settlements are excluded automatically.

Re-open the Details tab. You should now see your side: Cash Book Transaction Opening RM 41,830, Cash Book Transaction Closing RM 47,650. Compare against the bank side: Cash Statement Opening RM 41,830, Cash Statement Closing RM 47,200. Openings match. Closings disagree by RM 450 (47,650 minus 47,200). That is exactly the gap your finance manager flagged.

Make a note: BigLedger thinks GS-KV-01 has RM 450 more than the bank does. The variance must therefore be either a cashbook line the bank has not honoured yet, or a bank charge the bank already took but you have not posted.

If your closing comes out wildly different from what you expected (more than the RM 450 you already know about), check whether a January or February voucher was back-dated into March. Fix the source date and re-save.

## Step 5: Upload the March bank statement

*Bank Reconciliation > (your session) > Upload Statement*

Switch to the Upload Statement tab and click **Add**. Choose your primary bank's format from the Import Format list. BigLedger has built-in parsers for the major Malaysian banks; if your bank is not on the list, pick Default Format and use the generic CSV importer.

Bank Statement Name pre-fills from the file name; rename it to something like `2026-03 Primary KV01` so future-you can find it again. Drag in the statement file and click **Upload**. The parser runs and reports a row count; for the March GS-KV-01 statement, you should see around 180 lines.

Open the Cash Statement sub-tab and scan the parsed rows. Each row shows the bank's transaction date, description, reference, and amount. If you see no rows at all, the parser hit an error; the most common cause is choosing the wrong bank format. Delete the file, pick the right format, and re-upload.

Once you can see your statement lines, you are ready to let BigLedger do the heavy matching.

If you are using the Default Format helper and rows show validation errors, fix them in the Checking sub-tab; rows with errors will not be promoted into the reconciliation.

## Step 6: Run Auto Matching and wait for it to finish

*Bank Reconciliation > (your session) > Auto Matching > Run*

Switch to the Auto Matching tab and click **Run**. The button greys out and a small Processing indicator appears. The matcher is now scoring every possible pairing of cashbook line to bank statement line using the weights you set up in Cashbook (date, amount, reference, payee).

High-confidence pairs are saved as confirmed matches. Mid-confidence pairs are parked as possible matches for you to review. Low-confidence pairs are dropped. For a typical GS-KV-01 month with about 180 statement lines, this finishes in under a minute.

Wait until the Processing indicator clears before doing anything else; running the reports while the matcher is still working will give you nonsense numbers. When it clears, the screen will tell you how many lines auto-matched (you should expect 90 percent or higher on a well-configured cashbook), how many are sitting as possible matches, and how many are still unmatched on either side. Note those numbers down before moving on.

If the Processing indicator does not clear within 5 to 10 minutes, the background job queue is backed up. Wait, then re-check; do not run the reports prematurely.

## Step 7: Confirm or reject the possible matches

*Bank Reconciliation > (your session) > Manual Matching > Reconcile*

Open the Manual Matching tab and stay on Reconcile mode. The Cashbook Transaction Lines list shows each unmatched cashbook line with its best candidate statement line beside it. Walk down the list.

For each row, eyeball four things: date within a day or two, amount matches to the cent, reference looks right (your receipt or payment number on one side and the bank's transfer reference on the other), and the payor or payee name is recognisable. If all four agree, tick the candidate and click **Reconcile**. The pair becomes a confirmed match and disappears from this list.

If the candidate is clearly wrong (for example, the matcher paired your RM 1,200 supplier payment with a RM 1,200 customer receipt because the amount was identical), untick it and either pick a better one from the candidate list or leave the row for the next step.

Work top to bottom. Most months for GS-KV-01 will leave you with a handful of true exceptions, plus the RM 450 you are still hunting.

If you confirm a wrong pair by accident, switch to the Unreconcile sub-tab, find the pair, and undo it before you continue; ghost matches will distort Report 1 later.

## Step 8: Find the RM 450 variance and post the adjustment journal

*Bank Reconciliation > (your session) > Manual Matching > Bank Statement Lines, then Finance > Ledger and Journal*

Switch to the Bank Statement Lines sub-tab and filter for unmatched lines. The list should now be short. Look for a line on the bank side that has no partner on the cashbook side: in this scenario, you spot a 31 March entry for RM 450 with the description `Quarterly Account Maintenance`. That is the bank's quarterly service charge, which the bank has already deducted from your account but which has not been booked in BigLedger. This is the RM 450 you are looking for.

Open the Ledger and Journal applet in a new tab. Create a manual journal dated 31 March 2026:

- Debit EXPENSE-BANK-CHARGES (bank charges expense) RM 450
- Credit CASH-PRI-KV01 (cash, primary bank, KV branch 01) RM 450
- Description: `Mar 2026 quarterly service charge - primary bank GS-KV-01`

Post the journal. Return to the reconciliation, re-run Auto Matching (Step 6), and the new cashbook line should pair up with the bank's RM 450 charge automatically. The two closing balances now both read RM 47,200. Variance closed.

If you reconcile a cashbook line and then void its source document later, the link will be left dangling and the next reconciliation will look wrong; always Unreconcile first, then void.

## Step 9: Generate Reports 1, 2 and 3 as the audit pack

*Bank Reconciliation > (your session) > Report*

Open the Report tab. Three reports are available:

- **Report 1 (Journal vs Bank Statement)** lists every cashbook line for the period beside the bank statement line it was matched to, with the period variance at the bottom.
- **Report 2** is the detailed reconciliation schedule, useful when an auditor asks you to walk through individual matches.
- **Report 3** is the high-level outcome summary that shows the four balance positions and confirms the closing variance is zero.

Generate all three. For each one, export as PDF and save into your shared finance folder under `2026-03 Bank Recon / GS-KV-01 /` together with the original bank statement file and the supporting journal voucher from Step 8.

Open Report 3 and double-check the bottom line: Cash Book Closing RM 47,200, Bank Statement Closing RM 47,200, Variance RM 0. If Report 3 still shows a non-zero variance, do not save the pack; go back to Step 6 because either Auto Matching has not finished or you have a stray unmatched line. The audit pack must reconcile to zero before you stop.

If Report 1 contradicts what you see on screen, Auto Matching probably has not finished its background work; wait, then regenerate.

## Step 10: Mark the session Reconciled and lock the period

*Bank Reconciliation > (your session) > Details > Status*

Return to the Details tab. Change the Status field from Processing to Reconciled and click **Save**. The session moves out of your active work list.

From this moment on, any later voucher that gets back-dated into March will not change your matched lines, but it will distort the next period's opening balance, so part of the controller's job is to keep an eye on the GS-KV-01 cashbook for any back-dated entries between now and April's close.

Best practice for GadgetSphere: at the end of each calendar quarter, the controller revokes the Finance Manager's ability to undo matches in closed periods, leaving only the controller role with that capability. That stops a well-meaning clerk from quietly unpicking last month's work.

Send a short note to your finance manager confirming March 2026 GS-KV-01 is reconciled with zero variance, point them at the audit pack folder, and you are done.

If Save fails with a permission error, your role can create reconciliations but not finalise them; ask the controller to do the final status change.

## What success looks like

Open Report 3 for the March 2026 GS-KV-01 reconciliation. The Cash Book Closing Balance and the Bank Statement Closing Balance both read RM 47,200 and the Variance line reads RM 0. The session Status is Reconciled. In your shared finance folder, the bank statement file, Report 1, Report 2, Report 3, and the bank-charges adjustment journal voucher are all sitting together. If any of those five items is missing or any number is off, you are not done yet.

## Common mistakes

| Symptom | Cause | Fix |
|---|---|---|
| The variance grows every month instead of shrinking. | A settlement method (POS card terminal, in-branch receipt, or in-branch payment) is wired to the wrong cashbook, so its takings never land where you are looking for them. | Open the Cashbook applet, audit every settlement method linked to the branch, and remap any stragglers to GS-KV-01 before the next month-end. |
| After reconciling, a previously matched line vanishes from your side and the closing balance moves. | Someone voided the original receipt or payment voucher after you had already matched it; the void removed the cashbook line but not the saved match. | Before voiding any source document that has been reconciled, go to Manual Matching > Unreconcile, undo the pair, then void. If it has already happened, unreconcile the dangling pair and re-run Auto Matching. |
| Auto Matching produces a flood of possible matches and barely any confirmed ones. | The cashbook has no active automatching weightage row, so the matcher falls back to a generic, strict setting that refuses to commit on its own. | In the Cashbook applet, open GS-KV-01 and add an active weightage configuration that reflects how your branch actually transacts (typically heavier on amount and date than on free-text reference). |
| Reports 1, 2, and 3 show numbers that do not match the screen. | You generated the reports while Auto Matching was still running in the background, so the report numbers are based on a half-finished match state. | Wait for the Processing indicator on the Auto Matching tab to clear, then regenerate all three reports. |
| You declare the reconciliation done with a small variance still showing, telling yourself you will catch it next month. | Skipping the variance hunt because it feels small; the unexplained difference rolls forward and compounds. | Treat any non-zero variance on Report 3 as a stop sign. Find the bank charge, FX (foreign exchange) rounding, or missing entry, post the journal, re-run Auto Matching, and only then change the status to Reconciled. |

## Related documentation

{{< cards >}}
  {{< card link="/applets/finance/bank-reconciliation-applet/" title="Bank Reconciliation Applet" subtitle="Field-by-field reference for the reconciliation screens." >}}
  {{< card link="/applets/master-data/cashbook-applet/" title="Cashbook Applet" subtitle="Cashbook setup, settlement-method routing, and automatching weights." >}}
  {{< card link="/applets/finance/internal-receipt-voucher-applet/" title="Receipt Voucher (Internal) Applet" subtitle="How in-branch receipts post to a cashbook." >}}
  {{< card link="/applets/finance/internal-payment-voucher-applet/" title="Payment Voucher (Internal) Applet" subtitle="How in-branch payments post to a cashbook." >}}
  {{< card link="/applets/finance/ledger-and-journal-applet/" title="Ledger and Journal Applet" subtitle="Where you post the adjustment journal in Step 8." >}}
  {{< card link="/applets/master-data/organisation-applet/" title="Organisation Applet" subtitle="Company, branch, and timezone setup." >}}
  {{< card link="/guides/accounting-guides/chart-of-accounts-setup/" title="Chart of Accounts Setup Guide" subtitle="Get your accounts and cashbook GL codes right before reconciling." >}}
  {{< card link="/guides/accounting-guides/journal-entries/" title="Journal Entries Guide" subtitle="Full walkthrough for posting manual journals like the bank-charges adjustment." >}}
  {{< card link="/guides/accounting-guides/financial-reporting/" title="Financial Reporting Guide" subtitle="What to run after the cashbooks are reconciled." >}}
{{< /cards >}}
