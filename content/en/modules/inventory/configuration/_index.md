---
aliases:
- /modules-v2/inventory/configuration/
title: "Configuration"
description: "Step-by-step implementation workflow for configuring the Inventory Module."
weight: 30
bookCollapseSection: false
---

Configuring the Inventory Module follows a strict 5-phase dependency chain. Master data foundations and item SKUs must be set up before warehouse storage structures or stock movement rules are enabled.

## Configuration Dependency Chain

> [!WARNING]
> Item SKUs and units of measure (UOM) must exist in Core **before** establishing warehouse bin locations or uploading opening balances. Always complete setup phases in order.

---

## Phase 1: Master Foundations

**What you are doing:** Verifying item master SKUs, product categories, purchasing units of measure (UOM), and valuation methods.

| Setup Task | Required Applet |
|------------|-----------------|
| Branch & Store Location Setup | [Organisation Applet](/applets/master-data/organisation-applet/) |
| Item Master SKUs & Purchasing UOMs | [Doc Item Maintenance Applet](/applets/master-data/doc-item-maintenance-applet/) |
| Inventory Item Attributes & Categories | [Inventory Item Maintenance Applet](/applets/master-data/inv-item-maintenance-applet/) |

---

## Phase 2: Warehouse Structure

**What you are doing:** Defining physical warehouses, store outlets, staging areas, and bin storage locations.

| Setup Task | Required Applet |
|------------|-----------------|
| Warehouse & Outlet Definition | [Organisation Applet](/applets/master-data/organisation-applet/) |
| Aisle, Shelf & Bin Storage Locations | [Warehouse Management Applet](/applets/inventory-workflow/warehouse-management-applet/) |

---

## Phase 3: Stock Movement Controls

**What you are doing:** Establishing the rules and reason codes for inter-warehouse transfers, stock adjustments, and physical stock takes. None of these three documents has an approval engine — control them with permissions. Only Stock Requisition can carry approvals, and only optionally ([Document Approvals](/guides/document-approvals/)).

| Setup Task | Required Applet |
|------------|-----------------|
| Inter-Warehouse Stock Transfer Rules | [Stock Transfer Applet](/applets/inventory-workflow/stock-transfer-applet/) |
| Stock Write-Off & Adjustment Reason Codes | [Stock Adjustment Applet](/applets/inventory-workflow/stock-adjustment-applet/) |
| Physical Cycle Count Audits | [Stock Take Applet](/applets/inventory-workflow/stock-take-applet/) |

---

## Phase 4: Valuation & GL Mapping

**What you are doing:** Mapping perpetual inventory asset GL accounts, Cost of Goods Sold (COGS), and inventory variance GLs.

| Setup Task | Required Applet |
|------------|-----------------|
| Inventory Asset GL Mapping | Financial Accounting Configuration |
| COGS & Inventory Variance Accounts | Financial Accounting Configuration |

---

## Phase 5: Test & Validate (Smoke Test)

Before going live, complete these mandatory verification tests:

- [ ] **Stock Transfer Test:** Execute an inter-branch stock transfer and confirm source stock decreases while target stock increases.
- [ ] **Stock Take Test:** Perform a simulated physical stock audit and verify variance write-offs post accurately to GL asset accounts.
- [ ] **Stock Availability Test:** Check real-time stock balances in [Stock Availability Applet](/applets/inventory-workflow/stock-availability-applet/) to verify reserved vs. available quantities.
