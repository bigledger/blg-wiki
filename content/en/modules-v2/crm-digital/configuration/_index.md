---
title: "Configuration"
description: "Step-by-step implementation workflow for configuring the Digital CRM Module."
weight: 30
bookCollapseSection: false
---

Configuring the Digital CRM Module follows a strict 5-phase dependency chain. Customer profiles and communication channels must be established before automated campaign triggers or AI analytics models are enabled.

## Implementation Pipeline & Workflow

![5-Phase Digital CRM Implementation Pipeline](/images/crm-digital/crm_configuration_workflow.png)

---

## Phase 1: Master Foundations

**What you are doing:** Verifying customer master profiles, contact information, and support agent teams.

| Setup Task | Required Applet |
|------------|-----------------|
| Branch & Contact Center Settings | [Organisation Applet](/applets/master-data/organisation-applet/) |
| Customer Profiles & Contact Details | [Customer Maintenance Applet](/applets/master-data/customer-maintenance-applet/) |
| Support Team & Agent Permissions | [Unified Contact Center UCC Applet](/applets/crm/unified-contact-center-ucc-applet/) |

---

## Phase 2: Channel Messaging Gateways

**What you are doing:** Connecting WhatsApp Business API, live chat web widgets, email SMTP servers, and telephony gateways.

| Setup Task | Required Applet |
|------------|-----------------|
| WhatsApp & Social Channel Integration | [Unified Contact Center UCC Applet](/applets/crm/unified-contact-center-ucc-applet/) |
| Website Live Chat Widget Deployment | [Unified Contact Center UCC Applet](/applets/crm/unified-contact-center-ucc-applet/) |

---

## Phase 3: Engagement & Event Setup

**What you are doing:** Building automated customer drip journeys, message templates, and event registration pages.

| Setup Task | Required Applet |
|------------|-----------------|
| Broadcast Campaign & Drip Sequences | [Engagement Applet](/applets/crm/engagement-applet/) |
| Event Registration Pages & Ticketing | [Events Management Applet](/applets/crm/events-management-applet/) |

---

## Phase 4: AI Model Configuration

**What you are doing:** Training AI sentiment analysis models, setting RFM threshold bands, and configuring churn alert triggers.

| Setup Task | Required Applet |
|------------|-----------------|
| RFM Segmentation Band Rules | [AI Customer Analytics Applet](/applets/crm/ai-customer-analytics-applet/) |
| Predictive Churn Threshold Alerts | [AI Customer Analytics Applet](/applets/crm/ai-customer-analytics-applet/) |

---

## Phase 5: Test & Validate (Smoke Test)

Before going live, complete these mandatory verification tests:

- [ ] **Omnichannel Message Test:** Send a test WhatsApp or Live Chat message and verify real-time ticket creation in [Unified Contact Center UCC Applet](/applets/crm/unified-contact-center-ucc-applet/).
- [ ] **Campaign Broadcast Test:** Send a test engagement email/SMS and verify open/click tracking logs.
- [ ] **Event QR Check-In Test:** Generate a test event ticket QR code and verify successful check-in scanning.
