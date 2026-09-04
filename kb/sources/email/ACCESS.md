# Email — how to access (pointers only; no credentials in this repo)

Two working paths, both belonging to Vincent's tooling — read their docs before use:

1. **`gws` CLI** (Google Workspace CLI), run as vincent with the file keyring:
   `sudo -u vincent env GOOGLE_WORKSPACE_CLI_KEYRING_BACKEND=file gws gmail users messages list --params '{"userId":"me","q":"…","maxResults":500}'`
   Playbook: `/home/vincent/projects/my-google/docs/gmail.md` (strip the "Using keyring backend" line before JSON-parsing; paginate on `nextPageToken`).
2. **Service account + domain-wide delegation** (any @bigledger.com / @aimatrix.com mailbox):
   `/home/vincent/projects/vince-pa/scripts/gmail.py` (interpreter: the google-admin venv). Accounts: `vince-pa/accounts/<account>/config.yaml`; keys under `vince-pa/secrets/google/` — never copy them.
   A long-running watcher exists at `vince-pa/apps/mail-worker` (historyId deltas) — the model for this source's cursor.

Ledger id: `mail:<Message-ID header>`; `thread` field = Gmail threadId. Cursor per mailbox/label = `{historyId | last internalDate}`.
Raw bodies → `kb/private/` only. Facts extracted into topics must be anonymised (no customer or person names).

**Known limitation (2026-09-05):** `gws` fails with `spawnSync … EACCES` when run through `sudo -u vincent`
from this account (the ELF is executable; the failure is the sudo/AppArmor context). Use the
service-account path (`vince-pa/scripts/gmail.py` / `sysadmin/google-admin/test_drive.py` with the
google-admin venv) from this account, or run `gws` in Vincent's own session.
