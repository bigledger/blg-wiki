---
title: "Custom Processor Applet"
description: "Hand-off queue for external integrations: Processor Filters pick FINAL sales documents of a given type and company, the backend queues them for an external processor, and the applet shows the queue, the processing history and the price-tag (electronic shelf label) sync history."
applet_code: "custom-processor-applet"
applet_repo: "blg-applet-wavelet-custom-processor-applet"
modules: [pos, inventory, ecommerce]
related_applets: [internal-sales-invoice-applet, internal-sales-order-applet, internal-sales-return-applet, internal-sales-debit-note-applet, internal-sales-credit-note-applet, pricebook-applet, organisation-applet]
guides: []
sources:
  configuration:
    - blg-applet-wavelet-custom-processor-applet/micro-fe/projects/wavelet-erp/applets/custom-processor-applet/src/app/app.routing.ts
    - blg-applet-wavelet-custom-processor-applet/micro-fe/projects/wavelet-erp/applets/custom-processor-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-custom-processor-applet/micro-fe/projects/wavelet-erp/applets/custom-processor-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-custom-processor-applet/micro-fe/projects/wavelet-erp/applets/custom-processor-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-custom-processor-applet/micro-fe/projects/wavelet-erp/applets/custom-processor-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-custom-processor-applet/micro-fe/projects/wavelet-erp/applets/custom-processor-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-wavelet-custom-processor-applet/micro-fe/projects/wavelet-erp/applets/custom-processor-applet/src/app/components/settings-container/field-configuration/field-configuration.component.ts
    - blg-applet-wavelet-custom-processor-applet/micro-fe/projects/wavelet-erp/applets/custom-processor-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-applet-wavelet-custom-processor-applet/micro-fe/projects/wavelet-erp/applets/custom-processor-applet/src/app/resolver/permission.resolver.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/permissions/TntErpPermissionsV2.java
  fields:
    - blg-applet-wavelet-custom-processor-applet/micro-fe/projects/wavelet-erp/applets/custom-processor-applet/src/app/components/processor-filter-container/processor-filter-create/processor-filter-create-main/processor-filter-create-main.component.html
    - blg-applet-wavelet-custom-processor-applet/micro-fe/projects/wavelet-erp/applets/custom-processor-applet/src/app/components/processor-filter-container/processor-filter-create/processor-filter-create-main/processor-filter-create-main.component.ts
    - blg-applet-wavelet-custom-processor-applet/micro-fe/projects/wavelet-erp/applets/custom-processor-applet/src/app/components/processor-filter-container/processor-filter-create/processor-filter-create.component.html
    - blg-applet-wavelet-custom-processor-applet/micro-fe/projects/wavelet-erp/applets/custom-processor-applet/src/app/components/processor-filter-container/processor-filter-listing/processor-filter-listing.component.ts
    - blg-applet-wavelet-custom-processor-applet/micro-fe/projects/wavelet-erp/applets/custom-processor-applet/src/app/components/processor-queue-container/processor-queue-listing/processor-queue-listing.component.ts
    - blg-applet-wavelet-custom-processor-applet/micro-fe/projects/wavelet-erp/applets/custom-processor-applet/src/app/components/processor-history-container/processor-history-listing/processor-history-listing.component.ts
    - blg-applet-wavelet-custom-processor-applet/micro-fe/projects/wavelet-erp/applets/custom-processor-applet/src/app/components/price-tag-history-container/price-tag-history-listing/price-tag-history-listing.component.ts
    - blg-applet-wavelet-custom-processor-applet/micro-fe/projects/wavelet-erp/applets/custom-processor-applet/src/app/state-controllers/processor-filter-controller/effects/processor-filter.effects.ts
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/erp/genericDocCustomProcessing/bl_fi_generic_doc_custom_processing_filter.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/erp/genericDocCustomProcessing/bl_fi_generic_doc_custom_processing_queue.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/erp/genericDocCustomProcessing/bl_fi_generic_doc_custom_processing_history.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/erp/pricingScheme/bl_fi_mst_price_tag_sync_history.java
  lifecycle:
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/genericDocument/GenericDocumentController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/erp/genericDocument/customProcessing/GenericDocumentServiceForCustomProcessing.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/erp/genericDocCustomProcessing/GenericDocCustomProcessingFilterProcessor.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/infra/queue/erp/genericDocCustomProcessing/GenericDocCustomProcessingFilterQueue.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/erp/genericDocCustomProcessing/GenericDocCustomProcessingFilterDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/erp/genericDocCustomProcessing/GenericDocCustomProcessingQueueDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/erp/genericDocCustomProcessing/GenericDocCustomProcessingQueueUow.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/genericDocument/customProcessing/GenericDocCustomProcessingFilterController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/genericDocument/customProcessing/GenericDocCustomProcessingQueueController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/genericDocument/customProcessing/GenericDocCustomProcessingHistoryController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/erp/PricingSchemeDeTagSyncingProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/erp/PricingSchemeDeTagSyncingQueueDeleteProcessor.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/pricingScheme/PricingSchemeDeTagSyncingService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/erp/pricingScheme/PricingSchemeDeTagSyncingUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/PricingSchemeDeTagSyncingProcessorProperties.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/pricingScheme/PriceTagSyncQueueController.java
  troubleshooting:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/errorCodesConstants/TntErpErrorCodesConstantsV3.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/erp/genericDocument/customProcessing/GenericDocumentServiceForCustomProcessing.java
    - gh:bigledger/blg-wiki#49
tags:
- automation
- processing
- internal-sales
- batch-operations
- finance
weight: 150
---

## Overview

The Custom Processor Applet is the monitoring and configuration screen for a **hand-off queue between BigLedger and an external processor**. You create a **Processor Filter** that names a sales document type, a company and a posting status; when a matching document reaches FINAL, the backend copies its header into a **Processing Queue** row. An external integration reads that queue through the API, does its work, writes its result back onto the row and records a **Processing History** entry. The applet also lists the **Price Tag Sync History** — the successful pushes of pricing-scheme changes to an electronic-shelf-label (ESL) system.

Nothing in this applet or in the BigLedger backend changes a document's posting status. The old description "moves documents from DRAFT to FINAL" is not what the code does: the queue is filled *because* a document became FINAL, and the processing itself happens outside BigLedger.

## Where it fits

| Direction | Applet / data | Why |
|---|---|---|
| Upstream (documents that can be queued) | [Sales Order (Internal)](/applets/sales-workflow/internal-sales-order-applet/), [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [Sales Return (Internal)](/applets/sales-workflow/internal-sales-return-applet/), [Sales Debit Note (Internal)](/applets/sales-workflow/internal-sales-debit-note-applet/), [Sales Credit Note (Internal)](/applets/sales-workflow/internal-sales-credit-note-applet/) | The five server document types a Processor Filter can name |
| Upstream (master data) | [Organisation](/applets/master-data/organisation-applet/) | A filter is scoped to one company |
| Upstream (price tags) | [Pricebook](/applets/master-data/pricebook-applet/) | Inserts or updates of `bl_fi_mst_pricing_scheme_link` fire the database trigger that fills the price-tag sync queue |
| Downstream | External processor (customer-specific integration) | Reads `custom-processing/queues`, writes external status back, posts `custom-processing/histories` |
| Downstream | External ESL system | Receives price pushes from the scheduled De-Tag syncing job; successes land in Price Tag Sync History |

## Screens and menus

Route root `applet/tnt/wavelet/erp/custom-processor-applet`. The left menu has four listings, all read from the backend with a paginated grid (search, column filters, grid toggle). Only the Processor Filter listing has a create/edit form.

| Menu item | Screen | Backend table |
|---|---|---|
| **Processor Filter** | Listing (Code, Description, Server Doc Type, Company, Posting Status, Created Date, Status); `+` opens the create form; a row opens the same form in view mode with EDIT and DELETE (YES / NO confirmation dialog) | `bl_fi_generic_doc_custom_processing_filter` |
| **Processing Queue** | Read-only listing (Filter Code, Posting Status, Server Doc Type, Client Doc Type, Txn Date, Gen-Doc Created Date, Company, Processor, External Process Status / Error, External Response Status / Error, Status), newest first | `bl_fi_generic_doc_custom_processing_queue` |
| **Processing History** | Read-only listing (Company, Processor, Posting Status, Server Doc Type, Client Doc Type, Internal Doc No, External Doc Type / Code / Submission No, Description, Created Date, Status) | `bl_fi_generic_doc_custom_processing_history` |
| **Price Tag Sync History** | Read-only listing (Item Code, Item Name, Scan Code, Company Code, Store Code, Sales Unit Price, Created Date, Updated Date, NFC URL) | `bl_fi_mst_price_tag_sync_history` |
| **Settings** | Field Settings, Default Selection, Webhook, Client-Side Permission, Permission Set / User / Team / Role Permission | Shared screens except the first two |
| **Personalization** | Default Selection (a Field Settings entry is listed in the menu but has no route), Sidebar | Per-user |

The queue, history and price-tag screens have no buttons other than the grid toggle: there is no retry, re-queue or delete from the applet.

The only image under `static/images/custom-processor-applet/` is an illustrative infographic; it is not embedded because its "automated processing filters / real-time background queues" story overstates what the applet does.

## Configuration

### Before you can use it

- The five sales document applets above produce the documents; a document is only considered when its posting status becomes **FINAL** through `PUT …/{docType}/update-posting-status/{guid}` or `POST …/{docType}/update-auto-final/backoffice-ep` in `GenericDocumentController`.
- The company exists in [Organisation](/applets/master-data/organisation-applet/); the filter lookup is by tenant, server document type, **the document's company** and posting status, so create one filter per company.
- An external processor exists that polls `…/erp/generic-document/custom-processing/queues` (`backoffice-ep` or `etl-ep`), updates the row (`PUT …/queues/etl-ep`, `PUT …/queues/custom-update-without-revision/etl-ep`, which writes `external_process_status` and `external_process_error` only) and posts results to `…/custom-processing/histories/backoffice-ep` or `/custom-creation/etl-ep`. Without it the queue only grows.
- For Price Tag Sync History: the De-Tag integration trigger must be installed on the tenant (`GET …/erp/price-tag-sync-queues/initiate-triggers-for-de-tag-integration/backoffice-ep/query` creates `trg_after_insert_update_price_tag_sync` on `bl_fi_mst_pricing_scheme_link`) and the `PRICING_SCHEME_DE_TAG_SYNCING_PROCESSOR` job must be scheduled with its event properties (`interval`, `username`, `password`, `company`, `store`).
- API permissions: `TNT_DM_ERP_GENERIC_DOC_CUSTOM_PROCESSING_FILTER_{OWNER, ADMIN, CREATE, UPDATE, DELETE, READ}` and the matching `_QUEUE_*` and `_HISTORY_*` sets in `TntErpPermissionsV2`.

### Applet settings

Settings are **applet-local**; the applet does not use the shared `FieldConfigurationComponent`. No setting passes the four proofs — nothing in the four listing screens or the filter form reads a setting:

- **Settings › Default Selection** renders Default Branch / Default Location under "Applet Default Settings" and again under "User Default Settings", writes `DEFAULT_BRANCH` / `DEFAULT_LOCATION` into the applet container's `APPLET_SETTINGS` ext, but no component reads them (no screen has a branch or location).
- **Settings › Field Settings** shows eight unbound toggles (Unit Discount, SST/VAT/GST, WHT, Blanket Order, Segment, G/L Dimension, Profit Center, Project) with a SAVE button wired to nothing — a placeholder copied from the document applets, as is the `AppletSettings` model (`INCLUDE_*`, `ENABLE_*`, custom-status keys).
- **Personalization › Default Selection** never loads the applet container it tries to update (the loading subscription is commented out), so picking a value fails in the browser.

No exposed control found (routes, both settings components and every listing/form component checked at commit `5f3c6d51`). Configuration is the Processor Filter records themselves (Fields below).

There are no document-behaviour settings: the applet owns no document.

### Feature visibility / permissions

The applet reads no `SHOW_*` / `HIDE_*` client-side permission, and the registry seeds **0** `bl_applet_client_side_perm_dfn` rows for `custom-processor-applet`. The Client-Side Permission and permission-set screens are the shared ones; `PermissionResolver` only supplies target columns for them.

## Fields

### Processor Filter

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Filter Code | Identifier copied onto every queue row it creates (`filter_code`) | No client validator; the form has no `required` on it | Not checked for uniqueness by `GenericDocCustomProcessingFilterDataConsistencyObject` (guid, company FK, audit columns, status, revision only) |
| Description | Free text (`descr`) | No | Editable after creation |
| Server Doc Type | `INTERNAL_SALES_ORDER`, `INTERNAL_SALES_RETURN`, `INTERNAL_SALES_DEBIT_NOTE`, `INTERNAL_SALES_CREDIT_NOTE`, `INTERNAL_SALES_INVOICE` | Marked required in the control list; the reactive form has no validator | Read-only after creation |
| Company | One company from the dropdown (`company_guid`) | No | Read-only after creation. Part of the backend lookup, so a filter without a company does not match a document that carries one |
| Posting Status | `DRAFT` or `FINAL` (`gendoc_hdr_posting_status`) | Marked required; no validator | Read-only after creation. The backend only looks for filters when a document has just become **FINAL**, so a DRAFT filter never fires (see Lifecycle) |
| Tenant Code | Current tenant | — | Read-only, filled from the session |
| Status | `ACTIVE` / `INACTIVE` | Marked required; the create effect defaults to `ACTIVE` when empty | The only field besides Description that stays editable; the lookup ignores INACTIVE filters |

The table also has `destination_json`, `gendoc_filter_json` and `trigger_type` columns; the form does not expose them and the backend lookup does not read them.

### Processing Queue (read-only)

`filter_guid`, `filter_code`, `gendoc_hdr_guid`, the document's posting status / server and client doc types / document numbers (`gendoc_hdr_server_doc_1..3`, `gendoc_hdr_client_doc_1..2`) / txn date / created and last-updated dates and user names, `company_guid`, `company_code`, `tenant_code`, then the fields the **external processor** fills: `processor_code`, `processor_name`, `trigger_type`, `external_process_start_date`, `external_process_end_date`, `external_process_status`, `external_process_error`, `external_response_status`, `external_document_type`, `external_document_code`, `descr`. The queue DCO rejects a second row for the same tenant + company + processor code + posting status + document (`GENERIC_DOC_CUSTOM_PROCESSING_QUEUE__UNIQUE_CONSTRAINT_ALREADY_EXIST`).

### Processing History (read-only)

`gendoc_hdr_guid`, `tenant_code`, `company_code`, `processor_code`, posting status, server / client doc type, `gendoc_hdr_server_doc_1`, `gendoc_hdr_client_doc_1`, `gendoc_hdr_date_txn`, `gendoc_hdr_amount_txn`, `external_document_type`, `external_document_code`, `external_submission_no`, `external_response_json`, `descr`, `created_date`, `status`. Rows are created only through the history endpoints (POST `backoffice-ep`, POST `custom-creation/etl-ep`); the update endpoint is commented out, so history is append-only.

### Price Tag Sync History (read-only)

`company_code`, `store_code`, `item_guid`, `item_code`, `item_name`, `scan_code`, `sales_unit_price`, `nfc_url`, `price_tag_sync_queue_guid`, audit columns. One row per queue entry the ESL system accepted.

## Lifecycle and effects

Master-data / monitoring applet: no posting status, no journal, no stock. Filters are created (`POST …/custom-processing/filters/backoffice-ep`), updated (`PUT`) and deleted (`DELETE …/{guid}`) through `GenericDocCustomProcessingFilterService`; the DCO validates guid, company FK, audit columns, status and revision.

### Document hand-off

1. A user (or an auto-final backoffice call) sets a sales document's posting status. When the resulting status is **FINAL** and the update returned 200, `GenericDocumentController` calls `GenericDocumentServiceForCustomProcessing.getCustomProcessingFilterAndTriggerCustomProcessingFilterProcessor`.
2. That service looks for the **first** ACTIVE filter matching tenant code, server doc type, the document's company and the document's posting status (`Stream::findFirst`). One document therefore creates at most one queue row even if several filters match.
3. If found, it inserts an event into the `bl_fi_generic_doc_custom_processing_filter_queue` job queue (2 retries, 10-second delay, `RUN_NOW`) for `GENERIC_DOC_CUSTOM_PROCESSING_FILTER_PROCESSOR`.
4. `GenericDocCustomProcessingFilterProcessor` loads the filter and the document header and creates the `bl_fi_generic_doc_custom_processing_queue` row (filter guid/code, tenant code, document guid; created by the zero GUID). It sets no processor code, no external status and does not touch the document.
5. Everything after that is the external processor's job: it reads the queue through the API, writes `external_process_*` / `external_response_*` / `processor_*` back onto the row, and posts a history record. Failures show up as whatever the external system wrote into `external_process_error` / `external_response_error`.

### Price tag sync

1. The tenant-side trigger `trg_after_insert_update_price_tag_sync` on `bl_fi_mst_pricing_scheme_link` inserts rows into `bl_fi_mst_price_tag_sync_queue` on every insert or update of a pricing-scheme link.
2. The scheduled `PRICING_SCHEME_DE_TAG_SYNCING_PROCESSOR` (event properties: interval, username, password, company, store) obtains an access token from the ESL vendor API and calls `PricingSchemeDeTagSyncingService.postToDeTag` per queue row: rows with nothing to sync are marked `SYNCING_SKIPPED`; a vendor response of `SUCCESS` creates a `bl_fi_mst_price_tag_sync_history` row and marks the queue row `SYNCING_SUCCESSFUL`; anything else marks it `SYNCING_FAILED` with the response text. The NFC URL written to the history row is a fixed value hard-coded in the service, not derived from the item.
3. `PRICING_SCHEME_DE_TAG_SYNCING_QUEUE_DELETE_PROCESSOR` purges queue rows older than three months. The queue itself is not visible in this applet — only the success history is.

## Related applets

- [Sales Order (Internal)](/applets/sales-workflow/internal-sales-order-applet/), [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [Sales Return (Internal)](/applets/sales-workflow/internal-sales-return-applet/), [Sales Debit Note (Internal)](/applets/sales-workflow/internal-sales-debit-note-applet/), [Sales Credit Note (Internal)](/applets/sales-workflow/internal-sales-credit-note-applet/) — the document types a filter can watch; finalising one of them is the only event that fills the queue.
- [Organisation](/applets/master-data/organisation-applet/) — companies used to scope filters.
- [Pricebook](/applets/master-data/pricebook-applet/) — pricing-scheme link changes are what the price-tag sync pushes to the shelf labels.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| Filter is ACTIVE but nothing appears in Processing Queue | The filter's Posting Status is `DRAFT` — the lookup only runs when a document becomes FINAL, and it matches the document's current status | Recreate the filter with Posting Status `FINAL` (the field is read-only after creation) |
| Documents of the right type from another company are not queued | The lookup includes the document's company | Create one filter per company |
| Only one of several matching filters produces a queue row | `findFirst` on the filter lookup | Keep one ACTIVE filter per document type and company |
| Queue rows stay with empty Processor / External Process Status | No external processor is polling the queue; BigLedger itself never fills those columns | Check the integration that should read `…/custom-processing/queues` |
| Queue row shows an error in External Process Error / External Response Error | Written by the external processor | Read the text; correct the document in its own applet and let the external side re-process — there is no retry button in this applet |
| `GENERIC_DOC_CUSTOM_PROCESSING_QUEUE__UNIQUE_CONSTRAINT_ALREADY_EXIST` from the queue endpoint | A row already exists for the same tenant, company, processor code, posting status and document | Update the existing row instead of creating a new one |
| A price change is missing from Price Tag Sync History | Only vendor-confirmed successes are recorded; the row is `SYNCING_SKIPPED` or `SYNCING_FAILED` in `bl_fi_mst_price_tag_sync_queue`, or the trigger / job was never installed for this tenant | Check the queue table or job log; re-save the pricing-scheme link to enqueue it again |
| Filter form accepts an empty Filter Code or duplicate codes | No client validators on the reactive form and no uniqueness check in the DCO | Enter a distinct code by convention; the queue only carries the code as a label |
| Default Selection / Field Settings appear to do nothing | Placeholder screens (see Configuration) | Nothing to configure there |

## Related documentation

- [Pricebook Applet](/applets/master-data/pricebook-applet/) — pricing schemes and links.
- [Sales Invoice (Internal) Applet](/applets/sales-workflow/internal-sales-invoice-applet/) — the posting-status endpoint that triggers the hand-off.
