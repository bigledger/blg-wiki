---
topic: custom-processor-applet
aliases: [custom processor, processor filter, custom processing queue, custom processing history, price tag sync history, ESL sync, De-Tag sync]
applets: [custom-processor-applet]
modules: [pos, inventory, ecommerce]
related: [generic-document-posting-status, internal-sales-invoice, internal-sales-order, pricing-scheme, pricebook-applet, external-integrations, job-processors]
wiki:
  - content/en/applets/sales-workflow/custom-processor-applet.md
status: growing
updated: 2026-09-05
---

# Custom Processor applet

A hand-off queue between BigLedger and an external processor. A Processor Filter names a sales document type, a company and a posting status; when a matching document becomes FINAL the backend creates a Custom Processing Queue row; an external integration reads the queue through the API, writes its result back and records a Processing History row. The applet also lists successful pushes of pricing-scheme changes to an electronic-shelf-label system (Price Tag Sync History).

## Facts

- 2026-09-05 — Registry `custom-processor-applet` ("Custom Processor Applet", TNT-USER, ACTIVE, no documentation_url). Repo `blg-applet-wavelet-custom-processor-applet`, project `micro-fe/projects/wavelet-erp/applets/custom-processor-applet`, route root `applet/tnt/wavelet/erp/custom-processor-applet`; menus Processor Filter / Processing Queue / Processing History / Price Tag Sync History. [src:planning/private/registry-applets-2026-09-05.tsv] [src:blg-applet-wavelet-custom-processor-applet/…/app.routing.ts] [src:…/models/menu-items.ts]
- 2026-09-05 — Filter form: Filter Code, Description, Server Doc Type (INTERNAL_SALES_ORDER / _RETURN / _DEBIT_NOTE / _CREDIT_NOTE / _INVOICE), Company (single), Posting Status (DRAFT | FINAL), Tenant Code (read-only), Status (ACTIVE | INACTIVE, create effect defaults ACTIVE). In view mode only Status and Description stay enabled. No reactive validators; DCO checks guid / company FK / audit / status / revision only; no `filter_code` uniqueness (DDL has no unique index). [src:…/processor-filter-create-main/processor-filter-create-main.component.ts L28-90] [src:…/effects/processor-filter.effects.ts L18-40] [src:blg-akaun-platform-java/javasdk/…/validator/erp/genericDocCustomProcessing/GenericDocCustomProcessingFilterDataConsistencyObject.java] [src:tenant-schemas/pcimage/tables/bl_fi/bl_fi_generic_doc_custom_processing_filter.sql]
- 2026-09-05 — Trigger: `GenericDocumentController` `PUT {docType}/update-posting-status/{guid}` (L319-382) and `POST {docType}/update-auto-final/backoffice-ep` (L3441-3479) call `GenericDocumentServiceForCustomProcessing` only when the response is 200 and the header's posting_status is FINAL. Lookup = tenant code + server doc type + document `guid_comp` + posting status + status ACTIVE, `Stream::findFirst`; inserts a `GENERIC_DOC_CUSTOM_PROCESSING_FILTER_PROCESSOR` event (2 retries, 10 s, RUN_NOW). [src:blg-akaun-platform-java/akaun-api/…/GenericDocumentController.java] [src:blg-akaun-platform-java/javasdk/…/customProcessing/GenericDocumentServiceForCustomProcessing.java L24-57]
- 2026-09-05 — `GenericDocCustomProcessingFilterProcessor` creates the queue row with filter guid/code, tenant code, gendoc guid, created_by zero-GUID; sets no processor/external columns and never changes the document. Queue DCO unique rule: tenant + company + processor_code + posting status + gendoc guid (`GENERIC_DOC_CUSTOM_PROCESSING_QUEUE__UNIQUE_CONSTRAINT_ALREADY_EXIST`). [src:blg-akaun-platform-java/akaun-api/…/jobProcessor/erp/genericDocCustomProcessing/GenericDocCustomProcessingFilterProcessor.java] [src:…/validator/erp/genericDocCustomProcessing/GenericDocCustomProcessingQueueDataConsistencyObject.java L64-80]
- 2026-09-05 — External processor API: queues `GET/PUT …/erp/generic-document/custom-processing/queues/{backoffice-ep|etl-ep}`, `PUT …/queues/custom-update-without-revision/etl-ep` (updates only external_process_status / external_process_error); histories `POST …/histories/backoffice-ep` and `POST …/histories/custom-creation/etl-ep`, PUT commented out (append-only). No BigLedger code writes processor_code / external_* / history rows. [src:…/controller/tenant/dm/erp/genericDocument/customProcessing/GenericDocCustomProcessingQueueController.java] [src:…/GenericDocCustomProcessingHistoryController.java] [src:…/dal/uow/erp/genericDocCustomProcessing/GenericDocCustomProcessingQueueUow.java L94-100]
- 2026-09-05 — Price tag sync: `GET …/erp/price-tag-sync-queues/initiate-triggers-for-de-tag-integration/backoffice-ep/query` installs `trg_after_insert_update_price_tag_sync` on `bl_fi_mst_pricing_scheme_link`; `PRICING_SCHEME_DE_TAG_SYNCING_PROCESSOR` (properties interval/username/password/company/store) gets a vendor token and calls `postToDeTag` per queue row: SYNCING_SKIPPED / SYNCING_SUCCESSFUL (history row created) / SYNCING_FAILED; `nfc_url` is a hard-coded URL (a real company's website) at service L30; `PRICING_SCHEME_DE_TAG_SYNCING_QUEUE_DELETE_PROCESSOR` purges queue rows older than 3 months. [src:…/controller/tenant/dm/erp/pricingScheme/PriceTagSyncQueueController.java] [src:…/jobProcessor/erp/PricingSchemeDeTagSyncingProcessor.java] [src:…/domain/erp/pricingScheme/PricingSchemeDeTagSyncingService.java] [src:…/dal/uow/erp/pricingScheme/PricingSchemeDeTagSyncingUow.java L99-103] [src:…/jobProcessor/erp/PricingSchemeDeTagSyncingQueueDeleteProcessor.java]
- 2026-09-05 — Settings: applet-local skeleton; DEFAULT_BRANCH / DEFAULT_LOCATION written to the applet container but read by nothing; Field Settings 8 unbound toggles, SAVE unwired; personal Default Selection never loads its container. 0 client-side perm defs; API perms `TNT_DM_ERP_GENERIC_DOC_CUSTOM_PROCESSING_{FILTER,QUEUE,HISTORY}_*`. [src:…/settings-container/default-settings/default-settings.component.ts] [src:…/settings-container/field-configuration/field-configuration.component.html] [src:…/personalization-container/personal-default-settings/personal-default-settings.component.ts L31-41] [src:blg-akaun-platform-java/javasdk/…/permissions/TntErpPermissionsV2.java L2844-2871] [src:akaun_master.bl_applet_client_side_perm_dfn]
- 2026-09-05 — Issues: none on the applet repo; wiki #49 tracking, #240 / #295 worklogs (first draft, screenshot = infographic). [src:gh:bigledger/blg-wiki#49]

## How it connects

- **generic-document-posting-status** — the FINAL transition (manual or auto-final) is the only trigger; DRAFT filters never fire.
- **internal-sales-invoice / internal-sales-order** (and return, debit note, credit note) — the five watched server doc types.
- **pricing-scheme / pricebook-applet** — pricing-scheme link inserts/updates feed the ESL sync queue.
- **external-integrations** — the processor that consumes the queue lives outside BigLedger (customer-specific); the applet is only its window.
- **job-processors** — `GENERIC_DOC_CUSTOM_PROCESSING_FILTER_PROCESSOR`, `PRICING_SCHEME_DE_TAG_SYNCING_PROCESSOR`, `PRICING_SCHEME_DE_TAG_SYNCING_QUEUE_DELETE_PROCESSOR`.

## Open questions

- Which external processors exist in production (processor_code values) — customer-specific, not in the platform repo.
- Is the DRAFT option on the filter form meant to work (would need a trigger on DRAFT saves)?
- Should the hard-coded NFC URL become a tenant/store setting?

## Wiki impact

- Five internal sales document pages: add `custom-processor-applet` to `related_applets` with the FINAL-trigger sentence.
- `master-data/pricebook-applet`: mention the price-tag sync trigger and history.
- `finance/general-ledger-applet`: no dependency on this applet (old page claimed one).
