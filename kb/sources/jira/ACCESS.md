# Jira / Confluence — how to access (pointers only)

Atlassian Cloud at `bigledger.atlassian.net`. API token: `/home/vincent/projects/sysadmin/atlassian/api_token.txt`
(read at call time via sudo; never copy, never print). Basic auth identity is **vincent@aimatrix.com** (verified 200 on /rest/api/3/myself, 2026-09-05; vincent@bigledger.com returns 401).
Usage: `tok=$(sudo cat …/api_token.txt | tr -d '\n\r '); curl -s -u "vincent@aimatrix.com:$tok" 'https://bigledger.atlassian.net/rest/api/3/search?jql=…'; unset tok` REST: `/rest/api/3/search?jql=…` (Jira),
`/wiki/rest/api/content?…` (Confluence). 40 applet registry rows still point their
`documentation_url` at Confluence pages — those pages are ingestion candidates for the wiki.

Ledger id: `jira:<KEY-n>` / `confluence:<pageId>`; cursor = last `updated`.
