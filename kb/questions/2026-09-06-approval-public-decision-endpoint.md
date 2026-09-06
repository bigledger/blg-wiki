---
status: open
raised_by: approvals-optional sweep, 2026-09-06
topics: [document-approval]
who_can_answer: Vincent / platform security
---

# Is the anonymous approval-decision endpoint intended?

The pending-approval e-mail sends each approver a link to a server-rendered page at
`…/core2/tnt/dm/erp/generic-doc/approvals/approval-requests/thymeleaf-forms/{tenantCode}/{approvalRequestGuid}`
[src:blg-akaun-platform-java@1ff620ef akaun-api/.../GenericDocApprovalRequestThymeleafFormController.java:25-56].
That page reads the request through `GET …/approval-requests/public-ep/{guid}` and posts the
decision to `PUT …/approval-requests/processors/public-ep`
[src:… akaun-api/src/main/resources/templates/approver-decision-ui.html:640,665].

Both endpoints are declared `EndpointMethod.AnonymousTenantEndpoint` — no authentication, no
permission check, no verification that the caller is the approver named on the request
[src:… akaun-api/.../GenericDocApprovalRequestController.java:124-140, 209-220]. The in-applet path
(`processors/login-entity-primary-ep`) is authenticated and does bind the decision to the signed-in
user's employee entity.

So today anyone who obtains or guesses an `approval_request_guid` can approve or reject a purchase
order, and the resulting history row will carry the real approver's name. That may be a deliberate
"approve from your inbox without logging in" convenience.

The wiki question: should a guide tell readers that approving from the e-mail link requires no
login? It is a real, useful behaviour, but writing it down also advertises it. Needs a decision
before it is documented either way.
