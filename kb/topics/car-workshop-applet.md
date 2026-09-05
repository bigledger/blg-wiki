---
topic: car-workshop-applet
aliases: [car workshop, workshop consultation, ASV consultation, bl_asv_consultation_hdr, carWorkshopApplet]
applets: [carWorkshopApplet]
modules: [crm-digital, financial-accounting]
related: [internal-jobsheet-applet, internal-sales-quotation-applet, internal-sales-invoice-applet, internal-purchase-invoice-applet, internal-receipt-voucher-applet, customer-maintenance, membership-admin-applet, vehicle-master]
wiki:
  - content/en/applets/sales-workflow/car-workshop-applet.md
status: growing
updated: 2026-09-05
---

# Car Workshop Applet

A vehicle-service case ("consultation") with requests, three inspection checklists with photos, a vehicle link, and tabs that spawn the financial documents (quotation, jobsheet, purchase invoice, sales invoice, receipt voucher) and link them back to the case. The consultation itself posts nothing.

## Facts

- 2026-09-05 — Registry: `carWorkshopApplet`, "Car Workshop Applet", TNT-USER, ACTIVE, created 2024-09-10; `documentation_url` points at a Confluence page, not the wiki. Zero client-side perm defs seeded. [src:planning/private/registry-applets-2026-09-05.tsv] [src:akaun_master.bl_applet_client_side_perm_dfn]
- 2026-09-05 — The consultation is an ASV table (`bl_asv_consultation_hdr` + request/checklist/detail/image lines + `bl_asv_consultation_gendoc_hdr_link`), served by `consultation-hdrs/backoffice-ep` (temp create, create, update, delete, query). Not a generic document: no signums, no posting. `posting_status` is a free label OPEN/CLOSE/DRAFT; record status TEMP→ACTIVE on first save; `consultation_running_no` assigned on creation by the DCO from `CONSULTATION_RUNNING_NO`. [src:javasdk/…/AsvConsultationHdrDataConsistencyObject.java#L185-L200] [src:akaun-api/…/AsvConsultationHdrController.java#L51-L155] [src:…/main-details.component.ts#L52-L56] [src:…/consultation-create-edit.component.ts#L335-L346]
- 2026-09-05 — **Field Settings is a stub**: `settings/field-settings` routes to the applet's own `FieldConfigurationComponent` — 50 lines of unbound `<mat-slide-toggle>` and an empty class. Only Default Selection (`DEFAULT_BRANCH`, `DEFAULT_LOCATION`, `DEFAULT_COMPANY`, `CONSULTATION_DETAILS_TAB_ORDER`) and Checklist Settings persist anything. [src:…/app.routing.ts#L3] [src:…/settings-container/field-configuration/field-configuration.component.{ts,html}] [src:…/default-settings.component.ts#L94-L112]
- 2026-09-05 — The embedded document forms (copies of jobsheet/quotation/SI/PI/RV components) read 146 setting keys from master settings under `appletCode = carWorkshopApplet` (240 declared across two models); gating-aware census against the shared template says 146 would be rendered for this code if the shared screen were used — but it is not routed. So they are API-only. [src:kb census 2026-09-05 (scratchpad cw-census.txt)] [src:…/app.component.ts#L67]
- 2026-09-05 — Documents saved from the Quotation/JobSheet/Purchases/Sales Invoice/Receipt tabs post an `AsvConsultationGenDocHdrLink` (consultation_guid, gen_doc_hdr_guid, server_doc_type); tab listings filter by `consultation_guids` + `server_doc_type`. Changing the consultation's vehicle rewrites `vehicle_registration_no` / `vehicle_hdr_guid` on every linked document (`changeGenDocsVehicle$`). [src:…/internal-jobsheet.effects.ts#L42-L46,L338-L346] [src:…/consultation.effects.ts#L114-L175]
- 2026-09-05 — Checklist types `PRE-INSPECTION`, `SAFETY`, `QUALITY-CONTROL`; each has Details (date, technician, status required), Car Condition (image + position FRONT/BACK/LEFT/RIGHT + description), Checklist (tick lines from predefined `bl_asv_checklist_hdr/line`; name required, max 255). [src:…/consultation-checklist/**] [src:…/checklist-create.component.ts#L96] [src:tenant-schemas bl_asv/*.sql]
- 2026-09-05 — Vehicle = `bl_fi_mst_entity_vehicle_hdr` (owned by an entity; regnum, brand/model/variant/engine, year, chassis/engine no, capacity, colour, mileage, road-tax/insurance/permit/inspection dates); the workshop form requires plate, model and engine capacity only. [src:akaun-api/…/EntityVehicleController.java] [src:…/select-vehicle/vehincle-create-edit.component/main-details/main-details.component.ts]
- 2026-09-05 — Consultation delete is a row delete (`AsvConsultationHdrUow.delete`); linked documents survive. No webhook topic for ASV tables. [src:javasdk/…/AsvConsultationHdrUow.java#L69-L81]
- 2026-09-05 — Issues/commits: race condition on create consultation (#5, fixed); open enhancement list (#2); Angular 14 migration (#6). [src:gh:bigledger/blg-applet-wavelet-car-workshop-applet#5]
- 2026-09-05 — The previous wiki page (467 lines) invented manager/finance "playbooks", approval flows and "tenant-dependent" settings; replaced. [src:git:blg-wiki@d380b240]

## How it connects

- **internal-jobsheet-applet** — same `INTERNAL_JOBSHEET` document; the workshop embeds a full copy of the jobsheet UI.
- **internal-sales-quotation-applet / internal-sales-invoice-applet / internal-purchase-invoice-applet / internal-receipt-voucher-applet** — spawned from tabs and linked by `bl_asv_consultation_gendoc_hdr_link`.
- **vehicle-master** — `entity-vehicle-hdrs` is shared with other vehicle-aware applets (driver/vehicle links exist in the backend).
- **membership-admin-applet** — member card on the consultation.

## Open questions

- Is the Field Settings stub intentional (settings meant to be managed in the standalone applets) or unfinished? If intentional, which appletCode should the embedded documents read — today it is `carWorkshopApplet`, so standalone settings do not apply.
- Should a workshop tenant expect `CONSULTATION_RUNNING_NO` to be seeded automatically?

## Wiki impact

- `internal-jobsheet-applet` (lane 1, queued): state that Car Workshop embeds the same document type and links jobsheets to consultations.
- `finance/internal-receipt-voucher-applet`, `finance/internal-purchase-invoice-applet` (other lanes): add `car-workshop-applet` to `related_applets`.
- Registry: `documentation_url` for `carWorkshopApplet` should be switched from Confluence to `/applets/sales-workflow/car-workshop-applet/`.
- All 15 screenshots under `static/images/car-workshop-applet/` carry person names, e-mails or vehicle brand names — re-capture with synthetic data before embedding.
