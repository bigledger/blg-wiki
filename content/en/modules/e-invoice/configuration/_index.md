---
aliases:
- /modules-v2/e-invoice/configuration/
title: "Configuration"
description: "Step-by-step implementation workflow for configuring the E-Invoice & PEPPOL Module."
weight: 30
bookCollapseSection: false
---

Configuring the E-Invoice & PEPPOL Module follows a strict 5-phase dependency chain. Tax registrations and item classification codes must be established before any document is finalised, because a document finalised before its company is enabled never enters the pipeline at all.

The step-by-step version of everything below, written for the person doing it, is [MyInvois Setup](/guides/einvoice-guides/myinvois-setup/).

## Configuration Dependency Chain

> [!WARNING]
> E-invoicing must be switched **on** for a company before any of its documents are finalised. A document finalised while the company is not enabled is dropped silently — no queue row, no pool row, no error. Always complete the setup phases in order.

---

## Phase 1: Tax Registrations & Company Identity

**What you are doing:** Verifying company TIN, BRN, MSIC code, registered address and SST tax codes. These become the *supplier* block of every sales e-invoice, so one bad field here fails every document at once.

| Setup Task | Required Applet |
|------------|-----------------|
| Branch & Entity Tax Profiles (TIN/BRN/MSIC/address/phone) | [Organisation Applet](/applets/master-data/organisation-applet/) |
| Company e-invoice status set to ENABLED — before finalising anything | [Organisation Applet](/applets/master-data/organisation-applet/) |
| Output & Input SST Tax Code Mapping | Financial Accounting Configuration |

---

## Phase 2: Data & Classification Mapping

**What you are doing:** Mapping mandatory government classification codes, MSIC industry codes, and units of measure (UOM).

| Setup Task | Required Applet |
|------------|-----------------|
| Item Classification Codes & MSIC Mapping | [Doc Item Maintenance Applet](/applets/master-data/doc-item-maintenance-applet/) |
| Standard Government Unit UOM Conversions | [Doc Item Maintenance Applet](/applets/master-data/doc-item-maintenance-applet/) |

---

## Phase 3: Intermediary Authorisation & PEPPOL Setup

**What you are doing:** Letting LHDN know that BigLedger may submit on your behalf, and registering your PEPPOL participant IDs. There is **no client ID, client secret or certificate for you to enter anywhere in BigLedger** — the credentials are held centrally and BigLedger submits as your intermediary.

| Setup Task | Where |
|------------|-------|
| Authorise BigLedger as your e-invoice intermediary, granting the full permission set | MyInvois portal (LHDN's own website) |
| PEPPOL Participant ID registration and KYC | [MY PEPPOL Admin Applet](/applets/e-invoice/mypeppol-admin-applet/) |

The authorisation expires. When it lapses, every submission for that company stops at once with an authentication error while every document looks perfectly fine — diarise the renewal a month ahead.

---

## Phase 4: Workflow & Submission Rules

**What you are doing:** Setting the e-invoice submission type on your sales document types, and confirming the monthly consolidation schedule for each company. Consolidated e-invoices for a month must be validated by the **7th** of the following month; BigLedger runs consolidation on a per-company schedule a few days ahead of that.

| Setup Task | Required Applet |
|------------|-----------------|
| Default submission type per document type (Individual / Consolidated / Single General) | [MY E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/) |
| Confirm the consolidation run day for each company | Your BigLedger onboarding contact |

See [Pools & Submission Routing](/guides/einvoice-guides/einvoice-pools-and-routing/) for what each submission type does, and [The Month-End Cycle](/guides/einvoice-guides/einvoice-month-end/) for the routine this sets up.

---

## Phase 5: Test & Validate (Smoke Test)

Before going live, complete these mandatory verification tests:

- [ ] **Sandbox Clearance Test:** Submit a test B2B commercial invoice in sandbox mode and confirm clearance UUID generation.
- [ ] **QR Code Verification Test:** Scan the generated clearance QR code on a test invoice PDF and verify valid tax portal confirmation.
- [ ] **Self-Billed Submission Test:** Issue a simulated self-billed e-invoice for foreign services and confirm tax authority validation.
