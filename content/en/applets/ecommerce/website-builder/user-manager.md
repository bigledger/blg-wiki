---
title: User Manager
description: Complete guide to managing admin users and permissions for your webstore
weight: 10
tags: ["website-builder", "user-management", "permissions", "admin", "e-commerce"]
---

The User Permission Manager is a comprehensive tool that allows you to manage admin access for your webstore. This guide covers the complete workflow from inviting users to granting admin privileges.

---

## Table of Contents
1. [Accessing the User Permission Manager](#accessing-the-user-permission-manager)
2. [Adding a New Admin User](#adding-a-new-admin-user)
3. [User Invitation Process](#user-invitation-process)
4. [User Registration via Akaun.com](#user-registration-via-akauncom)
5. [Verifying and Granting Admin Access](#verifying-and-granting-admin-access)
6. [Managing Existing Admin Users](#managing-existing-admin-users)
7. [Removing Admin Access](#removing-admin-access)

---

## Accessing the User Permission Manager

**Location:** `/page/website-builder/layout-menu/user-permission-manager`

Navigate to your website builder dashboard and access the User Permission Manager from the layout menu under the Webstore section.

---

## Adding a New Admin User

### Step 1: Enter Email Address

1. In the **"Add New Admin User"** section, locate the email input field
2. Enter the email address of the user you want to add as an admin
3. The email must be valid (e.g., `user@example.com`)

{{< figure src="/images/website-builder/user-permission-manager/send-invitee.png" alt="User Permission Manager Interface - Add New Admin User" caption="The Add New Admin User section where administrators can enter an email address and verify if the user exists in the system." >}}

### Step 2: Verify User

Click the **"Verify User"** button to check if the user exists in the system.

**Two possible outcomes:**

#### Scenario A: User Exists in the System
- ✅ A green success message appears: **"User Verified Successfully!"**
- The system confirms the user has completed registration
- Proceed to [Step 3: Grant Admin Access](#step-3-grant-admin-access)

#### Scenario B: User Does Not Exist
- ⚠️ A warning message appears: **"User Not Found"**
- The system indicates the user needs to be invited
- Proceed to [User Invitation Process](#user-invitation-process)

---

## User Invitation Process

### When to Send an Invitation
If the user verification returns a "User Not Found" warning, you need to send them an invitation to join the system.

### Step 1: Send Invitation

1. After seeing the "User Not Found" warning, click the **"Send Invitation"** button
2. The system will send an email invitation to the specified address
3. A confirmation message will appear indicating the invitation was sent successfully

### Step 2: Invitation Email

The invited user will receive an email containing:
- A welcome message
- An invitation link to join the system
- Instructions for completing registration

{{< figure src="/images/website-builder/user-permission-manager/invitation_email.png" alt="Invitation Email Example" caption="The invitation email that users receive with a link to complete their registration on akaun.com." >}}

**Important:** The invitation link expires after a certain period. Users should complete registration promptly.

---

## User Registration via Akaun.com

### Complete User Registration Flow

1. **User receives the invitation email**
   - Email contains a unique invitation link
   - Link is personalized and time-sensitive

2. **User clicks the invitation link**
   - Link redirects to `akaun.com` (the authentication system)
   - User is presented with a registration page

3. **Set Password**
   - User must create a secure password
   - Password requirements:
     - Minimum length
     - Complexity requirements (if applicable)
   - User must confirm the password by entering it twice

4. **Ready for Verification**
   - Once registration is complete, the user is ready to be verified by the admin
   - Admin can now proceed to grant admin access

---

## Verifying and Granting Admin Access

### After User Completes Registration

Once the invited user has completed their registration on akaun.com, you can verify and grant them admin access.

### Step 3: Re-verify the User

1. Return to the User Permission Manager
2. Enter the user's email address again
3. Click the **"Verify User"** button
4. This time, the system should confirm the user exists

### Step 4: Grant Admin Access

{{< figure src="/images/website-builder/user-permission-manager/make-admin.png" alt="User Verified Successfully - Make Admin" caption="After successful user verification, click the 'Make Admin' button to grant admin privileges to the user." >}}

1. After successful verification, you'll see:
   - ✅ Green success alert: **"User Verified Successfully!"**
   - Message: "Click the button below to grant admin privileges."

2. Click the **"Make Admin"** button (green button with shield icon)

3. The system will:
   - Install the cp commerce admin applet for the user
   - Add the user to the admin role

4. **Success Confirmation**
   - The user will appear in the **Admin Users** list below
   - You'll see a confirmation message indicating admin access was granted

---

## Managing Existing Admin Users

### Admin Users List

The **"Admin Users"** section displays all users with admin privileges.

{{< figure src="/images/website-builder/user-permission-manager/listing.png" alt="Admin Users List" caption="The Admin Users listing table showing all users with admin privileges, their status, and available actions." >}}

#### Table Columns:

| Column | Description |
|--------|-------------|
| **#** | Sequential number of the user in the list |
| **User** | User's display name (or email prefix if name not available) |
| **Email** | User's registered email address |
| **Status** | Current status (ACTIVE, INACTIVE, etc.) |
| **Added On** | Date when admin access was granted |
| **Actions** | Available actions (Remove access) |

#### Status Indicators:

- 🟢 **ACTIVE** - User has active admin access
- 🟠 **INACTIVE** - User account is inactive
- 🔴 **Other statuses** - Various account states

### Refreshing the List

Click the **refresh button** (↻) in the card header to reload the admin users list.

### Pagination

If there are multiple admin users:
- Use **Previous** and **Next** buttons to navigate pages
- View current page number and total pages
- See record count: "Showing X to Y of Z"

---

## Removing Admin Access

### Step 1: Initiate Removal

1. Locate the user in the **Admin Users** list
2. Click the **trash icon** (🗑️) in the Actions column
3. A confirmation dialog will appear

### Step 2: Confirm Removal

The confirmation dialog displays:
- ⚠️ Warning icon
- **Title:** "Remove Admin Access"
- **Message:** Shows the user's name and email
- **Warning:** "This action cannot be undone"

{{< figure src="/images/website-builder/user-permission-manager/remove-perm.png" alt="Remove Admin Access Confirmation" caption="The confirmation dialog that appears before removing admin access from a user." >}}

### Step 3: Complete Removal

Two options:
- **Cancel** - Closes the dialog without making changes
- **Remove Access** (red button) - Confirms the removal

After clicking **"Remove Access"**:
- The system revokes the user's admin role
- The user is removed from the admin users list
- A success message confirms the removal
- The user can no longer access admin features

**Note:** This action only removes admin privileges. It does not delete the user's account from the system.

---

## Best Practices

### Security Recommendations

1. **Verify Email Addresses**
   - Always double-check email addresses before sending invitations
   - Typos can result in invitations being sent to wrong recipients

2. **Regular Audits**
   - Periodically review the admin users list
   - Remove access for users who no longer require admin privileges

### User Management Tips

1. **New User Onboarding**
   - Provide clear instructions to invited users
   - Ensure they understand the registration process
   - Guide them through akaun.com registration if needed

2. **Access Control**
   - Only grant admin access to trusted users
   - Review and update admin permissions regularly
   - Document reasons for granting admin access

3. **Communication**
   - Notify users when their admin access is granted
   - Inform users before removing their admin access
   - Maintain clear communication about role changes

---

## Troubleshooting

### Common Issues and Solutions

#### Issue: User doesn't receive invitation email
**Solutions:**
- Check if email address is correct
- Ask user to check spam/junk folder
- Verify email service is working
- Resend the invitation

#### Issue: Verification fails after user registers
**Solutions:**
- Wait a few minutes and try again (synchronization delay)
- Confirm user completed registration on akaun.com
- Check if user set their password correctly
- Refresh the page and re-verify

---

## Workflow Summary

```
┌─────────────────────────────────────────────────────┐
│ ADMIN: Enter user email and click "Verify User"    │
└─────────────────┬───────────────────────────────────┘
                  │
                  ▼
        ┌─────────────────────┐
        │ User exists?        │
        └──────┬──────────┬───┘
               │          │
        Yes ───┘          └─── No
         │                     │
         ▼                     ▼
┌─────────────────┐   ┌────────────────────────┐
│ Show "Verified" │   │ Show "User Not Found"  │
│ Click "Make     │   │ Click "Send Invitation"│
│ Admin"          │   └───────────┬────────────┘
└────────┬────────┘               │
         │                        ▼
         │               ┌─────────────────────────┐
         │               │ USER: Receives email    │
         │               │ Clicks invitation link  │
         │               │ Redirects to akaun.com  │
         │               └───────────┬─────────────┘
         │                           │
         │                           ▼
         │               ┌─────────────────────────┐
         │               │ USER: Sets password     │
         │               │ Completes registration  │
         │               └───────────┬─────────────┘
         │                           │
         │                           ▼
         │               ┌─────────────────────────┐
         │               │ ADMIN: Re-verify user   │
         │               │ Click "Make Admin"      │
         │               └───────────┬─────────────┘
         │                           │
         └───────────┬───────────────┘
                     │
                     ▼
         ┌───────────────────────┐
         │ Admin access granted  │
         │ User appears in list  │
         └───────────────────────┘
```

---

## Additional Notes

### System Integration
- The User Permission Manager integrates with the Akaun.com authentication system
- All user registrations are centralized through akaun.com
- Admin privileges are specific to the webstore instance

---

## Support

If you encounter issues not covered in this guide:
1. Check system logs for error messages
2. Review browser console for technical errors
3. Contact your system administrator
4. Reach out to technical support with specific error details

---

**Document Version:** 1.0  
**Document Prepared By:** Md Kawsarul Islam 
**Last Updated:** Based on current implementation  
**Component Location:** `src/app/pages/website-builder/webstore/user-permission-manager`
