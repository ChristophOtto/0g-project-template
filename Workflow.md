# Project Template Setup Workflow

This document describes the steps taken to set up this template repository for safe AI-assisted development.

> **Convention**: The default branch is always `main`. Never use `master`.

---

## Step 1 — `settings.json`: AI Permissions

Created `settings.json` to define what the AI assistant is allowed and forbidden to do.

- `allow` — commands the AI can run without asking (e.g. `npm run *`, `git add/commit/status/diff`, `cat`, `ls`, `Edit(/src/**)`)
- `deny` — commands that are hard-blocked (e.g. `npm install`, `rm`, `curl`, `wget`, `ssh`, reading `.env`/`*.pem`/`*.key` files)
- `allowFileDeletion: false` and `allowExternalRequests: false` as additional safety layers

---

## Step 2 — `CLAUDE.md`: Non-Negotiable Directives

Created `CLAUDE.md` to document hard rules for any AI assistant working in this project:

- What the AI may and may not do
- Code behaviour expectations (show diff before overwriting, explain before acting)
- Security rules (never expose secrets, never suggest hardcoding credentials)

---

## Step 3 — `.githooks/pre-commit`: Secret Scanner

Created a pre-commit git hook that scans staged files before every commit and blocks:

- **Sensitive file types**: `.env`, `.pem`, `.key`, `.p12`, `credentials.json`, `secrets.json`, etc.
- **Secret patterns in content**: AWS keys, GitHub tokens, Stripe keys, Slack tokens, Google API keys, PEM headers, and generic patterns like `password =`, `api_key =`, `secret =`

---

## Step 4 — `setup-hooks.sh`: Hook Installer

Created `setup-hooks.sh` to activate the git hooks. Must be run once after cloning:

```bash
bash setup-hooks.sh
```

This sets `core.hooksPath` to `.githooks/` and makes the hook executable.

---

## Step 5 — AI Skills & Directives

- Created `.agent/skills/` with `write-test`, `refactor-module`, and `review-port-exposure`.
- Created `AGENTS.md` for universal AI directives.

## Step 6 — Advanced Git Hooks

- `.githooks/commit-msg` — Enforces Conventional Commits.
- `.githooks/pre-push` — Scans full history for secrets + runs `npm audit`.
- `.githooks/post-commit` — Logs AI changes to `.ai-audit.log`.

## Step 7 — Security Hardening & CI

- `gitleaks.toml` — Custom secret scanning rules.
- `.github/workflows/` — Automated secret scanning and dependency auditing (CVE).
- `SECURITY.md`, `CONTRIBUTING.md`, and `CODEOWNERS` — Defined project policies and review requirements.

## Step 8 — Final Polish

- Branched renamed from `master` to `main`.
- `.editorconfig` added for consistent formatting.
- `.gitignore` updated to exclude audit logs.
