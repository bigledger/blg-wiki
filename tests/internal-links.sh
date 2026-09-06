#!/usr/bin/env bash
# Resolve every in-site link in the built output against the built tree.
#
# Why this exists: Hugo renders internal links as absolute https://wiki.bigledger.com/… URLs,
# and tests/lychee-gate.sh runs lychee with --offline, which skips every http(s) URL. lychee
# therefore only ever checked the handful of relative links — 172 where the real figure was 223
# distinct broken targets across 2,651 instances. This is the check that actually measures
# internal linking; lychee stays for relative links and external-URL syntax.
set -uo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")/.."
[ -d public ] || { echo "internal-links: no public/ — run hugo first"; exit 1; }
baseline=$(cat tests/internal-links-baseline.txt 2>/dev/null || echo 999999)
out=$(python3 - <<'PY'
import re,os,collections,glob
SITE='https://wiki.bigledger.com'
targets=set()
for f in glob.glob('public/**/*.html',recursive=True):
    u='/'+os.path.relpath(f,'public')
    targets.add(u); targets.add(u[:-len('index.html')] if u.endswith('/index.html') else u)
for f in glob.glob('public/**/*',recursive=True):
    if os.path.isfile(f) and not f.endswith('.html'):
        targets.add('/'+os.path.relpath(f,'public'))
bad=collections.Counter()
for f in glob.glob('public/**/*.html',recursive=True):
    s=open(f,encoding='utf-8',errors='ignore').read()
    for m in re.findall(r'(?:href|src)=(?:"([^"]+)"|\'([^\']+)\'|([^\s>]+))',s):
        h=(m[0] or m[1] or m[2]).split('#')[0].split('?')[0]
        if h.startswith(SITE): h=h[len(SITE):]
        elif not h.startswith('/'): continue
        if not h: continue
        h2=h if h.endswith('/') else h+'/'
        if h in targets or h2 in targets or h2+'index.html' in targets: continue
        bad[h]+=1
print(sum(bad.values()), len(bad))
for u,n in bad.most_common(25): print(f"  {n:5d}  {u}")
PY
)
inst=$(echo "$out" | head -1 | awk '{print $1}'); dist=$(echo "$out" | head -1 | awk '{print $2}')
printf 'internal links: %s broken instances, %s distinct targets (baseline %s distinct)\n' "$inst" "$dist" "$baseline"
if [ "$dist" -gt "$baseline" ]; then
  echo "$out" | tail -n +2
  echo "FAIL: distinct broken internal targets increased"; exit 1
fi
[ "$dist" -lt "$baseline" ] && echo "note: fell below baseline — lower tests/internal-links-baseline.txt to $dist"
exit 0
