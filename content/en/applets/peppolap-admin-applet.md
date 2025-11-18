# **Peppol AP Admin Applet**

## **1. Overview and Target Audience**

### **1.1 Purpose of the Applet**
The **Peppol AP Admin Applet** is an internal administration tool used to manage **all documents received via the Peppol network** before they are distributed to their respective company tenants.

When documents are submitted through Peppol, they do **not** immediately arrive at the intended company tenant. Instead, all incoming Peppol documents are routed to a **centralized tenant called the Peppol AP Tenant**, which acts as a secure buffer, inspector, and distributor.

This ensures:
- Proper routing to the correct internal tenant  
- Filtering/screening of invalid or suspicious documents  
- Consistent handling across multiple tenants  
- Centralized control and logging

### **1.2 Target Audience and Access Restrictions**
This applet is **strictly for internal use only**.  
It is NOT meant for customers or external users.

Typical authorized users include:
- Web / BigLedger internal staff  
- Internal support or technical teams  
- System administrators handling Peppol routing  
- Developers performing debugging or monitoring  

Access is intentionally restricted to prevent accidental misrouting or modification of Peppol data.

### **1.3 Applet Location**
The Peppol AP Admin Applet exists **inside the Peppol AP Tenant**.

To access it:
1. Log in to **account.cloud**  
2. Search for **“Peppol”**  
3. Select the applet under the **Peppol AP tenant**

---

## **2. Core Functionality & Document Flow**

The Peppol AP Admin Applet manages the complete lifecycle of **incoming Peppol documents** before distributing them to the appropriate destination tenant.

### **2.1 High-Level Data Flow**
1. **Document Received**  
   A document is sent via Peppol to a registered Peppol ID belonging to one of the internal tenants.

2. **Arrival at Peppol AP Tenant**  
   All documents arrive first at the Peppol AP Tenant (central repository).

3. **Filtering / Pre-Processing**  
   The system performs:
   - Basic validation  
   - Format inspection  
   - Structural and business-rule checks  
   - Matching receiver Peppol ID → tenant-linking logic  

4. **Sorting Mechanism**  
   The applet determines:
   - Which tenant the document belongs to  
   - Which company it is linked to  
   - Whether the document structure is valid  

5. **Distribution to Final Tenant**  
   Documents are routed to the correct tenant such as:
   - Demo staging tenant  
   - Living staging tenant  
   - Production staging tenant  
   - Any other internal environment  

6. **Logging**  
   Every action is logged in:
   - Inbox Queue  
   - Inbox History  
   - Routing tables  

This creates a complete trace for audit and debugging.

---

## **3. Menu Descriptions**

The Peppol AP Admin Applet contains four primary menus:

1. **Inbox Queue**  
2. **Inbox History**  
3. **Registered Companies**  
4. **Test Bed (Inactive)**

---

### **3.1 Inbox Q (Inbox Queue)**

This is the first menu visible upon opening the applet.

#### **Purpose**
- Displays documents that have just arrived from Peppol.
- Acts as the *temporary holding area* before routing occurs.

#### **Key Behaviors**
- Queue is typically **empty** because documents are processed rapidly.
- Documents appear briefly during:
  - System load spikes  
  - When manual debugging is done  
  - When there is a routing issue  

#### **Document Movement**
Once processed, documents:
- Are **removed automatically** from the Queue  
- Move to **Inbox History** for permanent logging  

---

### **3.2 Inbox History**

This menu contains a historical list of **all documents processed and distributed** from the Peppol AP Tenant.

#### **Information Displayed**
Each record includes:
- **Sender ID** (Peppol ID of the sender)
- **Receiver ID**  
  - Points to the Peppol ID mapped to one of our internal tenants  
- **Document Date** or **Creation Timestamp**
- **Process ID**  
  - A unique universal identifier  
  - Same ID used across both sending and receiving Peppol flows  

#### **Export Button**
- An **Export** button is displayed, but **it is non-functional**.
- It is scheduled for removal to avoid confusion.

#### **Usage**
Inbox History is critical for:
- Debugging routing issues  
- Verifying correct tenant distribution  
- Support team checks  
- Auditing incoming Peppol traffic  

---

### **3.3 Registered Companies**

This menu displays all tenant-company Peppol ID mappings.

#### **Context**
- The system supports multiple internal tenants.
- Each tenant contains **multiple companies**.
- Each company can have **multiple registered Peppol IDs**.

#### **Functionality**
- Users can filter by **tenant name** (e.g., “Demo Staging”, “Living Staging”)  
- The resulting list shows:
  - **Registered Peppol ID**
  - **Company Name**
  - **Company Code**

#### **Data Consistency**
The Peppol IDs shown here reflect the same list found in:
> Organization Applet → Peppol Config tab → Company registration

This menu is useful for:
- Cross-checking incorrect mappings  
- Ensuring correct tenant → company → Peppol ID linkages  
- Identifying incorrect or missing registrations  

---

### **3.4 Test Bed (Inactive)**

This tab was originally planned as an internal testing tool but is currently **inactive**.

#### **Original Concept**
To replicate the **Print My Test Bed** functionality for internal Peppol testing.

##### **Proposed Sub-Menus**

1. **Sending Test**
   - Select document type  
   - Paste XML based on the selected Peppol format  
   - Provide target Peppol IDs  
   - System would simulate sending and generate routing logs  

2. **Validation Test**
   - Create multiple validation test cases  
   - Validate XML structures  
   - Troubleshoot schema-based errors  

#### **Reason for Inactivity**
MDC (Malaysia Digital Economy Corporation) required all PRS/SP testing to be performed directly using the official **MDC Test Bed**, making the internal module unnecessary.

---

## **4. Functional Analogy (Simplified Explanation)**

The Peppol AP Admin Applet operates like an **air traffic control center** for Peppol documents.

- All “flights” (documents) land first at the **Peppol AP Airport**  
- Immigration (filtering) happens  
- Airport staff determine which “terminal” (tenant) the passenger belongs to  
- Passengers are routed to the correct terminal  
- The history system keeps a record of all arrivals for security and auditing  

---

## **5. Additional Notes & Recommended Enhancements**

### **Current Limitations**
- Export button inactive  
- No direct view of XML content inside the applet  
- No re-routing or error recovery tools  
- Test Bed disabled  

### **Future Improvement Suggestions**
- Enable XML preview in Inbox History  
- Allow manual re-routing for debugging  
- Provide failed-routing logs and error messages  
- Add “resend to tenant” function for recovery  
- Develop real-time monitoring dashboard  
- Integrate with My Invoice Admin Applet for unified Peppol tracking  

---

# **End of Documentation**
