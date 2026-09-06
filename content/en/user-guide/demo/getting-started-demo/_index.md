---
title: "Getting Started with Demo"
description: "Your first steps with BigLedger's demo environment - orientation, navigation, and basic setup"
weight: 10
draft: true  # unpublished 2026-09-06 (Vincent): see planning/reviews/ guides audit — substantially invented, or unreachable from navigation
---

Welcome to your BigLedger demo journey! This guide will help you get comfortable with the platform before exploring industry-specific workflows.

{{< hextra/hero-badge >}}
  🚀 15-Minute Quick Start
{{< /hextra/hero-badge >}}

{{< hextra/hero-headline >}}
  Master BigLedger Basics
{{< /hextra/hero-headline >}}

{{< hextra/hero-subtitle >}}
  Essential orientation for first-time users
{{< /hextra/hero-subtitle >}}

## 🎯 Before You Begin

### Setting Up Your Demo Session

{{< callout type="tip" >}}
**Pro Tip**: Open two browser tabs side-by-side:
- **Tab 1**: This guide (keep it open for reference)
- **Tab 2**: [Demo Environment](https://demo-v1.bigledger.com) (for hands-on practice)
{{< /callout >}}

### Your Demo Credentials

| Role | Username | Password | Best For |
|------|----------|----------|----------|
| Admin | demo-admin | Demo2025! | Full exploration |
| Accountant | demo-acc | Demo2025! | Financial workflows |
| Sales | demo-sales | Demo2025! | Sales processes |

---

## 📚 Part 1: First Login & Navigation

### Step 1: Access the Demo Environment

{{< tabs items="Login Process,Navigation Basics,Interface Tour" >}}
  {{< tab >}}
  **1. Open Demo Site**
  - Navigate to: https://demo-v1.bigledger.com
  - You'll see the BigLedger login screen

  **2. Enter Credentials**
  - Username: `demo-admin`
  - Password: `Demo2025!`
  - Click "Sign In"

  **3. First Login Success**
  - Dashboard loads with sample data
  - Notice the main menu on the left
  - Top bar shows notifications and user profile
  {{< /tab >}}

  {{< tab >}}
  **Main Menu Structure**
  - **Dashboard**: Home screen with KPIs
  - **Sales**: Customer and order management
  - **Purchasing**: Vendor and procurement
  - **Inventory**: Stock management
  - **Accounting**: Financial operations
  - **Reports**: Analytics and insights
  - **Settings**: System configuration

  **Navigation Tips**
  - Click menu items to expand sub-menus
  - Use breadcrumbs to track location
  - Star frequently used pages
  {{< /tab >}}

  {{< tab >}}
  **Key Interface Elements**

  1. **Top Navigation Bar**
     - Company selector (if multi-company)
     - Quick search (Ctrl+K)
     - Notifications bell
     - User profile menu

  2. **Left Sidebar**
     - Collapsible main menu
     - Module navigation
     - Quick access favorites

  3. **Main Content Area**
     - Page title and actions
     - Data grids and forms
     - Tab navigation for related data

  4. **Action Buttons**
     - Primary actions (blue)
     - Secondary actions (gray)
     - Danger actions (red)
  {{< /tab >}}
{{< /tabs >}}

---

## 🎨 Part 2: Understanding the Dashboard

### Dashboard Components

{{< cards >}}
  {{< card title="KPI Widgets" subtitle="Key metrics at a glance - sales, cash flow, inventory levels" >}}
  {{< card title="Activity Feed" subtitle="Recent transactions and system events in real-time" >}}
  {{< card title="Quick Actions" subtitle="Shortcuts to frequently used features and workflows" >}}
  {{< card title="Analytics Charts" subtitle="Visual representation of business trends and patterns" >}}
{{< /cards >}}

### Customizing Your Dashboard

1. **Click "Customize Dashboard"** (top right)
2. **Drag widgets** to rearrange layout
3. **Add/remove widgets** from the widget library
4. **Save layout** for future sessions

---

## 🔧 Part 3: Basic Configuration

### Step 2: Set Your Preferences

{{< tabs items="User Settings,Display Options,Notifications" >}}
  {{< tab >}}
  **Navigate to: Settings > My Profile**

  1. **Personal Information**
     - Update display name
     - Set profile picture
     - Configure contact info

  2. **Regional Settings**
     - Language: English
     - Date format: MM/DD/YYYY
     - Currency display: USD
     - Number format: 1,234.56

  3. **Save Changes**
     - Click "Save Profile"
     - Changes apply immediately
  {{< /tab >}}

  {{< tab >}}
  **Navigate to: Settings > Display**

  1. **Theme Selection**
     - Light mode (default)
     - Dark mode
     - Auto (follows system)

  2. **Layout Options**
     - Compact view
     - Comfortable view
     - Grid density settings

  3. **List Preferences**
     - Records per page: 25
     - Default sort order
     - Column visibility
  {{< /tab >}}

  {{< tab >}}
  **Navigate to: Settings > Notifications**

  1. **Email Alerts**
     - Order confirmations
     - Low stock warnings
     - Payment reminders

  2. **In-App Notifications**
     - Task assignments
     - Approval requests
     - System updates

  3. **Frequency Settings**
     - Real-time
     - Daily digest
     - Weekly summary
  {{< /tab >}}
{{< /tabs >}}

---

## 💡 Part 4: Core Concepts

### Understanding BigLedger Architecture

{{< callout type="info" >}}
**Key Concept**: BigLedger uses a modular architecture where **Applets** are functional components that can be used across multiple **Modules** (business areas).
{{< /callout >}}

### Essential Terminology

| Term | Definition | Example |
|------|------------|---------|
| **Tenant** | Your company instance | demo-v1 |
| **Module** | Business functional area | Sales, Inventory |
| **Applet** | Reusable component | Tax Configuration |
| **Document** | Business transaction | Invoice, PO |
| **Workflow** | Automated process | Approval chain |
| **Master Data** | Core business data | Customers, Items |

---

## 🚀 Part 5: Your First Transaction

### Creating a Sample Sales Order

{{< tabs items="Step 1: Navigate,Step 2: Create,Step 3: Process,Step 4: Verify" >}}
  {{< tab >}}
  **Getting to Sales Orders**

  1. Click **Sales** in main menu
  2. Select **Sales Orders**
  3. You'll see existing orders list
  4. Click **New Sales Order** button (top right)
  {{< /tab >}}

  {{< tab >}}
  **Enter Order Details**

  1. **Customer Section**
     - Search: Type "ACME"
     - Select: "ACME Corporation"
     - Notice address auto-fills

  2. **Add Line Items**
     - Click "Add Item"
     - Search: "PROD-001"
     - Quantity: 10
     - Price auto-populates

  3. **Order Information**
     - Delivery date: Tomorrow
     - Payment terms: Net 30
     - Notes: "Demo order"
  {{< /tab >}}

  {{< tab >}}
  **Save and Process**

  1. Click **Save Draft**
     - Order number generates
     - Status shows "Draft"

  2. Review the draft
     - Check the customer, items, prices and delivery date

  3. Click **Final**
     - Status: "Final"
     - Ready for fulfilment

  *(Sales orders have no approval step — there is nothing to submit or approve. Optional approvals
  exist only on purchase requisitions, purchase orders and stock requisitions; see
  [Document Approvals](/guides/document-approvals/).)*
  {{< /tab >}}

  {{< tab >}}
  **Verify Your Work**

  1. **Check Order List**
     - Your order appears at top
     - Status shows correctly

  2. **View Order Details**
     - Click order number
     - Review all information

  3. **Check Activity Log**
     - See creation timestamp
     - Review who edited the order and when
  {{< /tab >}}
{{< /tabs >}}

---

## 📊 Part 6: Basic Reporting

### Generating Your First Report

1. **Navigate to Reports**
   - Click "Reports" in main menu
   - Select "Sales Reports"

2. **Choose Report Type**
   - Select "Sales Summary"
   - Set date range: This Month

3. **Configure Options**
   - Group by: Customer
   - Include: All products
   - Format: PDF

4. **Generate & Export**
   - Click "Generate Report"
   - Preview results
   - Export as needed

---

## 🎯 Part 7: Practice Exercises

### Essential Skills Checklist

Complete these exercises to build confidence:

{{< tabs items="Navigation,Data Entry,Search & Filter,Reports" >}}
  {{< tab >}}
  **Navigation Mastery**
  - [ ] Find customer list
  - [ ] Locate inventory levels
  - [ ] Access user settings
  - [ ] Open help documentation
  - [ ] Use quick search (Ctrl+K)
  {{< /tab >}}

  {{< tab >}}
  **Data Entry Practice**
  - [ ] Create a new customer
  - [ ] Add a product/item
  - [ ] Enter a purchase order
  - [ ] Record a payment
  - [ ] Update contact info
  {{< /tab >}}

  {{< tab >}}
  **Search & Filter Skills**
  - [ ] Filter orders by date
  - [ ] Search customers by name
  - [ ] Find products by category
  - [ ] Locate specific invoices
  - [ ] Use advanced filters
  {{< /tab >}}

  {{< tab >}}
  **Report Generation**
  - [ ] Run sales report
  - [ ] Generate inventory list
  - [ ] Export customer data
  - [ ] Create P&L statement
  - [ ] Schedule automated report
  {{< /tab >}}
{{< /tabs >}}

---

## 🚦 Part 8: Common Tasks Quick Reference

### Frequently Used Features

{{< cards >}}
  {{< card link="#creating-documents" title="Creating Documents" subtitle="Orders, invoices, quotes" >}}
  {{< card link="#managing-inventory" title="Managing Inventory" subtitle="Stock checks, adjustments" >}}
  {{< card link="#processing-payments" title="Processing Payments" subtitle="Receipts, refunds, credits" >}}
  {{< card link="#running-reports" title="Running Reports" subtitle="Analytics, exports, dashboards" >}}
{{< /cards >}}

### Keyboard Shortcuts

| Action | Shortcut | Description |
|--------|----------|-------------|
| Quick Search | Ctrl + K | Search anything |
| Save | Ctrl + S | Save current form |
| New Record | Ctrl + N | Create new item |
| Refresh | F5 | Reload current page |
| Help | F1 | Open help docs |

---

## 💡 Tips for Demo Success

### Best Practices

{{< callout type="success" >}}
**Demo Success Tips**:
1. **Start simple** - Master basics before advanced features
2. **Use sample data** - Don't worry about making mistakes
3. **Explore freely** - Click around and discover features
4. **Take notes** - Document questions for sales team
5. **Try workflows** - Complete end-to-end processes
{{< /callout >}}

### Common Questions

**Q: Can I break anything in the demo?**
A: No! The demo resets daily, so experiment freely.

**Q: How do I undo changes?**
A: Most actions have an "undo" or "reverse" option. Check the action menu.

**Q: Where can I find help?**
A: Click the (?) icon on any page or press F1 for contextual help.

---

## 🎓 Next Steps

### You've Completed the Basics!

Now you're ready to explore:

1. **[Common Business Workflows](/user-guide/demo/common-workflows/)**
   - Learn standard business processes
   - Master financial operations

2. **Industry-Specific Demos**
   - [Retail](/user-guide/demo/retail/) - POS and inventory
   - [Manufacturing](/user-guide/demo/manufacturing/) - Production workflows
   - [Services](/user-guide/demo/services/) - Project management
   - [F&B](/user-guide/demo/food-beverage/) - Restaurant operations

3. **Advanced Features**
   - Automation rules
   - Custom workflows
   - Integration options

---

## 📝 Quick Reference Card

### Essential Information

{{< tabs items="URLs,Contacts,Resources" >}}
  {{< tab >}}
  **Demo Access**
  - URL: https://demo-v1.bigledger.com
  - Admin: demo-admin / Demo2025!
  - Reset: Daily at midnight
  {{< /tab >}}

  {{< tab >}}
  **Support Channels**
  - Email: demo@bigledger.com
  - Sales: sales@bigledger.com
  - Chat: Available in-app
  - Telegram: @leehongfay
  {{< /tab >}}

  {{< tab >}}
  **Learning Materials**
  - This guide: Bookmark for reference
  - Videos: Available in Help menu
  - Documentation: Full wiki access
  - Webinars: Weekly sessions
  {{< /tab >}}
{{< /tabs >}}

{{< callout type="info" >}}
**Remember**: The demo environment is your playground. The more you explore, the better you'll understand BigLedger's capabilities. Don't hesitate to try everything!
{{< /callout >}}

---

## ✅ Completion Checklist

Track your progress:

- [ ] Successfully logged into demo
- [ ] Navigated main menu sections
- [ ] Customized dashboard
- [ ] Set user preferences
- [ ] Created first transaction
- [ ] Generated a report
- [ ] Completed practice exercises
- [ ] Ready for industry demos

**Congratulations!** You're now ready to explore BigLedger's full capabilities through our industry-specific demo guides.