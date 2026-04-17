---
title: "Blanket Purchase Order Applet"
description: "Long-term purchase agreements and recurring supplier contracts with release management"
tags:
- procurement
- purchase-agreements
- supplier-management
- contract-purchasing
- cost-control
weight: 200
date: 2026-04-08
lastmod: 2026-04-24
draft: false
---

## Purpose and Overview

The **Blanket Purchase Order Applet** streamlines the management of long-term purchase agreements with suppliers. Instead of creating individual purchase orders for recurring needs, you establish a single agreement covering multiple deliveries over time—saving administrative effort, negotiating better prices through volume commitment, and simplifying supplier relationships.

{{< callout type="info" >}}
**Core Concept**: A Blanket PO is like a "purchasing credit line" with a supplier—you agree on terms, prices, and total value upfront, then make individual releases as needed without renegotiating each time.
{{< /callout >}}

### What is a Blanket Purchase Order?

A Blanket Purchase Order (BPO) is a long-term purchasing agreement with one supplier.

You agree on the validity period, covered items, and pricing once. After that, your team can create multiple release transactions against the same agreement instead of creating a brand-new PO each time.

In practical terms:

- Use one BPO to control total spending for a supplier/category.
- Reuse negotiated prices during the agreement period.
- Track all related releases from the same document.

---

## Key Features at a Glance

The applet is built for recurring purchasing with one master agreement, controlled exposure (validity and maximum amount), negotiated line pricing, linked downstream documents in **Doc Link**, and a **Report** listing for review.

- **Long-term agreements** — Define 3-month, 6-month, or yearly purchase contracts
- **Maximum value contracts** — Set spending caps with automatic tracking
- **Release management** — Create multiple delivery releases against one agreement
- **Pre-negotiated pricing** — Lock in prices for the contract duration
- **Multi-item contracts** — Cover multiple SKUs in a single blanket PO
- **Validity period tracking** — Monitor active, expiring, and expired agreements
- **Spend monitoring** — Track committed vs. available balance in real-time
- **Flexible releases** — Release full quantities or partial amounts as needed
- **Supplier relationship** — Build long-term partnerships with preferred vendors
- **Audit trail** — Complete history of all releases against each agreement

{{< cards >}}
  {{< card title="BPO Listing" subtitle="Manage all blanket purchase orders in one place" link="#blanket-purchase-order-listing---your-agreements-dashboard" >}}
  {{< card title="Line Items" subtitle="Define products and services covered by the agreement" link="#line-items---what-youre-buying" >}}
  {{< card title="Releases" subtitle="Create delivery authorizations against the blanket PO" link="#doc-link---tracking-releases-and-related-documents" >}}
  {{< card title="Supplier Info" subtitle="Supplier entity on create and Account tab on view" link="#account-and-supplier-information" >}}
  {{< card title="Department" subtitle="Allocate costs to specific cost centers" link="#department-assignment" >}}
  {{< card title="Settings" subtitle="Configure defaults, formats, and permissions" link="#configuration--settings" >}}
{{< /cards >}}

{{< figure src="/images/blanket-purchase-order-applet/blanket-purchase-order-overview.png" alt="Transforming Procurement with Blanket Purchase Orders: Three-column infographic showing procurement challenges, BPO solutions, and user benefits" caption="Transforming Procurement: The Challenges (redundant admin work, inconsistent pricing, slow response, poor visibility, transactional relationships) vs The Solution (purchasing credit line, efficient release management, locked-in pricing, real-time tracking, streamlined dashboard) vs Who Benefits (procurement staff, department users, managers, finance teams, suppliers)." >}}

---

## Key Concepts

Use these concepts when working in the applet:

- **BPO Header**: the agreement shell (supplier, validity dates, status, references).
- **Line Items / Lines**: the item/price scope that can be consumed (**Line Items** on create, **Lines** on view).
- **Release Transaction**: downstream document created against the BPO (in this implementation, via Purchase Order (Internal) knock-off).
- **Doc Link**: relationship view for linked documents and release activity.
- **Posting Status**: lifecycle state that controls whether further edits/actions are allowed.

---

## Account and supplier information {#account-and-supplier-information}

On **Create Blanket Purchase Order**, supplier and account details are edited on the **Supplier Info** tab (shared account-entity component). On **View Blanket Purchase Order**, the same area is shown as the **Account** tab; the first tab is **Main Details** (not “Main”). Tab order can follow your administrator’s **Default Selection → Details Tab Ordering** configuration for this applet.

---

## Quick Start Guide

Get up and running quickly with these role-specific workflows.

### For Procurement Staff: Create Your First Blanket PO

**Goal:** Establish a long-term purchase agreement with a supplier.

1. **Navigate**: Click **Blanket Purchase Order** in the sidebar (opens **Create Blanket Purchase Order** / listing workflow for your role).
2. **Create new**: Click **+** (Create) on the listing when your permissions allow it → **Create Blanket Purchase Order** opens.

#### BPO listing (dashboard) {#blanket-purchase-order-listing---your-agreements-dashboard}

{{< figure src="/images/blanket-purchase-order-applet/main-listing.png" alt="Blanket Purchase Order Listing showing agreement summary with Supplier, Valid From/To, Maximum Amount, and Status columns" caption="BPO Listing: View all purchase agreements with validity periods and spend tracking at a glance" >}}

3. **Main** tab — complete header fields shown by your field settings, for example:
   - Document number (or auto-numbering)
   - Transaction date
   - Valid from / valid to (example dates only, e.g. Jan 1–Dec 31)
   - Reference and maximum amount (example currency amounts are illustrative)
   - Branch and location where shown
4. **Supplier Info** tab — search and select the supplier / account entity (same data appears as **Account** on the view screen).
5. **Line Items** tab — use **Add Line Item** (column workflow) to add covered items, unit price, optional maximum quantity, and repeat as needed.
6. **CREATE** — Click **CREATE** (and **RESET** only if you intend to clear the draft). This saves the document per your posting rules.
7. **Activate** — Open **View Blanket Purchase Order** from the listing, review **Main Details**, **Account**, and **Lines**, then click **FINAL** when the agreement should become active (**SAVE** may appear for in-progress edits; **VOID** / **DISCARD** follow your approval policy).
8. **Department** (optional) — If your process uses header department allocation, use the **Department Hdr** tab on **View Blanket Purchase Order** when it is visible (the create screen may not show department until after save, depending on build and settings).

**What happens next?** After **FINAL** (and any posting rules your tenant applies), the blanket PO is active. Authorized staff can create releases against it from **Purchase Order (Internal)** as described below. Spend and limits are enforced in line with your configuration.

**Pro Tips:**

- **Set Realistic Maximum Amounts**: Base on historical spend data (review last year's transactions)
- **Add Buffer**: Set max at 110-120% of expected spend for flexibility
- **Use Round Numbers**: RM 50,000 is clearer than RM 47,350 for budget discussions
- **Document Supplier Contact**: Add key contact details on **Supplier Info** (create) or **Account** (view)
- **Attach Signed Agreement**: Upload the supplier-signed contract for audit compliance

**Common Mistakes to Avoid:**

- Creating Blanket POs without supplier confirmation (get written agreement first)
- Setting unrealistic validity periods (too long = stale pricing, too short = admin overhead)
- Forgetting to add line items (a Blanket PO without items can't be used)
- Not assigning departments (makes cost tracking difficult later)

---

### For Requesting Departments: Create a Release Against Blanket PO

**Goal:** Create an **Purchase Order (Internal) (IPO)** that consumes quantity from an active Blanket PO.

{{< callout type="info" >}}
In this implementation, there is no direct **"Create Release"** button inside Blanket PO **Doc Link**. The release transaction is created from the **Purchase Order (Internal)** applet.
{{< /callout >}}

**Before you start:**

- In **Purchase Order (Internal) Listing**, the **"+" (Create)** button is enabled for your user.
- In **Create Purchase Order**, the **KO For** tab is visible.
- Inside **KO For**, the **Blanket Purchase Order** tab is visible.
- The KO list contains at least one BPO row to select.
- The **CREATE** button becomes enabled only when:
  - **Main Details** form is valid,
  - **Account** entity form is valid,
  - and at least one line exists in **Lines**.

If **KO For** or **Blanket Purchase Order** is missing, contact your administrator to enable IPO knock-off from Blanket Purchase Order.

**Exact IPO click path (UI labels as implemented):**

1. Open **Purchase Order (Internal)** applet.
2. In **Purchase Order (Internal) Listing**, click the **"+" (Create)** button.
3. In **Create Purchase Order** screen, open **Main Details** tab and complete required fields.
4. Open **Account** tab and select the supplier/entity.
5. Open **KO For** tab.
6. Inside **KO For**, click **Blanket Purchase Order**.
7. Use the advanced search area if needed, then select one BPO row.
8. Click **KNOCK OFF**.
9. Open **Lines** tab and confirm BPO items/quantities were imported.
10. Click **CREATE** (top-right of **Create Purchase Order**).
11. Back in **Purchase Order (Internal) Listing**, select the new IPO row, then click **FINAL**.

{{< figure src="/images/blanket-purchase-order-applet/IPO-KO-FOR-TAB.png" alt="Purchase Order (Internal) listing and Create Purchase Order screen with KO For tab and KNOCK OFF button highlighted" caption="Purchase Order (Internal): Open a new IPO and use the KO For tab to knock off from Blanket Purchase Order." >}}

{{< figure src="/images/blanket-purchase-order-applet/IPO-LINES-TAB.png" alt="Edit Purchase Order screen with Lines tab and imported line items highlighted" caption="Purchase Order (Internal): Review imported items in the Lines tab before finalizing." >}}

This finalized IPO is the release transaction against the Blanket PO.

**Where to verify the release in Blanket PO:**

- Open the Blanket PO and check **Doc Link** (Copied From / Copied To) for related documents.
- At line level, open **Purchase Order** tab (if enabled) to see linked IPO quantities and open quantity.

**Pro Tips:**

- **Check Available Balance First**: Avoid rejected releases due to insufficient budget
- **Use Descriptive IPO References**: "Marketing Dept - Q1 Materials" vs. "Release 1"
- **Attach Supporting Docs**: If internal approval needed, attach request form
- **Monitor Delivery Status**: Follow up on releases stuck in "Sent" for > 5 days
- **Coordinate with Team**: Share BPO reference number with colleagues to avoid duplicate agreements

**What to Do if Balance is Insufficient:**

1. Check if you selected the correct Blanket PO (maybe another agreement covers this item)
2. Review Doc Link tab to see where budget was spent
3. Contact Procurement to request budget increase or renewal
4. Consider splitting your order across multiple periods if renewal is imminent

---

### For Procurement Managers: Monitor Agreement Utilization

**Goal:** Monitor agreement status, validity, and release activity.

1. Open **Blanket Purchase Order** from the sidebar (blanket purchase order listing).
2. Use **Advanced Search** to narrow the list by **Supplier**, **Branch**, **Creation Date**, and **Transaction Date** (visible search fields depend on configuration).
3. In the listing grid, review columns such as **Posting Status**, **Status**, **Amount**, **Transaction Date**, and **Updated Date** (column set can follow application settings).
4. Click a row to open **View Blanket Purchase Order**, then open the **Main Details** tab and review header fields shown for your tenant (for example start/valid dates, status, reference).
5. Open the **Doc Link** tab. Inside Doc Link, use the **Copied From** and **Copied To** sub-tabs. Each grid is server-driven and includes columns such as **Doc No**, **Branch**, **Server Doc Type**, **Status**, and **Date**; use row actions or drill-down from the grid if your build exposes them.

Use **FINAL**, **VOID**, **DISCARD**, or **SAVE** on the view header only when the document state and your permissions match your approval policy.

**Going on Leave?** Delegate Blanket PO approval authority to your deputy to avoid blocking urgent releases.

---

### For Finance Teams: Budget Control and Reporting

**Goal:** Monitor procurement spend against approved budgets.

{{< figure src="/images/blanket-purchase-order-applet/REPORT-BPO.png" alt="Blanket Purchase Order Report Listing screen showing report menu and report grid" caption="Blanket Purchase Order Report Listing: Review BPO records by company, supplier, amount, created date, and status." >}}

1. **Access reports**: Click **Report** in the sidebar (blanket purchase order report listing), or return to **Blanket Purchase Order** for the main agreement listing.
2. **Filter**: Use the report or listing search tools your administrator enabled (for example company, supplier, dates).
3. **Export for analysis**: Use grid export options when available (for example Excel) for budget variance work.
4. **Review releases**: Open **View Blanket Purchase Order** → **Doc Link** → **Copied To** / **Copied From** to see linked documents and status columns from the grid.

**What to Watch For:**
- Blanket POs approaching 100% utilization (may need budget increase approval)
- Expired Blanket POs with open releases (clean up or extend agreement)
- Duplicate agreements with the same supplier (consolidation opportunity)

---

### For Admins: Initial System Setup

**Goal:** Configure only the screens that are wired in this applet.

1. Open **Settings → Application Settings** (field configuration for this applet: document actions, line and column visibility, and related toggles). Use **SAVE** when finished.
2. Open **Settings → Default Selection**
   - Set default branch, location, company, and layout options your form provides.
   - Arrange **Details Tab Ordering** for view screens and click **SAVE**.
3. Open **Settings → Printable Format Settings** to maintain formats used by **EXPORT AS PDF**.
4. Open **Settings → Branch Settings** for branch listing, settlement, and branch pricing where your process requires it.
5. **Access and visibility** — Hand off to your **IT team or tenant administrator**: who can see the applet, create or edit documents, use knock-off in Purchase Order (Internal), and related options are configured under **Settings** (for example feature visibility, permission wizard, permission sets, and user or role assignments). Validate with test users before production rollout.

---

{{< callout type="tip" >}}
**New to Blanket POs?** Start small:
1. Procurement should create 1-2 agreements with high-volume suppliers (office supplies, consumables)
2. Train 2-3 department users on creating releases
3. Review Doc Link weekly to ensure releases are linked and progressing.
{{< /callout >}}

---

## Line Items - What You're Buying

Line items define the products/services covered by the agreement and their negotiated prices. On **Create Blanket Purchase Order** the tab is **Line Items**; on **View Blanket Purchase Order** the same grid is under the **Lines** tab title.

| Field | Purpose |
|---|---|
| Item Code | Identifies the SKU/service |
| Description | Clarifies exactly what is ordered |
| Unit Price | Locks commercial terms for releases |
| UOM | Prevents quantity/unit mismatch |
| Maximum Quantity (Optional) | Adds quantity control per item |

**Practical tips:**

- Keep descriptions specific so requesters choose the right items.
- Keep UOM consistent with inventory/accounting usage.
- Use maximum quantity only where item-level control is needed.
- Remove unused lines during renewal to keep agreements clean.

---

## Doc Link - Tracking Releases and Related Documents

**What is Doc Link?**

On **View Blanket Purchase Order**, open the **Doc Link** tab. Inside Doc Link, two sub-tabs are implemented: **Copied From** and **Copied To**. Each sub-tab shows a server-side grid of linked documents for the current context (with pagination and column tools like other listings).

**Columns shown in the grids (as implemented):**

- **Doc No**, **Branch**, **Server Doc Type**, **Status**, **Date**

Row click behavior (for example opening a linked document) depends on your build and permissions; use the grid and any actions your administrator trained you on.

**Why use it**

- See which downstream documents were created from this blanket PO (**Copied To**) and upstream links where applicable (**Copied From**).
- Support audits and dispute resolution with a single place to review document numbers, types, and status next to dates.

**Tips**

- Review **Copied To** after users create internal purchase orders from this agreement.
- If a link is missing, confirm the knock-off flow completed and that feature visibility allows the related applet screens.

---

## Department Assignment

**Why Assign Departments?**

Department assignment allocates the Blanket PO (and its releases) to specific **cost centers** for accounting and budgeting purposes.

**Use Cases:**
- **Budget Allocation**: Track which department's budget is being consumed
- **Cost Control**: Limit release creation to authorized departments
- **Financial Reporting**: Generate spend reports by department or cost center
- **Charge-Back**: Allocate supplier invoices to the correct department for internal billing

**How to Assign:**
1. Open **View Blanket Purchase Order** and go to the **Department Hdr** tab when it is visible for your tenant.
2. Select **Department** or **Cost Center** from the controls shown.
3. Use **SAVE** on the view header (or your trained save path) so header department values persist according to posting rules.

**Tip:** For multi-department agreements (e.g., company-wide IT services), you can either:
- Assign at release level (each department creates their own releases)
- Use a central "Procurement" department and re-allocate costs later via journal entries

---

## Export and Attachments

### Export - Professional Documents

Generate PDF documents for:
- Sending formal Blanket PO agreements to suppliers
- Internal approval documentation
- Audit records

**How to Export:**
1. Open **View Blanket Purchase Order** and go to the **Export** tab.
2. Choose a **Printable Format** from the selector (formats are maintained under **Settings → Printable Format Settings**).
3. Click **EXPORT AS PDF**.
4. Email to the supplier or save the file for records.

---

### Attachments - Supporting Documentation

Store all agreement-related files:
- Supplier quotes and proposals
- Signed contracts
- Approval emails
- Negotiation correspondence
- Supplier certifications

**How to Add Attachments:**
1. Open **View Blanket Purchase Order** and go to the **Attachments** tab.
2. Click the **+** control (tooltip **Create**) on the attachments listing toolbar to start the add flow.
3. Upload the file (PDF, Excel, Word, images, as supported) and complete description fields your screen shows.
4. Finish using **SAVE** or the completion action your training describes.

**Best Practice:** Attach the signed supplier agreement copy for audit compliance.

---

## Configuration & Settings

Most **permission and role** work is done by your company’s **IT or tenant administrators**. This section only summarizes the **Settings** areas procurement users hear about most; admins follow the same menus in the applet.

### Application Settings

**Settings → Application Settings** — Field configuration for the applet (which document actions and line fields appear, required vs hidden fields, and similar behavior). Save changes with **SAVE**.

### Default Selection

**Settings → Default Selection** — Company-wide defaults such as branch, location, company, listing layout, and **Details Tab Ordering** on view screens. Use **SAVE** to persist and **RESET** to clear defaults where offered.

### Printable Format Settings

**Settings → Printable Format Settings** — Maintain the print templates used when users run **EXPORT AS PDF** from a blanket PO.

### Branch Settings

**Settings → Branch Settings** — Branch master data and related settlement or pricing setup when your implementation uses it.

### Access and visibility {#permissions}

Administrators configure **who sees the applet and what they can do** from **Settings**, using the standard BigLedger tools (for example **Feature visibility**, **Permission wizard**, **Permission set**, **User**, **Team**, or **Role** permission screens, plus **Webhook** or **Role pricing scheme link** where your project enables them). Exact steps depend on your governance model—this user guide does not list internal permission codes.

---

## FAQ

### 1. I opened the blanket PO—where is the “Create release” button?

Releases are not created inside this applet. Your team creates an internal purchase order (**Purchase Order (Internal)**), then uses **KO For** → **Blanket Purchase Order** → **KNOCK OFF** to pull from the agreement. See [Create a Release Against Blanket PO](#for-requesting-departments-create-a-release-against-blanket-po).

---

### 2. I don’t see + (Create) on Purchase Order (Internal), or KO For is missing

You need **create** permission on **Purchase Order (Internal)** and the knock-off tabs enabled for your role. Ask your administrator to check **Feature visibility** and **User / Team / Role** assignments for the IPO applet—not only the blanket PO applet.

---

### 3. Blanket Purchase Order does not appear under KO For, or my BPO is never in the search list

Typical causes: the BPO is not **finalized** for your process, **supplier / account** on the IPO does not match the agreement, **branch / company** scope differs, or the agreement is **outside valid dates** / already fully used. Confirm you are searching the right entity and open **View Blanket Purchase Order** on the BPO to check status and validity before raising an IPO.

---

### 4. CREATE stays disabled on Create Purchase Order (IPO) after knock-off

**CREATE** only enables when **Main Details** and **Account** are valid and **Lines** has at least one line. Complete required header fields, fix validation errors (often red tab labels), and confirm **KNOCK OFF** actually imported lines—if the grid is empty, **CREATE** stays off.

---

### 5. I used KNOCK OFF but Lines are empty or wrong

You may have picked the wrong BPO row, a BPO **without lines** for the items you need, or a document that does not allow further draw for those items. Clear the KO selection and try again, or open the BPO’s **Lines** tab (view) with procurement to confirm item codes and remaining scope.

---

### 6. FINAL is missing, greyed out, or I only have SAVE on the blanket PO

**FINAL**, **VOID**, **DISCARD**, and **SAVE** visibility depend on **posting status** and permissions. Draft agreements often use **SAVE** until rules allow **FINAL**. If you expect **FINAL** and never see it, check role permissions and whether someone else must approve the document in your workflow.

---

### 7. I clicked **CREATE** on the blanket PO but colleagues still cannot use it for knock-off

They may be on a **different branch or company default**, the document may still be **draft** until **FINAL**, or listing filters hide it. Confirm **Default Selection** (personal and company) and ask them to search by supplier and document number. Procurement should confirm the BPO is in the state your process calls “active.”

---

### 8. Doc Link is empty after I finalized an internal PO

Links appear when the system has recorded the relationship for that BPO context. Wait for save/posting to finish, **refresh** or reopen **View Blanket Purchase Order**, and check **Copied To**. If it stays empty, the IPO may not have completed knock-off against this header, or integration lag applies—compare **Doc No** on the IPO with procurement and your administrator.

---

### 9. I cannot find the Account tab when creating a new blanket PO

On **Create Blanket Purchase Order** the supplier area is the **Supplier Info** tab. **Account** is the label used on **View Blanket Purchase Order** for the same content. See [Account and supplier information](#account-and-supplier-information).

---

### 10. There is no Department tab while I am creating the blanket PO

The create screen in this applet may not show **Department Hdr** until you work in **View Blanket Purchase Order** (depending on build and settings). Assign department on **View Blanket Purchase Order** → **Department Hdr** when that tab is visible.

---

### 11. EXPORT AS PDF fails or the layout looks wrong

Check **Settings → Printable Format Settings** for a valid format, your **network** access to the print service, and that you still have permission to export. Retry after your administrator updates the printable format or your role.

---

### 12. I created the wrong blanket PO by mistake—what now?

Use **VOID** or **DISCARD** on **View Blanket Purchase Order** only if your policy and the current **posting status** allow it. If those actions are hidden, do not delete data ad hoc—ask procurement or an administrator to correct or reverse per your tenant rules.

---

### 13. Every new blanket PO picks the wrong branch or location

Defaults come from **Settings → Default Selection** (company) and **Personalization → Default Selection** (your user). Administrators can fix company defaults; you can adjust personal defaults if you are allowed. If branch or location choices look wrong for some users but not others, ask your administrator to review default selection scope—see [Configuration & Settings](#configuration--settings).

---

### 14. Users suddenly “lost” blanket PO access—what should an admin check first?

Confirm **Feature visibility** and permission assignments for this applet as described under [Access and visibility](#permissions). For IPO knock-off issues, validate **Purchase Order (Internal)** access and **KO For** visibility in parallel—fixing only the blanket PO side is often not enough.

---

