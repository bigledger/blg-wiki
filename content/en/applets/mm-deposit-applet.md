---
title: "Deposit Applet"
description: "Integrated lifecycle management for money-market deposit requisitions, registers, and categories with controlled approvals"
draft: false
weight: 45
tags:
  - treasury-operations
  - deposit-management
  - cash-investment
  - interest-tracking
  - financial-controls
sidebar:
  enable: true
  fold: false
toc:
  enable: true
---

## Purpose and Overview

The Deposit Applet unifies intake, approval, and tracking of corporate deposits. Treasury teams capture requisitions, monitor active placements, and maintain category structures in one workspace, improving compliance and visibility across short-term investments.

{{< callout type="info" >}}
Core Coverage: MM Deposit Requisition (request pipeline), MM Deposit Register (live placements), and MM Deposit Category (classification and reporting backbone).
{{< /callout >}}

## Who Benefits?

### Treasury Managers
- Validate rates, maturities, and currencies before funds are placed.
- Monitor outstanding deposits and rollover decisions in real time.
- Enforce segregation of duties with SAVE/FINAL state control.

### Finance Controllers
- Ensure GL codes, currencies, and company mappings stay consistent.
- Export listings with formatted figures for month-end packages.
- Track audit data (created/updated by + timestamps) automatically.

### Investment Analysts
- Compare negotiated rates vs. effective floating rates.
- Evaluate terms, payout frequencies, and maturity ladders.
- Maintain invitee records for competitive bidding rounds.

## Key Problems Solved

| Challenge | Traditional Pain Point | Applet Resolution |
|---|---|---|
| Disconnected requests | Spreadsheet approvals, stale GL data | Structured form with validation, company-driven GL loading |
| Rate accuracy | Manual rounding errors, misaligned ref rates | Two-decimal formatting, floating rate auto-computation |
| Traceability gaps | Hard to prove who approved what | SAVE/FINAL linkage, user/time audit trail |
| Vendor invitee chaos | Email threads with inconsistent info | Invitee sub-flow with locked fields and clean listings |

## Feature Overview

{{< cards >}}
{{< card title="Deposit Requisition" subtitle="Capture, validate, and approve new placements" >}}
{{< card title="Invitee Management" subtitle="Record participant offers with fixed inputs" >}}
{{< card title="Deposit Register" subtitle="Maintain active placements and audit history" >}}
{{< card title="Category Administration" subtitle="Define deposit types for reporting" >}}
{{< card title="Formatted Listings" subtitle="Thousands separators and 2-decimal precision" >}}
{{< card title="Lifecycle Controls" subtitle="SAVE/FINAL synchronization and state locks" >}}
{{< /cards >}}

## Key Concepts

### Three-Menu Structure
- Requisition: Draft to FINAL workflow with interest logic (Fixed vs Floating). Invitee tab restricts editing to Entity Name, Email, and Winner.
- Register: Approved deposits with GL, currency, interest, and duration tracking. Mutual exclusivity enforced between Interest Rate and Effective Rate.
- Category: Maintains reusable deposit groupings to standardize downstream reporting.

### Interest Calculation Logic

| Mode | Editable Fields | Auto-Null Behaviour | Output |
|---|---|---|---|
| FIXED | Interest Rate (%) | Clears Interest Rate Effective | Uses entered rate |
| FLOATING | Reference Value + Delta | Disables Interest Rate, auto-computes Effective | Displays 2-decimal effective rate |

## Menu Workflows in Detail

### 1. MM Deposit Requisition

#### Create Draft
- Required: Company, GL Code, Currency, Amount Initial Deposit, Interest Type, Interest Calculation, Payout Frequency, Start/End Dates.
- Currency list preloads with search; GL Code stays patched even after Invitee tab navigation.

#### Interest Entry
- FIXED: enter Interest Rate (auto-formatted to 2 decimals).
- FLOATING: enter Reference Value/Delta; Interest Rate becomes null and disabled, Effective Rate recalculated.

#### Invitee Tab
- Only Entity Name, Email Address (required) and Winner (optional) enabled.
- Term (Days) and monetary fields disabled to preserve originating requisition data.
- Listing mirrors Sales Invoice listing style: currency, amounts, rates, dates, all two-decimal and comma formatted.

#### SAVE vs FINAL
- FINAL button shares the exact disabled condition as SAVE (invalid form, missing permissions, or ongoing calculations).
- Audit fields (Created/Updated by & dates) auto-populate and remain read-only.

### 2. MM Deposit Register

#### Listing
- Amount Initial Deposit, Amount Upon Maturity, and Estimated Interest columns show comma-separated values with two decimals.
- Right-aligned numeric columns for readability.

#### Edit Entry
- Form inherits the mutual exclusivity rules: switching logic toggles rate fields automatically.
- On load, Interest Rate values are rounded and formatted immediately to avoid display artifacts.
- SAVE/FINAL disable state synced with form validity and calculation flags.

#### Lifecycle Controls
- GL Code patching persists across navigation.
- Duration in days auto-computed from start/end dates and stored read-only.

### 3. MM Deposit Category

#### Catalog Maintenance
- Add/edit category code, name, description, and status.
- Inactive categories excluded from requisition/register pickers.

#### Governance
- Single source for deposit type metadata, ensuring consistent reporting mappings.

## Listings & Formatting Consistency

Sales Invoice Listing (Requisition list) and Invitee Listing share:

- Deposit Name/Code, Currency, Interest Type, Rate, Effective Rate, Amount Initial/Maturity, Start/End dates, Actions.
- Numeric columns formatted via toLocaleString with `{ minimumFractionDigits: 2 }`.
- Date columns rendered as `YYYY-MM-DD`.

Deposit Register Listing follows identical formatting conventions, enabling straightforward comparisons.

## Demo Flow Summary

| Step | Action | Outcome |
|---:|---|---|
| 1 | Open MM Deposit Requisition → Create | Draft requisition with validated fields |
| 2 | Switch to FLOATING logic | Interest Rate disabled, Effective computed |
| 3 | Add Invitee | Minimal editable fields, consistent listing |
| 4 | Return to Details | GL Code and Currency remain patched |
| 5 | Submit FINAL | Button enabled only when SAVE eligible |
| 6 | Navigate to MM Deposit Register | View formatted listing and edit mutual-exclusive rates |
| 7 | Review MM Deposit Category | Maintain reporting classifications |

## Implementation Notes

- Form control disabling executed immediately after initialization, ensuring readonly fields visually and functionally locked.
- Interest formatting uses `formatNumberField` / `formatDisplayNumber` helper with two-decimal rounding at patch time to prevent floating-point artifacts.
- Currency service loads on component init and stores results locally, guaranteeing dropdown availability even for new drafts.
- Session storage fallback preserves GL selection between invitee navigation events.

## Supporting Resources

- Source Structure: `projects/wavelet-erp/applets/deposit-applet/src/app/components/...`
- State Controllers: Deposit requisition/register controllers manage store synchronization.
- Shared Utilities: Number formatting helpers in main details components ensure uniform presentation.

{{< callout type="success" >}}
Deliver consistent treasury operations by leveraging the three-menu Deposit Applet: capture requisitions with strict validation, oversee active deposits with accurate interest calculations, and maintain clean category metadata for downstream reporting.
{{< /callout >}}
