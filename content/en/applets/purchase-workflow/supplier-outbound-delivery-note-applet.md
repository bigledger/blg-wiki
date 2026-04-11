---
title: "Supplier Outbound Delivery Note Applet"
description: "Supplier workspace to create and manage outbound delivery notes: listing, main details, lines with optional knock-off from sales order or jobsheet, matchings, and finalisation."
weight: 268
date: 2026-04-11
lastmod: 2026-04-11
draft: false
tags:
- purchase-workflow
- supplier-access
- outbound-delivery
- delivery-note
- logistics
- stock-conversion
---

## Purpose and Overview

A **supplier outbound delivery note** is a formal record that your organisation (as the supplier) uses to document goods or materials **leaving** your side toward the buyer. It captures **where** the movement is from (branch and location), **what** is on the delivery (lines), and how that activity ties to other documents when your company uses **matching** or **knock-off** flows.

Think of it as the **supplier’s dispatch paperwork** in one place: you describe the outbound movement, build or import lines, and **finalise** the note when it is ready—so purchasing and logistics on the buyer’s side can align with what you shipped.

The **Supplier Outbound Delivery Note Applet** is the screen in BigLedger (including deployments such as **akaun.com**) where supplier users open the **Supplier Outbound Delivery Note Listing**, **create** new notes, **edit** saved ones, and run actions such as **FINAL** from the list or the document, subject to your access rights and configuration.

{{< callout type="info" >}}
Menus, tabs, and buttons can vary by **posting status**, **feature visibility**, and **permissions**. If something described here does not appear on your screen, ask your administrator.
{{< /callout >}}

---

## Who Uses This Applet?

**Supplier operations and warehouse staff** create and maintain outbound delivery notes, add lines, and finalise documents when the shipment is confirmed.

**Logistics coordinators** use branch and location on the note to reflect **where** stock is dispatched from.

**Administrators** configure fields, printable formats, workflow, feature visibility, and who can create or finalise notes—typically under **Settings** in the same way as other supplier applets.

---

## What Problems Does This Solve?

Without a central record, outbound shipments are often tracked in spreadsheets or email, which makes it hard to match what left your warehouse to what the buyer expects.

This applet helps by providing:

- **One listing** for all supplier outbound delivery notes, with search and column layout options
- **Structured main details** — branch, location, conversion reference, and description
- **Lines** so each item or quantity on the outbound movement is listed
- **Optional knock-off** from a **sales order** or **jobsheet** when your administrator enables those flows, so you do not retype lines by hand
- **A Matchings tab** for processes that link this note to other documents (content depends on your setup)
- **FINAL** on the listing or edit screen when your role and document state allow it, to lock the note for downstream use

---

## Before You Start

**For users creating a note:**

- Know the **branch** and **location** the goods ship from
- Have **conversion code** and **conversion name** values your company uses for this type of outbound movement (your administrator can confirm the naming rules)
- If you use knock-off, have the related **sales order** or **jobsheet** reference ready

**For administrators:**

- Confirm whether **knock-off for sales order** and **knock-off for jobsheet** should be enabled for line entry
- Set **permissions** and **feature visibility** so supplier roles see **Create**, **Save**, and **FINAL** as intended
- Configure **printable format** if printed delivery notes are required

{{< callout type="tip" >}}
If you are new to this applet, create one **test** note end-to-end (save, add a line, finalise) before using it for live shipments.
{{< /callout >}}

---

## Feature Navigation

{{< cards >}}
	{{< card title="Listing" subtitle="Open, search, create, and finalise from the grid" link="#supplier-outbound-delivery-note-listing" >}}
	{{< card title="Create and edit" subtitle="Main Details, Lines, Matchings" link="#create-and-edit-supplier-outbound-delivery-note" >}}
	{{< card title="Line items" subtitle="Search item and optional knock-off tabs" link="#lines-and-knock-off" >}}
	{{< card title="Quick Start" subtitle="Steps for supplier users" link="#quick-start-guide" >}}
	{{< card title="Settings and personalisation" subtitle="Configuration and personal defaults" link="#configuration--settings" >}}
	{{< card title="FAQ" subtitle="Common questions" link="#faq" >}}
{{< /cards >}}

---

## Key Concepts {#key-concepts}

### Document flow (typical)

```
Open listing → Create (+) → Fill Main Details → Save
        → Add lines on Lines tab → (optional) use Matchings
        → FINAL when ready (from listing or edit screen)
```

**Posting status** controls whether the note can still be changed. After **FINAL**, your administrator’s rules usually prevent further editing—treat the note as locked unless your process allows a reversal or void elsewhere.

### Tabs on create and edit

| Tab | Purpose |
| --- | --- |
| **Main Details** | Branch, location, conversion code and name, description |
| **Lines** | List of outbound lines; **Create** (**+**) opens the line workflow (search item, optional knock-off) |
| **Matchings** | Links or matching logic between this note and other documents (depends on configuration) |

The **edit** screen adds **RESET**, **SAVE**, and **FINAL** (when shown) in the header area, and the title **Edit Supplier Outbound Delivery Note**.

---

## Quick Start Guide {#quick-start-guide}

### Create your first supplier outbound delivery note

**Goal:** Save a new note with main details, then add at least one line.

1. Open the applet; you should land on **Supplier Outbound Delivery Note Listing**.
2. Click **Create** (the **+** button, tooltip **Create**).
3. On **Main Details**, select **Branch** and **Location** (both are required on the form).
4. Enter **Conversion Code** and **Conversion Name** (required).
5. Optionally enter **Description**.
6. Click **SAVE** to create the record (your administrator may use different labels; use the primary save action on the screen).
7. Open the **Lines** tab. Click **Create** (**+**) to start a new line.
8. On the line screen, use **Search Item** to find an item, or—if your company enabled them—open **KO For Sales Order** or **KO For Jobsheet** to bring in lines from those documents.
9. Complete the line and return to the document.
10. When the note is complete, use **FINAL** on the **edit** screen or select the row on the listing and use **FINAL** there, if available.

{{< callout type="info" >}}
On the **listing**, a **FINAL** button is available for bulk-style finalisation of selected rows when your setup allows it. Exact behaviour depends on your workflow.
{{< /callout >}}

---

### For administrators: first-time setup checklist

**Goal:** Make sure supplier users can create, save, and finalise notes safely.

1. Open **Settings** and review **Feature Visibility** so **Supplier Outbound Delivery Note** (or the menu label your company uses) appears for the right roles.
2. Under **Application** or **field settings**, confirm **Main Details** fields (branch, location, conversion code, conversion name) match your data standards.
3. Set **Default selection** if supplier users should always start from a fixed branch or location.
4. Configure **Printable format settings** if printed outbound delivery notes are required.
5. Set **Workflow settings** so **FINAL** behaves as your policy expects (who can finalise, and when).
6. Assign **Permissions** so only intended users can create, edit, or finalise.
7. Run a full test: create a note, add a line with **Search Item**, **SAVE**, then **FINAL**—or validate knock-off tabs if you enabled them.

---

## Supplier Outbound Delivery Note Listing {#supplier-outbound-delivery-note-listing}

The listing title on screen is **Supplier Outbound Delivery Note Listing**.

You can:

- **Create** — **+** button (tooltip **Create**) to open **Create Supplier Outbound Delivery Note**
- **Search** — advanced search (configuration may resemble other procurement listings)
- **Adjust columns** — column toggle where provided
- **Paginate** — change page size and move through pages
- **Select rows** — multi-select in the grid; **FINAL** appears in the listing toolbar for applicable documents
- **Open a note** — click a row to open **Edit Supplier Outbound Delivery Note**

---

## Create and edit supplier outbound delivery note {#create-and-edit-supplier-outbound-delivery-note}

### Create screen

- Title: **Create Supplier Outbound Delivery Note**
- Actions: **Back**, **RESET**, **SAVE** (SAVE is disabled while **Main Details** is invalid—typically until branch, location, conversion code, and conversion name are filled)

### Edit screen

- Title: **Edit Supplier Outbound Delivery Note**
- Actions: **Back**, **RESET**, **SAVE**, **FINAL** (FINAL only when the document state allows it)

Both screens share the **Main Details**, **Lines**, and **Matchings** tabs described under [Key Concepts](#key-concepts).

---

## Lines and knock-off {#lines-and-knock-off}

On the **Lines** tab, the line grid supports **Create** (**+**) to add a line and actions to **edit** an existing line.

When adding a line, the line workflow includes:

- **Search Item** — find and select items to add manually
- **KO For Sales Order** — shown when your administrator enables knock-off from **sales order** lines for this document type
- **KO For Jobsheet** — shown when knock-off from **jobsheet** lines is enabled

{{< callout type="warning" >}}
If you do not see **KO For Sales Order** or **KO For Jobsheet**, those flows are not enabled for your company. Only **Search Item** may be available.
{{< /callout >}}

For items that use **serial numbers**, the system may validate that serials on the line match quantity and status rules. If a message refers to invalid serials, correct the serial list or quantity before saving.

---

## Configuration & settings {#configuration--settings}

Supplier applets usually share the same **Settings** areas as other BigLedger document applets. Typical groups (names on your screen may vary slightly):

| Area | What it is for |
| --- | --- |
| **Application / field settings** | Which fields show and whether they are mandatory |
| **Default selection** | Default branch or location where used |
| **Printable format settings** | Layout of printed delivery notes |
| **Workflow settings** | Draft, final, and related behaviour |
| **Feature visibility** | Which menus and actions appear |
| **Permissions** | Who can create, edit, finalise, or view only |
| **Personalization** (if available) | Your personal defaults without changing company-wide settings |

For integration-style automation, your administrator may also configure **notifications** or **connections to other systems** from Settings—follow your implementation guide for details.

---

## Personalization

If **Personalization** is enabled for your account, you can usually adjust **personal default selection** (for example default branch or location on new documents) and sometimes **sidebar** order, without changing settings for everyone else. Open **Personalization** from the menu your administrator configured and save your preferences.

---

## Related Applets

| Applet | How it relates |
| --- | --- |
| [Supplier Delivery Order Applet](/applets/purchase-workflow/supplier-delivery-order-applet/) | Another supplier-facing logistics document; processes may link delivery planning to outbound notes depending on setup |
| [Internal Purchase GRN Applet](/applets/purchase-workflow/internal-purchase-grn-applet/) | Buyer-side goods receipt; outbound notes from the supplier often align with receiving on the buyer side |
| [Blanket Purchase Order Applet (Supplier Access)](/applets/purchase-workflow/blanket-purchase-order-applet-supplier-access-applet/) | Supplier portal for blanket agreements; outbound activity may sit in the same procurement context |

{{< callout type="info" >}}
Not every applet is enabled for every customer. Links above point to guides that exist on the wiki; your menu may show only a subset.
{{< /callout >}}

---

## FAQ {#faq}

**Why is SAVE disabled on create?**  
The **Main Details** form must be valid. Ensure **Branch**, **Location**, **Conversion Code**, and **Conversion Name** are completed.

**What are conversion code and conversion name?**  
They identify the type or template of **stock conversion** or outbound movement your company uses for this note. Your administrator or inventory team defines allowed values.

**Why do I not see KO For Sales Order or KO For Jobsheet?**  
Knock-off tabs are **optional** and controlled by configuration. If they are off, add lines only through **Search Item**.

**What is the Matchings tab for?**  
It holds **matching** between this outbound delivery note and other documents when your process uses it. If the tab is empty or unused, your implementation may not require action there.

**FINAL is missing—why?**  
**FINAL** depends on document state and your permissions. You may need to **SAVE** first, or the note may already be final. Ask your administrator if you believe you should see it.

**Can I change a note after FINAL?**  
Usually not without a controlled process (void or correction). Follow your company policy; incorrect outbound notes can affect the buyer’s receiving and inventory.

**The listing shows advanced search—what is it for?**  
It filters the grid by fields your administrator configured, similar to other listing screens. Use it to find notes by reference, date, or status columns available to you.

---

## Glossary

**Branch** — An organisational site or division. The note records which branch the outbound movement is from.

**Conversion code / conversion name** — Labels your company uses to classify this outbound delivery note within **stock conversion** or inventory movement rules.

**Final (FINAL)** — Marks the document as complete and typically locks it from further editing so downstream processes can rely on it.

**Knock-off (KO)** — Pulling line details from another document (here, optionally **sales order** or **jobsheet**) instead of entering each line manually.

**Location** — A storage or dispatch point under the selected branch (for example a warehouse location).

**Matchings** — The area used to align or link this delivery note with other records when your workflow requires it.

**Supplier outbound delivery note** — The document type handled by this applet: supplier-originated evidence of goods dispatched toward the buyer.

**Posting status** — Indicates whether the note is still open for changes or has been finalised. After finalisation, editing is usually blocked.

**Feature visibility** — Company settings that control which menus and actions appear for each role.

---

## Suggested screenshots (optional)

These are **not** included in the published page yet; capture them when you are ready to enrich the guide.

- **Listing** — Full **Supplier Outbound Delivery Note Listing** with toolbar (**Create**, search, **FINAL**, pagination).
- **Create — Main Details** — Branch, location, conversion code/name, description with **RESET** / **SAVE**.
- **Create — Lines** — Line grid with **Create** (**+**).
- **Line workflow** — **Search Item** tab and, if enabled, **KO For Sales Order** / **KO For Jobsheet** tabs.
- **Edit** — Header with **RESET**, **SAVE**, **FINAL** (when visible) and three tabs.
- **Matchings** — When your company uses this tab with real data, a sample helps readers understand the purpose.

---
