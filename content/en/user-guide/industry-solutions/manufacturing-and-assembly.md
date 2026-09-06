---
title: "Manufacturing & Assembly Industry"
description: "Production planning, multi-level Bill of Materials (BOM), shop floor labor tracking, and Work-in-Progress (WIP) costing."
weight: 50
tags:
- manufacturing
- assembly
- bom
- wip
- production
---

<style>
.ind-hero {
  background: linear-gradient(135deg, #0f172a 0%, #1e293b 50%, #334155 100%);
  padding: 36px 28px;
  border-radius: 16px;
  margin-bottom: 32px;
  color: #fff;
  position: relative;
  overflow: hidden;
  text-align: center;
  box-shadow: 0 10px 30px -10px rgba(15, 23, 42, 0.3);
}
.ind-hero::before {
  content: '';
  position: absolute;
  inset: 0;
  background: radial-gradient(circle at 50% 20%, rgba(59, 130, 246, 0.18) 0%, transparent 50%);
  pointer-events: none;
}
.ind-back {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  color: rgba(255,255,255,.8) !important;
  font-size: 13px;
  text-decoration: none !important;
  margin-bottom: 12px;
}
.ind-back:hover { color: #fff !important; }
.ind-hero-title {
  font-size: 30px;
  font-weight: 800;
  margin: 0 0 10px;
  line-height: 1.2;
  color: #ffffff !important;
  letter-spacing: -0.02em;
}
.ind-hero-desc {
  font-size: 15px;
  color: #94a3b8 !important;
  max-width: 720px;
  margin: 0 auto;
  line-height: 1.6;
}
main h1:not(.ind-hero-title) { display: none !important; }
main > br { display: none !important; }
</style>

<div class="ind-hero">
  <h1 class="ind-hero-title">Manufacturing & Assembly Industry Solution</h1>
  <p class="ind-hero-desc">Manufacturers and assembly operators require tight control over raw material procurement, multi-level production recipes, machine runtime scheduling, and accurate Work-in-Progress (WIP) financial accounting. BigLedger bridges shop floor execution with back-office GL reporting.</p>
</div>

---

## 🔄 Production & Work-in-Progress (WIP) Flow

### Key Manufacturing Capabilities:
1. **Multi-Level Bill of Materials (BOM):** Define exact sub-assemblies, raw materials, and packaging components required for finished products.
2. **Work-in-Progress (WIP) Tracking:** Track inventory values as raw materials move onto the factory shop floor and undergo transformation before final finished goods receipt.
3. **Variance Analysis:** Compare standard costing vs. actual raw material consumption and technician labor hours to optimize factory yield.

---

## 🚀 Recommended Applet Stack

| Operational Area | Required Applets | Key Capabilities |
| :--- | :--- | :--- |
| **Production Planning & BOM** | [Manufacturing Module](/modules/manufacturing/) | Multi-stage BOM definition, raw material requirement planning, and job order release |
| **Material Issuance & Store** | [Inventory Module](/modules/inventory/) | Shop floor raw material issuance, WIP stock tracking, and scrap recording |
| **Costing & Financial GL** | [Financial Accounting](/modules/financial-accounting/) | Auto GL posting for WIP asset movement, labor expense absorption, and finished goods inventory receipt |
