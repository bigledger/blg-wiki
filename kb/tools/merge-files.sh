#!/usr/bin/env bash
# Validate an arbitrary set of working-tree files in an isolated worktree, then commit only those files.
#   kb/tools/merge-files.sh <tag> <commit-subject> -- <file> [<file>...]
# <tag> names the worktree/port so it can run alongside merge-lane.sh.
set -uo pipefail
TAG="${1:?tag}"; SUBJ="${2:?commit subject}"; shift 2; [ "${1:-}" = "--" ] && shift
FILES=("$@"); [ ${#FILES[@]} -eq 0 ] && { echo "no files"; exit 0; }
REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"; cd "$REPO"
echo "$TAG: ${#FILES[@]} files"; printf '  %s\n' "${FILES[@]}"

WT="/tmp/claude-1007/-home-marketing-repos-blg-wiki/8e0b610b-9463-4c0d-acfd-411de8935aeb/scratchpad/wt-$TAG"
rm -rf "$WT"; git worktree prune; git worktree add -q --detach "$WT" HEAD || exit 1
for f in "${FILES[@]}"; do mkdir -p "$WT/$(dirname "$f")"; cp "$f" "$WT/$f"; done
for t in themes/hextra themes/geekdoc themes/book themes/lotusdocs; do [ -d "$t" ] && { rm -rf "$WT/$t"; ln -s "$REPO/$t" "$WT/$t"; }; done
ln -s "$REPO/tests/playwright/node_modules" "$WT/tests/playwright/node_modules" 2>/dev/null
cd "$WT"
ok=1
tests/content-lint.sh || ok=0
hugo --gc --minify --cleanDestinationDir >/tmp/hugo-$TAG.log 2>&1 || { echo "FAIL: hugo build"; tail -5 /tmp/hugo-$TAG.log; ok=0; }
[ $ok = 1 ] && { tests/lychee-gate.sh || ok=0; }
if [ $ok = 1 ]; then
  port=1339
  hugo server --port $port --bind 127.0.0.1 --baseURL "http://127.0.0.1:$port/" --appendPort=false --logLevel warn >/tmp/hugo-srv-$TAG.log 2>&1 & HP=$!
  for i in $(seq 1 40); do curl -sf "http://127.0.0.1:$port/" >/dev/null && break; sleep 1; done
  (cd tests/playwright && BASE_URL="http://127.0.0.1:$port" npx playwright test 2>&1 | grep -E 'passed|failed') || ok=0
  kill $HP 2>/dev/null; wait $HP 2>/dev/null
fi
cd "$REPO"; git worktree remove --force "$WT"
[ $ok = 1 ] || { echo "GATE FAILED for $TAG — nothing committed"; exit 1; }
git add -- "${FILES[@]}"
git commit -q -m "$SUBJ

$(printf -- '- %s\n' "${FILES[@]}")" && { echo "committed: $(git log --oneline -1)"; echo "committed paths (check nothing unrelated was staged):"; git show --name-status --format= HEAD; }
