# Applet documentation workflow (reusable)

Use this checklist with **[`APPLET_TEMPLATE.md`](../APPLET_TEMPLATE.md)** when adding a new English applet page to **blg-wiki**.

**How this relates to the template**

| Doc style | When to use | Primary guide |
|-----------|-------------|---------------|
| **End-user task guide** | Wavelet applets: lists, document lifecycles, settings most users never touch | **This workflow** — structure below; skip heavy template sections (API, schema, version history) unless PM asks |
| **Comprehensive template page** | Core modules, deep admin reference, integration-heavy applets | **`APPLET_TEMPLATE.md`** section order, still use WIP callout + Phase 1b sizing |

**Worked examples (end-user style)**

| Applet | Page | What it demonstrates |
|--------|------|----------------------|
| Supplier Delivery Order | `content/en/applets/purchase-workflow/supplier-delivery-order-applet.md` | Lifecycle, actors, settings table, WIP + infographic path |
| Internal Purchase Credit Note | `content/en/applets/purchase-workflow/internal-purchase-credit-note-applet.md` | Terminology primer, problems solved, key concepts table, **role-based Quick Start**, draft vs posted, “after you post”, **when to use X vs Y** sibling table, FAQ, troubleshooting |

For a long **narrative reference** with many screenshots (different style), see `content/en/applets/claims/claim-applet.md` — borrow **patterns** (role quick start, key concepts, FAQ density) without matching its length unless scoped in Phase 1b.

---

## 0. Per-applet variables (copy and fill)

| Variable | Your value |
|----------|------------|
| **Applet display name** | e.g. Supplier Delivery Order Applet |
| **Wiki filename** | e.g. `supplier-delivery-order-applet.md` (kebab-case) |
| **`slug` / image folder** | e.g. `supplier-delivery-order-applet` (matches `static/images/{slug}/`) |
| **Infographic filename** | Must **exactly** match `{{< figure src="..." >}}` (rename designer export if needed), e.g. `{slug}-overview-infographic.png` |
| **Content folder** | e.g. `content/en/applets/purchase-workflow/` (IA: match module, `_index` neighbors) |
| **Source repo path** | e.g. `...\blg-applet-wavelet-<name>-applet` |
| **`weight`** | Pick from sibling pages in the same folder (navigation order) |
| **Primary audience** | e.g. Procurement + Finance + Ops (drives role-based Quick Start) |

---

## Phase 1 — Explore the applet repository

1. **Routing** — `app.routing.ts` (or equivalent): listing routes, settings, personalization, special screens. **Use this for your own understanding**; the wiki page should describe **menus and screen names users see**, not raw route IDs.
2. **Domain** — Effects/services: `server_doc_type`, filters, key actions (void, submit, etc.). **User-facing doc names** may differ from internal component names (e.g. “Sales Invoice” UI vs “Supplier Delivery Order” product name).
3. **Labels** — i18n or shared utilities; confirm real menu strings with PM or a running tenant when unsure.
4. **Output** — Short bullet list: **actors**, **primary jobs**, **settings groups** worth documenting, **sibling applets** (same workflow) for “when to use which” tables.

---

## Phase 1a — Audience and tone (end-user guides)

- **Write for** people who use the applet daily (procurement, finance, warehouse, HR, etc.), **not** for developers implementing Wavelet.
- **Prefer** menu labels, button names, and outcomes (“post the document”) over implementation detail.
- **Avoid** in the wiki body unless PM explicitly wants them:
  - Internal codes (`SERVER_DOC_TYPE`, route keys, enum names)
  - Raw developer paths or internal-only URLs
  - Long dumps of permission keys (summarise: “your admin sets permissions / feature visibility”)
- **Hedge tenant-specific behaviour** — use “if your company enabled…”, “labels may differ”, “ask finance/admin” instead of absolutes (“always”, “never”, “100%”) unless Legal/PM approves.
- **Optional callout** — missing buttons/menus often = permissions or feature visibility; point users to **admin** (reusable pattern).

---

## Phase 1b — Scope document size (before drafting)

Lock a **tier** so small applets do not get book-length pages:

| Tier | Lines (guide) | When |
|------|----------------|------|
| **Minimal** | ~80–150 | Few screens + standard Wavelet settings only |
| **Standard** | ~150–350 | Full doc lifecycle + typical settings + integrations |
| **Richer** | 350+ | Many distinct business features or several roles/workflows |

Record: tier, approximate max lines, which sections to **skip or merge**.

**Gate:** Do not draft the markdown until this step is decided.

**Richer tier without screenshots:** You can still add **FAQ**, **role-based Quick Start** (text only), **key concepts table**, and **“when to use vs sibling applet”** in v1; add figures in a follow-up pass (see Phase 3).

---

## Phase 1c — Terminology primer (when needed)

If the applet title is **jargon** (e.g. credit note, debit note, GRN, contra), add a short **`## What is …?`** section **immediately after the WIP callout** (before “what this applet is for”):

- 2–4 sentences in plain language
- Contrast with the nearest familiar concept (e.g. invoice vs credit note)
- One line on how BigLedger treats it (document + lines + supplier, etc.)

Skip this section if the name is already self-explanatory for your audience.

---

## Phase 2 — Write the wiki page

**Path:** `content/en/applets/{module-folder}/{filename}.md`

### Front matter

`title`, `description`, `tags`, `weight`, `date`, `lastmod`, `draft: false`

### Work-in-progress banner (required for new docs)

Place **immediately after** the front matter (before the first `##` section). Replace `{Applet Name}` with the page title:

```markdown
{{< callout type="warning" >}}
**{Applet Name} user guide still under progress**

**Work in Progress: This documentation is currently under development. Visual assets (screenshots) and further details will be added soon.**
{{< /callout >}}
```

**Remove this callout** when the guide is considered complete.

### Recommended structure — end-user guides (pick by tier)

Use **`{{< cards >}}`** under a **single** `## Key Features` with `link="#anchor-id"`; set **`## Section {#anchor-id}`** on targets (do not rely on fragile auto-slugs alone).

| Section | Minimal | Standard | Richer | Notes |
|---------|---------|----------|--------|--------|
| WIP callout | ✓ | ✓ | ✓ | |
| Terminology `## What is …?` | If jargon | If jargon | If jargon | Phase 1c |
| What this applet is for | ✓ | ✓ | ✓ | Short, outcome-focused |
| **What problems does this solve?** | — | ○ | ✓ | Before/after or bullets |
| Who uses it (+ **benefits by role**) | Table | ✓ | ✓ | Optional extra bullets per role |
| Key Features + cards + **overview figure** | ✓ | ✓ | ✓ | One `{{< figure >}}` when asset exists |
| **Key concepts** (small table) | — | ○ | ✓ | e.g. who / document / lines |
| **Quick Start** — **by role** then step-by-step | — | ○ | ✓ | Link from role blocks to detailed `###` anchors |
| Lifecycle (e.g. **draft vs posted**) | If applicable | ✓ | ✓ | Table |
| **What happens after [action]?** | — | ○ | ✓ | e.g. after post: AP, e-invoice, stock — **caveat** tenant-specific |
| Screens / menus in detail | ✓ | ✓ | ✓ | Match real UI names |
| **Works with** + **when to use which document** | — | ○ | ✓ | Table + links to sibling applet pages |
| Settings (admin) — **compact table** | ○ | ✓ | ✓ | Sidebar names users see |
| **Troubleshooting** — compact table | ○ | ✓ | ✓ | |
| **FAQ** | — | ○ | ✓ | 5–10 items; link to anchors |
| Related documentation links | ✓ | ✓ | ✓ | Same folder neighbours first |

**Legend:** ✓ = usually include, ○ = include if tier/scoped, — = skip unless special need.

### Figures and anchors

**Overview infographic** (do not block shipping MD on the file existing):

```markdown
{{< figure src="/images/{slug}/{slug}-overview-infographic.png" alt="..." caption="..." >}}
```

- **Filename discipline:** Whatever ships in `static/images/{slug}/` must **match** `src=` character-for-character (rename exports from design if needed).
- **Screenshots:** Optional for v1; add per-step when stakeholders request (see Phase 3).

### Cross-links

Root-relative paths (e.g. `/applets/purchase-workflow/...`) or `relref` — verify deployed URL scheme (`/en/` prefix if applicable).

---

## Phase 3 — Infographic and static assets

1. **Folder:** `static/images/{slug}/`
2. **Until the PNG exists:** optional `.gitkeep` so the folder is tracked (remove after adding the real image).
3. **When the image is ready:** copy the designer export; **rename** to match markdown `{{< figure src="..." >}}`.
4. **Second infographic / quick-start graphic:** optional; only if scoped in Phase 1b (not required for a complete v1).
5. **Screenshots:** Batch add later; keep alt text and captions user-focused.

---

## Phase 4 — Quality checks (local)

- [ ] **WIP warning callout** present for new pages (remove when doc is no longer in progress)
- [ ] **Audience** — reads as end-user guidance; no unnecessary internal codes or route IDs
- [ ] **Terminology** — primer present if jargon; skipped if not needed
- [ ] Correct **file name** and **folder** under `content/en/applets/...`
- [ ] **`weight`** fits sibling ordering
- [ ] Every **`{{< card link="#..." >}}`** matches a heading `{#id}` (verified)
- [ ] **Related applets** — links work; “when to use which” does not contradict PM
- [ ] `hugo` build (optional): no broken refs
- [ ] SME/PM pass on process wording and **menu labels**

---

## Phase 5 — Git: commit and push to `main`

1. **`git status`** — Unstage unrelated files (`git restore --staged <path>`) so one commit stays focused on this applet.
2. **`git add`** — Typically:
   - `content/en/applets/.../{filename}.md`
   - `static/images/{slug}/` (PNG + drop `.gitkeep` if present)
3. **Do not mix** unrelated assets (e.g. another applet’s images) or optional folders like `docs/review-feedback/` unless you intend one combined commit.
4. **Commit message (short):**  
   `docs: add {Applet Name} applet page and infographic`
5. **Push:**  
   `git push origin main`  
   If rejected (`fetch first`):  
   `git pull --rebase origin main`  
   then  
   `git push origin main`

---

## Suggested todo list (reset for each applet)

| ID | Task |
|----|------|
| explore-repo | Routing, domain, labels, actor/job summary, sibling applets |
| audience-tone | Confirm end-user wording; list terms needing a primer |
| scope-doc-size | Tier + section budget + screenshot pass (now vs later) |
| draft-md | Create `{filename}.md` per this workflow + tier |
| assets | Infographic path in MD; add PNG when received (name matches `src`) |
| verify | Anchors, weight, links, related-doc table, optional `hugo` |
| publish | Commit + push `main` (rebase if needed) |

---

## Appendix — Supplier Delivery Order (reference)

| Item | Value |
|------|--------|
| Page | `content/en/applets/purchase-workflow/supplier-delivery-order-applet.md` |
| Images | `static/images/supplier-delivery-order-applet/supplier-delivery-order-applet-overview-infographic.png` |
| Source repo | `blg-applet-wavelet-supplier-delivery-order-applet` |
| Routes (examples, doc author only) | `supplier-delivery-order-listing`, `driver-listing`, `settings/*`, `personalization/*` |
| Doc type (internal) | `supplier-delivery-orders` |

---

## Appendix — Internal Purchase Credit Note (reference)

| Item | Value |
|------|--------|
| Page | `content/en/applets/purchase-workflow/internal-purchase-credit-note-applet.md` |
| Images | `static/images/internal-purchase-credit-note-applet/internal-purchase-credit-note-applet-overview-infographic.png` |
| End-user patterns | Terminology primer, problems solved, benefits by role, key concepts, role Quick Start + detailed steps, after post, sibling “when to use” table, FAQ |

---

*Last updated: end-user structure (credit note session), terminology primer, role Quick Start / FAQ without requiring screenshots in v1, claim-applet as pattern reference, filename discipline for figures, expanded quality checks.*
