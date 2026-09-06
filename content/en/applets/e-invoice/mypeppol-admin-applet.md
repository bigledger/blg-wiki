---
title: "My Peppol Admin Applet"
description: "Tenant-side console for Peppol document exchange: the posting and waiting queues that turn finalised sales documents into Peppol invoices, the outgoing submission queue and history, documents received from the access point, Peppol ID registration and printable formats."
applet_code: "myPeppolAdminApplet"
applet_repo: "blg-applet-wavelet-my-peppol-admin-applet"
modules: [e-invoice]
related_applets: [my-e-invoice-admin-applet, organisation-applet, customer-applet, supplier-applet-1, internal-sales-invoice-applet, pos-general-applet]
guides:
  - /guides/einvoice-guides/peppol-configuration/
sources:
  screens:
    - blg-applet-wavelet-my-peppol-admin-applet/micro-fe/projects/wavelet-erp/applets/my-peppol-admin-applet/src/app/app.routing.ts
    - blg-applet-wavelet-my-peppol-admin-applet/micro-fe/projects/wavelet-erp/applets/my-peppol-admin-applet/src/app/models/menu-items.ts
  configuration:
    - blg-applet-wavelet-my-peppol-admin-applet/micro-fe/projects/wavelet-erp/applets/my-peppol-admin-applet/src/app/components/settings-container/settings-container.component.html
    - blg-applet-wavelet-my-peppol-admin-applet/micro-fe/projects/wavelet-erp/applets/my-peppol-admin-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-wavelet-my-peppol-admin-applet/micro-fe/projects/wavelet-erp/applets/my-peppol-admin-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-my-peppol-admin-applet/micro-fe/projects/wavelet-erp/applets/my-peppol-admin-applet/src/app/components/settings-container/to-peppol-printable-format-settings-container/printable-format-listing/printable-format-listing.component.ts
    - blg-applet-wavelet-my-peppol-admin-applet/micro-fe/projects/wavelet-erp/applets/my-peppol-admin-applet/src/app/components/settings-container/from-peppol-printable-format-settings-container/printable-format-listing/printable-format-listing.component.ts
    - blg-applet-wavelet-my-peppol-admin-applet/micro-fe/projects/wavelet-erp/applets/my-peppol-admin-applet/src/app/components/internal-submission/internal-submission-to-peppol-ap-container/internal-submission-to-peppol-ap-edit/internal-submission-to-peppol-ap-account-export/internal-submission-to-peppol-ap-account-export.component.ts
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/peppol/GenericDocumentPeppolPostingQueueProcessor.java
  fields:
    - blg-applet-wavelet-my-peppol-admin-applet/micro-fe/projects/wavelet-erp/applets/my-peppol-admin-applet/src/app/components/peppol-config/peppol-id-registration/peppol-id-registration-create/peppol-id-registration-details/peppol-id-registration-details.component.html
    - blg-applet-wavelet-my-peppol-admin-applet/micro-fe/projects/wavelet-erp/applets/my-peppol-admin-applet/src/app/components/settings-container/to-peppol-printable-format-settings-container/add-printable-format/add-printable-format.component.html
  lifecycle:
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/peppol/GenericDocumentPeppolPostingQueueProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/peppol/PeppolPostingQueueToWaitingQueueProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/peppol/EinvoiceWaitingQueueToXapDocProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/peppol/EinvoiceWaitingQueueToXapDocProcessorService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/peppol/EinvoiceWaitingQueuePeppolDataSenderProcessor.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/erp/peppol/MyPplToXapDocUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/peppol/sender/PeppolSenderCommonService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/peppol/PplApParticipantRegistrationService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/peppol/SMP/PeppolParticipantSmpService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/peppol/MyPplEInvoiceWaitingQueueController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/peppol/PeppolToXapSubmissionQueueController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/peppol/MyPplToXapDocController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/peppol/PplApParticipantRegistrationController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/peppol/PplParticipantSmpLookupController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/eInvoice/shared/MyEInvoiceToIRBProcessorService.java
  troubleshooting:
    - gh:bigledger/blg-intranet#5672
    - gh:bigledger/blg-intranet#5007
    - gh:bigledger/blg-intranet#1373
    - gh:bigledger/blg-intranet#4255
    - gh:bigledger/blg-wiki#9
tags:
- peppol
- e-invoice
- document-exchange
- supplier-integration
- customer-integration
weight: 175
---

## Overview

The My Peppol Admin Applet is a tenant's own view of Peppol document exchange. Where the [My E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/) submits documents to LHDN, this applet turns the same finalised sales (and self-billed purchase) documents into Peppol invoices and hands them to BigLedger's access point, and shows what the access point has received for your Peppol IDs. Finance staff open it to watch the two queues, resubmit failed transmissions, register the company's Peppol participant IDs and choose the printable formats used when a sent or received Peppol document is exported. It creates no accounting entries.

{{< callout type="info" >}}
The Peppol pipeline runs *beside* the LHDN pipeline, not after it. A document enters the Peppol posting queue at FINAL when the company has Peppol enabled, and moves to the Waiting Queue as soon as it passes the e-invoice mandatory-field check and both parties have a Peppol participant ID. It does not wait for LHDN to return *Valid*.
{{< /callout >}}

## Where it fits

| Upstream | This applet | Downstream |
|---|---|---|
| Sales documents finalised in [Sales Invoice](/applets/sales-workflow/internal-sales-invoice-applet/), [POS](/applets/sales-workflow/pos-general-applet/) and the other sales / self-billed purchase applets, for a company with `peppol_status = ENABLED` | Posting Queue → Waiting Queue → Internal Submission (to-XAP documents, submission queue, history) | BigLedger's Peppol access point → the buyer's access point |
| Company Peppol participant IDs registered through **Peppol Config** ([Organisation Applet](/applets/master-data/organisation-applet/) holds the same records); customer / supplier Peppol IDs in the [Customer](/applets/master-data/customer-applet/) and [Supplier](/applets/master-data/supplier-applet-1/) applets | Read when a document is routed and when the receiver is resolved | — |
| Documents received by the access point for your Peppol IDs | External Reception → Docs Queue / Docs History / From Peppol AP | Purchase-side processing |
| [My E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/) | The e-invoice mandatory-field check is reused unchanged when deciding whether a document may enter the Waiting Queue | — |

## Screens and menus

| Menu | Sub-menu | Route | What it lists | Actions |
|---|---|---|---|---|
| Posting Queue | — | `posting-queue` | `bl_fi_generic_doc_peppol_posting_queue` — finalised documents waiting to be checked; tabs Document Details, Account (Entity Details, Bill To, Ship To), Lines | Submit (process selected now), Export, Withdraw |
| Waiting Queue | — | `waiting-queue` | `bl_ppl_einvoice_waiting_queue` — documents that passed the check and have a sender and receiver Peppol ID | Process (build and send now), Export, Withdraw |
| Internal Submission | To Peppol AP | `internal-submission-to-peppol-ap` | `bl_ppl_to_xap_doc_hdr` — every Peppol document built from your documents, with sender ID, receiver ID, org ID, buyer; tabs Details, Lines, Export | Export as PDF (with a *To Peppol* printable format) |
| | Queue | `to-peppol-submission-queue` | Submission queue rows with their `submission_status` (`SUBMITTED`, `AS4_ERROR_MESSAGE_RECEIVED`, `TRANSPORT_ERROR`, …) | Submit (resend one), Delete |
| | History | `to-peppol-submission-history` | Successfully transmitted documents | — |
| External Reception | Docs Queue | `external-reception-queue` | Received documents not yet processed | — |
| | Docs History | `external-reception-history` | Received documents processed | — |
| | From Peppol AP | `external-reception-from-peppol-ap` | Everything the access point delivered for your IDs (process ID, buyer, supplier, amounts); tabs Details, Lines, Export | Export as PDF (with a *From Peppol* printable format) |
| Peppol Config | Registration | `peppol-config-peppol-id-registration` | Participant registrations sent to the Malaysian SMP through BigLedger's access-point tenant | Create, Edit, upload KYC |
| | Registered Companies | `peppol-config-peppol-registered-companies` | The same registrations viewed per company | — |
| Monthly Report | Queue, History | `queue-report`, `history-report` | Per-company period summaries of Peppol traffic — the source of the statistics BigLedger files as an access point (see [Lifecycle](#lifecycle-and-effects)) | Generate Report |
| Settings | Field Settings · Default Selection · To Peppol AP Printable Format Settings · From Peppol AP Printable Format Settings · Webhook · Feature Visibility · Permission Wizard / Set / User / Team / Role | `settings/…` | See Configuration | — |
| Personalization | Default Selection · Sidebar | `personalization/…` | Per-user defaults | — |

The **Peppol Testbed** route (`peppol-testbed-receiving-test-history`) exists in the routing table but its menu entries are commented out at commit `55cc1a3`; it is reachable only by URL.

{{< figure src="/images/my-peppol-admin-applet/posting-queue.png" alt="Posting Queue listing with Submit, Export and Withdraw buttons and document rows" caption="Posting Queue — finalised documents waiting for the Peppol check." >}}

{{< figure src="/images/my-peppol-admin-applet/view-posting-queue-account.png" alt="View Posting Queue panel on the Account tab showing entity ID, name, TIN, entity type, identity type, ID number, SST number, e-mail and contact number" caption="Posting Queue → Account — the buyer identity that the mandatory-field check will test." >}}

{{< figure src="/images/my-peppol-admin-applet/waiting-queue.png" alt="Waiting Queue listing with Process, Export and Withdraw buttons" caption="Waiting Queue — documents ready to be built into Peppol invoices and sent." >}}

{{< figure src="/images/my-peppol-admin-applet/internal-submission-to-peppol-ap.png" alt="Internal Submission To Peppol listing with Doc Type, Doc No, Sender ID, Receiver ID, Org ID, Buyer Name and Buyer ID columns" caption="Internal Submission → To Peppol AP — one row per Peppol document built, with the sender and receiver participant IDs." >}}

{{< figure src="/images/my-peppol-admin-applet/internal-submission-queue.png" alt="Internal Submission Queue listing showing rows with AS4_ERROR_MESSAGE and TRANSPORT_ERROR submission statuses and a Submit button" caption="Internal Submission → Queue — transmission outcomes; failed rows can be resent one at a time." >}}

{{< figure src="/images/my-peppol-admin-applet/internal-submission-to-peppol-ap-export.png" alt="Internal Submission To Peppol Edit panel on the Export tab with a Printable Format dropdown and an EXPORT AS PDF button" caption="To Peppol AP → Export — the dropdown is pre-selected with the default *To Peppol* printable format." >}}

{{< figure src="/images/my-peppol-admin-applet/external-reception-from-peppol-ap.png" alt="External Reception From Peppol listing with Doc Type, Process ID, Buyer Name, Buyer ID, Buyer Tax ID and Supplier Name columns" caption="External Reception → From Peppol AP — documents delivered by the access point for your Peppol IDs." >}}

{{< figure src="/images/my-peppol-admin-applet/peppol-id-registration.png" alt="Peppol ID Registration listing with Company Code, Company Name, Company Reg. No., Registration Date and Registration Status columns" caption="Peppol Config → Registration." >}}

## Configuration

### Before you can use it

| Prerequisite | Where | Why |
|---|---|---|
| Company Peppol status **ENABLED** (`bl_fi_mst_comp.peppol_status`) | [Organisation Applet](/applets/master-data/organisation-applet/) → company → Peppol Config | The trigger processor creates a Peppol posting-queue row only when `posting_status = FINAL`, the company's `peppol_status` is `ENABLED` and the document type is e-invoiceable (`GenericDocumentPeppolPostingQueueProcessor.processEvent`). |
| Company Peppol participant ID (`peppol_participant_id`, e.g. `0230:…`) | Peppol Config → Registration in this applet, or Organisation Applet → Peppol Config | Required for the document to leave the Posting Queue (`checkPostingQueueValidity`). |
| Customer / supplier Peppol participant ID, with one marked default (`bl_fi_entity_peppol_id.is_default`) | [Customer](/applets/master-data/customer-applet/) / [Supplier](/applets/master-data/supplier-applet-1/) applets → Peppol Config tab | The receiver ID is looked up from the document's entity (`MyPplToXapDocUow.getPeppolReceiverIdForSubmission`); without it the document fails with *Missing Peppol Sender or Receiver ID*. |
| Everything the LHDN mandatory-field check needs (TIN, ID type/value, address with line 1 / city / state, phone 8–20 characters, MSIC, classification codes) | Organisation / Customer / Supplier / item masters — see the [admin applet page](/applets/e-invoice/my-e-invoice-admin-applet/#configuration) | The Waiting Queue decision reuses `MyEInvoiceToIRBProcessorService.initDecision`; a document that would land in an e-invoice pool also stays in the Peppol Posting Queue. |
| Job processors enabled for the tenant | BigLedger support | `GENERIC_DOCUMENT_PEPPOL_POSTING_QUEUE_PROCESSOR` (trigger), `PEPPOL_POSTING_QUEUE_TO_WAITING_QUEUE`, `EINVOICE_WAITING_QUEUE_TO_XAP_DOC_PROCESSOR`, `EINVOICE_WAITING_QUEUE_PEPPOL_DATA_SENDER_PROCESSOR`, the submission-queue and inbox processors. |
| Printable formats for exports | Settings → To / From Peppol AP Printable Format Settings | See below. |

### Applet settings

The applet-local **Field Settings** screen renders eight toggles (Unit Discount, SST/VAT/GST, WHT, Blanket Order, Segment, G/L Dimension, Profit Center, Project) with no form control — no exposed control found (routes and settings components checked at commit `55cc1a3`). **Default Selection** is routed directly with no binding for its `appletSettings$` input or `save` output, so its SAVE emits to nothing.

Two keys are consumed:

| Setting | Where it is set | What it controls | Default | Effect when changed |
|---|---|---|---|---|
| `TO_PRINTABLE` | Settings → To Peppol AP Printable Format Settings → select a format as default (`selectDefaultPrintableFormatInit`) | Pre-selects the Printable Format dropdown on **To Peppol AP → Export** and on the received-document export (`…-account-export.component.ts`, `printableFormat.setValue(settings?.TO_PRINTABLE)`) | none — the dropdown starts empty | Exports default to the chosen format; any format can still be picked per export. |
| `FROM_PRINTABLE` | Settings → From Peppol AP Printable Format Settings → select as default | Marks the default row in the *From Peppol* format listing | none | Note that the received-document export screen reads `TO_PRINTABLE`, not `FROM_PRINTABLE`, at commit `55cc1a3`. |

Printable formats themselves are `bl_prt_printable_format_hdr` records with a **Format Code**, **Format Name** and an uploaded template file (`printableFormatService.getFile`).

### Document behaviour settings

Not applicable — the applet has no documents of its own; behaviour is fixed in the backend processors described under Lifecycle.

### Feature visibility / permissions

No client-side permission definitions are seeded for `myPeppolAdminApplet` (0 rows in `bl_applet_client_side_perm_dfn` on 2026-09-05) and the applet reads no `HIDE_*` / `SHOW_*` keys. Server-side the Peppol controllers (`…/peppol/waiting-queues`, `to-xap-docs`, `to-xap-submission-queues`, `from-peppol-doc-hdr-queues`, `comp-peppol-ids`, `participant-registrations`) are guarded by their own permission constants; assign them through Settings → Permission Set / Role Permission.

## Fields

**Peppol Config → Registration (Create)**

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Company | The company being registered | Yes | One registration per company and scheme. |
| Company Name, Company Reg. No. | As they will appear in the SMP | Yes | |
| Special Identifier, Business Identifier | The Peppol scheme (e.g. `0230` for Malaysian TIN-based IDs) and the identifier value | Yes | Together they form the participant ID `scheme:identifier`. |
| Type | Registration type | Yes | |
| Name, Email, Phone Number, Websites, Geographical Information, Additional Information | Contact and directory details published with the participant | Name, Email | |
| Additional Identifier Code / Value | Extra identifiers (e.g. BRN) | No | Add / Remove Additional Identifier. |
| KYC document | PDF proving the company's identity | For approval | Uploaded to BigLedger and signed into the SMP (`uploadKycFileToBlgAndSmp`); the automated MDEC KYC flow is being introduced by the Malaysian SMP. |

Business Card, Contact, Company and Website sub-lists have Add / Remove buttons on the same form.

## Lifecycle and effects

1. **At FINAL** — `GENERIC_DOCUMENT_PEPPOL_POSTING_QUEUE_PROCESSOR` writes a `bl_fi_generic_doc_peppol_posting_queue` row (`process_status = UNPROCESSED`) when the company's `peppol_status` is `ENABLED`, the document type is one of the e-invoice sales types (or a self-billed purchase type) and `skip_einvoice` is false (`checkDocTypeValidity`). Nothing is written otherwise.
2. **Posting Queue → Waiting Queue** — `PeppolPostingQueueToWaitingQueueProcessor` (also **Submit** on the Posting Queue, `postMultipleToProcess`) runs the e-invoice construction and mandatory-field check on each UNPROCESSED row and creates a `bl_ppl_einvoice_waiting_queue` row only when the check passes **and** both `bl_fi_mst_comp.peppol_participant_id` and the entity's `peppol_participant_id` are non-blank (`checkPostingQueueValidity`). The posting-queue row is set to `PROCESSED` either way; a document that fails stays visible in the Posting Queue as processed without a waiting-queue row. **Withdraw** removes the row from the queue.
3. **Waiting Queue → To Peppol AP** — `EINVOICE_WAITING_QUEUE_TO_XAP_DOC_PROCESSOR` (also **Process**, `processNow` → `POST …/peppol/waiting-queues/process/execute/backoffice-ep`) builds the `bl_ppl_to_xap_doc_hdr` / lines from the document, company and entity, resolves the receiver from the entity's default Peppol ID, and validates the Standard Business Document (`createAndValidateSBDHDocuments`). A document with no sender or receiver ID is stamped `validation_error = "Missing Peppol Sender or Receiver ID"` and stops; a document that passes is stamped `[THIS_DOCUMENTS_IS_VALID]` and queued for sending.
4. **Sending** — `EINVOICE_WAITING_QUEUE_PEPPOL_DATA_SENDER_PROCESSOR` sends valid documents through the access point (`PeppolSenderCommonService`), deletes the waiting-queue row and sets `submission_status = SUBMITTED` on success; AS4 and transport failures are recorded on the submission-queue row (`AS4_ERROR_MESSAGE_RECEIVED`, `TRANSPORT_ERROR`) and can be resent from **Internal Submission → Queue → Submit** (`submitQueue`, one row at a time) or deleted. Successful transmissions appear in **History**.
5. **Receiving** — the access point delivers documents addressed to your participant IDs into the inbox queue; `FromPeppolDocHdrQueueProcessor` moves them from Docs Queue to Docs History and **From Peppol AP** lists the delivered headers with their process IDs.
6. **Monthly statistics** — as an accredited service provider BigLedger files two statistical reports to OpenPeppol every reporting period: a **Transaction Statistics Report (TSR)** and an **End User Statistics Report (EUSR)**, giving total exchanges, the transport protocol (AS4 v2.0) and a breakdown by opposite service provider, document type and country. That obligation is what the **Monthly Report** menu feeds. Note what the document-type breakdown shows: the traffic is the **Malaysian PINT billing profile of UBL Invoice 2** — domestic Malaysian B2B, not only cross-border. Peppol here is a delivery channel to a trading partner, and a Malaysian one counts.
7. **Registration** — Peppol Config → Registration creates a `bl_ppl_ap_participant_registration_hdr` in BigLedger's access-point tenant through the cross-tenant endpoints (`…/participant-registrations/{crossTenantCode}/cross-tenant-login-ep`), calls the Malaysian SMP to create the participant (`PeppolParticipantSmpService.createParticipant`) and uploads the KYC PDF; the registration's `posting_status` follows the standard column values (`DRAFT`, `FINAL`, `VOID`, `FAILED`, …) and a company-receiver mapping is inserted on success (`insertIntoCompRcvrMapping`). Existing participants can be looked up in the SMP by ID or by search word (`PplParticipantSmpLookupController`).

This applet writes the Peppol queue and document tables and the registration records only; it never changes the source document or posts journals.

## Related applets

- [My E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/) — same source documents, same mandatory-field check, separate pipeline to LHDN.
- [Organisation Applet](/applets/master-data/organisation-applet/) — company `peppol_status`, participant IDs and the Peppol Config tab that mirrors Registration here.
- [Customer Applet](/applets/master-data/customer-applet/), [Supplier Applet](/applets/master-data/supplier-applet-1/) — the counterparty's Peppol participant IDs (one must be default).
- [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [POS General](/applets/sales-workflow/pos-general-applet/) — where the documents originate.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| Document is `PROCESSED` in the Posting Queue but never reaches the Waiting Queue | It failed the e-invoice mandatory-field check, or the company or the customer has no Peppol participant ID. | Complete the same fields the LHDN pipeline needs (the document will also be sitting in an e-invoice pool with the reason), add the participant IDs, then Submit the row again. |
| To Peppol AP row with validation error *Missing Peppol Sender or Receiver ID* | The entity has Peppol IDs but none is marked default, or the company ID is blank. | Mark one customer Peppol ID as default; check the company's participant ID; Process again from the Waiting Queue. |
| Queue row `AS4_ERROR_MESSAGE_RECEIVED` | The receiving access point rejected the AS4 message (typically the receiver is not registered for the document type, or the SBDH failed their validation). | Confirm the receiver's participant ID and capabilities with an SMP lookup, correct the customer's Peppol ID, resend. |
| Queue row `TRANSPORT_ERROR` | Network or access-point outage during sending. | Resend from Internal Submission → Queue; if it recurs, contact support. |
| Documents sit in the Waiting Queue and `validation_error` on the to-XAP header stays empty | The waiting-queue processors are not running for the tenant. | Press Process to run them once; ask support to check the job-processor configuration. |
| SMP lookups or registrations fail after a Peppol infrastructure change | The Malaysian SMP migrated to the new OpenPeppol SML / T-SML domains in 2026; access-point providers had to switch lookup domains. | Handled on the access-point side by BigLedger; retry after the migration window. |
| Peppol Config "Create" does nothing or the listing does not refresh after creating a subsidiary's registration | Known front-end defect in the Customer applet's Peppol Config tab (tracked internally). | Refresh the listing; use this applet's Registration screen. |
| Monthly Report screens are empty | The Queue and History reports are driven by **Generate Report** for a period; they show nothing until generated. | Generate the report for the period. |
| The receiving side rejects the invoice on business rules although the AS4 transport succeeded | The purchase-order / sales-order number was not carried onto the Peppol invoice as `OrderReference`. Malaysian PINT validation checks for it. | Make sure the source document carries its PO / SO number and that it is mapped to the order reference; rebuild the Peppol document from the Waiting Queue and resend. |

## Related documentation

- [PEPPOL Configuration Guide](/guides/einvoice-guides/peppol-configuration/)
- [E-Invoice module](/modules-v2/e-invoice/)
