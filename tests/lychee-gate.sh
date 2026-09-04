#!/usr/bin/env bash
# Offline link check against the built site, gated on a committed baseline so pre-existing
# breakage (F-0013) does not block deploys while new breakage does. Lower the baseline as links get fixed.
set -uo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")/.."
baseline=$(cat tests/lychee-baseline.txt)
out=$(lychee --config tests/lychee.toml --offline --base "$PWD/public" public/ 2>&1)
errors=$(printf '%s' "$out" | grep -oE '🚫 [0-9]+ Errors' | grep -oE '[0-9]+' || echo 0)
printf 'lychee: %s errors (baseline %s)\n' "$errors" "$baseline"
if [ "$errors" -gt "$baseline" ]; then
  printf '%s\n' "$out" | grep -E '^\s*\[(ERR|4|5)' | sed -E 's/^\s+//' | sort | uniq -c | sort -rn | head -30
  echo "FAIL: broken links increased"; exit 1
fi
if [ "$errors" -lt "$baseline" ]; then echo "note: errors fell below baseline — lower tests/lychee-baseline.txt to $errors"; fi
