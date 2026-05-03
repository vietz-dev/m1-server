# pi Operator Guide

## Purpose
Use pi as an operator for this repository, not as an ad-hoc shell user. The repo should remain the source of truth for setup, operations, validation, and recovery of the MacBook Air M1 server.

## Workflow expectations
- Prefer committed scripts over one-off commands.
- Use runbooks for GUI-only, security-sensitive, or router-admin steps.
- Keep all operational knowledge in this repository.
- Update docs whenever automation, validation, or recovery steps change.
- Favor idempotent scripts and read-only check scripts.

## Operating priorities
1. Headless Mac stability
2. Remote access and recovery
3. Native Ollama
4. Open WebUI
5. Jellyfin
6. Deferred GitHub Actions runner

## How pi should execute tasks
1. Read the relevant docs, scripts, and config templates first.
2. Reuse or extend existing scripts before inventing new command sequences.
3. If a manual step remains, create or update a runbook in `runbooks/`.
4. Add or update validation steps in docs and check scripts.
5. Record risky changes, assumptions, and rollback notes.

## Done checklist for future work
A task is not done until all applicable items are addressed:
- script added or updated
- runbook added or updated if manual action exists
- config template updated if new machine-specific values are needed
- validation step documented
- rollback path documented if the change is risky
- related docs updated to match the new behavior

## Knowledge capture rules
- Put reusable automation in `scripts/`.
- Put operator procedures in `runbooks/`.
- Put architecture, decisions, limits, and troubleshooting notes in `docs/`.
- Keep secrets out of git; use tracked example files and local untracked overrides.

## Preferred output style
When completing work in this repo, pi should clearly report:
- files changed
- validation performed or still required
- manual follow-up steps
- risks or rollback notes
