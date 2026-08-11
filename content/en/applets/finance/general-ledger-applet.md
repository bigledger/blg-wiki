---
title: "General Ledger Applet"
description: "Core accounting and transaction processing engine for BigLedger financial operations"
tags:
- accounting-module
- financial-accounting
- general-ledger
- transaction-processing
- financial-reporting
weight: 175
---

## Purpose and Overview

{{< callout type="warning" >}}
**TODO**: This applet documentation needs detailed expansion. This is a placeholder with basic structure and key information.
{{< /callout >}}

The General Ledger Applet is the core accounting engine of BigLedger's Accounting Module, providing comprehensive transaction processing, account management, and financial reporting capabilities that form the foundation of all financial operations.

### Primary Functions
- **Transaction Processing** - Complete journal entry and posting management
- **Account Balance Management** - Real-time account balance tracking
- **Financial Reporting** - Standard and custom financial reports
- **Period Management** - Accounting period control and closing procedures
- **Audit Trail** - Complete transaction audit and history

## How Transactions Reach the General Ledger

Every ledger entry arrives through one of two doors:

| Source | Auto Flag | How it posts |
|---|---|---|
| **Finalised documents** (sales invoices, purchase invoices, payment vouchers, credit notes, cash bills…) | Auto | When a document is finalised, BigLedger generates its journal **in the background**, normally within moments of the save |
| **Manual journals** (Journal Transaction in the Ledger and Journal Applet) | Manual | Posted directly by the user — accruals, depreciation, reclassifications, opening balances |

### Posting lifecycle for document-generated journals

1. A document is saved as **Final** — it is locked and receives its running number immediately.
2. Its journal is generated in the background and appears in Journal Transaction (Auto Flag "Auto").
3. **Void** never deletes: it posts a mirror-image journal that reverses the original. Both stay visible in the audit trail.

Because step 2 runs in the background, "Final" means *saved and locked*, not yet *in the ledger* — the journal follows moments later. On rare occasions a journal is not generated (for example, a referenced GL account was deactivated after the document was created, or a default GL code was never configured). The **Missing Journal** screen in the Ledger and Journal Applet finds such documents and re-runs the posting, reporting the blocking reason if one exists. See the [Posting Status Explained guide](/guides/accounting-guides/document-posting-status/) for the recovery walkthrough, and the **Error Checking > Journal Not Balance** screen for detecting unbalanced manual journals.

## Key Features

- Transaction posting and reversals (void = mirror entry, full audit trail)
- Automatic journal generation from finalised documents (Auto Flag) alongside manual journals
- Missing Journal detection and re-posting for finalised documents whose journal was not generated
- Error Checking, including the Journal Not Balance screen for unbalanced journals
- Multi-currency transaction handling
- Financial statement generation

## Technical Specifications

### TODO: Complete Technical Specifications
- **Integration Points**: All financial modules
- **Performance**: High-volume transaction processing
- **Security**: Full audit trail and controls

## Integration Points

### Core Module Dependencies
- **[Chart of Account Applet](/applets/chart-of-account-applet/)** - Account structure foundation
- **[Tax Configuration Applet](/applets/tax-configuration-applet/)** - Tax calculations
- **[Organization Applet](/applets/organization-applet/)** - Multi-entity support

## Related Applets

### TODO: Document Related Applets
- Accounts Receivable Applet
- Accounts Payable Applet  
- Financial Reporting Applet
- Budget Management Applet

{{< callout type="info" >}}
**Documentation Status**: This applet requires comprehensive documentation including detailed features, configuration guides, use cases, and implementation examples.
{{< /callout >}}