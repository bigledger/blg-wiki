---
title: "Voucher Management Applet"
description: "Comprehensive engine for managing promotional campaigns, discount vouchers, recurring loyalty rewards, and event ticketing"
tags:
- voucher-management
- marketing-campaigns
- event-ticketing
- loyalty-programs
- promotions
weight: 70
---

## Purpose and Overview

The **Voucher Management Applet** is the control center for creating vouchers, generating and maintaining ticket serial numbers, tracking scanned event usage, running recurring voucher programs, and monitoring import jobs.

Marketing, Sales, Operations, and Customer Service teams use it to create voucher headers, apply redemption rules, issue fixed-value settlement vouchers, manage ticket-based campaigns, and control applet behavior from Settings and Personalization.

{{< callout type="info" >}}
**Core Concept: Voucher vs. Ticket vs. Scanned Event vs. Recurring Voucher**
- **Voucher:** The master record that stores the voucher code, type, date windows, security controls, and business rules.
- **Ticket:** An individual serial number generated from a voucher. This is the unit that gets assigned, activated, cancelled, redeemed, or traced.
- **Scanned Event:** The scan or redemption log for event-style or ticket-based usage, including remarks, points, and attachments.
- **Recurring Voucher:** A voucher template that repeats on a schedule using a recurrence rule.
{{< /callout >}}

{{< figure src="/images/voucher-management-applet/voucher-mastery-guide.png" alt="Mastering the Voucher Applet: Types, Benefits, and Solutions" caption="Comprehensive Guide: Explore the distinct voucher models and core business solutions provided by the applet." >}}

### Main Work Areas in the Sidebar

| Sidebar Menu | What users do there |
|:---:|---|
| **Voucher** | Create and edit voucher headers, treatments, rules, images, website links, ticket generation, and audit history. |
| **Ticket** | Create standalone tickets from existing vouchers and maintain individual ticket statuses and history. |
| **Scanned Event** | Review scan or redemption records, shipping address details, remarks, and attachments. |
| **Recurring Voucher** | Create vouchers that repeat on a schedule. |
| **Import Tickets** | Upload import files and review processing and checking results. |
| **Settings** | Set applet defaults, field toggles, feature visibility, webhooks, and permissions. |
| **Personalization** | Save user-level defaults and sidebar preferences. |

---

## Strategic Configuration: Building Your Voucher Logic

Creating a voucher in this applet happens in two stages:

1. Use **Create Voucher** to save the voucher shell.
2. Reopen the voucher from **Voucher Listing** to configure **Treatment Value**, **Apply Rules**, **Image**, **Ticket Management**, **Website Link**, and **Audit**.

{{< callout type="tip" >}}
**Creation Checklist: Things to Decide Before You Save**
- [ ] **Voucher Type:** `SETTLEMENT`, `DISCOUNT`, or `REWARDS`
- [ ] **Quantity Type:** `FIXED`, `DYNAMIC`, `IMPORT`, or `INVENTORY`
- [ ] **Status:** Set the voucher to `ACTIVE` only when it is ready for use
- [ ] **Security:** Decide whether you need **Softpin**, **Activation Pin**, **URL Key**, or **Prefix**
- [ ] **Dates:** Set both the **Event Period** and the **Redemption Period**
- [ ] **Next Step:** Remember that rules, images, website links, and ticket operations happen after the initial save
{{< /callout >}}

### Step 1: Create the Voucher Shell (Details Tab)

The initial **Details** tab is where you save the voucher header. This is the screen users must complete before they can move into rules, ticket management, image uploads, or audit review.

| Setting | What it controls | What to know in the UI |
|:---:|---|---|
| **Voucher Code** | The main voucher identifier. | Required. By default it cannot be edited later unless `ENABLE_EDIT_VOUCHER_CODE` is turned on in Settings. |
| **Voucher Name** | Internal or user-facing label for the voucher. | Optional, but recommended for reporting clarity. |
| **Voucher Type** | The business logic mode. | Options are `SETTLEMENT`, `DISCOUNT`, and `REWARDS` unless hidden by Settings. |
| **Face Value Amount** | Fixed stored-value amount. | Only appears when **Voucher Type** is `SETTLEMENT`. |
| **Quantity Type** | How tickets are controlled. | Standard voucher create supports `FIXED`, `DYNAMIC`, `IMPORT`, and `INVENTORY`. |
| **Total Voucher Ticket To Be Generated** | Initial ticket quantity. | Appears during create when **Quantity Type** is `FIXED`. |
| **Status** | Whether the voucher can be used. | The UI uses `ACTIVE` and `INACTIVE`, not "Published". |
| **Voucher Limit Per Customer** | Per-customer usage limit. | Defaults to `1`. |
| **Currency** | Currency for settlement and value calculations. | Defaults to `MYR` in the current form. |
| **Allow Anonymous** | Lets guests claim or redeem. | Useful for guest checkout or public campaigns. |
| **Is Shipping Voucher** | Marks the voucher as shipping-related. | Optional toggle in the main details form. |
| **Event Period** | When customers can claim or collect the voucher. | Uses start and end date-time fields. |
| **Redemption Period** | When the voucher can actually be redeemed. | Uses start and end date-time fields. |
| **Add Voucher To CP-Com** | Links the voucher to selected website records. | Available during create for website-level exposure. |
| **Description** | Free-text business description. | Useful for internal context and listings. |
| **Terms and Conditions** | Rich-text content shown with the voucher setup. | Managed in the embedded editor at the bottom of the form. |

| Optional Control | What it does |
|:---:|---|
| **Softpin** | Adds a second secret value and lets you set the softpin length (`6` to `30`). |
| **Activation Pin** | Requires activation before use and lets you set the activation pin length (`6` to `30`). |
| **URL Key** | Creates a redeemable URL key and optional redirection target. |
| **Prefix** | Adds a serial prefix and lets you set the serial number length. |

{{< callout type="info" >}}
After you click **SAVE**, reopen the voucher from **Voucher Listing** to continue with **Treatment Value**, **Apply Rules**, **Image**, **Ticket Management**, **Website Link**, and **Audit**.
{{< /callout >}}

---

## Understanding Voucher Types: When, How, and Why?

Not all vouchers use the same redemption logic. The selected type changes which fields matter and what the user will configure next.

### 1. Settlement Vouchers (`SETTLEMENT`)
**Why:** Use this when the voucher behaves like stored value or store credit.
- **Core field:** `Face Value Amount`
- **How it works:** The ticket or voucher redeems against a fixed value instead of a discount treatment formula.
- **Best for:** Gift vouchers, service recovery credits, and compensation vouchers.

### 2. Discount Vouchers (`DISCOUNT`)
**Why:** Use this for promotions where the final discount depends on treatment logic and rules.
- **Treatment setup:** In **Treatment Value**, use the `Product` or `For All` sub-tabs.
- **How it works:** Users define fields such as `Price Source`, `Operator`, `Value`, `Min Spend`, `Max Discount Value`, and `Auto Apply to All Child Items`.
- **Best for:** Promo codes, campaign discounts, and item- or cart-based offers.

### 3. Rewards Vouchers (`REWARDS`)
**Why:** Use this when redemption should award points, or combine value logic with loyalty outcomes.
- **Treatment setup:** In **Treatment Value**, the `For All` flow exposes reward fields.
- **How it works:** Users can configure `Customer Points Value`, `Customer Points Expires Within (days)`, `Retailer Points Value`, `Retailer Points Expires Within (days)`, and `Point Currency`.
- **Best for:** Loyalty campaigns, event reward programs, and membership-based incentives.

{{< callout type="info" >}}
**Admin Note**
The **Field Settings** screen can hide `DISCOUNT` or `REWARDS` from the create form, so some tenants may not see all three voucher types.
{{< /callout >}}

---

## Key Features Deep-Dive

{{< cards >}}
  {{< card title="Voucher Setup" subtitle="Create the voucher shell and save the header" link="#step-1-create-the-voucher-shell-details-tab" >}}

  {{< card title="Rule Engine" subtitle="Apply header, multi-line, and single-line rules" link="#apply-rules-the-3-rule-builders" >}}

  {{< card title="Ticket Management" subtitle="Generate, import, cancel, or activate ticket serials" link="#ticket-management-and-ticket-applet" >}}

  {{< card title="Recurring Voucher" subtitle="Schedule repeating voucher campaigns" link="#recurring-voucher-automation" >}}

  {{< card title="Scanned Event" subtitle="Monitor scan activity and attachments" link="#scanned-event-monitoring" >}}

  {{< card title="Import Tickets" subtitle="Upload files and review processing errors" link="#import-tickets" >}}

  {{< card title="System Settings" subtitle="Control defaults, field toggles, and permissions" link="#configuration--settings" >}}
{{< /cards >}}

{{< figure src="/images/voucher-management-applet/voucher-management-infographic.jpg" alt="Master Your Promotions: The Voucher Management Applet - contrasting manual revenue leakage against automated rule enforcement and recurring loyalty" caption="From Leaky Margins to Controlled Promotions: centralize voucher setup, ticket handling, scan monitoring, and recurring campaigns in one applet." >}}

---

## Quick Start Guide

### For Marketing: Create a Promo Code Campaign (Discount Type)

**Goal:** Create a `BF2024` voucher that gives RM 50 off when the order reaches RM 200.

1. Open **Voucher** from the sidebar and click **"+" (Add New)**.
2. In **Details**, set **Voucher Code** to `BF2024`, **Voucher Type** to `DISCOUNT`, choose the required **Quantity Type**, set the date windows, and set **Status** to `ACTIVE`.
3. Click **SAVE**.
4. Open the newly created voucher from **Voucher Listing**.
5. Go to **Treatment Value** and enter the discount logic in **For All** or **Product**.
6. If the promotion should only work for specific branches, companies, members, or items, go to **Apply Rules** and add the required rules.
7. Use **Image**, **Website Link**, or **Ticket Management** only if the campaign needs those extras.

{{< figure src="/images/voucher-management-applet/voucher-edit.png" alt="Voucher Create Form showing Main Details tab with Code and active toggle" caption="Campaign Creation: setup the voucher header first, then reopen it to continue with treatments and rules." >}}

### For Customer Service: Create a Fixed-Value Voucher (Settlement Type)

**Goal:** Create a RM 50 settlement voucher that works like stored credit.

1. In **Voucher**, click **"+" (Add New)**.
2. Set **Voucher Type** to `SETTLEMENT`.
3. Enter **Face Value Amount** = `50`.
4. Choose the correct **Quantity Type**. Use `FIXED` if you want a controlled number of ticket serials.
5. Set **Status** to `ACTIVE`, then click **SAVE**.
6. Reopen the voucher if you need extra controls such as **Apply Rules**, **Ticket Management**, or security options like **Softpin** and **Activation Pin**.

### For Operations: Create and Maintain Individual Tickets

**Goal:** Create or review ticket serial numbers for an existing voucher.

1. Open **Ticket** from the sidebar and click **"+" (Add New)**.
2. Select the voucher in **Select Voucher**.
3. Confirm the voucher code and name, enter a **Serial Number**, then set **Assignment**, **Validity**, **Cancellation**, and **Redeemable** statuses.
4. Save the ticket.
5. To audit later activity, open the ticket and review **Ticket History**.

---

## Deep-Dive: Advanced Configurations

### Security & Privacy Controls
- **Softpin:** Adds a second secret value to the voucher or ticket flow. The UI lets you set the softpin length from `6` to `30`.
- **Activation Pin:** Requires activation before the ticket becomes usable. The UI also enforces a `6` to `30` character length.
- **URL Key:** Creates a redeemable URL key and optional **URL Redirection Configuration** value.
- **Allow Anonymous:** Lets guests claim or redeem without a full account-based flow.
- **Is Shipping Voucher:** Marks the voucher as shipping-related for shipping voucher scenarios.

### Serial Number Generation (Prefix Logic)
When you enable **Prefix**, the form exposes both **Prefix** and **Character length - Serial Number**.
- **Example:** Set Prefix to `VIP-` and Character Length to `8`. The system can then generate serials such as `VIP-AX72J9K1`.

### The Voucher Edit Workspace

After the first save, the voucher opens into a 7-tab workspace. Admins can reorder these tabs in **Settings > Default Selection**.

| Edit Tab | What users do there |
|:---:|---|
| **Details** | Review and update the voucher header fields. |
| **Treatment Value** | Define discount or reward logic. |
| **Apply Rules** | Restrict where, when, and for whom the voucher works. |
| **Image** | Upload voucher images. |
| **Ticket Management** | Generate, import, review, cancel, or activate ticket serial numbers. |
| **Website Link** | Map the voucher to websites and search the linked records. |
| **Audit** | Review audit activity for the voucher. |

### Apply Rules: The 3 Rule Builders

| Rule Area | Best used for | Available rule types |
|:---:|---|---|
| **Rules - Doc Hdr** | Control header-level eligibility | `Event Date Range`, `Redemption Date Range`, `Entity Type`, `Member Class`, `Member Label`, `Company`, `Branch`, `Delivery Region` |
| **Rules - Multi Line** | Target items or categories across multi-line documents | `Item`, `Item Category`, `Item Code Regex`, `Item Name Regex`, `Category Code Regex`, `Category Name Regex` |
| **Rules - Single Line** | Target only one matched line at a time | `Item`, `Item Category`, `Item Code Regex`, `Item Name Regex`, `Category Code Regex`, `Category Name Regex` |

{{< figure src="/images/voucher-management-applet/voucher-edit-details.png" alt="Voucher configuration showing the main edit tabs for details, treatment value, rules, images, ticket management, website link, and audit" caption="Voucher Edit Workspace: move from header setup into treatments, rules, images, ticket handling, website mapping, and audit review." >}}

### Ticket Management and Ticket Applet
- Inside a voucher, **Ticket Management** shows summary counts for **Vouchers Generated**, **Vouchers Assigned**, and **Vouchers Redeemed**.
- The **Create Ticket** flow inside a voucher has three sub-tabs: **Generate Ticket**, **Import Ticket**, and **Ticket Files Listing**.
- **Generate Ticket** asks for **Max Quantity** when you want to bulk-generate serials.
- Opening a generated ticket shows voucher code, voucher name, serial number, softpin, assignment status, redemption status, and a button to **Cancel** or **Activate** the serial.
- The top-level **Ticket** menu is for standalone ticket maintenance. It lets users create tickets from existing vouchers, update assignment, validity, cancellation, and redeemable status, and review **Ticket History**.
- **Ticket History** traces the serial through movements such as stock-in, award to customer, and redemption.

{{< callout type="info" >}}
If **Field Settings > ENABLE_MULTIPLE_TICKET** is turned off, a `FIXED` voucher may stop showing the add button after the allowed ticket count has been generated.
{{< /callout >}}

### Scanned Event Monitoring
- The **Scanned Event** listing shows **Serial Number**, **Item Name**, **Email**, **Phone**, **Scan Date**, **Reward Points**, **User Type**, **Status**, **Remarks**, and **Shipping Address**.
- Opening a record shows a **Details** tab plus an **Attchment** tab in the current UI.
- Customer-type records can update **Shipping Address** from the detail view.
- The attachment area displays uploaded images linked to the scanned event record.

### Recurring Voucher Automation
- The **Recurring Voucher** flow mirrors voucher setup but adds a **Recurring?** toggle, **Start Date**, **End Date**, and a recurrence editor.
- Recurring vouchers support `SETTLEMENT`, `DISCOUNT`, and `REWARDS`, with `FIXED` and `DYNAMIC` quantity types in the recurring form.
- After saving, users continue in **Treatment Value** and **Apply Rules**, just like a standard voucher.
- Use this menu for scheduled campaigns or recurring reward programs that must repeat automatically.

### Import Tickets
- The **Import Tickets** area stores uploaded files, then shows **File Name**, **File Size**, **Format**, **Status**, **Process Status**, and **Error Message**.
- Use the **Sample Format** link in the upload screen before submitting files.
- After upload, open the import record and review the **Checking** tab for line-level validation results.
- Import behavior can be tenant-specific, so users should follow the file template provided in their current environment.

---

## Configuration & Settings

Navigate to **Settings** in the applet sidebar to configure global behavior, then use **Personalization** for user-level overrides.

{{< figure src="/images/voucher-management-applet/applet-settings.png" alt="Settings menu showing Feature Visibility, Webhooks, and Permission Sets" caption="Settings Menu: customize default behavior, field visibility, and governance controls for the applet." >}}

### Default Selection
- Set the applet-wide **Default Branch**, **Default Location**, and **Default Timezone**.
- Reorder the voucher edit tabs: **Details**, **Treatment Value**, **Apply Rules**, **Image**, **Ticket Management**, **Website Link**, and **Audit**.

### Field Settings
- **ENABLE_MULTIPLE_TICKET:** Controls whether more than one ticket can be generated where the flow allows it.
- **HIDE_VOUCHER_TYPE_REWARD:** Removes `REWARDS` from the voucher type selector.
- **HIDE_VOUCHER_TYPE_DISCOUNT:** Removes `DISCOUNT` from the voucher type selector.
- **ENABLE_EDIT_VOUCHER_CODE:** Allows voucher code editing after create when enabled.

### Feature Visibility, Webhooks, and Permissions
- **Feature Visibility** lets admins hide features that are not relevant to the tenant.
- **Webhook** supports outbound integration behavior from the settings area.
- Permission administration is available for **Permission Set Listing**, **User Permission Listing**, **Team Permission Listing**, and **Role Permission Listing**.

### Personalization
- **Personal Default Selection** lets each user override the applet defaults for their own profile.
- **Sidebar** personalization lets users maintain their own navigation preferences.

---

## FAQs

**Q: Why do I only see the `Details` tab when I first create a voucher?**  
A: The create flow only saves the voucher shell. After you save and reopen the voucher from **Voucher Listing**, the full edit workspace becomes available.

**Q: Can I edit the voucher code after creation?**  
A: Only if **Settings > Field Settings > ENABLE_EDIT_VOUCHER_CODE** is enabled. Otherwise the code stays locked after create.

**Q: Why do I not see `Treatment Value` on some vouchers?**  
A: `SETTLEMENT` vouchers do not use the same treatment flow as `DISCOUNT`, and tenant settings can also hide `DISCOUNT` or `REWARDS`.

**Q: Where should I generate or import ticket serial numbers?**  
A: Use **Voucher > open voucher > Ticket Management** for voucher-level batch work. Use the top-level **Ticket** menu for standalone ticket creation and maintenance.

**Q: Where do I check what happened to a ticket after it was issued?**  
A: Open the ticket and review **Ticket History** for the serial trace, or use **Scanned Event** for event-style scan records and attachments.

---
