---
title: "E-Invoice & PEPPOL Guides"
description: "Set up MyInvois and PEPPOL integration, manage daily e-invoice operations, handle validation issues, and ensure Malaysia compliance"
tags:
- user-guide
- e-invoice
- peppol
- compliance
weight: 31
bookCollapseSection: false
---

Set up and manage your electronic invoicing — from MyInvois registration and PEPPOL configuration to daily e-invoice operations, validation troubleshooting, and Malaysia regulatory compliance.

---

## 🚀 Get Started / Setup

New to e-invoicing? Start with these essential configuration guides.

{{< cards >}}
  {{< card link="myinvois-setup" title="🇲🇾 MyInvois Setup" subtitle="Register and configure your company with LHDN's MyInvois portal" >}}
  {{< card link="peppol-configuration" title="🌐 PEPPOL Configuration" subtitle="Set up PEPPOL network for cross-border electronic document exchange" >}}
{{< /cards >}}

**What you'll set up:**
- MyInvois API credentials and company registration
- Digital certificate configuration
- PEPPOL participant ID and access point
- Tax identification number (TIN) mapping
- E-invoice document type mappings (Invoice, Credit Note, Debit Note)

{{< callout type="tip" >}}
**First time?** Complete MyInvois setup first — it's required for Malaysia compliance. PEPPOL is optional and only needed for cross-border B2B transactions.
{{< /callout >}}

---

## 📝 Daily Tasks

Once configured, e-invoicing integrates into your normal sales and purchasing workflows:

**Typical daily workflow:**
1. Create sales invoices / credit notes as usual
2. System auto-submits to MyInvois (or manually submit in batch)
3. Monitor submission status — Accepted ✅ / Rejected ❌
4. Handle rejected invoices — fix validation errors and resubmit
5. Receive inbound e-invoices from suppliers via PEPPOL

{{< callout type="info" >}}
**Seamless Integration**: Once set up, e-invoicing runs in the background. Your team creates invoices normally, and the system handles submission automatically.
{{< /callout >}}

---

## ⚠️ Common Scenarios / Pitfalls

{{< cards >}}
  {{< card link="einvoice-validation" title="✅ E-Invoice Validation Rules" subtitle="Understand validation requirements and fix common rejection errors" >}}
{{< /cards >}}

Watch out for these frequent e-invoice issues:

| Scenario | What Happens | How to Handle |
|----------|-------------|---------------|
| **TIN mismatch** | Buyer/supplier TIN doesn't match LHDN records | Verify TIN with customer/supplier, update master data |
| **Invalid tax code** | Tax rate not recognized by MyInvois | Use only LHDN-approved tax codes (6%, 8%, Exempt, etc.) |
| **Missing mandatory fields** | Submission rejected by validation | Check required fields: TIN, BRN, address, line item details |
| **API timeout** | Submission hangs or fails silently | Check internet connectivity, retry after a few minutes |
| **Duplicate submission** | Same invoice submitted twice | System prevents duplicates; check submission history |
| **Cross-border format** | PEPPOL document format mismatch | Verify document format matches recipient's PEPPOL requirements |

{{< callout type="warning" >}}
**Malaysia Deadline**: E-invoicing is mandatory for businesses above the revenue threshold. Ensure your setup is complete before the enforcement date to avoid penalties.
{{< /callout >}}

---

## 📊 Reporting Usage

Monitor your e-invoice compliance and submission health.

{{< cards >}}
  {{< card link="malaysia-e-invoice-guide" title="🇲🇾 Malaysia E-Invoice Compliance" subtitle="Complete guide to Malaysia's e-invoicing requirements, timelines, and best practices" >}}
{{< /cards >}}

**Key E-Invoice Reports:**
- **Submission Status Report** — Track Accepted, Rejected, and Pending submissions
- **Validation Error Report** — Common errors and rejection reasons
- **Compliance Dashboard** — Percentage of compliant transactions
- **PEPPOL Transaction Log** — Inbound/outbound PEPPOL document history

**Compliance tips:**
- Monitor rejection rates daily during initial rollout
- Keep TIN and BRN data up to date for all customers/suppliers
- Archive all e-invoice acknowledgements for audit purposes
- Test with sandbox environment before going live

---

## Related Resources

- **[My E-Invoice Admin Applet](/applets/e-invoice-admin-applet/)** — E-invoice administration reference
- **[Sales Invoice Applet](/applets/sales-invoice-applet/)** — Sales invoice documentation
- **[Purchase Invoice Applet](/applets/purchase-invoice-applet/)** — Purchase invoice documentation
- **[Compliance & Audit Guide](/guides/advanced/compliance-audit/)** — Regulatory compliance overview