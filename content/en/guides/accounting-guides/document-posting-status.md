---
title: Posting Status Explained — When "Final" Isn't in the Ledger Yet
description: Understand what Draft, Final, and Voided really mean, confirm a finalised document's journal actually reached the ledger, and recover a missing journal in minutes.
tags:
- user-guide
- accounting
- posting-status
- troubleshooting
weight: 25
---

Your finance manager asks why last Tuesday's supplier invoice is not in the ledger report, yet the document clearly says **Final**. By the end of this guide you will know what each posting status really promises, how to confirm in 30 seconds that a finalised document's accounting entry reached the General Ledger, and how to recover the rare document whose entry did not. Allow about 10 minutes.

## Meet GadgetSphere

GadgetSphere Sdn Bhd finalises hundreds of documents a day across its 22 branches — sales invoices, purchase invoices, payment vouchers, credit notes. For almost all of them, the accounting entry (the journal) lands in the General Ledger moments after the clerk clicks Final. This guide is about reading that process correctly, and about the one-in-thousands document where the journal needs a nudge.

## Concepts you will use

- **Posting status** — the document's own lifecycle: **Draft** (editable, no accounting effect), **Final** (saved and locked, given a running number), **Voided** (reversed with a mirror entry), **Discarded** (a draft abandoned before finalising).
- **Journal** — the debit/credit entry a finalised document creates in the General Ledger. You can see it in the Ledger and Journal Applet under Journal Transaction, marked with Auto Flag "Auto".
- **Background posting** — finalising the document and generating its journal are **two steps**. Final happens instantly when you save; the journal is generated in the background moments later. **"Final" means saved and locked — it is the journal that moves your trial balance.**

{{< callout type="info" >}}
This two-step design is why the ledger can lag the document by a moment — and why, very rarely, a document can be Final while its journal is missing. That gap is recoverable, and the rest of this guide shows you how.
{{< /callout >}}

## Step 1: Read the document's posting status

Open the document (for example, GadgetSphere's purchase invoice `GS-PI-30419`, RM 8,200 of accessories for the Penang branches). The status field tells you where it is in its life:

| Status | What it promises | Accounting effect |
|---|---|---|
| Draft | Still editable; nothing posted | None |
| **Final** | Locked, numbered, queued for posting | Journal generated in the background, normally within moments |
| Voided | Reversed | A mirror journal cancels the original |
| Discarded | Abandoned draft | None |

For day-to-day work, Final is all you need to see. Move to Step 2 only when a report looks like it is missing a document.

## Step 2: Confirm the journal reached the ledger

*Finance > Ledger and Journal Applet > Journal Transaction*

Filter the journal list by the document's date and look for the entry that references your document number — it will show Auto Flag "Auto". If it is there, the ledger has it, and whatever looked odd in the report has another cause (check the report's date range and branch filter first).

If the document is Final but **no journal exists for it**, you have found the rare case this guide exists for. Nothing is lost — the document itself is intact — but its accounting entry was never generated. Go to Step 3.

## Step 3: Recover with Missing Journal

*Finance > Ledger and Journal Applet > Missing Journal*

The Missing Journal screen finds finalised documents whose journal was never generated and lets you re-run the posting for them on the spot. Two things can happen:

- **It posts.** The journal appears in Journal Transaction and your trial balance is whole again. Done.
- **It fails with a reason.** Unlike the background run, a re-post from Missing Journal tells you *why* it cannot post — and the reason is usually a setup detail you (or your administrator) can fix:

| Message mentions | What it means | Fix |
|---|---|---|
| A GL account / GL code that cannot be found | An account referenced by this document (item, customer, or supplier posting setup) was deactivated or removed after the document was created | Re-point the item/customer/supplier posting setup to an active account, then re-run Missing Journal |
| A missing default GL code | The company's default posting account for this document type was never configured | Ask your administrator to set the default GL code in the accounting configuration, then re-run |
| Debits and credits not balanced | The document's posting setup produces an unbalanced entry | Contact support with the document number — this needs investigation |

After fixing the cause, re-run Missing Journal for the same document. If it still refuses, contact support and include the document number **and the exact message** — that message is precisely what the team needs.

{{< callout type="warning" >}}
Make the Missing Journal screen part of your **month-end checklist**, before you run the financial reports: open it, and confirm it lists nothing for the period. An empty list means every finalised document made it into the ledger, and your reports stand on complete data.
{{< /callout >}}

## A note on balances that update "a moment later"

The same background principle applies to customer and supplier balances. When you record a payment, apply a credit note, or knock off an invoice against a payment, the document's outstanding balance is recalculated in the background — usually within seconds, occasionally a few minutes on a busy day. If a balance looks stale, refresh the screen first. If it is still stale after 15 minutes, that is worth reporting to support with the document number — it is not something you caused, and it is not fixed by re-entering the payment (re-entering creates a duplicate).

## What success looks like

Pick any document you finalised today, open Journal Transaction, and find its Auto journal within one filter. Then open Missing Journal for the current month and see an empty list. If both are true, every ringgit your team finalised is in the ledger, and your month-end reports can be trusted.

## Common mistakes

| Symptom | Cause | Fix |
|---------|-------|-----|
| A finalised invoice missing from the ledger report is re-entered from scratch. | Assuming the document was lost, when only its journal was not generated. | Never re-enter — that doubles the transaction. Use Missing Journal to regenerate the entry for the existing document. |
| The month-end trial balance is short by exactly one document's value. | One finalised document's journal was never generated, and nobody checked. | Add the Missing Journal empty-list check to the month-end routine (see Step 3). |
| A payment was entered twice because the customer balance "didn't update". | The balance recalculates in the background; the second entry landed before the first one's recalculation showed. | Refresh before re-acting on a stale balance; if a duplicate already exists, void the second payment. |
| Missing Journal fails and the error is dismissed without reading. | The failure reason names the fixable cause (deactivated account, missing default GL code). | Read the message, fix the named setup detail, re-run. Send support the exact message if unclear. |
| Voiding a document and expecting the original journal to disappear. | Void does not delete — it posts a mirror journal that cancels the original. Both remain visible. | This is by design (audit trail). Check the *net* effect in the ledger, not the row count. |

## Related documentation

{{< cards >}}
  {{< card link="/applets/finance/ledger-and-journal-applet/" title="Ledger and Journal Applet" subtitle="Reference for Journal Transaction, Missing Journal, and Error Checking" >}}
  {{< card link="/guides/accounting-guides/journal-entries/" title="Journal Entries Guide" subtitle="Post, clone, and void manual journals" >}}
  {{< card link="/guides/accounting-guides/financial-reporting/" title="Financial Reporting Guide" subtitle="Month-end profit and loss and balance sheet" >}}
  {{< card link="/applets/finance/general-ledger-applet/" title="General Ledger Applet" subtitle="The core accounting engine reference" >}}
{{< /cards >}}
