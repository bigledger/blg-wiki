# Product findings — ready to file as issues

Found while documenting the platform. Ordered by severity. Each is written so it can be filed with
no rewriting. `wiki_ref` points at the feedback item with the full context.

*Last updated 2026-09-06. Move a row to `filed/` once an issue exists, with the issue reference.*

## security

| id | finding | area | wiki_ref |
|---|---|---|---|
| P-0001 | **Live LHDN credentials in two repo images** — client id, client secret and full bearer tokens readable, plus a real customer TIN. Rotate the secrets and replace the images. | e-invoice / blg-intranet | F-0217 |
| P-0002 | **A customer's Firebase service-account key was public via the wiki CDN** 2026-02-16 → 2026-09-05. Quarantined. Rotate the key; decide on a git-history purge; check CDN logs. | wiki assets | F-0181 |
| P-0003 | **Soft-deleted tenant-admin grants still resolve true** — unparenthesised `OR` in `PermissionMigrationUow` means a revoked admin keeps access and bypasses the applet filter. | permissions | F-0200 |
| P-0004 | **The approval decision endpoint is unauthenticated** (`PUT …/approval-requests/processors/public-ep`, `AnonymousTenantEndpoint`). Anyone holding an `approval_request_guid` can approve or reject a purchase order; the history then records the real approver's name. | approvals | F-0255 |
| P-0005 | **The deposit invitee quotation form and both its endpoints are anonymous** — no token, no expiry; the link GUID is the only credential. | deposit | F-0256 |
| P-0006 | **Supplier CSV import creates POs in the buyer's tenant without the entity-link check.** | supplier portal | F-0213 |
| P-0007 | **A market-data API key is compiled into the forex front end.** | forex | F-0113 |
| P-0008 | **Client-side visibility permissions can never be granted**, because the only screen that would seed them is a mock (Developer SysAdmin: hard-coded `rowData`, SAVE toasts success and makes no HTTP call). A hide-switch defaulting to "shown" therefore leaves data permanently visible. | permissions | F-0251, F-0257 |
| P-0009 | **Four SST/Statement-of-Account endpoints have no permission check** — the filing-cycle lock checks none, delete needs only READ, and one Statement of Account action sweeps the whole tenant. | tax / AR | F-0279, F-0280 |
| P-0010 | **A dev-tunnel URL with an IP address is published on the wiki** (`ngrok.io` host in the UCC applet page). | wiki content | F-0290 |

## data-loss

| id | finding | area | wiki_ref |
|---|---|---|---|
| P-0011 | **Every depreciation journal posts with zero lines.** The processor appends a line only when two subledger columns are non-null, and nothing in the Java tree ever sets them; the validator has no line-count or debit=credit check, so a `POSTED` header with no lines is written silently. Compounding: the run ignores its own company/branch parameters and keeps the default limit of 100; and with residual 0 the asset is flagged `DEPRECIATED` on the first run and later lines and journals are permanently deleted. | fixed asset | F-0265 |
| P-0012 | **Unfile deletes a `bl_fi_tax_txn` row** and marks the document unfiled — the duplicate-filing mechanism behind two customer tickets. `FILE ALL` also ignores the already-filed guard. | SST | F-0279 |
| P-0013 | **SST-02 item 13 is never assigned and item 14 = item 12**, so credit notes never reduce tax payable; Sales item 12 sums taxable amounts where tax belongs. | SST | F-0279 |
| P-0014 | **`createPickingList` ignores the queue selection and the remaining balance**, walking every line at full quantity, and truncates to `int` because the quantity columns are Integer in a BigDecimal system. | WMS | F-0233 |

## broken

| id | finding | area | wiki_ref |
|---|---|---|---|
| P-0015 | **The LHDN inbound pull is write-only.** Its output lands in a staging cache nothing reads; the only consumer-shaped class carries the comment *"the lhdn api is not available yet"* and has zero callers. `bl_fi_my_einvoice_from_irb_hdr` holds **0 rows on all 89 tenants**, and 662,436 matching-queue rows have accrued unprocessed since August 2024. A buyer also cannot reject a supplier e-invoice from BigLedger at all. | e-invoice | F-0273 |
| P-0016 | **Scheduled Statement of Account runs produce nothing** — the converter writes `customer_categories`/`sales_agents`, the processor reads `categories`/`agents`, and the failure path is unreachable so it never reports FAILED. Matches Critical ticket blg-intranet#4254. | AR | F-0280 |
| P-0017 | **Stock Requisition approval is a dead end** — settings screen and menu item, but no approval tab, no request screen, no history. A setting made there cannot be used. | approvals | F-0254 |
| P-0018 | **Transition Actions, Action Types and Subscribers are never executed** — CRUD services with no processor reading those tables. The wiki has been pointing customers at this engine for approvals. | workflow | F-0245 |
| P-0019 | **`DepositRolloverProcessor` writes orphan MONTH_OPENING/MONTH_CLOSING rows and rolls nothing over**; DELETE is unreachable on both deposit document screens. | deposit | F-0260 |

## degraded

| id | finding | area | wiki_ref |
|---|---|---|---|
| P-0020 | **SST-02 hard-codes tax-code string literals** (`SRS6`/`SVU-6`/`IMS6`, `SRS8`…), so item 10 filters on tariff code while item 11c filters on literals over the same table — the cause of the "item 10 and 11c don't tally" tickets from three unrelated tenants. No setting corrects it. | SST | F-0278 |
| P-0021 | **Reports read live data, returns read a snapshot** — SST Reports query live documents, the SST-02 queries `bl_fi_tax_txn` frozen at filing time, so they diverge permanently once a filed document is edited. Worth checking the same shape on every report. | SST | F-0278 |
| P-0022 | **`approval_logic` (ANY/ALL) and `max_approval_amount` are collected by the UI, stored, copied to the sequence row and never read.** A trap for anyone configuring approvals. | approvals | F-0254 |
| P-0023 | **`ProcessStatusService.delete` has no in-use check** — a status referenced by live documents can be deleted. | workflow | F-0247 |
| P-0024 | **The inbound e-invoice processor writes `dateTimeReceived` into `date_time_issued`**, overwriting the issue date. Harmless while nothing reads the table; not harmless the day something does. | e-invoice | F-0274 |
| P-0025 | **A `@Input()`/`@Output()` settings screen on a directly-routed component is inert** — `appletContainer` undefined, SAVE emits into the void. Confirmed on Fixed Asset and MY-SST. | applet framework | F-0281 |

## enhancement

| id | finding | area | wiki_ref |
|---|---|---|---|
| P-0026 | **Publish `blg-shared-utilities` to npm and give applet registration a self-service path.** Without both, an outside developer can build and host a bundle but cannot get it running — no public API or console for registration, two required fields only BigLedger holds, no public reference applet, no local shell. These two changes are what would make the Android standard reachable. | platform | F-0296 |
| P-0027 | **Webhooks have no HMAC signature and no retry**, and topics are a fixed enum of 53 rather than free-form. Both absences are reasonable to fix and both were promised by our own documentation. | webhooks | F-0286 |
| P-0028 | **Four unrelated approval engines** — Workflow Design (inert), `bl_fi_generic_doc_approval_*` (real), `bl_fi_budget_register_approval_*` (unaudited), RMA's `SVCApprovalStatus`. "Approval" means four different things. | platform | F-0267 |
| P-0029 | **Four applets are built and maintained but have no ACTIVE registry row** — Group Maintenance, E-Mandate, Team Maintenance, Investment. Either the registry is stale or applets ship outside it. | registry | F-0268, F-0282 |
| P-0030 | **Normalise `bl_applet_hdr.name`** — `mySST` is stored upper-case, so any UI that shows the registry name shouts. | registry | F-0281 |
