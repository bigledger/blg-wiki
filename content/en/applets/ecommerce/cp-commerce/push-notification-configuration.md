---
title: Push Notification Configuration
description: "How push notifications reach the Customer Portal mobile app: the Firebase service-account credential stored on the Website record, the Website settings that decide who is subscribed, the Notification and Scheduled screens in CP Commerce Admin, the app-side registration flow, and the failure messages the backend returns."
page_type: applet-feature
applet_code: "cp_commerce_admin_console_v1"
applet_repo: "blg-applets-wavelet-cp-commerce"
parent_page: /applets/ecommerce/cp-commerce-admin-applet/
modules: [ecommerce, membership]
related_applets:
  - cp-commerce-admin-applet
  - membership-admin-applet
  - customer-applet
guides: []
aliases:
  - /modules/ecommerce/push-notification-configuration/
sources:
  configuration:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/infra/google/firebase/FirebaseAkaunService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/CmsWebsiteService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/pushNotification/PushNotificationManager.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/CmsTopicUows/CmsTopicUow.java
    - blg-applets-wavelet-cp-commerce/micro-fe/projects/akaun-platform/applets/cp-commerce-admin-applet/src/app/components/website-container/website-edit/website-edit.component.html
    - blg-applets-wavelet-cp-commerce/micro-fe/projects/akaun-platform/applets/cp-commerce-admin-applet/src/app/components/website-container/website-edit/website-edit.component.ts
    - blg-applets-wavelet-cp-commerce/micro-fe/projects/akaun-platform/applets/cp-commerce-admin-applet/src/app/state-controllers/website-controllers/store/effects/website.effects.ts
    - wavelet-cp-commerce/capacitor.config.ts
    - wavelet-cp-commerce/package.json
    - wavelet-cp-commerce/src/environments/environment.prod.ts
  fields:
    - blg-applets-wavelet-cp-commerce/micro-fe/projects/akaun-platform/applets/cp-commerce-admin-applet/src/app/components/notification-container/notification-create/notification-create.component.html
    - blg-applets-wavelet-cp-commerce/micro-fe/projects/akaun-platform/applets/cp-commerce-admin-applet/src/app/components/notification-container/notification-edit/notification-edit.component.html
    - blg-applets-wavelet-cp-commerce/micro-fe/projects/akaun-platform/applets/cp-commerce-admin-applet/src/app/components/notification-container/notification-edit/scheduled/scheduled-details/scheduled-details.component.html
    - blg-applets-wavelet-cp-commerce/micro-fe/projects/akaun-platform/applets/cp-commerce-admin-applet/src/app/components/newsletter-topic-container/newsletter-topic-create/newsletter-topic-create.component.html
  lifecycle:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/CmsNotificationService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/cms/cmsNotification/CmsNotificationController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/cms/cmsTopic/CmsTopicSubscriptionController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/cmsNotifications/NotificationSchedulerProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/cmsNotifications/NotificationReadStatusLinkGeneratorProcessor.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/notification/CmsNotificationSchedulerUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/CmsTopicSubscriptionService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/MemberLabelTopicService.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/model/CmsTopicContainers/CmsTopicContainer.java
    - wavelet-cp-commerce/src/app/domain-controller-module/mobile-native/push-notification-controller/facades/push-notification.facade.ts
    - wavelet-cp-commerce/src/app/domain-controller-module/mobile-native/push-notification-controller/effects/push-notification.effects.ts
    - wavelet-cp-commerce/src/app/domain-controller-module/mobile-native/facades/mobile-config.facade.ts
    - wavelet-cp-commerce/src/app/state-controllers/push-notification-store/effects/notification-topic-management.effect.ts
    - wavelet-cp-commerce/src/app/state-controllers/push-notification-store/effects/notification-topic-session.bus.effect.ts
    - wavelet-cp-commerce/src/app/services/auth-resolver.service.ts
  troubleshooting:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/infra/google/firebase/FirebaseAkaunService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/CmsTopicUows/CmsTopicUow.java
    - blg-applets-wavelet-cp-commerce/micro-fe/projects/akaun-platform/applets/cp-commerce-admin-applet/src/app/components/notification-container/notification-edit/notification-edit.component.ts
    - gh:bigledger/blg-wiki#207
    - gh:bigledger/wavelet-cp-commerce#245
    - gh:bigledger/wavelet-cp-commerce#355
weight: 10
tags:
- push-notifications
- firebase
- mobile
- android
- ios
- configuration
- cp-commerce
---

## Overview

Push notifications are a feature of the [CP Commerce Admin](/applets/ecommerce/cp-commerce-admin-applet/) applet, not a separate applet. A marketing or operations user writes a notification under *CP Commerce Admin → Notification*, picks the website and the topic it goes to, and presses **Publish Now** (or schedules it). The backend sends it through Firebase Cloud Messaging (FCM) to every device subscribed to that topic, and the Customer Portal mobile app shows it and opens the linked page when the customer taps it.

Three things have to line up for a notification to arrive: the **Website** record must carry a Firebase service-account credential, the **app build** must be registered with the same Firebase project, and the customer's device must be **subscribed to the topic** — which the Website's *Default Topic* and *Restrict Notification by Member* settings decide. This page documents all three from the code. The old version of this page reproduced one customer's Firebase project and build identifiers; those are deliberately absent here.

## Where it fits

| Piece | What it does | Where it is configured |
|---|---|---|
| **Website record** (`bl_cms_website_hdr`) | Holds the Firebase service-account JSON (`property_json.firebase`), the *Default Topic* and *Restrict Notification by Member* flags. | CP Commerce Admin → Website → edit (flags); the credential has no screen — see Configuration. |
| **Topics** (`bl_cms_topic_hdr`) | The channels a device subscribes to. A notification is always sent to one topic. Member labels can auto-subscribe segments. | CP Commerce Admin → Topics. |
| **Notification** (`bl_cms_notification_hdr`) | Title, body, optional post image and deep link, sent to a topic on publish. | CP Commerce Admin → Notification. |
| **Scheduler** (`bl_cms_notification_scheduler`) | Fires a saved notification at a date-time. | Notification edit → Scheduled tab. |
| **Customer Portal app** (`wavelet-cp-commerce`, built per customer with Capacitor) | Asks for permission, registers with FCM, stores the device token, subscribes to topics, opens the deep link on tap. | The app build (Firebase config files, `capacitor.config.ts`). |
| **Backend** (`FirebaseAkaunService`) | Reads the website credential, talks to FCM (send to topic / device, subscribe / unsubscribe tokens). | Nothing to configure beyond the website credential. |

Upstream: [Membership Admin](/applets/membership/membership-admin-applet/) and [Customer](/applets/master-data/customer-applet/) supply the members and member labels that drive topic subscriptions. Downstream: nothing — a notification writes a read/unread link per subscriber and stops.

## Screens and menus

All screens are in CP Commerce Admin (see that page for the full menu):

- **Notification** → listing, *Create*, *Edit* (Details tab with **Publish Now**; *Scheduled* tab; *Posts* sub-listing with Main / Manage Image).
- **Topics** → listing, *Create*, *Edit* (Details; Manage Image; **Member Label Link** — which member labels auto-subscribe to this topic).
- **Website** → edit → the *Default Topic* drop-down and the *Restrict Notification by Member* checkbox.

The previous screenshots on this page showed a live database row and a real customer's Firebase console and have been withdrawn; recaptures on a demo Firebase project are wanted.

## Configuration

### Before you can use it

1. **A Firebase project** with *Cloud Messaging API (V1)* enabled, one Android app and one iOS app registered under the package name / bundle ID your app build uses, and — for iOS — an APNs authentication key uploaded under *Cloud Messaging → Apple app configuration*. Download `google-services.json` and `GoogleService-Info.plist` from that project.
2. **A service account for that project** (Firebase console → *Project settings → Service accounts → Generate new private key*). The downloaded JSON is what the backend needs — see the next section.
3. **A Website record** in CP Commerce Admin for the storefront, with a code; the mobile app sends this code as the `websiteCode` header on every call, and the backend uses it to find the credential.
4. **At least one Topic** for the website. If you want every app install to receive notifications without signing in, also set it as the website's *Default Topic* (below).
5. **CMS notification permissions** for the user who publishes — see *Feature visibility / permissions*.

### The Firebase credential on the Website record

The backend does not use a Firebase server key or a platform-wide credential for Customer Portal pushes. It reads the **service-account JSON stored on the website itself**: `CmsWebsiteService.getWebsitePushNotificationConnectionCred()` returns `bl_cms_website_hdr.property_json` for the website code, and `FirebaseAkaunService.getFirebaseConnString()` takes the object under the `firebase` key and requires all eleven service-account fields to be present and non-null:

`type`, `project_id`, `private_key_id`, `private_key`, `client_email`, `client_id`, `auth_uri`, `token_uri`, `auth_provider_x509_cert_url`, `client_x509_cert_url`, `universe_domain`

If any is missing or null the call fails with `INCORRECT_CONFIGURATION_WEBSITE_CONFIG_FIREBASE`. The value is the service-account file pasted verbatim under one key:

```json
{
  "firebase": {
    "type": "service_account",
    "project_id": "<your-firebase-project-id>",
    "private_key_id": "…",
    "private_key": "-----BEGIN PRIVATE KEY-----\n…\n-----END PRIVATE KEY-----\n",
    "client_email": "firebase-adminsdk-…@<project>.iam.gserviceaccount.com",
    "client_id": "…",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url": "…",
    "universe_domain": "googleapis.com"
  }
}
```

{{< callout type="warning" >}}
**No screen writes this value.** The CP Commerce Admin applet has no field for `property_json.firebase` (the applet source contains no reference to Firebase at all), so the credential is placed on the website row by BigLedger support. Literal `\n` sequences inside `private_key` are unescaped by the backend, so the JSON can be pasted exactly as downloaded. Treat the row as a secret: it is a private key.
{{< /callout >}}

Two facts about how the credential is used matter operationally:

- The backend initialises one Firebase app instance per **tenant code + website code** and reuses it for as long as the API process runs (`getFirebaseApp()` returns the existing instance and only reads the row again when none exists). A rotated key on the website row takes effect after the API restarts, not immediately.
- Each website can point at its own Firebase project. A notification for website A is sent with website A's credential to topic names prefixed with website A's code, so an app build registered with project B never receives it.

### Website settings that control subscriptions

Set on *CP Commerce Admin → Website → edit*. They are saved as website extension rows (`bl_cms_website_ext`) and read by both the admin applet and the mobile app. Anyone with access to the Website edit screen can change them.

| Setting (UI) | Stored as | What it controls | Default | Effect when changed |
|---|---|---|---|---|
| **Default Topic** | ext `SYS_AKN_WEB_CP_COMMERCE_DEFAULT_TOPIC_HDR` (topic GUID) | The topic every app install subscribes to on first launch, without signing in, when notifications are not restricted to members. | empty — no automatic subscription | New installs subscribe to the new topic; existing devices keep their old subscriptions until they re-register. |
| **Restrict Notification by Member** | ext `RESTRICT_NOTIFICATION_BY_MEMBER` (string `true` / `false`) | `false`: the device subscribes to the Default Topic anonymously as soon as it has a token. `true`: nothing is subscribed until the customer signs in; then the member's label-linked topics (plus the backend's DEFAULT topic) are restored for the new device token. | unchecked (`false`) | Existing anonymous subscriptions are not removed by flipping it; they stay until the token is refreshed. |

Note the two different notions of "default topic": the app subscribes to the **website's Default Topic** (the ext above), while the backend's member-restore path (`MemberLabelTopicService.reSubMemberToTopic`) adds the topic whose **Description is literally `DEFAULT`** (`CmsTopicUow.retrieveDefaultTopicGuid`, query `topic_description = 'DEFAULT'`) and throws `NO DEFAULT TOPIC IS DEFINED FOR THIS TENANT. KINDLY MAKE SURE 'DEFAULT' TOPIC IS SET.` when there is none. Give the same topic both roles.

### Topic naming in FCM

The FCM topic a device is subscribed to, and a notification is sent to, is built as `<websiteCode>.<topicGuid>.<topicCode>` (`FirebaseAkaunService.constructTopic` + `CmsTopicContainer.constructTopicName`). Renaming a topic's code therefore changes the FCM topic; devices subscribed under the old code stop receiving until they re-subscribe.

### App build

The Customer Portal app (`wavelet-cp-commerce`, Ionic 7 / Angular 19 / Capacitor 5) uses `@capacitor/push-notifications` 5.1. The base repository ships with placeholder app IDs; each customer build sets its own and adds:

- `capacitor.config.ts` → `plugins.PushNotifications.presentationOptions: ["badge", "sound", "alert"]` (how a foreground notification is shown).
- `android/app/google-services.json` — the Android Gradle build applies the Google Services plugin only when this file exists; without it the build succeeds and pushes silently do not work.
- `ios/App/App/GoogleService-Info.plist`, plus the *Push Notifications* and *Background Modes → Remote notifications* capabilities in Xcode and a provisioning profile that includes push.
- `environment.isApp = true`. The base repository has `isApp: false` in every environment file; the effects that subscribe to the Default Topic and restore a member's subscriptions on a new token run only when this flag is true, so a web build never subscribes anything.

There is no BigLedger applet setting for any of this; the shared *Application Settings* screen of CP Commerce Admin has no notification keys.

### Feature visibility / permissions

The notification endpoints (`core2/tnt/dm/cms/notifications/…`) check `API_TNT_DM_CMS_NOTIFICATION_OWNER` / `_ADMIN` or the targeted `API_TNT_DM_CMS_NOTIFICATION_CREATE` (create, **publish**, initialise processors), `_UPDATE`, `_DELETE`, `_READ`. Assign them through *CP Commerce Admin → Settings → Permission Set / Role Permission*. The subscription endpoints the app calls (`cms/topic-subscriptions/public-ep`, `member-device-restore/public-ep`, `refresh-device-token/public-ep`) are anonymous public endpoints keyed by the `websiteCode` header; the app has no permission to manage.

## Fields

### Notification — Create / Details

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Title | FCM notification title. | Yes | |
| Select Website | Website whose credential and topic list are used. | Yes | Changing it reloads the Topic list. |
| Select Topic | Topic (of that website) the message is sent to. | Yes | Backend rejects a missing/unknown topic (`CMS_NOTIFICATION_HDR_OBJECT_TOPIC_GUID_IS_NULL` / `_DOES_NOT_EXIST`). |
| Status | Record status. | Yes | |
| Link Type | What a tap opens: a layout instance (page), a post, or an external URL. | No | Drives the read-only *Deeplink URL*. |
| Layout Instance + Query Parameters | Page of the website to open, with optional query values. | No | Shown for the layout link type. |
| Select Post | CMS post to link; its **first image** becomes the notification image. | No | Image URL is built as `<domain>core2/tnt/dm/cms/posts/file/public/<imageGuid>`. |
| External URL | Opens outside the app. | No | max 255. |
| Deeplink URL | Computed from the choices above. | — | Read-only; sent as FCM `data.deeplink_url`. |
| Description | FCM notification body. | No | |
| **Publish Now** (button) | Sends immediately. | — | Disabled while the form is invalid; toast *"Please select webite before publishing!"* when no website is selected. |

### Notification — Scheduled tab

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Website | Website whose credential the scheduler will use. | Yes | Scheduler row `website_hdr_guid`. |
| Code | Your reference for the schedule. | No | |
| Scheduled Datetime | When to send. | Yes | Stored as `next_execution_date`. The backend supports recurring schedules (`is_recurring` + `rrule`), but the applet form exposes only a single date-time. |

### Topic — Create

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Topic Code | Part of the FCM topic name. | Yes | Changing it later changes the FCM topic (see *Topic naming*). |
| Topic Name | Shown in the app's topic list and the admin drop-downs. | Yes | |
| Status | Record status. | Yes | |
| Description | Free text — set to exactly `DEFAULT` on the topic the backend should treat as the member default. | No | See *Website settings*. |

## Lifecycle and effects

Push notifications are not documents: nothing posts, no stock or GL is touched. What happens on each action:

**Publish Now** → `POST …/cms/notifications/publish/backoffice-ep` with the `websiteCode` header (missing header → `Kindly Provide the appropriate websiteCode`). `CmsNotificationService.publishNotification()` marks the notification published, loads the website credential, loads the topic (`TOPICHDR_DOESNOTEXIST` if gone), builds the FCM message (title, body, first post image, `deeplink_url` in `data`) and sends it to the topic. On completion it enqueues `NOTIFICATION_READ_STATUS_LINK_GENERATOR` (run now), which inserts one `bl_cms_user_notification_link` row (read/unread) per subscriber of the topic — this is what the app's in-app notification list reads.

`FirebaseAkaunService.pushToTopic()` catches every FCM exception and returns its message in the response body instead of failing the request, so the read-status rows are generated even when FCM rejected the send. Check the response message, not just the HTTP status.

**Scheduled** → a `bl_cms_notification_scheduler` row. `NotificationSchedulerProcessor` (queue `NOTIFICATION_SCHEDULER_PROCESSOR`, driven by the tenant crontab) picks every row with `next_execution_date <= NOW()` and status not DELETED, publishes exactly as above using the row's website, then either advances `next_execution_date` by the RRULE (recurring) or terminates the schedule (one-off). A row whose notification has been deleted is logged and skipped.

**Device side** (`wavelet-cp-commerce`, app builds only): on start the app checks permission → prompts → `PushNotifications.register()` → on the `registration` event stores the FCM token in local storage under `DEVICE_TOKEN` (kept across logout: `logUserOut()` clears storage and puts the token back). Then, if *Restrict Notification by Member* is `false` and a *Default Topic* is set and not yet subscribed, it opens a public session and calls `POST cms/topic-subscriptions/public-ep` for that topic. On sign-in (or when restricted) it loads the member's subscriptions and calls `PUT …/member-device-restore/public-ep`, which unsubscribes the member's outdated device tokens from FCM, deletes their rows, and re-subscribes the member's label-linked topics plus the DEFAULT topic under the new token (`CmsTopicSubscriptionService.handleTopicSubscriptionContainer`, `MemberLabelTopicService.reSubMemberToTopic`). Unsubscribing a topic in the app calls `DELETE …/topic-subscriptions/unsubscribe/login-ep`.

**Tap on a notification** → `pushNotificationActionPerformed` → if `data.deeplink_url` is present the app navigates to it; otherwise it just opens.

**Member Label Link on a topic** → `MemberLabelTopicAssignmentProcessor` subscribes every member carrying that label (with a stored device token) to the topic; removing the link unsubscribes them.

## Related applets

- [CP Commerce Admin](/applets/ecommerce/cp-commerce-admin-applet/) — the applet this feature belongs to; Website, Topics and Notification menus.
- [Membership Admin](/applets/membership/membership-admin-applet/) — member classes and labels that the Topic → Member Label Link uses to build segments.
- [Customer](/applets/master-data/customer-applet/) — the customer / member records that carry the labels.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| Publish (or any subscribe call) fails with `INCORRECT_CONFIGURATION_WEBSITE_CONFIG_FIREBASE` | `bl_cms_website_hdr.property_json.firebase` is missing, or one of the eleven service-account keys is absent or null (a common one is `universe_domain`, missing from older service-account downloads). | Paste the complete, current service-account JSON under `firebase`; ask support to update the website row. |
| `Kindly Provide the appropriate websiteCode` / toast *Please select webite before publishing!* | Publish was requested without a website. | Select the website on the notification, save, publish again. |
| `TOPICHDR_DOESNOTEXIST` on publish | The topic was deleted after the notification was created. | Re-select a live topic. |
| Publish returns OK but nobody receives anything; the response body carries an FCM error | `pushToTopic()` returns the FCM error as a message, not an HTTP error. Typical messages: credential for the wrong project, Cloud Messaging API not enabled, service account without the *Firebase Cloud Messaging API* role. | Read the response message; fix the Firebase project or credential. |
| Devices never subscribe to the Default Topic | Either the Website has no *Default Topic*, *Restrict Notification by Member* is `true`, or the build is not an app build (`environment.isApp` false) — the subscription effects are gated on all three. | Set the Default Topic, untick the restriction (or accept members-only), confirm the app build's environment file. |
| `NO DEFAULT TOPIC IS DEFINED FOR THIS TENANT. KINDLY MAKE SURE 'DEFAULT' TOPIC IS SET.` on sign-in / device restore | No topic has Description exactly `DEFAULT`; the backend looks at the topic description, not the website's Default Topic. | Set the description of the default topic to `DEFAULT`. |
| `TOPIC_MANAGEMENT_RESPONSE_ERROR` when subscribing | FCM refused the token: stale/invalid token, or the token was issued by an app registered under a different Firebase project than the website credential. | Reinstall or re-register the app; make sure the build's `google-services.json` / `GoogleService-Info.plist` come from the same project as the website credential. |
| Rotated the service-account key but the old one is still used | The Firebase app instance is cached per tenant + website for the life of the API process. | Restart / redeploy the API after changing the row. |
| Android: no token, `google-services.json not found, Push Notifications won't work` in the build log | The file is not at `android/app/google-services.json`, or the package name differs from the one registered in Firebase. | Place the file; match the package name. Test on a physical device — emulators without Google Play services get no token. |
| iOS: no token / notifications never arrive | No APNs authentication key uploaded in Firebase Cloud Messaging, missing *Push Notifications* / *Background Modes* capability, or a provisioning profile without push. | Upload the APNs key, add the capabilities, rebuild with a push-enabled profile; test on a physical device. |
| Notifications stop after a topic code was changed | The FCM topic name embeds the topic code. | Have devices re-subscribe (new token or re-login), or revert the code. |
| Scheduled notification did not go out at the exact minute | The scheduler processor runs on the tenant crontab and sends everything whose `next_execution_date` has passed at that run. | Expect a delay up to one crontab interval; check that the scheduler row is not DELETED and its notification still exists. |

## Related documentation

- [CP Commerce Admin](/applets/ecommerce/cp-commerce-admin-applet/) — Notification, Topics, Website settings, permissions.
- [E-Commerce module](/modules-v2/ecommerce/)
- [Capacitor Push Notifications plugin](https://capacitorjs.com/docs/apis/push-notifications) and [Firebase Cloud Messaging](https://firebase.google.com/docs/cloud-messaging) — vendor documentation for the native side.
