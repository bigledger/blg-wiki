# Sources

| Folder | ID scheme | Cursor | Notes |
|---|---|---|---|
| `github-issues/` | `gh:<owner>/<repo>#<n>` | per repo: last issue number + last updated timestamp | comments change the hash |
| `github-repos/` | `git:<repo>@<sha>` | per repo: last commit SHA processed | one ledger line per commit or per PR |
| `jira/` | `jira:<KEY>-<n>` | last updated timestamp | |
| `email/` | `mail:<Message-ID>` | last message date per mailbox/label | threads: each message its own line; `thread` field groups them |
| `gdrive/` | `gdrive:<fileId>` | last modifiedTime | Docs/Sheets export to text before hashing |

Cursor files are JSON: `{"source": "...", "cursor": {…per-scope…}, "updated": "ISO"}`.
Multiple scopes (repos, mailboxes) live under `cursor` keyed by scope name.
