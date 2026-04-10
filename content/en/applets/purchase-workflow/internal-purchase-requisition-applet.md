---
title: "Internal Purchase Requisition Applet"
description: "Create and manage internal purchase requisitions with posting controls, line item tracking, knock-off from Jobsheet, printing, approvals, and line item queue approvals."
weight: 10
date: 2026-04-10
lastmod: 2026-04-10
draft: false
tags:
- purchase-workflow
- purchase-requisition
- internal-purchase
- approvals
- line-items
- line-items-queue
- knock-off
---

## Purpose and Overview

A **purchase requisition** is your company's formal way of saying *"we need to buy this."* Before any money is spent or a supplier is contacted, someone fills in a purchase requisition to record exactly what is needed, how much of it, and from where. A manager or approver then reviews and signs off on it. Only after that approval does purchasing move forward — typically by raising a purchase order in the [Internal Purchase Order Applet](/applets/purchase-workflow/internal-purchase-order-applet/).

Think of it like a **pre-approved shopping list**: you specify what you need, your manager checks it makes sense and fits the budget, and then it gets handed off to procurement to place the actual order. The purchase requisition is the internal request; the purchase order is the formal commitment sent to the supplier.

The **Internal Purchase Requisition Applet** is where your team creates, tracks, approves, and manages those requisitions — from the first draft all the way through to approval and any follow-up your company requires.

---

## Who Uses This Applet?

**Purchasers, procurement staff, and requesters** create and submit purchase requisitions. They fill in details, add line items, attach supporting documents, and track whether their requests have been approved.

**Approvers and managers** review requisitions in **Approval Request**, decide whether to approve or reject them, and can look back at past decisions in **Approval History**.

**Controllers and operations staff** use the **Line Items** view to see what items are being requested across the company without opening each requisition individually, and the **Line Items Queue** to approve individual lines in bulk when your company uses that step.

**Administrators** configure which fields appear, who can do what, how approvals route, and how documents print — all from **Settings**.

---

## What Problems Does This Solve?

Without a structured process, purchase requests often happen over email or through informal conversations. That leads to missing details, no clear audit trail, and no way to see what is still waiting for action.

This applet brings everything into one place:

- **One structured form** for the document header (top-level details like date and reference), account information (who is buying and where it gets delivered), supplier, and the list of items being requested
- **Clear document stages** — draft, final, void, or discard — so everyone knows where a requisition stands at any time
- **A formal approval path** through **Approval Request** and **Approval History**, instead of sign-off by email
- **Line-level visibility** through **Line Items** and **Line Items Queue** for operations teams who need to review or approve individual items
- **Attachments and linked documents** so quotes, photos, or related files stay with the requisition — making it easy to check the full picture later
- **Knock-off from Jobsheet** so you can pull relevant details from an existing Jobsheet directly into the requisition without retyping

{{< callout type="info" >}}
Menus, buttons, and tabs can change depending on the document's status, your company's settings, and your access rights. If something you expect is not showing, ask your administrator before assuming something is broken.
{{< /callout >}}

---

## Before You Start

Having the right information ready before you begin will make the process faster and avoid interruptions.

**For requesters:**
- The name or description of what you need to buy
- Quantity and unit of measure (e.g. 10 units, 5 boxes)
- Estimated price or budget amount (if your company requires it)
- Preferred supplier name, if known
- Your department or cost centre code *(your department's internal billing or budget reference — ask your finance team if you are unsure)*
- Delivery address or branch (if different from your default)

**For administrators setting up the applet for the first time:**
- Which fields should be mandatory on a requisition form
- Who approves requisitions — one person, or a chain of approvers?
- Should approvals route by branch, department, or amount?
- Do you need line-level queue approval (Line Items Queue), or standard document-level approval only?
- What print format should be used for printed requisitions?

{{< callout type="tip" >}}
**Start simple.** If you are configuring the applet for the first time, set up one approval path and one branch first. You can always add complexity later once your team is comfortable with the basics.
{{< /callout >}}

---

## Feature Navigation

{{< cards >}}
	{{< card title="Purchase Requisition" subtitle="List, create, and edit requisitions" link="#purchase-requisition-listing-and-document" >}}
	{{< card title="Line Items" subtitle="See all requested items across many requisitions" link="#line-items" >}}
	{{< card title="Line Items Queue" subtitle="Line-level approvals in bulk" link="#line-items-queue" >}}
	{{< card title="Approval Request" subtitle="Approve or reject pending requests" link="#approval-request" >}}
	{{< card title="Approval History" subtitle="See what was approved or rejected before" link="#approval-history" >}}
	{{< card title="Settings" subtitle="Fields, workflow, print, approvals, and access" link="#configuration--settings" >}}
	{{< card title="Quick Start" subtitle="Step-by-step guides by role" link="#quick-start-guide" >}}
	{{< card title="FAQ" subtitle="Common questions and answers" link="#faq" >}}
{{< /cards >}}

---

## Key Concepts

### How a Requisition Moves Through Your Company

A purchase requisition follows a lifecycle from creation to completion. The exact steps depend on your company's settings, but the general flow looks like this:

```
Requester creates the requisition
         ↓
      [DRAFT]
         ↓
Requester fills in details and submits for approval
         ↓
Approver reviews in Approval Request
         ↓
    ┌────────────────────────────────────────┐
    │                                        │
 APPROVED                               REJECTED
    ↓                                        ↓
Requisition marked FINAL            Requester is notified,
(locked for changes)                corrects, and resubmits
    ↓
Purchasing raises a purchase order
(separate step — see Internal Purchase Order Applet)

At any point before Final:
VOID or DISCARD → Requisition cancelled (see Glossary for the difference)
```

### Status and Posting Status

You will see two status fields on a requisition. They mean different things:

| Field | What it tells you | Example values |
| --- | --- | --- |
| **Status** | The general working state of the record | Active, Inactive |
| **Posting Status** | Whether the document is still open for editing or locked | Draft, Final |

Once a requisition reaches **Final**, you generally cannot edit it. If a correction is needed, your process may require voiding it and raising a new one — check with your administrator before doing this, as it may affect other related documents.

### Create vs Edit

When you first create a requisition, you see a focused set of tabs: main details, account, and lines. Once saved, you can open the document again to edit it — and the edit view adds extra sections like Attachments, Doc Link, Trace Document, and Generic Doc Approval. These sections only appear after the document has been saved for the first time.

### Tabs and Panels

Depending on how your company has configured the applet, the edit screen may show sections as **horizontal tabs** across the top, or as **expandable panels** down the page. Both contain the same information — only the layout differs. If you are unsure which layout you have, try scrolling down the page to see if there are collapsed panels below the visible content.

---

## Quick Start Guide {#quick-start-guide}

### For Requesters: Create Your First Purchase Requisition

**Goal:** Save a new purchase requisition ready for approval.

1. Open **Internal Purchase Requisition** from the left menu. You will see the list of existing requisitions.
2. Click **Create** (the **+** icon, usually at the top left).
3. On the **Main Details** tab, fill in:
   - **Transaction Date** — the date you are raising the request
   - **Reference** or document number (if your company auto-generates this, it may already be filled in)
   - Any other required header fields shown on your screen, such as company or branch
4. Open the **Account** tab and complete:
   - **Entity Details** — the company or branch making the request
   - **Bill To** — where the invoice should be addressed
   - **Ship To** — where the goods or services should be delivered
5. Open the **Line Items** tab. Click **Add** (or the **+** icon within the tab) for each item you need:
   - Select or type the **Item** name or code
   - Enter the **Quantity**
   - Enter the **Unit Price** if required
   - Add any notes or references for that line
6. If your company uses them and the tabs are visible, complete **Delivery Details**, **Payment**, or **Department Header**.
7. If **KO For** appears and you have a Jobsheet to reference, open that tab, find your Jobsheet in the list, and select it — the relevant details will be brought into your requisition automatically.
8. Click **Create** to save the requisition.

**What happens next?** Your requisition is saved as a draft. Depending on your company's workflow, you may need to click **Final** from the list, or the document will automatically enter the approval queue. Follow your internal purchasing process.

{{< callout type="tip" >}}
**Not ready to submit yet?** Your requisition is saved as a draft as soon as you create it. You can come back at any time to add more details or make changes before it is sent for approval.
{{< /callout >}}

---

### For Approvers: Review and Action a Requisition

**Goal:** Approve or reject a purchase requisition in the approval queue.

1. Open **Approval Request** from the left menu. You will see a list of requisitions waiting for your decision.
2. Click on a record to open it. Review the top section (dates, reference number, who raised it, and which branch or department it is for), the line items, the total amounts, and any attachments or remarks the requester added.
3. When you are ready to decide:
   - Click **Approve** if the requisition is correct, complete, and within your company's spending guidelines.
   - Click **Reject** if changes are needed. Add a remark explaining what needs to be corrected — the requester will see this when the document is returned to them.
4. The record will move out of your queue automatically. Use **Approval History** to confirm your decisions and see a full record of past actions.

{{< callout type="tip" >}}
**Going on leave?** Ask your administrator to check **Approval Settings** and routing so that your queue is covered by a substitute while you are away. Requisitions left in an unattended queue will not progress.
{{< /callout >}}

---

### For Operations: Line Views and Printing

**Goal:** Review items being requested across requisitions, work through a line queue if your company uses one, and print documents when needed.

1. Open **Line Items** from the left menu to see a single list of all lines from many requisitions. Use the filters and search to narrow by item, date, branch, or other criteria.
2. If your company uses **Line Items Queue**, open it to see lines waiting for queue-level approval. Use the **Approve** action when your process calls for it.
3. To print, open the purchase requisition list, select the document or documents you need, and use **Single print** or **Multiple print** when those actions appear.

---

### For Administrators: First-Time Setup Checklist

Complete these steps in order when setting up the applet for the first time.

- [ ] **Step 1:** Open **Settings → Feature Visibility** and turn on the menus and actions each role needs. Disable anything that is not relevant to your company's purchasing process.
- [ ] **Step 2:** Open **Settings → Application Settings** and configure which fields are visible and required on the requisition form.
- [ ] **Step 3:** Set **Default Selection** so the correct company, branch, and location pre-fill for users when they create a new requisition.
- [ ] **Step 4:** Configure **Branch Designation** *(the setting that links users and approval routing to specific branches)* if different branches have different approval rules or defaults.
- [ ] **Step 5:** Set up **Printable Format Settings** so printed requisitions match your company's layout.
- [ ] **Step 6:** Configure **Workflow Settings** and **Approval Settings** — define who approves, in what order, and what conditions (such as document amount or department) determine which approval level applies.
- [ ] **Step 7:** Set **Permissions** so each role (requester, approver, controller) can only see and do what they should.
- [ ] **Step 8:** Create a test requisition, submit it, approve it, and confirm the full flow works before going live.

**Estimated time for basic setup:** 1–2 hours.

---

## Purchase Requisition Listing and Document {#purchase-requisition-listing-and-document}

### The List View

When you open **Internal Purchase Requisition** from the left menu, you see a list of all requisitions your role has access to. From here you can:

- Click **Create** (**+**) to start a new requisition (if you have create access)
- Select a requisition and use **Final** or **Void** when those actions are available for that document's current state
- Select one or more requisitions and use **Single print** or **Multiple print** when printing is enabled
- Search, filter, and adjust which columns appear in the list

The columns typically include document number, company, branch, posting status, status, print status, transaction date, quantities, amounts, and reference fields. The exact columns depend on your settings.

### Create Screen

When creating a new requisition, you will see these tabs:

| Tab | Purpose |
| --- | --- |
| **Main Details** | Document header — dates, references, company, branch, and requester fields |
| **Account** | Entity details, bill-to, and ship-to information |
| **Line Items** | Add the items or services being requested |
| **Delivery Details** | Delivery instructions and shipping notes (shown when enabled) |
| **Payment** | Payment terms or preferred payment method (shown when enabled) |
| **Department Header** | Department-level header fields for cost allocation (shown when enabled) |
| **KO For** | Pull details from an existing Jobsheet to avoid re-entering information (shown when enabled) |

### Edit Screen

After a requisition is saved, opening it to edit reveals additional sections:

| Section | Purpose |
| --- | --- |
| **ARAP** | Links the requisition to the relevant financial accounts for payment processing (used by finance) |
| **Trace Document / Posting** | Shows how this requisition connects to other documents in the chain, such as a purchase order or invoice raised from it |
| **Contra** | Links this document to another document to offset or balance a value — for example, to reduce an amount from a previous requisition |
| **Doc Link** | Attach references to other related documents within BigLedger so they can be found together |
| **Attachments** | Upload files such as supplier quotes, photos, or approval emails |
| **Export** | Export the requisition to a file (such as PDF or Excel) for sharing or filing |
| **Generic Doc Approval** | The section where you start or check the progress of an approval request for this specific document |

**Discard** may also appear on the screen for documents that have not yet been submitted. It removes the draft entirely. Unlike Void, it does not leave a formal cancellation record — check with your administrator before using it.

---

## KO For (Knock-Off) {#ko-for-knock-off}

**Knock-off** (also written as **KO**) means pulling information from an existing document into your requisition so you do not have to type it all in again. Instead of re-entering supplier details or line items by hand, you select the source document and the relevant data is brought across automatically.

In this applet, the **KO For** tab supports knock-off from **Jobsheet**. If you have a Jobsheet that describes the work or materials needed, you can select it here and the relevant details will fill into your requisition.

{{< callout type="info" >}}
Other document types — such as purchase orders or quotations — are not available as knock-off sources in this applet. If you expect a source to appear in **KO For** and it does not, ask your administrator to confirm which document types are enabled for your setup.
{{< /callout >}}

---

## Line Items {#line-items}

The **Line Items** option in the left menu gives you a single list of all individual lines from many purchase requisitions at once. This is useful for operations or procurement teams who want to see what items are being requested across the company without opening each requisition individually. You can filter and search by item, date, branch, or other criteria depending on your settings.

{{< callout type="warning" >}}
The **Line Items menu** is not the same as the **Line Items tab** inside a single purchase requisition. The menu shows lines from all documents; the tab is for adding or editing lines on one specific document only.
{{< /callout >}}

---

## Line Items Queue {#line-items-queue}

The **Line Items Queue** is an approval step that works at the **individual line level**, rather than on the whole document. When this feature is enabled, individual lines from purchase requisitions are placed into a queue, and a user with the correct access rights can approve them in bulk using the **Approve** action.

This is typically used by companies that need a separate sign-off on specific line items before the overall requisition can move forward — for example, IT equipment lines that require sign-off from the IT department before the full requisition is approved by a manager.

{{< callout type="warning" >}}
If the **Line Items Queue** menu or the **Approve** action is missing, the feature may have been turned off in **Settings**, or your role may not include access to it. Contact your administrator if you expect to see it and do not.
{{< /callout >}}

---

## Approval Request {#approval-request}

**Approval Request** is where you go when a purchase requisition is waiting for your decision. The list shows all requisitions currently assigned to you for review.

From here you can:
- Search and filter to find specific requisitions
- Open a record to review the full details, including lines, amounts, and any attachments
- Click **Approve** to move the requisition to the next approver in the chain, or to Final if no further approval is needed
- Click **Reject** to send it back to the requester along with your remarks

Approved requisitions move out of your queue automatically. Rejected requisitions return to the requester so they can make corrections and resubmit.

---

## Approval History {#approval-history}

**Approval History** keeps a permanent record of every approval decision made in this applet. It shows who acted on each requisition, what decision was made, when it happened, and any remarks that were recorded at the time.

Use this view when you need to check what was approved or rejected in the past, trace a decision for a financial review, or confirm that a specific requisition went through the correct approval steps.

---

## Configuration & Settings {#configuration--settings}

Open **Settings** from the left menu. The areas available depend on your company's configuration and your own access level.

| Area | What it controls |
| --- | --- |
| **Application Settings** | Which fields appear on the form and whether they are required |
| **Default Selection** | Pre-filled defaults for company, branch, and location |
| **Printable Format Settings** | How requisitions look when printed |
| **Workflow Settings** | How the document moves between stages and what features are active |
| **Approval Settings** | Who approves, in what order, and what conditions trigger each level |
| **Branch Designation / Branch Settings** | Approval rules and defaults specific to each branch |
| **Feature Visibility and Integrations** | Which menus and actions are visible to each role; connections to external systems |
| **Permissions** | What each user, team, or role can see and do |
| **Release Notes / Change Log** | A record of recent updates and changes made to this applet |

---

## Personalization

**Personalization** lets you set your own defaults — for example, so that your branch is pre-selected every time you create a new requisition — without changing the shared settings for everyone else.

---

## Related Applets

Purchase requisitions are part of a broader purchasing workflow in BigLedger. Depending on how your company works, a requisition is often the first step before other documents are raised.

| Applet | How it relates |
| --- | --- |
| [Internal Purchase Order Applet](/applets/purchase-workflow/internal-purchase-order-applet/) | The typical next step after a requisition is approved — a purchase order is raised to formally commit the purchase with the supplier |
| [Internal Purchase Quotation Applet](/applets/purchase-workflow/internal-purchase-quotation-applet/) | Some companies request a quote from suppliers before or alongside raising a requisition |
| [Internal Purchase GRN Applet](/applets/purchase-workflow/internal-purchase-grn-applet/) | Once goods are delivered, a Goods Received Note (GRN) is raised to confirm receipt against the purchase order |
| [Internal Purchase Invoice Applet](/applets/purchase-workflow/internal-purchase-invoice-no-stock-in-applet/) | Records the supplier invoice for payment after goods or services are received |
| [Purchase Report Applet](/applets/purchase-workflow/purchase-report-applet/) | Reporting across the full purchase workflow, including requisitions and orders |

{{< callout type="info" >}}
Not all of these applets may be visible or enabled for your company. Which applets you can access depends on your role and your company's configuration.
{{< /callout >}}

---

## FAQ {#faq}

**Why can't I see the Create button?**
Your account may not have permission to create purchase requisitions, or the button may have been hidden for your role by an administrator. Contact your administrator and ask them to check your **Permissions** and **Feature Visibility** settings.

**Why are Final, Void, or Print missing from the list?**
These actions only appear when the document is in **Draft** status and your role has access to them. Print is also only shown when a print format has been configured and enabled by your administrator.

**Why don't I see the Delivery Details, Payment, Department Header, or KO For tabs?**
Those tabs are optional and can be hidden by your administrator through **Application Settings** or **Feature Visibility**. If you need one of those tabs and cannot see it, ask your administrator to enable it.

**What is the difference between Void and Discard?**
Both cancel a requisition, but they work differently. **Void** creates a formal cancellation record that is visible in reports and leaves a clear audit trail — use this for requisitions that were properly created and need to be cancelled. **Discard** is for drafts that were never properly completed and removes the document without leaving a cancellation record. If you are unsure which to use, ask your finance team or administrator before taking action.

**My purchase requisition is not showing up in Approval Request — why?**
The most common reasons are: the document is still in **Draft** and has not been submitted for approval yet; the approval routing is sending it to a different approver or branch; or the approval step was not triggered correctly. Open the document, check the **Generic Doc Approval** section to see if an approval task has been created, and contact your administrator if nothing is showing there.

**I submitted a requisition for approval but the approver says they cannot see it. What should I check?**
Ask your administrator to check the **Approval Settings** and confirm that the routing is pointing to the correct approver. Also confirm the document has left **Draft** status — if it is still Draft, the approval task may not have been created yet.

**What do I do if my purchase requisition is rejected?**
When a requisition is rejected, the approver should have left a remark explaining what needs to change. Open the document, read the rejection reason, make the corrections, and resubmit it for approval. If no reason was given, contact the approver directly to ask what needs to be fixed.

**Can I attach a supplier quote or supporting document to my requisition?**
Yes — once the requisition is saved, open it for editing and go to the **Attachments** section. From there you can upload files such as quotes, images, or emails. The **Attachments** section only appears in the edit view, not during initial creation.

**How do I find an old purchase requisition?**
Open **Internal Purchase Requisition** from the left menu to see the list. Use the search bar and filters to narrow down by document number, date, status, or other fields. If you cannot see a document you expect to find, it may be outside your access rights — ask your administrator.

**Can I copy a previous purchase requisition instead of starting from scratch?**
This depends on whether your company's configuration includes a duplicate or copy function. If you do not see that option, raise a new requisition manually. Your administrator can confirm whether copying is supported in your setup.

**Line Items Queue is empty or the menu is missing — why?**
If the menu is missing, the feature may be disabled in **Settings** or your role may not include access to it. If the menu is visible but the queue is empty, there may simply be no lines waiting at this time, or your current filters may be hiding them. Try clearing your filters or contact your administrator.

**Can I edit a purchase requisition after it has been set to Final?**
Once a document reaches **Final**, editing is locked to preserve the record. If a correction is needed, your process may require voiding the document and raising a new one. Check with your administrator or finance team before doing this, as it may affect related documents like a purchase order that was already raised from this requisition.

**Where do purchase requisitions go after they are approved?**
An approved requisition is typically handed off to purchasing, who raise an internal purchase order as the next step. That happens in the **[Internal Purchase Order Applet](/applets/purchase-workflow/internal-purchase-order-applet/)**. The exact process depends on how your company has set things up.

---

## Glossary

**ARAP** — Short for Accounts Receivable / Accounts Payable. The ARAP section is used by your finance team to link the requisition to the correct accounts for payment processing. Most requesters do not need to interact with this section directly.

**Branch** — A specific location, office, or division within your company. Many fields in the applet, such as Bill To and Ship To, are tied to a branch. Your default branch may be pre-filled based on your user settings.

**Branch Designation** — A configuration setting that links users and approval routing to specific branches. For example, a requester in Branch A may automatically have their requisition routed to the Branch A manager for approval.

**Contra** — A section that links a document to another document in order to offset or balance a value. For example, if a previous requisition was raised for too much, a Contra can be used to reduce the outstanding amount against it.

**Cost Centre** — Your department's internal billing or budget reference code. It tells the finance team which department's budget should be used for this purchase. If you do not know your cost centre code, ask your finance team or manager.

**Discard** — Cancels a draft requisition that was never properly completed or submitted. Unlike Void, Discard does not leave a formal cancellation record. Only use this for documents you genuinely want to delete entirely.

**Doc Link** — A section where you can attach references to other related documents within BigLedger, so they can be found and traced together.

**Draft** — The initial stage of a purchase requisition. A document in Draft can still be edited freely. It has not been submitted for approval yet.

**Export** — A feature that lets you download the requisition as a file (such as a PDF or Excel spreadsheet) for sharing or filing outside of BigLedger.

**Final** — A posting status that locks the document. Once a requisition is Final, it generally cannot be edited. This typically happens after the requisition has been approved.

**Generic Doc Approval** — The section on a saved document where you can start an approval request or check the current status of one. When you open a requisition and look for whether it has been sent for approval, this is the section to check.

**Jobsheet** — A document that records the details of a job or service task — typically used in maintenance, operations, or project-based businesses to describe work that needs to be done or materials required. In this applet, a Jobsheet can be used as a source to knock off (copy details) into a purchase requisition.

**Knock-Off (KO)** — The process of pulling data from one document (such as a Jobsheet) into another (such as a purchase requisition), so you do not need to re-enter the same information by hand.

**Line Items Queue** — An approval step that works at the individual line level rather than on the whole document. Lines are placed in a queue and can be approved separately, before or alongside the overall document approval.

**Posting Status** — A field that tells you whether a document is still open for changes (Draft) or locked (Final). This is separate from Status, which tracks the general lifecycle of the record.

**Status** — A field that shows the general working state of a record — for example, whether it is currently Active or has been deactivated. This is separate from Posting Status, which tracks whether the document is locked or still editable.

**Trace Document / Posting** — A view that shows how a purchase requisition connects to other documents in the chain — for example, which purchase order or invoice was raised from it. Useful for tracking the full history of a transaction.

**Void** — A formal cancellation of a purchase requisition that leaves a clear cancellation record visible in reports. Use Void (not Discard) when cancelling a requisition that was properly created, submitted, or approved.

---
