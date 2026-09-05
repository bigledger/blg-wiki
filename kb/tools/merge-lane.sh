#!/usr/bin/env bash
# Merge one lane's output while other lanes are still editing the working tree.
#   kb/tools/merge-lane.sh <N>
# 1. Collect the files this lane may have changed (its folders + its lane files + its ledger shard + kb/topics it touched).
# 2. Validate them in an isolated git worktree at HEAD + those files: content lint, hugo build, lychee gate, Playwright.
# 3. Commit ONLY those files in the main repo. (Push/deploy is the caller's call.)
set -uo pipefail
N="${1:?lane number}"; REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"; cd "$REPO"
STATE="planning/lanes/lane-$N/state.json"
mapfile -t FOLDERS < <(python3 -c "import json;print('\n'.join(json.load(open('$STATE'))['folders']))")
paths=(); for f in "${FOLDERS[@]}"; do paths+=("content/en/applets/$f"); done
paths+=("planning/lanes/lane-$N" "kb/sources/applet-repos/ledger.lane-$N.jsonl")
# topics this lane touched = topics named after pages in its done list
mapfile -t TOPICS < <(python3 -c "
import json,os;st=json.load(open('$STATE'))
for d in st['done']:
    p=d['page'] if isinstance(d,dict) else d
    t='kb/topics/'+os.path.basename(p)[:-3]+'.md'
    print(t) if os.path.exists(t) else None")
paths+=("${TOPICS[@]}")
# topic notes are shared knowledge: include every changed/new topic (lanes name them freely)
mapfile -t FILES < <(git status --porcelain -- "${paths[@]}" kb/topics | awk '{print $2}' | sort -u)
[ ${#FILES[@]} -eq 0 ] && { echo "lane $N: nothing to merge"; exit 0; }
echo "lane $N: ${#FILES[@]} files"; printf '  %s\n' "${FILES[@]}"

WT="/tmp/claude-1007/-home-marketing-repos-blg-wiki/8e0b610b-9463-4c0d-acfd-411de8935aeb/scratchpad/wt-lane-$N"
rm -rf "$WT"; git worktree prune; git worktree add -q --detach "$WT" HEAD || exit 1
for f in "${FILES[@]}"; do mkdir -p "$WT/$(dirname "$f")"; cp "$f" "$WT/$f"; done
# themes are submodules: share them
for t in themes/hextra themes/geekdoc themes/book themes/lotusdocs; do [ -d "$t" ] && { rm -rf "$WT/$t"; ln -s "$REPO/$t" "$WT/$t"; }; done
ln -s "$REPO/tests/playwright/node_modules" "$WT/tests/playwright/node_modules" 2>/dev/null
cd "$WT"
ok=1
tests/content-lint.sh || ok=0
hugo --gc --minify --cleanDestinationDir >/tmp/hugo-lane-$N.log 2>&1 || { echo "FAIL: hugo build"; tail -5 /tmp/hugo-lane-$N.log; ok=0; }
[ $ok = 1 ] && { tests/lychee-gate.sh || ok=0; }
if [ $ok = 1 ]; then
  port=$((1320+N))
  hugo server --port $port --bind 127.0.0.1 --baseURL "http://127.0.0.1:$port/" --appendPort=false --logLevel warn >/tmp/hugo-srv-$N.log 2>&1 & HP=$!
  for i in $(seq 1 40); do curl -sf "http://127.0.0.1:$port/" >/dev/null && break; sleep 1; done
  (cd tests/playwright && BASE_URL="http://127.0.0.1:$port" npx playwright test 2>&1 | grep -E 'passed|failed') || ok=0
  kill $HP 2>/dev/null; wait $HP 2>/dev/null
fi
cd "$REPO"; git worktree remove --force "$WT"
[ $ok = 1 ] || { echo "GATE FAILED for lane $N — nothing committed"; exit 1; }
git add -- "${FILES[@]}"
git commit -q -m "Lane $N: applet pages to the reference standard ($(python3 -c "import json;print(len(json.load(open('$STATE'))['done']))") done so far)

$(printf -- '- %s\n' "${FILES[@]}" | grep '^- content/' )" && echo "committed: $(git log --oneline -1)"
