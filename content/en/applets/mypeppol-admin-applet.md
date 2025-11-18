# **My Peppol Admin Applet**

## **1. Introduction and Purpose**

The **My Peppol Admin Applet** serves as the central platform for managing all documents sent or received through the Peppol network.

While Peppol supports multiple document types, the current focus of this applet is on **E-invoice–related use cases**.  
Once a submission is successfully made to LHDN using the *My Invoice Admin Applet*, the status of that document changes to **“submitted”**.

The applet also facilitates sending or receiving documents when suppliers or customers are connected to the Peppol network.

---

## **2. Core Functionalities and Modules**

### **A. Waiting Queue & Processing**

The **Waiting Queue** manages documents that have been submitted to LHDN.

#### **How It Works**
- **Document Entry**  
  When a document is submitted to LHDN, it is automatically moved to the Waiting Queue.
- **Processing Mechanisms**  
  Documents in this queue will undergo processing via:
  - **Automatic Processing**  
    Scheduled cron jobs (“corers”) process records at set intervals.
  - **Manual Processing**  
    Users may trigger document processing manually.
- **Posting Queue**  
  Currently not in use, but reserved for potential future functionality.

---

### **B. Internal Submission (Sending Documents)**

This module manages documents the user is **sending out** to other parties.

---

#### **1. To Peppol AP (Access Point)**

Displays a list of all documents previously sent via Peppol.

**Key Notes**
- **AP = Access Point**
- Documents are sent using the recipient’s **Peppol ID**.

**Document Details Include**
- Document type (e.g., purchase debit note)  
- Document number  
- Total amount (before tax & after tax)  
- Process ID  
- Buyer and supplier information  
- Line-item details

---

#### **2. Queue (Error Handling)**

Shows documents that are **stuck** due to transmission or validation errors.

**Current Behaviour**
- Users can view the error type (e.g., transport error)
- Errors cannot be resolved from the frontend yet
- Backend intervention is required before resubmission

**Planned Enhancements**
- Display detailed validation errors
- Allow field updates from the frontend  
- Support resubmission directly from the interface  
  *(similar to Batch Pool features in My Invoice Admin Applet)*

---

#### **3. History**

Shows a complete list of documents **successfully sent** via the Peppol network.

---

### **C. External Reception (Receiving Documents)**

This module manages documents **received** from other parties over Peppol.

---

#### **1. From Peppol AP**

Lists all incoming documents sent to the user’s **Peppol ID**.

**Example Use Case**  
A supplier issues a purchase invoice and sends it via Peppol → it will appear here.

**Received Document Details Include**
- Total amount (before tax & after tax)  
- Process ID  
- Currency  
- Invoice type  
- Buyer and supplier details  
- Line items

---

#### **2. Queue (Error Handling)**

Documents that fail to process will appear here (similar logic to Internal Submission Queue).

---

#### **3. History**

Shows all documents **successfully received**.

> Note: At the time of documentation, a mapping issue was causing the list to not display, but a fix was already planned.

---

### **D. Peppol Config**

Provides administrative control over Peppol settings.

**Features**
- **Registration**  
  Allows the user to perform Peppol registration.
- **Multi-Company Listing**  
  Displays all companies registered under the user’s profile.

---

## **3. Analogy to Understand the Flow**

Imagine the My Peppol Admin Applet as a **postal sorting facility** specialising in e-invoices.

1. **Waiting Queue**  
   After submitting to LHDN, documents arrive in the sorting area.
2. **Internal Submission**  
   Outgoing letters:  
   - Delivered → moved to Sent History  
   - Incorrect details → stuck in Queue
3. **External Reception**  
   Incoming letters:  
   - Delivered → moved to Received History  
   - Transmission issues → stuck in Queue
4. **Peppol Config**  
   Acts like the registration office managing company identity in the postal system.
