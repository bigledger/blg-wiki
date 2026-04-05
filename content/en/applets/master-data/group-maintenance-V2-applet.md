---
title: "Group Maintenance V2 Applet"
description: "Advanced organizational group and team structure management"
tags:
- groups
- team-management
- organizational-hierarchy
- departments
- access-control
weight: 220
---

{{< callout type="warning" >}}
**Group Maintenance V2 Applet user guide still under progress**

**Work in Progress: This documentation is currently under development. Visual assets (screenshots) and further details will be added soon.**
{{< /callout >}}

## Purpose and Overview

The **Group Maintenance V2 Applet** is the central hub for managing the complex social and organizational structures within your company. It provides the foundation for team-based permissions, reporting lines, and collaborative groups.

{{< callout type="info" >}}
**Core Concept**: A **Group** is an abstract collection of users, branches, or other groups, used to simplify management and automation throughout the platform.
{{< /callout >}}

## Key Features Overview

### Who Benefits from This Applet?

**System Administrators:**
- Create and manage complex group hierarchies
- Link groups to roles and permissions
- Bulk update member lists

**HR & Department Managers:**
- Organize staff into functional teams
- Visually map reporting lines
- Manage group-specific metadata and settings

**Project Leads:**
- Form dynamic cross-functional project groups
- Assign resources to specific group tasks
- Track group performance and participation

### What Problems Does This Solve?

**The Management Fragmentation Problem:**
Without a central group engine:
- User permissions must be managed individually (scaling nightmare)
- It's hard to visualize who belongs to which department
- Collaborative tools lack a "team" context

**The Group Maintenance V2 Solution:**
- **Hierarchical Groups** - Nest groups within groups for true organizational mapping
- **Dynamic Membership** - Auto-assign users based on attributes (e.g., all users in "Branch A")
- **Unified Security** - Apply a single permission policy to an entire group in one click

## Key Features Overview

{{< cards >}}
  {{< card title="Group Designer" subtitle="Visual tool for building group structures" link="#group-designer" >}}

  {{< card title="Member Management" subtitle="Add and remove users with ease" link="#member-management" >}}

  {{< card title="Nested Groups" subtitle="Manage complex hierarchies and inheritance" link="#group-hierarchy" >}}

  {{< card title="Audit Logging" subtitle="Track all changes to group membership" link="#audit-trails" >}}
{{< /cards >}}

## Key Concepts

### Group Structure Logic

| Component | Definition | Management Goal |
|-----------|------------|-----------------|
| **Parent Group** | The top-level group in a hierarchy. | Global policy enforcement. |
| **Child Group** | A sub-group that inherits from a parent. | Granular team management. |
| **Membership** | The relationship between a user and a group. | Access control and reporting. |

## Quick Start Guide

### For Admins: Creating Your First Group

**Goal:** Establish a new team or department in 4 steps.

1. **Navigate**: Go to **Group Maintenance V2** from the main menu
2. **Create**: Click **"+" (New Group)** → Enter **Group Name** (e.g., "Sales Dept")
3. **Add Members**: Click **Manage Members** → Search for and select users
4. **Save**: Click **Save** → The group is now ready to be used for permissions or reporting

---

### For Managers: Managing Team Membership

**Goal:** Keep your group list up-to-date.

1. **Find Group**: Search for your group in the list
2. **Edit**: Select the group and click **Edit**
3. **Update**: Toggle members on or off as people join or leave your team
4. **Confirm**: Review the membership list and click **Update**

---

## Configuration & Settings

Fine-tune your group engine in **Settings**:
- **Group Categories**: Tag groups as "Department", "Project", or "Social".
- **Inheritance Rules**: Define how child groups inherit permissions from parents.
- **Custom Metadata**: Add extra fields to groups (e.g., "Cost Center ID").

---

## FAQ

**Q: Can a user belong to more than one group?**
A: Yes, the system supports multi-group membership, allowing a user to be in a "Department" group and multiple "Project" groups simultaneously.

**Q: How do groups interact with permissions?**
A: Most permission settings in the system allow you to "Select Group" instead of "Select User," applying the rule to everyone in that group instantly.

**Q: Can I create a group that contains another group?**
A: Yes, this is called "Nested Groups" and is the recommended way to model a large organization (e.g., a "Marketing" group containing "Digital" and "Offline" sub-groups).

**Q: Is there a limit to how many groups I can create?**
A: No, the system is designed to handle thousands of groups with minimal performance impact.
