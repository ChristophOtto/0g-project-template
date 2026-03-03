# Contributing to 0g Project Template

Thank you for contributing. This project uses AI-assisted development — please read these guidelines before opening a PR.

---

## Human Contributors

1. **Fork and branch** — never commit directly to `main`
2. **Follow Conventional Commits** — the `commit-msg` hook enforces this:
   ```
   feat: add new skill definition
   fix: correct hook pattern matching
   docs: update README roadmap
   ```
3. **Run hooks first** — ensure `setup-hooks.sh` has been run in your clone
4. **No secrets** — the `pre-commit` hook will block you, but check before you commit

---

## AI-Assisted Contributions

If you are using an AI assistant (Claude, Copilot, Cursor, etc.):

- The AI must follow `AGENTS.md` and `CLAUDE.md` rules at all times
- AI-generated commits should include `[ai]` in the message for audit logging:
  ```
  feat(auth): add token refresh logic [ai]
  ```
- All AI-generated changes **must be reviewed by a human** before merging
- Do not allow the AI to push directly — always review the diff first

---

## Pull Request Process

1. Describe **what** changed and **why**
2. Note if the change is AI-assisted
3. Ensure CI passes (secret scan must be green)
4. Request review from a `CODEOWNER` if applicable

---

## Adding Skills

New AI skill files go in `.agent/skills/`. Use the existing skills as a template.
Each skill should have a clear name, trigger condition, and step-by-step instructions.
