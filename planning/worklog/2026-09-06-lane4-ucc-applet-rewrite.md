---
date: 2026-09-06
unpublished_from: content/en/applets/crm/unified-contact-center-ucc-applet.md
url: /applets/crm/unified-contact-center-ucc-applet/
tier: 1
mechanism: rewritten-in-place
reason: "The 873-line UCC page was a screenshot walkthrough with five load-bearing claims that the source contradicts, an internal developer set-up procedure containing a live ngrok tunnel URL and a real Facebook business/WABA id (already filed as P-0010), an invented roadmap feature (YouTube integration), and a sales call-to-action. The page was rewritten to the applet-page standard against alg-applets-ucc@adc3915e1 and blg-akaun-platform-java@1ff620ef0e; the fragments below came out."
evidence:
  - "ngrok / Facebook business id: the removed section 1 published https://3db9-121-121-122-11.ap.ngrok.io and business_id=1329448660474352&waba_id=105748575486134. The real WhatsApp set-up is Configurations → Virtual Contacts → Endpoints (create-endpoint.component.ts:162-175, 262-300; virtual-contact-constants.ts:116-131 PROVIDERS.WHATSAPP = TWILIO, VONAGE, WHATSAPP_BUSINESS)."
  - "YouTube: social-media.component.ts:29-45 renders exactly three tabs (Facebook, Instagram, Twitter); social-media-routing.module.ts declares two routes (facebook, instagram). No YouTube identifier exists anywhere in the applet."
  - "Task Router: task-router-queue/task-router-queue-constants.ts:3-45 — Router Queue lists bl_alg_cc_queue_hdr (Queue Code, Queue Name, Queue Description, Created, Updated). task/task-constants.ts:6-12 — Tasks lists bl_alg_cc_task_hdr at every status, not a completed-task history."
  - "Contact merging: contact-merging.component.html:2-22 is a four-tab manual link panel (Contact Hdr, Entity, Membership, Login Subject); contact-merging-entity/ has an add flow and a delete. There is no automatic cross-channel identity algorithm in the applet."
  - "Contacts: create-contact.component.ts:149-164 writes bl_crm_contact_hdr with ref_5 = 'AI_LEDGER' and a source from bl_crm_contact_source_hdr where ds_code = 'AI_LEDGER' — the shared CRM contact table, not a UCC-private database."
  - "Channels: models/channel-constants.ts declares twelve channel types, not 'WhatsApp, Facebook, Telegram and more'."
salvage: "The queue-view descriptions (All / Team / My), the session-and-task model, the field legends for Task Code / Team Code / Agent Code / Channel, and the contacts, broadcast and live-dashboard walkthroughs were substantially accurate and were carried into the rewritten page in reference form. The three embedded webinar videos were kept under Related documentation."
to_rewrite: "Done in place. The remaining gap is screenshots: 60 of the page's 71 images were quarantined in run 33 for showing live customer data, and the eleven that survive cover only the summary tiles, social media, dashboard, reports and broadcast. A recapture session on a synthetic tenant is needed for the inbox, the task queues, the task edit screen, contacts, My Profile and the Live Dashboard."
---

## Removed verbatim

### Section 1 — "Overview of WhatsApp Business Set-Up"

```
## 1. Overview of WhatsApp Business Set-Up

The following are the steps required to set up the WhatsApp Business App for new customers.

1.  Ask the Manager to permit Wavelet Facebook Business Settings.

2.  Go to https://developers.facebook.com/apps/?show_reminder=true and create a new app as
    explained here: Get Started - WhatsApp Cloud API - Documentation - Meta for Developers

3.  Configure the Webhook:
    a. Download ngrok
    b. Install and run grok on the terminal ⇒ `grok http 80` (windows) or `ngrok http 5000`
    c. Copy the link next to "Forwarding". It looks something like <a live ngrok tunnel URL>
    d. Follow the documentation for Callback URL pass ngrok link and endpoint from the code:
       <the same tunnel URL>/v1/integration/channels/whatsapp/receive
    e. If Webhook is set successfully, you will receive a message.

4.  Add phone numbers:
    a. Add the client's phone number here: <a business.facebook.com URL carrying a real
       business_id and waba_id>
    b. Do not sign up with the customer's phone number with the WhatsApp Business app. …
    c. Phone number will be approved after 6 hours and 1k free messaging limits will be granted
       depending on the quality rating.
```

This is a developer's local set-up note, not user documentation. The tunnel URL and the two Meta
identifiers are redacted here as well; the originals are in git history and are the subject of
P-0010.

### Section 6.2 — YouTube

```
### 6.2 YouTube

(This part is under development)

The YouTube integration is currently being developed and will follow similar patterns to the
Facebook integration, allowing you to manage your organization's YouTube channel, videos, and
engagement from within UCC. Check back for updates as this feature becomes available.
```

### Section 13 — Task Router

```
-   **Router Queue**: This contains all **live, ongoing, and open tasks**. When a new task is
    created, it appears here while waiting to be handled or while actively in progress. It
    represents the current, real-time state of work in the system.

-   **Tasks**: This serves as a comprehensive **history table** for all tasks that have been
    completed or closed. Once a task is finished, it moves from the `Router Queue` to this `Tasks`
    list.
```

### The contact-merging claim

```
Underpinning this is a powerful **Contact Merging** algorithm. UCC automatically identifies
conversations from different channels (e.g., Messenger, Telegram, Lazada, Email) as belonging to
the same user, linking their profiles and consolidating their interaction history into a single,
unified view. This provides agents with a true 360-degree view of the customer.
```

### The closing call to action

```
## Ready to Transform Your Customer Service?

The UCC Applet is more than just a messaging platform - it's a complete customer engagement
solution that will revolutionize how you interact with customers.

{{< cards >}}
  {{< card link="/demos-resources" title="Watch Demo" subtitle="See UCC in action" >}}
  {{< card link="mailto:sales@bigledger.com" title="Contact Sales" subtitle="Get personalized pricing" >}}
{{< /cards >}}
```

Marketing copy on a reference page, and a "Contact Sales" card in the middle of the applet
reference set.
