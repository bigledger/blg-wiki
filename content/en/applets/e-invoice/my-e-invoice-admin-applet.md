---
title: "My E-Invoice Admin Applet"
description: "Back-office control panel for Malaysian LHDN MyInvois e-invoicing: the posting queue, the three holding pools, submission and validation queues, consolidation, cancellation requests, incoming e-invoices, reconciliation and the monthly discrepancy report."
applet_code: "myIEnvoiceAdminApplet"
applet_repo: "blg-applet-wavelet-my-invoice-admin-applet"
modules: [e-invoice]
related_applets: [my-e-invoice-portal-applet, mypeppol-admin-applet, organisation-applet, customer-applet, supplier-applet-1, internal-sales-invoice-applet, internal-sales-credit-note-applet, internal-sales-debit-note-applet, internal-sales-refund-note-applet, internal-sales-return-applet, pos-general-applet, internal-purchase-invoice-applet, doc-item-maintenance-applet, tax-configuration-applet]
guides:
  - /guides/einvoice-guides/einvoice-pools-and-routing/
  - /guides/einvoice-guides/einvoice-validation/
  - /guides/einvoice-guides/myinvois-setup/
sources:
  screens:
    - blg-applet-wavelet-my-invoice-admin-applet/micro-fe/projects/wavelet-erp/applets/my-invoice-admin-applet/src/app/app.routing.ts
    - blg-applet-wavelet-my-invoice-admin-applet/micro-fe/projects/wavelet-erp/applets/my-invoice-admin-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-my-invoice-admin-applet/micro-fe/projects/wavelet-erp/applets/my-invoice-admin-applet/src/app/components/Tools/file-import-container/file-import-create/file-import-create.component.html
  configuration:
    - blg-applet-wavelet-my-invoice-admin-applet/micro-fe/projects/wavelet-erp/applets/my-invoice-admin-applet/src/app/components/settings-container/field-configuration/field-configuration.component.ts
    - blg-applet-wavelet-my-invoice-admin-applet/micro-fe/projects/wavelet-erp/applets/my-invoice-admin-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-wavelet-my-invoice-admin-applet/micro-fe/projects/wavelet-erp/applets/my-invoice-admin-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-my-invoice-admin-applet/micro-fe/projects/wavelet-erp/applets/my-invoice-admin-applet/src/app/components/settings-container/settings-container.component.html
    - blg-applet-wavelet-my-invoice-admin-applet/micro-fe/projects/wavelet-erp/applets/my-invoice-admin-applet/src/app/app.component.ts
    - blg-applet-wavelet-my-invoice-admin-applet/micro-fe/projects/wavelet-erp/applets/my-invoice-admin-applet/src/app/components/internal-submission/internal-submission-to-irb-container/internal-submission-to-irb-edit/internal-submission-to-irb-edit.component.ts
    - blg-applet-wavelet-my-invoice-admin-applet/micro-fe/projects/wavelet-erp/applets/my-invoice-admin-applet/src/app/components/monthly-reports/discrepancies-report-container/discrepancies-report-view/discrepancy-report-details/generic-doc-listing/generic-doc-listing.component.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/eInvoice/lhdn/MyEInvoiceLHDNIntegrationHelperService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/eInvoice/shared/MyEInvoicePostingQueueProcessingService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/eInvoice/shared/MyEInvoiceToIRBMappingService.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dto/erp/eInvoice/EInvoiceIssuerType.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dto/erp/eInvoice/EInvoiceForexGendocPostingLogic.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/permissions/EInvoicePermissions.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/eInvoice/CompEInvoiceIntermediarySystemController.java
    - blg-intranet/content/1100-malaysia-einvoice/README.md
  fields:
    - blg-applet-wavelet-my-invoice-admin-applet/micro-fe/projects/wavelet-erp/applets/my-invoice-admin-applet/src/app/models/einvoice_constants.ts
    - blg-applet-wavelet-my-invoice-admin-applet/micro-fe/projects/wavelet-erp/applets/my-invoice-admin-applet/src/app/models/constant/batch-pool.ts
  lifecycle:
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/eInvoice/GenericDocumentEInvoicePostingQueueProcessor.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/eInvoice/shared/MyEInvoiceSharedService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/eInvoice/shared/MyEInvoiceToIRBProcessorService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/eInvoice/MyEinvoiceBatchPoolDocService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/eInvoice/pools/MyEInvoicePoolConversionService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/eInvoice/toIrbReSubmission/MyEInvoiceToIrbResubmissionService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/eInvoice/MyEInvoiceGenDocToIrbCancellationQueueService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/eInvoice/MyEinvoiceRequestRejectionService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/eInvoice/MyEInvoiceTinUpdateRequestHdrService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/eInvoice/MyEInvoiceTinUpdateRequestQueueService.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dto/erp/eInvoice/EInvoiceConstants.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/model/erp/eInvoice/lhdn/MyEInvoiceLHDNDocumentStatus.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/model/erp/eInvoice/MyEInvoiceCancellationProcessingLogic.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/eInvoice/MyEInvoiceToIrbController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/eInvoice/MyEInvoiceBatchPoolDocController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/eInvoice/pools/MyEInvoiceIndividualPoolDocController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/eInvoice/pools/MyEInvoiceSingleGeneralPoolDocController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/eInvoice/MyEInvoiceDirectCancellationController.java
    - blg-intranet/content/1100-malaysia-einvoice/README.md
    - blg-intranet/content/1100-malaysia-einvoice/images/lhdn-core-workflow.png
    - blg-intranet/content/1100-malaysia-einvoice/images/E-inv 10K Simulation - Scenarios.csv
  troubleshooting:
    - blg-intranet/content/1100-malaysia-einvoice/README.md
    - gh:bigledger/blg-intranet#5427
    - gh:bigledger/blg-intranet#5415
    - gh:bigledger/blg-intranet#5567
    - gh:bigledger/blg-intranet#5618
    - gh:bigledger/blg-intranet#5623
    - gh:bigledger/blg-intranet#5626
    - gh:bigledger/blg-intranet#5663
    - gh:bigledger/blg-intranet#1925
    - gh:bigledger/blg-intranet#1778
    - gh:bigledger/blg-intranet#2070
    - gh:bigledger/blg-applet-wavelet-my-invoice-admin-applet#36
    - gh:bigledger/blg-applet-wavelet-my-invoice-admin-applet#37
    - gh:bigledger/blg-applet-wavelet-my-invoice-admin-applet#67
tags:
- e-invoice
- lhdn
- myinvois
- compliance
- malaysia
- finance
- submission
- batch-processing
weight: 165
aliases:
- /applets/e-invoice/einvoice-generation-applet/
---

## Overview

The My E-Invoice Admin Applet is the back-office console for Malaysia's LHDN MyInvois e-invoicing. Sales and purchase documents are created and finalised in their own applets; the moment one is set to FINAL, a trigger processor routes it into the e-invoice pipeline, and this applet is where you watch that pipeline, fix what stalls, consolidate what should be consolidated, cancel what LHDN has validated in error, and reconcile incoming e-invoices from your suppliers. It is opened by the accounts team and by whoever owns month-end e-invoice compliance. Nothing here creates an accounting document or posts a journal.

{{< callout type="info" >}}
An e-invoice is never submitted from the document applet. Finalising a sales invoice, cash bill, credit note, debit note, refund note or sales return (or a self-billed purchase document) only *queues* it. Everything after that point happens in this applet and in the background job processors described under [Lifecycle and effects](#lifecycle-and-effects).
{{< /callout >}}

## Where it fits

| Upstream | This applet | Downstream |
|---|---|---|
| Sales documents finalised in [Sales Invoice](/applets/sales-workflow/internal-sales-invoice-applet/), [POS](/applets/sales-workflow/pos-general-applet/), [Sales Credit Note](/applets/sales-workflow/internal-sales-credit-note-applet/), [Sales Debit Note](/applets/sales-workflow/internal-sales-debit-note-applet/), [Sales Refund Note](/applets/sales-workflow/internal-sales-refund-note-applet/), [Sales Return](/applets/sales-workflow/internal-sales-return-applet/) | Posting queue → pools → to-IRB submission → LHDN validation → e-mail of the validated PDF | LHDN MyInvois (validated e-invoice, LHDN document UUID, QR link) |
| Self-billed purchase documents (Purchase Invoice with `EINVOICE_SELF_BILLED = TRUE`, purchase credit/debit/refund note, purchase return) — see [Purchase Invoice](/applets/finance/internal-purchase-invoice-applet/) | Same pipeline, with the company as buyer and the supplier as issuer | LHDN MyInvois |
| Company e-invoice identity and settings in the [Organisation Applet](/applets/master-data/organisation-applet/) | Read on every submission (TIN, BRN, SST, MSIC, address, phone, issuer type, forex logic) | — |
| Customer and supplier e-invoice details in the [Customer](/applets/master-data/customer-applet/) and [Supplier](/applets/master-data/supplier-applet-1/) applets | Read when the to-IRB header is built; corrected in place from the pools | — |
| Supplier e-invoices received from LHDN (External Reception) | Reconciliation (Purchase) matches them against your purchase documents | Purchase applets |
| Validated e-invoices | — | [My Peppol Admin Applet](/applets/e-invoice/mypeppol-admin-applet/) picks them up in its Waiting Queue for Peppol delivery; [My E-Invoice Portal Applet](/applets/e-invoice/my-e-invoice-portal-applet/) lets a buyer request or reject them |

## Screens and menus

The left menu, in the order the applet renders it (`models/menu-items.ts`). The default landing screen is **Posting Queue**.

| Menu | Sub-menu | Route | What it lists | Actions on the screen |
|---|---|---|---|---|
| Master List | — | `master-list` | Every e-invoice record across all sections; tabs **Document** and **Document Details/Lines** | Search, Export |
| Posting Queue | — | `posting-queue` | Documents waiting for the to-IRB processor (`bl_fi_generic_doc_einvoice_posting_queue`) with queue status, validation message and process status | Submit (process the selected rows now) |
| Batch Pool | — | `batch-pool` | Documents held for consolidated submission | Process, Consolidate, Consolidate By Branch, Move to Individual, Move to Single General; per row: Skip E-Invoice, Submit as Individual, Submit as Single General, Save and Resubmit |
| Individual Pool | — | `individual-pool` | Documents that must go out as individual e-invoices but fail the mandatory-field check | Move To Batch Pool, Move to Single General; per row: Save and Resubmit, Skip E-Invoice, Get TIN / Verify TIN |
| Single General Pool | — | `single-general-pool` | Documents whose submission type is `SINGLE-GENERAL` and that fail the mandatory-field check | Save and Resubmit, move to Individual / Batch, Skip E-Invoice |
| Internal Submission | To IRB E-Invoice | `internal-submission-to-irb` | Every to-IRB header (`bl_fi_my_einvoice_to_irb_hdr`); tabs **Listing** and **Export** | Save and Resubmit, Resubmit as New E-invoice, Request for Rejection, Printable (LHDN Format), Refresh |
| | Individual Submission | `internal-submission-to-irb-queue` | The individual submission queue (`…_gen_doc_to_irb_submission_queue`) | Submit |
| | Consolidated Submission | `consolidated-submission-queue` | Consolidated payloads waiting to be sent | Submit |
| | Validation Queue | `internal-submission-to-irb-validation-queue` | Submissions LHDN has accepted but not yet validated | Submit (bulk, added 2026-07). **Capped at 20 rows per Submit**: each selected row is a separate synchronous `getDocumentDetails` call to LHDN inside the one request, so the grid trims any selection above `maxSelection = 20` (select-all included) and shows *"You can only select up to 20 records per submission."* Submit, let the grid refresh, repeat. |
| | Portal Request | `portal-request-hdr` | Requests raised through the customer portal | — |
| | Submission History | `internal-submission-to-irb-history` | Archive of every submission; tabs **Listing** and **Export** | Export |
| | Email Dashboard | `email-dashboard-queue` | Tabs **Email Printable Queue** and **Email Printable Queue History** — the e-mails of validated PDFs to buyers, with retry count and error | — |
| External Reception | Queue | `external-reception-queue` | Incoming e-invoices fetched from LHDN awaiting processing | Export |
| | From IRB E-Invoice | `external-reception-from-irb` | Incoming e-invoices already processed | Export |
| Reconciliation (Purchase) | PD Matching Q. · Inc. E-Invoice Match Q. · Matched History · Inc. Unmtch. E-Inv. Hist. · Unmatched PD Hist. | `puchase-doc-matching-queue` … | Your purchase documents vs supplier e-invoices received from LHDN | Auto Match, Export, Push to Unmatched History |
| Reconciliation (Sales) | SD Matching Q. · Inc. Ecom Matcd. Q. · Matched History · Inc. Ecom Unmatcd. Hist. · SD Unmatcd. Hist. | `sales-doc-matching-queue` … | Your sales documents vs e-invoices received from e-commerce platforms | Auto Match, Export, Push to Unmatched History |
| Cancellation | Rejection Requests | `rejection-request` | Internal cancellation requests with requestor / processing / approval status | Process Request; per row: Update |
| | Cancellation Queue | `rejection-request-queue` | Approved requests queued for the LHDN cancellation call, with request error | Process |
| Monthly Report | Discrepancies Report | `discrepancies-report` | Per-company, per-period comparison of finalised documents against e-invoice records; four tabs — Main, ERP Transaction Summary, IRB Audit Summary, Document vs E-Invoice Discrepancy. See [below](#8-monthly-report--discrepancies-report) | Create, view details, drill into the documents behind a line |
| | History | `history-report` | Past reports | — |
| Tools | Bulk Tin Validation | `bulk-tin-validation` | CSV uploads of TIN corrections (`bl_fi_my_einvoice_tin_update_request_hdr`) | Upload File, Submit |
| Settings | Field Settings · Default Selection · Webhook · Feature Visibility · Permission Wizard · Permission Set · User Permission · Role Permission | `settings/...` | See [Configuration](#configuration) | — |
| Personalization | Default Selection · Sidebar | `personalization/...` | Per-user defaults | — |

{{< figure src="/images/my-e-invoice-admin-applet/master-list.png" alt="Master List with Document and Document Details/Lines tabs and the full left menu" caption="Master List — the left menu shows every section of the applet." >}}

{{< figure src="/images/my-e-invoice-admin-applet/batch-pool-validation-error.png" alt="Batch Pool with a purchase invoice selected and the Validation Error panel listing the supplier fields that are missing" caption="Batch Pool — a document held because the supplier's TIN, ID type, ID value, contact number and address are missing. Fix them on the Account tab and use Save and Resubmit." >}}

{{< figure src="/images/my-e-invoice-admin-applet/internal-submission-to-irb-e-invoice.png" alt="Internal Submission To IRB listing with e-invoice number, dates, document numbers, branch, company and e-invoice status columns" caption="Internal Submission → To IRB E-Invoice — one row per to-IRB header, with the LHDN document status (Invalid, IN_QUEUE, Valid…)." >}}

{{< figure src="/images/my-e-invoice-admin-applet/internal-submission-consolidated.png" alt="Consolidated Submission Queue listing showing consolidated payloads with buyer General Public and a Submit button" caption="Internal Submission → Consolidated Submission — consolidated payloads (buyer = General Public) waiting for the LHDN call." >}}

{{< figure src="/images/my-e-invoice-admin-applet/internal-submission-validation-queue.png" alt="Validation Queue listing, empty, with a Submit button" caption="Internal Submission → Validation Queue — normally empty; rows here have been accepted by LHDN but not yet validated." >}}

{{< figure src="/images/my-e-invoice-admin-applet/internal-submission-history.png" alt="Internal Submission History listing with Listing and Export tabs" caption="Internal Submission → Submission History." >}}

{{< figure src="/images/my-e-invoice-admin-applet/internal-submission-portal-request.png" alt="Portal Request Hdr listing with document numbers, amount, user request status and status columns" caption="Internal Submission → Portal Request — requests raised by buyers through the customer portal." >}}

{{< figure src="/images/my-e-invoice-admin-applet/cancellation-rejection-requests.png" alt="Rejection Requests listing with System Requestor Status, System Processing Status, System Approval Status and Request Submission Date columns" caption="Cancellation → Rejection Requests — a request sits at REQUESTED / IN-PROGRESS until someone approves it and chooses a processing logic." >}}

{{< figure src="/images/my-e-invoice-admin-applet/cancellation-queue-details.png" alt="Cancellation Queue detail panel showing Request Submission Status SUBMISSION_FAILED, Processing Logic VOID_ORIGINAL_DOC and Request Error Passed 72 hours from validation date time" caption="Cancellation → Cancellation Queue — the Request Error field carries the backend reason, here the 72-hour rule." >}}

{{< figure src="/images/my-e-invoice-admin-applet/reconciliation-purchase-matching.png" alt="Purchase Doc Matching Queue with Auto Match, Export and Push to Unmatched History buttons" caption="Reconciliation (Purchase) → PD Matching Q." >}}

## Configuration

### Before you can use it

Almost everything that decides whether a document reaches LHDN is configured *outside* this applet.

| Prerequisite | Where | Why it matters |
|---|---|---|
| Company e-invoice status **ENABLED** | [Organisation Applet](/applets/master-data/organisation-applet/) → company → E-Invoice tab (`bl_fi_mst_comp.einvoice_status`) | The entry-gate processor drops any finalised document whose company is not ENABLED — silently, with no queue row and no error (`GenericDocumentEInvoicePostingQueueProcessor.processEvent`, the `"ENABLED".equals(...)` conjunct). Enable e-invoice *before* finalising documents. |
| Company identity: TIN, ID type and value, registration number, SST number, MSIC code, business-activity description, address (line 1, city, state), phone (8–20 characters), e-mail | Organisation Applet → company | These become the supplier fields of every sales e-invoice (or the buyer fields of a self-billed purchase e-invoice) and are all on the header mandatory list; MSIC defaults to `00000` and business activity to `NOT APPLICABLE` when blank. |
| BigLedger registered as your **intermediary** on the MyInvois portal, then the intermediary token configured for the company | MyInvois portal (you); `POST …/configure-intermediary/backoffice-ep` (BigLedger support) — creates `bl_fi_mst_comp_einvoice_intermediary_system` rows for SANDBOX and PRODUCTION | With issuer type `INTERMEDIARY` (the default) every LHDN call uses a token generated on behalf of your TIN; the `E_INVOICE_INTERMEDIARY_ACCESS_TOKEN_PROCESSOR` cron regenerates it every ~20 minutes and keeps three tokens per company and environment. If the intermediary authorisation lapses at LHDN the submissions fail with `Access Token not available` until it is re-done. |
| Company e-invoice settings JSON (`bl_fi_mst_comp.einvoice_settings_json`) | Organisation Applet → company → E-Invoice tab; some keys are maintained by BigLedger support | See the table below. |
| Job processors enabled for the tenant | BigLedger support (`bl_sch_crontab_hdr`, `bl_applet_trigger_config_hdr`) | Eight cron processors and three trigger processors run the pipeline (listed under Lifecycle). A tenant with a missing processor sees documents stop at the corresponding queue. |
| Customer / supplier e-invoice fields: TIN, ID type (`NRIC`, `BRN`, `PASSPORT`, `ARMY`), ID value, address with `default_einvoice_address`, phone, e-mail | [Customer](/applets/master-data/customer-applet/) / [Supplier](/applets/master-data/supplier-applet-1/) applets | Missing or malformed values are the single largest cause of documents landing in a pool. The address used is the first with `default_einvoice_address = true`, in the order shipping → billing → main. |
| Item classification codes, e-invoice UOM, tax type codes | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/), [Tax Configuration](/applets/master-data/tax-configuration-applet/) | Line defaults are applied when blank (classification `022 Others`, UOM `H87 piece`, tax type `06` when tax is zero, `01` when tax is non-zero) — but wrong non-blank values are sent as-is. |
| Per-document `einvoice_submission_type` (`INDIVIDUAL`, `CONSOLIDATED`, `SINGLE-GENERAL` or blank) and `skip_einvoice` | Set on the document in the sales / purchase / POS applet (or inherited from the entity / branch defaults) | Decides which pool the document falls into; a skipped document never enters the pipeline. |

**Company e-invoice settings JSON** (`EInvoiceCompanySetting`, read by the backend on every submission):

| Key | Values | Default when absent | Effect |
|---|---|---|---|
| `einvoice_issuer_type` | `INTERMEDIARY`, `ERP` | `INTERMEDIARY` | `INTERMEDIARY` uses the per-company token generated on behalf of your TIN; `ERP` uses BigLedger's own credentials from the master configuration (`MyEInvoiceLHDNIntegrationHelperService.getIntermediaryTokenAndEnv`). |
| `einvoice_forex_gendoc_posting_logic` | `POST_FOREX_DOC`, `POST_LOCAL_CCY_DOC` | `POST_FOREX_DOC` | For a foreign-currency sale BigLedger keeps two generic documents (base MYR and forex child). `POST_FOREX_DOC` submits the forex child (amounts in the foreign currency); `POST_LOCAL_CCY_DOC` submits the MYR document (`MyEInvoicePostingQueueProcessingService.retrieveForexDocIfExists`). A UI control for this choice is tracked as an open issue; today it is set by support. |
| `einvoice_running_no_config` | pattern with `{generic_doc_hdr_server_doc_1}`, `{generic_doc_hdr_server_doc_2}`, `{generic_doc_hdr_server_doc_3}`, `{doc_reference}`, `{client_doc_1}`…`{client_doc_5}` | empty | Appended to the sequential e-invoice running number, truncated to 50 characters (`MyEInvoiceToIRBMappingService`, running-number construction). |
| `einvoice_line_item_desc_config` | pattern with `{item_code}`, `{item_name}`, `{item_remarks}` joined by `;` | `item_code;item_name;item_remarks` | Builds the line description sent to LHDN, truncated to 300 characters, URLs and special characters stripped. |

### Applet settings

Settings live in an **applet-local** `FieldConfigurationComponent` (`settings/field-settings`), not the shared one from blg-shared-utilities. The form patches from the session's master settings and saves through `SessionActions.saveMasterSettingsInit`, so every key below is tenant-wide and can be changed by anyone who can open Settings (no role check in the component). Every control starts as `null`; the consumers treat `null` as `false`, so the effective default of every toggle is **off**.

| Setting | Panel | What it controls | Default | Effect when changed |
|---|---|---|---|---|
| `HIDE_INDIVIDUAL_POOL_MENU` | Side Menu Settings | Removes **Individual Pool** from the left menu (`app.component.ts`, menu filter) | off | The route still exists; only the menu entry disappears. |
| `HIDE_SINGLE_GENERAL_POOL_MENU` | Side Menu Settings | Removes **Single General Pool** from the menu | off | As above. |
| `HIDE_EXTERNAL_RECEPTION_MENU` | Side Menu Settings | Removes the whole **External Reception** group | off | As above. |
| `HIDE_PORTAL_REQUEST_HDR_MENU` | Side Menu Settings | Removes **Internal Submission → Portal Request** | off | As above. |
| `SHOW_RESUBMIT_AS_NEW_E_INVOICE_BUTTON` | Internal Submission → To IRB E-Invoice | Shows the **Resubmit as New E-invoice** button on the To IRB edit screen | off | Without it, an Invalid consolidated or single-general e-invoice can only be fixed with Save and Resubmit. |
| `HIDE_SAVE_AND_RESUBMIT_BUTTON` | Internal Submission → To IRB E-Invoice | Hides **Save and Resubmit** on the To IRB edit screen | off | Use when corrections should be made in the pools only. |
| `SHOW_CUSTOM_PRINTABLE_BUTTON` | Internal Submission → To IRB E-Invoice | Shows the **Printable** (custom format) button | off | — |
| `SHOW_PRINTABLE_PREVIEW` | Internal Submission → To IRB E-Invoice | Shows **Printable-Preview** | off | — |
| `SHOW_PRINTABLE_LHDN_PREVIEW` | Internal Submission → To IRB E-Invoice | Shows **Printable (LHDN)-Preview** | off | — |
| `HIDE_LHDN_FORMAT_PRINTABLE_BUTTON` | Internal Submission → To IRB E-Invoice | Hides **Printable (LHDN Format)** | off | — |

Rendered and saved but **not consumed** anywhere in the applet at commit `d7841e7`: `HIDE_SUBMISSION_STATUS` (Master List Settings panel). Switching it has no effect.

Unbound toggles on the same screen (Unit Discount, SST/VAT/GST, WHT, Blanket Order, Segment, G/L Dimension, Profit Center, Project) have no form control and are never saved — they are template leftovers from the document-applet settings screen.

Keys **read without a control** in this applet — they come from the shared Default Selection / personal settings and only affect the Discrepancies Report's generic-document listing (`generic-doc-listing.component.ts`): `DEFAULT_TRANSACTION_DATE` (`1_week` or `1_day` pre-filters the date range), `FUZZY_SEARCH_COLUMNS`, `SORT_ORDER` (defaults to `updated_date`).

**Default Selection** (`settings/default-selection`) renders Default Branch and Default Location, but the component is routed directly with no parent binding for its `appletSettings$` input or `save` output, so its SAVE button emits to nothing at commit `d7841e7`. Treat it as not functional.

**Webhook**, **Feature Visibility** and the four permission listings are the shared blg-shared-utilities screens.

### Document behaviour settings

Not applicable — this applet has no document status flow or posting of its own. The behaviour of the pipeline is fixed in the backend and driven by the company settings above and by the per-document `einvoice_submission_type` and `skip_einvoice` flags set in the originating applets.

### Feature visibility / permissions

No client-side permission definitions are seeded for `myIEnvoiceAdminApplet` in `bl_applet_client_side_perm_dfn` (0 rows on 2026-09-05), and the applet checks none. On load the app asks for `API_TNT_DM_ERP_STATEMENT_OF_ACCOUNT_READ`, `TNT_TENANT_ADMIN` and `TNT_TENANT_OWNER` for the permission wizard. Server-side, every endpoint the screens call is guarded by the constants in `EInvoicePermissions.java` (families such as `API_TNT_DM_ERP_COMP_INTERMEDIARY_SYSTEM_*`, `API_TNT_DM_EINVOICE_EMAIL_PRINTABLE_QUEUE_*`, `API_TNT_DM_ERP_FROM_IRB_DOCUMENT_QUEUE_*`, `API_TNT_DM_ERP_EINVOICE_PURCHASE_DOC_UNMATCHED_HISTORY_*`); assign them through Settings → Permission Set / Role Permission.

## Fields

This applet edits e-invoice records, not accounting documents. The tables below cover the three forms a user actually types into.

**To IRB E-Invoice / pool edit — Account tab (buyer for sales, supplier for purchase)**

| Field | Meaning | Required for submission | Notes / validation |
|---|---|---|---|
| Name | Buyer or supplier name as sent to LHDN | Yes | Special characters have caused LHDN rejections; sanitisation is tracked in the applet repo (#36). |
| ID Type | `NRIC`, `BRN`, `PASSPORT`, `ARMY` (`IDTypeOptions`) | Yes | Foreign individuals must be `PASSPORT`, not `NRIC` (LHDN CF324). |
| ID No | The identifier matching the ID type | Yes | NRIC must be 12 digits without hyphens; a BRN in the NRIC field is rejected. |
| Tax ID (TIN) | LHDN TIN | Yes | `Get TIN` / `Verify TIN` call the LHDN TIN search; the general TINs are `EI00000000010` (local buyer / general public — only valid with a real NRIC on an individual e-invoice), `EI00000000020` (foreign buyer), `EI00000000030` (foreign supplier), `EI00000000040` (government). |
| Sales Service Tax ID | SST number | No | Sent as `NA` when blank. |
| Email, Contact No | Buyer/supplier contact | Contact no: yes | Phone is accepted only when 8–20 characters (`isPhoneNoValid`). |
| Address line 1, City, State (+ lines 2–3, postcode, country) | E-invoice address | Line 1, city, state: yes | State is matched to the LHDN state code by exact, cleaned, contains and alias matching; when nothing matches the state code is left empty and must be keyed by hand. Code `17 (Not Applicable)` is no longer accepted by LHDN. |

**Rejection Request (Cancellation → Rejection Requests → row → Update)**

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Reason | Free text sent to LHDN as the cancellation reason | Yes | — |
| System Approval Status | `APPROVED`, `REJECTED`, `ON-HOLD` | Yes, to proceed | Only `APPROVED` requests are picked up. |
| Processing Logic | `REGEN_NEW_EINVOICE`, `VOID_ORIGINAL_DOC`, `CANCEL_EINVOICE` (stored as `CANCEL_FOR_EDIT_AND_RESUBMIT`), `NEW_REVERSAL_DOC` | Yes, to proceed | What happens to the source document after LHDN cancels — see Lifecycle. |
| System Processing Status | `IN-PROGRESS`, `COMPLETED` | — | Set by the system; mark `COMPLETED` by hand only after a manual cancellation. |

**Bulk TIN Validation (Tools → Bulk Tin Validation → Create)**

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Delimiter | CSV delimiter (comma or pipe) | Yes | Default is the second option in the list; a template CSV can be downloaded from the screen. |
| File | One `.csv` file | Yes | Each row is queued (`bl_fi_my_einvoice_tin_update_request_queue`); on approval the queue row writes `einvoice_tax_id_no` onto the entity and is deleted (`MyEInvoiceTinUpdateRequestQueueService.updateEntityAndDeleteFromQueue`). |

## Lifecycle and effects

{{< figure src="/images/my-e-invoice-admin-applet/lhdn-core-workflow.png" alt="Core e-invoice workflow diagram: a FINAL generic document enters the posting queue, is routed to the to-IRB tables or to the batch, individual or single-general pool by submission type, amount and mandatory-field checks, then flows through the submission, validation and e-mail queues" caption="Core e-invoice workflow for LHDN submission — the processors and tables behind the screens of this applet." >}}

### 1. Entry gate (trigger processor, at FINAL)

`GENERIC_DOCUMENT_E_INVOICE_POSTING_QUEUE_PROCESSOR` fires when a generic document's `posting_status` becomes `FINAL`. It proceeds only if **all** of these hold (`GenericDocumentEInvoicePostingQueueProcessor.processEvent`): the company's `einvoice_status` is `ENABLED`; the document type is an e-invoice type — sales types `INTERNAL_SALES_INVOICE`, `INTERNAL_SALES_CASHBILL`, `INTERNAL_SALES_CREDIT_NOTE`, `INTERNAL_SALES_DEBIT_NOTE`, `INTERNAL_SALES_REFUND_NOTE`, `INTERNAL_SALES_RETURN`, or a purchase type with `einvoice_self_billed = TRUE` (`MyEInvoiceSharedService.checkDocTypeValidity`); `skip_einvoice` is false; and no ACTIVE posting-queue row already exists for the same `server_doc_1` + document type (`isDuplicateDoc`). If any check fails the event is consumed and nothing is written — no queue row, no pool row, no error (the "ghost document" failure in Troubleshooting).

Routing by `einvoice_submission_type`:

| Submission type | Document type | `amount_txn` | Goes to |
|---|---|---|---|
| `CONSOLIDATED` | Sales Invoice or Cash Bill (`ENFORCE_INDIVIDUAL_DOCS`) | ≥ RM 10,000 | **Individual Pool**, reason "Amount transaction is greater or equal to RM10000" |
| `CONSOLIDATED` | any other, or < RM 10,000 | — | **Batch Pool** |
| `INDIVIDUAL`, `SINGLE-GENERAL` or blank | any | — | **Posting Queue** (`bl_fi_generic_doc_einvoice_posting_queue`, `queue_status = QUEUED`) |

The RM 10,000 threshold is hard-coded (`BigDecimal.valueOf(10000)`, inclusive) and the enforced types are only Sales Invoice and Cash Bill (`EInvoiceConstants.ENFORCE_INDIVIDUAL_DOCS`).

For foreign-currency documents the source used from here on is the forex child or the base MYR document according to `einvoice_forex_gendoc_posting_logic` (see Configuration).

### 2. Posting queue → to-IRB or a pool (cron `E_INVOICE_GENERIC_DOCUMENT_TO_IRB_PROCESSOR`)

The processor builds the to-IRB header and lines from the document, the company and the entity (`MyEInvoiceToIRBProcessorService.initDecision`). The buyer of a sales document is taken, in priority, from `einvoice_buyer_entity_hdr_json`, then `einvoice_entity_hdr_json`, then the entity record (`handleSalesDoc`); the supplier of a self-billed purchase document likewise from `einvoice_supplier_entity_hdr_json`, `einvoice_entity_hdr_json`, then the entity record. When `amount_txn ≥ 10,000`, the ID type is `BRN` and the TIN is blank, the processor searches LHDN for the TIN and writes it back to the entity, the document JSON and the header (`performTinCheckingFromDoc`).

It then runs the **mandatory-field check** (`getHdrDecision`, `getLineDecision`):

- Header: supplier and buyer name, TIN, ID type, ID value; supplier MSIC code and business-activity description; both address JSONs with line 1, city and state; both contact numbers 8–20 characters; e-invoice version, type and code; e-invoice datetime; document currency; sub-total, total excluding and including tax.
- Every line: classification, item name, unit price, taxable-type code, tax amount.

Outcome:

| Check passed? | `einvoice_submission_type` | Result |
|---|---|---|
| Yes | any | To-IRB header + lines created (`submission_status = NOT_SUBMITTED`), individual submission queue row created |
| No | `INDIVIDUAL` | Individual Pool |
| No | `SINGLE-GENERAL` | Single General Pool (Individual Pool when `amount_txn ≥ 10,000`) |
| No | blank | Batch Pool (< RM 10,000) or Individual Pool (≥ RM 10,000) |

These are the 23 scenarios of the internal routing simulation; the guide [E-Invoice Pools & Submission Routing](/guides/einvoice-guides/einvoice-pools-and-routing/) walks through them.

### 3. Pools — what the buttons do

| Action | Backend | Effect |
|---|---|---|
| Save and Resubmit (any pool) | `POST …/batch-pool-doc-hdrs/save-and-resubmit`, `…/individual-pool-doc-hdrs/save-and-resubmit`, `…/single-general-pool-doc-hdrs/save-and-resubmit` | Writes your corrections to the entity / document JSON, re-runs the mandatory check and, if it passes, creates the to-IRB header and the individual submission queue row. On the Batch Pool the row is marked `PROCESSED` with `queue_status = SUCCESS` or `FAILED` and the reason in **Validation Error** (`MyEinvoiceBatchPoolDocService.processDecision`). |
| Process (Batch Pool) | `POST …/process-batch-pools` | Same check for the selected rows, without edits. |
| Consolidate / Consolidate By Branch (Batch Pool) | `POST …/consolidate-batch-pools`, `…/consolidate-batch-pool-by-branch`, `GET …/run-consolidate-by-branch` | Groups the selected UNPROCESSED rows into consolidated to-IRB headers (one per company and document type, or per branch, consecutive document range and general TIN) and queues them in the consolidated submission queue; rows become `PROCESSED / SUCCESS` and a `batch_pool_to_irb_link` is written per document. Buyer = General Public `EI00000000010`, classification `004`, billing frequency `Monthly`. By-branch consolidation is capped at 200 lines per e-invoice. |
| Move to Individual / Single General / Batch Pool | `POST …/move-to-individual-pool`, `…/move-to-single-general-pool`, `…/move-to-batch-pool`, `…/move-single-general-to-*` | Re-homes the row. **Backend rejection:** moving a Sales Invoice or Cash Bill of `amount_txn ≥ 10,000` from the Individual Pool to the Batch Pool throws `Cannot move transaction with amount more than or equal to 10000.` (`MyEInvoicePoolConversionService.checkIfPoolConversionAllowed`). |
| Submit as Individual / Submit as Single General (Batch Pool) | `…/move-to-individual-pool-and-submit`, `…/move-to-single-general-pool-and-submit` | Move and immediately attempt submission. |
| Skip E-Invoice | `DELETE …/skip-e-invoice/backoffice-ep/{guid}`, `POST …/bulk-skip-einvoice` | Deletes the pool row and sets `skip_einvoice = true` on the generic document (`MyEinvoiceBatchPoolDocService.skipEInvoice`), which also removes it from the monthly tally. |

Documents left `UNPROCESSED` in the Batch Pool are consolidated automatically by `E_INVOICE_BATCH_PROCESSING_CYCLE_RUN_PROCESSOR` for the current month (advisory lock, 6-hour expiry). Documents in the Individual or Single General pool **stay there until someone acts** — there is no ageing alert (open issue).

### 4. Submission, validation and e-mail (cron)

| Processor | Table it drains | Effect |
|---|---|---|
| `E_INVOICE_TO_IRB_SUBMISSION_PROCESSOR` | individual submission queue | Sends the payload to LHDN; on success creates a submission-history row, deletes the queue row, clears the pool row and updates the to-IRB header; on failure the header stays `IN_QUEUE` with the error on the queue row. The `dateTimeIssued` sent to LHDN is always *now*, not `date_txn` (LHDN rejects back-dated issue times). Up to 50 iterations per run. |
| `CONSOLIDATED_E_INVOICE_PROCESSOR` | consolidated submission queue | Sends consolidated payloads created since the first day of the month. Manual alternative: **Consolidated Submission → Submit** (`…/consolidated-submission-queues/submit-to-lhdn`; support also has `/backdated` and `/no-date-checks` variants). |
| `E_INVOICE_TO_IRB_VALIDATION_STATUS_UPDATE_PROCESSOR` | validation queue | Polls LHDN and writes `einvoice_document_status` = `Submitted`, `Valid`, `Invalid` or `Cancelled` (`MyEInvoiceLHDNDocumentStatus`) plus the LHDN document UUID and `validation_datetime`. |
| `E_INVOICE_EMAIL_PRINTABLE_QUEUE_PROCESSOR` | e-mail printable queue | E-mails the validated PDF to the buyer (up to 10 per run, 5 retries, 15-minute advisory lock). Shown in **Email Dashboard**. |
| `E_INVOICE_INDIVIDUAL_POOL_FAILURE_TRANSACTIONS_EMAIL_NOTIFICATION_PROCESSOR` | individual pool | E-mails a CSV of failed individual-pool transactions per company to the configured addresses. |
| `E_INVOICE_INTERMEDIARY_ACCESS_TOKEN_PROCESSOR` | company intermediary records | Regenerates the on-behalf-of token every ~20 minutes; without it every other processor fails. |

Status vocabulary on the to-IRB header: `NOT_SUBMITTED` → `IN_QUEUE` (queued or failed pre-LHDN) → `Submitted` (accepted by LHDN, awaiting validation) → `Valid` or `Invalid` → `Cancelled`; consolidated headers start at `IN_CONSOLIDATED_QUEUE`.

### 5. Fixing an Invalid e-invoice from To IRB E-Invoice

| Button | Backend | Rule |
|---|---|---|
| Save and Resubmit | `POST …/e-invoice/to-irbs/save-and-resubmit` → `MyEInvoiceToIrbResubmissionService.fixFromToIRB` | **Backend rejection:** throws `E-Invoice #… is already validated with 'Valid' status. Please cancel it first before creating a new invoice.` when the header is `Valid`, and `… is already submitted and pending LHDN validation. Please wait for the validation response.` when it is `Submitted`. Otherwise copies the corrections back to the generic document and re-queues. |
| Resubmit as New E-invoice | `POST …/to-irbs/resubmit-as-new-einvoice` → `resubmitAsNewEInvoice` | Throws `Document already exists with 'Valid' einvoice status …` for a Valid header and `Document already exists in the pool.` when the source is still sitting in a pool. For a `CONSOLIDATED` header it builds a new consolidated payload; for `SINGLE-GENERAL` it resubmits as a consolidated e-invoice containing only that document; for `INDIVIDUAL` it creates a fresh to-IRB header. |
| Request for Rejection | `POST …/e-invoice/request-rejections` | Creates a Rejection Request (`system_requestor_status = REQUESTED`, `system_processing_status = IN-PROGRESS`). Enabled only for `Valid` headers. |

### 6. Cancellation (Rejection Requests → Cancellation Queue)

**A rejection request never advances on its own.** No cron, no processor and no LHDN callback moves it: a request created and left alone stays at `REQUESTED` / `IN-PROGRESS` until the 72-hour window expires and the option is gone. Every step below is a human pressing a button:

1. **Create** the request (from To IRB E-Invoice, or a buyer creates it in the Portal applet).
2. **Approve**: open the request, set System Approval Status = `APPROVED` and choose a Processing Logic. Approving with `VOID_ORIGINAL_DOC` or `REGEN_NEW_EINVOICE` stamps `blg_cancellation_datetime` on the to-IRB header; un-approving clears it (`MyEinvoiceRequestRejectionService.updateBlgRejectionRequestApprovalDatetime`).
3. **Process Request**: builds a Cancellation Queue row and calls LHDN synchronously (`POST …/request-rejections/submit-to-lhdn`). Only requests with `system_processing_status = IN-PROGRESS`, `system_approval_status = APPROVED` and a non-null processing logic are picked up.

Before the LHDN call the backend validates the header (`MyEInvoiceGenDocToIrbCancellationQueueService.isCancellationRequestValid`): `einvoice_document_status` must be `Valid` ("Not Validated" otherwise), `lhdn_document_guid` must exist ("e-invoice is not generated yet"), and fewer than 72 hours must have passed since `validation_datetime` ("Passed 72 hours from validation date time"). The clock runs from the header's `validation_datetime`, not from what the user sees on the LHDN portal.

| Processing logic | After LHDN cancels | Works for a consolidated e-invoice? |
|---|---|---|
| `VOID_ORIGINAL_DOC` | First dry-checks that the source generic document can be converted to VOID; after a successful cancel it voids the document (`updatePostingStatusToVoid`) | No — the request has no `generic_doc_hdr_guid`, so it fails with `Can not void the generic document` before LHDN is called |
| `REGEN_NEW_EINVOICE` | Cancels, then regenerates a new e-invoice from the same document | No — same reason |
| `NEW_REVERSAL_DOC` | Creates a reversal generic document and e-invoices it | Not applicable |
| `CANCEL_FOR_EDIT_AND_RESUBMIT` (shown as `CANCEL_EINVOICE`) | Cancels at LHDN only (`onlyCancel = true`); you fix and resubmit yourself | **Yes** — the only correct choice for consolidated e-invoices |

Every outcome sends an e-mail notification (`CANCELLATION_SUCCESS`, `CANCELLATION_FAILED`, `CANCELLATION_REQUEST_NOT_ELIGIBLE`, `VOID_ORIGINAL_DOC_FAILED`, …). Past 72 hours there is no cancellation: the remedy is a credit note e-invoice referencing the LHDN UUID of the wrong e-invoice, with accountant sign-off. Support also has a direct path without the approval workflow (`POST …/to-irbs/bulk-cancellation`, hard-coded reason "Duplicated EInvoice."; and `…/direct-cancellation/*`), and LHDN still applies the 72-hour rule to those.

### 7. Incoming e-invoices and reconciliation

`E_INVOICE_PURCHASE_DOC_MATCHING_QUEUE_PROCESSOR` (trigger, at FINAL) queues every non-self-billed purchase document whose supplier has a TIN into the PD Matching Queue; `E_INVOICE_SALES_DOC_MATCHING_QUEUE_PROCESSOR` queues sales documents finalised with `skip_einvoice = true` into the SD Matching Queue. The incoming side of the pairing is fed from **PEPPOL** and the **OCR e-mail intake** only — each row's **Match Source** column says which — and never from LHDN. *External Reception → Queue* stages the documents MyInvois returns for your company as buyer, but nothing promotes them to *From IRB E-Invoice* or into the matching queue, so both are empty in practice. **Auto Match** (`…/incoming-einvoice-matching-queues/process/execute/backoffice-ep`) pairs a row only when the supplier identity number, reference number, amount and document date all agree exactly; there is no tolerance and no partial match. A pair can also be made by hand from the PD Matching Queue's **Match Incoming Doc** tab (`…/manual-matching/backoffice-ep`). Matched pairs go to *Matched History* and can be undone with **Pushback to Queues**; **Push to Unmatched History** parks a row and **Pushback to PD Matching Queue** restores it. Nothing here changes the purchase or sales document — no posting, no status change, no tax. See [Incoming Supplier E-Invoices](/guides/einvoice-guides/einvoice-incoming-supplier/) for the operator's version.

### 8. Monthly Report → Discrepancies Report

The applet's only self-service reconciliation tool, and the one screen that answers "did everything I sold last month actually reach LHDN?". **Create** takes a company and a date range and generates a report header (`bl_fi_einvoice_discrepancies_report_hdr`) whose lines (`…_report_line`) are grouped totals — amount and document count per `section_code` — presented as four tabs:

| Tab | What it totals | Read it for |
|---|---|---|
| **Main** | The report header: company, start date, end date, process status | Which period and company you are looking at |
| **ERP Transaction Summary** | Your own documents: total sales built as invoice + cash bill + debit note, less credit note and refund note; the same shape for purchases; plus a **Skip Einvoice Documents** line | What your books say you sold and bought |
| **IRB Audit Summary** | The e-invoice side, per document type, each split into **Internal Submission**, **From E-commerce (self-billed)** and **From Supplier (Matched)**, with a **Cancelled** amount beside every type | What reached LHDN, and how much of it was later cancelled |
| **Document vs E-Invoice Discrepancy** | Two directions: **Exists in ERP, Missing in E-invoice** and **Exists in E-invoice, Missing in ERP**, each broken out per document type — and repeated in an *excluding consolidated* variant | The actual gap, and whether consolidation explains it |

Each discrepancy line drills into the documents behind it — the generic-document listing, the to-IRB listing, and, for a consolidated e-invoice, the list of source documents inside it (`bl_fi_einvoice_discrepancies_report_line_detail` holds the per-line references).

`E_INVOICE_DISCREPANCIES_REPORT_SCHEDULER_PROCESSOR` can generate last month's report automatically for **every company whose `einvoice_status` is ENABLED** and e-mail it to the address configured under the `DISCREPANCY_REPORT_EMAIL_NOTIFICATION` application config; the report itself is built by `E_INVOICE_DISCREPANCIES_REPORT_PROCESSOR`. Both are enabled per tenant during onboarding.

**What it cannot see:** it compares your documents against *BigLedger's* e-invoice records. It does not pull back what LHDN holds, so an invoice keyed straight into the MyInvois portal, or sent by another system, never appears here. A LHDN dashboard count higher than this report's is the signature of that case.

### 9. What this applet writes

`bl_fi_my_einvoice_to_irb_hdr` / `_line`, the three pool tables, the submission / consolidated / validation / cancellation / e-mail queues, `bl_fi_my_einvoice_batch_pool_to_irb_link`, `bl_fi_my_einvoice_request_rejection_internal_doc_hdr`, TIN update requests; on the source document only `skip_einvoice`, the e-invoice reference columns (`einvoice_to_irb_hdr_guid`, `einvoice_number`, `einvoice_document_status`) and — through `VOID_ORIGINAL_DOC` — `posting_status = VOID`. It never posts to the general ledger.

## Related applets

- [My E-Invoice Portal Applet](/applets/e-invoice/my-e-invoice-portal-applet/) — the buyer-facing side: a customer searches for their receipt, requests an individual e-invoice (which lands in Portal Request here) or raises a rejection request that appears in Cancellation → Rejection Requests.
- [My Peppol Admin Applet](/applets/e-invoice/mypeppol-admin-applet/) — takes e-invoices that LHDN has validated into its Waiting Queue for Peppol delivery.
- [Organisation Applet](/applets/master-data/organisation-applet/) — company e-invoice status, TIN/BRN/SST/MSIC, address and the e-invoice settings JSON.
- [Customer Applet](/applets/master-data/customer-applet/), [Supplier Applet](/applets/master-data/supplier-applet-1/) — the buyer/supplier fields that decide whether a document passes the mandatory check.
- [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [POS General](/applets/sales-workflow/pos-general-applet/), [Sales Credit Note](/applets/sales-workflow/internal-sales-credit-note-applet/), [Sales Debit Note](/applets/sales-workflow/internal-sales-debit-note-applet/), [Sales Refund Note](/applets/sales-workflow/internal-sales-refund-note-applet/), [Sales Return](/applets/sales-workflow/internal-sales-return-applet/) — where the submission type, skip flag and e-invoice tab live; credit/debit/refund notes and returns carry the original e-invoice reference.
- [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/) — self-billed purchase e-invoices enter the same pipeline when `EINVOICE_SELF_BILLED` is TRUE.
- [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/), [Tax Configuration](/applets/master-data/tax-configuration-applet/) — item classification codes and tax types on the lines.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| A finalised document is in no pool, no queue, and never reached LHDN ("ghost" document) | The entry gate found the company not ENABLED at the time of finalisation, the document type not e-invoiceable, `skip_einvoice` set, or an ACTIVE posting-queue row with the same document number; it then dropped the event silently. | Ask support to push the document with `POST …/generic-doc-posting-queues/push-gendoc-to-posting-queues`. Enable e-invoice on the company before finalising. Standing detection is an open backend issue. |
| Sales Invoice or Cash Bill of RM 10,000 or more sits in the Individual Pool for weeks | Documents at or above the threshold are diverted there and wait for buyer details; there is no ageing alert. Moving them back to the Batch Pool is refused (`Cannot move transaction with amount more than or equal to 10000.`). | Complete TIN, ID type/value, address and phone on the Account tab, then Save and Resubmit. Review the Individual Pool weekly. |
| Batch Pool row shows `PROCESSED / FAILED` with "Supplier TIN is missing", "Buyer address is missing", "contact no is missing" | Save and Resubmit was run before the master data was complete; the mandatory check failed again. | Fix the fields listed in **Validation Error**, then Save and Resubmit. A `FAILED` row is no longer `UNPROCESSED` and will *not* be swept into the monthly consolidation — decide whether to move it to a pool or skip it. |
| LHDN status `Invalid`, error `CF324` (identification number is not a valid NRIC) | Foreign customer keyed as `NRIC` instead of `PASSPORT`; NRIC stored with hyphens; a BRN in the NRIC field. | Correct ID type / value on the customer and on the Account tab, Save and Resubmit. |
| `Invalid`, error `CF358` (invalid buyer TIN) or "Only General TIN (010) …" (ERR245) | General Public TIN `EI00000000010` used on an individual e-invoice with an ID type other than `NRIC`, or with an invalid NRIC; or a real TIN combined with classification `004` (reserved for consolidated). | Supply the buyer's real TIN, or use `EI00000000010` only with a valid NRIC; change line classification away from `004`; Save and Resubmit. Alternatively move the document to the Batch Pool for consolidation (only below RM 10,000). |
| `Invalid`, error `DC511` "Foreign target currency should always be MYR" | Foreign-currency document whose `base_doc_ccy` is not `MYR`. | Set the document's base currency to MYR and resubmit. Check `einvoice_forex_gendoc_posting_logic` if the wrong document (forex vs local) is being submitted. |
| Credit / debit / refund note or sales return `Invalid` with `DR303` / `DR308` ("status of referenced document", "buyer … not the same as referenced document") | The note references the LHDN UUID of an *earlier, Invalid* submission of the original invoice, or a buyer that differs from the original. | Point `original_einvoice_lhdn_document_guid` at the currently Valid invoice (or clear the reference if no valid original exists) and Save and Resubmit. |
| Save and Resubmit refused: "already validated with 'Valid' status" / "already submitted and pending LHDN validation" | Backend guard on the To IRB header status. | A Valid e-invoice must be cancelled first (within 72 hours) or corrected with a credit note; a Submitted one must wait for the validation processor. |
| Rejection Request looks stuck at `REQUESTED / IN-PROGRESS` | Nothing advances a request automatically; it has no approval status or processing logic yet. | Open the request, set Approval Status = `APPROVED`, pick a processing logic, then **Process Request**. |
| Cancellation Queue → Request Error "Can not void the generic document" | `VOID_ORIGINAL_DOC` (or `REGEN_NEW_EINVOICE`) chosen for a consolidated e-invoice, which has no source document to void. | Use `CANCEL_EINVOICE` (`CANCEL_FOR_EDIT_AND_RESUBMIT`) for consolidated e-invoices, then re-push the remaining documents to the Batch Pool and consolidate them explicitly. |
| Request Error "Passed 72 hours from validation date time" | LHDN allows supplier cancellation only within 72 hours of validation; the backend applies the same check from `validation_datetime`. | Issue a credit note e-invoice referencing the wrong e-invoice's LHDN UUID (buyer General Public for a consolidated one). |
| The same document number appears twice in the submission listing | Not necessarily a duplicate. Sales invoices and self-billed purchase invoices draw their numbers from **two independent sequences that both start at the same value**, and the listing does not show the document's direction. | Check `generic_doc_hdr_server_doc_type` on both rows before concluding anything. A sales row and a purchase row sharing a number are two different documents; **do not cancel**. Only act if both rows are the same direction and the same source document. |
| The same sale appears in two Valid e-invoices (individual + consolidated, or two consolidated) | "Push to batch pool" was run twice, or the document was submitted individually while a copy still sat UNPROCESSED in the Batch Pool; neither path de-duplicates by document (fixed in the backend on 2026-08-20 for new pushes). | Within 72 hours: cancel the e-invoice containing the duplicate and re-consolidate the rest; after that, credit note. Always check the Batch Pool count before consolidating and never repeat a push on a timeout. |
| Consolidate By Branch swept in the first days of the next month | Timezone handling in the by-branch endpoint (fixed 2026-08-20). | Run consolidation after the month has closed in Malaysian time; if it happened, support reverts the pool rows and deletes the created headers and queue rows. |
| Every submission fails with "Access Token not available" or an authentication error | The intermediary token processor is not running, or the intermediary authorisation for your TIN expired or was removed on the MyInvois portal. | Check the processor with support; re-authorise BigLedger as intermediary on MyInvois and re-run `configure-intermediary`. |
| Rows stay `IN_QUEUE` in Individual Submission for more than a day | **Nothing re-drives a queued row, and the retry count is decorative.** `E_INVOICE_TO_IRB_SUBMISSION_PROCESSOR` takes one `NOT_SUBMITTED` row at a time (`LIMIT 1 … SKIP LOCKED`, up to 50 iterations per run); a row that errors is stamped `FAILED` / `SUBMISSION_FAILED` with the reason in `request_error`. The queue's `remaining_retries` column is written as `5` when the row is created (and reset to `5` on resubmission) and is **never decremented and never read by any code path** — a failed row showing "5 retries remaining" is not going to be retried. The only processor that revisits failed rows is `E_INVOICE_FAILED_SUBMISSION_PROCESSOR`, and it takes the **newest 10 first** (`order by created_date DESC`, default `limit` 10), so an old failed row can be starved indefinitely. | Select the rows and press **Submit**. If it recurs, ask support to check `E_INVOICE_TO_IRB_SUBMISSION_PROCESSOR` and the row's `request_error`; do not wait on the retry count. The only *real* retry counters in this applet are **Status Update Retry** on the Validation Queue (`doc_status_update_retries` — increments, and the row is deleted at 10 attempts or 3 days) and **Retry** on the Email Dashboard. Neither says anything about whether a submission will be retried. |
| State code empty on the address / `CV317` on a consolidated submission | State text could not be matched to an LHDN state (exact, cleaned, contains and alias matching all failed), or the legacy code `17` was sent. | Key the state in the LHDN spelling (e.g. `Wilayah Persekutuan Kuala Lumpur`, `Pulau Pinang`); code 17 is no longer accepted. |
| Consolidation fails for a document | `server_doc_1` (by document) or `server_doc_3` (by branch) is blank on the batch-pool row. | Support back-fills the column from the generic document before re-running. |
| Validated PDF e-mail not received | Row still `IN_QUEUE` in Email Dashboard, or an error code on the row; recipient e-mail blank on the buyer. | Fix the buyer's e-mail, use **Resend email with PDF** on the To IRB header, or wait for the next processor run (5 retries). |
| Monthly totals in BigLedger do not tally with LHDN | Documents stuck in a pool, `PROCESSED / FAILED` batch-pool rows, voided documents without `skip_einvoice`, ghost documents, or duplicates. | Run the Discrepancies Report for the month and clear the Unmatched lists; the internal tallying checks follow the same order. |

## Related documentation

- [E-Invoice Pools & Submission Routing](/guides/einvoice-guides/einvoice-pools-and-routing/) — the 23 routing scenarios and what to do in each pool
- [E-Invoice Validation Rules & Troubleshooting](/guides/einvoice-guides/einvoice-validation/) — mandatory fields, general TINs, currency and reference errors
- [MyInvois Setup Guide](/guides/einvoice-guides/myinvois-setup/) — company registration, intermediary authorisation and first submission
- [The Month-End E-Invoice Cycle](/guides/einvoice-guides/einvoice-month-end/) — the 1st-to-7th routine: pools, exports, the Invalid list and the monthly tally
- [Cancelling and Correcting a Validated E-Invoice](/guides/einvoice-guides/einvoice-cancel-and-correct/) — the 72-hour window, the rejection-request workflow and the credit-note path
- [E-Invoice module](/modules/e-invoice/) — module overview and related applets
