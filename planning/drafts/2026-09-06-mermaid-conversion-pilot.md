---
title: "Mermaid conversion pilot — five generated infographics, verified and replaced"
date: 2026-09-06
status: done (pilot)
decides: nothing — this is evidence for the F-0380 / F-0381 programme
routes_to: F-0391, F-0392, F-0393, Q-0083
---

# Mermaid conversion pilot

F-0380 kept 75 AI-generated infographics live and committed us to redrawing them as vector.
F-0381 chose the format: **mermaid code fences** (rendered natively by
`themes/hextra/layouts/_markup/render-codeblock-mermaid.html`) for flows, sequences, state
machines and relationships; **inline SVG in a shortcode** only where art direction is needed.

This unit converted **five** of them and stopped, as a pilot. The point was never the pictures.
It was to find out what the pictures assert and whether it is true.

## Headline

**Five images audited. Five carried at least one claim that source contradicts.** Twenty-one
false or materially misleading assertions in total across the five, on pages whose *prose* is
already source-verified. Two of the five would have been read as documentation of a feature that
does not exist (a stock-adjustment approval workflow; driver status tracking). One carries a
**fabricated product brand mark** — "DeliveryConnect Applet — Empowering Your Logistics" — a
product name that exists nowhere in BigLedger.

None of this survived into the replacements, because four of the five became mermaid and the
fifth became nothing.

## What was converted, and to what

| # | Page | Image retired | Replaced with | Time |
|---|---|---|---|---|
| 1 | `/applets/inventory-workflow/stock-availability-applet/` | `stock-availability-infographic.jpg` | `flowchart LR` — how Available Qty is actually computed, plus a paragraph naming the backend default document-type pairs | ~35 min (includes building the validator + render harness) |
| 2 | `/applets/inventory-workflow/stock-adjustment-applet/` | `stock-adjustment-overview-infographic.png` | `flowchart LR` — discrepancy → document → SAVE (DRAFT) → FINAL → balance + journal, plus an explicit "there is no approval step" | ~20 min |
| 3 | `/applets/master-data/chart-of-account-applet/` | `chart-of-account-applet-overview-infographic.png` | `flowchart TD` — the structure the page describes across four sections but never draws: chart → section → category → code, and company → ledger / fiscal year / default GL codes, set of books → ledger | ~20 min |
| 4 | `/applets/purchase-workflow/internal-purchase-order-applet/` | `internal-purchase-order-overview-infographic.png` | `flowchart TD` — the five ways a PO is created, the optional approval gate, FINAL, and the four things that consume the open queue; states on the FINAL node that a PO posts nothing | ~20 min |
| 5 | `/applets/inventory-workflow/driver-delivery-order-applet/` | `driver-delivery-order-overview-infographic.png` (also removed from the `ms` and `zh` twins) | **Nothing.** See below. | ~15 min |

Total ≈ 1h50m for five, of which about 25 minutes was one-off tooling. Steady state is
**15–20 minutes per diagram**, and the verification is most of it — the mermaid itself is five
minutes.

### Why #5 got no replacement

The Driver Delivery Order applet does one thing: it lists the delivery orders whose
`delivery_driver_guid` is the logged-in user, and lets that user set a vehicle number, a delivery
date and a morning/afternoon/evening slot. A diagram of that is three boxes in a row and tells
the reader nothing the sentence above it does not. The page also carries a **real screenshot of
the listing on the very next line**. The honest replacement for a decorative marketing split is
no diagram, and this is the case that proves it.

## Claim verification

Every "source" cell below was checked in this pass against
`refs/blg-akaun-platform-java@1ff620ef0e` and the applet repository named in each page's
`sources:` front matter.

### 1. `stock-availability-infographic.jpg` — Stock Availability

| Claim on the image | Verdict | What source says |
|---|---|---|
| **"The Core Formula: A = P − R"** — True Availability = Physical Stock − Reserved | **False** | `StockAvailabilityService.getCorrectServerDocTypeSignumDto` (`javasdk/.../domain/erp/stock/StockAvailabilityService.java:29-42`). Available Qty = Stock Balance **+ Adj Qty**, where Adj Qty is a *signed* sum over document-type **pairs**. The backend default is two pairs: `INTERNAL_SALES_ORDER`↔`INTERNAL_SALES_INVOICE` at **−1** *and* `INTERNAL_PURCHASE_GOODS_RECEIVED_NOTE`↔`INTERNAL_PURCHASE_INVOICE` at **+1**. Nothing called "Reserved" enters the calculation. Reserved and locked quantities are a different thing on a different screen (Stock Card & Planning), which is `defaultHidden: true`. |
| **"The 'Incoming' Variable — *optional* logic (A = P − R + I) allows selling stock currently in transit from suppliers"** | **False, twice** | The `+1` term is not optional; it is in the default list every caller gets when it sends none. And it counts goods-received notes not yet invoiced — stock **already received into the warehouse**, not in transit. |
| "Aging Analytics — identifies 'Dead Stock' sitting for **90+ days** to trigger targeted clearance discounts" | **False** | `stock-aging-report.component.ts:289-314`. Buckets are month 1–6 plus rest, or days **0–30 / 31–60 / 61–120 / rest** when `AGING_PERIOD_TYPE = DAY`. No 90-day bucket, no dead-stock flag, and nothing that triggers anything. |
| "Bin-Level Precision — maps exact **aisle** and bin locations" | **Partly false** | `bin-availability-listing.component.ts:152-165, 351-356`. Columns: Item Code, Location, Available Qty, and dynamic `Bin Hdr n`. There is no aisle concept in the applet. |
| "End-to-End Audit Trails — trace a serial number **from the supplier's PO** to the customer's invoice" | **Partly false** | Serial numbers are captured on receipt documents, not on the purchase order. The backward trace ends at the GRN and its supplier (already stated correctly in the page prose). |
| "Real-Time Global Sync — numbers update instantly across all branches the moment a warehouse worker clicks Confirm" | **Misleading** | Available Qty is recomputed on every load of the listing. There is no push and no cross-branch sync mechanism; and the ledger only moves on *finalised* documents, not on a "Confirm". |
| "…the central nervous system for inventory, **sitting stop** purchasing, sales, and manufacturing modules" | **False + a raw generation artefact** | Registry modules for `stockAvailability` are Inventory, Purchasing, POS — not manufacturing. "sitting stop" (for "sitting atop") was published as-is. |
| Role table: Sales Reps / Pickers / Compliance | **Unverifiable** | The applet has no role model. It gates menus and columns with `SHOW_*` permissions; nothing maps to these three job titles. |

### 2. `stock-availability-overview-infographic.png` — same applet, **not referenced by any page**

Still served from the CDN. Named in F-0380 as the example.

| Claim | Verdict | What source says |
|---|---|---|
| "Precision Stock Logic — instantly calculates 'Net Available' by **subtracting reserved orders from physical stock**" | **False** | As row 1 above. |
| Table: "Available Stock = Physical stock minus Reserved stock" | **False** | As row 1 above. |
| "Smart Aging Reports — identify slow-moving items and **enforce FIFO** to prevent inventory obsolescence" | **False** | The applet is read-only and enforces nothing; it creates no documents at all. FIFO exists here only as a **cost column** (`HIDE_LISTING_FIFO_COST`) shown next to LIFO, moving-average and last-purchase cost. |

### 3. `stock-adjustment-overview-infographic.png` — Stock Adjustment (Internal)

| Claim | Verdict | What source says |
|---|---|---|
| **"Review & Approval Workflow — route high-value adjustments to managers for review to ensure financial and audit compliance"** | **False** | `blg-applet-wavelet-stock-adjustment-applet@6d50676`: no approval component, route, menu, tab or setting. The *only* occurrence of the string "approval" in the whole applet source is a copy-pasted `stock-adjustment-container.component.spec.ts` that imports an `ApprovalContainerComponent` which exists nowhere in the repository. A stock adjustment goes DRAFT → FINAL with no gate. |
| "Adjustment Type: Increase / Decrease / **Correction**" (three) | **False** | Two. `Adjust-In` / `Adjust-Out` — `stock-adjustment-basic.component.ts:135`, `stock-adjustment-edit.component.ts:171-230`, and `serial-data-fix-create.component.ts:248,261` writing `txn_type = "ADJUST_IN"` / `"ADJUST_OUT"`. |
| "Bulk File Import — Excel or CSV templates" | True | `.xlsx` and `.csv` both accepted. |
| "Serial & Batch Precision — perform 'Write-offs' or **'Write-one'** for specific serialized items and correct batch expiry dates" | Partly true, garbled | Serial Number Adjustment does adjust-in / adjust-out per serial; batch lines carry issue and expiry dates. "Write-one" is another raw generation artefact. |
| "Post & Recalculate — finalize records to instantly update stock levels and **automatically recalculate moving average costs**" | Misleading | FINAL updates the balance and posts the journal. A *wrong* moving average is not corrected by finalising an adjustment — that is precisely why four separate **Reset MA** document types exist (Reset MA, Reset MA By Location, File Import Reset MA, Stock Adjustment by Reset MA). |

### 4. `chart-of-account-applet-overview-infographic.png` — Chart of Account

| Claim | Verdict | What source says |
|---|---|---|
| **"Enhanced Security — Role-based access · Audit trail"** | **Half false, and the wrong half** | `chartOfAccountApplet` registers **no client-side permission definitions** (registry check 2026-09-05) and the applet code contains no `SHOW_*` / `HIDE_*` checks. There is no per-tab or per-menu permission. Anyone who can open the applet can edit the tenant-wide settings and a company's Default GL Codes. Audit Trail does exist. |
| Section → Category → Code tree | True | Matches the applet's hierarchy. |
| Sample codes `5000-101`, `5000-102`, `6000-201` | Off house style, and internally broken | CLAUDE.md's documented house style is mnemonic (`EXPENSE-RENTAL`). The image also prints "5000-101 Office Supplies" **twice** and gives `5000-101` and `5000-102` the same account name. |
| "BEFORE: THE CHAOS" / "WHO BENEFITS → Finance Manager → Accountant → Admin → IMPROVED EFFICIENCY & GROWTH" | Marketing, not documentation | About 70% of a 1024×1024 canvas. |

### 5. `internal-purchase-order-overview-infographic.png` — Purchase Order (Internal)

| Claim | Verdict | What source says |
|---|---|---|
| "Integrated Approval Workflows — requests routed **directly to managers and finance** for rapid decision-making, eliminating bottlenecks" | Partly false | Approvals exist (Approval Settings, Approval Monitor, Approval Request / History, the Generic Doc Approval tab) but are **off until an approval rule is configured**, and routing is by **branch designation and approval rank**, not to "managers and finance". Related open product findings: P-0004 (the approval decision endpoint is unauthenticated), P-0022 (`approval_logic` and `max_approval_amount` are collected, stored and never read). |
| "Link PO lines to Goods Received Notes (GRN)" | True | Open-queue knock-off; the **PO Line with GRN KO** report. |
| "Stock-driven templates / balanced inventory" | True | PO Replenishment: Template, Events, Runs. |
| "High-volume bulk operations — dedicated file import and export tools" | True, with a caveat | CSV only, delimiter must match; not Excel. |
| "Finance & Operations — **link POs to payments**, manage intercompany transactions, run audit reports" | Misleading | Intercompany is real. But `INTERNAL_PURCHASE_ORDER` carries amount signum **0** and quantity signum **0**: it posts nothing to the General Ledger, moves no stock, and settles nothing. That is the single most important fact about the document and the image never says it — the replacement diagram now does, on the FINAL node. |
| "Manage suppliers, billing / shipping addresses, and structured item creation" | True | |
| Left third: "The Manual Purchase Order Problem" — crumpled paper and envelopes | Marketing | ~35% of a **2752×1536, 4.7 MB** PNG. |

### 6. `driver-delivery-order-overview-infographic.png` — Driver Delivery Order

| Claim | Verdict | What source says |
|---|---|---|
| Bottom-centre logo lockup: **"DELIVERYCONNECT APPLET — Empowering Your Logistics"** | **Fabricated product identity** | No such product, applet, module or brand exists anywhere in BigLedger. The applet is `driverDeliveryOrderApplet`, "Driver Delivery Order". This has been on the published English, Malay and Chinese pages. |
| "Dedicated **mobile-first** interface — intuitive, easy-to-use design for drivers on the go", drawn as a phone with a route map | **False** | It is the ordinary Angular micro-frontend listing inside the applet shell. There is no mobile build, no map, no GPS and no route anywhere in `blg-applet-wavelet-driver-delivery-order-applet`. (A separate Kotlin app, `akn-kotlin-mobile-delivery-driver`, is a *different product* and is not what this page documents.) |
| "Real-time syncing — instant data updates between **app** & back-office systems" | **False** | There is no app and no sync. The driver opens a listing and presses SAVE. |
| "**Custom delivery statuses** — Picked Up / In Transit / Delivered / Issue Reported; accurate, granular tracking of every delivery stage" | **False** | The Custom Status settings screen saves its lists and **nothing in this applet reads them**: the header reducer always writes `custom_status: null` and the edit form has no status control (already documented on the page, at commit `385299a`). |
| "Dispatchers (tracking) — better resource allocation, real-time visibility, improved communication" | **False** | There is no dispatcher screen. The listing is hard-filtered to `delivery_driver_guid = the logged-in subject` in the search effect, with no way to switch it off. |
| "Back-office / management (real-time ERP updates) — accurate reporting, faster billing, data-driven decisions" | **False** | One menu item, no report, no billing. |
| Left third: "Complex ERP screens / delayed status updates / dispatcher confusion / lost paperwork" | Marketing | One third of the canvas. |

## Images to quarantine

Listed, **not deleted** — quarantine is someone else's call, per F-0380.

| Path | Referenced before this pass | Now |
|---|---|---|
| `static/images/stock-availability-applet/stock-availability-infographic.jpg` | `content/en/applets/inventory-workflow/stock-availability-applet.md` | unreferenced |
| `static/images/stock-availability-applet/stock-availability-overview-infographic.png` | **nothing** (already orphaned) | unreferenced |
| `static/images/stock-adjustment-applet/stock-adjustment-overview-infographic.png` | `content/en/applets/inventory-workflow/stock-adjustment-applet.md` | unreferenced |
| `static/images/chart-of-account-applet/chart-of-account-applet-overview-infographic.png` | `content/en/applets/master-data/chart-of-account-applet.md` | unreferenced |
| `static/images/internal-purchase-order-applet/internal-purchase-order-overview-infographic.png` | `content/en/applets/purchase-workflow/internal-purchase-order-applet.md` | unreferenced |
| `static/images/driver-delivery-applet/driver-delivery-order-overview-infographic.png` | `en` + `ms` + `zh` driver-delivery pages | unreferenced |

Removing the reference does **not** take the file off the CDN. Until the files are quarantined,
every one of them is still fetchable by URL — including the two that already had no page.

## Method that worked, for whoever picks up the rest

1. **Read the image before reading the page.** Enumerate every sentence on it. Each one is a claim.
2. **Verify against source, not against the page.** Four of these five pages have source-verified
   prose that already contradicted their own illustration, and nobody had noticed, because prose
   and picture are reviewed separately.
3. **Ask what shape the content actually is.** Flow, lifecycle, relationship → mermaid. Two-column
   "chaos vs solution" → nothing, or a table. Do not manufacture a diagram to fill the hole an
   image left.
4. **Never hard-code colours.** Mermaid inherits the Hextra theme (`scripts/mermaid.html` reads
   `document.documentElement.classList.contains("dark")` and re-initialises on theme change).
   An existing diagram in `inv-item-maintenance-applet.md:157-158` hard-codes `fill:#f9f` and
   `fill:#bbf` and is unreadable in dark mode — do not copy that.
5. **Validate and render before committing.** Both harnesses are throwaway but reproducible:
   `mermaid.parse()` under jsdom catches syntax errors; a Playwright page (there is already a
   Chromium in `tests/playwright/node_modules`) renders each fence at `theme: "default"` and
   `theme: "dark"` so truncation and contrast are seen, not guessed.

All four fences parse; all eight renders (four diagrams × two themes) are legible with no
truncation. `tests/content-lint.sh` passes.

## Is converting the remaining ~52 worth it?

**Not as a conversion exercise. Yes as an audit — and the audit's usual answer will be "delete".**

The evidence from a 5-of-75 sample:

- **5 of 5 carried at least one false claim.** Not "some are stale" — every single one.
- **Only 2 of 5 had a diagram inside them worth keeping** (stock availability's calculation,
  the purchase-order chain). The chart-of-account and stock-adjustment images each contained one
  true idea buried in marketing, and it was already in the page's own prose as a table or a
  callout — the mermaid I drew adds clarity but replaces nothing that was missing.
- **1 of 5 should simply not exist**, and its replacement is nothing at all.
- **Roughly 60–70% of each canvas is marketing** — "BEFORE: THE CHAOS", "WHO BENEFITS", stock
  art of crumpled paper. That content has no vector equivalent because it has no referent.

So the honest recommendation for the other ~52 is a **triage, not a redraw**:

- **Quarantine first, redraw second.** The images are wrong *now*. Leaving them live "until
  redrawn" means a false claim stays published for however long the queue is. Removing the
  reference costs one line per page and loses nothing, because in every one of these five cases
  the page's prose was already more correct than the picture.
- **Expect most to need no replacement.** Any image whose title is of the form
  "*X: from chaos to control*", "*The old way vs the new way*", "*Who benefits*" is marketing.
  Deleting it is the complete fix.
- **Draw a mermaid only where the page has a flow, a lifecycle or a structure it currently
  describes in prose alone.** That is a genuine improvement and worth the 15 minutes. Guess: 15–20
  of the remaining 52.
- **Budget for the audit, not the art.** ~15 minutes each × ~52 ≈ 13 hours, and the deliverable is
  ~50 corrected claims, not 52 pictures.

The one thing that must not happen is redrawing them faithfully. Four of the five would have
reproduced a false claim in crisper vector.

That reversal of "keep them live for now" is put to Vincent as **Q-0083**.
