---
name: service-health-audit
description: Audit service health for this Mac homelab stack. Use when checking Ollama, OrbStack, Docker/compose containers, launchd or brew services, ports, and cross-service reachability.
---

# Service Health Audit

Use this skill for health checks and operational audits across the stack.

## Primary targets
- Ollama
- OrbStack
- Open WebUI container
- Jellyfin container
- SSH / remote access
- open ports and bind addresses
- brew services / launchd state

## Preferred sources
- existing `scripts/check-*.fish`
- `scripts/status-all.fish` when available
- compose manifests and env templates
- service-specific docs in `docs/`
- recovery runbooks in `runbooks/`

## Audit flow
1. Read relevant docs and current compose/service config.
2. Run read-only checks first.
3. Verify process/service state.
4. Verify network reachability and intended port exposure.
5. Check for obvious mount, config, or dependency mismatches.
6. Summarize healthy, degraded, and failed components.

## Expected report format
- healthy
- failed or risky
- likely causes
- exact validation used
- next repair steps

## Rules
- prefer scripts over bespoke command sequences
- if a useful audit is missing, add a reusable `check-*` or `status-*` script
- if a common failure pattern appears, capture it in docs or a recovery runbook
