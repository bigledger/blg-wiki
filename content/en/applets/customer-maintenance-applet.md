---
title: "Customer Maintenance Applet"
description: "Centralized master data management for B2B and B2C customer profiles, credit controls, multiple addresses, and contact hierarchies"
tags:
- customer-management
- CRM
- master-data
- credit-control
- b2b-sales
---

## Purpose and Overview

The **Customer Maintenance Applet** is the foundation of your revenue operations. It is not just a digital address book; it is the **Master Data Repository** that feeds critical rules into the Sales, Finance, and Point of Sale (POS) modules.

How you configure a customer here dictates how the entire ERP system interacts with them. If you set a 30-day payment term here, the system will automatically block Sales Reps from issuing new orders to that customer on day 31 if they haven't paid.

{{< callout type="tip" >}}
**Core Concept: Master Data vs. Transactional Data**
In this applet, you are managing **Master Data** (the enduring rules: who the customer is, where they live, what their credit limit is). You do not manage **Transactional Data** here (you don't view their specific invoices or sales orders here; you do that in the respective Finance/Sales applets).
{{< /callout >}}

### Who Benefits from This Applet?

| Role | How they use it |
|------|-----------------|
| **Sales Admins** | Creating new customer profiles so reps can start quoting them. |
| **Finance Controllers** | Setting and enforcing Credit Limits and Payment Terms to prevent bad debt. |
| **Logistics/Delivery** | Extracting accurate warehouse shipping addresses for B2B clients with multiple branches. |

---

## What Problems Does This Solve?

**Without Customer Maintenance Master Data:**
- Sales reps sell RM 50,000 worth of goods to a customer who already owes the company RM 100,000, creating massive bad debt risk.
- Delivery drivers show up at a corporate HQ instead of the actual warehouse because the system only holds one address per company.
- Finance teams spend days manually calculating due dates for invoices.

**With Customer Maintenance Applet:**
- ✓ **Automated Credit Control** - The system hard-stops new sales orders if a customer exceeds their defined credit limit.
- ✓ **Multi-Address Architecture** - Store an unlimited number of specialized addresses (Billing, Shipping HQ, Drop-ship locations) under one parent company.
- ✓ **Automated Payment Terms** - Set terms (e.g., Net 30) once, and the system automatically calculates all future invoice due dates.

---

## Role-Based Quick Start Guides

### For Sales Admins: Onboarding a Simple B2C Customer
Your goal is to quickly add a retail walk-in customer so the cashier can issue a receipt under their name.

1. Go to **Customer Maintenance** and click **"+"** to create a new profile.
2. In the **Main Details** tab, select `Type: Individual`.
3. Fill in the **Name** and **Phone Number**.
4. Skip the complex tabs.
5. Click **Create**. The customer is instantly available in the POS system.

### For Finance: Onboarding a Complex B2B Enterprise Client
Your goal is to onboard a new corporate client ("MegaCorp Inc.") while protecting company cash flow.

**Step 1: The Corporate Identity**
1. Click **"+"**. Select `Type: Corporate`.
2. Enter the Legal Company Name (*MegaCorp Inc.*) and their Business Registration Number (BRN) for tax compliance.

**Step 2: The Credit Sandbox**
1. Switch to the **Credit Information** tab.
2. Ensure `Credit Term` is set to `Net 30 Days` (meaning they have 30 days to pay after receiving an invoice).
3. Set the `Credit Limit` to `RM 50,000`. If they try to buy RM 50,001 worth of goods without paying their outstanding bills, the system will block the sale.

**Step 3: The Multi-Address Setup**
1. Switch to the **Addresses** tab.
2. Add Address 1: *Corporate HQ* (Set Address Type to `Billing`).
3. Add Address 2: *Port Klang Warehouse* (Set Address Type to `Shipping`).
4. Save the profile. Now, when a Sales Rep creates a Delivery Order, the system will automatically route the trucks to the warehouse, but mail the invoice to HQ.

---

## Deep-Dive: The Profile Configuration Tabs

A B2B customer profile contains multiple tabs representing the complex structure of a modern business relationship.

### 1. Main Details Tab
The foundational identity.
- **Customer Code:** The unique system ID (e.g., `CUST-1002`). This is how the database links all their invoices together.
- **BRN / Tax ID:** Critical for E-Invoicing and statutory reporting.
- **Salesperson:** You can permanently link a specific Sales Rep to this customer. All future commissions for this customer will default to this rep.

### 2. Credit Information Tab
The financial guardrails.
- **Credit Limit:** The maximum allowable unpaid debt. 
- **Payment Terms:** Dictates cash flow rules (Cash on Delivery, 7 Days, 30 Days, 60 Days).
- **Credit Block Toggle:** A manual override switch. If Finance discovers a customer is going bankrupt, they can flip this switch to instantly freeze all ongoing orders.

### 3. Addresses Tab (The Multi-Location Architecture)
A major enterprise rarely has just one door.
- You can store **Infinite Addresses** within a single Customer Profile.
- **Address Types:** You must classify each address. Is it a *Retail Storefront*? A *Loading Dock*? A *Billing Office*? This categorization ensures the right documents go to the right physical locations.

### 4. Contacts Tab (The Organizational Chart)
A company doesn't buy things; the *people* inside the company buy things.
- Add specific individuals (e.g., *John Doe - Procurement Manager*, *Jane Smith - Accounts Payable*).
- Tag them with roles so your team knows who to email for sales pitches vs. who to email when a bill is late.

### 5. Classification / Attributes Tab
Custom metadata for marketing and reporting.
- Group customers by **Industry** (e.g., *Healthcare*, *Manufacturing*).
- Group by **Tier** (e.g., *Gold*, *Silver*, *Bronze*).
- Reports can later be run by these attributes (e.g., *"Show me all Q3 revenue from the Healthcare sector"*).

---

## Applet Configuration (For Admins)

Navigate to **Settings** to customize how customer data is captured.

### Application Settings
- **`AUTO_GENERATE_CUSTOMER_CODE`**: If enabled, the system automatically assigns `CUS-0001`, `CUS-0002`. If disabled, you must manually type a custom code for every new client.
- **`ENFORCE_UNIQUE_TAX_ID`**: Highly recommended to turn this ON. This prevents a Sales Rep from accidentally creating a duplicate profile for a company that already exists in the system by checking the BRN.

### Field Settings (Mandatory Controls)
Data hygiene is critical for Master Data.
- You can force specific fields to be mandatory before a user can click "Save."
- **Best Practice:** Make *Email*, *Phone*, and *Industry Classification* mandatory to ensure your marketing database remains high quality.

### Classification Matrix
You define the labels your team uses.
- Instead of letting sales reps type whatever they want into the "Industry" field, you pre-define the dropdown list in the settings (e.g., *Tech*, *Retail*, *F&B*).

---

## Common Real-World Scenarios

### Scenario 1: The "Credit Hold" Intervention
**The Situation:** Sales Rep Ben promises rapid delivery of 100 laptops to "Startup XYZ". When he hits 'Confirm', the system turns red and blocks the order. Ben calls Finance angrily.
**The Workflow:**
1. Finance opens the Customer Maintenance applet and searches for "Startup XYZ".
2. They check the **Credit Information** tab.
3. The Limit is RM 20,000. 
4. The system calculates they currently have RM 15,000 in unpaid invoices from last month. Ben's new laptop order is RM 10,000.
5. `15,000 + 10,000 = 25,000`. This exceeds the limit.
6. Finance tells Ben: "Tell the customer they must pay last month's bill before we ship these new laptops." The system protected the company from bad debt.

### Scenario 2: The Multi-Branch Retail Chain
**The Situation:** You just signed a deal to supply coffee beans to a café chain that has 1 HQ and 4 separate coffee shop locations.
**The Workflow:**
1. You create ONE Customer Profile for the parent company.
2. In the **Addresses** tab, you add 5 entries.
3. Address 1: HQ (Type: Billing).
4. Address 2-5: The 4 specific cafes (Type: Shipping).
5. When your reps take coffee orders, they select the Parent Company, but the system prompts them to pick *which* specific cafe the delivery truck needs to go to.

### Scenario 3: Bulk E-Invoice Updates
**The Situation:** The government rolls out new E-Invoicing requirements, mandating that every existing corporate customer must now have their Tax ID recorded. Your legacy data is missing this field.
**The Workflow:**
1. Go to **Customer Maintenance Listing**.
2. Click **Export** to download the database into Excel.
3. Finance manually updates the Excel sheet with all the missing Tax IDs.
4. Go to **Import Customers**.
5. Upload the Excel sheet. The system updates all 5,000 profiles simultaneously without creating duplicates.

---

## FAQs

**Q: If I delete a customer, do their past sales orders disappear?**
A: Due to accounting integrity rules, you **cannot** delete a customer who has transactional history (invoices, sales orders) tied to their profile. Instead, you change their **Status** to *Inactive*. This preserves the historical financial data but hides them from active dropdown menus.

**Q: Can a customer have multiple currencies?**
A: A customer profile is usually tied to a single base currency for accounting ledger purposes. Consult your specific finance setup if you deal with cross-border subsidiaries.

**Q: How do I merge duplicate customer profiles?**
A: If "MegaCorp" and "Mega Corp Inc" were accidentally created as two separate profiles, you cannot merge them if both have transactional history. The standard operational procedure is to mark one as *Inactive* and use the other moving forward. (This is why the `ENFORCE_UNIQUE_TAX_ID` setting is so important).