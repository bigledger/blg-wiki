---
status: accepted
date: 2026-09-05
discussion: ../discussions/2026-09-05-home-page-redesign.md
---

# ADR-0004: The documentation home page is a reader-intent hub, not a marketing page

## Context

The home page was a marketing landing page (free trial, pricing, contact sales, user counts)
rendered through a layout bug that squeezed 28 cards into a 483 px column. Readers arriving
at wiki.bigledger.com already have BigLedger; they want to do something. See the discussion.

## Decision

1. The home page has one job: get the reader to the right section in one click. Shape:
   short hero → search → eight intent cards → guides by role → reference → popular links.
2. One welcoming visual: the **platform map** (modules around the ledger core, applets as
   the unit, API · MCP · SDK to AI agents and external systems). Informative, generated,
   theme-aware. No product screenshots in the hero (they date), no stock illustration.
3. No selling on the docs home. Pricing, trials, sales contact, partner programme and
   marketing statistics live on bigledger.com and are linked once, at the bottom.
4. Built only from Hextra's shipped components and classes plus two small shortcodes
   (`hero-split`, `platform-map`). Invented responsive utility classes are not in Hextra's
   compiled CSS and must not be used.
5. Intent cards point at today's best pages; when ADR-0001 lands they re-point to the new
   tree. No Industries row on the home page (industries get a hub under `user-guide/`).
6. Hero stays neutral (Hextra defaults); the logo carries the brand red.

## Consequences

- `content/en/_index.md` replaced; zh/ms/ar home pages still carry the old hero and layout
  bug and need the same treatment (logged as a feedback item).
- The "Trusted by 1 Million Users" claim (F-0012) is gone with the page.
- "Popular right now" is hand-picked until analytics exist.

## Alternatives rejected

- Keep the marketing page and only fix the layout bug — wrong page for the audience.
- Product screenshot in the hero — dates with every UI release.
- Brand red hero — inconsistent with every other docs page.
