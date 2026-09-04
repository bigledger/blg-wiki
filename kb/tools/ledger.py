#!/usr/bin/env python3
"""Minimal ledger helper. Usage:
  ledger.py hash  <file>                         -> sha256:… of normalised text
  ledger.py seen  <source> <id>                  -> prints latest record for id, or nothing
  ledger.py add   <source> '<json>'              -> validates + appends one record
  ledger.py stats <source>                       -> counts by state
Normalisation: strip CR, trailing whitespace, collapse blank runs, so cosmetic edits don't change the hash.
"""
import sys, json, hashlib, re, pathlib, datetime
ROOT = pathlib.Path(__file__).resolve().parents[1] / "sources"
STATES = {"seen", "triaged", "extracted", "applied", "ignored"}
REQ = {"id", "kind", "content_hash", "first_seen", "last_seen", "state"}

def norm(text: str) -> str:
    text = text.replace("\r", "")
    text = "\n".join(l.rstrip() for l in text.split("\n"))
    return re.sub(r"\n{3,}", "\n\n", text).strip()

def h(text: str) -> str:
    return "sha256:" + hashlib.sha256(norm(text).encode()).hexdigest()

def ledger(src): return ROOT / src / "ledger.jsonl"

def latest(src, id_):
    rec = None
    p = ledger(src)
    if not p.exists(): return None
    for line in p.read_text().splitlines():
        if not line.strip(): continue
        r = json.loads(line)
        if r["id"] == id_: rec = r
    return rec

def add(src, rec):
    missing = REQ - rec.keys()
    if missing: sys.exit(f"missing fields: {sorted(missing)}")
    if rec["state"] not in STATES: sys.exit(f"bad state {rec['state']}")
    if not rec["content_hash"].startswith("sha256:"): sys.exit("content_hash must be sha256:…")
    if rec["state"] == "ignored": rec.pop("title", None)   # ignored items carry no title: titles can leak customer names
    prev = latest(src, rec["id"])
    if prev and prev["content_hash"] != rec["content_hash"]:
        rec.setdefault("supersedes", prev["content_hash"])
    rec.setdefault("recorded_at", datetime.datetime.now(datetime.timezone.utc).isoformat(timespec="seconds"))
    with ledger(src).open("a") as f: f.write(json.dumps(rec, ensure_ascii=False) + "\n")
    print("ok", rec["id"], rec["state"])

def stats(src):
    from collections import Counter
    seen = {}
    for line in ledger(src).read_text().splitlines():
        if line.strip():
            r = json.loads(line); seen[r["id"]] = r["state"]
    for k, v in sorted(Counter(seen.values()).items()): print(f"{k:10} {v}")
    print(f"{'items':10} {len(seen)}")

if __name__ == "__main__":
    a = sys.argv[1:]
    if not a: sys.exit(__doc__)
    if a[0] == "hash": print(h(pathlib.Path(a[1]).read_text(errors="replace")))
    elif a[0] == "seen": r = latest(a[1], a[2]); print(json.dumps(r) if r else "")
    elif a[0] == "add": add(a[1], json.loads(a[2]))
    elif a[0] == "stats": stats(a[1])
    else: sys.exit(__doc__)
