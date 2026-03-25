---
title: "Statement of Account Applet"
description: "Generate and manage customer statements in bulk, using templates, scheduled events, and email/PDF run types for collections and account follow-ups."
tags:
- finance
- accounts-receivable
- statement-of-account
- customer-communication
- templates
- email
weight: 90
---

## Purpose and Overview

The **Statement of Account Applet** helps finance teams generate customer statements in a controlled, repeatable way.

You can:
- Create a statement run (for example, month-end statements)
- Choose a **Printable Format** (PDF layout)
- Run in **Download** mode or **Email** mode
- Maintain **Statement of Account Templates** and **Events** to standardize recurring runs

{{< callout type="info" >}}
**Core Concept**: A “statement” here is a *run* that generates statement output for a selected scope (company + customer segmentation) using a selected printable format.
{{< /callout >}}

---

## Key Features

### 1. Statement Runs (Create / View)

From **Statement of Account** listing:
- **Create Statement** — create a new run
- **View Statement** — review run details and generated lines
- **Delete** — available on view screen when allowed

In the create and view screens, the main tabs are:
- **Main Details**
- **Lines** (view output / line items)

### 2. Run Types: Download or Email

When preparing a statement run, you select a **Run Type**:
- **Download** (typical) — generate output for download/printing
- **Email** — send statements to recipients based on configured email rules

If **Run Type = Email**, additional fields and options appear:
- **Recipient Emails** (manual entry)
- **Recipient Emails Configuration** checkboxes:
	- Main
	- Primary Address Contacts
	- Secondary Address Contacts
	- Staff/Family
	- Login Subjects

### 3. Templates

Use **Statement of Account Template Listing** to maintain reusable templates (for example, default filters and output format).
Templates are useful when you need consistent statement generation across branches, teams, or recurring cycles.

### 4. Events

Use **Statement of Account Events Listing** to manage recurring or scheduled statement generation setups.
Events typically standardize *when* and *how* statements are generated.

### 5. Settings and Governance

The applet includes common governance tools under **Settings**, including:
- **Default Selection**
- **Field Settings** (field/column configuration)
- **Printable Format Settings**
- **Webhook**
- **Feature Visibility**
- Client-side permissions and permission wizard tools

---

## Feature Navigation

{{< cards >}}
	{{< card title="Statement of Account" subtitle="Create runs and view statement lines" link="#quick-start" >}}
	{{< card title="Templates" subtitle="Standardize recurring runs" link="#templates" >}}
	{{< card title="Events" subtitle="Manage recurring/scheduled setups" link="#events" >}}
	{{< card title="Settings" subtitle="Default selection, printable formats, permissions" link="#settings" >}}
{{< /cards >}}

---

## Quick Start

### Create and Run a Statement

1. Open **Statement of Account**.
2. Click **Create**.
3. In **Main Details**:
	 - Choose **Statement Type**.
	 - Select one or more **Companies**.
	 - Choose your targeting method:
		 - Enable **Sales Agent** and select one or more sales agents, and/or
		 - Enable **Customer Category** and select customer categories.
     
		 {{< callout type="warning" >}}
At least one of **Sales Agent** or **Customer Category** must be selected.
		 {{< /callout >}}
	 - Set **Month To**.
	 - If your statement type is **Transaction History**, set **Month From** too.
	 - Select a **Printable Format** (txn type: `STATEMENT_OF_ACCOUNT`).
	 - Select **Run Type**:
		 - **Download**, or
		 - **Email** and configure recipients.
4. Click **CREATE**.
5. If you are viewing an existing run and the **RUN** button is available, click **RUN** to generate.
6. Review the **Lines** tab to verify output.

### Email Run (Recommended checklist)

- Confirm customer contact emails exist and are up to date.
- Confirm the correct **Printable Format** is selected.
- Use recipient configuration checkboxes consistently (Main vs Primary/Secondary contacts).

---

## Templates

Use templates when you want consistent, repeatable statement runs:
- Standardize filters / targeting
- Standardize printable format selection
- Reduce manual setup during month-end

---

## Events

Use events to manage recurring/scheduled statement setups. This helps teams avoid repeating manual runs every cycle.

---

## Settings

Common configuration areas:

| Setting | What it’s for |
| --- | --- |
| **Default Selection** | Default values for faster setup |
| **Field Settings** | Control visible fields/columns in listing and views |
| **Printable Format Settings** | Configure statement layout and printing/email output |
| **Feature Visibility** | Hide/show features per tenant policy |
| **Permissions** | Control who can create/run/delete statements |

---

## FAQ

**Q: Why can’t I click CREATE?**  
A: Ensure you selected at least one targeting method (**Sales Agent** and/or **Customer Category**) and completed required fields (Statement Type, Company, Month To).

**Q: Why can’t I see Month From?**  
A: **Month From** appears when the **Statement Type** is `TRANSACTION_HISTORY`.

**Q: What’s the difference between Templates and Events?**  
A: **Templates** standardize *what* to run (reusable configuration). **Events** standardize *when/how often* runs happen (recurring setups).

**Q: Can I delete a statement run?**  
A: Yes, if the delete action is enabled for your role. In the view screen, the **DELETE** button may require a second click to confirm.
