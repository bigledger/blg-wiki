# Internal Purchase Return Applet

## 1. Overview: Purchase Return Concept
The **Internal Purchase Return Applet** is used to record and manage the return of goods to a supplier. A purchase return typically results in a **refund**, **credit note**, or **contra against an existing purchase invoice**.

This applet ensures:
- Accurate inventory adjustments  
- Proper supplier account reconciliation  
- Full audit trail and document traceability  

### Common Use Cases
- Incorrect items received  
- Damaged or defective goods  
- Excess quantity received or ordered  
- Pricing or system errors in the original purchase transaction  

---

## 2. Applet Navigation & Listing View
The listing screen provides a centralized view of all purchase return transactions.

### 2.1 Listing Capabilities
- **Advanced Search**
  - Filter by:
    - Supplier
    - Branch
    - Transaction date
    - Purchaser
    - Posting status
    - GL dimension
- **Customizable Grid View**
  - Drag, reorder, or hide columns
  - Save preferred views for daily operations
- **Line Item Listing**
  - Switch to item-level view
  - Review returned quantities and values across multiple documents
- **Export Function**
  - Export listings for reporting, reconciliation, or audit purposes

---

## 3. Creating a Purchase Return
There are **two supported methods** to create a purchase return document.

---

### Method 1: Manual Creation
Use this method when the return is **not linked** to any existing purchase document.

#### Steps
1. Click the **➕ (Add)** button
2. **Main Details**
   - Branch
   - Location
   - Delivery branch & location
   - Currency
   - Transaction date (auto-populated)
   - Purchaser (optional)
3. **Account**
   - Select the supplier account
4. **Line Items**
   - Search and add items
   - Enter return quantity and unit price
5. **Save Options**
   - **Save** → Document remains in *Draft* status
   - **Final** → Document moves to *Final* status and may trigger a printable document

#### Notes
- Draft documents do **not** affect inventory or accounting
- Only finalized documents post financial and stock impact

---

### Method 2: Create from Existing Document (Recommended)
This method improves accuracy and reduces manual input.

#### Steps
1. Click **➕ (Add)** and use **Search Existing Document**
2. Search by:
   - Supplier
   - Purchase Invoice
   - Goods Received Note (GRN)
   - Serial number
3. **Item Selection**
   - **Add All** → Return all items from the source document
   - **Add Selected** → Specify exact quantities per item
4. Review auto-loaded information
5. Click **Final** to complete the transaction

#### Advantages
- Ensures correct pricing and item references
- Maintains clear document linkage and traceability

---

## 4. Document Status Lifecycle
A purchase return document follows a standard lifecycle:

- **Draft**
  - Editable
  - No accounting or inventory impact
- **Final**
  - Inventory adjusted
  - Supplier account updated
  - Document locked for structural changes

---

## 5. Document Tabs & Functional Modules
Each purchase return document includes multiple functional tabs to support advanced operations.

### 5.1 e-Invoice
- Used for:
  - Self-billed purchase returns
  - Credit note or debit note processing
- Submit eligible documents for e-invoice validation and compliance

### 5.2 ARAP (Accounts Receivable / Accounts Payable)
- Displays:
  - Outstanding balances
  - Impact on supplier payable accounts

### 5.3 Contra
- Offset the purchase return against:
  - Existing purchase invoices
- Commonly used when suppliers issue credits instead of cash refunds

### 5.4 Settlement
- Used when the supplier provides a **cash refund**
- Record payment method, amount, and settlement details

### 5.5 Trace Document & Link
- View all related upstream and downstream documents
- Supports audit review and transaction tracking

### 5.6 Attachment
- Upload supporting documents such as:
  - Supplier emails
  - Photos of damaged goods
  - Credit note references

### 5.7 Export
- Generate and print the official printable version of the purchase return document

---

## 6. Configuration & User Permissions
Users with appropriate administrative access can configure the applet via **Settings**.

### 6.1 Configurable Options
- Show or hide specific tabs
- Control visibility of action buttons (e.g., Contra, Settlement)
- Restrict fields or functions based on user roles

### 6.2 Purpose
- Simplify user workflows
- Enforce internal controls
- Align system behavior with company policies

---

## 7. Operational Best Practices
- Always link to original purchase documents when possible
- Review quantities carefully before finalizing
- Attach supporting evidence for audit clarity
- Use Contra or Settlement tabs appropriately based on supplier arrangement

---

## 8. Summary
The **Internal Purchase Return Applet (PUR RTN)** provides a structured and auditable process for handling supplier returns. Proper usage ensures accurate inventory records, compliant accounting entries, and clear transaction traceability across the ERP system.

