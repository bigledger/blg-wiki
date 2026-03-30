---
description: API reference documentation for Malaysia MyInvois (e-Invoice) integration.
tags:
- api-reference
- einvoice
title: E-Invoice API Reference
weight: 10
---

API reference for BigLedger's Malaysia MyInvois (e-Invoice) module. These APIs cover the full lifecycle of e-invoice processing including submission, cancellation, and rejection workflows.

## Available Sections

- **[E-Invoice Submission](E-Invoice-Submission/)** — End-to-end guide covering setup, document types, pool routing, submission flow, and APIs for self-billing and resubmission.
- **[E-Invoice Cancellation & Rejection](einvoice-cancellation-and-rejection/)** — APIs for handling buyer-initiated rejection requests and submitting cancellation to LHDN MyInvois.
- **[LHDN Integration APIs](lhdn-integration-apis/)** — APIs for TIN validation, TIN search, submission document details, and querying documents directly from LHDN MyInvois.
- **[E-Invoice Document Query APIs](document-query-apis/)** — APIs for searching and retrieving internal e-invoice (`to_irb`) records stored in BigLedger.
- **[Get Notifications](Get-Notifications/)** — Webhook events and automated email notification tracking via the email printable queue and history APIs.
