---
aliases:
- /modules-v2/e-invoice/related-applets/
title: "Related Applets"
description: "Complete guide to native BigLedger applet connections and dependencies supporting the E-Invoice & PEPPOL Module."
weight: 70
---

The E-Invoice & PEPPOL Module integrates seamlessly with core and supporting applets across BigLedger to deliver end-to-end tax compliance.

## Core E-Invoice Applets

{{< cards >}}
  {{< card link="/applets/e-invoice/my-e-invoice-admin-applet" title="MY E-Invoice Admin Applet" subtitle="Central compliance control hub — pools, submission and cancellation queues, consolidation, and reconciliation" >}}
  {{< card link="/applets/e-invoice/my-e-invoice-portal-applet" title="MY E-Invoice Portal Applet" subtitle="Billing clerk portal for manual tax invoice submission, clearance status checks, and PDF QR printing" >}}
  {{< card link="/applets/e-invoice/my-einvoice-for-customer-and-supplier-applet" title="MY E-Invoice for Customer & Supplier Applet" subtitle="External portal for trading partners to view validated tax documents and upload self-billed e-invoices" >}}
  {{< card link="/applets/e-invoice/mypeppol-admin-applet" title="MY PEPPOL Admin Applet" subtitle="International PEPPOL network access point configuration and global document exchange logs" >}}
{{< /cards >}}

## Ecosystem Master Data Dependencies

- **[Organisation Applet](/applets/master-data/organisation-applet/)**: Company TIN, BRN, and branch entity registrations.
- **[Customer Maintenance Applet](/applets/master-data/customer-maintenance-applet/)**: Customer TIN master records and buyer classification codes.
- **[Doc Item Maintenance Applet](/applets/master-data/doc-item-maintenance-applet/)**: Item classification codes, MSIC mapping, and UOM standards.
- **[Sales Invoice Applet](/applets/sales-workflow/internal-sales-invoice-applet/)**: Commercial sales billing triggers for e-invoice clearance.
