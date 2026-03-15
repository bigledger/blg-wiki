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
| **Settings** | Set applet defaults, reorder voucher edit tabs, and manage field toggles. Some admin-enabled builds also expose feature visibility, webhook, and permission pages. |
| **Personalization** | Save user-level defaults and, where enabled, maintain personal sidebar preferences. |

---

## Strategic Configuration: Building Your Voucher Logic

Creating a standard voucher in this applet uses two work stages, but the first stage depends on the voucher type:

1. Use **Create Voucher** to complete **Details**. If the voucher type is `DISCOUNT` or `REWARDS`, the create screen also exposes **Treatment Value** before the first save.
2. After the voucher is saved, reopen it from **Voucher Listing** to use the full edit workspace: **Details**, **Treatment Value**, **Apply Rules**, **Image**, **Ticket Management**, **Website Link**, and **Audit**.

`SETTLEMENT` vouchers only use the **Details** tab during create. `DISCOUNT` vouchers show `Product` and `For All` treatment setup during create. `REWARDS` vouchers show the `For All` treatment setup during create.

{{< callout type="tip" >}}
**Creation Checklist: Things to Decide Before You Save**
- [ ] **Voucher Type:** `SETTLEMENT`, `DISCOUNT`, or `REWARDS`
- [ ] **Quantity Type:** `FIXED`, `DYNAMIC`, `IMPORT`, or `INVENTORY`
- [ ] **Status:** Set the voucher to `ACTIVE` only when it is ready for use
- [ ] **Security:** Decide whether you need **Softpin**, **Activation Pin**, **URL Key**, or **Prefix**
- [ ] **Dates:** Set both the **Event Period** and the **Redemption Period** during create
- [ ] **Website Exposure:** If needed, link the voucher to CP-Com websites during create
- [ ] **Treatment:** For `DISCOUNT` and `REWARDS`, complete **Treatment Value** before the first save if you want the voucher logic ready immediately
- [ ] **Next Step:** Rules, images, ticket operations, website maintenance, and audit review happen after the voucher is saved
{{< /callout >}}

### Step 1: Create the Voucher Shell (Details Tab)

The initial **Details** tab stores the voucher header and the create-stage settings that users should confirm up front. In this build, `DISCOUNT` and `REWARDS` users can continue into **Treatment Value** before the first save, but rules, images, ticket operations, website maintenance, and audit review still require the saved voucher record.

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
| **Event Period** | When customers can claim or collect the voucher. | Uses start and end date-time fields. In the current UI this block is part of the create form, not the edit details form. |
| **Redemption Period** | When the voucher can actually be redeemed. | Uses start and end date-time fields. In the current UI this block is part of the create form, not the edit details form. |
| **Add Voucher To CP-Com** | Links the voucher to selected website records. | Available during create for website-level exposure. After save, use **Website Link** to add or remove linked sites. |
| **Description** | Free-text business description. | Useful for internal context and listings. |
| **Terms and Conditions** | Rich-text terms stored on the voucher header. | Managed in the embedded editor at the bottom of the form. |

| Optional Control | What it does |
|:---:|---|
| **Softpin** | Adds a second secret value and lets you set the softpin length (`6` to `30`). |
| **Activation Pin** | Requires activation before use and lets you set the activation pin length (`6` to `30`). |
| **URL Key** | Creates a redeemable URL key and optional redirection target. |
| **Prefix** | Adds a serial prefix and lets you set the serial number length. |

{{< callout type="info" >}}
Before the first **SAVE**, `DISCOUNT` and `REWARDS` vouchers can already use **Treatment Value**. After the first **SAVE**, reopen the voucher from **Voucher Listing** to continue with **Apply Rules**, **Image**, **Ticket Management**, **Website Link**, and **Audit**.
{{< /callout >}}

---

## Understanding Voucher Types: When, How, and Why?

Not all vouchers use the same redemption logic. The selected type changes which fields matter and what the user will configure next.

### 1. Settlement Vouchers (`SETTLEMENT`)
**Why:** Use this when the voucher behaves like stored value or store credit.
- **Core field:** `Face Value Amount`
- **How it works:** The ticket or voucher redeems against a fixed value instead of a discount treatment formula.
- **Create flow:** Only the **Details** tab is required during create. There is no **Treatment Value** tab for settlement vouchers.
- **Best for:** Gift vouchers, service recovery credits, and compensation vouchers.

### 2. Discount Vouchers (`DISCOUNT`)
**Why:** Use this for promotions where the final discount depends on treatment logic and rules.
- **Treatment setup:** The create flow already exposes **Treatment Value** with `Product` and `For All` sub-tabs.
- **How it works:** Users define fields such as `Price Source`, `Operator`, `Value`, `Min Spend`, `Max Discount Value`, and `Auto Apply to All Child Items`.
- **What it affects:** The treatment formula controls how much discount is granted, while **Apply Rules** decides where and when that formula is allowed to work.
- **Best for:** Promo codes, campaign discounts, and item- or cart-based offers.

### 3. Rewards Vouchers (`REWARDS`)
**Why:** Use this when redemption should award points, or combine value logic with loyalty outcomes.
- **Treatment setup:** The create flow already exposes **Treatment Value**. In the current create screen, the main reward setup is in `For All`.
- **How it works:** Users can configure `Customer Points Value`, `Customer Points Expires Within (days)`, `Retailer Points Value`, `Retailer Points Expires Within (days)`, `Point Currency`, and optional value-based treatment settings.
- **What it affects:** The voucher can contribute reward points, discount-like value treatment, or both, depending on the fields enabled in the treatment form.
- **Best for:** Loyalty campaigns, event reward programs, and membership-based incentives.

{{< callout type="info" >}}
**Admin Note**
The **Field Settings** screen can hide `DISCOUNT` or `REWARDS` from the create form, so some tenants may not see all three voucher types.
{{< /callout >}}

---

## Key Features Deep-Dive

{{< cards >}}
  {{< card title="Voucher Setup" subtitle="Create voucher details and type-based treatment logic" link="#step-1-create-the-voucher-shell-details-tab" >}}

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
3. Still in the create screen, open **Treatment Value** and enter the discount logic in **For All** or **Product**.
4. Click **SAVE**.
5. Open the newly created voucher from **Voucher Listing** if you need **Apply Rules**, **Image**, **Ticket Management**, **Website Link**, or **Audit**.
6. If the promotion should only work for specific branches, companies, members, or items, go to **Apply Rules** and add the required rules.
7. Use **Image**, **Website Link**, or **Ticket Management** only if the campaign needs those extras.

{{< figure src="/images/voucher-management-applet/voucher-edit.png" alt="Voucher Create Form showing Main Details tab with Code and active toggle" caption="Campaign Creation: for discount and rewards vouchers, complete details and treatment during create, then reopen the saved voucher for rules, ticket handling, website links, and audit." >}}

### For Customer Service: Create a Fixed-Value Voucher (Settlement Type)

**Goal:** Create a RM 50 settlement voucher that works like stored credit.

1. In **Voucher**, click **"+" (Add New)**.
2. Set **Voucher Type** to `SETTLEMENT`.
3. Enter **Face Value Amount** = `50`.
4. Choose the correct **Quantity Type**. Use `FIXED` if you want a controlled number of ticket serials.
5. Set **Status** to `ACTIVE`, then click **SAVE**.
6. Reopen the voucher if you need extra controls such as **Apply Rules**, **Ticket Management**, **Website Link**, or **Audit**.

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

These controls affect how the final ticket or voucher can be activated, redeemed, and shared with users. They do not replace **Apply Rules**; they add security or delivery behavior on top of the voucher logic.

### Serial Number Generation (Prefix Logic)
When you enable **Prefix**, the form exposes both **Prefix** and **Character length - Serial Number**.
- **Example:** Set Prefix to `VIP-` and Character Length to `8`. The system can then generate serials such as `VIP-AX72J9K1`.

### The Voucher Edit Workspace

After the first save, the voucher opens into a 7-tab workspace. Admins can reorder these tabs in **Settings > Default Selection**.

| Edit Tab | What users do there | What it affects |
|:---:|---|---|
| **Details** | Review and update editable voucher header fields such as name, type-dependent values, security settings, description, and terms. | Changes the main voucher definition. In the current build, the create-only **Event Period**, **Redemption Period**, and initial CP-Com picker are not shown again here. |
| **Treatment Value** | Maintain the discount or reward formula after the voucher exists. | Changes how much value, discount, or points the voucher gives when it is applied. |
| **Apply Rules** | Restrict the voucher by date, entity, member profile, company, branch, item, or category. | Controls who can use the voucher, where it works, and which lines or documents qualify. |
| **Image** | Upload and review voucher attachments. | Changes the image assets linked to the voucher record. |
| **Ticket Management** | Generate, import, review, cancel, or activate voucher serial numbers. | Changes the actual ticket inventory and status records under that voucher. |
| **Website Link** | Add or remove website links and review the linked website code, name, and modified date. | Controls which website records remain linked to the voucher after it has been saved. |
| **Audit** | Review date, user, action, and event code history for the voucher. | Does not change voucher behavior; it gives traceability for support and review. |

### Treatment Value: `Product` vs `For All`

| Area | What users can do there | What it affects |
|:---:|---|---|
| **Product** | Add item-specific treatment rows by searching items and saving row-level treatment settings such as item name, item code, price source, operator, treatment value, and max value. | Affects only the matched items or lines, so this is the place for targeted item-level voucher treatment. |
| **For All** | Maintain the voucher-wide treatment formula. `DISCOUNT` exposes `Price Source`, `Operator`, `Value`, `Min Spend`, `Max Discount Value`, and `Auto Apply to All Child Items`. `REWARDS` adds points-related fields such as customer points, retailer points, expiry days, and point currency. | Affects the general treatment outcome when the voucher qualifies. Use this when the rule should apply broadly rather than to a selected item row. |

`SETTLEMENT` vouchers do not show **Treatment Value**. In the standard voucher create flow, `DISCOUNT` exposes both `Product` and `For All`, while `REWARDS` starts with the main reward setup in `For All`.

### Apply Rules: The 3 Rule Builders

| Rule Area | Best used for | Available rule types |
|:---:|---|---|
| **Rules - Doc Hdr** | Control header-level eligibility for the whole document or customer context | `Event Date Range`, `Redemption Date Range`, `Entity Type`, `Member Class`, `Member Label`, `Company`, `Branch`, `Delivery Region` |
| **Rules - Multi Line** | Target items or categories across multi-line documents | `Item`, `Item Category`, `Item Code Regex`, `Item Name Regex`, `Category Code Regex`, `Category Name Regex` |
| **Rules - Single Line** | Target only one matched line at a time | `Item`, `Item Category`, `Item Code Regex`, `Item Name Regex`, `Category Code Regex`, `Category Name Regex` |

- Use **Rules - Doc Hdr** when the whole transaction should pass or fail together.
- Use **Rules - Multi Line** when the voucher can evaluate across several matched lines.
- Use **Rules - Single Line** when the voucher should judge each matched line individually.

{{< figure src="/images/voucher-management-applet/voucher-edit-details.png" alt="Voucher configuration showing the main edit tabs for details, treatment value, rules, images, ticket management, website link, and audit" caption="Voucher Edit Workspace: move from header setup into treatments, rules, images, ticket handling, website mapping, and audit review." >}}

### Ticket Management and Ticket Applet
- Inside a voucher, **Ticket Management** shows summary counts for **Vouchers Generated**, **Vouchers Assigned**, and **Vouchers Redeemed**. This is the main workspace for ticket activity under one selected voucher.
- The ticket grid under the voucher shows **Serial Number**, **Assignee**, **Assigned To**, **Validity**, **Cancellation**, **Redeemable Status**, **Created Date**, and **Modified Date** so users can review the current state of each serial.
- The **Create Ticket** flow inside a voucher has three sub-tabs: **Generate Ticket**, **Import Ticket**, and **Ticket Files Listing**.
- **Generate Ticket** bulk-generates serials by entering **Max Quantity**.
- **Import Ticket** loads ticket data into the selected voucher.
- **Ticket Files Listing** reviews ticket file batches linked to that voucher flow.
- Opening a voucher-managed ticket shows voucher code, voucher name, serial number, softpin, assignment status, redemption status, created and modified dates, plus a button to **Cancel** or **Activate** the serial.
- The top-level **Ticket** menu is for standalone ticket maintenance. Users select a voucher, then create or update one serial at a time with **Assignment Status**, **Validity Status**, **Cancellation Status**, and **Redeemable Status**.
- The top-level ticket edit screen also shows readonly **URL Key** and **Activation Pin** values when they exist on the ticket.
- **Ticket History** is the detailed trace view. It shows fields such as **Location**, **Code**, **Transaction Description**, **Transaction Date**, **Document**, **Server Doc Type**, **Entity**, **Reference**, **Quantity**, **Amount**, **MA Cost**, **Posting Status**, and **Remarks**.
- In the current UI, **Ticket History** remaps some backend transaction descriptions into clearer user-facing wording such as `Stocked in`, `Awarded to customer`, and `Redeemed`.

{{< callout type="info" >}}
If **Field Settings > ENABLE_MULTIPLE_TICKET** is turned off, a `FIXED` voucher may stop showing the add button after the allowed ticket count has been generated.
{{< /callout >}}

### Scanned Event Monitoring
- The **Scanned Event** listing shows **Serial Number**, **Item Name**, **Email**, **Phone**, **Scan Date**, **Reward Points**, **User Type**, **Status**, **Remarks**, **Shipping Address**, and **Attachment**.
- Opening a record shows a **Details** tab plus an **Attchment** tab in the current UI.
- The **Details** tab is mainly for review. It shows serial, item, contact details, reward points, user type, status, remarks, activation pin, and audit fields.
- Customer-type records can update **Shipping Address** from the detail view. This is useful when a scanned voucher or event record needs fulfillment follow-up.
- The **Attchment** tab stores image records with **Created Date** and **Updated Date**. Opening an attachment lets users inspect the linked scan evidence.

### Recurring Voucher Automation
- The **Recurring Voucher** flow is a scheduled voucher template, not a full copy of the standard voucher workspace.
- The recurring create form supports `SETTLEMENT`, `DISCOUNT`, and `REWARDS`, but its quantity types are only `FIXED` and `DYNAMIC`.
- The recurring create form adds **Recurring ?**, **Start Date**, **End Date**, and a recurrence editor so users can define when the recurring voucher should run.
- Unlike the standard voucher create form, the recurring create form does not show **Event Period**, **Redemption Period**, or **Add Voucher To CP-Com** in the current UI.
- For non-settlement recurring vouchers, the create flow includes **Treatment Value** during create. The recurring treatment form is a single treatment workspace rather than the standard voucher's `Product` plus `For All` split.
- After save, the recurring edit workspace has **Details**, **Treatment Value**, **Apply Rules**, and **Image**.
- In the current recurring workspace there is no **Ticket Management**, **Website Link**, or **Audit** tab.
- Use this menu when the main requirement is repeated scheduled issuance. If the process depends on manual ticket handling or website-link maintenance, users still need the standard **Voucher** workspace.

### Import Tickets
- The upload screen is labelled **Upload Master Data** in the current UI. Users drag and drop a `.csv` file, preview the selected file, remove it if needed, then click **ADD**.
- Use the **Sample Format** link in the upload screen before submitting files.
- After upload, the listing shows file-level results such as **File Name**, **File Size**, **Format**, **Status**, **Process Status**, **User Error Message**, **Created Date**, **Updated Date**, and **Created by**.
- Opening an import record shows a **Main** tab and a **Checking** tab.
- The **Main** tab shows file name, file size, import format, process status, status, and error message so users can tell whether the file was accepted or rejected.
- The **Checking** tab is the line-level review area. It helps users validate `Voucher Code`, `Serial No.`, `Validity Status`, `Assignment Status`, `Redemption Status`, `Cancellation Status`, and **Short Error Message** before correcting the CSV and re-uploading it.
- Import behavior can be tenant-specific, so users should follow the file template provided in their current environment.

---

## Configuration & Settings

Navigate to **Settings** in the applet sidebar to configure global behavior, then use **Personalization** for user-level overrides.

{{< figure src="/images/voucher-management-applet/applet-settings.png" alt="Settings menu showing Feature Visibility, Webhooks, and Permission Sets" caption="Settings Menu: customize default behavior, field visibility, and governance controls for the applet." >}}

### Default Selection
- Set the applet-wide **Default Branch**, **Default Location**, and **Default Timezone**.
- These defaults affect what the applet preselects for users and which timezone is used when the create form prepares date-time defaults such as **Event Period** and **Redemption Period**.
- Reorder the voucher edit tabs: **Details**, **Treatment Value**, **Apply Rules**, **Image**, **Ticket Management**, **Website Link**, and **Audit**.
- Tab ordering changes the saved voucher edit workspace only; it does not change the create screen.

### Field Settings
- **ENABLE_MULTIPLE_TICKET:** Controls whether more than one ticket can be generated where the flow allows it. When disabled, a `FIXED` voucher may stop showing the add button once the allowed ticket record exists.
- **HIDE_VOUCHER_TYPE_REWARD:** Removes `REWARDS` from the voucher type selector.
- **HIDE_VOUCHER_TYPE_DISCOUNT:** Removes `DISCOUNT` from the voucher type selector.
- **ENABLE_EDIT_VOUCHER_CODE:** Allows voucher code editing after create when enabled.

### Feature Visibility, Webhooks, and Permissions
- The applet route set includes **Feature Visibility**, **Webhook**, and permission administration pages, but tenant navigation and permissions determine whether users can open them from the current environment.
- **Feature Visibility** lets admins hide features that are not relevant to the tenant.
- **Webhook** supports outbound integration behavior from the settings area.
- Permission administration is available for **Permission Set Listing**, **User Permission Listing**, **Team Permission Listing**, and **Role Permission Listing**.

### Personalization
- **Personal Default Selection** lets each user override the applet defaults for their own profile.
- In the current build, the user-level component clearly persists **Default Branch** and **Default Location**.
- The current UI also shows a **Default Timezone** row, but the component logic only saves branch and location in this build. Users should treat branch and location as the reliable personalization overrides here.
- **Sidebar** personalization may be available when the shared personalization route is exposed for the tenant.

---

## FAQs

**Q: Why do I see `Treatment Value` during create for some vouchers but not others?**  
A: `DISCOUNT` and `REWARDS` vouchers expose **Treatment Value** during create. `SETTLEMENT` vouchers do not. Tenant field settings can also hide `DISCOUNT` or `REWARDS` from the selector.

**Q: Why are `Event Period`, `Redemption Period`, or `Add Voucher To CP-Com` not on the edit details screen?**  
A: In the current build those blocks are part of the create details form. After save, use **Website Link** to maintain linked websites, and use **Apply Rules** for additional eligibility control, but confirm the create-only date windows before the first save.

**Q: Can I edit the voucher code after creation?**  
A: Only if **Settings > Field Settings > ENABLE_EDIT_VOUCHER_CODE** is enabled. Otherwise the code stays locked after create.

**Q: Where should I generate or import ticket serial numbers?**  
A: Use **Voucher > open voucher > Ticket Management** for voucher-level batch work. Use the top-level **Ticket** menu for standalone ticket creation and maintenance.

**Q: Why did the add button disappear in voucher `Ticket Management`?**  
A: If **ENABLE_MULTIPLE_TICKET** is turned off and the voucher uses `FIXED` quantity type, the applet can hide the add button once the allowed ticket record already exists.

**Q: What is the difference between `Add Voucher To CP-Com` and `Website Link`?**  
A: `Add Voucher To CP-Com` is the create-stage website picker. **Website Link** is the saved-voucher maintenance tab where users can add or remove links and review linked website code and name.

**Q: How is `Recurring Voucher` different from the normal `Voucher` workspace?**  
A: Recurring vouchers are scheduled templates. They use a smaller workspace with **Details**, **Treatment Value**, **Apply Rules**, and **Image**, and they do not expose **Ticket Management**, **Website Link**, or **Audit** in this build.

**Q: Where do I check what happened to a ticket after it was issued?**  
A: Open the ticket and review **Ticket History** for the serial trace, or use **Scanned Event** for event-style scan records and attachments.

**Q: Why does Personalization show `Default Timezone` but not behave like Branch or Location?**  
A: The current UI shows the row, but the component logic in this build only persists branch and location overrides.

---
