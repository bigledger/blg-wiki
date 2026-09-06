---
title: "Configuration"
description: "Step-by-step implementation workflow for configuring the Manufacturing Module."
weight: 30
bookCollapseSection: false
---

Configuring the Manufacturing Module follows a strict 5-phase dependency chain. Master item SKUs and work center routings must be established before multi-level Bills of Materials (BOM) or production work orders are enabled.

## Configuration Dependency Chain

> [!WARNING]
> Raw material component SKUs and work center routings must exist in Core and Manufacturing **before** creating Bills of Materials (BOM) or releasing work orders. Always complete setup phases in order.

---

## Phase 1: Master Foundations

**What you are doing:** Verifying raw material component SKUs, finished product SKUs, purchasing units of measure (UOM), and production warehouses.

| Setup Task | Required Applet |
|------------|-----------------|
| Branch & Factory Location Setup | [Organisation Applet](/applets/master-data/organisation-applet/) |
| Raw Material & Finished Goods SKUs | [Doc Item Maintenance Applet](/applets/master-data/doc-item-maintenance-applet/) |
| Item Manufacturing Attributes | [Inventory Item Maintenance Applet](/applets/master-data/inv-item-maintenance-applet/) |

---

## Phase 2: Process & Routings

**What you are doing:** Defining factory work centers, machine operations, direct labor hourly rates, and operational sequencing.

| Setup Task | Required Applet |
|------------|-----------------|
| Factory Work Center Definitions | [Process Maintenance Applet](/applets/manufacturing/process-maintenance-applet/) |
| Machine Operations & Labor Cost Rates | [Process Maintenance Applet](/applets/manufacturing/process-maintenance-applet/) |

---

## Phase 3: Bill of Materials (BOM) Setup

**What you are doing:** Constructing multi-level component recipes, scrap percentage allowances, and assembly ratios for finished goods.

| Setup Task | Required Applet |
|------------|-----------------|
| BOM Component Recipe Construction | [Process Maintenance Applet](/applets/manufacturing/process-maintenance-applet/) |
| Component Substitution & Scrap Rules | [Process Maintenance Applet](/applets/manufacturing/process-maintenance-applet/) |

---

## Phase 4: WIP & Overhead GL Mapping

**What you are doing:** Mapping Work-in-Progress (WIP) asset GL accounts, Direct Labor absorption accounts, and Manufacturing Variance GLs.

| Setup Task | Required Applet |
|------------|-----------------|
| Work-in-Progress (WIP) Asset GL Mapping | Financial Accounting Configuration |
| Labor & Overhead Absorption GL Accounts | Financial Accounting Configuration |

---

## Phase 5: Test & Validate (Smoke Test)

Before going live, complete these mandatory verification tests:

- [ ] **Work Order Release Test:** Generate a production work order and confirm raw material components reserve accurately in inventory.
- [ ] **Material Issue to WIP Test:** Issue raw materials to shop floor and confirm raw material asset accounts decrease while WIP assets increase.
- [ ] **Finished Goods Receiving Test:** Complete a test batch, verify finished inventory increases, and confirm WIP accounts clear cleanly.
