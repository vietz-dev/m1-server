---
name: macos-server-bootstrap
description: Validate and bootstrap a headless macOS server baseline for this repo. Use when checking hostname, SSH, auto-login, power settings, and prerequisite readiness before deploying services.
---

# macOS Server Bootstrap

Use this skill when working on base machine readiness for the MacBook Air M1 server.

## Goals
- validate the host against the repo's desired state
- report missing prerequisites before app deployment
- prefer check scripts and repo docs over ad-hoc commands

## Repo context
Expected state is documented in:
- `docs/desired-state.md`
- `docs/networking.md`
- `docs/pi-operator-guide.md`
- `docs/validation-checklist.md`

Relevant scripts/runbooks:
- `scripts/check-remote-access.sh`
- `scripts/check-pmset.sh`
- `scripts/configure-pmset.sh`
- `runbooks/enable-remote-access.md`
- `runbooks/enable-auto-login.md`
- `runbooks/power-management.md`

## Workflow
1. Read the desired-state and validation docs.
2. Reuse existing `check-*` scripts if available.
3. Validate at minimum:
   - hostname and local user assumptions
   - SSH / Remote Login readiness
   - auto-login status if required by the current goal
   - power policy and sleep-related settings
4. Summarize gaps as prerequisites, not hidden assumptions.
5. If a missing check should be repeatable, add or improve a script.
6. If a missing step is GUI-only, add or improve a runbook.

## Expected output
Provide:
- current state found
- mismatches from desired state
- exact follow-up actions
- validation commands or scripts to rerun
- rollback notes if you changed system behavior

## Rules
- prefer read-only validation first
- do not claim GUI-only settings were automated unless they truly were
- keep operational knowledge in repo docs and runbooks
