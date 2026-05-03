# Runbook: Repository Bootstrap

## Goal
Prepare this repository to act as the source of truth for the MacBook Air M1 server.

## Included foundations
- repository structure for scripts, runbooks, docs, compose, config, and launchd artifacts
- `Brewfile` for reproducible package installation
- `.env.example` templates for compose and machine-specific settings
- standards for script naming and idempotent behavior
- architecture and decision records in `docs/`

## Local operator steps
1. Copy machine config template when ready:
```bash
cp config/machine.env.example config/machine.env
```
2. Fill in environment-specific values.
3. Keep secrets out of git.
4. Update docs whenever automation changes.

## Validation
Confirm these paths exist:
- `scripts/`
- `runbooks/`
- `config/`
- `compose/`
- `launchd/`
- `docs/`
