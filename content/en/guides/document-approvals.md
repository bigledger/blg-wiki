---
title: "Document Approvals"
description: "Turn on optional sign-off for purchase requisitions, purchase orders and stock requisitions — who approves, in what order, and what happens when they do."
weight: 45
tags:
- approvals
- purchasing
- inventory
- configuration
---

By the end of this guide, a purchase order raised by your buying team will sit and wait for a
manager's e-mailed approval before it goes anywhere — and you will know exactly what to check when
it doesn't. Setting it up takes about 30 minutes the first time.

Before you start, the single most important thing to understand: **approvals in BigLedger are
optional and switched off until you build them**. A fresh tenant has no approval settings at all.
Purchase orders save, finalise and turn into goods received notes with nobody signing anything.
Nothing breaks, nothing is queued, nothing is waiting. If your business is happy with that, you can
close this page. Approvals are here for the day you want a paper trail, not because BigLedger
insists on one.

## Meet GadgetSphere

GadgetSphere Sdn Bhd runs 22 consumer electronics branches across Malaysia. Branch managers raise
purchase orders for stock all day long, and until now nobody looked at them before they went to the
distributor. After a RM 180,000 order for the wrong laptop model went out from `GS-KV-03`, the
finance director asked for a rule: anything a branch orders gets a second pair of eyes, and anything
big gets a third. This guide sets that up.

## What can and cannot be approved

This is the shortest section and the one people get wrong most often.

**Three document types can have approvals:**

- Purchase Requisition
- Purchase Order
- Stock Requisition

**Everything else cannot.** There is no approval engine for sales orders, sales invoices, sales
quotations, delivery orders, goods received notes, purchase invoices, payment vouchers, receipt
vouchers, journals, stock adjustments or stock transfers. If a colleague tells you they need a sales
invoice routed to a manager before it posts, BigLedger will not do that for you — that has to be a
company rule enforced by who you give the permission to, not a queue the system manages.

{{< callout type="warning" >}}
**Approvals are not the Workflow Design Applet.** The [Workflow Design Applet](/applets/master-data/workflow-design-applet/)
looks like an approval builder — it has statuses, transitions and roles — but it only puts a *label*
on a document and filters who may change that label. It sends no e-mail, blocks no posting and runs
no approval. Approvals live in each applet's own **Settings → Approval Settings**. The two systems
never talk to each other.
{{< /callout >}}

Today, only the Purchase Order and Purchase Requisition applets give you the whole loop — settings,
a submit button on the document, an approver's queue and a history. The Stock Requisition applet has
the Approval Settings screen but no way to submit a requisition against it yet, so treat that screen
as configuration for later.

## The three things you have to set up

Approvals need three separate pieces, in this order. Miss one and submission fails with an error
that names a database table, so it is worth doing them in order.

1. **Designations** — the job titles your approval rules key off (Settings → Branch → Designation).
2. **Designation employees** — which people sit at which approval level (Settings → Branch →
   Designation → Designation Employee).
3. **An approval setting** — the levels themselves (Settings → Approval Settings).

## Step 1: Create the designations

*Purchase Order Applet → Settings → Branch → select your branch → Designation*

A designation is a job title with a code. You need one for the people who *submit* documents, and
one for each rank of person who *approves* them.

For GadgetSphere, create three:

| Code | Name |
|---|---|
| `Staff` | Branch purchasing staff |
| `BRANCH-MGR` | Branch manager |
| `FIN-DIR` | Finance director |

The `Staff` one matters more than it looks. When someone submits a document, BigLedger reads that
person's **Job Title** from the Employee applet and looks for an approval setting whose Submitter
Designation Code matches it. If it finds none, it falls back to the designation `Staff`. So if your
buyers' job titles are all over the place — "Purchaser", "Stock Assistant", "Admin" — they will all
land on the `Staff` rule, which is usually what you want.

**Most common failure here:** nothing. This step fails silently and shows up two steps later as
*"Submitter designation_code is not created in bl_fi_mst_branch_designation"* when someone tries to
submit. That message means "go back and create the designation".

## Step 2: Put people into the designations, with a level

*Purchase Order Applet → Settings → Branch → select your branch → Designation → Designation Employee*

Here you add employees and, for each one, an **Approval Level**. The level is a number: 1 is the
first person to see the document, 2 is the next, and so on.

For GadgetSphere:

| Employee | Designation | Approval Level |
|---|---|---|
| Branch manager, `GS-KV-03` | `BRANCH-MGR` | 1 |
| Regional purchasing lead | `BRANCH-MGR` | 1 |
| Finance director | `FIN-DIR` | 2 |

Two people at level 1 is deliberate — it means either of them can clear the first level, so a
purchase order does not sit still while one of them is on leave. You control how many of them have
to act in the next step.

**Every approver needs an e-mail address on their employee record.** The whole approval flow is
driven by e-mail. If the address is blank the approval still gets created, but the approver is never
told; you will see `APPROVER_EMAIL_IS_EMPTY` in the Email Notification Status column and nothing
will happen until someone chases it by hand.

## Step 3: Build the approval setting

*Purchase Order Applet → Settings → Approval Settings → Add*

This is the rule itself. Fill in the header:

| Field | GadgetSphere's value | What it does |
|---|---|---|
| Approval Setting Code | `PO-BRANCH` | Your reference. |
| Approval Setting Name | Branch purchase order approval | Your reference. |
| Branch / Company | `GS-KV-03` / `GS` | Which branch and company the rule belongs to. |
| Server Doc Type | `INTERNAL_PURCHASE_ORDER` | Which document this rule governs. |
| Submitter Designation Code | `Staff` | Whose documents this rule catches. |
| Total Required Approval Levels | `2` | How many level rows follow. |

Then add one row per level. GadgetSphere's two rows:

| Approval Level | Approval Quorum | Min Approval Amount | Approver Designation |
|---|---|---|---|
| 1 | 1 | 0 | `BRANCH-MGR` |
| 2 | 1 | 10000 | `FIN-DIR` |

Read that as: *every* purchase order needs one of the two branch managers to approve it, and orders
of RM 10,000 or more additionally need the finance director.

Three fields on this screen deserve a warning:

- **Approval Quorum** is how many approvers at that level must act. Set it to 1 and either branch
  manager can clear the level. Set it to 2 and both must. If you set a quorum higher than the number
  of people you actually assigned at that level, BigLedger quietly lowers it to the number of people
  available — it will not deadlock, but it also will not be the rule you thought you wrote.
- **Min Approval Amount** does *not* choose a different approver. It decides **how many levels apply
  to this document**. BigLedger counts the levels whose Min Approval Amount is less than or equal to
  the document total and requires that many. A RM 4,000 order at GadgetSphere needs one approval; a
  RM 45,000 order needs two. This is the only place a money figure changes anything.
- **Approval Logic** (Any to Approve / All to Approve) and **Max Approval Amount** are collected by
  the screen and stored, but nothing reads them. Whether one approver is enough is decided purely by
  the quorum, and Max Approval Amount has no effect at all. Leave them alone rather than relying on
  them.

**If you get this wrong:** the number of level rows must equal Total Required Approval Levels when
you first save, or the save is rejected. That check is *not* repeated when you edit an existing
setting, so if you come back later and add a level without bumping the number, the setting will save
happily and quietly behave as though the extra level does not exist.

## Step 4: Tell the Approval Monitor that a PO may stand on its own

*Purchase Order Applet → Settings → Approval Monitor*

This one catches almost everybody, and the symptom looks nothing like the cause.

The Approval Monitor holds pairs of document types and answers one question: must the second
document have been converted from the first before it can be submitted for approval? For purchase
orders, BigLedger always asks that question about the pair *Purchase Requisition → Purchase Order*.

If there is no Approval Monitor row for that pair at all, the check errors, and on the purchase
order's Approval tab the **Add** button is greyed out with the tooltip *"Purchase Order needs to be
converted from Purchase Requisition"* — even for a perfectly ordinary standalone PO.

So create the row:

| From | To | Document Conversion Required |
|---|---|---|
| `INTERNAL_PURCHASE_REQUISITION` | `INTERNAL_PURCHASE_ORDER` | unticked |

GadgetSphere leaves it unticked because branches raise purchase orders directly. Tick it only if
your policy is that every purchase order must come from an approved requisition — in which case
BigLedger will additionally check that the source requisition exists *and* was approved, and will
copy that requisition's submitter onto the new approval.

## Step 5: Submit a purchase order for approval

*Purchase Order Applet → open a saved purchase order → Generic Doc Approval tab*

Now the daily use. Open a purchase order, go to the **Generic Doc Approval** tab, click **Add**,
choose the submitter (the employee raising it), and save. Then select the row in the grid and click
**Submit For Approval**.

What happens next, in order:

1. The approval goes to *Pending Approval*.
2. BigLedger works out how many levels apply from the document total and the Min Approval Amounts.
3. It creates one request per approver at level 1 and e-mails each of them.
4. The e-mail contains a link. The approver clicks it and lands on a plain web page showing the
   document number, date, total, currency and lines, with **Approve** and **Reject** buttons and a
   remarks box. Remarks are compulsory. Approvers can also work from the **Approval Request** screen
   inside the applet if they prefer.
5. When level 1's quorum is met, level 1's outstanding requests disappear and level 2's approvers
   are e-mailed.
6. When the last required level approves, BigLedger stamps the final approval date and **sets the
   purchase order to FINAL for you**.

If anyone rejects, the whole approval goes to *Rejected*, the submitter gets an e-mail with the
rejection remarks, and every outstanding request is cleared. The purchase order itself is untouched
— it stays exactly as it was. To try again, fix the document and click **Resubmit**, which starts a
fresh cycle from level 1.

{{< callout type="info" >}}
**The document is never locked.** While an approval sits at *Pending Approval*, the purchase order
is still editable, and anyone with the right permission can still finalise it by hand. Approval
causes FINAL; it does not guard it. Treat the approval trail as evidence that the right people
looked, not as a lock on the document.
{{< /callout >}}

## What success looks like

Thirty seconds, on a test purchase order:

1. Raise a purchase order for about RM 500. Open its **Generic Doc Approval** tab. The **Add**
   button should be clickable — if it is greyed out with a tooltip about requisitions, Step 4 is
   missing.
2. Add an approval, select it, click **Submit For Approval**. The row's Approval Status should read
   `PENDING_APPROVAL`, Processor Posting Status should read `PROCESSOR_SUCCEED`, and Email
   Notification Status should read `EMAIL_SENT_TO_APPROVER`.
3. The level 1 approver should have an e-mail. Click through, approve, add a remark.
4. Go back to the purchase order. Because RM 500 is below RM 10,000 only one level applied, so the
   approval status should now be `APPROVED` and the purchase order's posting status should have
   moved to **FINAL** on its own.

If all four hold, you are done. Repeat once with an amount over RM 10,000 to confirm the second
level kicks in.

## Common mistakes

**"Submitter designation_code is not created in bl_fi_mst_branch_designation"**
You created the approval setting but not the designation it names. Go back to Step 1. The message
also asks you to contact a developer — you don't need to; it is a configuration gap, not a bug.

**"There is no approver assigned in bl_fi_mst_employee_branch_designation_link"**
The designation exists but nobody is in it. Step 2.

**"EmployeeBranchDesignationLink_IS_NOT_FULLY_CONFIGURED"**
You asked for more approval levels than you have distinct levels of people. If Total Required
Approval Levels is 2, at least one person must sit at level 1 and at least one at level 2.

**The approver says they never got an e-mail**
Check the Email Notification Status column on the approval grid. `APPROVER_EMAIL_IS_EMPTY` means the
employee record has no e-mail address. `FAILED_GENERIC_DOC_APPROVAL_PENDING_APPROVAL_NOTIFICATION`
means the tenant has no e-mail template configured for pending approvals — nothing was sent at all,
so no amount of waiting will help.

**The approver logs in but their Approval Request list is empty**
BigLedger matches approval requests to the signed-in user through their employee record. If the
login has no matching employee in the Employee applet, the screen errors with *"Cannot find your
email … from Employee Applet"*. The e-mail link still works in the meantime.

**Someone finalised the purchase order while it was waiting**
That is not a fault; nothing stops it. If the sign-off matters, control who holds the permission to
finalise purchase orders rather than expecting the approval to block them.

**Expecting features that are not there**
There is no approver delegation or stand-in for these documents, no escalation when an approval goes
stale, no reminder e-mails, no approval SLA, no mobile approval app and no rule that sends a big
document to a *different* person. Approvers act from the link in their e-mail or from the applet.

## Related documentation

- [Purchase Order Applet](/applets/purchase-workflow/internal-purchase-order-applet/) — the field-level
  reference for Approval Settings, Approval Monitor, Approval Request and Approval History.
- [Purchase Requisition Applet](/applets/purchase-workflow/internal-purchase-requisition-applet/) —
  the same approval loop on requisitions.
- [Stock Requisition Applet](/applets/inventory-workflow/internal-stock-requisition-applet/) — has
  the Approval Settings screen, but no way to submit against it yet.
- [Workflow Design Applet](/applets/master-data/workflow-design-applet/) — the *other* thing that
  looks like approvals, and what it actually does.
- [Employee Applet](/applets/master-data/employee-applet/) — where approvers' job titles and e-mail
  addresses live.
