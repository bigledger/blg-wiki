---
topic: driver-delivery-order-applet
aliases: [driver DO, driver delivery order, delivery driver listing]
applets: [driverDeliveryOrderApplet]
modules: [inventory]
related: [internal-outbound-delivery-order-applet, internal-delivery-order, supplier-delivery-order, delivery-installation, stock-availability, delivery-driver-assignment]
wiki:
  - content/en/applets/inventory-workflow/driver-delivery-order-applet.md
status: growing
updated: 2026-09-05
---

# Driver Delivery Order applet

A driver's listing of the internal outbound delivery orders assigned to them (header `delivery_driver_guid` = the driver's login subject), with an edit screen for vehicle number, delivery date and a morning/afternoon/evening time slot. Read-only lines. No create, final, void or discard.

## Facts

- 2026-09-05 — Registry: `driverDeliveryOrderApplet` "Driver Delivery Order Applet", TNT-USER, ACTIVE, documentation_url → /applets/inventory-workflow/driver-delivery-order-applet/ (current path). Repo blg-applet-wavelet-driver-delivery-order-applet, last commit 385299a 2026-04-24. [src:planning/private/registry-applets-2026-09-05.tsv] [src:git log]
- 2026-09-05 — Route path `applet/tnt/wavelet/erp/driver-delivery-order-applet`; one listing route `driver-delivery-order-listing` (SalesInvoiceContainerComponent); settings routes default-selection, field-settings (shared FieldConfigurationComponent), custom-status, webhook, feature-visibility, permission-* listings, release-notes, applet-log; personalization personal-default-selection, sidebar. [src:.../app.routing.ts]
- 2026-09-05 — Settings menu lists `printable-format-settings` and `email-template` with no matching route → 404. Release notes are a static page (v1.00 2024-08-06 "Support forex currency"); applet-log renders only an "Audit Trail" heading. [src:.../models/menu-items.ts] [src:.../settings-container/release-notes/release-notes.component.html] [src:.../settings-container/applet-log/applet-log.component.html]
- 2026-09-05 — The search effect always sets `searchDto.delivery_driver_guids = [localStorage 'guid']` (the login guid set by the auth applet) before calling `InternalOutboundDeliveryOrderService.getBySnapshotCustomHdrLinesQuery`; the backend applies `AND hdr.delivery_driver_guid IN (:delivery_driver_guids)`. [src:.../state-controllers/sales-invoice-controller/store/effects/sales-invoice.effects.ts L635] [src:blg-akaun-platform-java/javasdk/.../GenericDocumentUow.java L684,L2835] [src:.../GenericDocumentQueryCriteria.java L53]
- 2026-09-05 — `bl_fi_generic_doc_hdr.delivery_driver_guid` is a FK to `app_login_subject(guid)`; `delivery_driver_code` is indexed. Copied from source to target on document link/conversion (GenericDocLinkService L654-655). A "Delivery Driver" picker (EntityDriverLinkService → bl_fi_mst_entity_driver_link) exists in the Supplier Delivery Order applet's Main Details; none found in the internal outbound delivery order / delivery order processing repos. [src:tenant-schemas/pcimage/tables/bl_fi/bl_fi_generic_doc_hdr.sql] [src:blg-akaun-platform-java/javasdk/.../GenericDocLinkService.java L654] [src:blg-applets-wavelet-erp-v3/.../supplier-delivery-order-applet/.../select-delivery-driver.component.ts]
- 2026-09-05 — Listing columns: Doc Short Code (OBDODR), Doc No, Status, Branch, Currency, Location, Customer Name, Tracking Id, Created/Modified Date, Transaction Date, Created/Modified by. Advanced search: branch (read-permission targets), sales agent, creation/transaction/est-delivery date ranges, status ACTIVE/INACTIVE, order by; posting-status filter commented out. No add button; `onAdd()` and the create page exist but are unreachable. [src:.../sales-invoice-listing.component.ts L141-231] [src:.../sales-invoice-listing.component.html] [src:.../models/advanced-search-models/internal-sales-invoice.model.ts L82-110]
- 2026-09-05 — Edit screen: SAVE only (FINAL/DISCARD/VOID/CLOSE commented out); DELETE when applet ext APPLET_SETTINGS.value_json.SHOW_DOCUMENT_DELETE_BUTTON and posting_status != FINAL (two-click confirm). SAVE disabled unless UPDATE permission or TNT_TENANT_ADMIN/OWNER and the form (company/branch/location required) is valid. [src:.../sales-invoice-edit.component.html] [src:.../sales-invoice-edit.component.ts L166-205, L295-328]
- 2026-09-05 — Main Details fields → columns: Vehicle No → vehicle_registration_no; Delivery Date → delivery_date_expected; Delivery time slot (morning/afternoon/evening) → track_delivery_remarks; Account read-only from doc_entity_hdr_json.entityName. [src:.../main-details.component.html] [src:.../draft-controller/store/reducers/hdr.reducers.ts L42-44]
- 2026-09-05 — Consumed settings: DEFAULT_POSTING_STATUS (ALL/DRAFT/FINAL/VOID/DISCARDED; unset → no filter), SORT_ORDER (unset → updated_date), HIDE_GENDOC_SAVE_BUTTON, HIDE_CREATED_BY_DETAILS, HIDE_DELIVERY_LOCATION (true also blanks Account + time slot — main-details L224-233), HIDE_TOTAL_DISCOUNT_AMOUNT, DEFAULT_BRANCH/LOCATION/COMPANY, personal DEFAULT_BRANCH/LOCATION/DEFAULT_TOGGLE_COLUMN. Rendered-not-consumed: HIDE_GENDOC_FINAL/DISCARD/VOID_BUTTON, HIDE_CLOSE_BUTTON, ENABLE_SERIAL_NUMBER_VALIDATION_FINAL, PRINTABLE, DISABLE_GEN_DOC_LISTING, all Custom Status keys (hdr reducer writes custom_status: null), ~50 other shared-screen toggles. [src:.../applet-settings.model.ts] [src:blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html L944-961] [src:kb/tools/applet-scan.sh output]
- 2026-09-05 — Permissions: server-side TNT_API_DOC_INTERNAL_OUTBOUND_DELIVERY_ORDER_{CREATE,READ,UPDATE,DELETE}_TGT_GUID (GenericDocumentTypeHandler L121-128; TntErpPermissions L1051-1090). Client-side codes checked (SHOW_GENDOC_FINAL/DISCARD/VOID_BUTTON, SHOW_TRANSACTION_DATE) — zero rows seeded in bl_applet_client_side_perm_dfn for this applet. [src:akaun_master.bl_applet_client_side_perm_dfn] [src:.../sales-invoice-listing.component.ts L295-303]
- 2026-09-05 — Posting: INTERNAL_OUTBOUND_DELIVERY_ORDER amount signum 0, quantity signum 0 (InternalOutboundDeliveryOrderDataConsistencyObject L16-17); no JournalPostingTypeHandler entry → no journal; no stock movement; open DO lines counted as do_qty in StockAvailabilityUow L1005-1008; FINAL-time checks in GenericDocumentService: blacklisted customer (L1650), serial count = qty (L1858), signum-zero serial/stock checks when flags set (L1858-1860, L2083-2092). [src:blg-akaun-platform-java/javasdk/...]
- 2026-09-05 — Issues: repo split fix (repo#1, 2025-12), Angular 14 migration (repo#2, 2026-04), Sub Query Remove for this applet (gt#6488, 2026-08), applet task with commit "upgrade license and delivery_driver_code in hdr" (gt#6157, 2026-04), user-guide tracking issue (wiki#57; old URL /applets/driver-delivery-order-applet/ → alias added). [src:gh:bigledger/blg-applet-wavelet-driver-delivery-order-applet#1] [src:gh:bigledger/blg-applet-wavelet-driver-delivery-order-applet#2] [src:gh:bigledger/blg-int-general-task#6488] [src:gh:bigledger/blg-int-general-task#6157] [src:gh:bigledger/blg-wiki#57]

## How it connects

- **delivery-driver-assignment** — the applet is useless until `delivery_driver_guid` is set on the delivery order; the only picker found is in Supplier Delivery Order (entity driver link → login subject). Where an *internal* outbound DO gets its driver is not established from the current repos.
- **internal-outbound-delivery-order-applet** — same document, full applet; FINAL/VOID happen there.
- **stock-availability** — open DO quantity appears as committed (`do_qty`); this applet never changes it.
- **delivery-installation** — separate trip/job model; does not read `delivery_driver_guid`.

## Open questions

- Which applet sets `delivery_driver_guid` on an internal outbound delivery order today (no picker in blg-applet-wavelet-internal-outbound-delivery-order-applet or -processing-applet)? Possibly the mobile driver app or an older monorepo build.
- Does the backend accept header edits (vehicle no, delivery date, time slot) on a FINAL outbound delivery order? No blocking rule found in GenericDocumentService at 871dbf5c96; not proven either way.
- What reads `DEFAULT_TOGGLE_COLUMN` (shared layout?).

## Wiki impact

- sales-workflow/internal-delivery-order-applet and internal-outbound-delivery-order-applet (lane 1): add a "Delivery driver" note — the header field `delivery_driver_guid` drives the Driver Delivery Order applet; document where it is set; add driver-delivery-order-applet to related_applets.
- purchase-workflow/supplier-delivery-order-applet (lane 3): its Delivery Driver picker is the reference implementation (entity driver link); note that supplier DOs do not appear in the Driver Delivery Order applet.
- Product: the Custom Status screen, Printable Format Settings and Email Template menu entries in this applet do nothing / 404 — candidates for removal.
