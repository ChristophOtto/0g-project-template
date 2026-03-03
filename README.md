# 0g Project Template

> **0g** — like *antigravity* and *OG*. A template for safe, structured, AI-assisted development.

This template is the starting point for projects where AI assistants (Claude, Antigravity, etc.) are first-class collaborators — but operate within **clear, enforced boundaries**.

No secrets escape to the wild. That's the code of the street.

---

## What This Template Provides

### 🔐 Permissions (`settings.json`)
Defines exactly what AI tools can and cannot do:
- **`allow`** — commands the AI can run autonomously (git, npm scripts, file reading)
- **`deny`** — hard-blocked commands (package installs, file deletion, network access, reading secrets)
- **`deniedPaths`** — sensitive files the AI cannot touch at all

### 📋 Directives (`CLAUDE.md`)
Non-negotiable rules for any AI assistant in this project:
- What it may do, what it must never do
- Code behaviour (explain before acting, show diffs before overwriting)
- Security rules (never expose secrets, never hardcode credentials)

### 🔒 Secret Scanner (`.githooks/pre-commit`)
A git hook that blocks commits containing:
- Sensitive file types (`.env`, `.pem`, `.key`, `credentials.json`, etc.)
- Secret patterns in code (AWS keys, GitHub tokens, Stripe keys, API keys, PEM headers, and more)

### ⚙️ Conventional Commits (`.githooks/commit-msg`)
Enforces a clean, readable git history using the [Conventional Commits](https://www.conventionalcommits.org/) standard:
```
feat: add user authentication
fix: resolve token expiry bug
chore: update dependencies
```

### 🛡️ CVE Vulnerability Scanning
Dependencies are scanned for known CVEs at multiple layers:
- **`pre-push` hook** — runs `npm audit --audit-level=high` locally before every push
- **CI: `dependency-scan.yml`** — runs `npm audit` and [OSSF Scorecard](https://securityscorecards.dev/) on every PR and weekly schedule
- **Dependabot** — auto-raises PRs for security patches every Monday

---

## Roadmap

- [x] AI permission boundaries (`settings.json`)
- [x] Non-negotiable AI directives (`CLAUDE.md` + `AGENTS.md`)
- [x] Pre-commit secret scanner
- [x] Pre-push secret scanner (full history)
- [x] Conventional commit enforcement
- [x] AI audit log (`post-commit` hook)
- [x] Claude skill definitions (`.agent/skills/`)
- [x] CI/CD secret scanning (Gitleaks)
- [x] CVE dependency scanning (npm audit + OSSF Scorecard)
- [x] Dependabot for automated security patches
- [x] CODEOWNERS + CONTRIBUTING + SECURITY policies
- [x] Additional hooks (pre-push + post-commit)
- [ ] Snyk integration (optional advanced CVE scanning)

---

## Getting Started

### 1. Clone and install hooks
```bash
git clone <your-repo-url>
cd <your-project>
bash setup-hooks.sh
```

### 2. Set up your environment
```bash
cp .env.example .env
# Fill in your actual values — never commit .env
```

### 3. Start building
Your AI assistant is ready to help — within safe, defined boundaries.

---

## Philosophy

AI-assisted development is powerful. But power without guardrails leads to leaked secrets, broken dependencies, and unpredictable changes.

**0g** is about removing friction for the good stuff (building, iterating, committing) while making the bad stuff (leaking secrets, destroying files, making rogue network calls) structurally impossible — not just discouraged.

> *"Trust, but verify. Then also add a pre-commit hook."*
