---
title: "Merchant Applet"
description: "Comprehensive management system for platform merchant onboarding, administration, and contract lifecycle management"
tags:
- master-data
- merchant-management
- platform-administration
- onboarding-workflow
- contract-lifecycle
weight: 150
---

{{< callout type="warning" >}}
**Work in Progress: This documentation is currently pending review**
{{< /callout >}}

## Purpose and Overview

{{< callout type="tip" >}}
**TL;DR — Read this first.**

**What is a Merchant?** Think of a **merchant** like a **shop registered inside a shopping mall**. The mall (your platform) needs to know who each shop is, what their terms are, and how money flows to them. You can't just let anyone sell without a signed agreement and a way to route their payments.

That is what this applet manages. Every business or partner that operates on your platform is a **Merchant**. Before they can transact, you need to:
1. Register their identity (who they are, what company they belong to)
2. Set up their payment gateway credentials (so money gets routed correctly)
3. Formalize the relationship with a **Contract** (what rates apply, how long the agreement lasts)

Without this applet, onboarding a new merchant would mean emails, spreadsheets, and manually configuring payment systems — with no audit trail of who approved what or when.

This applet is the single place where platform administrators register merchants, configure their technical credentials, and track the formal contracts that govern those relationships.

Once a merchant is registered here, that record does not stay isolated — it flows into several downstream applets automatically. The Peppol ID you configure here is what the E-Invoice applets use to send documents through the government network. The credit limits you set here are what the AR applet enforces when the merchant owes money. The GL codes and tax codes attached to the merchant's branch are what the General Ledger and Tax applets post against. You set it up once here; everywhere else just reads it.

**Is this the same as the Organization Applet?** No — and this is a common point of confusion:

| Applet | POV | Who it manages |
|--------|-----|---------------|
| **Organization Applet** | Internal | Your own company's structure — your branches, departments, staff |
| **Merchant Applet** | External-facing | Outside businesses that use your platform to accept payments |

You are the mall. The Organization Applet manages your own mall offices and departments. The Merchant Applet manages the shops that rent space and plug into your payment infrastructure. A merchant is never your own branch — they are an external partner with their own bank account, their own payment gateway credentials, and a signed contract with you.
{{< /callout >}}

The **Merchant Applet** is the administrative hub for onboarding and managing every merchant on the platform. It handles the full lifecycle — from creating a merchant identity and configuring payment gateway credentials, through to managing contracts and auditing every change made to a merchant record.

{{< callout type="info" >}}
**Core Concept**: A **Merchant** represents a distinct partner entity identified by a unique **Merchant ID**, secured by **Merchant Keys** and **PGW Merchant Codes** for technical integration, and governed by a formal **Contract** that defines the commercial terms of the relationship.
{{< /callout >}}

A short introduction to the Merchant Applet:

{{< youtube c-Yc6bo7_Jw >}}

A a webinar for the Merchant Applet:

{{< youtube bypy25YiVCI >}}

---

## Key Features Overview

### Who Benefits from This Applet?

**Platform Administrators:**
- Centralized creation and management of merchant profiles
- Secure storage of API keys and payment gateway credentials
- Real-time status monitoring (Active vs. Deactivated)
- Configuration of merchant types, entity types, and AR/AP categories

**Merchant Relationship Managers:**
- Structured onboarding workflow for new partners
- Full visibility into active, expiring, and historical contracts
- Ability to update merchant profiles, contact details, and addresses
- Audit trail of every administrative change made to a merchant record

**Finance & Compliance Teams:**
- Centralized repository of all merchant contracts and rate cards
- Credit limit and credit term management per merchant
- Complete audit logs for every modification in the system
- Verification of merchant status and eligibility before transactions

### What Problems Does This Solve?

**The Partner Management Friction Problem:**

Managing a large ecosystem of merchants through spreadsheets or fragmented systems creates significant operational risk:
- Scattered merchant profile data across multiple departments
- Manual handling of sensitive Merchant Keys, creating security exposure
- Lost or undocumented contractual agreements and rate cards
- No formal approval process or audit trail for merchant state changes
- Difficulty verifying compliance for every registered merchant

**The Merchant Applet Solution:**

- **Structured Onboarding Workflow** — standardized field-driven creation of merchant identities, credentials, and configurations
- **Secure Credential Repository** — dedicated storage of Payment Gateway (PGW) codes, merchant keys, and return URLs
- **Contract Lifecycle Hub** — integrated tracking of formal agreements with rate cards and validity controls
- **Comprehensive Event Logging** — audit trails for every profile and contract modification
- **Flexible Segmentation** — define merchants by type (Corporate vs. Individual), entity type, and AR/AP category

---

{{< figure src="/images/merchant-applet-applet/merchant-applet-overview-infographic.png" alt="Merchant Applet Overview: From Manual Friction to Streamlined Partner Success - comparing manual merchant management with the digital solution" caption="Merchant Applet Overview: The Old Way (scattered data, security risks, lost contracts) vs The New Way (unified profiles, secure vault, integrated contracts)." >}}

## Key Features


{{< cards >}}
  {{< card title="Merchant Admin" subtitle="Centralized profile creation, credential management, and lifecycle administration" link="#merchant-admin" >}}
  {{< card title="Contract Container" subtitle="Manage formal agreements, rate cards, and payment channel configurations" link="#contract-container" >}}
  {{< card title="Report" subtitle="Analyze merchant distributions and performance data" link="#report" >}}
  {{< card title="Audit Trail" subtitle="Deep visibility into every configuration change and state transition" link="#audit-trail" >}}
  {{< card title="Permission Control" subtitle="Role and user-level access management per merchant action" link="#settings" >}}
  {{< card title="Personalization" subtitle="Customize sidebar layout and personal defaults for your admin role" link="#personalization" >}}
{{< /cards >}}

---

## Key Concepts

### Understanding the Merchant Framework

Every merchant in the system is built from three layers:

| Layer | Component | Purpose |
|-------|-----------|---------|
| **Identity** | Merchant ID, Merchant Name, Merchant Company | Who they are and how they are uniquely identified in the platform |
| **Credentials** | PGW Merchant Code, Merchant Key | How their payment transactions are routed and authenticated |
| **Agreement** | Merchant Contract, Rate Card | What commercial terms apply and for how long |

{{< callout type="tip" >}}
**Real-World Example**: A new retail partner wants to accept payments through your platform. The platform admin creates a Merchant record with the partner's company registration, assigns a unique PGW Merchant Code so the payment gateway knows where to route funds, and then creates a Contract that locks in their transaction rate (e.g., 1.5% MDR) with a start and end date. The partner can only go live once all three layers are in place.
{{< /callout >}}

### Merchant Lifecycle

```
New Partner Request
│
├── Merchant Creation ──→ Register ID, Name, Company, Entity Type, Keys
│   │
│   └── Credential Setup ──→ PGW Merchant Code, Merchant Key, Return URLs
│       │
│       └── Contract Creation ──→ Rate Card, Payment Channels, Validity Period
│           │
│           └── Active & Ongoing ──→ Audit Trail logs every change
```

### Entity Type vs. Merchant Type

These two fields are often confused because they both classify the merchant — but they operate at completely different levels.

| Field | Nature | Changes system behavior? |
|-------|--------|--------------------------|
| **Entity Type** | Functional | Yes — affects financial posting, applet visibility, AR/AP categorization |
| **Merchant Type** | Descriptive | No — used for reporting and documentation classification only |

**Entity Type** is functional — it drives how the system behaves. It controls which applets recognize the record, how financial entries are categorized (AR vs AP), and what workflows the entity participates in. Changing it has downstream consequences across the platform.

**Merchant Type** (CORPORATE vs INDIVIDUAL) is descriptive — it classifies the business structure for reporting and documentation. It tells you *what kind of business* the merchant is, but does not change how the system routes transactions or which applets see the record.

The two are not fully independent. Merchant Type only becomes meaningful on records where Entity Type includes MERCHANT — it would not make sense on a pure SUPPLIER or EMPLOYEE record. Think of it as a sub-classification that sits beneath Entity Type: Entity Type establishes the functional role, Merchant Type describes the business form within that role.

---

## Navigation Menu

The applet sidebar contains four main sections, plus Settings and Personalization:

### Merchant Admin
The primary working area. Lists all registered merchant profiles and is the entry point for creating new merchants. This is where the full create/edit lifecycle happens — from initial registration through credential setup to status management.

### Contract Container
Lists all merchant contracts. A contract formalizes the commercial relationship between your platform and a merchant — it defines the rate card (what fees apply per payment channel) and the validity period of the agreement.

### Report
Provides reporting views on merchant data — distributions, status breakdowns, and performance trends across the merchant portfolio.

### Audit Trail
A read-only log of every change made across all merchant records and contracts. Used by compliance teams to trace who changed what and when. Every create, edit, and status change is recorded here with a timestamp and the user responsible.

---

## Merchant Admin

### Listing
{{< figure src="/images/merchant-applet-applet/merchant-applet-listing.png" alt="Merchant Applet Listing - comprehensive view of all registered merchants including Merchant ID, Name, and Status" caption="Merchant Applet Listing: The primary interface for searching, filtering, and managing merchant records." >}}
The listing shows all registered merchant profiles.

---

### Create
{{< figure src="/images/merchant-applet-applet/merchant-applet-create-form.png" alt="Create Merchant Form - initial registration screen with required identity and credential fields" caption="Create Merchant: The initial onboarding screen for registering a new merchant identity and its technical credentials." >}}
Creates a new merchant profile. Only the core identity and credential fields are available at creation — the deeper configuration tabs (Peppol, Login, Contract, Payment Config, etc.) become available after the record is saved.

**Required fields:** Merchant ID, Merchant Name, Merchant Company, Company Registration No / ID Number, Entity Type, AR/AP Type, PGW Merchant Code, Merchant Key, Status

**Optional fields:** Merchant Type, Description

**Fields that need context:**

| Field | Notes |
|-------|-------|
| **Merchant ID** | Must be unique across all merchants — used as the primary reference in payment gateway routing and transaction logs. |
| **Entity Type** | The functional role this merchant plays — CUSTOMER, SUPPLIER, EMPLOYEE, or MERCHANT. A single merchant can hold multiple types simultaneously. Drives financial posting behavior and which applets recognize this record. |
| **Merchant Type** | Descriptive classification only — CORPORATE or INDIVIDUAL. Used for reporting; does not affect system behavior. |
| **AR/AP Type** | Determines whether this merchant generates Accounts Receivable (money owed to you) or Accounts Payable (money you owe them). Getting this wrong causes mis-categorization in AR aging reports. |
| **PGW Merchant Code** | The identifier the payment gateway uses to route transactions to this merchant's account. |
| **Merchant Key** | Secret key for API authentication. Treat like a password — any rotation must be reflected in connected integrations to avoid transaction failures. |
| **Status** | DEACTIVATE suspends access while preserving all data and history. |

---

### Edit

The edit form contains all the same fields as create, plus additional configuration tabs that manage the deeper aspects of the merchant relationship.

**Action buttons on the edit form:**

| Button | Function |
|--------|----------|
| **SAVE** | All changes are logged to the Audit Trail. |
| **Remove** | Permanently deletes the merchant record. Use with caution — this cannot be undone. |

#### Details Tab
{{< figure src="/images/merchant-applet-applet/merchant-applet-details-tab.png" alt="Merchant Details Tab - core profile information and entity classification settings" caption="Details Tab: Managing the primary identity and functional classification of the merchant." >}}
Contains all the core fields from the create form. Every change is logged to the Audit Trail.

---

#### Peppol Config Tab
{{< figure src="/images/merchant-applet-applet/merchant-applet-peppol-config-tab.png" alt="Peppol Config Tab - registration settings for international e-invoicing infrastructure" caption="Peppol Config Tab: Configuring the merchant's identifiers for global e-invoice network participation." >}}
Configures this merchant's participation in the **Peppol network** — the international e-invoicing infrastructure used for government and enterprise B2B electronic invoicing (relevant for e-invoice compliance in Malaysia and other Peppol-participating countries).

{{< callout type="info" >}}
**What is Peppol?** Peppol is a set of open standards that allows businesses to send electronic invoices and other business documents directly to each other's systems — without PDFs, emails, or manual entry. In Malaysia, this is part of the e-invoicing mandate. If a merchant needs to send or receive e-invoices through the Peppol network, their Peppol IDs must be configured here.
{{< /callout >}}

**Peppol IDs sub-tab**

Manages the Peppol participant identifiers for this merchant. A Peppol ID is the network address that uniquely identifies a business on the Peppol network — similar to an email address, but for invoices.

**Notification Config sub-tab**
{{< figure src="/images/merchant-applet-applet/merchant-applet-notification-config-subtab.png" alt="Notification Config Tab - delivery channel settings for e-invoice alerts" caption="Notification Config: Defining how the merchant receives electronic invoicing notifications." >}}
Controls how this merchant receives e-invoice notifications. Each channel can be toggled independently:

**Channels:** Peppol, Email, Other UCC Channels (Telegram, Facebook, etc.), Through Customer Portals

The Peppol channel is only available if the merchant has a valid Peppol ID configured in the Peppol IDs sub-tab.

---

#### Login Tab
{{< figure src="/images/merchant-applet-applet/merchant-applet-login-tab.png" alt="Merchant Login Tab - portal access management for merchant staff" caption="Login Tab: Managing self-service portal credentials and invitations for merchant users." >}}
Manages the merchant's portal login credentials — giving the merchant's own staff access to a self-service portal to view their transaction data, download reports, or check their account status.

**Fields:** User Email, Rank, Status

**Action buttons:**

| Button | Function |
|--------|----------|
| **Verify Email** | Confirms the email address is valid and reachable before sending an invite. |
| **Send Invite** | Sends the merchant a portal invitation with login setup instructions. |

---

#### Contract Tab
{{< figure src="/images/merchant-applet-applet/merchant-applet-contract-tab.png" alt="Merchant Contract Tab - summary of agreements associated with this merchant" caption="Contract Tab: A centralized view of all commercial agreements linked to the merchant profile." >}}
Lists all contracts associated with this merchant. Contracts are created and managed in the [Contract Container](#contract-container) section of the applet, but this tab gives you a quick view of all agreements for this specific merchant without leaving the merchant profile.
{{< figure src="/images/merchant-applet-applet/merchant-applet-rate-card-view.png" alt="Rate Card View - detailed breakdown of fees per payment channel" caption="Rate Card: Defining the commercial MDR and flat fees for different payment methods." >}}
Expanding a contract row reveals its **Rate Card** — the pricing schedule that defines what fee applies per payment channel (e.g., 1.5% MDR for Credit Card, flat RM 0.50 for FPX). This is a read-only summary view; to create or edit rate cards, open the contract in the [Contract Container](#contract-container). For a full breakdown of how the Rate Card works, see the [Rate Card Tab](#rate-card-tab) section below.
---

#### Return URL Tab
{{< figure src="/images/merchant-applet-applet/merchant-applet-return-url-tab.png" alt="Return URL Tab - configuration for post-payment redirection" caption="Return URL Tab: Setting up success and error redirect paths for payment gateway transactions." >}}
Configures the redirect URLs used after payment gateway transactions — where the payment gateway sends the user after a successful or failed payment attempt.

**Fields:** Return URL Code, Return URL Name, Success Return URL, Error Return URL

Success and Error Return URLs each have a toggle — the URL field only appears when the toggle is enabled.

---

#### Tax & Billing Tab
{{< figure src="/images/merchant-applet-applet/merchant-applet-tax-billing-tab.png" alt="Tax and Billing Tab - registration details for financial and tax compliance" caption="Tax & Billing Tab: Configuring tax registration and billing parameters for the merchant." >}}
Manages tax registration details and billing configurations for this merchant. Tax settings here affect how tax entries are generated when financial transactions are processed against this merchant.

---

#### Payment Config Tab
{{< figure src="/images/merchant-applet-applet/merchant-applet-payment-config-tab.png" alt="Payment Config Tab - technical settings for active payment channels" caption="Payment Config Tab: Managing technical integration parameters for enabled payment methods." >}}
Lists all payment channel configurations for this merchant — which payment methods are enabled, their gateway settings, and any channel-level parameters.

**Supported settlement types include:** Bank Transfer, Cash, Cheque, Credit Card, E-Wallet, FPX/eMandate, Payment Gateway, Membership Points, Open Credit, Voucher, and Others.

---

#### Address Tab
{{< figure src="/images/merchant-applet-applet/merchant-applet-address-tab.png" alt="Merchant Address Tab - management of multiple office and billing locations" caption="Address Tab: Maintaining billing, correspondence, and branch addresses for the merchant." >}}
Manages the registered addresses for this merchant — billing address, correspondence address, and any additional branch or site addresses. Multiple addresses can be stored and individually labeled.

Each address has a **Set as Default** toggle. When a merchant has more than one address of the same type, marking one as default tells the system which address to use by default for document generation, invoicing, and correspondence. The address listing shows **(default)** next to the address type label for the designated address. Only one address per type can be set as default at a time — setting a new default automatically clears the previous one.
---

#### Contact Tab
{{< figure src="/images/merchant-applet-applet/merchant-applet-contact-tab.png" alt="Merchant Contact Tab - directory of key personnel and roles" caption="Contact Tab: Managing the directory of key contact persons for different business functions." >}}
Manages the contact persons for this merchant — names, phone numbers, email addresses, and roles. Multiple contacts can be stored for different purposes (e.g., finance contact, technical contact, account manager).

---

#### Company Linking Tab
{{< figure src="/images/merchant-applet-applet/merchant-applet-company-linking-tab.png" alt="Company Linking Tab - mapping merchant to platform companies for financial posting" caption="Company Linking Tab: Establishing the financial relationship between the merchant and platform companies." >}}
Links this merchant record to one or more companies within your platform. Company linking determines which company's financial accounts and GL structures this merchant's transactions post to — important in multi-company platform environments.

---

#### Merchant Branch Tab
{{< figure src="/images/merchant-applet-applet/merchant-applet-branch-tab.png" alt="Merchant Branch Tab - intercompany branch relationship settings" caption="Merchant Branch Tab: Configuring branch-level mappings for intercompany settlements." >}}
Configures intercompany branch relationships for this merchant. Used when a merchant operates across multiple branches or legal entities that need to be tracked separately within the platform's intercompany settlement framework.

Each branch record is divided into four sections:

**Identity & Mapping**

| Field | Notes |
|-------|-------|
| **Selected Entity** | Read-only. Auto-filled with the current merchant's name. |
| **Mapping Value 01–05** | Five free-form extension fields for mapping this branch to external systems — e.g., ERP codes, legacy system references, or intercompany settlement identifiers. The platform does not enforce a format. |

**Branch Address**

Standard contact and location fields: Address Name, Email, Phone Number, Address Lines 1–5, Country, State, City, Postal Code.

**Control Account**

These fields tie this branch's transactions to specific GL accounts — determining where the platform posts financial entries for this branch.

| Field | Notes |
|-------|-------|
| **Account AR/AP Type** | Whether this branch's transactions post to Accounts Receivable or Accounts Payable. |
| **Account GL Code** | The General Ledger account from the [General Ledger Applet](/applets/finance/general-ledger-applet/) that this branch posts to. |
| **Account Subledger** | The subledger under the GL code for more granular transaction tracking. |

**Output Tax / Input Tax**

Configures the tax codes applied when this branch transacts. Output tax is applied on sales; input tax is applied on purchases. Tax type and rate fields are read-only — they auto-fill when you select a tax code.

| Field | Notes |
|-------|-------|
| **SST/GST Tax Code** | Select the applicable tax code from the [Tax Configuration Applet](/applets/master-data/tax-configuration-applet/). |
| **Tax Type** | Auto-filled from the selected tax code. Indicates the tax category (e.g., SR, ZRL, ES). |
| **SST/GST/VAT %** | Auto-filled from the selected tax code. Shows the effective tax rate. |
| **WHT Code** | Withholding Tax code, if applicable to this branch's transactions. |
| **WHT Type** | Auto-filled from the selected WHT code. |
| **WHT %** | Auto-filled from the selected WHT code. |

**E-Invoice**

| Field | Notes |
|-------|-------|
| **E-Invoice Tax Type Code** | Maps this branch to a MyInvois-compliant tax classification code. Required for LHDN e-invoice submissions involving this branch. Codes are defined in the [Tax Configuration Applet](/applets/master-data/tax-configuration-applet/). |
---

#### Credit Limit and Terms Tab

Manages the credit facilities extended to this merchant. Contains two nested sub-tabs:

**Credit Term sub-tab**
{{< figure src="/images/merchant-applet-applet/merchant-applet-credit-term-subtab.png" alt="Credit Term Tab - payment deadline configurations" caption="Credit Term: Defining the payment window and aging rules for the merchant." >}}
Defines the payment terms for this merchant — how many days they have to settle outstanding amounts. Credit terms drive AR aging calculations and payment due date computations.

**Credit Limit sub-tab**
{{< figure src="/images/merchant-applet-applet/merchant-applet-credit-limit-subtab.png" alt="Credit Limit Tab - maximum exposure settings per currency" caption="Credit Limit: Setting the ceiling for outstanding balances to manage financial risk." >}}
Sets the maximum outstanding balance allowed for this merchant at any point in time. When a transaction would push the merchant over their approved credit limit, the system flags it for review.

You can either:
- **Existing Credit Limit** — select a pre-configured credit limit profile from the system
- **New Credit Limit** — create a new limit with a code, name, status, currency, and limit amount

**Fields:** Credit Limit Code, Credit Limit Name, Status, Currency, Credit Limit Amount

---

#### Logo Tab
{{< figure src="/images/merchant-applet-applet/merchant-applet-logo-tab.png" alt="Merchant Logo Tab - brand asset management for documents and portals" caption="Logo Tab: Uploading brand assets for use in merchant-facing documents and portals." >}}
Manages the merchant's logo — uploaded and stored against the merchant profile. The logo is used in merchant-facing documents, portal pages, and any printed output associated with this merchant.

---

## Contract Container

{{< callout type="tip" >}}
**TL;DR** — The contract is not just paperwork. It is the live pricing configuration the payment engine reads on every transaction to determine what fee applies. No contract = no transactions.
{{< /callout >}}

### How Merchant and Contract relate

A merchant record and a contract are created separately, and in that order:

```
1. Create Merchant     →  registers identity and payment credentials
2. Sign agreement      →  commercial terms agreed outside the system
3. Create Contract     →  formalizes terms in the system (rate card, payment channels)
4. Merchant goes live  →  system can now route payments and apply fees
```

A merchant can exist without a contract — registered but not yet live. The contract is what activates them. Every time the merchant processes a payment, the system looks up their active contract to answer two questions:
- Is this payment method allowed? (is it in the rate card?)
- What fee do we take? (what is the MDR or flat rate for this channel?)

**The relationship is not 1 merchant = 1 contract.** A contract is tied to a specific **merchant + platform company** pair. This means:
- One company can have contracts with many merchants
- One merchant can have contracts with multiple companies on your platform (each with their own rate card)
- A merchant can also have multiple contracts over time as agreements renew or terms change — old contracts remain on record for audit purposes

Contracts are kept separate from the merchant profile because commercial terms change independently — a contract can be renewed or renegotiated without touching the merchant's identity or credentials.

---

### Listing
{{< figure src="/images/merchant-applet-applet/merchant-applet-contract-listing.png" alt="Contract Listing - overview of all commercial agreements across the platform" caption="Contract Listing: A centralized repository of all signed agreements and their current statuses." >}}
Lists all merchant contracts across all merchants.

---

### Create
{{< figure src="/images/merchant-applet-applet/merchant-applet-contract-create-form.png" alt="Create Contract Form - defining commercial terms for a merchant-company pair" caption="Create Contract: Formally registering a new agreement with its validity period and associated merchant." >}}
Creates a new contract once the commercial agreement with the merchant has been signed.

{{< callout type="info" >}}
**What is a Merchant Contract?** A contract formalizes the commercial relationship between your platform and a merchant. It is not just a document — it is the system record that drives what rates are applied to transactions. Without a contract, the platform does not know what fee to charge or apply for a merchant's transactions.
{{< /callout >}}

**Required fields:** Contract Name, Merchant, Contract Company, Status

**Auto-generated:** Contract Code (system-generated, read-only)

**Fields that need context:**

| Field | Notes |
|-------|-------|
| **Contract Name** | Typically includes the merchant name and period, e.g. "RetailCo 2024 MDR Agreement". |
| **Contract Company** | The platform entity entering the agreement — determines which company's financials the contract terms post against. |
| **Status** | ACTIVE (in effect) or DEACTIVATE (suspended). |

---

### Edit

The edit form contains all the same fields as create, plus tabs for managing the commercial details of the contract.

#### Details Tab
{{< figure src="/images/merchant-applet-applet/merchant-applet-contract-details-tab.png" alt="Contract Details Tab - primary agreement parameters and status management" caption="Contract Details Tab: Managing the core identity and lifecycle status of a specific agreement." >}}
Contains the core contract fields — Contract Name, Contract Code, Merchant Contract Key, Contract Company, Merchant Name, Type, and Status. The Contract Code and Merchant Contract Key are system-generated and read-only. Status is the only field that is editable after creation beyond the contract name.

---

#### Rate Card Tab
{{< figure src="/images/merchant-applet-applet/merchant-applet-contract-rate-card-tab.png" alt="Contract Rate Card - pricing schedule for payment channel fees" caption="Rate Card Tab: The live fee schedule used by the payment engine for transaction processing." >}}
{{< callout type="tip" >}}
**TL;DR** — Fee schedule per payment method. Defines what rate the merchant pays for each payment channel they accept.
{{< /callout >}}

The rate card is the pricing schedule inside this contract — it defines what fee the merchant pays per payment method.

Each entry pairs a **Payment Channel** (e.g., Credit Card Visa, FPX, E-Wallet) with a **Charge Rate** — either a percentage of the transaction amount or a flat fee per transaction. The percentage form is called **MDR (Merchant Discount Rate)**: if the rate is 1.8% and the merchant processes RM 100, the platform keeps RM 1.80 and the merchant receives RM 98.20.

A single contract can have multiple payment channels, each with its own rate. This is normal — credit card transactions typically carry a higher MDR than FPX or e-wallet transactions because the underlying processing costs differ.

Without a rate card, the system has no fee to apply when the merchant transacts — so this must be configured before the merchant goes live.

---

#### Annex Tab

{{< callout type="tip" >}}
**TL;DR** — File uploads for this contract. Attach the signed PDF, amendment letters, or any supporting paperwork here.
{{< /callout >}}

Document storage for this contract record. Upload the signed physical contract PDF, amendment letters, approval emails, or any other supporting paperwork that belongs alongside this agreement. This is not a functional tab — it does not affect system behavior. It exists so the digital contract record and the physical paperwork stay together in one place.

---

## Report

{{< callout type="tip" >}}
**TL;DR** — A read-only monthly summary of merchant transaction activity. The system populates it automatically — you just view and export.
{{< /callout >}}
{{< figure src="/images/merchant-applet-applet/merchant-applet-report-summary.png" alt="Monthly Transaction Report - aggregated view of processing activity and charges" caption="Merchant Report: A monthly summary of transaction volumes, values, and processing fees." >}}
The Report menu shows a **Monthly Merchant Transaction Summary** — a pre-aggregated view of transaction activity across all merchants, broken down by merchant and payment channel.

**What it shows per row:** Merchant, Payment Channel, Currency, No. of Transactions, Total Transaction Amount, VAT %, PC Charges, UNIPIN Charges

**Columns that need context:**

| Column | Notes |
|--------|-------|
| **PC Charges** | Payment Channel charges — the fee the platform takes for processing a transaction through that specific payment method. Shown as either a percentage of the transaction amount or a flat fee per transaction. Up to 4 separate charge types can apply per channel. |
| **UNIPIN Charges** | Additional charges specific to UNIPIN — a payment network used for certain digital payment methods. These sit on top of the PC charges and follow the same percentage-or-flat-fee structure. Up to 4 charge types. |
| **VAT %** | The tax rate applied to the transaction fees — not the transaction amount itself. |

**Where the data comes from:** The system aggregates transaction data automatically from payment activity — you do not feed it anything manually. It reads from the same merchant and payment channel records configured in Merchant Admin and Contract Container.

**What you can do with it:**
- View the monthly summary per merchant and channel
- Click a row to drill into the detail of that specific entry
- Export to CSV or Excel for further analysis

It does not post to any other applet and has no financial impact — it is purely a reporting and export tool.

---

## Audit Trail
{{< figure src="/images/merchant-applet-applet/merchant-applet-audit-trail-listing.png" alt="Merchant Audit Trail - immutable log of administrative changes" caption="Audit Trail: Ensuring full transparency and accountability for every configuration change." >}}
A complete, read-only log of every action taken across all merchant records and contracts. Every create, edit, status change, and deletion is recorded with:

- The exact field that changed and the before/after values
- The user who made the change
- The timestamp of the change
- The merchant or contract record affected

Use this section to investigate unauthorized changes, trace who approved a merchant activation, or verify the history of a specific credential update. The audit trail cannot be edited or deleted.

---

## Settings
{{< figure src="/images/merchant-applet-applet/merchant-applet-settings-general.png" alt="Applet Settings - system-wide field visibility and permission controls" caption="Settings: Configuring global behavior, permissions, and webhooks for the Merchant Applet." >}}
Accessed via the top navigation. All settings here are system-wide and affect all users of this applet.

### Field Settings

Controls which fields are shown or hidden across the merchant create and edit forms. For example, the Entity Type field can be hidden if your platform only operates with a single entity type.

### Default Selection

Sets system-wide default values pre-populated when creating a new document:

| Setting | Effect |
|---------|--------|
| **Default Branch** | The branch pre-selected on new documents. Reduces data entry time for teams that primarily work from a single branch. |
| **Default Location** | The inventory location pre-selected within the default branch. |

### Permission Management

Controls who can perform which actions within the applet. Four layers of permission management are available:

| Permission Level | Description |
|----------------|-------------|
| **Permission Set** | Named sets of permissions that can be reused across multiple users or teams. Define once, assign many times. |
| **User Permission** | Permissions assigned directly to individual users — overrides the team or role defaults for specific individuals. |
| **Team Permission** | Permissions applied to all members of a team. Useful for department-level access control (e.g., "Finance Team can view but not create"). |
| **Role Permission** | Permissions applied to all users holding a specific role. The broadest level of permission assignment. |

### Webhook Configuration

Configures outgoing webhooks that fire when specific events happen in the merchant applet — for example, notifying an external system when a new merchant is created or a contract status changes. Used for integration with external platforms or notification systems.

### Feature Visibility

Controls which features within the applet are visible to end users. Use this to simplify the interface for specific user groups by hiding features they do not need.

---

## Personalization

User-level customization of the applet experience. Unlike Settings (which are system-wide), Personalization settings apply only to the individual user configuring them.

### Personal Default Settings

Sets personal default values for fields on new documents — overrides the system-wide defaults from Settings for this user only.

### Sidebar Configuration

Controls which items appear in the sidebar navigation and in what order. Users can hide menu items they do not use to reduce visual clutter and keep their working area focused.

---

## Related Applets

### How This Applet Connects to Others

The Merchant Applet has no direct navigation links to other applets — there are no buttons that take you from here into another applet. Instead, the data you configure here is shared with downstream applets automatically. When you register a merchant, set a Peppol ID, or configure a credit limit, those values are immediately available wherever the platform needs them — you do not need to enter them again elsewhere.

---

### [Customer Applet](/applets/master-data/customer-applet/) & [Employee Applet](/applets/master-data/employee-applet/)

Merchants, customers, and employees are all stored as **entity records** under the same unified identity framework. The only difference between a merchant record and a customer record is their classification — the underlying structure is identical.

This has a practical implication: if a partner is both a merchant on your payment platform *and* a customer who buys from you, they do not need two separate records. A single entity can carry both classifications at once, and both applets will recognize them correctly.

Credit limits and credit terms configured here use the same credit management system as the Customer Applet — so a credit profile set up in either applet is visible in both.

---

### [My E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/) & [My Peppol Admin Applet](/applets/e-invoice/mypeppol-admin-applet/)

The **Peppol Config** tab in this applet is the source of truth for a merchant's Peppol network identity. When you register a Peppol ID here, the E-Invoice and Peppol Admin applets read it automatically — they do not have their own place to enter it.

This means the e-invoice workflow depends on this applet being set up correctly first:

```
Merchant Applet
└── Peppol Config Tab (register Peppol ID here)
        │
        ├── My E-Invoice Admin Applet — uses it for LHDN submission
        └── My Peppol Admin Applet   — uses it for Peppol network routing
```

If a merchant's Peppol ID is missing or incorrect here, e-invoice submissions for that merchant will fail downstream. Always configure Peppol IDs in this applet before attempting any e-invoice workflow for a merchant.

---

### [General Ledger Applet](/applets/finance/general-ledger-applet/)

GL account codes can be attached to a merchant's intercompany branch to define which ledger accounts the merchant's transactions post to. Those GL codes are maintained in the **General Ledger Applet** — this applet only reads and selects from them.

---

### [Seller Admin Applet](/applets/ecommerce/seller-admin-applet/)

The Seller Admin Applet manages the operational side of a merchant's activity — order creation, fulfillment queues, and pick-pack workflows. It uses the merchant identity created here as its foundation.

The division of responsibility is:
- **Merchant Applet** — register the merchant, set up credentials and contracts (*who they are*)
- **Seller Admin Applet** — process their orders and fulfillment (*what they are selling and shipping*)

---

### Summary

| Applet | What this applet provides to it |
|--------|--------------------------------|
| [**Customer Applet**](/applets/master-data/customer-applet/) | Shared entity identity framework; same credit limit and credit term system |
| [**My E-Invoice Admin Applet**](/applets/e-invoice/my-e-invoice-admin-applet/) | Merchant's Peppol ID for LHDN e-invoice submission |
| [**My Peppol Admin Applet**](/applets/e-invoice/mypeppol-admin-applet/) | Merchant's Peppol ID for network document routing |
| [**Tax Configuration Applet**](/applets/master-data/tax-configuration-applet/) | Reads tax codes from it; merchant branch setup depends on it |
| [**General Ledger Applet**](/applets/finance/general-ledger-applet/) | Reads GL account codes from it for merchant branch configuration |
| [**Accounts Receivable Applet**](/applets/finance/accounts-receivable-applet/) | AR/AP Type drives how merchant balances are categorized in AR aging |
| [**Seller Admin Applet**](/applets/ecommerce/seller-admin-applet/) | Merchant identity and account used as the basis for seller operations |

---

## FAQ

**Q: Can a merchant have multiple contracts?**
A: Yes. The Contract Container tracks all contracts for all merchants. A merchant can have successive contracts as agreements renew, giving a full historical record of the commercial relationship over time.

**Q: What is the difference between PGW Merchant Code and Merchant Key?**
A: The **PGW Merchant Code** is the identifier the payment gateway uses to know which merchant account to route a transaction to — think of it as the merchant's "account number" with the gateway. The **Merchant Key** is the secret credential used for API authentication — think of it as the merchant's "password." Both are required for secure payment routing.

**Q: What happens if I change a Merchant Key?**
A: The change is logged in the Audit Trail. You must also update the Merchant Key in any connected integration or payment gateway configuration to avoid transaction failures caused by credential mismatch.

**Q: Can I deactivate a merchant without deleting them?**
A: Yes. Setting the Status to DEACTIVATE disables the merchant's access and transactions on the platform while preserving all their data, contracts, and audit history. This is the preferred approach over deletion, which is permanent.

**Q: What does Entity Type affect downstream?**
A: Entity Type determines how financial entries are categorized when transactions are posted. A merchant tagged as CUSTOMER generates Accounts Receivable entries. One tagged as SUPPLIER generates Accounts Payable entries. Getting this right at the time of onboarding prevents GL mis-postings later.

**Q: Is there support for multi-currency merchants?**
A: Yes. Credit limits can be denominated in specific currencies, and merchant-level currency settings drive how financial settlements are calculated and posted. The AR/AP Type field also factors into multi-currency settlement logic.

**Q: What is the Merchant Contract Key?**
A: The Merchant Contract Key is a system-generated unique identifier for the contract record itself — distinct from the Merchant ID and the Merchant Key. It is used internally for API calls and cross-system references to uniquely identify a specific contract without ambiguity.

**Q: Why would a contract have multiple payment channels with different rates?**
A: Different payment methods carry different processing costs. Credit card transactions typically carry higher MDR (Merchant Discount Rate) than FPX or e-wallet transactions. The rate card lets you formalize these different rates per channel in a single contract, so the correct fee is applied automatically for each transaction type.
