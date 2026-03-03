# Project Directives — Non Negotiable

## Git Hooks
This project uses a pre-commit secret scanner. After cloning, run once:
```bash
bash setup-hooks.sh
```
This activates `.githooks/pre-commit` which blocks commits containing secrets, API keys, private keys, or sensitive files.

These rules apply to all AI assistants working in this project. They are not suggestions.

## What You May Do
- Read, write, and edit files within this project
- Run `npm run <script>` commands
- Use git: `add`, `commit`, `status`, `diff`
- Create new files

## What You Must Never Do
- Install, uninstall, or add packages (`npm install`, `yarn add`, `pip install`, etc.)
- Delete files or directories (`rm`, `rm -rf`, `rmdir`)
- Make external network requests (`curl`, `wget`, `ssh`, `scp`)
- Read sensitive files: `.env`, `.env.*`, `*.pem`, `*.key`, `*credential*`
- Push to git without explicit user instruction

## Code Behaviour
- Never overwrite files without showing the diff first and getting approval
- Always explain what you are about to do before doing it
- If unsure, ask — do not assume

## Security
- Never log, echo, or expose contents of sensitive files
- Never suggest storing secrets in code or comments
