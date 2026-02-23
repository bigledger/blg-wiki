---
title: "Tenant Admin Applet"
description: "Centralized tenant governance applet for catalogues, users, roles, permission sets, settings, and audit traceability"
tags:
- tenant-administration
- access-control
- role-management
- permission-sets
- audit-trail
weight: 61
---

## Purpose and Overview

The **Tenant Admin Applet** is a tenant governance workspace in Akaun Platform. It centralizes administration of catalogue access, user access, applet assignment, role and permission controls, and operational audit visibility.

{{< callout type="info" >}}
**Core Concept**: Control **who** can access the tenant, **what** they can access (catalogues/applets), and **how** access is governed (roles, permission sets, and audit trail).
{{< /callout >}}

{{< figure src="/images/tenant-admin-applet/tenant-main-listing.png" alt="Tenant Admin main listing page showing governance modules" caption="Main Listing Page: Central menu for tenant governance modules" >}}

## Key Features Overview

### Who Benefits from This Applet?

**Tenant Administrators:**
- Manage tenant users, admins, applets, and catalogues in one place
- Configure role and permission structures
- Control menu/module visibility through settings flags

**Security & Operations Teams:**
- Standardize role-based access controls
- Reduce access drift with assignment visibility and review flows
- Monitor risky changes through audit logs

**Compliance & Audit Stakeholders:**
- Trace who changed what and when
- Review action metadata for access governance controls
- Support internal/external audit evidence collection

**Tenant End Users:**
- Receive more accurate access assignment
- Get appropriate applet and catalogue visibility based on role
- Experience fewer access configuration issues

### What Problems Does This Solve?

**Before:**
- Access administration often spread across multiple workflows
- User/applet/catalogue assignments were harder to validate consistently
- Role and permission changes were difficult to trace end-to-end
- Manual setup increased risk of misconfiguration

**After:**
- A single route-driven applet for tenant administration workflows
- Role and permission set governance with target scoping support
- Structured user and applet assignment visibility (counts and drill-ins)
- Audit trail-based traceability for administrative changes

## Key Features Overview

{{< cards >}}
  {{< card title="Catalogue Governance" subtitle="Catalogue records and applet linkage controls" link="#main-modules" >}}

  {{< card title="User Access Control" subtitle="Tenant and platform user assignment workflows" link="#user-access-control" >}}

  {{< card title="Roles & Permissions" subtitle="Role listing, assignment counts, and permission sets" link="#roles--permission-sets" >}}

  {{< card title="Role File Import" subtitle="Template download + bulk upload with status tracking" link="#role-file-import" >}}

  {{< card title="Audit Visibility" subtitle="Searchable action history for governance and compliance" link="#audit-trail" >}}

  {{< card title="Settings & Personalization" subtitle="Menu visibility, defaults, and personalization" link="#configuration--settings" >}}
{{< /cards >}}

{{< figure src="/images/tenant-admin-applet/tenant-admin-overview-infographic.png" alt="Tenant Admin infographic showing before challenges, applet solution, and user roles" caption="Tenant Admin Overview: Before-state challenges, applet solution, and who benefits" >}}

## Key Concepts

### Tenant Access Governance Model

| Governance Question | Primary Module(s) | Outcome |
|---|---|---|
| Who can access the tenant? | Tenant Users, Platform Users, Tenant Admins | Controlled subject-level access |
| What can they open? | Catalogue, Applets | Controlled applet/catalogue footprint |
| What can they do? | Tenant Roles, Permission Sets | Action-level control by role/perm set |
| How do we validate changes? | Audit Trail | Traceable governance history |

{{< callout type="tip" >}}
**Recommended sequence**: Configure Roles and Permission Sets first, then assign users and applets, then validate all changes in Audit Trail.
{{< /callout >}}

---

## Quick Start Guide

Get up and running quickly using these role-focused workflows.

### For Tenant Administrators: Baseline Setup

**Goal:** Set up tenant governance in 10 practical steps.

1. Open `Tenant Admin` and verify the current tenant context.
2. Go to `Settings` and ensure required modules are visible (Catalogue, Users, Roles, Permission Sets, Audit Trail).
3. Configure default selections (branch, location, company, row count).
4. Configure `Catalogue` records and applet linkages.
5. Review `Applets` listing and validate status/availability.
6. Configure `Tenant Roles` and review role distribution counts.
7. Configure `Permission Sets` and map to applet/target requirements.
8. Validate `Tenant Users` and `Platform Users` assignments.
9. Register and verify at least two active `Tenant Admins`.
10. Execute one test update and confirm traceability in `Audit Trail`.

### For Security & Operations: Control Hardening

**Goal:** Reduce misconfiguration and over-privileged access.

1. Review duplicate or obsolete roles in `Tenant Roles`.
2. Review `Permission Sets` for unnecessary broad permissions.
3. Check role `No. of Users` and `No. of Teams` for over-assignment patterns.
4. Enforce target scoping (company/branch/location) where required.
5. Ensure continuity coverage with backup admin accounts.
6. Validate module visibility policy by role (admin vs operations vs audit).
7. Perform recurring `Audit Trail` review for privileged changes.

### For Compliance/Audit Teams: Evidence Review

**Goal:** Produce defensible governance evidence.

1. Filter `Audit Trail` by date, action type, and actor.
2. Sample high-impact changes (role edits, permission changes, admin updates).
3. Verify timestamp and actor data consistency.
4. Capture/export artifacts for audit working papers.
5. Log unresolved exceptions for remediation tracking.

### For Application Support: Resolve Access Issues Fast

**Goal:** Close common access tickets with consistent checks.

1. Confirm module visibility in `Settings`.
2. Check user assignment in `Tenant Users` or `Platform Users`.
3. Verify role assignment and corresponding `Permission Sets`.
4. Confirm applet/catalogue linkage in `Catalogue` and `Applets`.
5. Use `Audit Trail` to identify recent changes causing the issue.

### Real-World Walkthrough: New Tenant Access Rollout (End-to-End)

**Scenario:** A tenant is onboarding a new Finance operations team and needs controlled access by end of day.

1. Admin enables required modules in `Settings` (`Catalogue`, `Applets`, `Tenant Users`, `Tenant Roles`, `Permission Sets`, `Audit Trail`).
2. Admin verifies or creates Finance-related catalogue entries in `Catalogue`.
3. Admin confirms required applets are active in `Applets` and linked to the correct catalogue.
4. Admin creates/updates `Tenant Roles` for Finance Clerk and Finance Supervisor.
5. Admin maps appropriate `Permission Sets` to each role with required target scoping.
6. Admin assigns pilot users in `Tenant Users` and validates applet/catalogue visibility.
7. Support performs login validation with pilot users and checks expected menu access.
8. Compliance reviews `Audit Trail` for all setup actions and records evidence.

**Outcome:** Access is provisioned consistently, validated by support, and traceable for audit.

### Common Mistakes (Quick Start)

- Enabling roles before module visibility is configured in `Settings`.
- Assigning users before applet-to-catalogue linkage is verified.
- Reusing broad permission sets for specialized roles without scoping.
- Skipping pilot-user validation before full rollout.
- Missing audit verification after high-impact access changes.

**How to avoid them:** Always follow sequence: visibility -> catalogue/applet linkage -> role/permission set -> user assignment -> pilot test -> audit verification.

{{< callout type="tip" >}}
**Go-live checklist**: module visibility verified, defaults configured, roles finalized, permission sets mapped, user assignments tested, and first-week audit monitoring scheduled.
{{< /callout >}}

---

## Main Modules

The applet is organized into these governance modules:

| Module | Primary Use |
|---|---|
| `Catalogue` | Manage catalogue records and applet-to-catalogue linkage |
| `Subscription` | Handle tenant subscription-related administration |
| `Tenant Users` | Manage tenant-level user access and assignments |
| `Platform Users` | Manage platform-level user access in tenant context |
| `Applets` | Review and govern applet availability |
| `Tenant Roles` | Define role structures and review assignment counts |
| `Role File Import` | Bulk upload role definitions via template |
| `Tenant Admins` | Maintain tenant administrator accounts |
| `Permission Sets` | Configure reusable permission packages |
| `Data Sync` | Manage synchronization controls (branch readiness dependent) |
| `Audit Trail` | Review action history and traceability |
| `Settings` | Configure defaults, field settings, webhooks, and permission views |
| `Personalization` | User-level personalization controls |

## Core UI Workflows

### Listings and Operational Views

The UI provides grid-driven operations for major modules:
- User views include assignment counts (`No. of Catalogue`, `No. of Applets`) and status fields
- Role views include distribution metrics (`No. of Users`, `No. of Teams`)
- Permission set views include code/name/applet/date tracking
- Role import views include file status and processing error messages
- Audit views include actor/action/date filtering for traceability

### Create/Edit and Action Flows

Common workflows available in the applet:
- Catalogue create/edit and applet linkage flows
- Permission set add/edit with multi-step line configuration
- Role file upload with sample CSV download support
- Tenant admin create/edit flows
- Applet add-to-catalogue and install-for-user operations

{{< figure src="/images/tenant-admin-applet/tenant-main-listing.png" alt="Catalogue listing for tenant-admin" caption="Catalogue Listing: Manage tenant catalogue entries" >}}

{{< figure src="/images/tenant-admin-applet/tenant-catalogue-create.png" alt="Catalogue create form" caption="Create Form: Configure and maintain catalogue records" >}}

{{< figure src="/images/tenant-admin-applet/tenant-catalogue-edit.png" alt="Catalogue edit form" caption="Edit Form: Configure and maintain catalogue records" >}}

## User Access Control

Use `Tenant Users`, `Platform Users`, and `Tenant Admins` for access operations.

- Review assignment footprint and status
- Maintain tenant-level administrators
- Verify user-to-applet and user-to-catalogue consistency

{{< figure src="/images/tenant-admin-applet/tenant-user.png" alt="Tenant users listing" caption="Tenant Users Listing: User access footprint and status" >}}

## Roles & Permission Sets

Role and permission components provide access governance primitives:

- `Tenant Roles` for role definitions and assignment metrics
- `Permission Sets` for reusable permission packages
- Target scoping support in role/app permission flows (company/branch/location)

{{< figure src="/images/tenant-admin-applet/tenant-role.png" alt="Roles listing" caption="Tenant Roles : Structured role-based governance" >}}

{{< figure src="/images/tenant-admin-applet/tenant-permission-set.png" alt="Permission sets listing" caption="Tenant Permission Sets: Structured role-based governance" >}}

## Role File Import

Role onboarding supports bulk import:

- Download sample template CSV
- Upload role file
- Review process status and row-level error information

{{< figure src="/images/tenant-admin-applet/role-file-import-page.png" alt="Role file import page" caption="Role File Import: Template-based bulk setup and status monitoring" >}}

## Audit Trail

`Audit Trail` supports traceability and governance monitoring:

- Filter by action/date/actor
- Review change history for sensitive operations
- Produce compliance evidence

{{< figure src="/images/tenant-admin-applet/tenant-audit-trail-2.png" alt="Audit trail listing" caption="Audit Trail: Searchable administrative change history" >}}

## Configuration & Settings

Settings and personalization modules include:

- Menu/module visibility flags
- Default selection settings
- Field settings and webhook configuration
- Personalization sidebar/defaults

{{< figure src="/images/tenant-admin-applet/tenant-setting-page.png" alt="Tenant admin settings page" caption="Settings Page: Configure module visibility and defaults" >}}

### Configuration Checklist (Recommended)

Use this sequence when configuring a new tenant:

1. Verify module visibility flags in `Settings`.
2. Set default values (company, branch, location, row count).

{{< figure src="/images/tenant-admin-applet/tenant-default.png" alt="Tenant defaults configuration for company, branch, location, and list row count" caption="Default Settings: Set company, branch, location, and row-count defaults" >}}

3. Configure roles and permission sets.

{{< figure src="/images/tenant-admin-applet/tenant-perm-wizard.png" alt="Permission wizard for target scoping and permission configuration" caption="Permission Wizard: Define scoped permissions by company, branch, and location" >}}

{{< figure src="/images/tenant-admin-applet/tenant-perm-set.png" alt="Permission set configuration screen" caption="Permission Sets: Create reusable access packages for applets" >}}

{{< figure src="/images/tenant-admin-applet/tenant-user-perm.png" alt="User-level permission configuration screen" caption="User Permissions: Override or refine access for specific users" >}}

{{< figure src="/images/tenant-admin-applet/tenant-role-perm.png" alt="Role permission mapping screen" caption="Role Permissions: Map roles to permission sets and scoped actions" >}}

4. Validate tenant/platform user assignments.
5. Confirm audit logging visibility for key actions.

### Module Visibility Guidance by Role

| Role | Recommended Visible Modules |
|---|---|
| Tenant Administrator | Catalogue, Tenant Users, Platform Users, Applets, Tenant Roles, Permission Sets, Tenant Admins, Audit Trail |
| Security/Operations | Tenant Roles, Permission Sets, Tenant Users, Platform Users, Audit Trail, Data Sync |
| Compliance/Audit | Audit Trail, Tenant Roles (read access), Permission Sets (read access) |

### Role and Permission Governance Settings

Apply these controls to reduce misconfiguration risk:

- Keep role definitions business-function based (not user-specific).
- Use permission sets for reusable access patterns.
- Apply target scoping (company/branch/location) where required.
- Review role assignment counts (`No. of Users`, `No. of Teams`) regularly.

### Audit and Monitoring Configuration

Operationally recommended checks:

- Daily: review high-impact role/permission/admin changes in `Audit Trail`.
- Weekly: verify unexpected module visibility changes.
- Monthly: recertify role and permission set usage with business owners.

### Environment Notes

- `Data Sync` may be partially implemented depending on branch.
- `Subscription` hostname-related functionality may require environment-specific integration completion.
- Validate settings route defaults in your deployment branch to avoid redirect inconsistencies.

## FAQ

**Q1: A user is assigned but still cannot see a module. What should I check first?**  
A: Check in this order: module visibility in `Settings`, user assignment (`Tenant Users`/`Platform Users`), role assignment, then linked permission set.

**Q2: When should I use Tenant Users vs Platform Users?**  
A: Use `Tenant Users` for tenant-scoped account operations. Use `Platform Users` when access is managed from platform-level identity context.

**Q3: How do I safely roll out a new role to many users?**  
A: Create and validate the role with a pilot user first, map the correct permission set, then roll out in batches while monitoring `Audit Trail`.

**Q4: How do I bulk onboard roles quickly?**  
A: Use `Role File Import`: download sample CSV, populate required columns, upload, then review file status and error rows.

**Q5: How can I verify who changed a permission or role setting?**  
A: Use `Audit Trail` filters (actor, action, date) and inspect event details for traceability.

**Q6: Why do labels sometimes appear in English only?**  
A: Some views rely on shared-host `labels` translations. If unavailable, components use built-in English fallback text.

**Q7: What should I validate before go-live?**  
A: Validate module visibility, defaults, roles, permission sets, user assignments, backup admins, and run an end-to-end test recorded in `Audit Trail`.

**Q8: Is Data Sync production-ready in all environments?**  
A: Not always. Confirm branch/environment readiness because some implementations contain TODO or partial sync wiring.