---
title: "Employee Applet"
description: "Centralized employee master data management with org chart, access control, payroll and claim configuration"
tags:
- employee-master
- hr-management
- org-chart
- payroll-setup
- access-control
weight: 61
---

{{< callout type="warning" >}}
**Under Review**: This applet is still under review.
{{< /callout >}}

## Purpose and Overview

The **Employee Applet** is the central hub for managing employee master data in the Akaun Platform. It brings together employee profiles, reporting lines, login access, payroll and tax configuration, claims setup, and compliance records in one structured system.

{{< callout type="info" >}}
**Core Concept**: A single employee record should connect **who** the employee is, **where** they sit in the organization, **what** access they have, and **how** they are paid and reimbursed.
{{< /callout >}}

### About the Applet

**Purpose:** Maintain accurate employee master data and operational settings across HR, finance, and access control workflows.

**Target Users:** HR and People Ops, Finance and Payroll, Department Managers, IT and System Admins.

**Key Features:**
- Employee profile creation and maintenance
- Employee category management and labeling
- Org chart and report-to structure
- Login access and permission controls
- Payroll, tax, and payment configuration
- Claims accounts and entitlements visibility
- Bulk file import and audit trails

## Key Features Overview

### Who Benefits from This Applet?

**HR and People Ops:**
- Structured onboarding and profile maintenance
- Central view of employee contact and address data
- Quick updates to branches, departments, and roles

**Finance and Payroll:**
- Consistent payment and tax configuration
- Spending limits and claim entitlement linkage
- Clean data for payroll and reimbursement processing

**Department Managers:**
- Clear report-to structure and team visibility
- Approved leave tracking and updates
- Accurate org chart alignment

**IT and System Admins:**
- Login and permission control
- Feature visibility and access management
- Applet audit trail for compliance

### What Problems Does This Solve?

**The Fragmented Employee Data Problem:**

Traditional employee management is scattered across spreadsheets, email threads, and separate HR or payroll systems. Common issues include:
- Duplicate or inconsistent employee records
- Missing reporting lines and unclear approvals
- Inaccurate payroll and tax configuration
- Delayed onboarding due to manual setup
- Lack of audit traceability

**The Employee Applet Solution:**

- **Single source of truth** for employee data
- **Structured org chart** and report-to relationships
- **Integrated access setup** for logins and permissions
- **Payroll-ready configuration** for tax and payment settings
- **Bulk import tools** for faster onboarding
- **Audit trail** for compliance and accountability

## Key Features Overview

{{< cards >}}
  {{< card title="Employee Master Data" subtitle="Create, edit, and manage employee profiles" link="#employee-master-data" >}}

  {{< card title="Org Chart & Reporting" subtitle="Define report-to relationships and org structure" link="#org-chart-and-reporting" >}}

  {{< card title="Login & Access" subtitle="Control employee login, permissions, and roles" link="#login-and-access" >}}

  {{< card title="Payroll & Tax" subtitle="Configure payment and tax details" link="#payroll-and-tax-configuration" >}}

  {{< card title="Claims & Entitlements" subtitle="Manage claim accounts, limits, and reports" link="#claims-and-entitlements" >}}

  {{< card title="File Import" subtitle="Bulk upload and update employee records" link="#file-import" >}}

  {{< card title="Audit & Compliance" subtitle="Applet logs and traceability" link="#audit-and-compliance" >}}

  {{< card title="Configuration & Settings" subtitle="Defaults, field settings, and visibility" link="#configuration--settings" >}}
{{< /cards >}}

{{< figure src="/images/employee-applet/employee-applet-overview.png" alt="overview of key features" caption="Overview of Key Features of Employee Applet" >}}

## Key Concepts

### The Employee Master Structure

| Aspect | Component | Practical Example |
|--------|-----------|------------------|
| **Who** is the employee? | Profile and identity | Name, ID, designation |
| **Where** do they belong? | Branch, department, report-to | KL Branch, Finance, Manager X |
| **What** access do they need? | Login and permissions | Approver, HR admin, staff |
| **How** are they paid? | Payment and tax config | Bank details, tax profile |
| **What** can they claim? | Claims accounts and entitlements | Medical fund, travel limit |

{{< callout type="tip" >}}
**Real-World Example**: A new finance executive joins the company. HR creates the employee profile, assigns the department and manager, IT sets login permissions, and finance configures tax and payment details. The employee is ready for payroll and claims in one flow.
{{< /callout >}}

---

## Quick Start Guide

{{< figure src="/images/employee-applet/employee-applet-quick-start.png" alt="Quick start for Employee applet" caption="Infographic of quick start on Employee Applet" >}}

Get started quickly based on your role.

### For HR/Admins: Create a New Employee

**Goal:** Add a new employee with complete profile details.

1. **Navigate**: Go to **Employee Listing**
{{< figure src="/images/employee-applet/employee-listing.png" alt="Employee listing" caption="Image of Employee Listing where user can see all the created employee" >}}
2. **Create**: Click **+** and fill in basic details
{{< figure src="/images/employee-applet/employee-create.png" alt="Employee create button" caption="Create button for creating new employee listing." >}}
3. **Add Contacts**: Update Employee Name, Employee Code, Employee Nickname, status, and other fields
{{< figure src="/images/employee-applet/employee-add-details.png" alt="add employee details" caption="Add employee fields in the Create Employee section." >}}
4. **Assign Structure**: Set branch, department, and report-to
{{< figure src="/images/employee-applet/employee-create-branch.png" alt="set employee branch" caption="Set employee branch in the configuration." >}}
5. **Save**: Confirm and save the employee record
{{< figure src="/images/employee-applet/employee-save.png" alt="saved button" caption="Click CREATE to save the employee details." >}}

---

### For Managers: Maintain Reporting Lines and Leave

**Goal:** Keep team structure and approved leave accurate.

1. **Open Employee Profile** from the listing
{{< figure src="/images/employee-applet/employee-view.png" alt="view employee details" caption="Click on the employee listing to view their details." >}}
2. **Update Report-To** to reflect team changes
{{< figure src="/images/employee-applet/employee-report.png" alt="Report To tab in the applet" caption="Report To tab in the applet. User can add and edit the details in the tab." >}}
3. **Review Approved Leave** for visibility
{{< figure src="/images/employee-applet/employee-leave.png" alt="Report To tab in the applet" caption="To create new Approved Leave listing" >}}

{{< figure src="/images/employee-applet/employee-create-leave.png" alt="create leave for employee" caption="Set date for approved leave and click button Add to save" >}}

{{< figure src="/images/employee-applet/employee-success.png" alt="Pop out successful" caption="Approved leave saved successfully" >}}
4. **Check Org Chart** to ensure hierarchy is updated
{{< figure src="/images/employee-applet/employee-org-chart.png" alt="org-chart" caption="Check organization chart and check the structure" >}}

{{< figure src="/images/employee-applet/employee-org-chart-struc.png" alt="org-chart-structure" caption="Structure of the organization" >}}
5. **Save Changes** to update the org chart view

---

### For Finance/Payroll: Configure Payment and Tax

**Goal:** Ensure payroll-ready employee setup.

1. **Open Employee Profile**
2. **Go to Payment Config** and add bank details
{{< figure src="/images/employee-applet/employee-payment.png" alt="Payment Config tab" caption="Configuration for employee payment details" >}}
3. **Set Tax Profile** and statutory fields
{{< figure src="/images/employee-applet/employee-tax.png" alt="Tax tab" caption="Configuration for employee tax details" >}}
4. **Configure Spending Limits** if required
{{< figure src="/images/employee-applet/employee-speending.png" alt="Spending limit tab" caption="Configuration for employee spending limit details" >}}
5. **Review Changes** to confirm payroll fields
6. **Save** to activate payroll data
{{< figure src="/images/employee-applet/employee-saved.png" alt="Saved button" caption="Saved all the edited/added details for the employee" >}}

---

### For IT/Admins: Set Permissions and Visibility

**Goal:** Control user access and feature availability.

1. **Go to Settings**
2. **Configure Permission Sets** for roles and teams
{{< figure src="/images/employee-applet/employee-set-perm.png" alt="setting permission" caption="Set permission and role for each employee" >}}
3. **Adjust Feature Visibility** for menus and tabs
{{< figure src="/images/employee-applet/employee-app-setting.png" alt="Application configuration" caption="Choose either the user want to hide the or show each tab in the applet" >}}

{{< figure src="/images/employee-applet/employee-hide-unhide.png" alt="Application configuration" caption="Disable and enable each tab in the applet" >}}
4. **Assign User Permissions** to the employee login
5. **Save** to apply access changes

---

## Employee Master Data

The employee listing is the main hub for creating and managing employee records. It includes:
- Profile details, category, and employment type
- Contact and address management
- Branch and company assignments
- Engagement company access and e-invoice details
- Peppol ID link setup and notification configuration

{{< figure src="/images/employee-applet/employee-listing.png" alt="Employee Listing page showing employee records and filters" caption="Employee Listing: Manage employee master data with search and filters." >}}

{{< figure src="/images/employee-applet/employee-create.png" alt="Employee Create form with profile details and tabs" caption="Employee Create: Update profile, contact, and employment details in one form." >}}

{{< figure src="/images/employee-applet/employee-edit.png" alt="Employee Edit form with profile details and tabs" caption="Employee Edit: Update profile, contact, and employment details in one form." >}}

### Common Statuses/States

| Status | Meaning | Typical Use |
|--------|---------|-------------|
| **ACTIVE** | Employee is active in the system | Standard employee record |
| **INACTIVE** | Employee is no longer active | Offboarding or long leave |
| **DRAFT** | Profile setup not completed | During onboarding |

## Employee Categories

Use category listing to classify employees for reporting, filtering, and policy control:
- Create, edit, and assign employee categories
- Label-based grouping for HR and finance views
- Treeview selection with localized labels

{{< figure src="/images/employee-applet/employee-categories.png" alt="Employee categories view showing reporting structure" caption="Employee categories: Visualize reporting lines and employee categories." >}}

## Org Chart and Reporting

Use the org chart tools to define and visualize reporting lines:
- Report-to setup per employee
- Org chart listing and hierarchy view
- Approved leave visibility for manager planning

{{< figure src="/images/employee-applet/employee-org-chart.png" alt="Org chart view showing reporting structure" caption="Org Chart: Visualize reporting lines and team structure." >}}

## Login and Access

Control login and access rights directly from employee profiles:
- Create and edit employee login credentials
{{< figure src="/images/employee-applet/employee-login.png" alt="login tab" caption="Login Tab in the Employe details" >}}
- Set rank, status, and applet catalog access
{{< figure src="/images/employee-applet/employee-login-create.png" alt="login tab" caption="Configuration for employee login" >}}


## Payroll and Tax Configuration

Payroll readiness requires consistent financial setup:
- Payment configuration and bank details
- Tax profile and statutory settings
- Employee spending limits for controlled reimbursements

## Claims and Entitlements

The applet ties employee records to claim management:
- Claims accounts and entitlement linkage
- Claims report visibility for HR and finance
- Balance and usage tracking for entitlements

## File Import

Bulk import simplifies onboarding and mass updates:
- Upload employee data files
- Validate and preview before import
- Reduce manual entry for large teams
- Use the template file to avoid validation errors
{{< figure src="/images/employee-applet/employee-file-import.png" alt="File import menu" caption="Allow user to import employee details in CSV file which will saved more time" >}}


### Sample File Import Template

Use CSV or Excel (XLSX) with headers in the first row. Recommended format:

| Column | Required | Example | Notes |
|--------|----------|---------|-------|
| **Employee Code** | Yes | EMP001 | Must be unique |
| **Employee Name** | Yes | Nur Aisyah | Legal name |
| **Employee Type** | Yes | Merchant | Employee type |
| **ID Number** | Yes | EMP1234 | Employee identification |
| **Email** | Yes | nur@example.com | Used for login |
| **Phone** | No | +60 12-345 6789 | Include country code |
| **Branch Code** | Yes | KL01 | Must exist in Branch setup |
| **Department** | No | Finance | Use standard department names |
| **Report To (Employee ID)** | No | EMP0005 | Manager ID |
| **Join Date** | No | 2026-01-15 | YYYY-MM-DD |
| **Status** | No | ACTIVE | ACTIVE/INACTIVE |

---

## Configuration & Settings

Access settings under `Settings` to control behavior across the applet.

**Key configuration areas:**
- **Default Selection**: Branch, department, and common defaults
- **Field Settings**: Enable or hide fields and tabs
- **Webhook**: Integrate employee events with external systems
- **Feature Visibility**: Control access to menus and modules
- **Permission Wizard and Sets**: Role-based access management
- **User, Team, and Role Permissions**: Fine-grained control
- **Personalization**: Default preferences and sidebar layout
- **Applet Log**: Trace actions for compliance audits

{{< figure src="/images/employee-applet/settings.png" alt="Employee Applet settings page with configuration sections" caption="Settings: Configure defaults, field visibility, and permissions." >}}

---

## FAQ

**Q: Why can I not see the Create Employee button?**
A: You may not have the required permission set. Check role or user permissions in Settings.

**Q: How do I bulk upload employees?**
A: Go to **File Import**, upload the template file, validate, and import.

**Q: How do I change an employee's reporting manager?**
A: Open the employee profile and update the **Report-To** section.

**Q: Why are payroll or tax fields hidden?**
A: Field visibility can be controlled in `Settings > Field Settings`.

**Q: How do I link a Peppol ID for e-invoicing?**
A: Use the **Peppol ID Link** section in the employee profile.

**Q: Why can I not see the Org Chart menu?**
A: Feature visibility or role permissions may hide it. Check `Settings > Feature Visibility`.
