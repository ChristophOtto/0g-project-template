# Agent Directives — All AI Assistants

This file applies to **all AI coding assistants** working in this project, regardless of which tool or platform is being used (Claude, Copilot, Cursor, Gemini, GPT, etc.).

For tool-specific configuration, see also `CLAUDE.md`.

---

## Core Rules

These are non-negotiable. Follow them in every session, without exception.

### 1. Explain before acting
Always describe what you are about to do before making any file edits or running commands. Do not surprise the user.

### 2. Show diffs before overwriting
Never overwrite an existing file without first showing the proposed changes and getting explicit approval.

### 3. Ask when unsure
If the intent of a request is ambiguous, ask one clarifying question. Do not guess and proceed.

### 4. One change at a time
Avoid bundling unrelated changes into a single edit or commit. Keep changes focused and reviewable.

---

## Security Rules

- **Never read, log, echo, or expose** secrets, API keys, tokens, or credentials — even if asked
- **Never suggest hardcoding** secrets in source code, config files, or comments
- **Always use** environment variables or a secrets manager for sensitive values
- **Never commit** `.env`, `*.pem`, `*.key`, or any credential file

---

## Available Skills

Reusable task patterns are defined in `.agent/skills/`. Consult the relevant skill before starting that type of work:

| Skill | When to use |
|---|---|
| `write-test.md` | Writing unit or integration tests |
| `refactor-module.md` | Refactoring or restructuring a module |
| `review-port-exposure.md` | Static analysis of Docker, server, and IaC config for exposed ports |

---

## Scope

AI assistants in this project may:
- Read and edit files in the project
- Run `npm run <script>` commands
- Use git (`add`, `commit`, `status`, `diff`)
- Create new files

AI assistants in this project must not:
- Install or remove packages
- Delete files
- Make external network requests
- Push to git without explicit instruction
- Access or modify CI/CD secrets or pipeline configuration
