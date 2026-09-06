---
title: "Statement of Account Applet"
description: "Reference for the Statement of Account applet: runs, templates, recurring events, how a run selects its customers, what the two processors do, and why a scheduled run produces nothing"
applet_code: "statementOfAccountApplet"
page_type: applet
applet_repo: "blg-applet-wavelet-statement-of-account-applet"
modules: [financial-accounting, sales-crm]
related_applets:
  - customer-maintenance-applet
  - entity-applet
  - organisation-applet
  - employee-applet
  - internal-sales-invoice-applet
  - debtor-report-applet
  - ledger-and-journal-applet
guides: []
sources:
  screens_and_menus:
    - blg-applet-wavelet-statement-of-account-applet/micro-fe/projects/wavelet-erp/applets/statement-of-account-applet/src/app/app.routing.ts
    - blg-applet-wavelet-statement-of-account-applet/micro-fe/projects/wavelet-erp/applets/statement-of-account-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-statement-of-account-applet/micro-fe/projects/wavelet-erp/applets/statement-of-account-applet/src/app/services/statement-of-account-pages.service.ts
  configuration:
    - blg-applet-wavelet-statement-of-account-applet/micro-fe/projects/wavelet-erp/applets/statement-of-account-applet/src/app/app.module.ts
    - blg-applet-wavelet-statement-of-account-applet/micro-fe/projects/wavelet-erp/applets/statement-of-account-applet/src/app/components/settings-container/field-configuration/field-configuration.component.ts
    - blg-applet-wavelet-statement-of-account-applet/micro-fe/projects/wavelet-erp/applets/statement-of-account-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-wavelet-statement-of-account-applet/micro-fe/projects/wavelet-erp/applets/statement-of-account-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-statement-of-account-applet/micro-fe/projects/wavelet-erp/applets/statement-of-account-applet/src/app/components/settings-container/printable-format-settings-container/printable-format-listing/printable-format-listing.component.ts
    - blg-applet-wavelet-statement-of-account-applet/micro-fe/projects/wavelet-erp/applets/statement-of-account-applet/src/app/state-controllers/printable-format-controller/store/effects/printable-format.effects.ts
    - blg-applet-wavelet-statement-of-account-applet/micro-fe/projects/wavelet-erp/applets/statement-of-account-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-statement-of-account-applet/micro-fe/projects/wavelet-erp/applets/statement-of-account-applet/src/app/components/statement-of-account-container/statement-of-account-listing/statement-of-account-listing.component.ts
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/statementOfAccount/StatementOfAccountRunHdrController.java
  fields:
    - blg-applet-wavelet-statement-of-account-applet/micro-fe/projects/wavelet-erp/applets/statement-of-account-applet/src/app/components/statement-of-account-container/statement-of-account-create/main-details/main-details.component.ts
    - blg-applet-wavelet-statement-of-account-applet/micro-fe/projects/wavelet-erp/applets/statement-of-account-applet/src/app/components/statement-of-account-container/statement-of-account-create/main-details/main-details.component.html
    - blg-applet-wavelet-statement-of-account-applet/micro-fe/projects/wavelet-erp/applets/statement-of-account-applet/src/app/components/statement-of-account-event-container/statement-of-account-event-view/main-details/main-details.component.ts
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/api/constants/StatementOfAccountStatementTypeConstants.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/api/constants/StatementOfAccountRunTypeConstants.java
  lifecycle:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/statementOfAccount/StatementOfAccountRunLineService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/statementOfAccount/StatementOfAccountRunHdrService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/statementOfAccount/StatementOfAccountEventHdrService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/statementOfAccount/StatementOfAccountEventHdrRecurringService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/erp/statementOfAccount/StatementOfAccountRunLinesCreationProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/erp/statementOfAccount/StatementOfAccountRunPdfGenerationProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/StatementOfAccountRecurringEventsProcessor.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/StatementOfAccountRunStatus.java
  troubleshooting:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/statementOfAccount/StatementOfAccountRunLineService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/statementOfAccount/StatementOfAccountEventHdrService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/statementOfAccount/StatementOfAccountRunHdrController.java
tags:
- finance
- accounts-receivable
- statement-of-account
- customer-communication
- templates
- email
weight: 90
---

## Overview

The Statement of Account applet produces customer statements in batches. You create a **run** for a period, tell it which companies and which customers to cover, choose a layout and choose whether the output is printed or e-mailed; the server then expands the run into one **line per company-and-customer pair**, renders a PDF for each line and — for an e-mail run — sends it.

It is a reporting and distribution applet. It writes `bl_fi_stmt_account_run_hdr` and `bl_fi_stmt_account_run_line` plus the template and event tables, and nothing else. No journal, no stock, no generic document, no change to any balance.

## Where it fits

| Direction | What | Why |
|---|---|---|
| Upstream | [Organization](/applets/master-data/organisation-applet/) | A run is scoped to one or more companies. Only customers that have a FINAL document against that company are considered. |
| Upstream | [Customer Maintenance](/applets/master-data/customer-maintenance-applet/) / [Entity](/applets/master-data/entity-applet/) | Supplies the customer's categories (`bl_fi_mst_entity_label_link`), its `default_sales_agent`, and every e-mail address a statement can be sent to. |
| Upstream | Sales documents — [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/) and the rest of `bl_fi_generic_doc_hdr` | A customer only enters a run if it has at least one `posting_status = FINAL` document for the company before the statement end date. |
| Upstream | Printable formats (`bl_prt_printable_format_hdr`, txn type `STATEMENT_OF_ACCOUNT`) | Chosen per run; the layout of the PDF. |
| Downstream | The customer's inbox, or a batch PDF download | |
| Adjacent | [Debtor Report](/applets/finance/debtor-report-applet/) | The same receivable position as an internal report rather than a customer-facing document. |

## Screens and menus

Route root: `applet/tnt/wavelet/erp/statement-of-account-applet`. Landing route is **Statement Of Account Runs**.

| Menu item | Route | What it is |
|---|---|---|
| Statement Of Account Runs | `statement-of-account` | Listing, create and view of runs. The view has **Main Details** and **Lines** tabs. |
| Statement Of Account Templates | `statement-of-account-template` | Reusable header plus company / customer-category / sales-agent filter lists. |
| Statement Of Account Events | `statement-of-account-events` | Scheduled runs, optionally recurring through an RRULE. |
| Audit Trail | `audit-trail` | The shared-utilities audit-trail screen. |

Settings menu: **Application Settings** (`settings/field-settings`) and **Printable Format Settings**
(`settings/printable-format-settings`). Personalization menu: **Default Selection**.

Routed but not linked from any menu: `settings/default-selection`, `settings/webhook`,
`settings/feature-visibility`, `settings/client-side-permission-listing` (which is also the default
redirect for `settings`), `settings/role-pricing-scheme-link-listing`, the permission wizard and the
four permission listings, and `personalization/sidebar`. Two further settings routes — Workflow
Settings and Email Template — are commented out of both the routing table and the menu.

## Configuration

### Before you can use it

| Prerequisite | Where | Why it blocks you |
|---|---|---|
| At least one printable format with txn type `STATEMENT_OF_ACCOUNT` | Printable format maintenance | The Printable Format control on the run form filters on that txn type. Without one there is nothing to select and nothing to render. |
| Customers carrying a **customer category**, or customers with a **default sales agent** | [Customer Maintenance](/applets/master-data/customer-maintenance-applet/) | A run selects customers **only** by category or by sales agent. There is no "all customers" option, and a run with neither produces no lines. |
| FINAL sales documents for the company in the period | Sales applets | The candidate customer list is `SELECT DISTINCT doc_entity_hdr_guid FROM bl_fi_generic_doc_hdr … posting_status ILIKE 'FINAL'`. A customer with only draft documents is never in a run. |
| E-mail addresses on the customer, for an e-mail run | [Customer Maintenance](/applets/master-data/customer-maintenance-applet/) | Addresses are gathered from the entity's main e-mail, its primary and secondary address contacts, staff/family contacts and login subjects, according to the run's own check boxes. Invalid addresses are filtered out silently. |

### Applet settings

**Applet-local, and — unusually for this lane — the main screen is genuinely wired.**
`app.routing.ts` imports the applet's own `FieldConfigurationComponent`; `AppletSettingsModule` is in
`AppModule.imports`; the component builds a real `FormGroup`, patches it from
`SessionSelectors.selectMasterSettings` and dispatches `saveMasterSettingsInit` on SAVE.

Settings → **Application Settings** — 19 column-hide toggles, all declared, rendered and persisted.
Each one sets both `hide` and `suppressColumnsToolPanel` on its ag-grid column, so a hidden column
cannot be brought back from the grid's own column tool panel either. Who can change them: anyone who
can open the settings screen; there is no separate permission.

| Group | Setting | What it controls | Default | Consumed? |
|---|---|---|---|---|
| HDR Settings | `HIDE_HDR_BATCH_RUNNING_NO` | Batch Running No column on the Runs listing | off (unset) | Yes |
| HDR Settings | `HIDE_HDR_RUN_TYPE` | Run Type column | off | Yes |
| HDR Settings | `HIDE_HDR_STATEMENT_TYPE` | Statement Type column | off | Yes |
| HDR Settings | `HIDE_HDR_PRINTABLE_FORMAT` | Printable Format column | off | Yes |
| HDR Settings | `HIDE_HDR_RUN_START_DATE` | Run Start Date column | off | Yes |
| HDR Settings | `HIDE_HDR_RUN_END_DATE` | Run End Date column | off | Yes |
| HDR Settings | `HIDE_HDR_RUN_STATUS` | Run Status column | off | Yes |
| HDR Settings | `HIDE_HDR_COMPANY_CODES` | Company Code(s) column | off | Yes |
| HDR Settings | `HIDE_HDR_CUSTOMER_CATEGORIES` | Customer Category(s) column | off | Yes |
| HDR Settings | `HIDE_HDR_SALES_AGENTS` | Sales Agent(s) column | off | Yes |
| HDR Settings | `HIDE_HDR_RUN_BY` | Run By column | off | Yes |
| HDR Settings | `HIDE_HDR_CREATED_DATE` | Created Date column | off | Yes |
| HDR Settings | `HIDE_HDR_UPDATED_DATE` | Updated Date column | off | Yes |
| Line Settings | `HIDE_LINE_COMPANY_CODE` | — | off | **No** |
| Line Settings | `HIDE_LINE_CUSTOMER_NAME` | — | off | **No** |
| Line Settings | `HIDE_LINE_RUN_START_DATE` | — | off | **No** |
| Line Settings | `HIDE_LINE_RUN_END_DATE` | — | off | **No** |
| Line Settings | `HIDE_LINE_RUN_STATUS` | — | off | **No** |
| Line Settings | `HIDE_LINE_RECIPIENT_EMAILS` | — | off | **No** |

The six **Line Settings** toggles save but are read by nothing: the Lines grid builds its columns
without consulting them. Turning them on changes nothing on screen.

Settings → **Printable Format Settings** owns one further key. Marking a format as the default
dispatches `saveMasterSettingsInit` with `PRINTABLE` set to that format's GUID, and the run, event and
template forms all pre-select it (`printable_format_hdr_guid ?? appletSettings.PRINTABLE`). That is the
only setting in this applet that changes what a document does rather than what a grid shows.

`models/applet-settings.model.ts` also declares `DEFAULT_BRANCH`, `DEFAULT_LOCATION`,
`DEFAULT_COMPANY`, `DEFAULT_VALIDITY_DAYS` and `DEFAULT_PRICING_SCHEME`. The Default Selection screen
that would write them is routed but commented out of the settings menu, and no code in the applet reads
any of the five. Treat them as model-only.

No inline `app-applet-settings-toggle` gear anywhere in the applet.

### Document behaviour settings

A run is not a generic document: there is no posting, no printable-per-status, no approval and no
workflow. The two behaviours that look like settings are fields on the run itself — **Statement Type**
and **Run Type** — and are described under [Fields](#fields).

### Settings in other applets that control this applet

| Setting | Where it is set | Effect here |
|---|---|---|
| Customer categories (entity labels) | [Customer Maintenance](/applets/master-data/customer-maintenance-applet/) | One of the only two ways a customer can be selected into a run. |
| `default_sales_agent` on the customer | [Customer Maintenance](/applets/master-data/customer-maintenance-applet/) | The other way. Note that selecting a sales agent picks up **every** customer whose default agent matches, regardless of the period, in addition to customers who appear as `sales_entity_hdr_guid` on a FINAL document in the period. |
| Entity e-mail, address contacts, staff/family contacts, login subjects | [Customer Maintenance](/applets/master-data/customer-maintenance-applet/) / [Entity](/applets/master-data/entity-applet/) | The candidate recipient list for an e-mail run. |
| Printable format definitions (txn type `STATEMENT_OF_ACCOUNT`) | Printable format maintenance | The PDF layout. |

### Feature visibility and permissions

CRUD on runs, templates and events is gated by one family,
`API_TNT_DM_ERP_STATEMENT_OF_ACCOUNT_OWNER` / `_ADMIN` / `_CREATE` / `_READ` / `_UPDATE` / `_DELETE`
(`TntErpPermissions`). The run form also carries a client-side company-target check against
`API_TNT_DM_ERP_STATEMENT_OF_ACCOUNT_READ`.

The action endpoints are the exception. `POST /run/{guid}`, `POST /regenerate/{guid}`,
`POST /{guid}/retry-pending-lines` and `POST /retry-pending-lines` are declared as
`AuthenticatedTenantEndpoint` and perform **no permission check at all**. Any authenticated tenant user
can start, regenerate or retry a run — and the last of those has no GUID, so it sweeps every incomplete
run in the tenant.

No `bl_applet_client_side_perm_dfn` rows are seeded for this applet, so the Client-Side Permission
listing — which is also where `settings` redirects — opens empty.

## Fields

### Run — Main Details

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Statement Type | `AGING` or `TRANSACTION_HISTORY` | Yes | Controls the layout and whether Month From is shown. |
| Run Type | `PRINT` or `EMAIL` (labelled Print and Email) | Yes | `EMAIL` reveals Recipient Emails and the five recipient check boxes. |
| Companies | One or more companies | Yes | Stored as `companies_json = {companies: [...], companies_name: [...]}`. |
| Sales Agent / Customer Category (radio pair) | Which selector to use | **At least one** | Enforced by a form-level `atLeastOneCheckedValidator`. See [Lifecycle](#lifecycle-and-effects) for what the server does when neither is populated. |
| Sales Agent(s) | Employees / entities acting as sales agent | When Sales Agent is chosen | Stored as `sales_agents = {agents: [...], agents_name: [...]}`. |
| Customer Category(s) | Entity labels | When Customer Category is chosen | Stored as `customer_categories = {categories: [...], categories_name: [...]}`. |
| Month From | Start of the statement period | Only for `TRANSACTION_HISTORY` | The control is hidden for `AGING`; the value still defaults to the start of the current month. |
| Month To | End of the statement period | Yes | Both dates are snapped to `startOf('month')` and `endOf('month').endOf('day')` on every change — a run always covers whole months. |
| Printable Format | The PDF layout | Yes | Filtered to txn type `STATEMENT_OF_ACCOUNT`; defaults to the `PRINTABLE` applet setting. |
| Recipient Emails | Extra addresses typed in | No | Only for `EMAIL`. Invalid addresses are dropped without a message. |
| Main / Primary Address Contacts / Secondary Address Contacts / Staff Family / Login Subjects | Which stored addresses to include | No | Only for `EMAIL`. Stored in `soa_settings_json.email_config`; all five default to on. |
| Email All Outstanding Docs | Attach every outstanding document | No | Stored in `soa_settings_json.email_config.email_all_outstanding_docs`; defaults to off. |
| Run By, Run Status | Who created the run, where it is | Read-only | Shown only in edit mode. |

Every field above is disabled once the run exists. A run is effectively immutable after CREATE; the
only actions are RUN (while the status is `CREATED`), regenerate, retry and delete.

### Run — Lines

One line per company-and-customer pair, holding the batch running number, the header GUID, company,
customer, run status and — for an e-mail run — the resolved recipient list. Lines are created by the
server, never by hand.

### Event

An event carries the same run configuration (statement type, run type, printable format, period,
e-mail configuration) plus `code`, `is_recurring`, `date_start`, `date_end`, an RRULE and an optional
**Template**. Its company, customer-category and sales-agent filters live in three dedicated filter
tables rather than in JSON. A recurring event is expanded into one event row per occurrence at save
time by `StatementOfAccountEventHdrRecurringService`.

### Template

The same header shape plus the three filter tables. A template is selected on the **Event** form and
pre-fills it. Nothing on the server ever reads `template_hdr_guid`: the event-to-run conversion copies
from the event header and the event's own filter rows. A template is a convenience for the person
filling in an event form, not a runtime binding.

## Lifecycle and effects

Run statuses are `CREATED` → `IN_PROGRESS` → `COMPLETED`, or `FAILED`.

### Creating a run

Saving the form creates `bl_fi_stmt_account_run_hdr` at `CREATED` and enqueues
`STATEMENT_OF_ACCOUNT_RUN_LINES_CREATION_PROCESSOR` with `ExecutionStrategy.RUN_NOW`.

### How the processor chooses customers

`StatementOfAccountRunLineService.processEvent`:

1. For each selected company, list the distinct customers that have any `ACTIVE` generic document with
   `posting_status ILIKE 'FINAL'` and `date_txn < statement end date + 1s`. The statement **start** date
   is not used in this query — a customer with an old FINAL document and nothing in the period is still
   a candidate.
2. Collect the customers belonging to the selected categories, from `bl_fi_mst_entity_label_link`.
3. If both sets are non-empty, intersect them per company and create the lines.
4. Otherwise, if there are sales agents selected and no categories, build the customer set from
   customers on FINAL documents in the period whose `sales_entity_hdr_guid` is one of the agents,
   **unioned with** every non-deleted entity whose `default_sales_agent` is one of the agents, then
   intersect per company and create the lines.
5. If an intersection comes out empty, the run header is set to `FAILED` with
   *No customers matched the provided criteria.*

Note the shape of that logic: if **neither** a category nor a sales agent survives, neither branch runs,
no lines are created **and no failure is recorded**. The run stays where it was.

### Running

`POST /run/{guid}` moves a `CREATED` run to `IN_PROGRESS`, creates the lines if none exist yet, and then
renders and (for an e-mail run) sends each line asynchronously. Lines reach `COMPLETED` individually.

`POST /regenerate/{guid}` does the same for a run already at `COMPLETED` or `FAILED`. There is no
action that recovers a run stuck at `IN_PROGRESS` other than the retry endpoints, which re-process only
lines still at `CREATED`.

The separate `STATEMENT_OF_ACCOUNT_RUN_PDF_GENERATION_PROCESSOR` calls
`processStatementOfAccountRun(Optional.empty(), conn, true)` — an **empty** GUID. It is a sweeper: every
run header in the tenant with `run_count_completed = false` and status `CREATED` is processed, not just
the one whose event triggered it.

### Scheduled runs

`STATEMENT_OF_ACCOUNT_RECURRING_EVENTS_PROCESSOR` is a cron processor. On each pass it takes every
`ACTIVE` event with `run_status = PENDING` whose `date_end` falls in the previous 24 hours, builds a run
header from the event and its filter rows, creates it, and stamps the event with `run_status = 'CREATED'`
and the new run's GUID. An event therefore converts once; recurrence comes from the event rows the
RRULE expansion created, not from re-firing one event.

{{< callout type="warning" >}}
**A scheduled run currently produces no lines.** The event-to-run conversion writes the customer
categories under the JSON key `customer_categories` and the sales agents under `sales_agents`, while
`StatementOfAccountRunLineService.processEvent` reads `customer_categories.categories` and
`sales_agents.agents` — the key names the run form writes. Both lists therefore resolve to empty, step 3
and step 4 above are both skipped, and the run sits with no lines and no `FAILED` status. Only the
company key matches between the two paths. Runs created by hand are unaffected.
{{< /callout >}}

### What a run writes

`bl_fi_stmt_account_run_hdr`, `bl_fi_stmt_account_run_line`, and the rendered PDFs in file storage.
Nothing else. There is no journal, no signum, no stock movement and no change to any customer balance —
a statement reports the receivable position, it does not create it.

## Related applets

- [Customer Maintenance](/applets/master-data/customer-maintenance-applet/) — categories, default sales agent and every e-mail address a statement can reach.
- [Entity](/applets/master-data/entity-applet/) — the underlying entity record, its address contacts and login subjects.
- [Organization](/applets/master-data/organisation-applet/) — the companies a run is scoped to.
- [Employee](/applets/master-data/employee-applet/) — sales agents.
- [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/) — the FINAL documents that make a customer eligible.
- [Debtor Report](/applets/finance/debtor-report-applet/) — the internal view of the same receivables.
- [Ledger and Journal](/applets/finance/ledger-and-journal-applet/) — where the receivable balance actually lives.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| A **scheduled event fires but the run has no lines** and never fails | The event-to-run conversion writes `customer_categories` / `sales_agents`; the line processor reads `categories` / `agents`. | Open the run and press RUN — the manual path re-reads the same JSON, so this does not help; create the run by hand instead until the key names are aligned. |
| Run status **FAILED**, *No customers matched the provided criteria.* | The category or sales-agent set produced no customer that also has a FINAL document against one of the selected companies. | Check that the customers carry the category, and that they have at least one FINAL document for that company before the statement end date. |
| A customer you expected is **missing from the lines** | It has no `posting_status = FINAL` document for that company, or it is not in the selected category and its `default_sales_agent` is not one of the selected agents. | There is no "all customers" option; widen the category or agent selection. |
| A customer appears **with no activity in the period** | The candidate query filters only on `date_txn < end date`. The start date is not applied. | Expected behaviour; the statement content itself is period-bounded by the printable format. |
| **Line Settings toggles do nothing** | The six `HIDE_LINE_*` keys are saved but read by nothing. | Use the grid's own column tool panel on the Lines tab. |
| A hidden column **cannot be restored from the grid** | Each `HIDE_HDR_*` sets `suppressColumnsToolPanel` as well as `hide`. | Turn the toggle off in Settings → Application Settings. |
| **Nothing to choose in Printable Format** | No printable format exists with txn type `STATEMENT_OF_ACCOUNT`. | Create one in printable-format maintenance. |
| An **e-mail run sends to fewer people than expected** | Addresses that fail validation are dropped silently, and each of the five recipient sources is an independent check box. | Verify the entity's main e-mail, address contacts and login subjects; re-check the boxes. |
| A run is **stuck at IN_PROGRESS** | `run` only acts on `CREATED` and `regenerate` only on `COMPLETED` / `FAILED`. | Use the retry-pending-lines endpoint, which re-processes lines still at `CREATED`. |
| **Month From is not shown** | It renders only when Statement Type is `TRANSACTION_HISTORY`. | Expected. For `AGING` the period is the single Month To. |
| A user without statement permissions **started a run** | `/run`, `/regenerate` and both retry endpoints perform no permission check. | Restrict at the network or role level; there is no applet-side control. |

## Related documentation

- [Financial Accounting module](/modules-v2/financial-accounting/) — where customer statements sit in the collections cycle.
- [Customer Maintenance applet](/applets/master-data/customer-maintenance-applet/) — categories, sales agent and contact e-mail reference.
