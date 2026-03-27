---
title: "Asset Register Applet"
description: "Track, register, and manage your company's physical and intangible assets — from acquisition to disposal — with automated depreciation and full audit history."
tags:
- asset-management
- asset-register
- depreciation
- fixed-assets
- finance
weight: 125
---

## Purpose and Overview

The **Asset Register Applet** is your company's single source of truth for all physical and intangible assets. It lets you register assets, track where they are, record what they cost, and automatically calculate how much value they lose over time (depreciation).

Whether you have 10 laptops or 10,000 pieces of equipment, this applet keeps everything organised and audit-ready.

{{< callout type="info" >}}
**In plain English:** An "asset" is anything valuable your company owns — a laptop, a vehicle, a machine, a software licence. This applet helps you track all of them in one place, from the day you buy them to the day you retire them.
{{< /callout >}}

### Who Benefits from This Applet?

**Finance & Accounting Teams:**
- Stop maintaining asset schedules in spreadsheets
- Automatically calculate monthly depreciation for every asset
- Get accurate asset values for balance sheet reporting
- Track gains and losses when assets are sold or disposed

**Operations & Facility Managers:**
- Know exactly where every asset is — which branch, which room
- See who is responsible for each asset (the custodian)
- Use your phone camera to scan barcodes and serial numbers
- Keep photos, invoices, and warranty documents attached to each asset

**IT Departments:**
- Track all devices with serial numbers and warranty expiry dates
- Bulk import existing asset lists via Excel
- Assign assets to specific employees

**Auditors & Compliance:**
- Full history of every transaction on every asset
- Clear depreciation schedules with GL account mapping
- Export-ready reports filtered by company, branch, or category

---

### What Problems Does This Solve?

**Before this applet**, most companies struggle with:
- Asset lists spread across multiple Excel files owned by different people
- No clear status — is this asset still in use? Has it been disposed?
- Manual depreciation calculations done once a year (if at all)
- No record of who has what asset, or where it was moved
- Missing audit trail when auditors ask "where did this asset go?"

**With this applet**, you get:
- **One registry** for all assets, with clear statuses (Draft → Registered → Disposed)
- **Automated depreciation** — run it in one click each month
- **Asset history** — every acquisition, adjustment, and disposal is logged
- **Location & custody tracking** — always know where an asset is and who owns it
- **Bulk import** — migrate your existing Excel data in minutes

---

## Key Features Overview

{{< cards >}}
  {{< card title="Asset Register" subtitle="The main list of all your company's assets with full detail view" link="#asset-register" >}}
  {{< card title="Asset Category" subtitle="Organise assets into groups like IT Equipment, Vehicles, Furniture" link="#asset-category" >}}
  {{< card title="Depreciation Run" subtitle="Process monthly depreciation for all eligible assets in one batch" link="#depreciation-run" >}}
  {{< card title="Transactions" subtitle="Record acquisitions, adjustments, and disposals per asset" link="#transactions" >}}
  {{< card title="File Import" subtitle="Bulk upload your existing asset registry via Excel" link="#file-import" >}}
  {{< card title="Settings & Configuration" subtitle="Set defaults, permissions, and feature visibility" link="#configuration--settings" >}}
{{< /cards >}}

{{< figure src="/images/asset-register-applet/asset-register-applet-overview.png" alt="Asset Register Applet Overview — track every asset from purchase to disposal" caption="From spreadsheet chaos to a single organised registry — register assets, track depreciation, and maintain a full audit trail." >}}

---

## Quick Start Guide

### Operations Staff: Register a New Asset

**Goal:** Add a new asset to the registry.

1. Go to **Asset Register** → click **"+"**
2. Fill in the key details:
   - **Asset Name** (e.g., "Dell Laptop 2024")
   - **Asset Type** — choose from Equipment, Investment, or Intangible
   - **Category** — e.g., "IT Equipment"
   - **Branch** and **Location** — where is it physically?
3. Optionally add: Serial Number (tap the barcode icon to scan), Warranty Expiry, Employee/PIC
4. Click **CREATE** — the system auto-generates an Asset Code
5. The asset is now in **DRAFT** status — update to **REGISTERED** once it's commissioned

**Pro Tip:** Attach a photo of the asset and a copy of the purchase invoice right away — saves time during audits later.

---

### Finance: Record an Asset Acquisition

**Goal:** Log the purchase cost of a newly registered asset.

1. Open the asset from the **Asset Register** listing
2. Go to the **Transactions** tab → click **"+"**
3. Select type: **Acquisition**
4. Enter:
   - **Purchase Date** — when it was bought
   - **Purchase Price** — the cost
   - **GL Code** — the offsetting account (e.g., Accounts Payable)
5. Save — the system creates a balanced journal entry automatically

---

### Finance: Run Monthly Depreciation

**Goal:** Calculate and post depreciation for all assets in one batch.

1. Go to **Depreciation Run** → click **"+"**
2. Select:
   - **Company** (required)
   - **Branch** (optional — leave blank to process all branches)
   - **Month/Year** — the period you're processing
3. Click **CREATE** — the system calculates depreciation for all registered assets and posts the journal entries

{{< callout type="tip" >}}
**Run this once per month**, typically at month-end or during your financial close. Assets need to be in **REGISTERED** status and have a depreciation method configured to be included.
{{< /callout >}}

---

### Admin: First-Time Setup

**Goal:** Prepare the system before other teams start adding assets.

1. **Create Asset Categories** — go to **Asset Category** and create groups like "IT Equipment", "Office Furniture", "Vehicles"
2. **Set Defaults** — go to **Settings → Default Selection** to pre-fill Branch and Location for all users
3. **Set Permissions** — go to **Settings → Permission Set** to control who can create, edit, or dispose assets
4. **Control Visibility** — go to **Settings → Feature Visibility** to show/hide features based on your needs

---

## Features in Detail

### Asset Register

This is the main workspace — a searchable list of every asset your company owns.

**What you see per asset:**

| Field | Description |
|---|---|
| **Asset Code** | Unique ID auto-generated or manually entered (e.g., `FA-001`) |
| **Asset Name** | Descriptive name (e.g., "Dell Latitude 7440") |
| **Category** | The group this asset belongs to |
| **Status** | DRAFT, REGISTERED, or DISPOSED |
| **Branch / Location** | Where the asset is physically located |
| **Serial Number** | Can be scanned using the barcode button |

**Inside each asset record, you have tabs:**

| Tab | What's in it |
|---|---|
| **Details** | All the basic info — name, code, type, category, location, custodian |
| **Transactions** | Every financial event — acquisitions, adjustments, disposals |
| **Depreciation** | Depreciation method, rate, useful life, residual value, GL accounts |
| **Attachment** | Photos, invoices, warranties, any supporting documents |
| **Related Doc** | Links to related purchase documents |
| **Other Journal** | Any manual journal entries linked to this asset |

---

### Asset Category

Categories are how you group assets — like folders. Examples: IT Equipment, Vehicles, Office Furniture, Machinery.

Each category has a **Code**, **Name**, and **Status** (Active/Inactive). Inactive categories won't appear in the asset creation form.

**Why it matters:** Categories drive reporting. You can filter asset reports, depreciation schedules, and valuations by category.

---

### Depreciation Run

Depreciation is how the system accounts for the gradual loss in value of your assets over time. Instead of calculating this manually for each asset, you run it in one batch.

**How it works:**

1. Each asset has a depreciation configuration — the method, rate, and useful life
2. Every month, you create a Depreciation Run for a specific period
3. The system calculates the depreciation amount per asset and posts journal entries automatically

**Supported depreciation methods:**

| Method | What it means | Best for |
|---|---|---|
| **Straight Line** | Same amount every period | Most assets (laptops, furniture) |
| **Declining Balance** | Higher in early years, lower later | Assets that lose value faster when new |
| **Double Declining Balance** | Accelerated version of declining balance | High-wear equipment |
| **No Depreciation** | Asset doesn't depreciate | Land, certain investments |

---

### Transactions

Every financial event on an asset is recorded as a transaction:

| Transaction Type | When to use it |
|---|---|
| **Acquisition** | When you purchase and register the asset |
| **Adjustment** | When the asset value changes (e.g., improvement or revaluation) |
| **Disposal** | When the asset is sold, scrapped, or written off — this moves the asset to DISPOSED status |

Each transaction automatically creates a journal entry, debiting and crediting the appropriate GL accounts.

---

### File Import

Already have an asset list in Excel? Import it directly.

1. Go to **File Import** from the sidebar
2. Download the import template
3. Fill it in with your existing asset data
4. Upload the file — the system creates all the asset records at once

This is the fastest way to get started if you're migrating from spreadsheets.

---

## The Asset Lifecycle

Assets move through three statuses:

```
DRAFT  →  REGISTERED  →  DISPOSED
```

| Status | What it means | Next step |
|---|---|---|
| **DRAFT** | Just created, not yet in service | Complete the details, add acquisition transaction, change to REGISTERED |
| **REGISTERED** | Active, in-use asset | Configure depreciation, track location, run monthly depreciation |
| **DISPOSED** | Removed from use | Created when a Disposal transaction is added |

---

## Configuration & Settings

### Default Selection
Set default values for **Branch** and **Location** so users don't have to fill them in every time. You can also reorder the detail tabs (drag and drop) to match your workflow.

### Permission Set
Control who can do what — create, edit, view, or dispose assets. Permissions can be assigned by user, team, or role.

### Feature Visibility
Show or hide specific features of the applet based on your organisation's requirements.

---

## Glossary

| Term | Plain English meaning |
|---|---|
| **Fixed Asset** | A long-term physical item your company owns and uses in operations — like a machine, vehicle, or building. |
| **Asset Register** | The official list of all assets owned by the company. |
| **Depreciation** | The gradual reduction in an asset's value over time due to wear, age, or obsolescence. Think of a car losing value each year. |
| **Useful Life** | How many years an asset is expected to be in service before it needs replacing. |
| **Residual Value** | The estimated value of an asset at the end of its useful life (what you could sell it for as scrap or second-hand). |
| **Straight Line Depreciation** | A method where the asset loses the same amount of value every year. E.g., a RM 10,000 asset over 5 years = RM 2,000 per year. |
| **Declining Balance** | A method where the asset loses more value in its early years than its later years. |
| **Acquisition** | The transaction that records the purchase of an asset — the starting point of its financial life in the system. |
| **Disposal** | The transaction that records the retirement of an asset — when it's sold, scrapped, or written off. |
| **GL Code / GL Account** | A General Ledger account number used in your accounting system. Depreciation expense and asset values are posted to specific GL codes. |
| **Custodian** | The person or team responsible for a particular asset. |
| **Asset Category** | A grouping label for assets of the same type (e.g., IT Equipment, Vehicles, Office Furniture). |
| **Depreciation Run** | A batch process that calculates and records depreciation for all eligible assets in one go for a given period. |

---

## FAQ

### 1. What's the difference between DRAFT and REGISTERED?

**DRAFT** means the asset record has been created but the asset isn't officially in service yet. You might be waiting to receive it, or still filling in the details. **REGISTERED** means it's active and in use — depreciation will be calculated for it.

---

### 2. Can I change the depreciation method after an asset is registered?

Yes, you can update the depreciation configuration on an asset. However, changes only affect future depreciation runs — past periods already processed won't be recalculated.

---

### 3. What happens when I run depreciation for the same period twice?

The system will warn you. You should not process depreciation for the same company, branch, and period more than once. If you need to re-run, you would need to reverse or delete the previous run first.

---

### 4. How do I handle an asset that was sold?

Create a **Disposal** transaction on the asset. Enter the disposal date and sale amount (if any). The system will calculate any gain or loss, post the journal entries, and automatically move the asset to **DISPOSED** status.

---

### 5. My existing assets are in a spreadsheet. How do I get them into the system?

Use **File Import**. Download the import template from the sidebar, fill in your data following the column format, and upload. All assets will be created in one batch.

---

### 6. What is a "custodian" and do I need to assign one?

A custodian is the employee or person responsible for looking after the asset. It's optional but recommended — it makes it easy to track who has what, especially for IT equipment and company vehicles.
