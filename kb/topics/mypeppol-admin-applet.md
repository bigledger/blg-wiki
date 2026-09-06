---
topic: mypeppol-admin-applet
aliases: [Peppol admin, Peppol waiting queue, Peppol ID registration]
applets: [myPeppolAdminApplet]
modules: [e-invoice]
related: [my-e-invoice-admin-applet, e-invoice, organisation-applet, customer-applet, peppol]
wiki:
  - content/en/applets/e-invoice/mypeppol-admin-applet.md
  - content/en/guides/einvoice-guides/peppol-configuration.md
status: growing
updated: 2026-09-05
---

# My Peppol Admin Applet

Tenant-side Peppol console: posting queue → waiting queue → to-XAP documents → access point; received documents; participant registration; printable formats.

## Facts

- 2026-09-05 — Registry code `myPeppolAdminApplet`, name "My Peppol Admin Applet"; repo `blg-applet-wavelet-my-peppol-admin-applet` @55cc1a3. Sibling `peppolApAdminApplet` (access-point operator tool) has no wiki page. [src:planning/private/registry-applets-2026-09-05.tsv]
- 2026-09-05 — Peppol pipeline is independent of LHDN validation: trigger `GenericDocumentPeppolPostingQueueProcessor` needs FINAL + company `peppol_status = ENABLED` + `checkDocTypeValidity`; `PeppolPostingQueueToWaitingQueueProcessor.checkPostingQueueValidity` needs `initDecision().isToIRB()` (mandatory fields) + company and entity `peppol_participant_id` non-blank. No `einvoice_document_status == Valid` check anywhere in the Peppol processors. [src:akaun-api/.../jobProcessor/peppol/GenericDocumentPeppolPostingQueueProcessor.java L47–L49] [src:.../PeppolPostingQueueToWaitingQueueProcessor.java L123–L146]
- 2026-09-05 — Receiver ID = the entity's default Peppol ID (`bl_fi_entity_peppol_id.is_default`); missing sender/receiver → `validation_error = "Missing Peppol Sender or Receiver ID"`; valid SBDH → `[THIS_DOCUMENTS_IS_VALID]`. [src:javasdk/.../MyPplToXapDocUow.java L287–L289] [src:.../EinvoiceWaitingQueueToXapDocProcessor.java L137–L165]
- 2026-09-05 — Sender processor sets `submission_status = SUBMITTED` and deletes the waiting-queue row; AS4 failures return `AS4_ERROR_MESSAGE_RECEIVED` (`PeppolSenderCommonService` L64, L124); UI queue shows `AS4_ERROR_MESSAGE…`, `TRANSPORT_ERROR`, `SUBMITTED`; resend one row at a time (`submitQueue`). [src:.../EinvoiceWaitingQueuePeppolDataSenderProcessor.java L150–L165] [src:javasdk/.../peppol/sender/PeppolSenderCommonService.java] [src:.../state-controllers/internal-submission-queue-controller]
- 2026-09-05 — Only two settings consumed: `TO_PRINTABLE` (pre-selects export format on To Peppol AP export and, by copy-paste, on From Peppol export) and `FROM_PRINTABLE` (default marker in the From listing). Field Settings unbound; Default Selection unbound. [src:.../internal-submission-to-peppol-ap-account-export.component.ts L39] [src:.../external-reception-from-peppol-ap-account-export.component.ts L39] [src:.../printable-format-listing.component.ts L91, L201]
- 2026-09-05 — Registration goes cross-tenant to the AP tenant (`…/participant-registrations/{crossTenantCode}/cross-tenant-login-ep`), creates the SMP participant (`PeppolParticipantSmpService.createParticipant`), uploads KYC PDF (`smpKycPdfSign`), inserts company-receiver mapping; `posting_status` uses `PostingStatusColumn`. [src:akaun-api/.../PplApParticipantRegistrationController.java] [src:javasdk/.../PplApParticipantRegistrationService.java L69–L120] [src:javasdk/.../SMP/PeppolParticipantSmpService.java]
- 2026-09-05 — Peppol Testbed route exists but menu entries are commented out; Monthly Report listings start empty (`rowData = []`) and fill on Generate Report — no mock data found (old page claimed sample data). [src:.../models/menu-items.ts L83–L87] [src:.../queue-report-listing.component.ts L98]
- 2026-09-05 — Effects in this repo are copy-pasted skeletons (`couponLineService`, `batchPoolEventService`, `ticketScannedService` variable names) — the injected types are the real Peppol services; do not trust variable names when tracing. [src:.../state-controllers/*/store/effects]
- 2026-09-05 — External context: Malaysian SMP migrated to new OpenPeppol SML/T-SML domains (2026); automated MDEC KYC being introduced; monthly TSR reporting is done by BigLedger as AP. [src:gh:bigledger/blg-intranet#5007] [src:gh:bigledger/blg-intranet#1373] [src:gh:bigledger/blg-intranet#5693]

## How it connects

- **my-e-invoice-admin-applet** — shared `initDecision`; same master-data failures park documents in both pipelines.
- **organisation-applet** — `peppol_status`, `peppol_participant_id`, Peppol Config tab mirror.
- **customer-applet** — default Peppol ID per entity is the receiver.

## Open questions

- Is the LHDN-independence intentional (Peppol invoice sent before LHDN validates)? Vincent to confirm; the old page and the guide say the opposite.
- Should `peppolApAdminApplet` get a page (registry has a documentation_url pointing to `/applets/peppolap-admin-applet/` which does not exist)?

## Wiki impact

- `guides/einvoice-guides/peppol-configuration.md` and the modules e-invoice pages: remove "after LHDN validates" wording for the Waiting Queue.
