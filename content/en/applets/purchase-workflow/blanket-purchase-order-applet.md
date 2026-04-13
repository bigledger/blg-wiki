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

## Key Features Overview

The applet is designed to handle recurring purchasing with control and traceability:

- Create one agreement and reuse it for multiple releases.
- Control total exposure with validity dates and maximum amount.
- Keep negotiated item pricing in one place (Lines tab).
- Track related downstream documents from Doc Link.
- Use reporting/listing views for operational review.

---

## Key Features at a Glance

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
  {{< card title="Supplier Info" subtitle="Manage supplier details and contact information" link="#for-procurement-staff-create-your-first-blanket-po" >}}
  {{< card title="Department" subtitle="Allocate costs to specific cost centers" link="#department-assignment" >}}
  {{< card title="Settings" subtitle="Configure defaults, formats, and permissions" link="#configuration--settings" >}}
{{< /cards >}}

{{< figure src="/images/blanket-purchase-order-applet/blanket-purchase-order-overview.png" alt="Transforming Procurement with Blanket Purchase Orders: Three-column infographic showing procurement challenges, BPO solutions, and user benefits" caption="Transforming Procurement: The Challenges (redundant admin work, inconsistent pricing, slow response, poor visibility, transactional relationships) vs The Solution (purchasing credit line, efficient release management, locked-in pricing, real-time tracking, streamlined dashboard) vs Who Benefits (procurement staff, department users, managers, finance teams, suppliers)." >}}

---

## Key Concepts

Use these concepts when working in the applet:

- **BPO Header**: the agreement shell (supplier, validity dates, status, references).
- **Line Items**: the item/price scope that can be consumed.
- **Release Transaction**: downstream document created against the BPO (in this implementation, via Purchase Order (Internal) knock-off).
- **Doc Link**: relationship view for linked documents and release activity.
- **Posting Status**: lifecycle state that controls whether further edits/actions are allowed.

---

## Quick Start Guide

Get up and running quickly with these role-specific workflows.

### For Procurement Staff: Create Your First Blanket PO

**Goal:** Establish a long-term purchase agreement with a supplier in 7 steps.

1. **Navigate**: Go to **Blanket Purchase Order** from the sidebar
2. **Create New**: Click **"+"** → A blank Blanket PO form opens
3. **Fill Main Details**:
   - Enter **Document Number** (or use auto-numbering)
   - Set **Transaction Date** to today
   - Set **Valid From** and **Valid To** dates (e.g., Jan 1 - Dec 31, 2024)
   - Enter **Reference** (e.g., "2024 Office Supplies Agreement")
   - Set **Maximum Amount** (e.g., RM 50,000)
   - Select **Branch** and **Location**
4. **Select Supplier**: Go to **Account** tab → Search and select supplier (e.g., "ABC Office Supplies Ltd.")
5. **Add Line Items**: Go to **Lines** tab → Click **"Add Line Item"**:
   - Select item code (e.g., "A4 Paper - 80gsm")
   - Enter agreed **Unit Price** (e.g., RM 25.00)
   - Optional: Enter **Maximum Quantity** if applicable
   - Repeat for all items covered by the agreement
6. **Assign Department** (Optional): Go to **Department** tab → Assign cost center or department code
7. **Finalize**: Review all details → Click **FINAL** → Blanket PO is active

{{< figure src="/images/blanket-purchase-order-applet/main-listing.png" alt="Blanket Purchase Order Listing showing agreement summary with Supplier, Valid From/To, Maximum Amount, and Status columns" caption="BPO Listing: View all purchase agreements with validity periods and spend tracking at a glance" >}}

**What happens next?** The Blanket PO is now active. Authorized staff can create releases against it. The system tracks cumulative spend and prevents releases exceeding the maximum value.

**Pro Tips:**

- **Set Realistic Maximum Amounts**: Base on historical spend data (review last year's transactions)
- **Add Buffer**: Set max at 110-120% of expected spend for flexibility
- **Use Round Numbers**: RM 50,000 is clearer than RM 47,350 for budget discussions
- **Document Supplier Contact**: Add key contact details in the Account tab
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

1. Open **Blanket Purchase Order Listing**.
2. Use **Advanced Search** to narrow the list by **Supplier**, **Branch**, **Creation Date**, and **Transaction Date**.
3. In the listing grid, review these columns for each agreement:
   - **Posting Status**
   - **Status**
   - **Amount**
   - **Transaction Date**
   - **Updated Date**
4. Click a row to open **View Blanket Purchase Order**, then check **Main** tab:
   - **Start Date**
   - **Valid Date**
   - **Validity in Day(s)**
   - **Status**
   - **Reference No.**
5. In the same document, open **Doc Link** tab and review **Copied To** to monitor releases:
   - **Doc No**
   - **Item Code**
   - **Quantity**
   - **Server Doc Type**
   - **Status**
   - **Date**

Use **FINAL**, **VOID**, or **DISCARD** only when the document state matches your approval decision.

**Going on Leave?** Delegate Blanket PO approval authority to your deputy to avoid blocking urgent releases.

---

### For Finance Teams: Budget Control and Reporting

**Goal:** Monitor procurement spend against approved budgets.

{{< figure src="/images/blanket-purchase-order-applet/REPORT-BPO.png" alt="Blanket Purchase Order Report Listing screen showing report menu and report grid" caption="Blanket Purchase Order Report Listing: Review BPO records by company, supplier, amount, created date, and status." >}}

1. **Access Blanket PO Reports**: Go to **Reports** or **Blanket PO Listing**
2. **Filter by Department/Branch**: See committed spend by cost center
3. **Export for Analysis**: Download to Excel for detailed budget variance analysis
4. **Review Releases**: Check **Doc Link** tab on each Blanket PO to see all releases and their status

**What to Watch For:**
- Blanket POs approaching 100% utilization (may need budget increase approval)
- Expired Blanket POs with open releases (clean up or extend agreement)
- Duplicate agreements with the same supplier (consolidation opportunity)

---

### For Admins: Initial System Setup

**Goal:** Configure only the screens that are wired in this applet.

1. Open **Settings > Application Settings** (`settings/field-settings`)
   - Configure field/column behavior flags used by the applet, such as document action visibility and line-item field visibility.
2. Open **Settings > Default Selection** (`settings/default-selection`)
   - Set `DEFAULT_BRANCH`, `DEFAULT_LOCATION`, `DEFAULT_TOGGLE_COLUMN`, and `DEFAULT_ORIENTATION`.
   - Arrange **Details Tab Ordering** and click **SAVE**.
3. Open **Settings > Printable Format Settings** (`settings/printable-format-settings`)
   - Maintain printable format records (listing/add/edit).
4. Open **Settings > Branch Settings** (`settings/branch-settings`)
   - Maintain branch-related settlement and branch pricing scheme configuration.
5. Configure access and visibility routes from **Settings**:
   - `settings/permission-wizard-listing`
   - `settings/permission-set-listing`
   - `settings/user-permission-listing`
   - `settings/team-permission-listing`
   - `settings/role-permission-listing`
   - `settings/client-side-permission-listing`
   - `settings/feature-visibility`

After setup, validate with test users (procurement, requester, manager) before production rollout.

---

{{< callout type="tip" >}}
**New to Blanket POs?** Start small:
1. Procurement should create 1-2 agreements with high-volume suppliers (office supplies, consumables)
2. Train 2-3 department users on creating releases
3. Review Doc Link weekly to ensure releases are linked and progressing.
{{< /callout >}}

---

## Line Items - What You're Buying

Line items define the products/services covered by the agreement and their negotiated prices.

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

The **Doc Link** tab shows **related documents** linked to this Blanket PO (for example, documents in **Copied From** and **Copied To**). It is your transaction history view, connecting the master agreement to downstream purchasing activity.

**What You Can See:**
- All releases created from this Blanket PO
- Release dates and amounts
- Cumulative spend vs. available balance
- Status of each release (Draft, Sent, Received, Invoiced)
- Quick navigation to release documents

---

**Key Benefits of Doc Link Tracking:**

- **Complete Audit Trail**: See every transaction against the agreement  
- **Spend Visibility**: Real-time tracking of committed vs. available budget  
- **Fast Navigation**: Click on any release to view or edit details  
- **Status Monitoring**: Know which releases are pending, received, or invoiced  
- **Supplier Performance**: Identify delivery delays or issues by tracking release fulfillment

---

**Tips:**

- **Review Regularly**: Check Doc Link tab weekly to monitor utilization patterns  
- **Close Old Releases**: Mark completed releases as "Closed" to keep the list clean  
- **Use Release References**: Add clear references (e.g., "Manufacturing Floor - Week 8") for easy tracking  
- **Monitor Pending**: Follow up on releases stuck in "Sent" status for too long

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
1. Go to **Department** tab in the Blanket PO
2. Select **Department** or **Cost Center** from dropdown
3. Save → All releases against this Blanket PO will inherit this assignment

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
1. Go to **Export** tab
2. Select **Printable Format** (e.g., "Standard Blanket PO", "Supplier Copy")
3. Click **Export as PDF**
4. Email to supplier or save for records

---

### Attachments - Supporting Documentation

Store all agreement-related files:
- Supplier quotes and proposals
- Signed contracts
- Approval emails
- Negotiation correspondence
- Supplier certifications

**How to Add Attachments:**
1. Go to **Attachments** tab
2. Click **"Add Attachment"**
3. Upload file (PDF, Excel, Word, images)
4. Add description
5. Save

**Best Practice:** Attach the signed supplier agreement copy for audit compliance.

---

## Configuration & Settings

This section documents the configuration and permission pages that are verifiably wired in applet source.

### Application Settings (`settings/field-settings`)

Use this screen to save applet behavior flags in master settings.

Examples of setting keys wired in source:

- `SHOW_DOCUMENT_DELETE_BUTTON`
- `HIDE_PURCHASE_ORDER_TAB`
- `SHOW_APPROVED_PR_LINE` and `SHOW_APPROVED_PR_HDR`
- Line-item visibility flags such as `HIDE_UNIT_PRICE_STD_PRICING_SCHEME`, `HIDE_AMOUNT_STD_EXCL_TAX`, `HIDE_TAX_CONFIG_SELECTION`, `HIDE_WHT_CONFIG_SELECTION`

Use **SAVE** after changes.

### Default Selection (`settings/default-selection`)

Use this screen to set:

- `DEFAULT_BRANCH`
- `DEFAULT_LOCATION`
- `DEFAULT_COMPANY`
- `DEFAULT_TOGGLE_COLUMN` (`SINGLE` or `DOUBLE`)
- `DEFAULT_ORIENTATION` (`HORIZONTAL` or `VERTICAL`)
- `BLANKET_PURCHASE_ORDER_DETAILS_TAB_ORDER` (drag-and-drop tab order)

Use **SAVE** to persist and **RESET** to clear defaults.

### Printable Format Settings (`settings/printable-format-settings`)

The printable format container is wired with:

- `Printable Format Listing`
- `Add Printable Format`
- `Edit Printable Format`

Use this screen to maintain available print formats used by Export.

### Branch Settings (`settings/branch-settings`)

Branch settings route is wired to branch configuration pages that include:

- Branch Listing
- Settlement Method maintenance
- Branch Pricing Scheme create/edit

### Permissions

**What this section covers:** practical access setup using permission screens that are actually routed in this applet.

**Permission and visibility routes available:**

- `settings/permission-wizard-listing`
- `settings/permission-set-listing`
- `settings/user-permission-listing`
- `settings/team-permission-listing`
- `settings/role-permission-listing`
- `settings/client-side-permission-listing`
- `settings/feature-visibility`

**Step-by-step setup flow:**

1. Open **Permission Wizard** and prepare target-based templates.
2. Create/maintain sets in **Permission Set**.
3. Assign users via **User Permission** (or Team/Role as needed).
4. Configure UI-level switches in **Client-Side Permission**.
5. Limit visible modules in **Feature Visibility**.
6. Validate with a test account before production rollout.

**Permission keys observed in source and practical use:**

| Permission Key | Observed Usage | Practical Impact |
|---|---|---|
| `TNT_API_DOC_INTERNAL_CUSTOM_INTERNAL_BLANKET_PURCHASE_ORDER_READ_TGT_GUID` | Loaded during app init; used by default-selection and personal-default selection logic | Controls read target scope (including branch/location target behavior) |
| `TNT_API_DOC_INTERNAL_CUSTOM_INTERNAL_BLANKET_PURCHASE_ORDER_CREATE_TGT_GUID` | Loaded during app init | Needed for create-capable BPO workflows |
| `TNT_API_DOC_INTERNAL_CUSTOM_INTERNAL_BLANKET_PURCHASE_ORDER_UPDATE_TGT_GUID` | Loaded during app init | Needed for update-capable BPO workflows |
| `TNT_TENANT_ADMIN` | Loaded during app init; checked in defaults logic | Admin-level capability; bypasses branch/location target restriction in default selection logic |
| `TNT_TENANT_OWNER` | Loaded during app init; checked in defaults logic | Owner-level capability; same bypass behavior as admin in defaults logic |

**Client-side permission codes observed in line-item UI:**

- `SHOW_UNIT_PRICE_STD_PRICING_SCHEME`
- `SHOW_UNIT_PRICE_STD_INCL_TAX`
- `SHOW_UNIT_PRICE_STD_EXCL_TAX`
- `SHOW_UNIT_PRICE_STD_UOM_INCL_TAX`
- `SHOW_UNIT_PRICE_STD_UOM_EXCL_TAX`
- `SHOW_UNIT_PRICE_NET_UOM_EXCL_TAX`
- `SHOW_UNIT_PRICE_NET_EXCL_TAX`
- `SHOW_UNIT_DISCOUNT`
- `SHOW_QTY_BASE`
- `SHOW_QTY_UOM`
- `SHOW_UOM_TO_BASE_RATIO`
- `SHOW_UNIT_DISCOUNT_UOM_EXCL_TAX`
- `SHOW_UNIT_PRICE_TXN_UOM_INCL_TAX`
- `SHOW_AMOUNT_STD_EXCL_TAX`
- `SHOW_DISCOUNT_AMOUNT_EXCL_TAX`
- `SHOW_AMOUNT_NET_EXCL_TAX`
- `SHOW_TAX_CONFIG_SELECTION`
- `SHOW_WHT_CONFIG_SELECTION`
- `SHOW_UNIT_PRICE_TXN`
- `SHOW_AMOUNT_TXN`
- `SHOW_LAST_PURCHASE_PRICE`

---

## FAQ

**Q: I cannot see the `+` button to create a release in Purchase Order (Internal). What should I check?**
A: Verify your permission assignment first. Release creation is done in the Purchase Order (Internal) Applet, so users need create access there and relevant role assignment.

**Q: The `KO For` tab is missing in Create Purchase Order.**
A: This is usually a permission/configuration issue. Ask admin to validate access for IPO knock-off flow and confirm your role has the required screens enabled.

**Q: `Blanket Purchase Order` does not appear inside `KO For`.**
A: Confirm the app configuration and your role permissions for knock-off targets. If missing, admin should review permission setup and feature visibility routes.

**Q: Why is `CREATE` disabled in Create Purchase Order?**
A: In the current implementation, `CREATE` is enabled only when all required conditions are met: valid Main Details, valid Account entity, and at least one line in Lines.

**Q: I clicked `KNOCK OFF` but no usable lines appear.**
A: Recheck that you selected the correct BPO row and confirm the selected BPO has relevant lines/remaining quantities for your requested items.

**Q: Where do I confirm a release link from BPO side?**
A: Open the BPO, then use **Doc Link** (`Copied To` / `Copied From`) and line-level purchase-order links (if enabled) to verify linked documents.

**Q: Why are Branch/Location options restricted in Default Selection for some users?**
A: Default selection uses permission inquiry targets. Tenant admin/owner can bypass this restriction; other users can be limited by their read-target scope.

**Q: Which permission keys should we verify first when users cannot access BPO features?**
A: Start with `TNT_API_DOC_INTERNAL_CUSTOM_INTERNAL_BLANKET_PURCHASE_ORDER_READ_TGT_GUID`, `TNT_API_DOC_INTERNAL_CUSTOM_INTERNAL_BLANKET_PURCHASE_ORDER_CREATE_TGT_GUID`, `TNT_API_DOC_INTERNAL_CUSTOM_INTERNAL_BLANKET_PURCHASE_ORDER_UPDATE_TGT_GUID`, plus `TNT_TENANT_ADMIN` and `TNT_TENANT_OWNER`.

---

