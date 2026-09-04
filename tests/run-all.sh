#!/usr/bin/env bash
# Run the full wiki test suite.
# Usage:
#   tests/run-all.sh local   # build site, run lychee on built site, run Playwright against local Hugo server
#   tests/run-all.sh live    # run lychee + Playwright against https://wiki.bigledger.com
#   tests/run-all.sh both    # local then live

set -uo pipefail

MODE="${1:-local}"
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

red()   { printf '\033[31m%s\033[0m\n' "$*"; }
green() { printf '\033[32m%s\033[0m\n' "$*"; }
blue()  { printf '\033[34m%s\033[0m\n' "$*"; }

FAIL=0

run_local() {
  blue '== Tier 1: Hugo build =='
  if ! hugo --gc --minify; then red 'Hugo build FAILED'; return 1; fi
  green 'Hugo build OK'

  blue '== Tier 1b: content lints =='
  if ! tests/content-lint.sh; then red 'Content lint FAILED'; FAIL=1; else green 'Content lints OK'; fi

  blue '== Tier 2: lychee against built site (gated on tests/lychee-baseline.txt) =='
  if ! tests/lychee-gate.sh; then
    red 'lychee: new broken links'
    FAIL=1
  else
    green 'No new broken links'
  fi

  blue '== Tier 3: Playwright against local Hugo server =='
  # baseURL must match what Playwright hits, or Hugo's asset URLs are cross-origin (CORS on flexsearch.js)
  hugo server --port 1313 --bind 127.0.0.1 --baseURL http://127.0.0.1:1313/ --appendPort=false --logLevel warn >/tmp/hugo-server.log 2>&1 &
  HUGO_PID=$!
  # Wait for hugo to start
  for i in $(seq 1 30); do
    if curl -sf http://127.0.0.1:1313/ >/dev/null 2>&1; then break; fi
    sleep 1
  done
  if ! curl -sf http://127.0.0.1:1313/ >/dev/null 2>&1; then
    red 'Hugo server did not start in 30s; skipping Playwright'
    FAIL=1
  else
    (cd tests/playwright && BASE_URL=http://127.0.0.1:1313 npx playwright test) || FAIL=1
  fi
  kill "$HUGO_PID" 2>/dev/null || true
  wait "$HUGO_PID" 2>/dev/null || true
}

run_live() {
  blue '== Tier 4: lychee against https://wiki.bigledger.com =='
  if ! lychee --config tests/lychee.toml 'https://wiki.bigledger.com'; then
    red 'lychee found broken links on the live site'
    FAIL=1
  else
    green 'No broken links on live site'
  fi

  blue '== Tier 5: Playwright against live site =='
  (cd tests/playwright && BASE_URL=https://wiki.bigledger.com npx playwright test) || FAIL=1
}

case "$MODE" in
  local) run_local ;;
  live)  run_live ;;
  both)  run_local; run_live ;;
  *)     echo "Usage: $0 {local|live|both}"; exit 2 ;;
esac

if [[ "$FAIL" -ne 0 ]]; then
  red 'TEST RUN FAILED'
  exit 1
fi
green 'ALL TESTS PASSED'
