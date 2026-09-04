---
name: ship
description: Test locally, commit, push, watch the GitHub Actions deploy, then verify the live site — the full release path for wiki.bigledger.com. Use when Vincent says "test and deploy", "push it", "ship it", or asks to verify the public site after a change.
argument-hint: "[what is being shipped]"
---

Nothing reaches production untested; nothing is declared done until verified live.

## Steps

1. **Local suite:** `tests/run-all.sh local` → Hugo build, lychee (offline, absolute `--base`), Playwright against `hugo server --baseURL http://127.0.0.1:1313/`. All three must pass. Lychee's pre-existing broken-link baseline is F-0013 in the inbox — new breakage is what matters: compare against `planning/research/2026-09-05-broken-internal-links.md`.
2. **Verify the specific change** in `public/`: the page, the alias stub, the description — whatever was edited. Grep for it.
3. **Privacy sweep** before committing anything under `planning/` or `kb/`: no tenant, customer, or person names; `planning/private/` and `kb/private/` must show as ignored.
4. **Commit** in logical units (content change ≠ workbench change), imperative subject, body says why, no attribution trailers. Do not include `blg-www/` (a nested repo) or `ideas/`.
5. **Push** `origin main`. Then `gh run list --workflow=deploy.yml --limit=1` and `gh run watch <id> --exit-status`. The deploy step runs `hugo deploy --invalidateCDN`; confirm "Verify CloudFront Invalidation" passed.
6. **Verify live** (CloudFront can lag a minute): curl the changed URLs and check the actual content, not just the status code; `curl -s https://wiki.bigledger.com/index.txt | sed -n 3p` for the site summary; then `cd tests/playwright && BASE_URL=https://wiki.bigledger.com npx playwright test`.
7. Report plainly: what was tested, what passed, what failed, the commit hashes, the run id. If anything failed, say so with the output — do not soften it.

## Known harness facts

- `hugo server` must get `--baseURL http://127.0.0.1:1313/ --appendPort=false` or Playwright hits CORS on flexsearch.js.
- lychee 0.24 needs an absolute `--base`. `lychee <url>` checks that page's links; it does not crawl.
- Hugo never deletes stale files from `public/`; use `--cleanDestinationDir` when verifying removals.
