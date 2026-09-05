---
topic: push-notifications
aliases: [FCM, Firebase Cloud Messaging, CP Commerce notifications, mobile app notifications, topic subscription]
applets: [cp_commerce_admin_console_v1]
modules: [ecommerce, membership]
related: [cp-commerce-admin-applet, membership-admin-applet, customer-applet, mobile-app-management, website-builder]
wiki:
  - content/en/applets/ecommerce/cp-commerce/push-notification-configuration.md
  - content/en/applets/ecommerce/cp-commerce-admin-applet.md
status: growing
updated: 2026-09-05
---

# Push notifications (Customer Portal mobile app)

A feature of CP Commerce Admin, not an applet. A notification written under *Notification* is sent by the backend through Firebase Cloud Messaging to every device subscribed to the chosen topic of one website; the Customer Portal app registers the device, stores the token, subscribes to topics and opens the deep link on tap.

## Facts

- 2026-09-05 — There is no registry row for push notifications; the only Commerce applet is `cp_commerce_admin_console_v1` (CP Commerce Admin). The page is a feature sub-page of that applet. [src:planning/private/registry-applets-2026-09-05.tsv]
- 2026-09-05 — The only push handler is Firebase: `PushNotificationManager` maps `FIREBASE_MESSAGING` → `FirebaseAkaunService`. [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/pushNotification/PushNotificationManager.java]
- 2026-09-05 — Credential is per website: `CmsWebsiteService.getWebsitePushNotificationConnectionCred()` returns `bl_cms_website_hdr.property_json` for the `websiteCode`; `FirebaseAkaunService.getFirebaseConnString()` requires the `firebase` object to hold all 11 service-account keys (type, project_id, private_key_id, private_key, client_email, client_id, auth_uri, token_uri, auth_provider_x509_cert_url, client_x509_cert_url, universe_domain), non-null, else throws `INCORRECT_CONFIGURATION_WEBSITE_CONFIG_FIREBASE`; `\n` in private_key is unescaped. [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/CmsWebsiteService.java] [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/infra/google/firebase/FirebaseAkaunService.java]
- 2026-09-05 — No screen in the admin applet writes `property_json.firebase` (the applet source has no "firebase" string). Support sets it on the row. [src:blg-applets-wavelet-cp-commerce/micro-fe/projects/akaun-platform/applets/cp-commerce-admin-applet/src/app] [src:gh:bigledger/blg-wiki#207]
- 2026-09-05 — `FirebaseApp` instance is cached per `tenantCode.websiteCode` and only re-read from the row when no instance exists → a rotated key needs an API restart. [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/infra/google/firebase/FirebaseAkaunService.java]
- 2026-09-05 — FCM topic name = `<websiteCode>.<topicGuid>.<topicCode>`; changing a topic code changes the FCM topic. [src:blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/model/CmsTopicContainers/CmsTopicContainer.java] [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/infra/google/firebase/FirebaseAkaunService.java]
- 2026-09-05 — Publish = `POST cms/notifications/publish/backoffice-ep` with `websiteCode` header (else "Kindly Provide the appropriate websiteCode"), perm `API_TNT_DM_CMS_NOTIFICATION_CREATE` (or OWNER/ADMIN). Message = title, description as body, first image of the linked post, `data.deeplink_url`. On completion queues `NOTIFICATION_READ_STATUS_LINK_GENERATOR` → one `bl_cms_user_notification_link` per subscriber. `pushToTopic()` catches FCM exceptions and returns the message in the body — the request does not fail and the read-status rows are still generated. [src:blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/cms/cmsNotification/CmsNotificationController.java] [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/CmsNotificationService.java]
- 2026-09-05 — Scheduler: `bl_cms_notification_scheduler` rows with `next_execution_date <= NOW()` are published by `NotificationSchedulerProcessor` (queue `NOTIFICATION_SCHEDULER_PROCESSOR`, crontab); recurring rows advance by RRULE, one-off rows are terminated. The applet's Scheduled form exposes only Website, Code, Scheduled Datetime — no recurrence control. [src:blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/cmsNotifications/NotificationSchedulerProcessor.java] [src:blg-applets-wavelet-cp-commerce/micro-fe/projects/akaun-platform/applets/cp-commerce-admin-applet/src/app/components/notification-container/notification-edit/scheduled/scheduled-details/scheduled-details.component.html]
- 2026-09-05 — Website settings: *Default Topic* = ext `SYS_AKN_WEB_CP_COMMERCE_DEFAULT_TOPIC_HDR`; *Restrict Notification by Member* = ext `RESTRICT_NOTIFICATION_BY_MEMBER` stored as string 'true'/'false' (default unchecked). [src:blg-applets-wavelet-cp-commerce/micro-fe/projects/akaun-platform/applets/cp-commerce-admin-applet/src/app/components/website-container/website-edit/website-edit.component.ts] [src:blg-applets-wavelet-cp-commerce/micro-fe/projects/akaun-platform/applets/cp-commerce-admin-applet/src/app/state-controllers/website-controllers/store/effects/website.effects.ts]
- 2026-09-05 — Two "defaults": the app subscribes to the website ext topic; the backend member-restore path uses `CmsTopicUow.retrieveDefaultTopicGuid` = `bl_cms_topic_hdr.topic_description = 'DEFAULT'` and throws "NO DEFAULT TOPIC IS DEFINED FOR THIS TENANT. KINDLY MAKE SURE 'DEFAULT' TOPIC IS SET." [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/CmsTopicUows/CmsTopicUow.java] [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/MemberLabelTopicService.java]
- 2026-09-05 — App flow (base repo @247243251): checkPermissions → prompt → register → token stored in localStorage `DEVICE_TOKEN` (survives logout) → if restrict = 'false' and Default Topic set and not subscribed → public session → `POST cms/topic-subscriptions/public-ep`. On login / restricted: `PUT …/member-device-restore/public-ep` unsubscribes outdated tokens and re-subscribes label-linked topics + DEFAULT. Effects gated by `environment.isApp`, which is `false` in the base repo and `true` in the customer app builds. [src:wavelet-cp-commerce/src/app/domain-controller-module/mobile-native/push-notification-controller/effects/push-notification.effects.ts] [src:wavelet-cp-commerce/src/app/state-controllers/push-notification-store/effects/notification-topic-management.effect.ts] [src:wavelet-cp-commerce/src/environments/environment.prod.ts] [src:customer-repo-fa3ee2/src/environments/environment.prod.ts]
- 2026-09-05 — Tap → `pushNotificationActionPerformed` → navigate to `data.deeplink_url` if present. [src:wavelet-cp-commerce/src/app/domain-controller-module/mobile-native/push-notification-controller/effects/push-notification.effects.ts]
- 2026-09-05 — Member Label Link on a topic → `MemberLabelTopicAssignmentProcessor` subscribes members with a stored device token; members without a token are skipped with a log line; deleting the link unsubscribes. [src:blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/cmsNotifications/MemberLabelTopicAssignmentProcessor.java] [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/CmsTopicSubscriptionService.java]
- 2026-09-05 — Native side: `@capacitor/push-notifications` 5.1.0; app builds set `PushNotifications.presentationOptions ["badge","sound","alert"]`, `android/app/google-services.json`, `ios/App/App/GoogleService-Info.plist`; the base repo has placeholder app IDs and no PushNotifications plugin block. [src:wavelet-cp-commerce/capacitor.config.ts] [src:wavelet-cp-commerce/package.json] [src:customer-repo-fa3ee2/capacitor.config.ts]
- 2026-09-05 — A separate platform-level Firebase credential exists from env vars (`FIREBASE_PRIVATE_KEY`, `FIREBASE_PROJECT_ID`, `FIREBASE_CLIENT_EMAIL`, `FIREBASE_CLIENT_ID` in `FirebaseAuthService`) used by `FirebaseNotificationService` — not the CP Commerce path. [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/infra/google/firebase/FirebaseAuthService.java]
- 2026-09-05 — The old wiki page was a build guide for one customer's white-label app and carried that customer's name, bundle IDs, Firebase project id/number, OAuth client id and app ids; its DB screenshot showed a real service-account e-mail, client id, private_key_id and the head of the private key; the Firebase console screenshots named a second customer, a staff e-mail, project numbers, APNs key IDs, Team ID and App Store ID. All removed / withdrawn. [src:git:blg-wiki@163d8446] [src:gh:bigledger/wavelet-cp-commerce#355]

## How it connects

- **cp-commerce-admin-applet** — owns every screen (Website, Topics, Notification, Scheduled, permissions); this topic is its notification feature.
- **membership-admin-applet** / **customer-applet** — member labels drive topic subscriptions; a member without a stored device token is never subscribed.
- **mobile-app-management** — App Version enforcement and the per-customer app build (Firebase config files, `isApp`) live together.
- **website-builder** — same Website record; the `property_json` column also carries other website properties.

## Open questions

- Should CP Commerce Admin get a Website field (masked) for the Firebase service-account JSON so support does not edit `property_json` by hand?
- Should `pushToTopic()` propagate FCM failures as an error instead of a 200 with a message, and should the read-status rows be skipped on failure?
- Should the backend's DEFAULT topic (by description) and the website's Default Topic ext be unified?
- Should the cached `FirebaseApp` be invalidated when the website row changes (key rotation without restart)?

## Wiki impact

- `content/en/applets/ecommerce/cp-commerce-admin-applet.md` — Related documentation line should read "Firebase credential, subscription settings and publish flow", not "Firebase setup for the mobile app"; the Notifications section could link the Website's Default Topic / Restrict Notification by Member to subscription behaviour.
- A user guide for marketing staff (post + scheduled notification per week, gh:bigledger/wavelet-cp-commerce#56/#45) does not exist.
- `static/images/push-notifications/*.jpg` (5 files) must be quarantined — real credentials and customer identifiers.
