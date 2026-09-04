---
title: "Shopping Cart (Internal) Applet"
description: "Reconcile, validate, and settle transaction carts created by cashiers or submitted by customers via the CP-Commerce e-commerce portal"
tags:
- shopping-cart
- cp-commerce
- entity-credit
- settlement-methods
- customer-management
weight: 170
aliases:
- /applets/shopping-cart-applet/
---

## Purpose and Overview

The **Shopping Cart Applet** serves as the central back-office administration and settlement hub for transaction carts in the BigLedger ecosystem. It manages shopping carts initiated by internal agents as well as online checkouts submitted by customers using the **CP-Commerce Shopping Cart Widget** on your e-commerce storefront website. 

Rather than acting as a standalone checkout terminal, the applet bridges customer-facing online retail activity with back-office operations, allowing sales agents and administrators to review customer cart drafts, validate credit terms, apply customer-specific contract pricing, and process multi-method split settlements.

{{< callout type="info" >}}
**Core Integration**: The applet links **storefront customer activity** (items added via the CP-Commerce website widget) with **back-office verification** (real-time credit checks, address picker resolution, and payment ledger entries) to successfully process and finalize sales.
{{< /callout >}}

{{< figure src="/images/shopping-cart-applet/shopping-cart-applet-overview.png" alt="BigLedger Shopping Cart Applet: The Omnichannel Settlement Hub — Online Storefront generates DRAFT documents via Real-Time Storefront Synchronization; Abandoned Cart Recovery lets agents view pending carts; Omnichannel Sales Support assists customers with checkout errors; Integrated CRM and Credit Verification checks limits before release; Multi-Method Split Payments supports Cash, Card, Vouchers, Points, and Bank Transfers; FINAL creates a Sales Order (locks document for fulfillment); CONVERT creates an Internal Receipt Voucher (posts payment to ledger and deletes the draft cart)." caption="BigLedger Shopping Cart Applet: The Omnichannel Settlement Hub — from online storefront draft generation through CRM checks, split-payment settlement, and final conversion to a Sales Order or Receipt Voucher." >}}

### Who Benefits from This Applet?

**Sales Agents and Cashiers:**
- Instantly pull up draft carts submitted by customers online to finalize the transaction.
- Perform real-time customer credit limit and terms checks before releasing orders.
- Split payment settlements across multiple methods (Cash, Card, Voucher, Points) based on customer preferences.

**E-Commerce and Operations Managers:**
- Reconcile pending storefront cart checkouts and track draft orders at the branch level.
- Re-assign sales agents or modify quantities and pricing inline before final processing.
- Perform bulk finalisation of storefront draft carts to close sales periods efficiently.

**Administrators and Setup Teams:**
- Define default branches, store locations, and webhook routing rules for website checkouts.
- Manage strict field-level visibility constraints and role-based editing permissions.
- Map settlement accounts for online payment methods.

---

### What Problems Does This Solve?

**The Disconnected Storefront and Back-Office Problem:**

When customers add items to shopping carts on an e-commerce website, operations teams have no way to verify custom credit limits or record complex split settlements (for example, paying via points plus cash) without manually re-entering the data. Common issues include:
- Manual transcription of online orders into the back-office system
- No real-time validation of customer credit before order release
- Delayed order processing due to disconnected systems

**The Shopping Cart Applet Solution:**

- **Direct synchronization** - Customer website activity from the CP-Commerce Shopping Cart Widget flows directly into the applet as draft documents for instant validation and settlement
- **Embedded CRM editor** - Search, register, or edit customer parameters (including credit limits, custom pricing schemes, and contacts) inline during checkout without switching to an external system
- **Split payment ledger** - An outstanding balance calculation ledger tracks total line-item debt against a collection of separate settlement lines, supporting multi-method payments (Cash, Card, Voucher, Points, Cheque)

---

## Key Features Overview

{{< cards >}}
  {{< card title="Cart Listing" subtitle="View, filter, and bulk-finalise transaction carts" link="#my-carts---the-sales-listing" >}}

  {{< card title="Main Details" subtitle="Manage header details, sales agents, and credit limits" link="#main-details-tabpanel" >}}

  {{< card title="Account Addresses" subtitle="Select and configure billing and shipping profiles" link="#account-details-tabpanel" >}}

  {{< card title="Line Items Grid" subtitle="Manage quantities, pricing schemes, and tax codes" link="#line-items-tabpanel" >}}

  {{< card title="Split Payments" subtitle="Settle balances using multiple payment methods" link="#payment-tabpanel" >}}

  {{< card title="Customer CRM" subtitle="Manage customer details and credit terms inline" link="#customer-selection--crm-management" >}}

  {{< card title="Item Selector" subtitle="Configure quantities and discount parameters" link="#line-item-selection--configuration" >}}

  {{< card title="Admin Settings" subtitle="Configure defaults, visible fields, and webhooks" link="#configuration--settings" >}}
{{< /cards >}}

---

## Key Concepts

### CP-Commerce Storefront Integration

The Shopping Cart Applet acts as the administrative back-office companion to the customer-facing CP-Commerce storefront website or app. The relationship between customer storefront activity and back-office settlement workflows is visualized below:

```mermaid
flowchart TD
    subgraph Storefront ["CP-Commerce Storefront Website or App"]
        W["Shopping Cart Widget"] -->|"Customer checks out"| P["Submit Draft Cart"]
    end
    subgraph BackOffice ["Back-Office Management (Shopping Cart Applet)"]
        A["Load Sync'd Draft Cart"] -->|"Verify details & limits"| V["Verify CRM, Address, and Credit"]
        V -->|"Record payments"| S["Add Split Payments"]
        S -->|"Option A: Finalise Cart"| F["Set posting_status to FINAL"]
        F -->|"Generates"| SO["Posted Sales Order (SO)"]
        S -->|"Option B: Convert Cart"| C["Generate INTERNAL_RECEIPT_VOUCHER"]
        C -->|"Removes source"| D["Delete Draft Cart"]
    end
    P -->|"Syncs draft data"| A
```

- **Draft Synchronization**: When a storefront user interacts with the customer-facing website or app (e.g. adding products, editing quantities, or selecting shipping options), the system synchronizes this data in real time, creating or updating a corresponding cart record with a `DRAFT` posting status in the Shopping Cart Applet database.
- **Review and Settlement**: The cashier or sales lead opens the pending storefront cart, verifies customer-specific parameters (such as outstanding balance, credit terms, and addresses), modifies line items if necessary, records the settlement transactions (split payment ledger), and either clicks **FINAL** to lock the document (generating a Sales Order) or converts the settled cart into a posted sales record (deleting the draft cart).

---

### Purchasing Framework

Every transaction processed by the Shopping Cart Applet must address three fundamental aspects. The system provides structured handling for each:

| Aspect | Component | Practical Example |
|--------|-----------|------------------|
| **Who** is purchasing? | Customer / Member | Walk-in Customer, Corporate Account, Loyalty Member |
| **What** is being bought? | Item and Pricing Scheme | Standard Item Code, Retail Price, Wholesaler Discount |
| **How** is it settled? | Payment Method and Credit | Cash, Credit Card, Voucher, Credit Terms (30 Days) |




### The Customer-Address Relation Chain

To prevent data entry errors and ensure accurate shipping/billing calculations, fields are linked in a strict dependency sequence:

```mermaid
flowchart TD
    A["Select Customer Profile (Entity ID)"] -->|Retrieves| B["Credit Limit and Credit Terms"]
    A -->|Unlocks| C["Address Picker Dialogs"]
    C -->|Populates| D["Billing and Shipping Details"]
```

**Flow Details:**
1. **Customer Selection**: The agent clicks the **Entity ID** picker to select a customer.
2. **Credit Activation**: The system fetches the customer's credit parameters, enabling and auto-populating the **Credit Limit** and **Credit Terms** dropdowns in the Main Details header.
3. **Address Pickers**: The billing and shipping address selector buttons are unlocked, ensuring only addresses associated with the selected customer can be chosen.

---

## Quick Start Guide

Get up and running quickly with these essential workflows.

### For Sales Agents: Settle an Order

**Goal:** Create a cart or open a storefront draft, verify credit, record payment, and finalize the order.

1. **Locate or Start Cart**: 
   - **Manual**: Click the **"+"** button on the listing.
   - **Storefront**: Find the draft cart synced from the customer-facing website or app in the list and click it.
2. **Assign Customer**: Go to **Account > Entity Details**, select the customer's **Entity ID** (if not already synced from the storefront).
3. **Set Branch**: In **Main Details**, select the **Branch** and **Location** (Credit Terms and Limits will auto-populate).
4. **Configure Items**: Go to **Line Items**, adjust quantities/UOM, select the tax code, or click **"+"** to add new items.
5. **Record Payment and Settle**: Go to **Payment**, click **"+"**, select your payment method, enter the amount, and either click **FINAL** to lock the document or navigate to **Convert** to post a receipt voucher (which deletes the draft cart).

---

### For Supervisors: Process Pending Storefront Carts

**Goal:** Review, bulk-finalise, or delete draft sales carts synced from the e-commerce website.

1. **Open Queue**: Open the **Shopping Cart** listing.
2. **Identify Storefront Drafts**: Filter the listing grid to display draft carts.
3. **Bulk Finalise**: Select multiple check-boxes on the draft carts in the grid, then click **FINAL** at the top.
4. **Delete Draft**: Open an individual draft, click **DELETE** at the bottom, and click **CLICK AGAIN TO CONFIRM**.

---

### For Admins: Initial System Setup

**Goal:** Configure operating defaults and visibility rules for the team.

1. **Configure Defaults**: Navigate to `Settings > Default Selection` and set the default **Branch** and **Location**.
2. **Set Visibility Rules**: Go to `Settings > Feature Visibility` to hide unnecessary fields or enable delete buttons.
3. **Add Webhooks**: Go to `Settings > Webhook` to configure server payloads for automatic system integrations.
4. **Establish Permissions**: Go to `Settings > Permission Set Listing` to define security clearance levels.

---

## Real-world operational scenarios

The Shopping Cart Applet is not just a passive ledger; it is an active sales enablement and customer engagement tool. Below are common real-world scenarios showing how sales agents and managers can leverage synced draft data to capture lost sales, resolve checkout issues, and handle corporate negotiations.

### Scenario 1: Proactive Sales and Cart Recovery (The Abandoned Cart USP)

*   **Context**: A registered wholesale customer adds high-value engine parts to their online shopping cart on your CP-Commerce e-commerce website but closes the tab without checking out.
*   **Operational Challenge**: Traditional systems treat this as lost, invisible traffic until the customer chooses to complete the checkout.
*   **The BigLedger Solution**:
    1.  The cart immediately synchronizes to the **Shopping Cart Applet** as a `DRAFT` document containing the customer's **Entity ID** and selected **Line Items**.
    2.  A sales agent monitors the **Cart Listing** queue, filters by `DRAFT` status, and notices the customer has had items pending for 24 hours.
    3.  The agent opens the draft, reviews the items, and contacts the customer directly (using contact details retrieved from the linked customer profile).
    4.  The customer explains they abandoned the cart because they had questions about bulk shipping rates and item compatibility.
    5.  The agent clarifies the technical details, offers a shipping discount by adjusting the pricing inline in the draft cart, and saves the changes.
    6.  The customer approves, and the agent converts the cart to secure the sale.

### Scenario 2: Assisted Storefront Checkout (Omnichannel Sales Support)

*   **Context**: A customer is attempting to complete a purchase on your storefront app but encounters a card payment gateway error or cannot navigate the checkout screen.
*   **Operational Challenge**: The customer is frustrated and may walk away from the purchase entirely.
*   **The BigLedger Solution**:
    1.  The customer calls the customer support hotline.
    2.  The support agent asks for the customer's name, searches the **Cart Listing** in real time, and immediately locates the active storefront draft cart session.
    3.  The agent confirms the items in the cart over the phone, verifying the customer's intent.
    4.  To bypass the online payment issue, the customer asks to pay using a physical gift voucher they possess and pay the remainder in cash at the store.
    5.  The agent enters the **VOUCHER** details under the **Payment** tab, reducing the outstanding balance, and clicks **SAVE**.
    6.  When the customer visits the physical outlet, the cashier pulls up the saved draft cart, collects the cash, records the **CASH** payment, and clicks **Convert** to post the sale as an **Internal Receipt Voucher**.

### Scenario 3: B2B Credit Verification and Custom Negotiation

*   **Context**: A retail partner builds a large stock-replenishment order on the CP-Commerce website. The total order value exceeds their default checkout limits.
*   **Operational Challenge**: The order is stalled, and the client wants to negotiate terms rather than reducing their order size.
*   **The BigLedger Solution**:
    1.  The draft cart is synced to the back-office queue.
    2.  The credit controller opens the cart and goes to **Account Details > Entity Details** to review the customer's outstanding balance and credit parameters.
    3.  The controller notices the customer's credit limit is indeed exceeded.
    4.  The controller contacts the client and negotiates a partial advance: the client will transfer $2,000 immediately, and the remaining $3,000 will be charged to their account on 30-day terms.
    5.  Once the client sends the $2,000 bank wire, the cashier adds a **BANK_TRANSFER** line for $2,000 under the **Payment** tab.
    6.  The cashier clicks **FINAL** to lock the cart, which automatically posts a **Sales Order (SO)** for the remaining $3,000 balance in the system, routing it to the warehouse for fulfillment.

---

## For Sales Agents and Cashiers

This section is your guide to day-to-day transactions and point-of-sale checkout workflows.

### My Carts - The Sales Listing

This is your main dashboard showing all pending and completed transactions. It displays both manual cashier carts and draft orders synced from the **CP-Commerce Storefront**.

{{< figure src="/images/shopping-cart-applet/shopping-cart-listing.png" alt="Shopping Cart Listing grid displaying document details" caption="Shopping Cart Listing: Search, filter, and select transactions from the central grid queue." >}}

**What You Can Do:**
- **Create a New Cart**: Click the **"+"** button to start a manual transaction.
- **Search and Filter Carts**: Use the Advanced Search bar to filter by document number, branch, or customer name to locate storefront draft sessions.
- **View or Edit**: Click on any row to open the details of that shopping cart.
- **Toggle Column Layout**: Click the Column Toggle button to switch between single-column and double-column grid layouts.
- **Bulk Finalise**: Select multiple draft carts and click **FINALISE** to lock them in bulk.

---

### Creating and Editing Shopping Carts

Opening a cart loads the main transaction workspace. The sections are organized as tabs (horizontal) or expansion panels (vertical).

{{< figure src="/images/shopping-cart-applet/shopping-cart-create-main.png" alt="Shopping Cart Creation Main Details form layout" caption="Main Details: Configure transaction properties including branch, location, and sales agent." >}}

### Workspace Control Buttons

The top header bar contains operational actions to control the document state:

| Button | Operational Action | Database and System Impact | Usage Rule |
| :--- | :--- | :--- | :--- |
| **RESET** | Discard current unsaved edits. | Reverts the form fields to the last saved database state. | Use when you want to clear unsaved modifications in the active session. |
| **SAVE** | Commit changes as a draft. | Saves current header, account, line item, and payment data. The cart remains in `DRAFT` status (fully editable). | Use regularly while working on a cart to save progress. |
| **FINAL** | Lock and post the cart. | Sets the posting status to `FINAL`. Automatically locks all edit capabilities and generates a **Sales Order (SO)** in the system. | Click only when the order is verified, fully paid, and ready to generate the Sales Order. |
| **DELETE** | Permanently remove the cart. | Deletes the shopping cart from the database. (Requires clicking a second time to confirm: `CLICK AGAIN TO CONFIRM`). | Only available for `DRAFT` carts, and requires `SHOW_DOCUMENT_DELETE_BUTTON` to be active. |

---

#### Main Details Tab/Panel

Defines basic document metadata, responsible agents, and terms.

| Field | Purpose | Required | Example |
|-------|---------|----------|---------|
| **Branch** | Select the operating branch. Auto-fills company code and currency. | Yes | `KL HQ Branch` |
| **Location** | Select store or warehouse location. Auto-fills branch default location if configured. | Yes | `Retail Store A` |
| **Sales Agent** | Salesperson responsible for the sale. | Yes | `Agent Sarah` |
| **Currency** | Transaction currency. Auto-populated from the selected Branch settings. | Yes | `MYR`, `USD` |
| **Credit Terms** | Payment term code. *Conditional* - Enabled and populated after selecting a Customer. | Yes | `30 Days` |
| **Credit Limit** | Maximum credit allowance. *Conditional* - Enabled and populated after selecting a Customer. | Yes | `Limit USD 10,000` |
| **Transaction Date** | Date of the transaction. Defaults to current date. | No | `2026-06-15` |
| **Sales Lead** | Categorizes lead source. Selection: Corporate or Non-Corporate. | No | `Corporate` |
| **Permit No** | Business permit reference number. | No | `PMT-9099-AA` |
| **Tracking ID** | Courier or shipment tracking identifier. | No | `TRK-882910` |
| **CRM Contact** | Secondary contact key for customer correspondence. | No | `Sarah Connor (Manager)` |
| **Member Card** | Linked customer membership card. Clickable to open selection. | No | `MEM-55102` |
| **Remarks** | Free-text comments. Includes character counter. | No | `Delivery requested by Friday afternoon.` |

*Edit-Mode Read-Only Fields:*
When viewing an existing cart, the header exposes read-only audit fields at the top:
- **Doc Short Code**: The short identifier (e.g. `SC` for Shopping Cart).
- **Tenant Doc No** (`tenantDocNo`): Primary server document identifier.
- **Company Doc No** (`companyDocNo`): Company-specific reference.
- **Branch Doc No** (`branchDocNo`): Branch-specific tracking number.

---

#### Account Details Tab/Panel

Holds customer profile selections and associated address details. It is divided into three nested sub-tabs:

##### 1. Entity Details Sub-tab
- **Entity ID** (Required): Click this field to open the Customer Selector Dialog.
- **Customer Metadata** (Read-only): Displays the customer's name, type (Individual/Corporate), ID Number, GL Code, Email, Phone, and status once selected.

##### 2. Bill To Sub-tab
- **Billing Contact Info** (Editable): Enter the Billing Name, Email, and Phone Number.
- **Billing Address Picker**: Click the address input to open the billing address selection dialog. Disabled until an Entity ID is selected.
- **Address Details** (Read-only): Displays Address Line 1-5, City, State, Postcode, and Country once selected.

##### 3. Ship To Sub-tab
- **Recipient Contact Info** (Editable): Enter the Recipient Name, Email, and Phone Number.
- **Shipping Address Picker**: Click the address input to open the shipping address selection dialog. Disabled until an Entity ID is selected.
- **Address Details** (Read-only): Displays Address Line 1-5, City, State, Postcode, and Country once selected.

---

#### Line Items Tab/Panel

Handles itemized stock listings, quantities, tax computations, and pricing.

{{< figure src="/images/shopping-cart-applet/shopping-cart-edit-lines.png" alt="Shopping Cart Line Items tab showing items grid and totals" caption="Line Items: View added items, check taxes, and adjust quantities using the delivery slider." >}}

- **Totals Section**: Displays the **Total Txn Amount** and **Tax Amount** in the top right.
- **Add Item Action**: Clicking the **"+"** button opens the Add Line Item Dialog (disabled if document status is `FINAL`).
- **Grid Columns**:
  - **Item Code / Item Name**: Stock identifier.
  - **UOM**: Selected unit of measure.
  - **Delivery**: Uses a slider component allowing agents to adjust the quantity base visually.
  - **Qty**: Base numeric quantity.
  - **Unit Price**: Standard item price (automatically calculated).
  - **SST/VAT/GST**: Line item tax amount.
  - **Txn Amount**: Total line item amount including taxes.

---

#### Payment Tab/Panel

Tracks payment settlements recorded against the cart.

{{< figure src="/images/shopping-cart-applet/shopping-cart-edit-payment.png" alt="Shopping Cart Payment settlement listing and outstanding calculation" caption="Payment: Review logged settlements and track outstanding balances before finalizing." >}}

- **Summary section**:
  - **Total**: Displays total cash/payments logged.
  - **Outstanding**: Calculated as `Total Line Item Debt - Total Payments`. Displays in red if there is a remaining balance.
- **Grid Columns**:
  - **Date**: Payment date (YYYY-MM-DD).
  - **Amount**: Net payment amount.
  - **Details**: Payment details (e.g. Credit Card brand, Cash account).
  - **Remarks**: Payment remarks.
- **Add Payment Action**: Clicking the **"+"** button opens the Add Payment Dialog (disabled once the Outstanding balance is `0.00`).

---

### Converting Settled Carts to Receipt Vouchers

When a customer settles their shopping cart, the system can convert the draft cart directly into a posted financial receipt. This is executed using the **Convert to Receipt Voucher** action in the workspace.

#### How the Conversion Works

Rather than keeping the shopping cart as a static document, the conversion flow moves the transaction directly into your financial ledger:

1. **Extraction**: The system reads the header metadata and the payment lines recorded under the **Payment** tab.
2. **Posting**: It generates a new, posted **Internal Receipt Voucher (IRV)**. This document contains all the payment settlement lines and represents the finalized sale in your accounts receivable/general ledger.
3. **Deletion**: Upon successful creation of the Receipt Voucher, the system automatically deletes the original draft shopping cart to keep your intake queue clean and prevent double counting of inventory or revenue.

#### Cashier Walkthrough: Convert a Cart

1. Open the draft shopping cart.
2. Go to the **Payment** tab and record the payment details (Cash, Card, Voucher, or Points) until the **Outstanding** balance displays as `0.00`.
3. Select the **Convert** action tab or button in the workspace.
4. Click **CONVERT**.
5. The system will display a success toast `Shopping Cart Converted Successfully` and return you to the main listing. The original cart is now cleared from the listing, and the sale is recorded under the Receipt Voucher ledger.

---

## Customer Selection and CRM Management

When selecting a customer, the Customer Selection screen slides into view:

- **Mode Slider Toggle**:
  - **Select Mode**: Click any row in the customer list grid to choose that customer for the cart.
  - **Create/Edit Mode**: Shows the **"+"** add button. Clicking a customer row in this mode opens the Customer Edit View.

---

### Editing Customer Profiles

When editing a customer record, a comprehensive multi-tab layout is displayed to configure profiles, categories, logins, payment configs, tax, addresses, contacts, branches, custom pricing, and credit limits.

#### Main Tab

Contains basic identity information.

| Field | Purpose | Required | Example |
|-------|---------|----------|---------|
| **Customer Name** | Full name of the customer. | Yes | `Alice Johnson Ltd` |
| **Customer Code** | Unique identifier for accounting. | Yes | `CUST-99081` |
| **Status** | Account status. Selection: ACTIVE or INACTIVE. | Yes | `ACTIVE` |
| **Type** | Account type. Selection: CORPORATE or INDIVIDUAL. | Yes | `CORPORATE` |
| **Identity Type** | *Conditional* - Type of ID. Shows only if Type is INDIVIDUAL. | No | `IDENTITY CARD (IC)` |
| **ID Number** | ID Card or Passport number. | No | `920112-14-5567` |
| **Gender** | *Conditional* - Gender. Shows only if Type is INDIVIDUAL. | No | `FEMALE` |
| **Tax ID** | Tax registration number. | No | `TX-9901-AA` |
| **Currency** | Default currency for transactions. | Yes | `MYR` |
| **Description** | Internal notes. | No | `VIP Wholesaler customer.` |
| **AR / AP Type** | Accounts Receivable / Payable category. | No | `DEBTOR` |
| **GL Code** | General Ledger account mapping. | Yes | `3000-Trade Debtors` |
| **Phone** | Primary contact phone number. | No | `+6012-3456789` |
| **Email** | Primary email address for notifications and statements. | Yes | `alice@johnsonltd.com` |

*Read-Only Audit Fields:*
- **Created By** / **Created Date**
- **Modified By** / **Modified Date**

---

#### Customer Category Tab

Assigns custom categories to segment customers for reporting and discount rules.

- **How to Add Category**: Click **"+ Add"**, select the category from the dropdown, and save.
- **Fields**: Category Code, Category Name, Level Value.

---

#### Login Tab

Configures credentials for customer self-service portals.

- **How to Create Login**: Click **"+ Add"**, enter the user's email, check **Verify Email** if required, select the role (OWNER, ADMIN, MANAGER, MEMBER, GUEST), and click **CREATE**.

---

#### Payment Config Tab

Maps preferred settlement accounts and payment terms.

- **Fields**: Payment Type, Bank, Bank Identifier Code, Bank Acc. No., Bank Acc. Holder Name.

---

#### Tax Tab

Defines customer-specific tax configurations and tax registration numbers.

- **Fields**: Tax Code, Tax Type, Tax Rate, Tax Option (Include Tax, Exclude Tax).

---

#### Address Tab

Maintains billing and shipping address databases.

- **How to Create Address**: Click **"+ Add"**, select the country first, fill in Address Line 1-5, City, State, Postcode, and check **Set as default** or **Main Address** if applicable.

---

#### Contact Tab

Tracks client-side contact individuals, designations, and telephone extensions.

- **Fields**: Contact Name, Designation/Position, Office No, Extension No, Mobile No, Fax No, User Email.

---

#### Branch Tab

Maps customer branch sub-entities to corporate parent accounts.

- **Fields**: Branch Code, Branch Name, Location Name, default currency.

---

#### Item Pricing Tab

Overrides standard retail prices with custom contract pricing schemes for specific items.

- **Fields**: Customer Item Code, Customer Item Name, Purchase Price, Sales Price.

---

#### Credit Term and Limit Tab

Contains nested sub-tabs to enforce transaction limits:

##### A. Credit Term Sub-tab
- Configure terms like Cash, 15 Days, 30 Days, 60 Days.
- **Fields**: Credit Term Code, Credit Term Name, Day count (e.g. 30).

##### B. Credit Limit Sub-tab
- Set the maximum outstanding balance allowed.
- **Fields**: Credit Limit Code, Credit Limit Name, Credit Limit Amount.

---

## Line Item Selection and Configuration

Clicking the **"+"** button on the Line Items tab opens the item search window.

- **Search Item Tab**: Enter keywords to search the catalog, showing Item Code, Name, Stock Balance, and details. Selecting an item opens the Configuration screen.

---

### Item Configuration Form

Allows adjusting quantities, UOMs, and pricing schemes.

> [!WARNING]
> Many fields in this dialog are conditional and can be toggled on/off under Admin settings.

| Field | Purpose | Required | Example |
|-------|---------|----------|---------|
| **Item Code** | Unique item code (Read-only). | Yes | `ITM-0012` |
| **Item Name** | Display name of the item. | Yes | `Premium Engine Oil` |
| **UOM** | Unit of measure selection. *Conditional* - Hidden if `HIDE_UNIT_PRICE_STD_PRICING_SCHEME` is enabled. | Yes | `Carton` |
| **Pricing Scheme** | Custom pricing scheme. *Conditional* - Hidden if `HIDE_UNIT_PRICE_STD_PRICING_SCHEME` is enabled. | Yes | `Standard Wholesaler` |
| **Quantity Base** | Quantity in base units. *Conditional* - Hidden if `HIDE_QTY_BASE` is enabled. | Yes | `10` |
| **Quantity by UOM** | Quantity in selected UOM. *Conditional* - Hidden if `HIDE_QTY_UOM` is enabled. | Yes | `1` (1 Carton = 10 Bottles) |
| **UOM to Base Ratio** | Conversion ratio (Read-only). *Conditional* - Hidden if `HIDE_UOM_TO_BASE_RATIO` is enabled. | Yes | `10.0` |
| **Unit Price STD (Excl)** | Standard unit price excluding tax (Read-only). *Conditional* - Hidden if `HIDE_UNIT_PRICE_STD_EXCL_TAX` is enabled. | Yes | `120.00` |
| **Unit Price STD (Incl)** | Standard unit price including tax (Read-only). *Conditional* - Hidden if `HIDE_UNIT_PRICE_STD_INCL_TAX` is enabled. | Yes | `127.20` |
| **Unit Discount** | Discount per unit. *Conditional* - Hidden if `HIDE_UNIT_DISCOUNT` is enabled. | No | `5.00` |
| **Tax Code** | Tax selector dropdown (SST/GST/VAT). *Conditional* - Hidden if `HIDE_TAX_CONFIG_SELECTION` is enabled. | Yes | `SST-6%` |
| **Tax Rate** | Tax percentage (Read-only). | Yes | `6.0` |
| **Tax Amount** | Calculated tax value (Read-only). | Yes | `6.90` |
| **WHT Code** | Withholding tax selector dropdown. *Conditional* - Hidden if `HIDE_WHT_CONFIG_SELECTION` is enabled. | No | `WHT-3%` |
| **WHT Rate** | Withholding tax percentage (Read-only). | Yes | `3.0` |
| **WHT Amount** | Calculated Withholding tax value (Read-only). | Yes | `3.45` |
| **Txn Amount** | Final line item transaction amount including taxes. *Conditional* - Hidden if `HIDE_AMOUNT_TXN` is enabled. | Yes | `123.75` |
| **Remarks** | Remarks specific to this line item. | No | `Fragile packing required.` |

---

## Add Payment and Settlement Methods

Clicking the **"+"** button on the Payment tab opens the settlement dialog. You can select a payment method and fill in the corresponding fields:

| Settlement Method | Required Fields | Method-Specific Inputs | Purpose / Notes |
|-------------------|-----------------|------------------------|-----------------|
| **CASH** | Date, Amount | None | Standard physical cash collection. |
| **CASH_BACK** | Date, Amount | Cash Back | Records cash returned to customer; computes Net Paid. |
| **CREDIT_CARD** | Date, Amount | Card Number, Name, Issuer, Card Type, Expiry, CVV | Standard merchant card processing info. |
| **VOUCHER** | Amount | Voucher Number | Redeems pre-issued credit or gift vouchers. |
| **BANK_TRANSFER** | Date, Amount | Transaction Number | Records direct online bank wire references. |
| **MEMBERSHIP_POINT_CURRENCY** | Date, Amount | Points Select, Point Currency Value | Deducts membership loyalty points to settle balances. |
| **CHEQUE** | Date, Amount | Cheque Number | Records bank cheque routing numbers. |

---

## Configuration and Settings

Admin configurations are accessible under settings paths:

#### Default Selection

| Parameter | Purpose | Configuration Path | Default Behavior |
| :--- | :--- | :--- | :--- |
| **Default Branch** | Sets the fallback operating branch for all new carts. | `Settings > Default Selection` | Auto-fills branch-specific company codes, currency, and tax rules. |
| **Default Location** | Sets the fallback stock store or warehouse location. | `Settings > Default Selection` | Auto-populates the Location selector for lines and inventory. |

#### Field Settings

| Parameter | Purpose | Configuration Path | Default/Conditional Behavior |
| :--- | :--- | :--- | :--- |
| **Mandatory Reason Field** | Enforce input for document void/rejection actions. | `Settings > Field Settings` | Restricts cashiers from voiding or discarding carts without entering a reason. |

#### Printables

| Parameter | Purpose | Configuration Path | Default Behavior |
| :--- | :--- | :--- | :--- |
| **Layout Templates** | Manage printable templates (PDF) for cash bills and receipts. | `Settings > Printables` | Sets the default layout and formatting used when printing documents. |

#### Webhooks

| Parameter | Purpose | Configuration Path | Default Behavior |
| :--- | :--- | :--- | :--- |
| **Integration Webhooks** | Define URL endpoints to receive JSON transaction payloads. | `Settings > Webhook` | Triggers HTTP POST requests when shopping carts are created, saved, or finalized. |

#### Feature Visibility

| Toggle Parameter | Purpose | Configuration Path | Default/Conditional Behavior |
| :--- | :--- | :--- | :--- |
| **SHOW_DOCUMENT_DELETE_BUTTON** | Exposes the delete action for cart drafts. | `Settings > Feature Visibility` | Displays the **Delete** button at the bottom of active drafts. |
| **HIDE_DOC_NO_TENANT** / **HIDE_DOC_NO_COMPANY** / **HIDE_DOC_NO_BRANCH** | Suppress system-level document number fields. | `Settings > Feature Visibility` | Hides specific internal tracking numbers from the header. |
| **HIDE_QTY_BASE** / **HIDE_QTY_UOM** | Simplify quantity inputs in line items. | `Settings > Feature Visibility` | Hides base unit or UOM-specific quantity inputs in item configuration. |
| **HIDE_UNIT_DISCOUNT** | Suppress discount inputs. | `Settings > Feature Visibility` | Hides the Unit Discount input in item settings and grids. |
| **HIDE_TAX_CONFIG_SELECTION** | Prevent manual tax code overrides. | `Settings > Feature Visibility` | Hides the tax code dropdown, applying default tax rules automatically. |
| **DISALLOW_SELL_BELOW_MIN_PRICE** | Enforce pricing floor controls. | `Settings > Feature Visibility` | Blocks saving or finalizing if a line item's price is set below the allowed minimum. |
| **LOCK_PURCHASER_TO_CURRENT_USER** | Lock the responsible sales agent. | `Settings > Feature Visibility` | Disables the Sales Agent dropdown, locking it to the logged-in cashier. |

#### Permissions Settings

| Security Config | Purpose | Configuration Path | Default/Conditional Behavior |
| :--- | :--- | :--- | :--- |
| **Permission Set Listing** | Define and manage security permission sets. | `Settings > Permission Set Listing` | Enforces permissions rules for user groups. |
| **User / Role Permissions** | Map security sets to specific personnel or roles. | `Settings > User/Team/Role Permissions` | Controls which departments can create, edit, finalize, or delete carts. |

---

## Personalization

Personal configurations reside under personalization paths:

| Configuration Parameter | Purpose | Personalization Path | System Impact |
| :--- | :--- | :--- | :--- |
| **Default Branch / Location** | Set user-level branch and warehouse overrides. | `Personalization > Personal Default Selection` | Pre-populates fields on new carts, overriding the global applet defaults. |
| **Default Toggle Column** | Choose layout width for listing grids. | `Personalization > Personal Default Selection` | Sets the grid list layout to single-column (`SINGLE`) or double-column (`DOUBLE`). |
| **Default Tab Orientation** | Choose form navigation layout. | `Personalization > Personal Default Selection` | Toggles between horizontal tabs (`HORIZONTAL`) or vertical expansion panels (`VERTICAL`). |
| **Sidebar Layout** | Customize user-specific sidebar links. | `Personalization > Sidebar` | Toggles showing or hiding menu links in the personal sidebar navigation. |

---

## Audit

#### Audit Trail (`Settings > Applet Log`)
A comprehensive log of every action taken within the Shopping Cart Applet.

**What You Can See:**
- **Table Name**: Database table affected (e.g., `bl_fi_generic_doc_hdr`).
- **Action**: CREATE, UPDATE, DELETE, FINALISE, VOID.
- **Action Date**: Timestamp of the change.
- **Description**: Detailed before/after values.
- **Status**: Record status.

---

## FAQ

**Q: Can I edit a shopping cart once it is finalized?**  
A: No. Clicking **FINAL** sets the posting status to `FINAL` and generates a **Sales Order (SO)**, locking the document from further edits, line additions, or deletions.

**Q: What is the difference between finalizing a cart and converting it?**  
A: Finalizing a cart (clicking **FINAL**) sets its status to `FINAL`, locks it as a read-only document, and generates a **Sales Order (SO)**. Converting a cart (under the **Convert** tab) creates a separate, posted **Internal Receipt Voucher (IRV)** to record the cash sale, and automatically deletes the original draft shopping cart to keep the active queue clean and prevent duplicate records.

**Q: Can I delete a shopping cart?**  
A: Yes, draft shopping carts can be deleted by clicking the **DELETE** button at the bottom of the workspace and then clicking **CLICK AGAIN TO CONFIRM** to prevent accidental loss. Note that this action is only available for drafts and requires the **SHOW_DOCUMENT_DELETE_BUTTON** parameter to be enabled in settings.

**Q: Why are the Billing and Shipping address picker buttons disabled?**  
A: Address pickers are disabled until you select an **Entity ID** in the Entity Details sub-tab. Addresses must be linked to a valid customer profile.

**Q: How does the system compute outstanding balances?**  
A: The outstanding balance is computed in real time as the total line items' net transaction amount minus the sum of all recorded payments under the Payment tab.

**Q: Why does my screen show expansion panels instead of horizontal tabs?**  
A: The applet uses a responsive design. If your screen width is 768px or smaller (mobile view), it automatically switches to vertical expansion panels. You can override this preference under `Personalization > Personal Default Selection > Default Tab Orientation`.

---

## Glossary

- **Entity ID**: The unique record locator for a customer or corporate account in the system.
- **Posting Status**: The lifecycle state of a cart (`DRAFT` means editable; `FINAL` means committed/locked; `VOID` means canceled).
- **Split Payment**: Recording multiple separate payments using different settlement methods against a single shopping cart order.
- **Settlement Method**: The payment medium (Cash, Card, Points, Cheque, Bank Transfer, Voucher) used to resolve transaction debt.
- **UOM (Unit of Measure)**: The standard unit packaging (e.g. Piece, Box, Carton) assigned to a line item.
