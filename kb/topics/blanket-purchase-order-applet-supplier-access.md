---
topic: blanket-purchase-order-applet-supplier-access
aliases: [BPO supplier access, blanket purchase order supplier portal, supplier blanket agreement view]
applets: [blanketPurchaseOrderAppletSupplierAccess]
modules: [purchasing]
related: [blanket-purchase-order-applet, supplier-login-access, internal-purchase-order-applet, supplier-delivery-order-applet, printable-format]
wiki:
  - content/en/applets/purchase-workflow/blanket-purchase-order-applet-supplier-access-applet.md
status: growing
updated: 2026-09-06
---

# Blanket Purchase Order Supplier Access applet

The supplier-facing copy of the Blanket Purchase Order applet, installed in the buyer's tenant. A login linked to a supplier entity lists the blanket agreements raised on that entity, opens them read-only, exports a PDF and runs two supplier-scoped reports. It writes nothing: the create screen is unreachable and every save/delete control is commented out or hard-disabled.

## Facts

- 2026-09-06 — Registry: `blanketPurchaseOrderAppletSupplierAccess` "Blanket Purchase Order Supplier Access", TNT-USER, ACTIVE, created 2022-07-05, no documentation_url. Repo `blg-applet-wavelet-blanket-purchase-order-applet-supplier-access` @d47eca4 (2026-07-30); shared-utilities submodule pinned @f9e5782 (empty checkout in refs/). Internal route base `applets/akaun/staging/blanket-purchase-order-supplier-access-applet` — the only applet in the family whose route base names an environment; `bin/prod/` does contain a production publish script. [src:planning/private/registry-applets-2026-09-05.tsv] [src:.../src/app/app.routing.ts] [src:.../micro-fe/bin/prod/blanket_purchase_order_applet_supplier_access_publish.sh]
- 2026-09-06 — Scope mechanism (whole supplier-access family): `GenericDocumentUow.generateSqlForUserEntity` appends `WHERE hdr.doc_entity_hdr_guid IN (SELECT entity_hdr_guid FROM bl_fi_mst_entity_login_subject_link WHERE status='ACTIVE' AND subject_guid = <login>)` and maps rows with `rowMapper_withoutPermChecking`. The controller comment is explicit: "no permission checking is required because only those rows belonging to the user are returned". [src:blg-akaun-platform-java/javasdk/.../GenericDocumentUow.java L2180-2240] [src:blg-akaun-platform-java/akaun-api/.../GenericDocumentController.java L1768-1795]
- 2026-09-06 — The supplier-side write path exists in the backend but is not used here: `PUT /{docType}/login-entity-ep` authorises with `UserPermissionService.isUserLoginEntity(subject, doc_entity_hdr_guid)` — which, unlike the read SQL, does **not** require the link to be `ACTIVE` — stamps `updated_by_subject_login_guid`, writes an `AppletAuditTrailService` UPDATED row, and runs the normal DCO update validation. There is no POST equivalent for login-entity. [src:blg-akaun-platform-java/akaun-api/.../GenericDocumentController.java L2811-2865] [src:blg-akaun-platform-java/javasdk/.../UserPermissionService.java L521-540]
- 2026-09-06 — This applet's ts-lib service overrides only two calls with `login-entity-ep` (`getSupplierAccess` = `/login-entity-ep/query`, `printJasperPdf` = `/print-jasper-pdf/login-entity-ep/{guid}`). Its inherited `post`/`put`/`getByGuid`/`delete` hit the plain back-office path, which is permission-checked (`checkDocPermsOnCreate`, `handler.readPerm`, `handler.updatePerm`). The NgRx effects wire all four, but no reachable control dispatches them. [src:blg-akaun-ts-lib/.../blanket-supplier-access-services/blanket-purchase-order.service.ts] [src:.../store/effects/blanket-purchase-order.effects.ts L30-232]
- 2026-09-06 — Dead controls: listing Create button and detailed-report Create button commented out (so view-column index 3, the Create screen, is never navigated to); view header RESET/Print/Save commented out; view DELETE `disabled="true"`; Edit Line Item SAVE commented out and its DELETE disabled; Add Line Item's ADD only calls `viewColFacade.addViewLineItem` (browser-side view cache, no persistence); Export as CSV/DOCX/ZIP disabled. [src:.../blanket-purchase-order-listing.component.html L10-14] [src:.../blanket-purchase-order-detailed-report.component.html L10-14] [src:.../blanket-purchase-order-view.component.html L13-17,L47] [src:.../blanket-purchase-order-view-edit-line-item.component.html L13,L28] [src:.../blanket-purchase-order-view-add-line-item.component.ts onAdd]
- 2026-09-06 — Settings are applet-local, not the shared FieldConfigurationComponent: `app.routing.ts` binds `field-settings` to `./components/settings-container/field-configuration`. That screen is a mock — 8 slide toggles with no `formControlName` and a SAVE button with no `(click)` — so gates.py/applet-scan.sh do not apply to this applet. The working screen is the applet-local **Application Settings**: 11 `HIDE_*` listing-column toggles, declared in `AppletSettings`, rendered with `[formControl]`, persisted through `SessionActions.saveMasterSettingsInit` (merged into `bl_applet_ext.APPLET_SETTINGS`), consumed in the listing's `ngOnInit` — four proofs each. Applied once per screen open, so a change needs a reopen. [src:.../settings-container/field-configuration/field-configuration.component.html] [src:.../settings-container/application-settings/application-settings.component.ts] [src:blg-shared-utilities/modules/session/session-controller/effects/session.effects.ts saveMasterSettings$]
- 2026-09-06 — `getUserSettings` resolves `masterSettings` with `?? {}`, so a tenant that has never saved Application Settings gets an empty object, every `HIDE_*` is undefined, and all 11 columns show. No crash. [src:blg-shared-utilities/.../session.effects.ts L298] [src:.../reducers/session.reducers.ts L41]
- 2026-09-06 — PDF export passes a hard-coded printable-format GUID and `BLANKET_PURCHASE_ORDER_JASPER_PRINT_SERVICE` with a `TODO: Remove hardcoded value after UAT` comment; the applet's own Printable Format Settings screen has no effect on the output. [src:.../store/effects/blanket-purchase-order.effects.ts printJasperPdf$]
- 2026-09-06 — Listing enrichment: five per-row calls (company, branch, location, `TenantUserProfileService.getProfileName`, and the entity named in the `PURCHASE AGENT` ext row), each with `catchError(err => of(err))` and the error **code** written into the cell. A supplier login without master-data read rights sees error codes in Company / Branch Code / Purchaser / Created By. [src:.../blanket-purchase-order-listing.component.ts getRowsFactory]
- 2026-09-06 — Report SQL (`BlanketPurchaseOrderReportUow.generateSqlBpoLoginEntity`) joins agreement lines to `bl_fi_generic_doc_link` and the drawn-down `INTERNAL_PURCHASE_ORDER` lines, returning qty, unit price, `po_qty = link.quantity_contra`, `outstanding_qty` and `outstanding_amt`; default `LIMIT 500`; filtered by the same entity-login subquery; `category` comes from `bl_fi_mst_label_hdr` linked to the supplier's login subject. [src:blg-akaun-platform-java/javasdk/.../BlanketPurchaseOrderReportUow.java L114-240]
- 2026-09-06 — Document type: `INTERNAL_BLANKET_PURCHASE_ORDER` (server = client), amount signum 0, quantity signum 0 — no journal, no stock. The path segment is `internal-custom-internal-blanket-purchase-orders`. [src:blg-akaun-platform-java/javasdk/.../InternalCustomInternalBlanketPurchaseOrderDataConsistencyObject.java] [src:.../GenericDocumentTypeHandler.java L542-556,L910]
- 2026-09-06 — `bl_applet_client_side_perm_dfn` has **0 rows** for this applet code (and 0 for `InternalShoppingCartCustomerAccess`), against ~20 `SHOW_*` line-column codes for each of the five internal-purchase supplier-access applets. [src:akaun_master.bl_applet_client_side_perm_dfn]
- 2026-09-06 — Line Items grid defects: the **Unit Price** column is bound to `quantity_base` and formats `(amount_net + amount_discount) / quantity_base` (zero quantity ⇒ Infinity/NaN); the **Valid Date** header is bound to `category`. [src:.../blanket-purchase-order-create-line-items.component.ts L50-62]

## How it connects

- **blanket-purchase-order-applet** — same rows, buyer side; every write happens there.
- **supplier-login-access** — `bl_fi_mst_entity_login_subject_link` is the whole access model for this applet family; the same link governs Supplier Delivery Order and the five internal-purchase supplier-access applets.
- **internal-purchase-order-applet** — the knock-off links it creates are what the detailed report's PO Qty / Balance Qty columns read.
- **printable-format** — the hard-coded GUID in the print effect is the reason the applet's printable-format screen is inert.

## Open questions

- Was this applet intended to be read-only, or were the create/save controls commented out temporarily? Two GitHub issues (Angular 14 migration, applet split) say nothing either way.
- Is the hard-coded printable-format GUID valid on any live tenant, or does the export fail everywhere?

## Wiki impact

- Page rewritten 2026-09-06: create flow removed, read-only nature stated, Application Settings table added, Field Settings documented as a mock, printable-format defect documented.
- The buyer-side page should mention that the supplier copy exists and is read-only (it already links to it).
