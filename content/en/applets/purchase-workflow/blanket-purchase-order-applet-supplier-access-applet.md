---
title: "Blanket Purchase Order Applet (Supplier Access)"
description: "Supplier-side blanket purchase agreements: list and open BPOs, create or review lines, export PDFs, and run report listings with date filters."
tags:
  - purchase-workflow
  - blanket-purchase-order
  - supplier-access
  - supplier-portal
  - procurement
  - reporting
weight: 205
date: 2026-04-08
lastmod: 2026-04-21
draft: false
---

## Purpose and Overview {#purpose-and-overview}

A blanket purchase order (BPO) is a long-term agreement with a buyer: you agree scope (items, prices, limits) and validity up front, then the buyer can create releases or related orders against that agreement over time without negotiating every single order from scratch.

The **Blanket Purchase Order (Supplier Access)** applet is the supplier-facing workspace in BigLedger for those agreements. You use it to see blanket POs shared with your organisation, work on header and line details where your process allows, export a PDF copy, and open report screens for operational review. Your buyer may use the separate [Blanket Purchase Order](/applets/purchase-workflow/blanket-purchase-order-applet/) applet on their side; both sides use the same type of document, with permissions and visibility controlled by each company.

{{< callout type="info" >}}
**In plain English:** Releases and follow-on purchase orders are usually created in the buyer’s BigLedger company. This applet is for the blanket agreement (header, supplier account, lines) and supplier-side reports. If you need a new release, the buyer’s procurement team normally handles that in their apps—not here.
{{< /callout >}}

### Who Benefits from This Applet?

**Supplier sales and account teams:**

- Open agreements, confirm lines and commercial details, and export PDFs
- One place to open the latest blanket agreement instead of hunting through email

**Supplier operations:**

- Review validity and line scope before fulfilling releases the buyer sends separately
- Use the Line Items tab to see what is covered under the agreement (subject to what the buyer posted and your edit rights)

**Supplier administrators:**

- Configure application settings, field settings, default selection, and printable format behaviour so the applet matches company policy
- Control who can create, edit, export, or run reports

---

### What Problems Does This Solve? {#what-problems-does-this-solve}

**Before this applet**, blanket agreement data often lived in email, spreadsheets, or disconnected files, so version control and auditability suffered.

**With this applet**, you get:

- A single listing (Blanket Purchase Order Supplier Access Listing) with search and column layout options
- Structured documents with clear areas for main details, supplier account information, and lines
- PDF export from the view workflow so you can file or share the layout your company configured
- Report and BPO Detailed Report list views, with the detailed report supporting date range filters
- Settings and permissions your admin can tune so each role sees only what they should

{{< callout type="info" >}}
**Can’t see a menu, tab, or button?** Your administrator controls feature visibility, field settings, and permissions. Supplier-access applets are often restricted on purpose—ask your admin if something you expect is missing.
{{< /callout >}}

Depending on configuration, you may also step through supporting screens (for example supplier selection, shipping or billing address, add or edit line item, batch selection) in the same way as other BigLedger document applets.

---

## Key Features Overview {#key-features-overview}

{{< cards >}}
{{< card title="Quick Start" subtitle="Find agreements, create when allowed, run reports" link="#quick-start-guide" >}}
{{< card title="Blanket PO listing & document" subtitle="Listing, view, create, lines, export" link="#blanket-purchase-order-listing-and-document" >}}
{{< card title="Reports in Detail" subtitle="Report and BPO Detailed Report" link="#reports-in-detail" >}}
{{< card title="Configuration & Settings" subtitle="For administrators" link="#configuration--settings" >}}
{{< card title="Glossary" subtitle="BPO, releases, listing names" link="#glossary" >}}
{{< card title="FAQ" subtitle="Common questions and fixes" link="#frequently-asked-questions" >}}
{{< /cards >}}

{{< figure src="/images/blanket-purchase-order-applet-supplier-access-applet/blanket-purchase-order-applet-supplier-access-applet-overview-infographic.png" alt="Overview of Blanket Purchase Order Supplier Access: listing, document tabs, reports, and settings" caption="Overview of supplier-side blanket purchase order listing, document work areas, reports, and configuration." >}}

---

## Quick Start Guide {#quick-start-guide}

### For supplier users: find and open an agreement

**Goal:** Locate a blanket PO and open it for review or export.

1. Click **Blanket Purchase Order** in the sidebar (opens **Blanket Purchase Order Supplier Access Listing**).
2. Use the advanced search control and column toggle to find the document (visible columns depend on settings).
3. Click a row in the grid to open **View Blanket Purchase Order**.
4. Review the **Main**, **Supplier Info**, and **Line Items** tabs.
5. Open the **Export** tab and click **EXPORT AS PDF** (other export formats may appear but are typically disabled).

*Full detail:* [Blanket purchase order listing and document](#blanket-purchase-order-listing-and-document)

---

### For supplier users: create a new blanket PO (when allowed)

{{< callout type="info" >}}
If **Create** is not visible, your role may be view-only or feature visibility may hide creation. Ask your BigLedger administrator if you need to start agreements from the portal.
{{< /callout >}}

**Goal:** Start a new agreement record and save it.

1. From **Blanket Purchase Order Supplier Access Listing**, open **Create Blanket Purchase Order** using the create (+) control on the toolbar when your build shows it (tooltip **Create**), or the entry point your administrator configured. If no create control appears, you may be view-only—ask your admin.
2. Complete **Main** (transaction date, validity, references, limits—fields follow field settings).
3. Open **Supplier Info** and select the correct supplier or account when prompted (pickers may be labelled **Select Customer** or similar—choose the entity your company uses for the buyer–supplier link).
4. Add lines on **Line Items** (item, quantities, amounts as shown).
5. Click **CREATE** (use **RESET** only if you intend to clear the draft).

*Full detail:* [Create flow](#create-blanket-purchase-order)

---

### For analysts: run the detailed report by date

**Goal:** Review BPO activity for a period.

1. Click **BPO Detailed Report** in the sidebar.
2. On **Blanket Purchase Order Supplier Access Detailed Report Listing**, set **Start Date** and **End Date** using the date pickers.
3. Click **Generate Report** and read the grid results.

*Full detail:* [Reports in Detail](#reports-in-detail)

---

## Blanket purchase order listing and document {#blanket-purchase-order-listing-and-document}

### Listing

- Screen title: **Blanket Purchase Order Supplier Access Listing**.
- Use advanced search, pagination, column toggle, and grid options as in other BigLedger listings.
- Selecting a row opens the next column: typically **View Blanket Purchase Order** for existing data.

### View Blanket Purchase Order

- Use the back arrow at the top (tooltip **Back**) to return to the listing when it is enabled.
- Tabs:
  - **Main** — header fields.
  - **Supplier Info** — entity and account details.
  - **Line Items** — grid of lines; actions may open view, add, or edit line sub-screens.
  - **Export** — click **EXPORT AS PDF** to download a PDF for the current document (success and error messages appear on screen).
- A **DELETE** button may appear at the bottom; whether it is active depends on permissions and business rules—do not assume you can delete posted agreements.

### Typical document states (supplier view)

| What you might see | What it usually means for you |
|--------------------|-------------------------------|
| Draft / editable | Header and lines can often be changed until your process or the buyer locks the record. |
| Posted / confirmed | Many fields become read-only; you may still export a PDF. |
| Closed / expired | Often view and report only; editing may be blocked by business rules. |

Exact status labels and rules depend on your tenant configuration.

### Create Blanket Purchase Order {#create-blanket-purchase-order}

- **RESET** clears the draft form.
- **CREATE** submits the new document (you should see a success confirmation when the save completes).
- Tabs: **Main**, **Supplier Info**, **Line Items** (same ideas as view; **Settlement** or **Department** header tabs may be hidden in your build).

### Line item and picker flows {#line-item-and-picker-flows}

When you add or edit lines, the applet may open auxiliary columns titled for example **Select Shipping Address**, **Select Billing Address**, **Select Customer**, **Add Supplier**, **Select Batch No**, **Batch No Booking**, **Select Settlement**, or **Select Contact Person**, or **Add Line Item** / **Edit Line Item**. Use the back arrow (tooltip **Back**) to return to the previous step. Exact availability depends on feature visibility and field settings.

---

## Reports in Detail {#reports-in-detail}

### Report

This is the standard list report your company configured.

{{< figure src="/images/blanket-purchase-order-supplier-access-applet/report-tab-search-by-filter.png" alt="Blanket Purchase Order Supplier Access Report Listing with advanced search and filters" caption="On Report, use the advanced search area to build criteria, then run the search to filter the grid. Column toggle and pagination match other BigLedger listings." >}}

| What you can do | How |
|---|---|
| Open the report | Click **Report** in the sidebar |
| Filter and scan results | Use search and column tools on **Blanket Purchase Order Supplier Access Report Listing** |
| Match layout to policy | Column visibility follows feature visibility and field settings |

---

### BPO Detailed Report

Use this when you need a time-bounded extract instead of scrolling only the main listing.

{{< figure src="/images/blanket-purchase-order-supplier-access-applet/BPO detailed report tab.png" alt="BPO Detailed Report screen with Start Date, End Date, and Generate Report" caption="On BPO Detailed Report, set Start Date and End Date, then click Generate Report to refresh the detailed listing." >}}

| What you can do | How |
|---|---|
| Open the detailed report | Click **BPO Detailed Report** in the sidebar |
| Limit by period | On **Blanket Purchase Order Supplier Access Detailed Report Listing**, set **Start Date** and **End Date**, then click **Generate Report** |
| Read results | Use the grid like other BigLedger report listings |

---

## Configuration & Settings {#configuration--settings}

Open **Settings** from the sidebar (in the stock layout this link is shown for owner or admin roles). The settings area opens on **Feature Visibility** by default. Prefer your application owner or security administrator to change permissions and feature visibility so day-to-day supplier users cannot widen their own access by mistake.

| Area | What it is for |
|------|----------------|
| **Application Settings** | Applet-specific toggles (for example whether to hide BPO number on certain screens—label may read **HIDE BPO NO**). |
| **Field Settings** | Required or hidden fields on forms. |
| **Default Selection** | Company, branch, and location defaults for new documents. |
| **Printable Format Settings** | Layout used for printed or PDF output. |
| **Webhook** | Integrations that fire when data changes—for example notifying an external ERP when a BPO is saved. |
| **Feature Visibility** | Which menus and features users see. |
| **Permission set / User / Team / Role permission listing** | Who can list, create, edit, export, or report. |

**Personalization** (separate menu) may include **Default Selection** (personal) and **Sidebar** order.

---

## Related purchase documents {#related-purchase-documents}

Blanket POs on the supplier side are the counterpart to agreements your customer maintains in the [Blanket Purchase Order](/applets/purchase-workflow/blanket-purchase-order-applet/) applet. Releases or knock-off purchase orders are usually created on the buyer’s tenant; your portal focuses on the agreement record and the lines your organisation is responsible for.

**Related guides:**

- [Blanket Purchase Order Applet](/applets/purchase-workflow/blanket-purchase-order-applet/) — buyer-side agreement and release context.
- [Internal Purchase Order Supplier Access Applet](/applets/purchase-workflow/internal-purchase-order-supplier-access-applet/) — similar supplier-portal pattern for standard POs.

---

## Glossary {#glossary}

| Term | What it means |
|---|---|
| **Blanket purchase order (BPO)** | A long-term purchase agreement covering items, prices, and limits over a validity period; the buyer creates releases or orders against it over time. |
| **Release** | A follow-on order or draw against a blanket agreement, usually created on the buyer’s side—not the main focus of this supplier applet. |
| **Blanket Purchase Order Supplier Access Listing** | The main grid where you search and open supplier-side blanket POs. |
| **Supplier access** | Portal access where your organisation works on documents the buyer shares, with permissions controlled by each tenant. |
| **Feature visibility** | Admin-controlled switches that show or hide menus and features. |
| **Field settings** | Admin-controlled rules for which fields are required, optional, or hidden on forms. |

---

## FAQ {#frequently-asked-questions}

### 1. How is this different from the internal Blanket Purchase Order applet?

The internal applet is for the buying organisation to author agreements and manage releases. This supplier access applet is for your organisation when you log in with supplier-portal access to the same document type.

---

### 2. Why does my screen say “Select Customer” when I am a supplier?

Some shared components reuse customer wording. On a purchase blanket PO you are usually picking the buyer’s entity or the supplier master link your implementation uses—follow your training or ask your admin.

---

### 3. Can I change prices after the buyer posted the agreement?

Often no, or only in draft states; policy depends on your trading relationship and system permissions. When in doubt, contact the buyer’s procurement team.

---

### 4. Where did the Create button go?

Feature visibility or permissions may hide creation. Your listing may be read-only by design.

---

### 5. Export failed—what should I check?

On **View Blanket Purchase Order**, open the **Export** tab and use **EXPORT AS PDF**. Confirm printable format is set up, you have network access to the print service, and you still have permission to export. Retry after speaking with your admin if the error persists.

---

### 6. What is the difference between Report and BPO Detailed Report?

**Report** is the general listing report. **BPO Detailed Report** adds **Start Date** and **End Date** filters for a narrower period.

---

### 7. The buyer says they updated the agreement—why don’t I see it?

Refresh the listing or close and reopen the document. Timing can depend on how your buyer publishes changes, which company you logged into, and permissions. If the version still looks wrong, contact the buyer’s procurement team and your admin with the document reference.

---

### 8. Currency, branch, or company looks wrong on a new document

**Default Selection** (company-wide) and **Personalization** (your own defaults) fill many header values. Ask your admin to correct organisation defaults or your personal defaults. Some fields lock after save or post.

---

### 9. Saving a line opens shipping, batch, or other screens I don’t need

Those steps follow shared BigLedger document patterns. Use the back arrow (tooltip **Back**) to return to the line or grid when the UI allows. Your admin can often hide optional fields or steps through field settings and feature visibility—see [Line item and picker flows](#line-item-and-picker-flows).

---

### 10. Should I use DELETE at the bottom of the screen?

Only when company policy and your permissions clearly allow it. Posted or buyer-controlled agreements are often not deletable from the portal. If you are unsure, do not delete—ask the buyer or your admin first.

---

### 11. I cannot see Blanket Purchase Order or the reports in the sidebar

Ask your admin to check feature visibility and your role permissions.

---

### 12. CREATE or line Save is disabled

Complete required fields per field settings, and confirm you are not in a read-only view.

---

### 13. Wrong supplier or address on the document

Re-open **Supplier Info** and use the correct picker; some fields may lock after posting.

---

### 14. The detailed report returns no rows

Widen **Start Date** and **End Date**, and confirm you are on the correct branch or company default.

---

### 15. I am still stuck after trying the steps above

Capture the document reference (if any), screen name, and time, then contact your BigLedger administrator or internal help desk.

---

## Related Documentation Links

- [Blanket Purchase Order Applet](/applets/purchase-workflow/blanket-purchase-order-applet/)
- [Internal Purchase Order Supplier Access Applet](/applets/purchase-workflow/internal-purchase-order-supplier-access-applet/)
