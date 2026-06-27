---
title: "Configuration"
description: "Step-by-step implementation workflow for configuring the E-Invoice & PEPPOL Module."
weight: 30
bookCollapseSection: false
---

Configuring the E-Invoice & PEPPOL Module follows a strict 5-phase dependency chain. Tax registrations and item classification codes must be established before API submission queues or automated clearance rules are enabled.

## Configuration Dependency Chain

![5-Phase ERP E-Invoice Setup Pipeline](/images/e-invoice/einvoice_configuration_workflow.png)

> [!WARNING]
> Tax Identification Numbers (TIN) and digital certificates must be uploaded in Core **before** attempting API submission clearance tests. Always complete setup phases in order.

---

## Phase 1: Tax Registrations & Certificates

**What you are doing:** Verifying company TIN, BRN, digital signing certificates, and SST tax codes.

| Setup Task | Required Applet |
|------------|-----------------|
| Branch & Entity Tax Profiles (TIN/BRN) | [Organisation Applet](/applets/master-data/organisation-applet/) |
| Digital Signing Certificate Upload | [MY E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/) |
| Output & Input SST Tax Code Mapping | Financial Accounting Configuration |

---

## Phase 2: Data & Classification Mapping

**What you are doing:** Mapping mandatory government classification codes, MSIC industry codes, and units of measure (UOM).

| Setup Task | Required Applet |
|------------|-----------------|
| Item Classification Codes & MSIC Mapping | [Doc Item Maintenance Applet](/applets/master-data/doc-item-maintenance-applet/) |
| Standard Government Unit UOM Conversions | [Doc Item Maintenance Applet](/applets/master-data/doc-item-maintenance-applet/) |

---

## Phase 3: API Credentials & PEPPOL Setup

**What you are doing:** Setting up tax authority API keys, sandbox credentials, and PEPPOL Access Point routing IDs.

| Setup Task | Required Applet |
|------------|-----------------|
| Tax Gateway API Client ID & Client Secret | [MY E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/) |
| PEPPOL Participant ID & Access Point Keys | [MY PEPPOL Admin Applet](/applets/e-invoice/mypeppol-admin-applet/) |

---

## Phase 4: Workflow & Submission Rules

**What you are doing:** Establishing real-time vs. 72-hour batch submission triggers and B2C monthly consolidation rules.

| Setup Task | Required Applet |
|------------|-----------------|
| Auto-Submission Triggers & Rejection Rules | [MY E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/) |
| B2C Retail Consolidated Invoicing Rules | [MY E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/) |

---

## Phase 5: Test & Validate (Smoke Test)

Before going live, complete these mandatory verification tests:

- [ ] **Sandbox Clearance Test:** Submit a test B2B commercial invoice in sandbox mode and confirm clearance UUID generation.
- [ ] **QR Code Verification Test:** Scan the generated clearance QR code on a test invoice PDF and verify valid tax portal confirmation.
- [ ] **Self-Billed Submission Test:** Issue a simulated self-billed e-invoice for foreign services and confirm tax authority validation.
