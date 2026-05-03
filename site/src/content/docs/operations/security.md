---
title: Security
description: Understand the current trusted-LAN security posture of this stack.
---

# Security

## Current posture

This stack is documented as **trusted-LAN only**.

That means:
- no public internet exposure for Ollama, Open WebUI, or Jellyfin
- SSH should be reachable only from trusted home-network devices
- Screen Sharing should stay optional and limited to recovery needs

## Exposed services to review

- `22` — SSH
- `5900` — Screen Sharing fallback
- `11434` — Ollama
- `3000` — Open WebUI by default
- `8096` / `8920` — Jellyfin

## Secrets hygiene

Never commit real secrets to git.

Use local untracked files for real values:
- `config/machine.env`
- `compose/.env`

Especially replace placeholders such as:
- `OPEN_WEBUI_SECRET_KEY=change-me`

## Firewall guidance

Preferred posture for now:
- keep macOS firewall enabled if possible
- allow only the traffic required by the intended LAN-only model
- record exceptions in your local machine notes

## Future changes that should trigger a security review

- enabling Tailscale or any remote-access overlay
- exposing services outside the LAN
- adding a GitHub Actions runner
- widening client access beyond trusted household devices
