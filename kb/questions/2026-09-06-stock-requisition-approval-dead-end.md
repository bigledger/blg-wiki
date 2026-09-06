---
status: open
raised_by: approvals-optional sweep, 2026-09-06
topics: [document-approval]
who_can_answer: Vincent / the Stock Requisition applet owner
---

# Is Stock Requisition's Approval Settings screen meant to work, or is it a fork leftover?

The Internal Stock Requisition applet routes `settings/approval-setting` and shows an "Approval
Settings" menu item that writes `bl_fi_generic_doc_approval_setting` rows for
`INTERNAL_STOCK_REQUISITION` (`INTERNAL_OUTBOUND_STOCK_TRANSFER` is present but commented out)
[src:blg-applet-wavelet-internal-stock-requisition-applet .../app.routing.ts:83-84]
[src:… /models/menu-items.ts:49-50]
[src:… /settings-container/approval-setting/approval-setting-create/approval-setting-create.component.ts:41-51].

But the applet has **no** `generic-doc-approval` tab on the stock requisition document, no Approval
Request screen and no Approval History screen — the Purchase Order and Purchase Requisition applets
have all three. A setting created in Stock Requisition therefore cannot be submitted against,
approved, or seen from that applet.

The wiki needs to know whether to (a) document Stock Requisition approvals as "configure here,
nothing consumes it yet", (b) say nothing about it, or (c) wait because the document-side screens
are coming. Right now the Stock Requisition applet page should not tell a reader to configure
approvals as if they will take effect.
