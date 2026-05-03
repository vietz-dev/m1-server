---
title: Validation
description: What to verify before you consider the machine ready.
---

# Validation

A machine like this is not really "done" until it has been validated from another device and across a reboot.

## Identity and access

Confirm:
- hostname is correct
- the intended operator account is in use
- SSH works from another LAN machine
- Screen Sharing works if you chose to keep it enabled

## Headless behavior

Confirm:
- the machine stays awake on power as intended
- lid-close behavior matches your expectations
- reboot without a real display still allows recovery

## Runtime baseline

Confirm:
- `./scripts/check-homebrew.fish` passes
- `./scripts/check-orbstack.fish` is healthy
- compose config validates cleanly

## Ollama

Confirm:
- `./scripts/check-ollama.fish` passes
- `./scripts/ollama-smoke-test.fish` works
- LAN API access works if intentionally exposed
- Metal acceleration is actually observed, not just assumed

## Open WebUI

Confirm:
- container is healthy
- login/bootstrap is complete
- model discovery works
- real inference works through the browser

## Jellyfin

Confirm:
- container is healthy
- media path is mounted correctly
- UI loads from another LAN client
- a known-good file plays successfully

## Recovery readiness

Confirm:
- `./scripts/status-all.fish` provides useful output
- recovery runbooks are understandable
- backup choices are documented
- low disk or missing mounts are not silently ignored
