---
title: "Delivery Installation applet"
description: "Back-office logistics applet for dispatch teams: turns delivered lines of Sales Orders, Sales Invoices, Delivery Orders and imported Shipments into delivery Jobs, groups them onto Trips with a driver and vehicle, and tracks every status change as a job event"
applet_code: "delivery-installation-applet"
applet_repo: "blg-applet-wavelet-delivery-installation-applet-V2"
modules: [inventory]
related_applets: [delivery-installation-driver-applet, driver-delivery-order-applet, internal-sales-order-applet, internal-sales-invoice-applet, internal-delivery-order-applet, organisation-applet, employee-applet]
guides: [/guides/sales-guides/installation-scheduling-workflow/, /guides/sales-guides/partial-delivery-workflow/]
sources:
  screens:
    - blg-applet-wavelet-delivery-installation-applet-V2/micro-fe/projects/wavelet-erp/applets/delivery-installation-applet-V2/src/app/app.routing.ts
    - blg-applet-wavelet-delivery-installation-applet-V2/micro-fe/projects/wavelet-erp/applets/delivery-installation-applet-V2/src/app/shared/menu-items.ts
    - blg-applet-wavelet-delivery-installation-applet-V2/micro-fe/projects/wavelet-erp/applets/delivery-installation-applet-V2/src/app/components/trip-container/edit/edit.component.html
  configuration:
    - blg-applet-wavelet-delivery-installation-applet-V2/micro-fe/projects/wavelet-erp/applets/delivery-installation-applet-V2/src/app/components/settings-container/application-settings/application-settings.component.ts
    - blg-applet-wavelet-delivery-installation-applet-V2/micro-fe/projects/wavelet-erp/applets/delivery-installation-applet-V2/src/app/components/settings-container/application-settings/application-settings.component.html
    - blg-applet-wavelet-delivery-installation-applet-V2/micro-fe/projects/wavelet-erp/applets/delivery-installation-applet-V2/src/app/components/settings-container/left-menu-items/left-menu-items.component.ts
    - blg-applet-wavelet-delivery-installation-applet-V2/micro-fe/projects/wavelet-erp/applets/delivery-installation-applet-V2/src/app/components/settings-container/left-menu-items/left-menu-items.component.html
    - blg-applet-wavelet-delivery-installation-applet-V2/micro-fe/projects/wavelet-erp/applets/delivery-installation-applet-V2/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-delivery-installation-applet-V2/micro-fe/projects/wavelet-erp/applets/delivery-installation-applet-V2/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-wavelet-delivery-installation-applet-V2/micro-fe/projects/wavelet-erp/applets/delivery-installation-applet-V2/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-applet-wavelet-delivery-installation-applet-V2/micro-fe/projects/wavelet-erp/applets/delivery-installation-applet-V2/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-delivery-installation-applet-V2/micro-fe/projects/wavelet-erp/applets/delivery-installation-applet-V2/src/app/models/constants/printable-format-constants.ts
    - blg-applet-wavelet-delivery-installation-applet-V2/micro-fe/projects/wavelet-erp/applets/delivery-installation-applet-V2/src/app/state-controllers/reason-settings-controller/store/effects/reason-settings.effects.ts
    - blg-applet-wavelet-delivery-installation-applet-V2/micro-fe/projects/wavelet-erp/applets/delivery-installation-applet-V2/src/app/state-controllers/printable-format-controller/store/effects/printable-format.effects.ts
    - blg-applet-wavelet-delivery-installation-applet-V2/micro-fe/projects/wavelet-erp/applets/delivery-installation-applet-V2/src/app/components/settings-container/custom-status-settings-container/custom-status-settings-listing/custom-status-settings-listing.component.ts
    - blg-applet-wavelet-delivery-installation-applet-V2/micro-fe/projects/wavelet-erp/applets/delivery-installation-applet-V2/src/app/components/shipment-container/listing/listing.component.ts
    - blg-applet-wavelet-delivery-installation-applet-V2/micro-fe/projects/wavelet-erp/applets/delivery-installation-applet-V2/src/app/components/jobs-shipment-container/listing/listing.component.ts
    - blg-applet-wavelet-delivery-installation-applet-V2/micro-fe/projects/wavelet-erp/applets/delivery-installation-applet-V2/src/app/components/jobs-shipment-container/listing/listing.component.html
    - blg-applet-wavelet-delivery-installation-applet-V2/micro-fe/projects/wavelet-erp/applets/delivery-installation-applet-V2/src/app/components/jobs-shipment-container/edit/edit.component.html
    - blg-applet-wavelet-delivery-installation-applet-V2/micro-fe/projects/wavelet-erp/applets/delivery-installation-applet-V2/src/app/components/jobs-sales-order-container/listing/listing.component.ts
    - blg-applet-wavelet-delivery-installation-applet-V2/micro-fe/projects/wavelet-erp/applets/delivery-installation-applet-V2/src/app/components/jobs-sales-invoice-container/listing/listing.component.ts
    - blg-applet-wavelet-delivery-installation-applet-V2/micro-fe/projects/wavelet-erp/applets/delivery-installation-applet-V2/src/app/components/job-delivery-order-container/job-delivery-order-listing/job-delivery-order-listing.component.ts
    - blg-applet-wavelet-delivery-installation-applet-V2/micro-fe/projects/wavelet-erp/applets/delivery-installation-applet-V2/src/app/components/trip-container/listing/listing.component.html
    - blg-applet-wavelet-delivery-installation-applet-V2/micro-fe/projects/wavelet-erp/applets/delivery-installation-applet-V2/src/app/components/utilities/advanced-search-v2/advanced-search-v2.component.ts
    - blg-applet-wavelet-delivery-installation-applet-V2/micro-fe/projects/wavelet-erp/applets/delivery-installation-applet-V2/src/app/components/trip-container/edit/job-container/edit/job-items-container/edit/job-items-line-container/edit/edit.component.ts
    - blg-applet-wavelet-delivery-installation-applet-V2/micro-fe/projects/wavelet-erp/applets/delivery-installation-applet-V2/src/app/components/driver-container/edit/edit.component.ts
  fields:
    - blg-applet-wavelet-delivery-installation-applet-V2/micro-fe/projects/wavelet-erp/applets/delivery-installation-applet-V2/src/app/components/trip-container/create/create.component.ts
    - blg-applet-wavelet-delivery-installation-applet-V2/micro-fe/projects/wavelet-erp/applets/delivery-installation-applet-V2/src/app/components/trip-container/edit/edit.component.ts
    - blg-applet-wavelet-delivery-installation-applet-V2/micro-fe/projects/wavelet-erp/applets/delivery-installation-applet-V2/src/app/components/shipment-container/create/main-details/main-details.component.ts
    - blg-applet-wavelet-delivery-installation-applet-V2/micro-fe/projects/wavelet-erp/applets/delivery-installation-applet-V2/src/app/components/jobs-shipment-container/edit/edit.component.ts
    - blg-applet-wavelet-delivery-installation-applet-V2/micro-fe/projects/wavelet-erp/applets/delivery-installation-applet-V2/src/app/components/driver-container/create/create.component.ts
    - blg-applet-wavelet-delivery-installation-applet-V2/micro-fe/projects/wavelet-erp/applets/delivery-installation-applet-V2/src/app/components/vehicle-container/create/create.component.ts
    - blg-applet-wavelet-delivery-installation-applet-V2/micro-fe/projects/wavelet-erp/applets/delivery-installation-applet-V2/src/app/components/delivery-region-container/create/create.component.ts
    - blg-applet-wavelet-delivery-installation-applet-V2/micro-fe/projects/wavelet-erp/applets/delivery-installation-applet-V2/src/app/components/logistic-hub-container/create/logisitic-hub-main-details/logisitic-hub-main-details.component.ts
    - blg-applet-wavelet-delivery-installation-applet-V2/micro-fe/projects/wavelet-erp/applets/delivery-installation-applet-V2/src/app/components/settings-container/custom-status-settings-container/custom-status-settings-create/custom-status-settings-create.component.ts
    - blg-applet-wavelet-delivery-installation-applet-V2/micro-fe/projects/wavelet-erp/applets/delivery-installation-applet-V2/src/app/components/settings-container/reason-settings-container/reason-settings-create/reason-settings-create.component.ts
    - blg-applet-wavelet-delivery-installation-applet-V2/micro-fe/projects/wavelet-erp/applets/delivery-installation-applet-V2/src/app/components/settings-container/printable-settings-container/printable-settings-create/printable-settings-create.component.ts
  lifecycle:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/DeliveryStatusConstant.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/job/JobsController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/trip/TripsController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/DeliveryShipmentHdrController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JobsService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/TripsService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/DeliveryShipmentHdrService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/job/JobsDocController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/JobUows/JobsUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/del/DeliveryJobEventUpdateActionService.java
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/delivery/shipment-services/delivery-shipment-hdr.service.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/delivery/trip-services/delivery-trip-hdr.service.ts
  troubleshooting:
    - blg-applet-wavelet-delivery-installation-applet-V2/micro-fe/projects/wavelet-erp/applets/delivery-installation-applet-V2/src/app/state-controllers/reason-settings-controller/store/effects/reason-settings.effects.ts
    - blg-applet-wavelet-delivery-installation-applet-V2/micro-fe/projects/wavelet-erp/applets/delivery-installation-applet-V2/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-delivery-installation-applet-V2/micro-fe/projects/wavelet-erp/applets/delivery-installation-applet-V2/src/app/components/vehicle-container/listing/listing.component.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JobsService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/JobUows/JobsUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/DeliveryShipmentHdrService.java
    - gh:bigledger/blg-wiki#54
tags:
- logistics
- delivery-management
- field-service
- trip-planning
- installation-tracking
weight: 185
---

## Overview

The Delivery Installation applet is the back-office dispatch console of BigLedger's delivery module. It takes the lines that are due for delivery from finalised **Sales Orders**, **Sales Invoices** and **Delivery Orders** (through the pick-pack queue those documents create), or from **Shipments** that were keyed in or imported from a file, and turns them into **delivery Jobs**. A dispatcher groups Jobs onto a **Trip** with a driver, a vehicle and a delivery region, then follows the trip through *Delivery Arranged → Ready To Ship → Out For Delivery → Complete* (or *Cancelled*). Every status change is written as a job event, and the same status is rolled up to the source document and shipment so Sales and Customer Service see delivery progress without opening this applet.

Drivers do not work in this applet: they update their jobs in the [Delivery And Installation Driver](/applets/delivery-installation/delivery-installation-driver-applet/) applet (and its mobile build), which calls the same backend endpoints under the `login-driver-ep` path.

{{< callout type="info" >}}
**Three objects.** A **Job** is *what* must be delivered (one job per source document, with one job line per document line). A **Shipment** is a physical consignment that can stand in for a source document. A **Trip** is *who, when and with which vehicle* — the run sheet a driver executes.
{{< /callout >}}

## Where it fits

| Direction | Applet / object | Relationship |
|---|---|---|
| Upstream | [Sales Order (Internal)](/applets/sales-workflow/internal-sales-order-applet/), [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [Delivery Order (Internal)](/applets/sales-workflow/internal-delivery-order-applet/) | A FINAL document with a delivery type puts its lines in the pick-pack queue (`bl_fi_pick_pack_queue`); the *Job Sales Order / Job Sales Invoice / Job Delivery Order* screens create jobs from that queue and consume the balance quantity. |
| Upstream | Shipment (this applet) — keyed in, imported from a file, or pushed by an external warehouse integration | *Create Jobs* on the Shipment listing turns a shipment into a job (`delivery-shipment-hdr/backoffice-ep/create-jobs-from-shipment`). |
| Master data | [Organisation](/applets/master-data/organisation-applet/) (company, branch, location), [Employee](/applets/master-data/employee-applet/) | Trips and shipments are keyed by branch/location; drivers are separate delivery-module records, optionally linked to a login by e-mail. |
| Downstream | [Delivery And Installation Driver](/applets/delivery-installation/delivery-installation-driver-applet/) | Drivers see the trips created here and start/complete/return jobs; those updates appear as job events in this applet. |
| Downstream | Source document and shipment `delivery_status` | Completing or cancelling a job rolls the status up to the Sales Order / Sales Invoice / Delivery Order header and lines (`PARTIALLY DELIVERED` / `FULLY DELIVERED`) and to the shipment header. |
| Alternative | [Driver Delivery Order Applet](/applets/inventory-workflow/driver-delivery-order-applet/) | The lightweight alternative for businesses that only need one driver field on the Delivery Order, without trips and jobs. |

## Screens and menus

Left menu (in the order the applet shows them):

| Menu item | Route | What it is |
|---|---|---|
| Trip Calendar | `trip-calendar` | Month / week / day / agenda view of trips, filterable by driver, vehicle or region. New trips can be started from the `+` button. |
| Trips | `trip-listing` | The trip run sheet. Batch functions: *Printing* (Batch Print, Trip Report), trip status (*Start Trip, Complete Trip, Cancel Trip, Re-arrange Trip*) with a *Trip Status Date* the dispatcher can back-date. Opening a trip shows the **Details**, **Jobs** and **Helpers** tabs; the Jobs tab is where jobs are created from Sales Order, Sales Invoice, Delivery Order or Shipment sources. |
| Import Shipment | `file-import` | Upload a shipment file; rows are validated into an import helper listing (Item Desc, Qty, CBM, Total Weight, Customer Marking, Process Status, error messages) before shipments are created. |
| Shipment | `shipment-listing` | Shipment headers with Bal Qty, Allocate Job Qty and CBM. *Create Jobs* (Normal Mode or Path Optimization Mode with a logistic-hub network) and *Delete Jobs*. |
| Delivery Job | `job-shipment-listing` | The *Delivery Job Shipment Listing* — every job regardless of source. Batch functions: Add to Trip, Printing, Job Status, Bulk Remarks, Add Logistic Hub, Custom Status, Bulk Date Edit. Opening a job shows **Details**, **Job Items** and **Job Event** tabs. |
| Job Sales Order / Job Sales Invoice / Job Delivery Order | `sales-order-jobs`, `sales-invoice-jobs`, `job-delivery-order` | Jobs grouped by their source document type, with the same Add to Trip and Job Status functions. |
| Delivery Job Line Report | `delivery-job-line-report` | Item-level report (item, quantity, trip, vehicle, driver, job, start/end delivery, source document, customer) for a date range, printable with a Jasper format. |
| Delivery Region Listing, Vehicle Listing, Driver Listing | `delivery-region-listing`, `vehicle-listing`, `driver-listing` | Master data of the delivery module. A driver record can be linked to a BigLedger login by verifying the e-mail, or an invitation can be sent. |
| Logistic Hub, Logistic Hub Network | `logistic-hub`, `logistic-hub-network` | Transfer points and the from/to links between them, used by *Add Logistic Hub* on jobs and by Path Optimization Mode. |
| Settings | `settings/*` | Application Settings, Field Settings, Default Selection, Custom Status Settings, Return Reasons Settings, Printable Format Settings, Menu Containers, plus the shared server-side permission screens, Release Notes and Audit Trail. |
| Personalization | `personalization` | Personal Default Selection. |

{{< figure src="/images/delivery-installation-applet-V2-applet/trip-calendar-planning-view.png" alt="Trip Calendar with month, week, day and agenda views and a filter type dropdown" caption="Trip Calendar: the default landing screen; filter by driver, vehicle or region and switch between month, week, day and agenda." >}}

{{< figure src="/images/delivery-installation-applet-V2-applet/settings-configuration-center.png" alt="Applet Settings screen showing Application Settings with the Trips, Shipment, Jobs, Delivery Region, Vehicle and Driver tabs" caption="Application Settings: the Trips tab holds one toggle; the Shipment and Jobs tabs hold the column and status toggles listed below. The Delivery Region, Vehicle and Driver tabs are empty." >}}

## Configuration

### Before you can use it

- **Finalised source documents with a delivery type.** The *Job Sales Order / Job Sales Invoice / Job Delivery Order* screens read the pick-pack queue, so a [Sales Order](/applets/sales-workflow/internal-sales-order-applet/), [Sales Invoice](/applets/sales-workflow/internal-sales-invoice-applet/) or [Delivery Order](/applets/sales-workflow/internal-delivery-order-applet/) must be FINAL and have queue rows before it can become a job. Cancelling a document-sourced job adds the line quantity back to that queue (`JobsService.increaseQtyInPickPackQueue`); cancelling a shipment-sourced job adds it back to the shipment's open queue (`bl_del_shipment_processing_open_queue`).
- **Branch and location** in [Organisation](/applets/master-data/organisation-applet/): shipments carry from/to branch and location, and jobs and trips are searched by them.
- **Drivers, vehicles and delivery regions** in this applet's own listings — a trip needs a driver (or a free-text third-party driver name), a vehicle and its capacity. Drivers who will use the driver applet need an e-mail that matches an existing login (*Verify Email*) or an invitation sent from the driver record.
- **Return reasons** are stored in the applet's configuration row `bl_applet_config` with `param_code = RETURN_REASON`. The Return Reasons Settings screen appends to that row; it does not create it. If the row does not exist for the tenant, the screen cannot save (see Troubleshooting).
- **Printable formats** are Jasper JRXML files uploaded under Printable Format Settings; the upload looks up the printable format list with code `Jasper JRXML` (`printable-format.effects.ts` L31–L34), which must exist.
- **Server-side permissions.** Creating, reading and updating jobs, trips, drivers, vehicles and regions is gated by the `API_TNT_DM_DEL_*` permission families (JOBS, TRIP, DRIVER, VEHICLE, DELIVERY_REGION, JOB_ATTACHMENT, JOB_CHECKLIST_LINE, DRIVER_VEHICLE_LINK, DRIVER_REGION_LINK, …), assigned through the Permission Set / User Permission / Role Permission screens under Settings. Every status change on a trip or job (start, complete, cancel, ready to ship, add custom status) requires `API_TNT_DM_DEL_JOBS_UPDATE` or an admin permission (`TripsController.java` L275–L343, `JobsController.java` L1354–L1358).

### Applet settings

Settings live in **applet-local components** (there is no shared `FieldConfigurationComponent` section for this applet code and no inline gear). The Application Settings and Menu Containers screens save through `SessionActions.saveMasterSettingsInit` (`application-settings.component.ts` L222–L227), i.e. as the applet's tenant-wide master settings; nothing here is per-branch or per-user. Every toggle is created as `new FormControl()` with no initial value, so the default for every key is *null* (treated as off: nothing hidden, every status button shown).

**Application Settings — Trips tab**

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| `HIDE_BATCH_PRINT` | The *Batch Print* button in the Trips listing printing bar (`trip-container/listing/listing.component.html` L95). | off | On: dispatchers can still pick a printable format and print a Trip Report, but not batch-print several trips. |

**Application Settings — Shipment tab** (grid columns of the Shipment listing, `shipment-container/listing/listing.component.ts` L307–L321)

| Setting | Column hidden when on |
|---|---|
| `HIDE_SHIPMENT_NO` | Shipment No |
| `HIDE_DATE` | Shipment date |
| `HIDE_FROM_LOCATION` | From Location |
| `HIDE_SENDER`, `HIDE_SENDER_ADDRESS` | Sender, Sender address |
| `HIDE_LOGISTICS_REF_NO` | Logistics Ref No |
| `HIDE_TRACKING_ID` | Tracking ID |
| `HIDE_RECIPIENT`, `HIDE_RECIPIENT_ADDRESS` | Recipient, Recipient address |
| `HIDE_QTY`, `HIDE_BAL_QTY`, `HIDE_ALLOCATE_JOB_QTY` | Qty, Bal Qty, Allocate Job Qty |
| `HIDE_AVE_UNIT_CBM`, `HIDE_CBM` | Ave Unit CBM, CBM |
| `HIDE_PROCESS_STATUS` | Process Status |

All default off. The *Enable* checkbox and the *Process Status – Process Name Select* dropdown that appear above these toggles are not bound to any control and save nothing (`application-settings.component.html` L146–L160).

**Application Settings — Jobs tab**

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| `JS_HIDE_JOB_STATUS` (Job-Shipment sub-tab, labelled *Hide Start Job and Complete Job*) | The status dropdown on the Delivery Job listing and on the trip's Jobs tab. | off — *Ready To Ship, Start Job, Complete Job, Cancel Job* | On: only *Ready To Ship* and *Cancel Job* remain (`jobs-shipment-container/listing/listing.component.ts` L101–L103, L675); back-office users can no longer start or complete jobs, leaving that to the driver applet. |
| `SO_HIDE_JOB_STATUS` (Job-Sales Order sub-tab) | Same, for the Job Sales Order listing **and** the Job Delivery Order listing (`job-delivery-order-listing.component.ts` L478 reads the SO key; the Job-Delivery Order sub-tab is empty). | off | As above. |
| `SI_HIDE_JOB_STATUS` (Job-Invoice sub-tab) | Same, for the Job Sales Invoice listing (`jobs-sales-invoice-container/listing/listing.component.ts`). | off | As above. |
| `JS_HIDE_JOB_ID`, `JS_HIDE_JOB_TYPE`, `JS_HIDE_START_DATE`, `JS_HIDE_END_DATE`, `JS_HIDE_TRIP`, `JS_HIDE_VEHICLE`, `JS_HIDE_DRIVER`, `JS_HIDE_JOB_FROM_LOCATION`, `JS_HIDE_JOB_SENDER`, `JS_HIDE_JOB_SENDER_ADDRESS`, `JS_HIDE_JOB_LOGISTICS_REF_NO`, `JS_HIDE_JOB_TRACKING_ID`, `JS_HIDE_JOB_RECIPIENT`, `JS_HIDE_JOB_RECIPIENT_ADDRESS`, `JS_HIDE_JOB_DELIVERY_QTY`, `JS_HIDE_JOB_AVE_UNIT_CBM`, `JS_HIDE_JOB_CBM`, `JS_HIDE_JOB_PROCESS_STATUS`, `JS_HIDE_JOB_PROCESS_RESOLUTION` | One grid column each on the Delivery Job listing (`jobs-shipment-container/listing/listing.component.ts` L356 onwards). | off | Hides the column tenant-wide. Column order and width are still remembered per user (personal settings `jobsShipmentListingState`). |
| `JS_SHOW_CUSTOM_DELIVERY_DATE_FIELD` | The *Printing* bar of the Delivery Job listing. | off — *Batch Print* uses the job dates | On: a *Delivery Date* picker appears and the button becomes a custom-date batch print (`listing.component.html` L140–L167, `printMultiJasperJobShipmentCustom`). |
| `JS_FORM_HIDE_EXT_AMOUNT_FEE`, `JS_FORM_HIDE_EXT_SHIPMENT_WEIGHT`, `JS_FORM_HIDE_EXT_SHIPMENT_HEIGHT`, `JS_FORM_HIDE_EXT_SHIPMENT_LENGTH`, `JS_FORM_HIDE_EXT_SHIPMENT_WIDTH` | The *Ext Amount Fee / Ext Shipment Weight / Height / Length / Width* fields on the Edit Job Shipment form (`jobs-shipment-container/edit/edit.component.html`). | off | Hides the field. |

Two toggles on this tab do not do what their label suggests: `JS_HIDE_JOB_SHIPMENT_NO` (labelled *JS_HIDE_SHIPMENT_NO*) is saved but read by no listing, and the `JS_HIDE_JOB_SUB_PROCESS_STATUS` control is commented out of the template (L345–L348) although the key is still declared and read.

**Menu Containers** (`settings/app-left-menu-items`, `left-menu-items.component.ts`) — despite its name this screen does not configure the left menu. It holds the **Advance Search** field toggles for two listings; the Advance Search tab of Application Settings that used to hold them is commented out (`application-settings.component.html` L5–L134).

| Setting (prefix `JS_` = Delivery Job listing, `SO_` = Job Sales Order listing) | Advanced-search field hidden when on |
|---|---|
| `JS_HIDE_DELIVERY_REGION_FIELD` / `SO_HIDE_DELIVERY_REGION_FIELD` | Delivery Region |
| `JS_HIDE_SUPPLIER_FIELD` / `SO_HIDE_SUPPLIER_FIELD`, `JS_HIDE_CUSTOMER_FIELD` / `SO_HIDE_CUSTOMER_FIELD` | Supplier, Customer |
| `JS_HIDE_VEHICLE_FIELD` / `SO_…`, `JS_HIDE_TRIP_FIELD` / `SO_…` | Vehicle, Trip |
| `JS_HIDE_BRANCH_FIELD`, `JS_HIDE_BRANCH_FROM_FIELD`, `JS_HIDE_BRANCH_TO_FIELD` / `SO_…` | Branch, Branch From, Branch To |
| `JS_HIDE_LOCATION_FIELD`, `JS_HIDE_LOCATION_FROM_FIELD`, `JS_HIDE_LOCATION_TO_FIELD` / `SO_…` | Location, Location From, Location To |
| `JS_HIDE_COMPANY_FIELD` / `SO_HIDE_COMPANY_FIELD` | Company |

All default off; consumed by `advanced-search-v2.component.ts` L773–L784, keyed on the container name (`job-shipment` or `job-sales-order`). The Job Sales Invoice and Job Delivery Order searches have no such toggles.

**Other settings screens**

| Screen | What it stores | Notes |
|---|---|---|
| Custom Status Settings | Rows in `bl_del_job_custom_status_hdr` (code, name, description, optional image). | A custom status is applied to selected jobs with the *Custom Status* batch function and a date; the backend writes a job event (`JobsController.java` L1354, `JobsService.addCustomStatusToJob`). There is no limit of five statuses — the `ENABLE_CUSTOM_STATUS_LINE_1..5` / `NAME_CUSTOM_STATUS_LINE_1..5` keys are a different mechanism (see the runtime-only list below). |
| Return Reasons Settings | Entries `{code, name}` appended to `bl_applet_config.value_json.data` where `param_code = RETURN_REASON` (`reason-settings.effects.ts` L18–L45). | Duplicate codes are refused client-side with *Reason Code already exists*. Reasons are offered in the job line's *Reason for Return* field. |
| Printable Format Settings | `bl_prt_printable_format_hdr` rows with `txn_type` = `BL_DEL_TRIP_HDR`, `BL_DEL_JOB_HDR_INTERNAL_JOB_SHIPMENT`, `BL_DEL_JOB_HDR_INTERNAL_SALES_ORDER` or `BL_DEL_JOB_HDR_INTERNAL_SALES_INVOICE` (`printable-format-constants.ts`). | One tab per document type; each upload is a Jasper JRXML with a format code and name. |
| Default Selection / Personalization › Default Selection | Intended to store `DEFAULT_BRANCH` and `DEFAULT_LOCATION` in the applet's `APPLET_SETTINGS` extension. | Not functional at commit 9966d77: the component receives no applet container (`default-settings.component.ts` L31–L62 dereferences `this.appletContainer`, which is never set, and the personal variant has its loader commented out), and no screen reads `DEFAULT_BRANCH` / `DEFAULT_LOCATION`. |
| Field Settings | — | Placeholder template with unbound toggles (Unit Discount, SST/VAT/GST, WHT, Blanket Order, Segment, G/L Dimension, Profit Center, Project) and a Save button wired to nothing (`field-configuration.component.html`). No exposed control found (routes and settings components checked at commit 9966d77). |

**Keys read at runtime without a control**

- `ENABLE_CUSTOM_STATUS_LINE_1` … `_5` and `NAME_CUSTOM_STATUS_LINE_1` … `_5`: when the enable key is true the job-item grids on the trip's Jobs tab (Sales Order, Sales Invoice, Delivery Order sources) and the Job Sales Invoice listing add a column named by the matching name key, defaulting to `client_doc_status_01` … `_05` (`jobs-sales-invoice-container/listing/listing.component.ts` L184–L185, `trip-container/edit/job-container/create/sales-order/sales-order.component.ts` L164–L175). No settings screen writes these keys.
- `JS_HIDE_JOB_SUB_PROCESS_STATUS`: read by the Delivery Job listing; its toggle is commented out.
- `DEFAULT_VEHICLE` is not a setting: it is the extension key the driver form writes to `bl_del_driver_ext` (`driver-container/create/create.component.ts` L151).

### Document behaviour settings

- **Status flow** is fixed in the backend (see Lifecycle); the applet only decides which buttons are visible (`*_HIDE_JOB_STATUS`, `HIDE_BATCH_PRINT`).
- **Event time.** Job status buttons stamp the event with the current time formatted `dd MMM, HH:mm` (`getEventTimeString`, `jobs-shipment-container/listing/listing.component.ts` L528–L534). Trip status buttons and *Custom Status* let the dispatcher enter a *Trip Status Date* / custom date instead, so a completion reported late can be back-dated. The stored description has no year.
- **Printables.** Trip Report and Batch Print on Trips; Batch Print (optionally with a custom delivery date) on Delivery Job; Generate Delivery Job Line Report on the report screen. All need a printable format of the matching `txn_type`.
- **No e-Invoice, workflow or approval toggles** exist in this applet.

### Feature visibility / permissions

- **Client-side permissions:** none are seeded for this applet in `bl_applet_client_side_perm_dfn` (0 rows for code `delivery-installation-applet`), and the applet's own code checks none; hiding is done only through the master settings above.
- **Server-side permissions:** the `API_TNT_DM_DEL_*` families listed under *Before you can use it*. The *Feature Visibility*, *Webhook* and permission screens under Settings are the shared components from blg-shared-utilities.

## Fields

**Trip — Create / Details tab** (`trip-container/create/create.component.ts` L109–L124)

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Trip Name | Free-text name shown on the calendar and listings | Yes | |
| Driver Name | Driver picked from the Driver listing (`selectedDriverGuid`) | No | Either this or Third Party Driver Name. |
| Third Party Driver Name | Free text when the driver is not in the listing | No | |
| Start Date and Delivery Start Time / End Date and End Delivery Time | Trip window | Yes (both dates) | Drives the calendar placement. |
| Delivery Region | Region from the Delivery Region listing | No | |
| Vehicle Number, Vehicle Capacity | Vehicle picked from the Vehicle listing; capacity is copied from `bl_del_vehicle_hdr.vehicle_capacity` | Capacity yes | |
| Delivery Status, Process Status, Created/Modified By and Date | Read-only on the Details tab | — | `deliveryStatus` shows the backend `delivery_status`. |

**Shipment — Main tab** (`shipment-container/create/main-details/main-details.component.ts` L42–L57; Recipient and Sender tabs pick an entity and address)

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Shipment No, Tracking ID, Logistics Ref No | Identifiers; the tracking ID is what the public tracking endpoint (`delivery-shipment-hdr/public-ep/{trackingId}`) looks up | No | |
| Shipment Delivery Date | Planned date | No | |
| Item Name, Item description, Item Type, Qty, Weight, CBM | Consignment content and size | No | Bal Qty and Allocate Job Qty on the listing derive from Qty and the jobs created. |
| From/To Branch, From/To Location | Origin and destination | No | |
| External Running No., Additional Remarks | External invoice running number and free text | No | Copied to jobs created from the shipment. |

**Delivery Job — Details tab (Edit Job Shipment)** (`jobs-shipment-container/edit/edit.component.ts` L104–L119)

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Job Id | System-generated | — | Read-only |
| Delivery Region, Job Type, Status | Region, source type, delivery status | No | |
| Arrival Date, Departure Date, Start Date, End Date, Duration (in minutes) | Planned and actual timing; Arrival/Departure can also be set for many jobs with *Bulk Date Edit* | No | |
| Ext Amount Fee, Ext Shipment Weight / Height / Length / Width | External-carrier figures | No | Each can be hidden by a `JS_FORM_HIDE_EXT_*` setting. |
| External Running No., Additional Remarks, Remarks | Text | No | *Bulk Remarks* writes Remarks for many jobs. |

**Job line (Job Items tab)** — Recipient Name, Recipient IC, Recipient Contact, Remarks, Reason for Return (from the RETURN_REASON list), plus signature and photo attachments; the same fields the driver applet fills.

**Driver** (`driver-container/create/create.component.ts` L91–L109)

| Field | Required | Notes |
|---|---|---|
| Driver Name, Identity Number, License Number, Mobile, Joined Date | Yes | |
| Status | Yes | `Active` by default; values `ACTIVE` / `INACTIVE`. |
| Emergency Name, Emergency Mobile, Relationship | Yes | |
| Email | No | Used by *Verify Email* to link the driver to an existing login (`app_login_principal` by `principal_type = EMAIL_USERNAME`) or to send an invitation. |
| Address 1–5, City, Postal Code, State, Country | No | Stored as a driver extension of type ADDRESS. |

**Vehicle** — Vehicle Number, Vehicle Brand, Vehicle Model, Engine Capacity, Vehicle Capacity, Purchased Date, Status: all required (`vehicle-container/create/create.component.ts` L83–L89).

**Delivery Region** — Region Code, Delivery Region (name), Country, State, Google Location Name, Google Location URL, Radius: all required (`delivery-region-container/create/create.component.ts` L85–L91).

**Logistic Hub** — Code and Name required; Phone, Status, Description optional; an Address tab; hubs are linked from/to each other on the edit screen (`logisitic-hub-main-details.component.ts` L23–L27).

**Settings forms** — Custom Status: Code, Name, Description required, optional image. Return Reason: Reason Code and Reason Name required. Printable Format: Format Code and Format Name required plus one uploaded file.

## Lifecycle and effects

This applet posts nothing to the General Ledger and moves no stock: there is no `*DataConsistencyObject` signum, no `JournalPostingTypeHandler` and no stock processor for trips or jobs. Its effects are delivery statuses, job events and pick-pack-queue balances.

**Delivery statuses** (`DeliveryStatusConstant.java`): `DELIVERY_ARRANGED`, `READY_TO_SHIP`, `OUT_FOR_DELIVERY`, `COMPLETE`, `CANCELLED`, plus `DELIVERY_REARRANGED` / `JOB_RE_ARRANGED` for the re-arrange actions and the roll-up values `PARTIALLY DELIVERED` / `FULLY DELIVERED` that are written only to source documents and shipment headers.

| Action (button) | Endpoint | What the backend does |
|---|---|---|
| Add to Trip | `del/trips/backoffice-ep/jobs-add-trip` | Links the selected jobs to the trip and sets the trip, the jobs and their document/shipment links to `DELIVERY_ARRANGED`, writing a job event (`JobsUow.validateTripAndJobs` L1040–L1056, `JobsUow.updateDeliveryStatus` L1088–L1093). This is the only place the initial status comes from; a trip with no jobs has no delivery status. |
| Ready To Ship (job) / Ready To Ship (trip) | `del/jobs/backoffice-ep/ready-to-ship`, `del/trips/backoffice-ep/ready-to-ship` | Sets `delivery_status = READY_TO_SHIP` on the job header, its document-header and document-line links and its shipment links, and writes a `bl_del_job_event` (`JobsService.getJobsDto` L628–L640; `DeliveryJobEventUpdateActionService` L30–L36). |
| Start Job / Start Trip | `del/jobs/backoffice-ep/start-jobs`, `del/trips/trips-start/backoffice-ep` | Same, with `OUT_FOR_DELIVERY`. Starting a trip applies the status to **every job on the trip** (`TripsService.getTripsJobsDto` L140–L150). |
| Complete Job / Complete Trip | `del/jobs/backoffice-ep/complete-jobs`, `del/trips/backoffice-ep/complete-trips` | Same, with `COMPLETE`; then `updateGenDocDeliveryStatus` / `updateShipmentHdrDeliveryStatus` roll `PARTIALLY DELIVERED` or `FULLY DELIVERED` up to the source document and shipment. The endpoint rejects a job or trip whose `delivery_status` is `CANCELLED` with `JOB_HDR_GUID_DOES_NOT_EXIST_OR_CANCELLED_JOB_CANNOT_BE_COMPLETED` / `TRIP_HDR_GUID_DOES_NOT_EXIST_OR_CANCELLED_TRIP_CANNOT_BE_COMPLETED` (`JobsController.java` L1270–L1310, `TripsController.java` L275–L300, `JobsUow.getByGuidWithCondition` L822–L828). |
| Cancel Job — Job Sales Order / Job Sales Invoice / Job Delivery Order listings | `del/job-docs/cancel-job/` → `JobsService.cancelJobs` L401–L450 (`JobsDocController.java` L144–L158) | Writes `Cancelled` to the job header and its document links, **adds each line's `qty_to_deliver` back to `bl_fi_pick_pack_queue.qty_balance`** so the document can be re-planned, writes a cancellation event, and rolls the status up. Already-cancelled jobs are skipped; a missing job throws *Job Container does not Exist or has been Cancel*. |
| Cancel Job — Delivery Job listing | `delivery-shipment-hdr/backoffice-ep/cancel-jobs-from-shipment` → `DeliveryShipmentHdrService.cancelJobsFromShipment` L403–L446 | For **shipment-sourced** jobs only: deletes the job header and its shipment link, adds the linked quantity back to the shipment's `bl_del_shipment_processing_open_queue.bal_qty` (creating the queue row if needed) and re-derives the shipment's delivery status. A job with no shipment link is rejected with `SHIPMENT LINK TABLE NOT FOUND`, so document-sourced jobs must be cancelled from their own listing. |
| Cancel Trip | `del/trips/backoffice-ep/cancel-trips` → `TripsService.tripsJobsPickPackQueue` L152–L165 | Sets the trip to `CANCELLED` and cancels **every job on it** through `cancelJobs` (queue quantities restored, shipment links set to `CANCELLED`). Rejects an already-cancelled trip with `TRIP_HDR_GUID_DOES_NOT_EXIST_OR_TRIP_IS_ALREADY_CANCELLED`. |
| Re-arrange Trip | `del/trips/trips-rearrange/backoffice-ep` | Sets the trip and all its jobs to `DELIVERY_REARRANGED` with an event, using the same cancelled-trip guard (`TripsController.java` L739–L756). |
| Job re-arrangement (drag order on the trip's Jobs tab) | `del/jobs/backoffice-ep/update-job-sequence-in-trips` | Updates `bl_del_job_hdr.sequence_in_trip` only (`JobsUow.updateJobSequence` L874–L875); no status change and no event. |
| Custom Status | `del/jobs/add-custom-status/backoffice-ep` | Writes a job event referencing the `bl_del_job_custom_status_hdr` row with the chosen date; no `delivery_status` change. |
| Delivery Arranged | `del/trips/backoffice-ep/delivery-arranged/{guid}` | Re-applies `DELIVERY_ARRANGED` to a trip and its jobs. Exists in the backend but no screen in this applet calls it. |

Two things the code does not do: no endpoint validates the order of transitions (a job can go from `DELIVERY_ARRANGED` straight to `COMPLETE`), and the cancelled-job guard compares against the upper-case constant while *Cancel Job* stores the title-case string `Cancelled` (`JobsService.java` L413 vs `JobsUow.java` L828), so only jobs cancelled through *Cancel Trip* (which writes `CANCELLED`) are actually blocked from completion. There is no VOID: a job is cancelled from its listing, deleted from the trip's Jobs tab, or (shipment-sourced) removed by *Cancel Job* on the Delivery Job listing.

## Related applets

- [Delivery And Installation Driver](/applets/delivery-installation/delivery-installation-driver-applet/) — the driver-facing half; consumes the trips planned here and calls the `login-driver-ep` variants of the same start/complete/cancel endpoints.
- [Driver Delivery Order Applet](/applets/inventory-workflow/driver-delivery-order-applet/) — the lightweight alternative when a single driver field on the Delivery Order is enough.
- [Sales Order (Internal)](/applets/sales-workflow/internal-sales-order-applet/), [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [Delivery Order (Internal)](/applets/sales-workflow/internal-delivery-order-applet/) — the documents whose pick-pack queue rows become jobs and whose `delivery_status` this applet updates.
- [Organisation](/applets/master-data/organisation-applet/) — branches and locations referenced by shipments, jobs and searches.
- [Employee](/applets/master-data/employee-applet/) — drivers are separate `bl_del_driver` records, but the *Job Created By* and login links resolve to platform users.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| *Start Job* and *Complete Job* are missing from the status dropdown; only *Ready To Ship* and *Cancel Job* show. | `JS_HIDE_JOB_STATUS` (Delivery Job listing), `SO_HIDE_JOB_STATUS` (Job Sales Order **and** Job Delivery Order listings) or `SI_HIDE_JOB_STATUS` is on. | Settings › Application Settings › Jobs, switch the toggle off and Save. |
| *Batch Print* button is missing on Trips. | `HIDE_BATCH_PRINT` is on. | Application Settings › Trips. |
| The Delivery Job *Batch Print* button asks for a Delivery Date. | `JS_SHOW_CUSTOM_DELIVERY_DATE_FIELD` is on; the button becomes a custom-date batch print. | Pick a date, or switch the setting off. |
| Return Reasons Settings cannot save; the browser console shows a TypeError on `bl_applet_config`. | The tenant has no `bl_applet_config` row with `param_code = RETURN_REASON` for this applet; the effect only appends to an existing row (`reason-settings.effects.ts` L20–L45). | Have the row seeded (an empty `{"data": []}` value) before adding reasons. |
| *Reason Code already exists* when adding a return reason. | Client-side duplicate check on the code. | Use a new code or edit the existing reason. |
| Default Selection (applet or personal) does nothing, or errors when a branch is picked. | The component never receives the applet container and nothing reads `DEFAULT_BRANCH` / `DEFAULT_LOCATION` (see Configuration). | Not configurable at this commit; choose branch and location on each form. |
| *Complete Job* fails with `JOB_HDR_GUID_DOES_NOT_EXIST_OR_CANCELLED_JOB_CANNOT_BE_COMPLETED`. | The job was cancelled through *Cancel Trip* (status `CANCELLED`) or deleted. | Create a new job from the source document (its quantity was returned to the pick-pack queue). |
| A cancelled job could still be completed. | The job was cancelled with *Cancel Job*, which stores `Cancelled`; the guard checks `CANCELLED` (`JobsService.java` L413, `JobsUow.java` L828). | Treat the job event history as the record; report as a product defect if it matters for reporting. |
| *Cancel Job* on the Delivery Job listing fails with `SHIPMENT LINK TABLE NOT FOUND`. | The selected job came from a Sales Order, Sales Invoice or Delivery Order, not a shipment; this button only handles shipment-sourced jobs (`DeliveryShipmentHdrService.java` L410–L413). | Cancel it from the Job Sales Order / Job Sales Invoice / Job Delivery Order listing instead. |
| Cancelling one trip cancelled jobs the dispatcher wanted to keep. | *Cancel Trip* cancels every job on the trip and restores their queue quantities. | Move jobs to another trip (Add to Trip) before cancelling, then re-create jobs from the queue if needed. |
| Job event descriptions show the day and month but no year. | The applet stamps events as `dd MMM, HH:mm` and the backend stores the string as given (`getEventTimeString`, `DeliveryJobEventUpdateActionService.createMeaningfulEventDescription`). | Known limitation; use the event's created date column for the year. |
| *Create Jobs* on a shipment does nothing. | The shipment has no balance quantity (Bal Qty = 0 or fully allocated) or, in Path Optimization Mode, no logistic-hub network is selected. | Check Bal Qty / Allocate Job Qty on the listing; select a network for Path Optimization Mode. |
| Duplicate shipments after an external warehouse push. | Identical requests arriving in the same millisecond pass the duplicate check on logistics ref / sender ref before either is committed; a unique constraint on that pair was proposed. | Deduplicate by logistics reference number; ask for the constraint if the integration retries. |
| Vehicle listing showed only the first 100 vehicles. | An older build called the listing once with a fixed limit of 100. | Fixed: the listing now pages by the grid's row range (`vehicle-container/listing/listing.component.ts` L320–L337). |
| *Verify Email* on a driver reports that no user exists. | The e-mail does not match an `app_login_principal` of type `EMAIL_USERNAME`. | Use *Send Invite* from the driver record, or ask the driver to register with that e-mail first. |
| Advanced-search fields are missing on the Delivery Job or Job Sales Order screen. | A `JS_HIDE_*_FIELD` / `SO_HIDE_*_FIELD` toggle is on under Settings › Menu Containers. | Switch it off there — not under Application Settings. |

## Related documentation

- [Installation Scheduling Workflow](/guides/sales-guides/installation-scheduling-workflow/) and [Partial Delivery Workflow](/guides/sales-guides/partial-delivery-workflow/) — the sales-side guides whose orders feed this applet.
- [Inventory module](/modules-v2/inventory/) — outbound movements and delivery orders.
- [Delivery And Installation Driver](/applets/delivery-installation/delivery-installation-driver-applet/) — the driver applet reference.
