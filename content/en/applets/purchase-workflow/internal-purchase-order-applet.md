---
title: "Internal Purchase Order Applet"
description: "Internal purchase order management for creating POs, approval workflows, supplier management, stock replenishment, and reporting"
tags:
- purchase-order
- procurement
- approval-workflow
- supplier-management
- stock-replenishment
weight: 170
---

## Purpose and Overview

The **Internal Purchase Order Applet** is designed to streamline the full purchase order lifecycle within your organization. It supports creating and editing purchase orders, managing suppliers and line items, approval workflows, stock replenishment, file import/export, and reporting—all in one place. It is used by procurement and purchasing staff, approvers and managers, finance and operations, and system administrators.

{{< callout type="info" >}}
**Core Concept**: The applet links **who** orders (purchaser/supplier), **what** is ordered (line items), and **how** it is approved (workflow) so procurement and finance stay in control.
{{< /callout >}}

## Key Features Overview

### Who Benefits from This Applet?

**Procurement & Purchasing:**
- Create and edit purchase orders with supplier, billing/shipping address, and line items
- Add line items from BPO, PQ, PR, or existing PO where applicable
- Track POs through draft, submitted, and approved states
- Use file import for bulk creation

**Approvers & Managers:**
- Process approval requests in **Approval Request**
- View approval history and monitor pending items
- Configure approval settings and conversion rules

**Finance & Operations:**
- Link POs to payments and contra documents
- Run PO Line with GRN KO and Closed Queue KO reports
- Manage intercompany transactions
- Export data for reconciliation

**Administrators:**
- Configure workflow, default selections, and application settings
- Manage branch settings, email templates, and printable formats
- Set up permissions (permission wizard, permission set, user permission, role permission)
- Use release notes and audit trail for support and audit checks

### What Problems Does This Solve?

**The Manual Purchase Order Problem:**

Managing POs with spreadsheets and email leads to:
- Inconsistent formats and missing data
- Delayed approvals and poor visibility
- No single place for supplier and line-item details
- Difficult reporting and audit trails

**The Internal Purchase Order Applet Solution:**

- **Structured PO creation** — Header, supplier, addresses, line items, payments, and attachments in one flow
- **Approval workflow** — Submit for approval, act in Approval Request, and review history
- **Supplier and item management** — Select supplier, billing/shipping address, and add line items (including from BPO/PQ/PR)
- **Bulk operations** — File import and file export for many POs
- **PO replenishment and reporting** — Replenishment runs/templates/events, PO Line with GRN KO, and Closed Queue KO
- **Configuration** — Workflow, branches, email templates, printable format, and permissions in Settings

---

## Feature Navigation

{{< cards >}}
  {{< card title="Purchase Order" subtitle="Listing, create & edit with supplier and line items" link="#for-procurement-create-your-first-purchase-order" >}}

  {{< card title="Approval Workflow" subtitle="Submit, review, approve/reject, and track history" link="#for-approvers-process-approval-requests" >}}

  {{< card title="File Import & Export" subtitle="Bulk import and export of POs" link="#file-import-and-export" >}}

  {{< card title="PO Replenishment" subtitle="Replenishment runs, events, and templates" link="#po-replenishment" >}}

  {{< card title="Reporting" subtitle="PO Line with GRN KO and Closed Queue KO" link="#reporting" >}}

  {{< card title="Settings & Configuration" subtitle="Workflow, branches, permissions and more" link="#configuration--settings" >}}
{{< /cards >}}

---

## Key Concepts

### Purchase Order Flow

| Aspect | Component | Practical Example |
|--------|-----------|-------------------|
| **Who** orders? | Purchaser / Requester | Procurement officer, Department manager |
| **From whom?** | Supplier & branch | Vendor, billing/shipping address |
| **What** is ordered? | Line items | Items from catalog, BPO/PQ/PR lines |
| **How** is it approved? | Approval workflow & queue | Manager → Finance → Approved |

{{< callout type="tip" >}}
**Real-World Example**: A procurement officer (WHO) creates a PO for office supplies from Vendor ABC (FROM WHOM). They add 5 line items—paper, pens, folders (WHAT). The PO is submitted and routes to their manager, then to finance for approval (HOW). Once approved, the order can proceed to delivery and GRN.
{{< /callout >}}

### PO Statuses Explained

| Status | What It Means | What You Should Do |
|--------|---------------|---------------------|
| **Draft** | PO not yet submitted | Complete details and submit when ready |
| **Submitted** | Waiting for approver | Wait for approval or rejection |
| **Approved** | Approver said yes | Proceed to GRN or invoice as per your process |
| **Rejected** | Approver said no | Read the reason, correct the PO if needed, and resubmit |
| **Closed** | PO fully processed | Use for reference or reporting only |

### Main Views (Routes)

- **Purchase Order** — Default view: listing, then create or edit
- **Line Items** — Dedicated line-items management
- **PO Line with GRN KO** — Report linking PO lines to GRN/KO
- **Closed Queue KO** — Closed queue reporting view
- **PO Replenishment** — Parent menu for replenishment features
  - **Replenishment Runs**
  - **Replenishment Events**
  - **Replenishment Template**
- **File Import** — Bulk import POs
- **File Export** — Export POs
- **Intercompany** — Manual intercompany transactions
- **Purchase Order Queue** — PO open-queue tracking (PO to GRN/KO context)
- **Multi-PO** — Work with multiple POs
- **Approval Request** — Approval action workspace (Approve/Reject)
- **Approval History** — View past approvals
- **PO Free Gift** — Free-gift handling
- **Settings** — All configuration (see Configuration & Settings)

---

## Quick Start Guide

Get up and running quickly with these essential workflows.

### For Procurement: Create Your First Purchase Order

**Goal:** Create a purchase order with supplier, addresses, and line items in a few steps.

1. **Navigate**: Go to **Purchase Order** from the sidebar (default view when you open the applet).
2. **Create header**: Click **"+"** (Create) → **Create Purchase Order** opens.
3. **Enter main details**:
   - Select **Purchaser** (if your setup requires it).
   - Select **Supplier** (or create a new one from the list).
   - Set **Billing Address** and **Shipping Address** (or select shipping entity).
4. **Add line items**:
   - Open the **Lines** tab.
   - Click **"+"** (tooltip: **Create**) to open **Add Item**.
   - Enter or select **Item**, **Quantity**, **Price**, and any other required fields, then click **ADD**.
   - If your flow uses document-based sourcing, use **Search Document** and its tabs: **Search Blanket Purchase Order**, **Search Purchase Quotation**, **Search Purchase Requisition**, or **Search Purchase Order**.
5. **Optional**: Add **Payment** terms, **Contra** documents, or **Attachments** as needed.
6. **Review**: Check all details are correct.
7. **Submit**: In the PO (edit) screen, open the **Submit Approval** section and click **Submit For Approval**.
8. **Confirm next state**: Open **Approval Request** to confirm the document is ready for approver action.
9. **Save strategy (optional but recommended)**: If the PO is not ready for approval, use **SAVE** in edit mode to keep progress and continue later.

**What happens next?** Approvers act in **Approval Request** (Approve/Reject). **Purchase Order Queue** is typically used to track PO open-queue linkage (for downstream GRN/KO flow).

**Pro Tip:** Use **File Import** for many similar POs. If certain menus are hidden, ask your admin to review your permission and menu visibility setup.

---

### For Approvers: Process Approval Requests

**Goal:** Review and approve (or reject) purchase orders in 4 steps.

1. **Check pending**: Go to **Approval Request** from the sidebar. Open a pending request to view details.
2. **Review details**:
   - Check header, supplier, line items, amounts, and any attachments.
   - Confirm the request matches your organization’s policy.
3. **Decide**: Use the **Approve** or **Reject** button at the top of the screen.
   - **Approve**: Click **Approve** → the PO moves to the next step; requester may be notified.
   - **Reject**: Click **Reject** → enter approval remarks when prompted → requester is notified and can correct and resubmit.
4. **Track decisions**: Use **Approval History** to review previous actions and remarks.

**Need handover coverage?** Ask your administrator to review **Approval Settings**, **Approval Monitor**, and **Branch Designation** so approval routing stays correct during leave periods.

---

### Core Feature Walkthrough (Client Onboarding)

**Goal:** Validate the applet’s core capabilities in one guided pass after initial setup.

1. **Queue visibility check**: Open **Purchase Order Queue** and confirm users can see the expected open-queue records.
2. **Bulk import check**: Open **File Import**, upload a small test file, and verify records are created/updated as expected.
3. **Bulk export check**: Open **File Export**, apply filters (for example date range and branch), and export for reconciliation.
4. **Replenishment check**: Open **PO Replenishment** and verify access to **Replenishment Runs**, **Replenishment Events**, and **Replenishment Template**.
5. **Reporting check**: Open **PO Line with GRN KO** and **Closed Queue KO**, then confirm filters and result rows load correctly.
6. **Operational check**: Open **Intercompany** and **Multi-PO** to confirm your team can access the operational views required by your process.
7. **Role check**: Validate menu visibility and actions for at least three roles:
   - Procurement user: create/edit flow
   - Approver: **Approval Request** with **Approve**/**Reject** actions
   - Admin: Settings, permissions, and branch/approval controls

{{< callout type="tip" >}}
For production rollout, run this walkthrough with real branch/supplier data in a staging tenant first, then repeat once in production with a limited pilot user group.
{{< /callout >}}

---

### For Admins: Initial System Setup

**Goal:** Get the Internal Purchase Order applet ready for your users in a few steps.

**Step 1: Branch setup** (`Settings > Branch Settings` and `Settings > Branch Designation`)  
- Configure branches so POs can be assigned to the right locations.

**Step 2: Workflow** (`Settings > Workflow Settings`)  
- Define who approves POs and in what order (e.g. Manager → Finance).  
- Set any conditions (e.g. POs above a certain amount need extra approval).

**Step 3: Default selection** (`Settings > Default Selection`)  
- Set default branch, supplier, or other values so users get sensible defaults when creating POs.

**Step 4: Application settings** (`Settings > Application Settings`)  
- Control which fields are required or visible on the PO and line item forms.

**Step 5: Printable format** (`Settings > Printable Format Settings`)  
- Configure how POs look when printed or exported to PDF.

**Step 6: Email templates** (`Settings > Email Template`)  
- Set up notifications for approval, rejection, and other events.

**Step 7: Approval controls** (`Settings > Approval Settings`, `Settings > Approval Monitor`)  
- Configure approval levels and document-conversion rules.

**Step 8: Permissions** (`Settings > Permission Wizard`, **Permission Set**, **User Permission**, **Role Permission**)  
- Assign who can create, edit, or approve POs.

**Step 9: Test**  
- Create a test PO as a procurement user, approve it as an approver, and confirm the full flow works.

---

{{< callout type="tip" >}}
**New to the system?** Start with the basics:
1. Procurement users: Explore **Purchase Order** and create one PO with a few line items.
2. Approvers: Use **Approval Request** to practice approve/reject actions.
3. Admins: Review **Configuration & Settings** below for detailed setup.
{{< /callout >}}

---

## File Import and Export

**File Import** — Open **File Import** from the sidebar when you need to create or update many POs at once. Upload an Excel or CSV file and follow the on-screen steps to map columns to PO fields. Use this when migrating data or entering a large batch of orders.

**File Export** — Open **File Export** to download PO data for reporting, reconciliation, or use in other systems. Apply filters (e.g. date range, supplier, branch) and choose the format your administrator has configured (e.g. Excel, CSV).

---

## PO Replenishment

Use **PO Replenishment** to manage stock-driven procurement actions. In this menu:
- **Replenishment Runs** handles run/listing workflows for replenishment output.
- **Replenishment Events** handles event-based replenishment tracking.
- **Replenishment Template** stores reusable replenishment templates.

Typical use: set minimum levels and reorder logic so purchase orders can be created or suggested when stock is low.

---

## Reporting

- **PO Line with GRN KO** — See how each PO line links to Goods Received Notes (GRN) and related documents (KO). Use this to track what was ordered vs what was received and to reconcile with suppliers.
- **Closed Queue KO** — Review closed queue records for operational follow-up and audit checks.

Use the filters and columns in each report to narrow by date, supplier, branch, or status.

---

## Configuration & Settings

Access **Settings** from the sidebar to configure how the Internal Purchase Order applet behaves for your organization. The table below summarizes the main options; configure them to match your procurement and approval policies.

| Setting | Purpose |
|--------|---------|
| **Default Selection** | Default branch, supplier, or other values for new POs |
| **Application Settings** | Required and visible fields on PO and line items |
| **Printable Format Settings** | Layout and content of printed/PDF POs |
| **Workflow Settings** | Approval steps and conditions |
| **Email Template** | Notifications for approval, rejection, etc. |
| **Branch Settings** | Branches used for POs and reporting |
| **Branch Designation** | Branch designation setup and related mappings |
| **Approval Settings** | Approval rules and levels |
| **Approval Monitor** | Monitor approval status and conversion rules |
| **Permission Wizard** | Configure permission templates and targets |
| **Permission Set** | Create and maintain reusable permission sets |
| **User Permission** | Assign permissions at user level |
| **Role Permission** | Assign permissions at role level |
| **Release Notes** | In-app release notes |
| **Audit Trail** | Audit log of applet actions |

Configure these according to your organization’s procurement and approval policies.

---

## Permissions (Source-Verified)

The applet behavior is controlled by both **server-side permission inquiry targets** and **client-side menu visibility permissions**.

### Server-side permission targets

| Permission Key | What it Controls |
|--------|---------|
| `TNT_API_DOC_INTERNAL_PURCHASE_ORDER_READ_TGT_GUID` | Read/listing access to purchase-order data (including branch-targeted access) |
| `TNT_API_DOC_INTERNAL_PURCHASE_ORDER_CREATE_TGT_GUID` | Ability to create new purchase orders |
| `TNT_API_DOC_INTERNAL_PURCHASE_ORDER_UPDATE_TGT_GUID` | Ability to update existing purchase orders (for example, save in edit flow) |
| `TNT_API_DOC_INTERNAL_PURCHASE_ORDER_DELIVERY_BRANCH_READ` | Delivery-branch related read behavior in applicable screens |
| `TNT_TENANT_ADMIN`, `TNT_TENANT_OWNER` | Admin/owner override for read/create/update checks |

### Client-side menu visibility permissions

These permission codes are evaluated together with applet hide/show settings:

- `SHOW_LINE_ITEMS_MENU`
- `SHOW_PURCHASE_ORDER_QUEUE_MENU`
- `SHOW_MULTI_PURCHASE_ORDER_MENU`
- `SHOW_PURCHASE_ORDER_REPLENISHMENT_MENU`
- `SHOW_FILE_IMPORT_MENU`
- `SHOW_INTERCOMPANY_MENU`
- `SHOW_FILE_EXPORT_MENU`
- `SHOW_PURCHASE_ORDER_LINE_WITH_GRN_KO_MENU`
- `SHOW_CLOSED_QUEUE_KO_MENU`
- `SHOW_APPROVAL_REQUEST_MENU`
- `SHOW_APPROVAL_HISTORY_MENU`

If a user still cannot see a menu, review both permission assignment and the related applet setting (for example `HIDE_*` menu toggles).

---

## Audit

- Use **Settings > Release Notes** to track applet updates relevant to business users.
- Use **Settings > Audit Trail** to review logged applet actions for support and audit checks.

---

## Personalization

If enabled for your tenant, use personalization features to maintain your preferred defaults (for example, personal default selection and sidebar behavior).

---

## FAQ

**Q: Why can’t I see some menus (Line Items, File Import, Approval Request, etc.)?**  
A: Menu visibility can depend on both permissions and applet settings. Ask your administrator to review your permission assignment and menu visibility configuration.

**Q: I see "Purchase Order needs to be converted from Purchase Requisition" when I click + or try to submit for approval. What do I do?**  
A: Your organization has **document conversion** turned on for this flow: the system expects the PO to have been created **from** a Purchase Requisition (PR) before you can submit for approval. You can fix it in one of two ways:  
- **Option 1 (recommended if your policy requires PR first):** Create a **Purchase Requisition** first (in the Purchase Requisition applet). In the PO flow, open **Lines** → click **+** (Create) → use **Search Document** / **Search Purchase Requisition** to add PR-based lines. That creates the PR→PO link. Save the PO, then open **Submit Approval** and click **Submit For Approval**.  
- **Option 2 (if your org allows POs without a PR):** An administrator turns off the requirement in **Approval Monitor**—see **How do I set Option 2 (disable document conversion required)?** below.

**Q: Why is the + (Create) button disabled in Submit Approval?**  
A: This usually happens when document conversion is required but the PO is not linked from Purchase Requisition. Follow the conversion guidance above or ask your admin to review **Approval Monitor**.

**Q: Can I edit a PO after I've submitted it for approval?**  
A: It depends on your setup. If the PO is still in **Submitted** (pending approval), some tenants allow you to recall or edit it. Once **Approved**, changes may be restricted. Check with your admin or try opening the PO—if **Edit** is available, you can change it.

**Q: My PO was rejected. What do I do?**  
A: Open the PO and read the rejection reason (your approver should have entered it). Correct the details—e.g. wrong supplier, amount, or missing attachment—then resubmit for approval. If the reason is unclear, contact the approver.

**Q: Where do I find POs waiting for my approval action?**  
A: Use **Approval Request**. That is where **Approve** and **Reject** actions are performed. Use **Approval History** to review completed decisions.

**Q: What is Purchase Order Queue used for, then?**  
A: **Purchase Order Queue** is generally used for PO open-queue tracking context (for downstream GRN/KO linkage), not as the main approve/reject workspace.

**Q: How do I add line items from an existing BPO, PQ, PR, or PO?**  
A: In the PO flow, open **Lines**, click **+** (Create), then use **Search Document** tabs (**Search Blanket Purchase Order**, **Search Purchase Quotation**, **Search Purchase Requisition**, **Search Purchase Order**) to pull lines.

**Q: Which permissions usually control why I can read but not create/edit (or vice versa)?**  
A: Commonly: **Read** uses `TNT_API_DOC_INTERNAL_PURCHASE_ORDER_READ_TGT_GUID`, **Create** uses `TNT_API_DOC_INTERNAL_PURCHASE_ORDER_CREATE_TGT_GUID`, and **Edit/Save** uses `TNT_API_DOC_INTERNAL_PURCHASE_ORDER_UPDATE_TGT_GUID`. Tenant admin/owner (`TNT_TENANT_ADMIN`, `TNT_TENANT_OWNER`) can override these checks.

**Q: Can I export POs for the whole year?**  
A: Yes. Open **File Export**, set the date range to cover the full year (and any other filters you need), then run the export. The exact format and filters depend on how your administrator has configured the applet.

**Q: Why are Approve/Reject buttons disabled in Approval Request?**  
A: Buttons are disabled when no row is selected, or when the selected request status already prevents that action (for example, already approved/rejected).

**Q: How do I set Option 2 (disable "document conversion required") so POs don’t need to be created from a PR?**  
A: An administrator with access to the Internal Purchase Order applet Settings can do this:

1. Open the applet and go to **Settings** in the sidebar.
2. Open **Approval Monitor**. You’ll see a list of conversion rules with columns **From**, **To**, and **Remarks**.
3. Find the row where **From** = `INTERNAL_PURCHASE_REQUISITION` and **To** = `INTERNAL_PURCHASE_ORDER`. Click that row to open **Edit Approval Monitor**.
4. On the edit screen, **uncheck** the box **"Is Document Conversion Required"**.
5. If there is an **Update** or **Save** button, click it to save. If the Edit screen has no update action available in your setup, you can instead:
   - Click **Back**, then use **Delete** from the listing or edit screen to remove the existing rule (only if you’re sure no other process needs it), then
   - Click **+** (Create) to **Add Approval Monitor** and create a new rule with **From**: `INTERNAL_PURCHASE_REQUISITION`, **To**: `INTERNAL_PURCHASE_ORDER`, **Remarks** as needed, and **leave "Is Document Conversion Required" unchecked**. Click **ADD** to save.

After the rule is updated or recreated with the checkbox off, users can submit POs for approval even when the PO was not created from a Purchase Requisition.

---