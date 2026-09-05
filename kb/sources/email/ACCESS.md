# Email — how to access (VERIFIED 2026-09-05; pointers only, no credentials in this repo)

**Working path: service account + domain-wide delegation, read-only, run as vincent.**
```
PY=/home/vincent/projects/sysadmin/google-admin/.venv/bin/python
sudo -u vincent $PY - <<'PYEOF'
from google.oauth2 import service_account
from googleapiclient.discovery import build
SA={"aimatrix.com":"/home/vincent/projects/sysadmin/google-admin/aimatrix-com-7dc264d3d5ec.json",
    "bigledger.com":"/home/vincent/projects/sysadmin/google-admin/blg-amx-admin-ba3b0c3a3cd1.json"}
mailbox="vincent@aimatrix.com"
c=service_account.Credentials.from_service_account_file(SA[mailbox.split('@')[1]],
    scopes=["https://www.googleapis.com/auth/gmail.readonly"]).with_subject(mailbox)
g=build("gmail","v1",credentials=c,cache_discovery=False)
# list: g.users().messages().list(userId="me", q="newer_than:7d einvoice", maxResults=50)
# read: g.users().messages().get(userId="me", id=<id>, format="full")  — bodies → kb/private/ only
PYEOF
```
- **vincent@aimatrix.com: verified OK** (2026-09-05: ~201 e-invoice messages in 7 days — project meeting notes, customer threads, GitHub notifications).
- **@bigledger.com mailboxes (e.g. support@): FAIL `unauthorized_client`** — the bigledger.com service
  account is not delegated for `gmail.readonly`. Fix is in the Google Admin console (Security → API
  controls → Domain-wide delegation) for client `blg-amx-admin`, per
  `/home/robot/repos/blg-robot-support/sop/decisions/2026-06-28-email-access.md`. Waiting on Vincent.
- Reference implementation with governance (scoped queries, audit log, cite-don't-quote):
  `/home/robot/repos/blg-robot-support/scripts/data/gmail-search.py`. Follow its rules: one mailbox per
  query, scoped by customer/topic, headers first, bodies only when needed, never paste bodies anywhere.
- Fallback: the claude.ai Gmail connector once Vincent authenticates it with `/mcp`.

Ledger id: `mail:<Message-ID header>` (fall back to `gmail:<id>`); `thread` = threadId. Cursor per
mailbox+query = last `internalDate`. Raw bodies → `kb/private/` only. Facts extracted into topics are
anonymised (no customer or person names).
