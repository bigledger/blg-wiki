---
date: 2026-09-06
unpublished_from: content/en/applets/sales-workflow/external-sales-invoice-applet.md
url: /applets/sales-workflow/external-sales-invoice-applet/
tier: 1
mechanism: draft
reason: "Documents an applet that has no row in bl_applet_hdr under any name or status, and attributes to it the entire feature set of Sales Invoice (Internal). In the real repo the create, edit, FINAL and posting-status effects are all commented out, the create form still asks for 'Conversion Code' and 'Conversion Name', and there is no line-item tab at all."
evidence:
  - "bl_applet_hdr (akaun_master, 2026-09-06): 209 ACTIVE / 26 DELETED / 1 INACTIVE rows. No row where name or code matches 'external', none matching the repo's dev-only appletCode 'external-supplier-sales-invoice-applet' or its appletGuid 371a8cd4-95e3-4e43-8e5d-b4ec0df48cce, and no property_json referencing external-sales-invoice or supplier-sales-invoice. The only sales-invoice bundles registered are salesInvoiceApplet (Sales Invoice (Internal)) and recurringSalesInvoiceApplet."
  - "blg-applet-wavelet-external-sales-invoice-applet@222d5699 .../external-sales-invoice-applet/src/app/state-controllers/external-sales-invoice-controller/store/effects/external-sales-invoice.effects.ts — only loadConversionListing$ is live (L27-86). createExternalSalesInvoice$ (L88-164), editExternalSalesInvoice$ (L166-243), updatePostingStatus$ (L245-296) and loadJobOrderListing$ are entirely commented out."
  - ".../external-sales-invoice-create/external-sales-invoice-create.component.html L20-42 — one 'Main Details' tab and an empty 'Matchings' tab; the 'Lines', 'Input', 'Output' and 'Job Order Link' tabs are commented out. onSave() (component.ts L86-90) dispatches createExternalSalesInvoiceInit, which no effect handles."
  - ".../external-sales-invoice-create/main-details/main-details.component.html — the form is Branch, Location, 'Conversion Code', 'Conversion Name', Description. No customer, no items, no amounts, no dates, no tax."
  - ".../external-sales-invoice-listing/external-sales-invoice-listing.component.ts L261-285 — onFinal() dispatches updatePostingStatus, whose effect is commented out. Its columnsDefs (L75-86) bind to bl_inv_stock_conversion_hdr.* while the effect loads bl_fi_xtn_generic_doc_hdr rows."
  - "bl_fi_xtn_generic_doc_hdr has no posting_status column (tenant schema dump, and blg-akaun-ts-lib .../models/dbschema/bl_fi_xtn_generic_doc_hdr.model.ts) — the grid's 'Posting Status' column therefore prints DRAFT for every row via its valueFormatter fallback."
  - "blg-akaun-platform-java@1ff620ef javasdk/.../domain/erp/external/ExternalGenericDocumentService.java — create / createXtnTempGenericDoc / update / delete only. ExternalGenericDocumentDataConsistencyObject contains no signum, no posting_status and no FINAL handling; nothing in JournalPostingService touches the xtn family. External generic documents do not post journals and do not move stock."
  - "kb/topics/document-approval.md — there is no approval engine for any sales document; the page's review-and-approve workflow has no counterpart anywhere in the product."
  - "app.routing.ts / models/menu-items.ts — the settings sidebar offers exactly three entries (Application Settings, Default Selection, Printable Format Settings). 'Permission Management', 'Webhook' and 'Feature Visibility' have routes but no menu entry, so the page's Step 4 and Step 5 menu paths cannot be followed."
salvage: >
  Almost nothing. The one true observation in 3,555 lines is that the Default Selection screen sets
  a default branch and a default location (DEFAULT_BRANCH, DEFAULT_LOCATION) — and even that is
  generic to every applet built from this template. The three infographics are AI-generated
  (NotebookLM watermark) and illustrate features that do not exist; they go with the page.
to_rewrite: >
  Only if the applet is registered (Q-0060). It is not a sales invoice for external customers: it is
  a read-only listing over bl_fi_xtn_generic_doc_hdr — documents that originated outside BigLedger —
  reached through /core2/tnt/dm/erp/xtn/gen-doc/backoffice-ep, with a supplier-facing sibling
  endpoint (xtn/gen-doc/supplier-ep) and a "Matchings" concept that pairs those rows against internal
  generic documents (bl_fi_xtn_gen_doc_matching_line_link). Its production deploy target is
  s3://.../wavelet-erp/supplier-sales-invoice-applet/prod, which is the better clue to its intent
  than its repo name. A correct page would be written from the xtn family and the matching DCOs, and
  would say plainly that it neither posts nor moves stock. Readers who arrive looking for customer
  invoicing want /applets/sales-workflow/internal-sales-invoice-applet/.
---

The page text stays in place at `content/en/applets/sales-workflow/external-sales-invoice-applet.md`
with `draft: true`, per the worklog README's rule for the draft mechanism.

## What the page claimed, and what is true

| The page said | Source says |
|---|---|
| An applet for "billing external customers", installable and in daily use by sales reps and finance | No `bl_applet_hdr` row under any name or status. Nobody can install or open it. |
| Create an invoice from a Sales Order, Delivery Order, Quotation or Jobsheet ("multi-source creation", with a decision-tree infographic) | No knock-off, no document search, no source-document screen anywhere in the repo. |
| Line items, quantities, UOM, pricing tiers, discounts, rounding adjustments | The Lines tab is commented out. The create form has five controls, none of them an item. |
| SST / VAT / GST / WHT calculated on the document | No tax code, no tax field, no tax calculation in the applet. |
| Serial-number capture and tracking per line | The serial-number code is inside the commented-out create effect, inherited from Stock Conversion. |
| A draft → final review workflow, with finance finalising and the record locking | `onFinal()` dispatches an action no effect handles. The table it lists has no `posting_status` column. |
| GL posting on finalisation, revenue recognition, inventory reduction | `ExternalGenericDocumentService` has no posting path; the DCO has no signums; `JournalPostingService` never sees this family. Amount and quantity effects: none. |
| `Settings > Permission Management`, `Settings > Webhook` with On Create / On Finalize / On Delete triggers | Neither appears in the settings menu. The webhook route exists but is unreachable, and no trigger list of that shape exists. |
| "Internal Sales Invoice is for inter-company transactions (billing between branches or subsidiaries)" | Wrong twice over: `salesInvoiceApplet` is the ordinary customer invoice applet, and intercompany is a separate queue mechanism on top of it. |
| 302 numbered steps, FAQs, troubleshooting, best practices | Written for a product with a create screen. This applet has no working create screen. |

## Why this one is worth remembering

It is the clearest example yet of the failure mode the applet programme keeps meeting: a plausible
applet **name** was expanded into a full manual by analogy with a sibling applet, and nothing in the
3,555 lines was ever checked against the thing itself. The repo name (`external-sales-invoice`) is
also the least reliable fact about it — the code is a Stock Conversion clone, the data is external
generic documents, and the deployment target is `supplier-sales-invoice-applet`.
