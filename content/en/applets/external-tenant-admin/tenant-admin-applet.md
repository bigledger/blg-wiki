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

The **Tenant Admin Applet** serves as the cockpit for your platform's administrative engine. It is designed for organizational administrators to oversee the entire lifecycle of their BigLedger environment—from subscribing to new applets in the Catalogue to managing granular user permissions and auditing critical system changes.

{{< callout type="info" >}}
**Core Concept**: This is the "Applet of Applets." It manages the relationships between **Users**, **Roles**, and **Applet Instances** within your specific tenant environment.
{{< /callout >}}

{{< figure src="/images/tenant-admin-applet/tenant-main-listing.png" alt="Tenant Admin main listing page" caption="Main Listing Page: Central menu for tenant governance modules" >}}

### What is the Tenant Admin Applet? (Explained Simply)

Imagine your company is a building.
1. The **Catalogue** is the store where you buy "appliances" (applets) (e.g., Accounting, HR, CRM).
2. **Tenant Users** is the list of employees who have keys to the building.
3. **Roles & Permissions** are the specific rules—who can enter the server room, who can only enter the break room.

The **Tenant Admin Applet** is where the landlord (the Admin) manages the keys, the appliances, and the security logs for the entire building.

{{< figure src="/images/tenant-admin-applet/tenant-admin-overview-infographic.png" alt="Tenant Admin infographic" caption="Tenant Admin Overview: Challenges, solutions, and user roles" >}}

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

## Key Features Overview

{{< cards >}}
  {{< card title="Catalogue Governance" subtitle="Manage which applets are active in your workflow" link="#catalogue-tab" >}}

  {{< card title="User Access Control" subtitle="Onboard, link, and manage tenant and platform users" link="#tenant-users-tab" >}}

  {{< card title="Roles & Permissions" subtitle="Create hierarchical roles and permission sets" link="#roles--permissions-tab" >}}

  {{< card title="Permission Wizard" subtitle="Interactive tool to map complex behaviors to users" link="#permission-wizard-settings" >}}

  {{< card title="Audit Trail" subtitle="Transparent logging of all administrative actions" link="#audit-trail-tab" >}}

  {{< card title="Data Sync" subtitle="Keep your environments updated with synchronized data" link="#data-sync-tab" >}}
{{< /cards >}}

## Key Concepts

### Roles vs. Permission Sets

- **Permission Set**: A collection of specific technical permissions (e.g., "CAN_CREATE_INVOICE"). Think of this as a **"Bag of Tools."**
- **Role**: A functional identity (e.g., "Accountant") that can contain multiple Permission Sets. Think of this as a **"Job Title."**

{{< figure src="/images/tenant-admin-applet/tenant-role-perm.png" alt="Role permission mapping screen" caption="Role Permissions: Mapping job titles to specific toolsets" >}}

## Quick Start Guide

### For Admins: Onboarding a New Employee

1.  **Navigate**: Go to **Tenant Users**.
2.  **Add User**: Click **(+) Add**. Enter their email and basic details.
3.  **Link Platform User**: Ensure they are linked to a platform identity.
4.  **Assign Role**: Assign the appropriate Role from the directory.

{{< figure src="/images/tenant-admin-applet/tenant-user.png" alt="Tenant users listing" caption="Tenant Users Listing: Managing the organizational directory" >}}

### Real-World Walkthrough: New Team Rollout

**Scenario:** Onboarding a new Finance team by end of day.

1. **Enable Modules**: Verify `Catalogue`, `Applets`, and `Roles` are visible in **Settings**.
2. **Verify Catalogue**: Confirm required applets are subscribed in the **Catalogue**.
3. **Create Roles**: Setup "Finance Clerk" and "Finance Supervisor" in **Tenant Roles**.
4. **Map Permissions**: Use the **Permission Wizard** to assign scoped access.
5. **Assign Users**: Assign the new roles to the staff in **Tenant Users**.
6. **Audit**: Review the **Audit Trail** to confirm all setup actions were recorded.

## Document Tabs Overview

### Catalogue Tab
- **Catalogue Listing**: Shows every available applet and service.
- **Subscription Status**: Color-coded indicators for active items.

{{< figure src="/images/tenant-admin-applet/tenant-catalogue-edit.png" alt="Catalogue edit form" caption="Catalogue Management: Maintain applet-to-catalogue linkage" >}}

### Tenant Users Tab
- **User Listing**: Searchable grid of everyone in your tenant.
- **Main Details**: Name, email, and platform links.
- **Employee Link**: Connects "Software User" to the physical HR record.

### Roles & Permissions Tab
- **Role Listing**: Manage functional titles like Admin or Storekeeper.
- **Permission Sets**: reusable permission packages for applets.
- **Role File Import**: Bulk upload role definitions via CSV template.

{{< figure src="/images/tenant-admin-applet/role-file-import-page.png" alt="Role file import page" caption="Role File Import: Bulk setup for complex role structures" >}}

### Applet Tab
- **Applet Listing**: View every applet currently running on your tenant.
- **Applet View**: Includes technical metadata and specific **Permission Sets**.

### Audit Trail Tab
- **Action Tracking**: Records every permission change or user update.
- **Filtering**: Search by actor, action type, or date.

{{< figure src="/images/tenant-admin-applet/tenant-audit-trail-2.png" alt="Audit trail listing" caption="Audit Trail: Permanent record of all administrative actions" >}}

## Configuration & Settings

### Permission Wizard (`Settings > Permission Wizard`)
The "Power Tool" for mapping complex behaviors. It allows you to search for a behavior and immediately assign it to the relevant Role.

{{< figure src="/images/tenant-admin-applet/tenant-perm-wizard.png" alt="Permission wizard" caption="Permission Wizard: Defining scoped permissions by branch and location" >}}

### Default Settings (`Settings > Default Selection`)
Configure system-wide defaults for Company, Branch, and Location to speed up data entry across all applets.

{{< figure src="/images/tenant-admin-applet/tenant-default.png" alt="Tenant defaults" caption="Default Settings: Ensuring consistency across the platform" >}}


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
