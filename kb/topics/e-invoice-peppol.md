---
topic: e-invoice-peppol
aliases: [Peppol, PINT-MY, Peppol AP, access point, SMP, SML, Peppol ID, MDEC KYC, G3 PKI, TSR, EUSR, AS4]
applets: [myPeppolAdminApplet, peppolApAdminApplet]
modules: [e-invoice]
related: [e-invoice, mypeppol-admin-applet, e-invoice-tin-and-identity-validation, customer-maintenance, supplier-maintenance, organisation-applet, internal-sales-invoice-applet]
wiki:
  - content/en/guides/einvoice-guides/peppol-configuration.md
  - content/en/applets/e-invoice/mypeppol-admin-applet.md
status: growing
updated: 2026-09-06
---

# Peppol — the network beside LHDN

LHDN's MyInvois is a clearance channel: you send the tax authority a document and it comes back Valid.
Peppol is a **delivery** network: a document goes from your access point to the buyer's access point,
addressed by participant ID. BigLedger runs an accredited Malaysian access point, so a document can go
to LHDN and to the buyer's system on two parallel tracks from the same finalised sales document. This
note holds the network-side facts: identifiers, the specification version, the certificate and lookup
migrations, registration/KYC, reporting obligations, and what the failures look like.

## Facts

### How the two pipelines relate

- 2026-09-05 — The Peppol pipeline runs **beside** the LHDN pipeline, not after it: a document enters the Peppol waiting queue as soon as it passes the e-invoice mandatory-field check and both parties have a participant ID. It does not wait for LHDN to return `Valid`. [src:akaun-api/.../jobProcessor/peppol/PeppolPostingQueueToWaitingQueueProcessor.java]
- 2026-09-05 — The Peppol waiting-queue decision reuses the **same** mandatory-field check as the LHDN path, so a document sitting in an e-invoice pool for missing buyer data is also stuck in the Peppol posting queue, for the same reason. [src:refs/blg-applet-wavelet-my-peppol-admin-applet]

### Specification and identifiers

- 2026-01-30 — Malaysia's Peppol profile is **PINT-MY**; version 1.2.1 was adopted in 2026 (published under the 2025-Q2 specification set). [src:gh:bigledger/blg-intranet#1961] [src:gh:bigledger/blg-intranet#324]
- 2026-01-30 — OpenPeppol migrated PINT document-type identifiers from the **`busdox`** scheme to the **`wildcard`** scheme: new lookup algorithm mandatory 2025-05-15, wildcard mandatory for PINT 2025-08-27 (no new busdox registrations from then), all remaining busdox PINT registrations removed from SMPs 2025-11-27. Service providers had to register new participants under wildcard and migrate existing ones. [src:gh:bigledger/blg-intranet#1962]
- 2026-09-05 — Malaysian participant IDs are registered with a **special identifier (scheme)** plus a **business identifier**, forming `scheme:identifier`; the applet's Registration screen exposes both, along with additional identifier codes (e.g. BRN). [src:refs/blg-applet-wavelet-my-peppol-admin-applet]
- 2026-03-05 — MDEC's Peppol ID specification v1.8 changed the structure for **Special Identifier 02 (Sabah) and 03 (Sarawak)**, and validation of those two takes **2–10 working days** because the registration number is checked manually at the local authority counter. [src:gh:bigledger/blg-intranet#1373]

### Registration and KYC

- 2026-03-05 — The Malaysian SMP replaced the "upload a signed PDF" KYC step with an **automated MDEC KYC**: participant name and ID are cross-verified against the company registry through MDEC middleware before the Peppol ID is published to the Peppol Directory and SML. The SMP UI gains a "Sign with MDEC KYC" option and the SMP API gains an endpoint to start KYC plus a status endpoint to poll. [src:gh:bigledger/blg-intranet#1373]
- 2026-09-05 — In BigLedger the registration is created in the access-point tenant through cross-tenant endpoints, the participant is created at the Malaysian SMP, and the KYC document is uploaded to both. [src:refs/blg-applet-wavelet-my-peppol-admin-applet]

### Infrastructure migrations the customer never sees but that break lookups

- 2026-04-03 — **PKI G2 → G3**: access points had to acquire G3 test and production certificates, add the G3 CA chain to the truststore, accept inbound from both G2 and G3, pass the reception and complete migration test suites, then cut production over to G3 exclusively — deadline 11 February 2026. [src:gh:bigledger/blg-intranet#1257] [src:gh:bigledger/blg-intranet#1258] [src:gh:bigledger/blg-intranet#1262]
- 2026-05-28 — **SML insourcing**: OpenPeppol moved the SML and T-SML to new lookup domains; access-point providers **must** use the new domains from **31 August 2026**, with participant lookups failing and non-compliance action possible otherwise. The Malaysian SMP production and test environments migrated on the announcement date. [src:gh:bigledger/blg-intranet#5007]

### Reporting obligations of an access point

- 2026-08-18 — BigLedger files two monthly statistical reports to OpenPeppol as a service provider: a **Transaction Statistics Report (TSR)** and an **End User Statistics Report (EUSR)**, per reporting period, listing total exchanges, transport protocol (AS4 v2.0), and exchanges broken down by opposite service provider, document type and country. Monthly filings are tracked as recurring issues. [src:gh:bigledger/blg-intranet#5693] [src:gh:bigledger/blg-intranet#5444] [src:gh:bigledger/blg-intranet#5256] [src:gh:bigledger/blg-intranet#4995]
- 2026-08-18 — The document type exchanged in those reports is the Malaysian PINT billing profile of UBL Invoice 2 — i.e. Malaysian domestic B2B traffic, not only cross-border. This contradicts the common assumption that Peppol is "for cross-border only". [src:gh:bigledger/blg-intranet#5693]

### Failures seen

- 2026-03-06 — Documents were failing MDEC's invoice validation until the **purchase-order / sales-order number was carried as `OrderReference`** on the Peppol invoice. [src:gh:bigledger/blg-intranet#4511]
- 2026-08-17 — A Peppol document header row can be left with an empty `validation_error` and nothing in the queue — i.e. a silent stall with no diagnostic, the Peppol equivalent of the e-invoice ghost-document problem. [src:gh:bigledger/blg-intranet#5672]
- 2026-02-03 — End-to-end sending and receiving between two tenants was broken during the build-out and had to be re-created by hand for debugging; Peppol testing was run as a standing joint exercise. [src:gh:bigledger/blg-intranet#1819] [src:gh:bigledger/blg-intranet#1879]
- 2026-04-02 — Customer-applet defect: the Peppol Config **Create** button misbehaves after a subsidiary is created and the listing does not refresh on create or update. [src:gh:bigledger/blg-intranet#4255]
- 2026-09-05 — Transmission outcomes recorded on the submission queue: `SUBMITTED`, `AS4_ERROR_MESSAGE_RECEIVED` (the receiving access point rejected the message — typically the receiver is not registered for that document type, or the business document header failed their validation) and `TRANSPORT_ERROR` (network / access-point outage). Failed rows are resent one at a time. [src:refs/blg-applet-wavelet-my-peppol-admin-applet]

### Applet-side work in flight

- 2026-05/2026-07 — Internationalisation and mobile-responsive UI work is open for `my-peppol-admin-applet`, `peppol-ap-admin-applet`, `my-einvoice-portal-applet` and `my-einvoice-for-customer-and-supplier-applet` (due 30 November 2026) — i.e. the Peppol screens are not yet mobile-ready. [src:gh:bigledger/blg-intranet#5116] [src:gh:bigledger/blg-intranet#5123] [src:gh:bigledger/blg-intranet#4839] [src:gh:bigledger/blg-intranet#4845]

## How it connects

- **e-invoice** — same source document, same mandatory-field check, different destination; a customer who fixes a buyer record fixes both pipelines at once.
- **mypeppol-admin-applet** — the tenant-facing screens: posting queue, waiting queue, to-AP documents, submission queue and history, inbox, registration, printable formats.
- **customer-maintenance / supplier-maintenance** — the counterparty's participant ID, with exactly one marked default, is what makes delivery possible; missing it is the commonest stall.
- **organisation-applet** — the company's own `peppol_status` and participant ID.
- **e-invoice-tin-and-identity-validation** — the identifiers are different (participant ID vs TIN) but the master record is the same, and both are checked before a document can move.

## Open questions

- What is the correct Malaysian Peppol participant-ID scheme prefix to publish? The wiki guide says `0195:` and the applet page says `0230:` — these cannot both be right. → kb/questions/2026-09-06-peppol-participant-id-scheme.md
- Is Peppol offered to every BigLedger customer, or only on request / for particular trading relationships? The guides present it as "optional, cross-border only", which the TSR/EUSR traffic contradicts.
- Are the wildcard-scheme migration and the G3 cut-over complete for all registered participants, so the wiki can describe only the current state?

## Wiki impact

- `peppol-configuration.md` is 180 words, states a participant-ID format that disagrees with the applet page, and describes a "PEPPOL Settings" menu that does not match the applet's menu. It needs rewriting from scratch.
- The Peppol guide should say plainly what Peppol *is for* here (delivery to a trading partner, Malaysian domestic included), what the customer must supply (their own participant ID, the counterparty's, and a KYC document), and what BigLedger does for them (access point, SMP registration, certificates, statistics reporting).
- Nothing in the guides tells a reader that a Peppol document waits on the **same** master data as the LHDN one — that single sentence would prevent a lot of confusion.
