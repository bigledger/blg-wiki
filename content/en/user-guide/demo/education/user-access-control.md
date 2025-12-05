---
title: "Security & Access Control"
description: "Evaluate user permissions, audit trails, and security features"
weight: 9
---

## What You'll Learn

In this module, you'll explore how BigLedger keeps your data secure. You'll see user management, role-based permissions, session controls, and complete audit trails of all activities.

{{< callout type="info" >}}
**Time Required:** 15 minutes | **Skill Level:** Beginner-friendly | **UTM Requirements:** 9.15
{{< /callout >}}

---

## Before You Begin: Key Terms Explained

| Term | What It Means |
|------|---------------|
| **User** | Someone who logs into the system |
| **Role** | A set of permissions (e.g., "Finance Officer" can do X, Y, Z) |
| **Permission** | The ability to do something (view, create, edit, delete, approve) |
| **Session Timeout** | Automatic logout after a period of inactivity |
| **Audit Trail** | A log of who did what and when |
| **Maker-Checker** | One person creates, another approves |

---

## Why This Module Matters

Security is critical because:

- **Data protection** - Only authorized people access sensitive information
- **Accountability** - Know who did what and when
- **Compliance** - Meet government security requirements
- **Fraud prevention** - Separation of duties and approvals

{{< callout type="info" >}}
**For UTM:** This addresses requirement 9.15 covering user ID expiry, automatic logout, last access display, and role-based access control.
{{< /callout >}}

---

## Test Scenario 1: User Management

**Objective:** See how users are managed

**Time:** 3 minutes

### Step-by-Step Instructions

1. **Navigate to:** Admin → User Management → Users

2. **View** the list of users

3. **Click** on any user to see their profile

### What You'll See

| Tab | Information |
|-----|-------------|
| **Profile** | Name, email, department, status |
| **Roles** | Assigned roles and permissions |
| **Security** | Password policy, expiry date |
| **History** | Login history, last access |

### Try This

- Look at the different roles assigned
- See when the user last logged in
- Check if there's an expiry date set

{{< callout type="info" >}}
**UTM Requirement (9.15a):** The system must allow setting expiry dates for user IDs.
{{< /callout >}}

---

## Test Scenario 2: Role-Based Permissions

**Objective:** Understand how permissions work

**Time:** 3 minutes

### Step-by-Step Instructions

1. **Navigate to:** Admin → User Management → Roles

2. **View** the list of roles (e.g., Finance Officer, Finance Manager)

3. **Click** on any role to see its permissions

### What You'll See

| Permission Area | Available Actions |
|-----------------|-------------------|
| **Menu Access** | Which modules the role can see |
| **Data Access** | Which departments/PTJs visible |
| **Function Access** | View, Create, Edit, Delete, Approve |
| **Amount Limits** | Approval thresholds |

### Example: Finance Officer vs Finance Manager

| Action | Finance Officer | Finance Manager |
|--------|-----------------|-----------------|
| Create Invoice | Yes | Yes |
| Approve Invoice | No | Yes |
| View Reports | Limited | Full |
| Manage Users | No | No |

{{< callout type="info" >}}
**BigLedger Advantage:** Permissions are granular - you can control access at the menu, function, and data level.
{{< /callout >}}

---

## Test Scenario 3: Session Timeout (Auto-Logout)

**Objective:** Verify automatic logout for inactive users

**Time:** 3 minutes

### Step-by-Step Instructions

1. **Navigate to:** Admin → System Settings → Security

2. **View** the session timeout settings

3. **Observe:**
   | Setting | Purpose |
   |---------|---------|
   | Timeout Period | How long before logout (e.g., 30 minutes) |
   | Warning Time | When to show warning (e.g., 5 minutes before) |
   | Action | What happens (logout, save draft) |

### What Happens When You're Inactive

1. Warning message appears 5 minutes before timeout
2. Option to extend session
3. If no response, automatic logout
4. Redirected to login page
5. Event logged in audit trail

{{< callout type="info" >}}
**UTM Requirement (9.15b):** The system must automatically log out inactive users.
{{< /callout >}}

---

## Test Scenario 4: Last Access Information

**Objective:** See when and where a user last logged in

**Time:** 2 minutes

### Step-by-Step Instructions

1. **Login** to the system

2. **Look at the dashboard** or user profile

3. **Find** the last access information

### What You'll See

| Information | Purpose |
|-------------|---------|
| Last Login Date | When you previously logged in |
| Last Login Time | What time |
| IP Address | Where from (for suspicious activity) |
| Failed Attempts | Any recent failed logins |

{{< callout type="info" >}}
**UTM Requirement (9.15c):** The system must display last access information during login.
{{< /callout >}}

---

## Test Scenario 5: Audit Trail

**Objective:** See the complete activity log

**Time:** 5 minutes

### Step-by-Step Instructions

1. **Navigate to:** Admin → Audit Trail

2. **Search** for activities:
   | Filter | Example |
   |--------|---------|
   | Date Range | Last 7 days |
   | User | Specific user or all |
   | Module | Finance, Sales, etc. |
   | Action | Create, Edit, Delete, Approve |

3. **View** the results

### What You'll See

| Column | Information |
|--------|-------------|
| Timestamp | Exact date and time |
| User | Who performed the action |
| Action | What they did |
| Module | Where they did it |
| Details | Before/after values, document reference |
| IP Address | Where they were |

### Try This

- Search for all "Delete" actions
- Filter by a specific user
- Look at "before and after" values for edits
- Export the audit trail

{{< callout type="info" >}}
**BigLedger Advantage:** Every action is logged - there's no way to hide what happened. Perfect for auditors.
{{< /callout >}}

---

## Test Scenario 6: Password Policy

**Objective:** See password security settings

**Time:** 2 minutes

### Step-by-Step Instructions

1. **Navigate to:** Admin → System Settings → Password Policy

2. **View** the settings

### What You'll See

| Policy | Setting |
|--------|---------|
| Minimum Length | 8+ characters |
| Complexity | Requires uppercase, lowercase, number, special |
| Expiry | Password must change every X days |
| History | Can't reuse last X passwords |
| Lockout | Account locks after X failed attempts |

### Why This Matters

Strong password policies prevent unauthorized access and meet security compliance requirements.

---

## Your Progress Checklist

Mark off what you've completed:

| Scenario | Status |
|----------|--------|
| 1. Explored user management | ⬜ |
| 2. Reviewed role-based permissions | ⬜ |
| 3. Checked session timeout settings | ⬜ |
| 4. Viewed last access information | ⬜ |
| 5. Searched audit trail | ⬜ |
| 6. Reviewed password policy | ⬜ |

---

## Key Takeaways

After completing this module, you've seen that BigLedger:

| UTM Requirement | How BigLedger Meets It |
|-----------------|----------------------|
| **9.15a** User ID Expiry | Set expiration dates for user accounts |
| **9.15b** Auto Logout | Configurable session timeout |
| **9.15c** Last Access | Display login history |
| **RBAC** | Granular role-based access control |
| **Audit Trail** | Complete activity logging |
| **Password Policy** | Strong password enforcement |

---

## Additional Security Features

BigLedger also provides:

| Feature | Description |
|---------|-------------|
| **Encryption** | AES-256 for data at rest, TLS 1.3 in transit |
| **Two-Factor Auth** | Optional 2FA for sensitive operations |
| **IP Restrictions** | Limit access by IP address |
| **SSO Integration** | Connect to MyUTM portal |
| **Security Reports** | Login activity, failed attempts, etc. |

---

## Quick Reference: Navigation

| What You Want to Do | Where to Find It |
|---------------------|------------------|
| Manage users | Admin → User Management → Users |
| Manage roles | Admin → User Management → Roles |
| View audit trail | Admin → Audit Trail |
| Security settings | Admin → System Settings → Security |
| Password policy | Admin → System Settings → Password Policy |

---

## What's Next?

You've completed the Security & Access Control evaluation. Choose your next module:

{{< cards >}}
  {{< card link="../tax-management" title="Tax Management" subtitle="Configure tax rates and compliance" >}}
  {{< card link="../" title="Back to Overview" subtitle="Choose a different module or finish" >}}
{{< /cards >}}

---

## Questions?

If anything wasn't clear or you'd like a live demonstration:

- **Demo Coordinator:** fatimah@bigledger.com
- **Technical Support:** support@bigledger.com

