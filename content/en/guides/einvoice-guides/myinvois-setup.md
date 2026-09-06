---
title: "MyInvois Setup Guide"
description: "Get your company ready to submit e-invoices to LHDN through BigLedger — authorising BigLedger as your intermediary, completing your company identity, turning e-invoicing on in the right order, and cleaning up the master data that decides whether a document is accepted"
tags:
- user-guide
- e-invoice
- compliance
- setup
weight: 10
---

By the end of this guide, one real sale will have gone from your sales screen to LHDN and come back **Valid** — and you will know that the next thousand will do the same. The switching-on part takes an afternoon. The master-data clean-up behind it is what takes a week, and it is where every later problem is either prevented or created, so do not rush it.

## Meet GadgetSphere

GadgetSphere Sdn Bhd is bringing three companies online at once: the retail company, the online arm and the distribution company. Each one is a separate taxpayer at LHDN, so each one needs its own authorisation, its own company identity and its own switch-on. The 22 branches sit underneath the retail company and need nothing of their own — but the ~85,000 customer records do, and that is the real work.

## What you need to know first

**BigLedger submits on your behalf — you never hold LHDN credentials.** BigLedger is configured as your **intermediary**: you authorise it once on the MyInvois portal, and from then on every submission is signed with a token generated on behalf of your company's tax number. There is no client ID to copy, no client secret to paste and **no certificate to upload anywhere in BigLedger**. If a checklist you have been given says otherwise, it is out of date.

**Order matters more than anything else on this page.** E-invoicing must be switched on for a company **before** any document is finalised. This is not a preference — see Step 3.

## Before you start

- You (or your tax agent) can log in to the **MyInvois portal** as your company, with rights to appoint an intermediary.
- Your company's legal details are to hand: tax number, registration number, service-tax number where applicable, industry classification code, and the registered address.
- You know which BigLedger companies are in scope. One authorisation per taxpayer.
- Your BigLedger onboarding contact is reachable this week. A few pieces of the plumbing are switched on for you, and it is much easier to confirm them now than to diagnose them in month one.

---

## Step 1: Authorise BigLedger on the MyInvois portal

**Outcome:** LHDN knows that BigLedger may submit e-invoices on your company's behalf.

*MyInvois portal (LHDN's own website), not BigLedger*

Log in to the MyInvois portal as your company and appoint BigLedger as your **e-invoice intermediary**. You will be asked which permissions to grant.

{{< callout type="warning" >}}
**Grant the full set of permissions.** The single commonest hard setup failure is an authorisation where only one permission was ticked — and the symptom is not a helpful message about permissions. It is every submission failing. If you are unsure which boxes to tick, ask your BigLedger contact before you save the form rather than after.
{{< /callout >}}

Tell your BigLedger contact when the authorisation is in place. They complete the matching configuration on the BigLedger side, for both the test and the live environment.

**This authorisation expires.** Put the renewal date in a calendar now, with a reminder a month ahead. When it lapses, every submission for that company stops at once with an authentication error — *"Access Token not available"* — while every document looks perfectly fine. Teams lose days to this because the failure looks like a data problem and is not.

## Step 2: Complete your company's identity

**Outcome:** the supplier block of every future e-invoice is correct, because it comes from here.

*Organisation Applet → your company → E-Invoice tab*

Every sales e-invoice you send carries your own company as the supplier, built from this record. Fill in all of it:

- Tax number, identity document type and value, business registration number
- Service-tax number, if you are registered
- Industry classification code and a business activity description
- Address — **line 1, city and state are all mandatory**
- Contact number, **8 to 20 characters** (a short number, or a field containing "N/A", fails)
- E-mail address

{{< callout type="warning" >}}
Get this wrong and **every** document fails at once, across every branch and every customer — because the fault is on the supplier side of every e-invoice you send. When you are troubleshooting later and no single customer looks wrong, come back and read this record again.
{{< /callout >}}

Repeat for each company. GadgetSphere does this three times, once per legal entity.

## Step 3: Turn e-invoicing on — before you finalise anything

**Outcome:** the company is enabled, so finalised documents actually enter the pipeline.

*Organisation Applet → your company → E-Invoice tab → e-invoice status*

Set the company's e-invoice status to **enabled**.

{{< callout type="warning" >}}
**A document finalised while the company is not enabled is dropped silently.** No queue row, no pool row, no error, no log entry. It simply never becomes an e-invoice, and nobody finds out until somebody reconciles the month and comes up short. Those documents then have to be found by query and pushed in by hand.

This is the single most consequential ordering rule in e-invoicing. Enable the company **first**, then start finalising.
{{< /callout >}}

## Step 4: Clean up your customer and supplier records

**Outcome:** documents flow straight through instead of piling up in pools.

*Customer Applet / Supplier Applet → each record → E-Invoice details*

This is the long part, and it is worth every hour. Each counterparty needs:

- **Tax number**
- **Identity document type** — passport for anyone who is not Malaysian, business registration number for a company, national identity number (NRIC) only for a Malaysian individual
- **Identity value** — and if it is a national identity number, **12 digits with no dashes**
- **An address flagged as the e-invoice address**, complete with line 1, city and state
- Contact number and e-mail

{{< callout type="tip" >}}
If a customer has several addresses, BigLedger sends the first one flagged as the e-invoice address, looking in the order **shipping, then billing, then main**. Flag exactly one and there is nothing to guess about later.
{{< /callout >}}

One thing to know before you start correcting records later: a document can carry its **own** copy of the buyer's e-invoice details, typed straight onto it, and when it does the customer record is not read at all. See [Which record does BigLedger actually send?](/guides/einvoice-guides/einvoice-validation/#which-record-does-bigledger-actually-send) — it explains the one rejection that otherwise makes no sense.

You do not need every walk-in customer to be perfect — counter sales without buyer details are reported through consolidated e-invoices instead (see [Pools & Submission Routing](/guides/einvoice-guides/einvoice-pools-and-routing/)). What you *do* need is every customer who buys **RM 10,000 or more** at a time, because those sales cannot be consolidated and will sit in a pool until somebody chases the details.

## Step 5: Set the codes on your items

**Outcome:** lines are accepted instead of being rejected on their codes.

*Doc Item Maintenance / Tax Configuration Applet*

Each item needs an **item classification code** from LHDN's list, an **e-invoice unit of measure**, and a **tax type**. BigLedger fills in defaults where you leave them blank — classification `022 Others`, unit `H87 piece`, and a tax type derived from whether the line carries tax — but a *wrong* code that you have entered is sent exactly as entered.

{{< callout type="info" >}}
On a brand-new tenant, LHDN's reference lists (industry classification codes, units of measure) are not populated automatically. If those dropdowns are empty, that is what to report to your BigLedger contact — it is a one-off load, not a fault in your data.
{{< /callout >}}

## Step 6: Confirm the background plumbing is switched on

**Outcome:** you know the pipeline behind the screens is running for your tenant.

E-invoicing runs on a set of background processors — the one that picks up finalised documents, the one that submits to LHDN, the one that polls for the validation result, the one that refreshes your authorisation token, and the one that consolidates each month. **This is done for you during onboarding**; there is nothing for you to configure.

What matters to you is knowing the symptom if one is missing: **documents stop at one stage and never move on**, with no error anywhere. If you see that — everything sitting in the posting queue, or everything Submitted and never becoming Valid — say exactly that to support. It is a much faster diagnosis than "e-invoicing is broken".

## Step 7: Send one document end to end

**Outcome:** proof, on a real sale, that the whole chain works.

*Your sales applet → finalise one invoice, then My E-Invoice Admin Applet → Internal Submission → To IRB E-Invoice*

Pick one straightforward sale — a named customer whose record you completed in Step 4, an ordinary amount, no foreign currency — and finalise it. Then watch it:

1. It appears in the **Posting Queue** — the holding area every finalised document passes through before BigLedger decides where it goes. It should not stay there long.
2. It becomes an e-invoice on **Internal Submission → To IRB E-Invoice** with status *IN_QUEUE*, then *Submitted*.
3. Within a few minutes it becomes **Valid**, with an LHDN reference and a QR code on the printable version.

{{< figure src="/images/my-e-invoice-admin-applet/internal-submission-to-irb-e-invoice.png" alt="Internal Submission To IRB listing with one row per e-invoice and a status column showing Invalid and IN_QUEUE values" caption="Internal Submission → To IRB E-Invoice — where you watch your first document, and every document after it." >}}

If it stops at *IN_QUEUE*, read the error on the submission queue row. If it comes back **Invalid**, the reason is on the record and [Validation Rules & Troubleshooting](/guides/einvoice-guides/einvoice-validation/) will name it.

---

## What success looks like

Thirty seconds, on the company you just set up:

1. One real sale, finalised today, shows status **Valid** on *Internal Submission → To IRB E-Invoice*.
2. Its printable version carries an LHDN reference and a QR code.
3. Your **supplier details on that e-invoice** — your own company block — read correctly: right tax number, right address, right state.

If all three hold, that company is live. Repeat for the next one.

## Common mistakes

| Mistake | What you see | Fix |
|---|---|---|
| Ticking only one permission when appointing BigLedger as intermediary | Every submission fails, with no data problem on any document | Re-do the authorisation on the MyInvois portal with the full permission set |
| Finalising documents before enabling e-invoicing for the company | Those documents never appear anywhere in e-invoicing — no pool, no queue, no error | Enable first. For documents already lost this way, raise a support request with the document numbers |
| Letting the intermediary authorisation lapse | Everything stops at once with an authentication error | Diarise the renewal a month ahead, at setup time |
| No address flagged as the e-invoice address | Documents pile up in a pool for a customer whose record looks complete | Flag one address per customer — shipping, billing or main |
| Waiting for a certificate to arrive | Setup stalls on a step that does not exist | There is no certificate for you to obtain or upload; signing is handled for you |

## Related documentation

{{< cards >}}
  {{< card link="/guides/einvoice-guides/malaysia-e-invoice-guide/" title="What Malaysia Requires" subtitle="The background: phases, data fields and how validation works" >}}
  {{< card link="/guides/einvoice-guides/einvoice-pools-and-routing/" title="Pools & Submission Routing" subtitle="Where your first documents will go, and why" >}}
  {{< card link="/guides/einvoice-guides/einvoice-month-end/" title="The Month-End Cycle" subtitle="The routine that starts in your first full month" >}}
  {{< card link="/applets/e-invoice/my-e-invoice-admin-applet/" title="My E-Invoice Admin Applet" subtitle="Every prerequisite above, with the exact field and screen names" >}}
{{< /cards >}}
