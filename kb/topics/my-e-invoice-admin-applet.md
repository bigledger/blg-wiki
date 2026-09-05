---
topic: my-e-invoice-admin-applet
aliases: [MyInvois admin, e-invoice admin, LHDN submission console]
applets: [myIEnvoiceAdminApplet]
modules: [e-invoice]
related: [e-invoice, my-e-invoice-portal-applet, mypeppol-admin-applet, organisation-applet, customer-applet, sales-invoice, consolidated-e-invoice]
wiki:
  - content/en/applets/e-invoice/my-e-invoice-admin-applet.md
  - content/en/guides/einvoice-guides/einvoice-pools-and-routing.md
  - content/en/guides/einvoice-guides/einvoice-validation.md
status: growing
updated: 2026-09-05
---

# My E-Invoice Admin Applet

The back-office console for the LHDN MyInvois pipeline: posting queue, batch / individual / single-general pools, to-IRB submission, validation, cancellation requests, incoming e-invoices, reconciliation and the monthly discrepancy report. It edits e-invoice tables only; it never posts journals.

## Facts

- 2026-09-05 — Registry code `myIEnvoiceAdminApplet`, name "My E-Invoice Admin Applet"; repo `blg-applet-wavelet-my-invoice-admin-applet` @d7841e7 (2026-08-11). [src:planning/private/registry-applets-2026-09-05.tsv]
- 2026-09-05 — Settings are an applet-local `FieldConfigurationComponent` saved through `SessionActions.saveMasterSettingsInit` (tenant-wide master settings); 11 keys rendered: `HIDE_INDIVIDUAL_POOL_MENU`, `HIDE_SINGLE_GENERAL_POOL_MENU`, `HIDE_EXTERNAL_RECEPTION_MENU`, `HIDE_PORTAL_REQUEST_HDR_MENU` (consumed in `app.component.ts` menu filter), `SHOW_RESUBMIT_AS_NEW_E_INVOICE_BUTTON`, `HIDE_SAVE_AND_RESUBMIT_BUTTON`, `SHOW_CUSTOM_PRINTABLE_BUTTON`, `SHOW_PRINTABLE_PREVIEW`, `SHOW_PRINTABLE_LHDN_PREVIEW`, `HIDE_LHDN_FORMAT_PRINTABLE_BUTTON` (consumed in `internal-submission-to-irb-edit.component.ts` L103–L108, `|| false`), `HIDE_SUBMISSION_STATUS` (rendered, saved, not consumed). [src:blg-applet-wavelet-my-invoice-admin-applet/.../settings-container/field-configuration/field-configuration.component.ts] [src:.../app.component.ts]
- 2026-09-05 — `DEFAULT_TRANSACTION_DATE` (`1_week`/`1_day`), `FUZZY_SEARCH_COLUMNS`, `SORT_ORDER` are read without a control, only in the Discrepancies Report generic-doc listing. [src:.../generic-doc-listing.component.ts L605, L678, L1015]
- 2026-09-05 — Default Selection component is routed directly; `appletSettings$` input and `save` output have no parent binding (same dead pattern as Delivery Installation). [src:.../settings-container/default-settings/default-settings.component.html] [src:.../settings-container.component.html]
- 2026-09-05 — No client-side permission definitions seeded (0 rows for the three e-invoice codes in `bl_applet_client_side_perm_dfn`); the app requests `API_TNT_DM_ERP_STATEMENT_OF_ACCOUNT_READ`, `TNT_TENANT_ADMIN`, `TNT_TENANT_OWNER` on load. [src:akaun_master query 2026-09-05] [src:.../app.component.ts L54–L62]
- 2026-09-05 — Entry gate: `GenericDocumentEInvoicePostingQueueProcessor.processEvent` requires FINAL, company `einvoice_status = ENABLED`, `checkDocTypeValidity` (sales types, or purchase types with `einvoice_self_billed = TRUE`, and `!skip_einvoice`), and `!isDuplicateDoc` (ACTIVE posting-queue row with same `server_doc_1` + type); otherwise nothing is written. Routing: CONSOLIDATED + ENFORCE_INDIVIDUAL_DOCS (`INTERNAL_SALES_INVOICE`, `INTERNAL_SALES_CASHBILL`) + `amount_txn >= 10000` → individual pool; CONSOLIDATED otherwise → batch pool; else → posting queue. [src:blg-akaun-platform-java/akaun-api/.../GenericDocumentEInvoicePostingQueueProcessor.java L48–L85] [src:client-sdk/.../EInvoiceConstants.java] [src:javasdk/.../MyEInvoiceSharedService.java L67–L95]
- 2026-09-05 — Mandatory-field check (`getHdrDecision` / `getLineDecision`): supplier+buyer name, TIN, ID type, ID value; supplier MSIC + business activity; both addresses with line 1/city/state; both phones 8–20 chars; e-invoice ver/type/code/datetime; doc_ccy; sub_total, total_exclude_tax, total_include_tax; per line classification, item_name, unit_price, taxable type code, tax_amount. [src:javasdk/.../MyEInvoiceToIRBProcessorService.java L246–L290] [src:MyEInvoiceSharedService.java L400 isPhoneNoValid]
- 2026-09-05 — Buyer resolution priority for sales docs: `einvoice_buyer_entity_hdr_json` → `einvoice_entity_hdr_json` → entity record; supplier for purchase docs likewise. TIN auto-search when `amount_txn >= 10000`, ID type BRN and TIN blank. [src:MyEInvoiceToIRBProcessorService.java L91–L145, L207–L233]
- 2026-09-05 — Company `einvoice_settings_json` (`EInvoiceCompanySetting`): `einvoice_issuer_type` (`INTERMEDIARY` default / `ERP`), `einvoice_forex_gendoc_posting_logic` (`POST_FOREX_DOC` default / `POST_LOCAL_CCY_DOC`), `einvoice_running_no_config`, `einvoice_line_item_desc_config`. [src:javasdk/.../lhdn/MyEInvoiceLHDNIntegrationHelperService.java L32–L55] [src:javasdk/.../shared/MyEInvoicePostingQueueProcessingService.java L377–L389] [src:javasdk/.../shared/MyEInvoiceToIRBMappingService.java L238–L240, L468–L469]
- 2026-09-05 — Backend rejections: `Cannot move transaction with amount more than or equal to 10000.` (individual → batch pool, `MyEInvoicePoolConversionService.checkIfPoolConversionAllowed`); Save and Resubmit on a `Valid` header throws "already validated with 'Valid' status…", on `Submitted` "already submitted and pending LHDN validation…" (`MyEInvoiceToIrbResubmissionService.fixFromToIRB` L52–L63, called from `MyEInvoiceToIrbController` L482); Resubmit as New throws on Valid and "Document already exists in the pool." [src:javasdk/.../pools/MyEInvoicePoolConversionService.java L43–L53] [src:javasdk/.../toIrbReSubmission/MyEInvoiceToIrbResubmissionService.java]
- 2026-09-05 — Cancellation validity (`isCancellationRequestValid`): status must be `Valid` ("Not Validated"), `lhdn_document_guid` present ("e-invoice is not generated yet"), `hoursBetween(validation_datetime, now) < 72` ("Passed 72 hours from validation date time"). Processing logics: `REGEN_NEW_EINVOICE`, `VOID_ORIGINAL_DOC` (dry-checks void-ability, fails "Can not void the generic document" for consolidated), `NEW_REVERSAL_DOC`, `CANCEL_FOR_EDIT_AND_RESUBMIT` (onlyCancel; shown as `CANCEL_EINVOICE` in the admin dropdown). No cron advances rejection requests; queue-builder picks `IN-PROGRESS` + `APPROVED` + non-null logic. [src:javasdk/.../MyEInvoiceGenDocToIrbCancellationQueueService.java L120–L200, L437–L462] [src:.../models/einvoice_constants.ts PROCESSING_LOGIC] [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md "E-Invoice Cancellation & Rejection Requests"]
- 2026-09-05 — LHDN document statuses: `Submitted`, `Valid`, `Invalid`, `Cancelled` (`MyEInvoiceLHDNDocumentStatus`); header defaults `NOT_SUBMITTED`; consolidated headers `IN_CONSOLIDATED_QUEUE`; failed pre-LHDN `IN_QUEUE`. [src:client-sdk/.../MyEInvoiceLHDNDocumentStatus.java] [src:README.md "Default Header Values", "Consolidated Header Default Mappings"]
- 2026-09-05 — Eight cron processors + three trigger processors run the pipeline; intermediary token regenerated every ~20 min with up to 3 tokens per company/env; `dateTimeIssued` sent to LHDN is always now. [src:README.md "Required Processors", "Round-Robin Token Refresh", "Backdated individual einvoice"]
- 2026-09-05 — Consolidation by document = one line per source doc, classification `004`, UOM `H87`; by branch = one line per consecutive `server_doc_3` range and general TIN, UOM `XUN`, max 200 lines; by-branch endpoint had a timezone bug (fixed 2026-08-20). [src:README.md "Consolidated By Document"/"By Branch"] [src:gh:bigledger/blg-intranet#5663]
- 2026-09-05 — Known platform gaps (open): ghost documents dropped at the entry gate with no record (#5618); RM10k+ docs parked silently in the individual pool (#5623); queue rows stuck >24h undetected, retry ceiling >5 marks PROCESSED (#5626); unnormalised buyer NRIC causes CF324 (#5567); no duplicate guard on batch-pool push (closed #5427, fixed 2026-08-20). [src:gh:bigledger/blg-intranet#5618] [src:gh:bigledger/blg-intranet#5623] [src:gh:bigledger/blg-intranet#5626] [src:gh:bigledger/blg-intranet#5567] [src:gh:bigledger/blg-intranet#5427]
- 2026-09-05 — Bulk TIN Validation = CSV upload (`upload-csv/backoffice-ep`) into `bl_fi_my_einvoice_tin_update_request_hdr`/queue; queue rows write `einvoice_tax_id_no` onto the entity and are deleted. [src:javasdk/.../MyEInvoiceTinUpdateRequestHdrService.java L55–L101] [src:javasdk/.../MyEInvoiceTinUpdateRequestQueueService.java L60–L114]

## How it connects

- **e-invoice** — this applet is the operator's view of the pipeline the topic describes; all routing facts live here.
- **my-e-invoice-portal-applet** — portal requests land in the pools / Portal Request; rejection requests raised by buyers appear in Cancellation → Rejection Requests.
- **mypeppol-admin-applet** — reuses `initDecision` for its waiting-queue gate; does not wait for LHDN Valid.
- **organisation-applet** — owns `einvoice_status`, company identity and `einvoice_settings_json`; the applet page should explain the four JSON keys.
- **customer-applet** — ID type/value/TIN/address are the dominant cause of pool parking; the Verify TIN / Get TIN buttons write back to the entity.
- **sales-invoice** — `einvoice_submission_type`, `skip_einvoice`, and the e-invoice tab (with Batch Pool update/resubmit requested in issues #8–#12 of the applet repo).

## Open questions

- Should the guides stop describing Batch Pool as "bulk submission"? In code it is the consolidated holding pool; bulk individual submission is Posting Queue → Submit.
- The forex `POST_FOREX_DOC` / `POST_LOCAL_CCY_DOC` choice has no UI (intranet #5803 open) — which page documents it once it does?

## Wiki impact

- Guides `einvoice-pools-and-routing` and `einvoice-validation`: verify against the 23-scenario table and the mandatory list above (they were written from this README already; spot-check the RM10k rule applies only to SINV/SCSH).
- Organisation applet page: add the `einvoice_settings_json` keys and `einvoice_status` gate.
