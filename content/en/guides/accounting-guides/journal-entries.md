---
title: Journal Entries Guide
description: Post a balanced manual journal, clone a recurring one, and void a mistake so your month-end ledger lands clean.
tags:
- user-guide
- accounting
- journal-entries
weight: 20
---

You are the accounts person closing the books for March 2026 at GadgetSphere, and your finance manager has three manual journals on your plate before month-end. The work tonight is the monthly rent accrual, the monthly depreciation for the new branch fit-outs, and one correction for a misposting from last week. By the end of this guide you will have posted a balanced manual journal, cloned a recurring one, and voided a mistake. Budget about 10 minutes per journal once the pattern clicks.

## Meet GadgetSphere

GadgetSphere Sdn Bhd runs 22 consumer-electronics branches across Klang Valley, Penang, Johor Bahru, Kota Kinabalu and Kuching. Almost every transaction in BigLedger has already posted automatically this month: roughly 10,000 sales invoices from the branches, around 2,100 purchase invoices from authorised distributors, the daily point-of-sale cash bills and the supplier payments. What is left for you tonight is the small set of entries that nothing upstream can generate on its own: an accrual for rent the landlords have not yet invoiced, a depreciation charge calculated by the fixed-asset schedule, and a fix for one line that landed in the wrong cost-of-sales account last Tuesday.

{{< callout type="info" >}}
A manual journal is for things no other applet can post for you - accruals, depreciation, reclassifications, opening balances, audit adjustments. If a sales invoice, purchase invoice or cash bill would have created the entry, raise that document instead. Manual journals are the exception, not the routine.
{{< /callout >}}

## Concepts you will use tonight

- **Manual journal entry** (the form is called *Journal Transaction*) - a balanced set of debits and credits you type in yourself. Everything else in BigLedger posts automatically the moment a sales invoice, purchase invoice or cash bill is finalised.
- **Void** - cancels the financial effect of a posted journal by creating a mirror-image entry that swaps every debit and credit. The original stays visible in the audit trail. There is no Delete button for posted journals, and that is on purpose.
- **Clone** - copies an existing journal's accounts, amounts and descriptions into a new one. Perfect for the rent accrual and the depreciation entry you will post every month. The clone is posted immediately, so always change the date first.

## Before you start

- Your chart of accounts is built and the accounts you intend to debit and credit are active. If you migrated recently, see the Chart of Accounts Setup Guide.
- March 2026 is still open in the fiscal calendar (closing status "Open" or "General Ledger only locked"). If month-end has already been fully locked you will not be able to post into March.
- Your user role is Accounts Executive, Senior Accounts Executive, or Finance Manager. The Accounts Clerk role can view journals but not post them.
- You know the rent accrual amount (RM 38,500 for 22 branches in March, split RM 1,750 per branch), the depreciation amount (RM 12,500 for the new Klang Valley branch fit-outs), and which two accounts the misposted line should have hit instead.
- Default company, ledger and currency are set under Settings so the new-journal form fills itself in. Optional, but saves you four clicks per entry.

## Step 1: Open the journal list and start a new entry

*Finance > Ledger and Journal Applet > Journal Transaction > New*

Open the Ledger and Journal Applet from the left sidebar and click Journal Transaction. You land on a long list of every journal posted this month. Most of them show "Auto" in the Auto Flag column - those are the ones the sales, purchase and point-of-sale applets posted for you. The handful you need to add tonight will show as "Manual" once saved.

Use the date filter to narrow the list to March 2026 so you can see what you already have. To start the rent accrual, click the New button at the top right. The form has two tabs: Main (the header information for the whole journal) and Lines (the actual debits and credits). You will fill them in that order.

If the form opens with Company already set to GS, Ledger set to Primary and Currency set to MYR (Malaysian Ringgit), your default selections are working - one less thing to think about per entry. If those fields are blank, set them now: pick GS for GadgetSphere Sdn Bhd, the Primary ledger, and MYR.

Watch out for: if clicking New does nothing or shows a permissions message, your role does not include posting rights. Ask your finance manager to grant Accounts Executive access for your user.

## Step 2: Fill in the journal header for the rent accrual

*Finance > Ledger and Journal Applet > Journal Transaction > New > Main tab*

On the Main tab, set Date to 31 March 2026 - this is the accounting date the entry will appear under on every report, regardless of when you actually type it in. The posting date (when you click Save) is captured separately for the audit trail.

In Reference Number, type something you and the auditor can recognise later: a pattern like `JV-2026-03-RENT` works well. You will reuse the same pattern (`JV-2026-03-DEPN`, `JV-2026-03-CORR`) for the other two journals tonight, so future you can find all three of March's manual entries with one filter.

In Description, write a sentence in plain English: "March 2026 rent accrual - 22 branches, landlord invoices pending". Anyone opening the journal next year should understand why it exists without phoning you. Leave Branch on the header blank for now - this journal touches 22 branches and you will tag the branch on each line instead.

Watch out for: if Save later fails with a message about the fiscal period being locked, the date you chose falls in a month that has already been closed; change Date to one still open or ask your finance manager to reopen the period.

## Step 3: Add the debit and credit lines and watch the running totals

*Finance > Ledger and Journal Applet > Journal Transaction > New > Lines tab*

Switch to the Lines tab and click Add Line. For a simple group-wide rent accrual, two lines are enough: debit Rental Expense for RM 38,500, credit Accrued Liabilities for RM 38,500.

Pick the General Ledger account from the dropdown - never type it free-hand, because a typo silently creates a new sub-account under whatever you typed and you will spend tomorrow morning hunting it down. For the debit line, choose Rental Expense, enter `38500` in the Debit column, leave Credit blank, and write "March 2026 rent - all branches" in the line description. Click Add Line again. For the credit line, choose Accrued Liabilities, enter `38500` in the Credit column, leave Debit blank.

As you add lines, watch the running totals at the bottom of the table: Total Debit and Total Credit must match before you save. If you want a per-branch breakdown instead of a single lumped accrual, add 22 debit lines (one per branch code, `GS-KV-01` to `GS-KUC-01`) at RM 1,750 each and one credit line for RM 38,500 - the totals will still match and reports filtered by branch will pick up each branch's share. The clean per-branch number is on purpose: if the rent allocation does not divide evenly, pick a total that does, or absorb the rounding deliberately on one line so Total Debit equals Total Credit to the cent.

Watch out for: if you forget to enter the credit amount on the second line, the journal can still save with mismatched totals and quietly corrupt the trial balance; always check Total Debit equals Total Credit before clicking Save.

## Step 4: Tag the branch and any analytical dimensions

*Finance > Ledger and Journal Applet > Journal Transaction > New > Lines tab > Categories sub-tab*

On each line, open the Categories sub-tab to tag the analytical dimensions GadgetSphere reports on. For the rent accrual posted at branch level, set Branch on each debit line to the matching branch code - `GS-KV-01` on the first debit line, `GS-KV-02` on the second, and so on - so the per-branch profit and loss reports include each branch's share of rent.

If your finance manager has set up a Segment for Retail versus Online versus Distribution, tag the Segment too: all 22 branches here are Retail, so set Segment to Retail on every line. For the matching credit to Accrued Liabilities, leave Branch blank - the liability sits at the group level. Skip Project and Profit Center on this one.

These tags do not change the accounting at all; they only drive how the numbers are sliced when your finance manager opens the Profit and Loss report later. Tag only what you actually report on - extra tags become noise.

Watch out for: if your finance manager later asks why a branch's profit and loss statement is missing its rent share, you forgot to set Branch on that debit line; open the journal, edit the line's category, save again.

## Step 5: Save the journal and confirm it has posted

*Finance > Ledger and Journal Applet > Journal Transaction > New > Save*

Click Save at the top right. There is no separate Post step - the moment Save succeeds, the journal is final. The system gives it two numbers you will see on every report: a tenant-wide Journal Number and a per-company Journal Number (so GadgetSphere Sdn Bhd, the online sales entity and the distribution entity each keep their own running sequence).

The Posting Status flips to Posted, the Auto Flag is set to Manual, and the entry hits the trial balance instantly. You are now back on the View page for the journal you just posted. Note the Journal Number somewhere - you will reference it when the auditor asks next year.

If Save fails, the error message is usually one of: the Primary ledger is not set up for GS, the fiscal period covering 31 March 2026 is locked, or the account you picked is inactive. Fix the underlying issue and click Save again - the form still has all your data.

Watch out for: if Save appears to succeed but no journal appears in the listing, both totals were zero and the entry was rejected silently; check that you typed amounts into both lines and try again.

## Step 6: Clone last month's depreciation journal instead of retyping

*Finance > Ledger and Journal Applet > Journal Transaction > [open February's depreciation journal] > Clone*

The depreciation entry for the Klang Valley branch fit-outs is the same every month: debit Depreciation Expense RM 12,500, credit Accumulated Depreciation RM 12,500, tagged to the same handful of branches. Instead of retyping it, find last month's version.

On the listing, filter by Reference Number containing "DEPN" and Date in February 2026 - that single line for `JV-2026-02-DEPN` is your template. Click into it to open the View page, then click Clone at the top. BigLedger creates an immediate copy with a brand-new Journal Number, identical accounts, identical amounts, identical branch tags - and it is already posted.

This is the bit that catches people out the first time: there is no draft state. Open the cloned journal straight away, click Edit, change Date to 31 March 2026, change Reference Number to `JV-2026-03-DEPN`, update the Description to read "March 2026" instead of "February 2026", and adjust the amount if the asset schedule has moved (look it up in the Fixed Asset Register applet; the March figure for the new KV branch fit-outs is still RM 12,500). Save. The new clone now has the right date and reference; the trial balance for March picks it up; February's original is untouched.

Watch out for: if you forget to edit the date, the clone posts under February's date and shows up in last month's reports - void it (Step 8) and clone again, this time editing the date before doing anything else.

## Step 7: Post the correction journal for last week's misposting

*Finance > Ledger and Journal Applet > Journal Transaction > New*

Last Tuesday, a manual journal posted a RM 4,200 cost line to Cost of Sales - Accessories when it should have hit Cost of Sales - Smartphones - someone picked the wrong account from the dropdown. Do not edit the original journal: that breaks the audit trail and, if the original was auto-posted from a sales invoice, you cannot edit it anyway. Instead, post a brand-new correction journal.

Click New, set Date to 31 March 2026 (so the fix lands in the same period as the original), Reference Number `JV-2026-03-CORR`, and Description "Reclassify RM 4,200 from Cost of Sales - Accessories to Cost of Sales - Smartphones; corrects line on JV-2026-03-072".

On the Lines tab add two lines: debit Cost of Sales - Smartphones RM 4,200 to push the cost into the right account, credit Cost of Sales - Accessories RM 4,200 to pull it back out of the wrong one. Tag both lines with the same branch and segment the original carried. Save. The two accounts now balance to what they should always have been; the original journal stays untouched in the audit trail; anyone following the description can trace the full story.

Watch out for: if you flip the debit and credit by mistake, you double the error instead of fixing it - void this correction (Step 8) and post a fresh one with the right direction.

## Step 8: Void a journal you posted by mistake

*Finance > Ledger and Journal Applet > Journal Transaction > [select the wrong journal] > Void*

Say you have just posted the rent accrual for RM 38,500 and noticed you used the wrong reference number, or you cloned the depreciation journal and forgot to change the date so it landed in February twice. The fix is the same: void it.

Open the journal in the listing, click the red Void button at the top right, and confirm. BigLedger does not actually delete anything. It creates a second journal that is the mirror image of the first - every debit becomes a credit, every credit becomes a debit - so the two together net to zero on the trial balance. The original journal stays visible with its Posting Status changed to Void; the reversal journal sits next to it linked back to the original.

Note this down in your working file, then post a fresh correct journal from Step 2. There are two cases where Void will refuse: the journal has already been voided once (you cannot void it twice), or the journal involves a foreign-exchange revaluation (those need the dedicated Foreign Exchange (Forex) Gain/Loss flow instead).

Watch out for: if you void an automatic journal that came from a sales or purchase invoice, you have only reversed the accounting - the source invoice is still there and untouched; the proper fix is to issue a credit note against the invoice, not void the journal.

## Step 9: Check Error Checking before you say you are done

*Finance > Ledger and Journal Applet > Error Checking > Journal Not Balance*

Before you tell your finance manager the three manual journals are in, run a 30-second sanity check. Open Error Checking from the sidebar and click the Journal Not Balance tab. This screen lists any journal whose debits do not equal its credits - the situation that quietly corrupts the trial balance.

If the list is empty, your March work is clean. If a journal appears, click into it, find the line whose amount is wrong (usually a missing credit on the last line), edit it so the totals match, save.

While you are here, glance at the Missing Journal tab too - it lists gaps in the journal numbering sequence, which usually means a journal was hard-deleted out of band; you should not see anything here in normal operation. Once both tabs are empty for March, your three manual entries are in, the trial balance reflects them, and you can hand off to the financial reporting step.

Watch out for: if Journal Not Balance shows a journal you posted tonight, you saved before checking the running totals at the bottom of the Lines tab; edit it now rather than letting it carry into the month-end reports.

## What success looks like

Open Journal Transaction, filter the listing to Date in March 2026 and Auto Flag set to Manual. You should see exactly three rows: `JV-2026-03-RENT` (RM 38,500), `JV-2026-03-DEPN` (RM 12,500) and `JV-2026-03-CORR` (RM 4,200), each with Posting Status of Posted. Open Error Checking then Journal Not Balance and confirm the list is empty for March. If both checks pass, your March manual journals are complete and ready for the financial reports.

## Common mistakes

| Symptom | Cause | Fix |
|---------|-------|-----|
| The trial balance for March is off by a few hundred ringgit and nothing in the sales or purchase numbers explains it. | You saved a manual journal whose debit and credit totals did not match; the system accepted it and posted the imbalance straight into the ledger. | Open Error Checking then Journal Not Balance, click into the offending journal, edit the line with the missing amount, save. |
| A new sub-account you do not recognise has appeared under Rental Expense with three transactions in it. | Someone typed an account code instead of picking it from the dropdown; a typo silently spawns a new sub-account. | Move the balance to the correct account with a manual reclassification journal, then deactivate the stray sub-account from the Sub Ledger screen. Pick from the dropdown next time. |
| Save fails with a message that says the fiscal period is locked. | The month covering the date you entered has already been closed for general-ledger posting. | Either change the date to a month still open, or ask your finance manager to reopen the period briefly so you can post. |
| You cloned last month's recurring journal and it now appears under last month's date in this month's reports. | The clone is posted immediately using the source journal's date; you did not edit the date before BigLedger picked it up. | Void the cloned journal, clone again, and this time change the date and reference number first, before doing anything else. |
| Void refuses to run with a message that the journal has already been reversed or is a foreign-currency document. | Either the journal has been voided once already (you cannot void it twice), or it carries a foreign-currency flag that requires a different flow. | For an already-voided entry, post a new correction journal instead. For a foreign-currency entry, use the Foreign Exchange (Forex) Gain/Loss flow rather than Void. |

## Related documentation

{{< cards >}}
  {{< card link="/applets/finance/ledger-and-journal-applet/" title="Ledger and Journal Applet" subtitle="Field-by-field reference for the Journal Transaction form" >}}
  {{< card link="/guides/accounting-guides/chart-of-accounts-setup/" title="Chart of Accounts Setup Guide" subtitle="Build the accounts your journals will debit and credit" >}}
  {{< card link="/guides/accounting-guides/bank-reconciliation-guide/" title="Bank Reconciliation Guide" subtitle="Reconcile the cashbook against the bank statement" >}}
  {{< card link="/guides/accounting-guides/financial-reporting/" title="Financial Reporting Guide" subtitle="Run the month-end profit and loss and balance sheet" >}}
{{< /cards >}}
