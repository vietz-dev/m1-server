---
title: Bring-Up Checklist
description: A concise checklist for turning a clean MacBook into the documented server.
---

# Bring-Up Checklist

Use this as the short operator version of the full guide.

## 1. Base identity and access

- [ ] set hostname to `macbook-air`
- [ ] verify the intended local user
- [ ] enable Remote Login
- [ ] optionally enable Screen Sharing
- [ ] record LAN identity in your local notes
- [ ] run `./scripts/check-remote-access.fish`

## 2. Boot and power behavior

- [ ] decide whether to enable auto-login
- [ ] apply `sudo ./scripts/configure-pmset.fish`
- [ ] run `./scripts/check-pmset.fish`
- [ ] test lid-close behavior
- [ ] test reboot without a real monitor if you expect headless use

## 3. Package baseline

- [ ] run `./scripts/install-homebrew.fish`
- [ ] if needed, load brew into the current shell
- [ ] run `./scripts/brew-bundle.fish`
- [ ] run `./scripts/check-homebrew.fish`
- [ ] switch the user shell to fish if desired

## 4. Runtime and services

- [ ] first-launch OrbStack and validate it
- [ ] install/start Ollama
- [ ] pull at least one model
- [ ] deploy Open WebUI
- [ ] choose a Jellyfin media path
- [ ] deploy Jellyfin

## 5. LAN validation

- [ ] SSH works from another machine
- [ ] `curl http://macbook-air.local:11434/api/tags` works if Ollama is intentionally exposed
- [ ] Open WebUI loads from another LAN device
- [ ] Jellyfin loads from another LAN device

## 6. Day-2 readiness

- [ ] run `./scripts/status-all.fish`
- [ ] read the recovery runbooks
- [ ] document backup choices
- [ ] replace placeholder secrets in local env files
