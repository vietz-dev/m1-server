# Repository Standards

## Script naming
Use these prefixes consistently:
- `install-*` – install packages or software
- `configure-*` – apply system or service configuration
- `deploy-*` – start or update workloads
- `check-*` – read-only validation and health checks
- `repair-*` – corrective actions for known failure modes
- `update-*` – routine upgrades and refresh operations
- `status-*` – summary views across multiple subsystems

## Script behavior
Scripts should:
- use `#!/usr/bin/env bash`
- use `set -euo pipefail`
- fail loudly with actionable error messages
- be safe to rerun when practical
- avoid destructive changes unless clearly documented
- print enough output to support remote troubleshooting

## Idempotency rules
- Configuration scripts should converge on a desired state when rerun.
- Check scripts must be read-only.
- Install scripts should detect already-installed components and exit cleanly.
- Repair scripts may be more imperative, but must document expected side effects.

## Machine-specific values
Store machine-specific configuration in tracked templates plus local untracked files where needed.

### Tracked templates
- `config/machine.env.example` – hostname, LAN naming, media paths, model choices
- `compose/.env.example` – compose-exposed service variables

### Local untracked files
- `config/machine.env`
- `compose/.env`

Do not commit secrets or environment-specific overrides.
