---
title: "User Access Control"
description: "Evaluate security profiles, audit trails, and role-based permissions (Requirement 9.15)"
weight: 9
---

This section covers the User Access Control (ACL) functionality as specified in UTM Tender Requirement 9.15. Our system provides enterprise-grade security with comprehensive user management, role-based access, and complete audit trail capabilities.

## Overview

The User Access Control module provides:
- **User ID Expiry Management** - Set expiration dates for user accounts
- **Automatic Session Timeout** - Log out inactive users automatically
- **Last Access Display** - Show login history information
- **Role-Based Access Control** - Define permissions by role
- **Audit Trail** - Complete activity logging
- **Security Administration** - Centralized user management

## Test Scenario 1: User ID Expiry Configuration

### Objective
Verify the system can set expiration dates for user IDs (Requirement 9.15a).

### Steps to Follow

1. **Login** as administrator
2. **Navigate** to: `Admin` → `User Management` → `Users`
3. **Select** a user account
4. **Configure** expiry settings:
   - **Expiry Date:** Set specific date
   - **Expiry Action:** Lock/Disable on expiry
5. **Save** settings

### What to Verify

**User Expiry Features:**
| Feature | Capability |
|---------|------------|
| Expiry Date | Calendar date selection |
| Auto-Lock | Account locked on expiry |
| Notification | Alert before expiry |
| Extension | Renewal process available |

### Expected Results
- Expiry date saved successfully
- Warning notifications configured
- Account auto-locks on expiry
- Audit log records change

---

## Test Scenario 2: Automatic Logout for Inactive Users

### Objective
Test automatic session termination for inactive users (Requirement 9.15b).

### Steps to Follow

1. **Navigate** to: `Admin` → `System Settings` → `Security`
2. **View** session timeout configuration
3. **Verify** the settings:
   - **Timeout Period:** Minutes of inactivity
   - **Warning:** Alert before logout
4. **Test** by remaining inactive

### What to Verify

**Session Management:**
| Setting | Default |
|---------|---------|
| Timeout Period | Configurable (e.g., 30 minutes) |
| Warning Message | 5 minutes before timeout |
| Session Extension | One-click renewal |
| Multiple Sessions | Prevent or allow |

### Expected Results
- Warning message appears before logout
- Session terminates after configured period
- User redirected to login page
- Activity logged

---

## Test Scenario 3: Last Access Information Display

### Objective
Verify display of last access information during login (Requirement 9.15c).

### Steps to Follow

1. **Logout** from current session
2. **Login** again with credentials
3. **Observe** the welcome/dashboard screen
4. **View** last access information

### What to Verify

**Access Information Displayed:**
| Information | Description |
|-------------|-------------|
| Last Login Date | Previous login timestamp |
| Last Login Time | Time of last access |
| Login Location | IP address or location |
| Failed Attempts | Recent failed logins |

### Expected Results
- Last login details visible
- Failed login attempts shown
- Security alert if suspicious activity
- Option to report unauthorized access

---

## Test Scenario 4: Role-Based Access Control

### Objective
Test the role-based permission system.

### Steps to Follow

1. **Navigate** to: `Admin` → `User Management` → `Roles`
2. **View** existing roles
3. **Select** a role to view permissions
4. **Observe** the permission matrix

### What to Verify

**Role Configuration:**
| Element | Description |
|---------|-------------|
| Role Name | Finance Officer, Approver, etc. |
| Menu Access | Which modules visible |
| Function Access | View, Create, Edit, Delete, Approve |
| Data Access | Which data visible (PTJ, Campus) |

### Expected Results
- Clear role definitions
- Granular permission settings
- Inheritance support
- Easy assignment to users

---

## Test Scenario 5: User Profile Management

### Objective
Test user administration capabilities.

### Steps to Follow

1. **Navigate** to: `Admin` → `User Management` → `Users`
2. **Create** a new user:
   - **Username:** test.user@utm.my
   - **Full Name:** Test User
   - **Department:** Finance
   - **Role:** Finance Officer
   - **Status:** Active
3. **Configure** security settings
4. **Save** user

### What to Verify

**User Profile Elements:**
| Field | Purpose |
|-------|---------|
| Username | Login identifier |
| Email | Contact and notifications |
| Department | Organizational unit |
| Roles | Assigned role(s) |
| Status | Active/Inactive/Locked |
| Password Policy | Complexity requirements |

### Expected Results
- User created successfully
- Role permissions applied
- Welcome email sent (if configured)
- Audit log updated

---

## Test Scenario 6: Audit Trail Review

### Objective
Test the audit trail and activity logging.

### Steps to Follow

1. **Navigate** to: `Admin` → `Audit Trail`
2. **Search** audit logs:
   - **Date Range:** Select period
   - **User:** Specific user or all
   - **Module:** Specific module or all
   - **Action:** Login, Create, Edit, Delete, Approve
3. **View** detailed log entries

### What to Verify

**Audit Log Details:**
| Field | Information |
|-------|-------------|
| Timestamp | Date and time of action |
| User ID | Who performed action |
| Action | What was done |
| Module | Where action occurred |
| Details | Before/After values |
| IP Address | Source of action |

### Expected Results
- Complete activity history
- Detailed change tracking
- Searchable and filterable
- Export capability

---

## Test Scenario 7: Password Policy Configuration

### Objective
Test password security policy settings.

### Steps to Follow

1. **Navigate** to: `Admin` → `System Settings` → `Password Policy`
2. **View** current policy settings
3. **Verify** security requirements

### What to Verify

**Password Policy Elements:**
| Policy | Setting |
|--------|---------|
| Minimum Length | 8+ characters |
| Complexity | Upper, lower, number, special |
| Expiry | Password change frequency |
| History | Prevent reuse of recent passwords |
| Lockout | Failed attempt threshold |

### Expected Results
- Strong password requirements
- Forced password change on expiry
- Account lockout after failures
- Self-service password reset

---

## Test Scenario 8: Access Request Workflow

### Objective
Test the access request and approval process.

### Steps to Follow

1. **Navigate** to: `Admin` → `Access Requests` → `New Request`
2. **Submit** access request:
   - **Module:** Requested module access
   - **Function:** Specific permissions
   - **Justification:** Business need
3. **Track** approval status

### What to Verify

**Workflow Features:**
| Stage | Action |
|-------|--------|
| Request | User submits request |
| Review | Manager reviews |
| Approve | Authorization granted |
| Implement | IT applies access |
| Notify | User notified |

### Expected Results
- Request recorded with details
- Routing to appropriate approver
- Email notifications
- Audit trail of approval

---

## Test Scenario 9: Security Reports

### Objective
Test security-related reporting capabilities.

### Steps to Follow

1. **Navigate** to: `Admin` → `Reports` → `Security Reports`
2. **Generate** various reports:
   - User Access Report
   - Login Activity Report
   - Failed Login Report
   - Permission Matrix Report

### What to Verify

**Available Reports:**
| Report | Content |
|--------|---------|
| User List | All users with roles |
| Access Matrix | Permission by role |
| Login History | Login/logout activity |
| Security Events | Unauthorized attempts |

### Expected Results
- Comprehensive security visibility
- Export to Excel/PDF
- Scheduled generation option
- Compliance audit support

---

## Test Scenario 10: System Log Monitoring

### Objective
Test server and application logging capabilities (Requirement 3.31).

### Steps to Follow

1. **Navigate** to: `Admin` → `System Logs`
2. **View** log categories:
   - Application logs
   - Database logs
   - Security logs
   - Error logs
3. **Search** and filter logs

### What to Verify

**Log Information:**
| Log Type | Content |
|----------|---------|
| Application | System events, transactions |
| Security | Login attempts, access violations |
| Error | Exceptions, failures |
| Audit | Business transactions |

### Expected Results
- Real-time log viewing
- Search and filter capability
- Log retention policy
- Alert configuration

---

## Key Features Demonstrated

### User Management
- Centralized user administration
- Self-service capabilities
- Lifecycle management
- Bulk operations

### Access Control
- Role-based permissions
- Menu-level access
- Function-level control
- Data-level restrictions

### Security Features
- Session management
- Password policies
- Account lockout
- Multi-factor authentication (optional)

### Audit & Compliance
- Complete audit trail
- Activity monitoring
- Security reporting
- Compliance support

---

## Advanced Features

### Single Sign-On (SSO)
- Integration with MyUTM portal
- SAML/OAuth support
- Centralized authentication
- Seamless user experience

### Data Encryption
- AES-256 encryption at rest
- TLS 1.3 in transit
- Encrypted backups
- Key management

### Security Monitoring
- Real-time alerts
- Anomaly detection
- Failed login monitoring
- Session tracking

---

## Navigation Tips

| Task | Menu Path |
|------|-----------|
| User List | Admin → User Management → Users |
| Role Management | Admin → User Management → Roles |
| Audit Trail | Admin → Audit Trail |
| Security Settings | Admin → System Settings → Security |
| System Logs | Admin → System Logs |
| Security Reports | Admin → Reports → Security Reports |

---

## Related Documentation

For detailed technical documentation on security features, please contact your BigLedger implementation team.

---

## Next Steps

After evaluating User Access Control, proceed to:

{{< cards >}}
  {{< card link="../tax-management" title="Tax Management" subtitle="Test tax configuration" >}}
  {{< card link="../" title="Back to Overview" subtitle="Return to main evaluation guide" >}}
{{< /cards >}}
