# Google Drive — how to access (pointers only)

`gws` CLI as vincent (file keyring). Playbook: `/home/vincent/projects/my-google/docs/drive.md`;
the 83 shared drives are listed in `/home/vincent/projects/my-google/reference/shared-drives.md`.
Shared drives need `corpora=drive`, `driveId`, `supportsAllDrives`, `includeItemsFromAllDrives`.
Docs/Sheets: export to text (`files export`) before hashing. Service-account path (delegation) also
works via the google-admin venv — see `/home/vincent/projects/sysadmin/google-admin/test_drive.py`.

Ledger id: `gdrive:<fileId>`; cursor per drive = last `modifiedTime`. Exports → `kb/private/`.

**Known limitation (2026-09-05):** `gws` fails with `spawnSync … EACCES` when run through `sudo -u vincent`
from this account (the ELF is executable; the failure is the sudo/AppArmor context). Use the
service-account path (`vince-pa/scripts/gmail.py` / `sysadmin/google-admin/test_drive.py` with the
google-admin venv) from this account, or run `gws` in Vincent's own session.
