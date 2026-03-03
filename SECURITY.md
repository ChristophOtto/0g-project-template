# Security Policy

## Reporting a Vulnerability

If you discover a security vulnerability in this project, please **do not open a public issue**.

Instead, report it privately by:
- Emailing the project maintainer directly (replace with your contact)
- Or opening a [GitHub Security Advisory](https://docs.github.com/en/code-security/security-advisories) if this repo is on GitHub

Please include:
- A description of the vulnerability
- Steps to reproduce
- Potential impact
- Any suggested fix (optional)

We aim to acknowledge reports within **48 hours** and resolve confirmed vulnerabilities within **14 days**.

---

## Supported Versions

| Version | Supported |
|---|---|
| latest (`main`) | ✅ |
| older branches | ❌ |

---

## Security Practices in This Project

This template is designed for **secure AI-assisted development**. Key protections include:

### Code & Secrets
- **`settings.json`** — restricts what AI tools can read and execute
- **`CLAUDE.md` / `AGENTS.md`** — non-negotiable AI directives
- **`pre-commit` hook** — blocks secrets from being staged
- **`pre-push` hook** — scans full commit history + runs `npm audit` before pushing
- **`.gitignore`** — prevents tracking of `.env`, keys, and credentials
- **`gitleaks.toml`** + CI workflow — secret scanning on every push and PR

### Dependency Vulnerabilities (CVE)
- **`npm audit`** — runs locally on push and in CI (`dependency-scan.yml`)
- **OSSF Scorecard** — supply chain security scoring in CI
- **Dependabot** — automated weekly PRs for security patches

### Port Exposure & Infrastructure
The AI assistant can perform **static analysis** of config files for port exposure risks using the `.agent/skills/review-port-exposure.md` skill. This covers:
- Dockerfile / docker-compose port mappings
- Server startup bindings (`0.0.0.0` vs `localhost`)
- IaC security group rules (Terraform, CloudFormation)

For **runtime** and **infrastructure-level** scanning, use dedicated tools:

| Tool | Purpose |
|---|---|
| [Trivy](https://trivy.dev/) | Container image + IaC vulnerability scanning |
| [Checkov](https://www.checkov.io/) | Terraform/CloudFormation security policy checks |
| [Nmap](https://nmap.org/) | Network port scanning (run by ops team) |
| [AWS Security Hub](https://aws.amazon.com/security-hub/) | Cloud-native runtime threat detection |
| [GCP Security Command Center](https://cloud.google.com/security-command-center) | GCP equivalent |

---

## Responsible Disclosure

We follow responsible disclosure principles. All reports are treated confidentially.
