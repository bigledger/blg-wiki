---
title: "POS General Applet"
description: "A simple guide for managing sales and store operations at the checkout counter"
tags:
- pos-module
- point-of-sale
- retail
- store-management
- cashier-tools
- system-setup
weight: 200
---

## Purpose and Overview

The **BigLedger POS General Applet** is a fast and easy-to-use tool designed for managing sales at the store counter. It helps you process customer orders quickly while keeping your records accurate across all your store locations. Managers can easily see and control all activities from one place, ensuring everything follows company rules and financial standards.

### Who Benefits from This Applet?

**Cashiers & Front-line Staff:**
- Fast and easy interface for busy hours
- Simple ways to manage your sales and cash flow
- Instant view of available stock and item details

**Store Managers & Supervisors:**
- Real-time view of all sales activities
- Tools to reprint receipts or fix simple mistakes
- Easy ways to check daily totals and cash records

**Finance & IT Administrators:**
- Sales records automatically update your accounts
- Easy control over payment methods and staff access
- Secure and permanent history for tax and audit purposes

**Business Owners & Executives:**
- A single view of how all your stores are performing
- Reduced risk of cash errors or fraud
- Clear information to help make better business decisions

### What Problems Does This Solve?

**The "Disconnected Data" Problem:**

Traditional sales systems often keep records only at the counter, which leads to:
- Mismatches between store records and the main office
- Trouble knowing exactly how much stock you have
- Waiting a long time for sales reports

**The BigLedger POS Solution:**

- **Instant Updates** - Every sale is updated across your entire business immediately
- **Manage Everything in One Place** - Control all your stores and counters from a single screen
- **Automatic Bookkeeping** - Sales go directly into your accounts, preventing manual errors
- **Secure Records** - Strict rules and automatic timestamps keep your records safe and honest

{{< callout type="info" >}}
**Core Concept:** The POS applet is where you record sales at the counter. These records automatically flow into your main accounts (Cashbook) to keep your finances accurate.
{{< /callout >}}

## Video Tutorial

For a visual walkthrough of the POS General Applet, watch the video below:

<div style="max-width:560px; margin:24px auto;">
  <div style="position:relative; padding-bottom:56.25%; height:0; overflow:hidden;">
    <iframe
      src="https://www.youtube.com/embed/Gf6gXUfHebE"
      style="position:absolute; top:0; left:0; width:100%; height:100%;"
      frameborder="0"
      allowfullscreen>
    </iframe>
  </div>
</div>

## Key Features Overview

{{< cards >}}
  {{< card title="Access Rules" subtitle="Control who can perform specific tasks" link="#for-admins-setting-up-the-system" >}}
  {{< card title="System Settings" subtitle="Set up your store and staff defaults" link="#for-admins-setting-up-the-system" >}}
  {{< card title="Payment Methods" subtitle="Manage cash, cards, and e-wallets" link="#for-admins-setting-up-the-system" >}}
  {{< card title="Sales Controls" subtitle="Manage cash drawers and stock" link="#for-staff-cashier-daily-workflow" >}}
  {{< card title="Reporting Tools" subtitle="Simple tools to track sales and history" link="#sales-reports-and-history" >}}
{{< /cards >}}

{{< figure src="/images/pos-general-applet/pos-overview-infographic.png" alt="From Scattered Sales to Centralized Control: Your Guide to the POS General Applet" caption="From Scattered Sales to Centralized Control: The Old Way (unconnected counters, manual records, risk of errors) vs The New Way (secure access, automatic updates, permanent records)." >}}

## Key Concepts

### Understanding how POS works

Every sales system needs to track three basic things. The BigLedger POS makes this simple:

| Question | Component | Example |
|--------|-----------|------------------|
| **Where** is the sale? | Store / Counter | Main Branch, Counter 1 |
| **Who** is selling? | Staff (Cashier) | Jane Smith (Staff ID 102) |
| **How** is it paid? | Payment Method | Credit Card, Cash, GrabPay |

{{< callout type="tip" >}}
**Real-World Example**: A customer buys a bag. The staff member (WHO) rings it up at Counter 1 (WHERE). The customer pays by Credit Card (HOW). The system records this exactly so you can check your totals at the end of the day.
{{< /callout >}}

### How the System is Organized

Think of your store operations as a simple flow:

```
Company
│
├── Store / Counter ──→ WHERE does the sale happen?
│   │
│   └── Staff member ──→ WHO is making the sale?
│       │
│       └── Sales ──→ WHAT is being sold?
│
└── Accounting ──→ WHERE is the money recorded?
    │
    └── Payment Methods ──→ HOW is the customer paying?
```

**Steps in the Flow:**
1. **Company**: Your overall business rules
2. **Store**: The settings for each physical location
3. **Staff**: Tracking who is responsible for each sale
4. **Sales**: The actual items sold
5. **Accounting**: The final place where all money is tracked

---


## Quick Start Guide

### For Staff: Cashier Daily Workflow

**Goal:** Open your counter and start selling in simple steps.

1. **Open the Applet:** Navigate to the **POS General Applet** from the main dashboard of your BigLedger account.
{{< figure src="/images/pos-general-applet/login pos general.png" alt="Opening POS General Applet" caption="Navigate to the POS General Applet from your main account page." >}}

2. **Set your Defaults:** Go to **Default Selection** to ensure the correct Store and Staff name are selected. This usually only needs to be done the first time you use the system.
{{< figure src="/images/pos-general-applet/personalization-default setting.png" alt="Setting Defaults" caption="Configure your default store and staff settings." >}}

3. **Make Sales:** Follow the detailed process below to record transactions and accept payments.

---

### Detailed Guide: Making a Sale

Follow these steps to process a customer transaction from start to finish.

#### Step 1: Create a New Cash Bill
Click the **"New"** or **"Add"** button to start a fresh transaction.
{{< figure src="/images/pos-general-applet/create cashbiil.png" alt="Create Cash Bill" caption="Initiate a new cash bill transaction." >}}

#### Step 2: Select or Change Customer
By default, the system selects your primary "Default Customer". If you need to record the sale for a specific customer:
- Click the **Customer** button.
- Click on the **Entity ID** field to search.
{{< figure src="/images/pos-general-applet/change customer.png" alt="Change Customer" caption="Click the Entity ID field to search for a specific customer." >}}

- Search for the customer and select them from the list.
{{< figure src="/images/pos-general-applet/select customer.png" alt="Select Customer" caption="Search and select the correct customer record." >}}

#### Step 3: Add Items to the Sale
You can add products in two ways:
- **Scan:** Use your barcode scanner directly in the search box.
- **Manual:** Click the **Add** button to manually select items.
{{< figure src="/images/pos-general-applet/add item or scane code.png" alt="Add Item" caption="Scan barcodes or click 'Add' for manual selection." >}}

For manual selection, search for the item name or code and click to select it.
{{< figure src="/images/pos-general-applet/search item and select item.png" alt="Search Item" caption="Search and select items from your inventory." >}}

#### Step 4: Adjust Quantity and Price
Once an item is added, you can edit the **Quantity** or **Price** (if you have the necessary permissions).
{{< figure src="/images/pos-general-applet/edit qty and edit price.png" alt="Edit Qty/Price" caption="Adjust the quantity and price as needed." >}}

Continue adding items to the bill using the same method until the order is complete.
{{< figure src="/images/pos-general-applet/continue adding tje item.png" alt="Adding More Items" caption="Add multiple items to build the complete order." >}}

#### Step 5: Process Payment
When the customer is ready to pay:
- Select the relevant payment method (e.g., Cash, Card, E-Wallet) by clicking the **red payment button**.
{{< figure src="/images/pos-general-applet/payment method.png" alt="Payment Method" caption="Select the payment method used by the customer." >}}

- Enter the payment **Amount** and any other required information in the fields, then click **Add**.
{{< figure src="/images/pos-general-applet/key in relevant info.png" alt="Enter Payment Info" caption="Key in the received amount and relevant payment details." >}}

#### Step 6: Finalize the Sale
Review the transaction one last time. Once confirmed, click the **Final** button to complete the sale and update your records.
{{< figure src="/images/pos-general-applet/ready for final.png" alt="Finalize Sale" caption="Click 'Final' to complete the transaction and update stock/accounting." >}}

**What happens next?** Your sales are instantly recorded in the main accounts and stock levels are updated.

---

### For Managers: Supporting the Team

**Goal:** Help staff and make sure sales records are correct.

1. **Check Sales:** Use the **Cash Bill Listing** to see all recent sales.
2. **Reprint Receipts:** If a customer needs another copy of a receipt, you can reprint it here.
3. **Fix Serial Numbers:** If the wrong serial number was scanned, use the **Swap Serial Number** tool to fix it easily.
4. **View Collections:** Check the **Cashier Collection** tool to see how much money has been collected by each payment method.

**Need to check from home?** You can see all store activity in real-time from any device with manager access.

---

### For Admins: Setting up the System

**Goal:** Link your store to your main accounting in 4 steps.

1. **Create Accounts:** Define your "Money Vaults" (like Petty Cash or Bank Accounts) in the Cashbook Applet.
2. **Add Payment Methods:** Create options like "Credit Card" or "E-Wallet" and link them to the right account.
3. **Link to Stores:** Use the **Settlement Method Setting** to choose which payment methods are available at each store location. (Look for the "Red Color" warning if something is missing!)
4. **Set Access Rules:** Choose who can use special features like "Change Date" or "View Profit" to keep your records safe.

**Ongoing:** Check your **Z Report** settings to make sure your daily summaries show all the information you need.

## Sales Reports and History

The BigLedger POS provides simple tools to help you track your sales and check your records at the end of the day.

* **Detailed Sales Records:** Use the **Cash Bill Listing** to see every sale made. You can filter by date, store, or status to find exactly what you need.
* **Breakdown of Payments:** The **Cashier Collection** tool shows you a list of all payments received. You can group them by payment type (like Cash or Card) to see how much you collected for each.
* **Daily Sales Summary (Z-Report):** This is your end-of-day report. It shows total sales, any rounding, canceled orders, and a summary of all collections.

{{< callout type="info" >}}
**How to check your cash:**
The Z-Report is the best way to double-check your physical cash and card slips against the system. You can export it to PDF and send it to your finance team for their final checks.
{{< /callout >}}

{{< figure src="/images/pos-general-applet/pos-z-report-export.png" alt="Exporting the daily sales summary for records" caption="Exporting the daily sales summary for records" >}}


---

## Common Examples

### Example 1: Paying with Cash and E-Wallet
**Situation:** A customer wants to pay RM 50 in cash and the rest (RM 150) using an E-Wallet.

**Steps:**
1. Scan the items.
2. Choose **Cash** and type "50".
3. Choose **E-Wallet** for the rest.
4. The system finishes the sale.
5. **Result:** Stock is updated immediately, and the money is recorded in the right place.

---

### Example 2: Fixing a Serial Number Mistake
**Situation:** After the sale, you realize the wrong serial number was scanned for a product.

**Steps:**
1. Open the **Cash Bill Listing**.
2. Find the sale.
3. Click **Fix Serial Number** (Swap Serial).
4. Enter the correct number and save.
5. **Result:** The system fixes the stock records for both items without you having to cancel the whole sale.

---

---

---

## Other Helpful Tools

### Linked Apps
- **[Stock Management](/applets/inv-item-maintenance-applet/)** - Manage product details
- **[Customer Records](/applets/customer-maintenance-applet/)** - Manage customer information
- **[Accounting Vaults](/applets/cashbook-applet/)** - Track your money
- **[Tax Settings](/applets/tax-configuration-applet/)** - Set up sales tax

---

## Related Guides

- **Cashier Daily Tasks**
- **Store Inventory Tools**
- **Receipt Management**
- **Sales Reports**
