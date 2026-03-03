---
name: review-port-exposure
description: Static analysis of config and IaC files for unnecessarily exposed ports or services before deployment
---

# Skill: Review Port Exposure

Use this skill when asked to review a project before deployment, or when adding/changing Docker, server, or infrastructure config files.

This is **static analysis only** — reviewing files, not scanning live deployments.

---

## What to Check

### 1. Dockerfile / docker-compose.yml

- Flag any `EXPOSE 22` (SSH should never be exposed in an application container)
- Flag wide port ranges: `EXPOSE 1-65535` — always wrong
- In `docker-compose.yml`, check `ports:` mappings:
  - `"0.0.0.0:8080:8080"` → binds to all interfaces, flag if unexpected
  - `"127.0.0.1:8080:8080"` → loopback only, safe for local dev
  - `"8080:8080"` → defaults to `0.0.0.0`, flag if in production context
- Administrative ports exposed unnecessarily: `5432` (Postgres), `6379` (Redis), `27017` (Mongo) should **never** be publicly exposed

### 2. Server Startup Code

Search for patterns like:
```js
app.listen(PORT, '0.0.0.0')  // ⚠️ binds to all interfaces
app.listen(PORT)              // check: what does PORT default to?
app.listen(PORT, 'localhost') // ✅ safe
```
Flag `0.0.0.0` bindings in production configurations.

### 3. Infrastructure as Code (Terraform, CloudFormation)

- Security group rules with `0.0.0.0/0` (open to the entire internet):
  - Port `22` (SSH) — almost always wrong
  - Port `3389` (RDP) — almost always wrong
  - Port `*` (any) — always wrong
- Acceptable: `0.0.0.0/0` on ports `80` and `443` for public web servers
- Flag any database ports (`5432`, `3306`, `27017`, `6379`) open to `0.0.0.0/0`

### 4. Environment / Config Files

- Check `.env.example` and config files for `HOST=0.0.0.0` in production contexts
- Note any hardcoded port numbers — these should be environment variables

---

## How to Report Findings

For each issue found, report:
1. **File and line number**
2. **What was found** (e.g. `EXPOSE 22`)
3. **Why it is risky**
4. **Suggested fix**

Example:
```
⚠️  docker-compose.yml:14
    Found: "5432:5432" — Postgres port exposed to host
    Risk:  Database directly reachable from outside the container network
    Fix:   Remove port mapping unless local admin access is required.
           Use internal Docker networking instead.
```

---

## What NOT to Do

- Do not run `nmap`, `netstat`, or any live port scanning — that is infrastructure's responsibility
- Do not make any network requests
- Do not modify infrastructure files without explicit user instruction — report findings only

---

## Runtime Scanning (Hand-off to Infrastructure)

For live deployment scanning, recommend these tools to the user:
- **[Trivy](https://trivy.dev/)** — container and IaC vulnerability scanner
- **[Checkov](https://www.checkov.io/)** — Terraform/CloudFormation security policy checks
- **[AWS Security Hub](https://aws.amazon.com/security-hub/)** / **GCP Security Command Center** — cloud-native runtime scanning
- **[Nmap](https://nmap.org/)** — network port scanner (run by ops, not the AI)
