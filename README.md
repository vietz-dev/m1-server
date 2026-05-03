# m1-server

Source of truth for repurposing a headless **MacBook Air M1** into a home server.

## Priorities
1. Native **Ollama** with Metal acceleration
2. **Open WebUI** via OrbStack
3. **Jellyfin** via OrbStack
4. Operational runbooks and recovery docs

## Principles
- Automate everything practical
- Document every manual/macOS GUI step
- Keep scripts idempotent where possible
- Treat this repo as rebuild + recovery documentation

## Planned layout
- `scripts/` – setup, validation, maintenance scripts
- `runbooks/` – manual/operator procedures
- `compose/` – container workloads
- `docs/` – architecture, decisions, troubleshooting
- `config/` – config templates and env examples
- `launchd/` – native service definitions/templates

## Architecture
- **Native macOS:** Ollama
- **OrbStack containers:** Open WebUI, Jellyfin
- **Future:** GitHub Actions runner

## Standards
- Script conventions and idempotency rules: `docs/repo-standards.md`
- Machine-specific config template: `config/machine.env.example`
- Compose config template: `compose/.env.example`
- Baseline package decisions: `docs/tooling.md`
- Fish shell setup: `runbooks/fish-shell.md`

## Current focus
- Base macOS headless setup
- Homebrew bootstrap and package validation
- OrbStack first-launch/runbook
- Native Ollama service, model management, and validation
- Open WebUI deployment, admin bootstrap, and validation
- Jellyfin deployment, media storage planning, and validation
- Cross-service status, logging, recovery, security, and maintenance runbooks

See `TODO.md` for the full plan.
