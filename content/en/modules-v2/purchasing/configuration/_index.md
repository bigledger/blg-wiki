---
title: "Configuration"
description: "Step-by-step implementation workflow for configuring the Purchasing Module."
weight: 30
bookCollapseSection: false
---

Configuring the Purchasing Module follows a strict 5-phase dependency chain. Supplier master records and item purchasing units must be set up before the optional approval workflows or the warehouse receiving rules are enabled.

## Configuration Dependency Chain

![5-Phase ERP Purchasing Setup Pipeline](/images/purchasing/purchasing_configuration_workflow.png)

> [!WARNING]
> Supplier profiles and item master records must exist in Core **before** creating vendor pricebooks or generating purchase requisitions. Always complete setup phases in order.

---

## Phase 1: Master Foundations

**What you are doing:** Verifying company entity structures, branch receiving locations, supplier master profiles, and tax codes.

| Setup Task | Required Applet |
|------------|-----------------|
| Branch & Warehouse Receiving Locations | [Organisation Applet](/applets/master-data/organisation-applet/) |
| Supplier Master Profiles & Payment Terms | [Entity Maintenance Applet](/applets/master-data/entity-applet/) |
| Input Tax Code (SST/VAT) Mapping | Financial Accounting Configuration |

---

## Phase 2: Supplier Pricing & Contracts

**What you are doing:** Configuring vendor-specific pricebooks, contract validity windows, and volume discount matrices.

| Setup Task | Required Applet |
|------------|-----------------|
| Item Purchasing Units of Measure (UOM) | [Doc Item Maintenance Applet](/applets/master-data/doc-item-maintenance-applet/) |
| Vendor Pricebooks & Contracted Rates | [Pricebook Applet](/applets/master-data/pricebook-applet/) |
| Blanket Purchase Order Contracts | [Blanket Purchase Order Applet](/applets/purchase-workflow/blanket-purchase-order-applet/) |

---

## Phase 3: Approval Workflows *(optional)*

**What you are doing:** Defining approval levels for requisitions and purchase orders. This phase is optional — approvals are off until you create an Approval Setting, and requisitions and orders finalise normally without one. Approvers are the employees you place under Settings → Branch → Designation, each with an Approval Level; a level's **Min Approval Amount** decides how many levels a document must clear, not which person sees it. See [Document Approvals](/guides/document-approvals/).

| Setup Task | Required Applet |
|------------|-----------------|
| Purchase Requisition Approval Limits | [Purchase Requisition Applet](/applets/purchase-workflow/internal-purchase-requisition-applet/) |
| Purchase Order Managerial Sign-offs | [Purchase Order Applet](/applets/purchase-workflow/internal-purchase-order-applet/) |

---

## Phase 4: Warehouse Receiving & Inspection

**What you are doing:** Mapping physical stock-in locations, batch/serial assignment rules, and quality inspection controls.

| Setup Task | Required Applet |
|------------|-----------------|
| Stock-In Location & Warehouse Mapping | [Goods Received Note GRN Applet](/applets/purchase-workflow/internal-purchase-grn-applet/) |
| Batch & Expiry Date Assignment Rules | Inventory Workflow Configuration |

---

## Phase 5: Test & Validate (Smoke Test)

Before going live, complete these mandatory verification tests:

- [ ] **Requisition Test:** Raise an internal requisition and take it to FINAL. If you configured Phase 3, also submit it for approval and confirm the level 1 approver receives the e-mail.
- [ ] **PO & GRN Test:** Generate a Purchase Order, convert to Goods Received Note (GRN), and verify physical stock increases.
- [ ] **3-Way Match Test:** Verify a supplier invoice against PO and GRN, ensuring price/quantity variances block unauthorized posting.
- [ ] **GL Reconciliation:** Verify GRNI accrual accounts debit and credit accurately upon GRN and Invoice finalization.
