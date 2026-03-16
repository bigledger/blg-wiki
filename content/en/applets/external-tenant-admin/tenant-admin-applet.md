---
title: "Tenant Admin Applet"
description: "The primary administrative control panel for BigLedger platform tenants. Manage applet subscriptions, user access, role-based permissions, and system-wide configurations from a single, centralized hub."
tags:
- administration
- platform-management
- access-control
- security
- system-configuration
weight: 10
---

## Purpose and Overview

The **Tenant Admin Applet** is the central nervous system of your BigLedger environment. It provides organizational administrators with the master controls required to govern user access, subscribe to business modules, and maintain a secure, audit-ready platform. It is the single source of truth for "who can do what" within your digital workspace.

### TL;DR: The Administrative Cockpit

This applet is the "Master Switchboard" for your entire organization:

*   **The Catalogue**: Where you "install" business tools (Accounting, HR, POS).
*   **Tenant Users**: Where you create digital identities for your staff.
*   **Roles & Permissions**: Where you define the "keys" each staff member holds (e.g., can they *view* an invoice or *delete* it?).

It is the foundation that ensures your business data is only accessible to authorized personnel.

### When is this Applet used?

Administrators reach for this applet during critical organizational milestones:

*   **Employee Onboarding/Offboarding**: Quickly granting a new hire access to their required tools or revoking access instantly when a staff member leaves.
*   **Security Audits**: Reviewing the **Audit Trail** to investigate who authorized a specific system change or permission override.
*   **Module Activation**: Expanding your business capabilities by subscribing to new applets (like Fixed Assets or E-Invoice) in the **Catalogue**.
*   **Role Standardization**: Creating uniform access tiers (e.g., "Branch Manager" vs. "Cashier") to ensure consistent security across different locations.

{{< callout type="info" >}}
**Core Concept**: This applet governs the three-way link between **Users**, **Roles**, and **Applet Instances**. It is the ultimate tool for implementing the principle of **Least Privilege Security**.
{{< /callout >}}

### Why is this Important in Platform Governance?

A disciplined Tenant Admin process is the backbone of organizational security and compliance:

*   **Segregation of Duties (SoD)**: By carefully mapping permissions, you ensure that no single person has enough access to commit and conceal fraud (e.g., the person who *creates* a payment cannot be the same person who *approves* it).
*   **Regulatory Compliance**: Many industries (and tax authorities) require a permanent, unalterable record of who accessed sensitive financial data. This applet provides the **Audit Evidence** required for these certifications.
*   **Cost Management**: By overlooking **Catalogue Subscriptions**, you can identify underutilized modules and optimize your platform investment.
*   **Operational Continuity**: Centralized user management ensures that if an admin is unavailable, the organization can still maintain access control through shared administrative roles.

{{< figure src="/images/tenant-admin-applet/tenant-main-listing.png" alt="Tenant Admin main listing page" caption="Main Listing Page: Central menu for tenant governance modules" >}}

### What is the Tenant Admin Applet? (Explained Simply)

Imagine your company is a building.
1. The **Catalogue** is the store where you decide which "appliances" (applets) to buy and install (e.g., Accounting, HR, CRM).
2. **Tenant Users** is the list of employees who have keys to the building.
3. **Roles & Permissions** are the specific rules for those employees—who has a key to the server room, who can open the front door, and who can only enter the break room.

The **Tenant Admin Applet** is where the landlord (the Admin) manages the keys, the appliances, and the security logs for the entire building.

### Relationship to Other Applets

This applet is the foundation upon which all other applets operate:
- **All Functional Applets (Sales, Purchase, GL, etc.)**: These applets only become available to your users if they are correctly configured and assigned within the Tenant Admin Applet.
- **Audit Traceability**: Actions taken in this applet are recorded to ensure that administrative changes (like giving someone "Admin" rights) are tracked.
- **Permission Wizard**: A specialized tool within the settings that simplifies the complex task of mapping thousands of individual permissions into manageable Roles.

{{< figure src="/images/tenant-admin-applet/tenant-admin-applet-overview-infographic.png" alt="Tenant Admin Applet Overview: Problems, Solution, and Benefits" caption="Tenant Admin Overview: Moving from administrative chaos and security risks (The Problems) to centralized user governance and granular role-based access control (The Solution) for Platform Admins, IT Managers, and HR Leads (Who Benefits)." >}}

## Key Features Overview

### Who Benefits from This Applet?

**Platform Administrators:**
- High-level oversight of all installed applets and subscription statuses.
- Ability to quickly add or remove users from the platform.
- Manage top-level security settings and system webhooks.

**IT & Compliance Managers:**
- Build and maintain complex Role hierarchies (e.g., "Junior Accountant" vs. "CFO").
- Audit every administrative change to ensure compliance with security protocols.
- Use the Permission Wizard to verify exactly which "Actions" a specific user is allowed to perform.

**HR & Operations Leads:**
- Seamless onboarding of new employees into the digital workspace.
- Linking physical employees to their digital Platform Users.
- Managing "Team" groupings for faster permission broadcasting.

### What Problems Does This Solve?

**The "Administrative Chaos" Problem:**
When you have 50 different apps and 200 users, managing access manually is impossible. This applet provides a centralized dashboard to map everyone to everything in one place.

**The "Security Over-Privilege" Risk:**
Without granular control, admins often give users "Master" access just to make things work. The Tenant Admin Applet allows for "Least Privilege" security—giving users only the specific permissions they need for their job.

**Subscription Visibility Gap:**
Organizations often lose track of what applets they are paying for or which ones are underutilized. The Catalogue and Subscription tabs provide clear visibility into your active platform footprint.

**Data Inconsistency Across Environments:**
The Data Sync feature helps manage information flow between different tenants or environments, ensuring that critical metadata stays updated.

## Key Features Overview

{{< cards >}}
  {{< card title="Catalogue & Subscriptions" subtitle="Manage which applets are active in your workflow" link="#catalogue-tab" >}}

  {{< card title="User Management" subtitle="Onboard, link, and manage tenant and platform users" link="#tenant-users-tab" >}}

  {{< card title="Role-Based Access (RBAC)" subtitle="Create hierarchical roles and permission sets" link="#roles--permissions-tab" >}}

  {{< card title="Permission Wizard" subtitle="Interactive tool to map complex behaviors to users" link="#permission-wizard-settings" >}}

  {{< card title="Audit Trail" subtitle="Transparent logging of all administrative actions" link="#audit-trail-tab" >}}

  {{< card title="Data Sync" subtitle="Keep your environments updated with synchronized data" link="#data-sync-tab" >}}
{{< /cards >}}

## Key Concepts

### Roles vs. Permission Sets

- **Permission Set**: A collection of specific technical permissions (e.g., "CAN_CREATE_INVOICE"). Think of this as a **"Bag of Tools."**
- **Role**: A functional identity (e.g., "Accountant") that can contain multiple Permission Sets. Think of this as a **"Job Title."**

By assigning a **Role** to a user, you give them all the **Permission Sets** inside that role. This makes management significantly easier than assigning individual permissions to every person.

{{< figure src="/images/tenant-admin-applet/tenant-role-perm.png" alt="Role permission mapping screen" caption="Role Permissions: Mapping job titles to specific toolsets" >}}

### The Intercompany Link
In many configurations, the Tenant Admin Applet manages how your branch interacts with external entities. It handles the "Platform Identity" of your organization, which is crucial for intercompany document syncing.

## Quick Start Guide

### For Admins: Onboarding a New Employee

**Goal:** Give a new staff member access to the **Sales Applet**.

1.  **Navigate**: Go to **Tenant Users**.
2.  **Add User**: Click **(+) Add**. Enter their email and basic details.
3.  **Link Platform User**: Ensure they are linked to a platform identity (this allows them to log in).
4.  **Assign Role**: Stay in the user's profile and go to the **Roles** or **Permissions** tab.
5.  **Save & Notify**: The system will now grant them access to the appropriate apps on their next login.

---

### For IT Managers: Creating a Custom Role

**Goal:** Create a "ReadOnly Auditor" role who can see everything but change nothing.

1.  **Navigate**: Go to **Role** > **(+) Add**.
2.  **Define Role**: Name it "Auditor_ReadOnly".
3.  **Map Permissions**: Go to the **Permissions** tab within the Role or use the **Permission Wizard** in Settings.
4.  **Select Read-Only Flags**: Filter for "READ" permissions and exclude "CREATE", "UPDATE", or "DELETE".
5.  **Assign to Users**: Go to the users who need this role and add "Auditor_ReadOnly" to their profile.

---

### For System Architects: Managing Subscriptions

**Goal:** Activate a new applet for the organization.

1.  **Navigate**: Go to **Catalogue**.
2.  **Find Applet**: Search for the desired applet (e.g., "Fixed Assets").
3.  **Subscribe**: Check the subscription status and activate it for your tenant.
4.  **Configure Instance**: Once subscribed, go to the **Applet** tab to verify the instance is running and configured correctly.

---

#### Deep Dive: Catalogue Tab

**Concept: The Platform Marketplace.**
This tab is where you manage the "Software Inventory" of your organization. It allows you to browse and subscribe to the entire BigLedger ecosystem.

*   **Catalogue Listing**: Shows every available applet. You use this to scale your business by adding new functional modules as you grow.
*   **Subscription Management**: Displays the status of your active tools. This is critical for **Subscription Lifecycle Management**, allowing you to see which versions of an applet are currently deployed.
*   **Applet Info**: Technical metadata that explains what the applet does and, more importantly, the **Permission Dependencies**—the hidden technical "gates" that must be opened for the applet to function for your users.

#### Deep Dive: Tenant Users Tab

**Concept: Identity Management.**
This tab is the "Digital Directory" of your personnel. It bridges the gap between a physical human being and their digital platform identity.

*   **User Listing**: A searchable grid of all staff. This is where you manage **User Activation/Deactivation**—the most fundamental security action.
*   **User GUID & Email**: The unique digital fingerprint of the user. This ensures that permissions are linked to a specific, unique person across the entire platform.
*   **Installed Applet Sub-tab**: A powerful diagnostic view. If a user says "I can't see the Sales applet," you check here to verify if it is assigned to their profile.
*   **Employee Link**: Connects the software account to the **Physical Employee Record** (from the HR applet), ensuring that payroll, performance, and access data stay synchronized.

#### Deep Dive: Roles & Permissions Tab

**Concept: Role-Based Access Control (RBAC).**
Instead of giving permissions to users one by one, you create "Job Packages" called Roles.

*   **Role Name & Code**: Defines the functional identity (e.g., `ROLE_JUNIOR_ACC`). This makes it easy to broadcast security changes to groups of users simultaneously.
*   **Permission Set Mapping**: A granular matrix where you toggle thousands of specific actions. This is where you enforce **Operational Boundaries** (e.g., allowing a user to see a list of invoices but not click the 'Delete' button).
*   **Inheritance Logic**: Allows you to build "Senior" roles that inherit everything from "Junior" roles, ensuring that hierarchy is maintainable and scalable without manual re-entry.

#### Deep Dive: Audit Trail Tab

**Concept: The "Immutable Ledger" of Actions.**
This tab is for **Forensic Investigation** and **Compliance Reporting**. It records every administrative "Who, What, and When."

*   **Action Tracking**: Logs every `CREATE`, `UPDATE`, and `DELETE` on security tables (e.g., `bl_aas_subject_to_role_link`). It proves who gave a certain user "Admin" rights.
*   **Before/After JSON**: Shows the exact data change. This is critical for **Change Management Audits**, allowing you to see exactly what a configuration looked like before it was modified.
*   **Search & Filter**: Allows auditors to pinpoint specific dates or user IDs, turning millions of rows into a targeted **Compliance Report**.

---

## Configuration & Settings

### Permission Wizard (`Settings > Permission Wizard`)
The most important configuration tool. It provides an interactive interface to:
1.  **Search** for a specific behavior (e.g., "Void Invoice").
2.  **Identify** which technical permission controls that behavior.
3.  **Assign** it directly to a Role or User.

### User & Team Permissions (`Settings > User/Team Permission Listing`)
Manage exceptions. If a specific user needs access *more* than their role allows, or a specialized team needs a temporary permission set, configure those overrides here.

### Webhooks (`Settings > Webhook`)
For advanced integrations. Configure URL endpoints that BigLedger will "ping" when certain administrative events occur (e.g., "New User Added").

---

## Audit Trail

#### Admin Audit Trail (`Audit Trail`)
This is the "Black Box" of your platform. It records modifications to high-level system tables.

**What to Look For:**
- **Table Name**: `bl_aas_subject_to_role_link` (Who was given a role?)
- **Action**: `CREATE` / `DELETE` / `UPDATE`
- **Description**: Displays the "Before" and "After" values for JSON configurations.

---

## FAQ

**Q: What is the difference between a Tenant User and a Platform User?**  
**A:** A **Tenant User** is a person who belongs to your company (your tenant). A **Platform User** is their global identity on the BigLedger infrastructure. One Platform User can belong to multiple tenants (e.g., a Consultant working for three different companies).

**Q: I gave a user a Role, but they still can't see the applet. Why?**  
**A:** Ensure the applet itself is **Subscribed** in the Catalogue and that the user's Role has both the **Backend API permissions** and the **Client-Side UI permissions** enabled.

**Q: Can I restore a Role after I've deleted it?**  
**A:** Deleting a role is a permanent action in the UI. Check the **Audit Trail** to see exactly what permissions that role had so you can manually recreate it if necessary.

**Q: What does "Inheritance" mean in Roles?**  
**A:** If Role B is a "Child" of Role A, it automatically gets every permission Role A has, plus whatever unique permissions you give to Role B. This is great for creating "Junior" and "Senior" variants of the same job.

**Q: How do I hide a specific button in an applet for certain users?**  
**A:** Go to the **Applet** tab, select the applet, and go to **Client-Side Perm Listing**. Find the permission related to the button (e.g., `HIDE_GENDOC_VOID_BUTTON`) and toggle it for their Role.

---

## Related Applets

### External Tenant Admin Applet
**Purpose**: For Platform Providers (Super Admins) to manage *multiple* tenants from a single master dashboard.

### Employee Maintenance Applet
**Purpose**: Manages the HR data of the personnel.  
**Relation**: The **Tenant Users Tab** links these HR records to their platform access permissions.

### Settings Applet
**Purpose**: Regional and global configurations (GST/SST, Currency, Timezones).  
**Relation**: While Tenant Admin manages *Access*, the Settings applet manages how the *Data* behaves.
