---
title: "Best Practices"
description: "Operational recommendations for clearance rejection handling, digital certificate renewals, and audit archival."
weight: 60
bookCollapseSection: false
---

Follow these operational best practices to ensure continuous tax compliance, eliminate clearance rejection delays, and maintain audit readiness.

## 1. Automated Rejection Alert Monitoring
- **Daily Rejection Queue Audits:** Monitor tax authority submission rejection logs daily in the [MY E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/) to correct invalid customer TINs or missing MSIC codes within the statutory 72-hour window.
- **Master Data Pre-Validation:** Enable automated TIN and BRN format checks during customer profile creation to prevent downstream billing rejections.

## 2. Digital Certificate & Archival Security
- **Proactive Certificate Renewal:** Track digital signing certificate expiration dates in [MY E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/) and renew certificates 30 days prior to expiry to avoid operational billing halts.
- **7-Year Compliance Archival:** Ensure all validated XML/JSON payloads, clearance UUIDs, and response logs are archived securely in cloud storage for statutory tax audit periods.
