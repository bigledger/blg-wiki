---
topic: internal-purchase-order-applet
aliases: [purchase order, PO, INTERNAL_PURCHASE_ORDER, PO replenishment, PO approval]
applets: [internalPurchaseOrderApplet]
modules: [purchasing, inventory]
related: [internal-purchase-requisition-applet, internal-purchase-grn-applet, internal-purchase-invoice-applet, blanket-purchase-order-applet, internal-purchase-quotation-applet, supplier-delivery-order-applet, internal-sales-order-applet, knock-off, approval-workflow, stock-replenishment, intercompany]
wiki:
  - content/en/applets/purchase-workflow/internal-purchase-order-applet.md
status: growing
updated: 2026-09-05
---

# Purchase Order (Internal)

The commitment-to-buy document. Amount and quantity signum are both 0, so FINAL posts nothing to GL or stock; it only opens the lines for knock-off by GRN, supplier DO, purchase invoice and the purchase notes. Approval, requisition-first policy, replenishment and intercompany mirroring hang off it.

## Facts

- 2026-09-05 — Registry: code `internalPurchaseOrderApplet`, name "Purchase Order (Internal)", ACTIVE; documentation_url already points at the wiki page. [src:planning/private/registry-applets-2026-09-05.tsv]
- 2026-09-05 — `AppletConstants`: `INTERNAL_PURCHASE_ORDER`, amount_signum 0, quantity_signum 0. Backend DCO agrees (0 / 0). [src:blg-applet-wavelet-internal-purchase-order-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-order-applet/src/app/models/constants/applet-constants.ts] [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalPurchaseOrderDataConsistencyObject.java]
- 2026-09-05 — 17 sidebar menus (Purchase Order, Line Items, PO Line with GRN KO, PO Line with PI KO, Closed Queue KO, Purchase Order Queue, Multi-PO, PO Replenishment group ×3, File Import, Intercompany, File Export, Approval Request, Approval History, PO Free Gift, Audit Trail); 14 `HIDE_…_MENU` / `SHOW_PO_FREE_GIFT_MENU` keys, each overridable by a `SHOW_…_MENU` client-side permission in `app.component.ts`. [src:…/src/app/models/menu-items.ts] [src:…/src/app/app.component.ts]
- 2026-09-05 — Settings menus beyond the common set: Workflow Settings (Process Code, Server Doc Type, Company), Email Template, Branch Designation (employee → Designation, Approval Level, Approval Rank per branch), Approval Settings (code, name, server doc type, submitter designation, approver designation, min/max amount, required levels, levels configuration, logic, quorum), Approval Monitor (From/To Server Doc Type, Is Document Conversion Required, Remarks), Custom Resource Bundle Configuration, Custom Field Placement, Spreadsheet View configuration. [src:…/src/app/components/settings-container/]
- 2026-09-05 — Default Selection stores `DEFAULT_BRANCH/LOCATION/COMPANY`, `DEFAULT_VALIDITY_DAYS`, `DEFAULT_DECIMAL_PRECISION`, `DEFAULT_DECIMAL_STEP`, `DEFAULT_CURRENCY`, `DEFAULT_PRICING_SCHEME`, `DEFAULT_LANGUAGE_CODE`, `PURCHASE_ORDER_DETAILS_TAB_ORDER` (15 tabs incl. Search Document, KO For, Delivery Details, Events, Generic Doc Approval). [src:…/components/settings-container/default-settings/default-settings.component.ts]
- 2026-09-05 — ~200 settings keys read (incl. PO-only: `LOCK_PURCHASER_TO_CURRENT_USER`, `SHOW_BUDGET`, `DISABLE_LINES_FOLLOWING_HDR_BUDGET`, `ENABLE_MULTIPLE_KO`, `SHOW_ITEM_STOCK_BALANCE` — which also switches on stock-balance validation at FINAL — `HIDE_CLOSE_BUTTON`, `ENABLE_PRINT_FINAL_GEN_DOC_ONLY`, free-gift keys). A commented-out POS effects file references `DISABLE_AUTO_POSTING`, `POS_THEME`, `REGEX`, `ITEMCODE_LENGTH` — dead code. [src:…/src/app/components] [src:…/state-controllers/pos-controller/store/effects/pos.effects.ts]
- 2026-09-05 — CLOSE = fetch the document, set every line `qty_open = 0`, PUT it, and delete its open-queue rows (`openQueueService.deleteByGendocHdrGuid`); toast *Failed to close purchase order* on error. [src:…/state-controllers/purchase-order-controller/store/effects/purchase-order.effects.ts]
- 2026-09-05 — FINAL is not gated by approval in the UI (`showFinal()` checks lock, ACTIVE status and DRAFT posting status only). Submit on the Generic Doc Approval tab calls the conversion-monitor check for PR → PO; failure text *Purchase Order needs to be converted from Purchase Requisition*. Backend: `GenericDocApprovalConversionMonitorCheckingService` reads `bl_fi_generic_doc_approval_conversion_monitor.is_document_conversion_required` and looks for a `bl_fi_generic_doc_link` from the source type. [src:…/purchase-order-edit.component.ts] [src:…/generic-doc-approval/submit-approval/submit-approval.component.ts] [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/genericDocument/approval/GenericDocApprovalConversionMonitorCheckingService.java]
- 2026-09-05 — Create KO For sources: Blanket Purchase Order, Purchase Quotation, Purchase Requisition; edit Search Document adds Purchase Order. Backend converter `PurchaseRequisitionToPurchaseOrderConverter` exists. [src:…/purchase-order-create/import-knock-off/] [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/genericDocument/genericDocumentConverter/PurchaseRequisitionToPurchaseOrderConverter.java]
- 2026-09-05 — Intercompany pairs `INTERNAL_PURCHASE_ORDER` ↔ `INTERNAL_SALES_ORDER` (both signums 0). [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/intercompany/IntercompanyProcessingService.java]
- 2026-09-05 — 130 client-side permissions seeded for this applet (menus, buttons, header fields, pricing columns, ARAP, `PO_ALLOW_BACKDATE_TRANSACTION`, `EDIT_CURRENCY_RATE`, `ALLOW_LINE_ITEM_EDIT`, `ALLOW_SELL_BELOW_*`, `VALIDATE_STOCK_BALANCE`). Six menu `SHOW_…` perms checked in code are not seeded. [src:akaun_master.bl_applet_client_side_perm_dfn]
- 2026-09-05 — Replenishment: Template (item filters, manual min/max/reorder, Fulfill Option) → Events (cycle, recurring, Action Logic) → Runs (per-item company/location balances, reserved, in-transit, open PO, SO in queue, last-30-day sales, reorder calculation, "Recommend AI", requested/approved qty, generated POs). [src:…/components/stock-replenishment-*-container/]
- 2026-09-05 — Issues: group-item rendering fix (gh:bigledger/blg-int-general-task#4785); printable pop-up moved from a fixed delay in onFinal to the FINAL-success effect (#3874, #3714); PO import wrong-column check (gh:bigledger/blg-akaun-platform-java#1556). Applet repo has no issues.

## How it connects

- **knock-off** — the open queue is the PO's only "posting"; GRN / supplier DO / PI / PDN / PCN consume it; CLOSE empties it.
- **approval-workflow** — Approval Settings + Branch Designation + Workflow Settings; Approval Monitor adds the requisition-first rule.
- **internal-purchase-grn-applet** — next in my queue; should describe knock-off against PO open queue and the PO Line with GRN KO report from the GRN side.
- **internal-sales-order-applet** — intercompany mirror (other lane).
- **stock-replenishment** — generates POs; reads `Location Qty Open Purchase Order`.

## Open questions

- Does the backend enforce approval before FINAL for any tenant (workflow lock), or is it purely a UI convention (hide FINAL)? Not found in the applet; not searched in `GenericDocApprovalService`.
- `SHOW_ITEM_STOCK_BALANCE` doubling as "validate stock balance on FINAL" for a PO looks accidental — worth a product check.

## Wiki impact

- Page rewritten. Sales Order (Internal) page should cross-link. GRN pages (next) should link back and describe the KO report.
