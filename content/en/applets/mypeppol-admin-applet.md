---
title: "My Peppol Admin Applet"
description: "Manage Peppol network documents - send invoices to suppliers, receive from customers, and track e-invoice submissions"
tags:
- peppol
- e-invoice
- document-exchange
- supplier-integration
- customer-integration
weight: 75
---

## Purpose and Overview

The My Peppol Admin Applet is your interface for managing documents sent and received through the Peppol network. While Peppol supports various document types, this applet currently focuses on e-invoice workflows—particularly the handoff between LHDN submission and Peppol distribution.

When you submit an e-invoice to LHDN via the My E-Invoice Admin Applet and it's validated, that document can then be sent to your supplier or customer through Peppol if they're connected to the network.

{{< callout type="info" >}}
**Integration Point**: This applet works in tandem with My E-Invoice Admin Applet. LHDN submission happens there; Peppol distribution happens here.
{{< /callout >}}

### Who Uses This Applet

**Accounts Payable:**
- Send purchase invoices to suppliers via Peppol
- Track document delivery status
- Handle transmission errors

**Accounts Receivable:**
- Receive sales invoices from customers via Peppol
- Monitor incoming documents
- Process received invoices

**Finance Teams:**
- Oversee Peppol document flow
- Ensure supplier/customer connectivity
- Manage Peppol registrations

## Key Features Overview

{{< cards >}}
  {{< card title="Waiting Queue" subtitle="Documents pending Peppol processing" >}}

  {{< card title="Internal Submission" subtitle="Track documents you're sending out" >}}

  {{< card title="External Reception" subtitle="Monitor documents you're receiving" >}}

  {{< card title="Peppol Config" subtitle="Manage company Peppol registrations" >}}
{{< /cards >}}

## How It Works: Document Flow

```
LHDN Submission (My E-Invoice Admin)
    ↓
Document Status: "Submitted"
    ↓
Waiting Queue (My Peppol Admin)
    ↓
Processing (Automatic or Manual)
    ↓
To Peppol AP (Sending to recipient)
    ↓
Recipient's Peppol ID receives document
```

**For Incoming Documents:**
```
Supplier sends via Peppol
    ↓
From Peppol AP (Your Peppol ID receives)
    ↓
Processing and validation
    ↓
History (Successfully received)
```

---

## 1. Waiting Queue

The Waiting Queue holds documents that have been submitted to LHDN and are ready for Peppol distribution.

### How Documents Enter

When you submit an e-invoice to LHDN via My E-Invoice Admin Applet:
1. Document is validated by LHDN
2. Status changes to "Submitted"
3. Document automatically moves to Waiting Queue
4. Ready for Peppol processing

### Processing Methods

**Automatic Processing:**
- Scheduled cron jobs process documents at set intervals
- No manual intervention required
- Typical processing time: minutes

**Manual Processing:**
- Trigger processing on-demand
- Useful for urgent documents
- Available via process button

### What Happens Next

After processing:
- Document sent to recipient's Peppol ID
- Moves to "To Peppol AP" for tracking
- Or moves to "Queue" if errors occur

{{< callout type="tip" >}}
**Normal Operation**: Waiting Queue should clear quickly. Documents lingering here may indicate processing delays or configuration issues.
{{< /callout >}}

---

## 2. Internal Submission (Sending Documents)

Track documents you're sending to suppliers or customers via Peppol.

### To Peppol AP

Shows all documents you've sent through the Peppol network.

**Information Available:**

| Field | Details | Use |
|-------|---------|-----|
| **Document Type** | Purchase debit note, invoice, etc. | Identify document category |
| **Document Number** | Your internal reference | Track specific documents |
| **Total Amount** | Before tax and after tax | Financial verification |
| **Process ID** | Unique Peppol identifier | End-to-end tracking |
| **Buyer/Supplier Info** | Party details | Verify recipients |
| **Line Items** | Document details | Content verification |

**Recipient Identification:**
- Documents sent using recipient's **Peppol ID**
- Format: 0195:XXXXXXXXX (Malaysia)
- Must be registered on Peppol network

### Queue (Error Handling)

Documents that fail transmission or validation appear here.

**Current Capabilities:**
- View error type (transport error, validation error, etc.)
- See which documents are stuck
- Identify failure patterns

**Current Limitations:**
- Cannot resolve errors from frontend
- Requires backend intervention
- No direct resubmission capability

**Planned Enhancements:**
- Display detailed validation errors
- Allow field updates from interface
- Support direct resubmission
- Similar to Batch Pool in My E-Invoice Admin Applet

**Temporary Workaround:**
1. Note the error details
2. Contact technical support
3. Provide Process ID and document number
4. Backend team resolves and resubmits

### History

Complete archive of successfully sent documents.

**Use this to:**
- Verify document delivery
- Track sent document volume
- Audit Peppol transmissions
- Confirm supplier received documents

---

## 3. External Reception (Receiving Documents)

Monitor and manage documents sent to you by suppliers or customers via Peppol.

### From Peppol AP

Lists all incoming documents sent to your Peppol ID.

**Common Scenario:**
```
Supplier issues purchase invoice
    ↓
Sends via Peppol to your Peppol ID
    ↓
Appears in "From Peppol AP"
    ↓
You process and record in your system
```

**Document Details:**

| Field | Information | Purpose |
|-------|-------------|---------|
| **Total Amount** | Before tax and after tax | Financial verification |
| **Process ID** | Unique identifier | Tracking and support |
| **Currency** | Transaction currency | Forex handling |
| **Invoice Type** | Document classification | Processing rules |
| **Buyer/Supplier Details** | Party information | Verification |
| **Line Items** | Document content | Detailed review |

### Queue (Error Handling)

Documents that fail processing appear here.

**Similar to Internal Submission Queue:**
- Shows stuck documents
- Displays error types
- Requires backend intervention for resolution

**Common Issues:**
- Format validation failures
- Missing required fields
- Peppol ID mismatches
- System processing errors

### History

Archive of successfully received documents.

{{< callout type="warning" >}}
**Known Issue**: At time of documentation, a mapping issue prevented the History list from displaying. Fix was planned and may now be resolved.
{{< /callout >}}

**Use this to:**
- Verify document receipt
- Track incoming document volume
- Audit received invoices
- Confirm supplier submissions

---

## 4. Peppol Config

Administrative control for Peppol settings and registrations.

### Registration Management

**Company Registration:**
- Register your company on Peppol network
- Obtain Peppol ID
- Configure network settings
- Activate Peppol connectivity

**Multi-Company Support:**
- View all companies under your profile
- Manage multiple Peppol IDs
- Configure per-company settings
- Track registration status

### Configuration Options

**Peppol ID Management:**
- Register new Peppol IDs
- Update existing registrations
- Deactivate unused IDs
- Verify registration status

**Network Settings:**
- Configure access point
- Set default preferences
- Manage document routing
- Update contact information

{{< callout type="info" >}}
**Integration Note**: Peppol Config settings sync with Organization Applet → Peppol Config tab. Changes in one location reflect in the other.
{{< /callout >}}

---

## 5. Common Workflows

### Sending a Purchase Invoice to Supplier

**Prerequisites:**
- Supplier has Peppol ID
- Your company registered on Peppol
- Invoice submitted to LHDN

**Workflow:**
1. Submit invoice to LHDN via My E-Invoice Admin
2. Wait for LHDN validation (status: "Submitted")
3. Document appears in Waiting Queue
4. Automatic processing sends to supplier's Peppol ID
5. Track in "To Peppol AP"
6. Verify delivery in History

### Receiving an Invoice from Customer

**Prerequisites:**
- Your company has Peppol ID
- Customer knows your Peppol ID
- Customer sends via Peppol network

**Workflow:**
1. Customer sends invoice to your Peppol ID
2. Document appears in "From Peppol AP"
3. Review document details
4. Process in your accounting system
5. Document moves to History

### Troubleshooting Failed Transmission

**For Outgoing Documents:**
1. Check "Queue" under Internal Submission
2. Note error type and Process ID
3. Verify recipient's Peppol ID is correct
4. Contact support with details
5. Monitor for resubmission

**For Incoming Documents:**
1. Check "Queue" under External Reception
2. Review error details
3. Verify your Peppol ID registration
4. Contact support if needed
5. Confirm resolution in History

---

## 6. Integration Points

### With My E-Invoice Admin Applet

**Document Flow:**
```
My E-Invoice Admin: LHDN submission
    ↓
Status: "Submitted"
    ↓
My Peppol Admin: Peppol distribution
```

**Process ID Linking:**
- Same Process ID used across both applets
- Enables end-to-end tracking
- Links LHDN submission to Peppol delivery

### With Organization Applet

**Peppol Config Sync:**
- Registrations sync between applets
- Single source of truth
- Consistent configuration

### With Peppol AP Admin Applet

**For Internal Staff:**
- Peppol AP Admin: Central routing hub
- My Peppol Admin: Company-specific view
- Process IDs link documents across systems

---

## 7. Best Practices

### Daily Operations

**Morning Check:**
- Review Waiting Queue (should be empty or minimal)
- Check for stuck documents in Queues
- Verify overnight processing completed

**Throughout Day:**
- Monitor "To Peppol AP" for delivery confirmation
- Check "From Peppol AP" for incoming documents
- Process received documents promptly

**End of Day:**
- Ensure Waiting Queue cleared
- Review any error Queue items
- Escalate unresolved issues

### Document Management

**For Outgoing:**
- Verify recipient Peppol ID before submission
- Monitor delivery status
- Keep History for audit trail
- Document any transmission issues

**For Incoming:**
- Process received documents promptly
- Verify sender Peppol ID
- Reconcile with expected deliveries
- Archive in History

### Error Handling

**When Documents Stuck:**
1. Note Process ID and error type
2. Check Peppol ID accuracy
3. Verify network connectivity
4. Contact support with details
5. Document resolution for future reference

### Registration Management

**Regular Reviews:**
- Verify active Peppol IDs
- Remove unused registrations
- Update contact information
- Test connectivity periodically

---

## 8. Common Issues

**Documents stuck in Waiting Queue?**
- Check if automatic processing is running
- Try manual processing
- Verify Peppol configuration
- Contact support if persists

**Can't see sent documents in History?**
- Check "To Peppol AP" first
- Verify document actually sent
- Check date range filters
- Confirm processing completed

**Received documents not appearing?**
- Verify your Peppol ID is correct
- Check "From Peppol AP" for pending
- Look in Queue for errors
- Confirm sender used correct Peppol ID

**Error in Queue but can't resolve?**
- Note Process ID and error details
- Contact technical support
- Provide document number
- Wait for backend resolution

**Peppol Config changes not reflecting?**
- Allow time for sync
- Refresh the page
- Check Organization Applet
- Verify permissions

---

## 9. Limitations and Future Enhancements

### Current Limitations

**Error Resolution:**
- Cannot fix errors from frontend
- Requires backend intervention
- No direct resubmission capability

**History Display:**
- Received documents History may have display issues
- Mapping problems being addressed

**Queue Management:**
- Limited error detail visibility
- No field editing capability
- Manual intervention required

### Planned Enhancements

**Improved Error Handling:**
- Detailed validation error display
- Frontend field editing
- Direct resubmission capability
- Similar to My E-Invoice Admin Batch Pool

**Better History Management:**
- Fix mapping issues
- Enhanced filtering options
- Export capabilities
- Better search functionality

**Enhanced Monitoring:**
- Real-time status updates
- Automated alerts for stuck documents
- Performance metrics
- Volume tracking

---

## 10. Quick Reference

### Key Menus

| Menu | Purpose | Check When |
|------|---------|------------|
| **Waiting Queue** | Documents pending Peppol processing | After LHDN submission |
| **To Peppol AP** | Documents you've sent | Verifying delivery |
| **From Peppol AP** | Documents you've received | Checking incoming |
| **Queue (Internal)** | Stuck outgoing documents | Troubleshooting sends |
| **Queue (External)** | Stuck incoming documents | Troubleshooting receives |
| **History** | Successfully processed | Audit and verification |
| **Peppol Config** | Registration management | Setup and configuration |

### Critical Information

**Process ID:** Unique identifier across LHDN and Peppol systems
**Peppol ID Format:** 0195:XXXXXXXXX (Malaysia)
**Document Flow:** LHDN → Waiting Queue → Peppol AP → Recipient
**Processing Time:** Typically minutes via automatic processing

### When to Contact Support

- Documents stuck in Queue with errors
- Cannot resolve transmission failures
- Peppol ID registration issues
- History not displaying correctly
- Need backend intervention for resubmission

---

## 11. Frequently Asked Questions

**Q: What's the difference between My Peppol Admin and Peppol AP Admin?**
A: My Peppol Admin is for your company's documents. Peppol AP Admin is internal staff tool for managing all tenants' Peppol routing.

**Q: Why do documents go to Waiting Queue after LHDN submission?**
A: LHDN submission and Peppol distribution are separate steps. Waiting Queue bridges them.

**Q: How long do documents stay in Waiting Queue?**
A: Typically minutes. Automatic processing runs at set intervals.

**Q: Can I manually send a document to Peppol?**
A: Yes, use manual processing in Waiting Queue for urgent documents.

**Q: What if recipient doesn't have Peppol ID?**
A: Document cannot be sent via Peppol. Use alternative delivery methods.

**Q: How do I know if document was successfully sent?**
A: Check "To Peppol AP" and verify it appears in History.

**Q: What if I receive a document with errors?**
A: It appears in External Reception Queue. Contact support for resolution.

**Q: Can I edit a document stuck in Queue?**
A: Not currently. This feature is planned for future release.

**Q: How do I register for Peppol?**
A: Use Peppol Config menu or Organization Applet → Peppol Config tab.

**Q: Are Process IDs the same across all systems?**
A: Yes. Same Process ID used in My E-Invoice Admin, My Peppol Admin, and Peppol AP Admin.

{{< callout type="info" >}}
**Need Help?** Contact your system administrator or support team for assistance with Peppol connectivity and document transmission issues.
{{< /callout >}}
