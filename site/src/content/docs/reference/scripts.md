---
title: Scripts
description: What each fish script in the repo does.
---

# Scripts

## Install / bootstrap

- `scripts/install-homebrew.fish` — install Homebrew if missing
- `scripts/install-ollama.fish` — install Ollama and start its service

## Package management

- `scripts/brew-bundle.fish` — apply the `Brewfile`
- `scripts/check-homebrew.fish` — verify Homebrew and managed packages
- `scripts/update-brew.fish` — update and clean Homebrew packages

## macOS baseline

- `scripts/check-remote-access.fish` — verify hostname, user, SSH, Screen Sharing listeners
- `scripts/configure-pmset.fish` — apply server-style power settings
- `scripts/check-pmset.fish` — validate current power settings

## Container runtime and services

- `scripts/check-orbstack.fish` — validate OrbStack/Docker state
- `scripts/deploy-open-webui.fish` — deploy Open WebUI
- `scripts/check-open-webui.fish` — validate Open WebUI container and web health
- `scripts/deploy-jellyfin.fish` — deploy Jellyfin after media-path checks
- `scripts/check-jellyfin.fish` — validate Jellyfin container and mount state
- `scripts/update-containers.fish` — pull and redeploy container images

## Ollama

- `scripts/check-ollama.fish` — validate service state, listener, API reachability, and logs
- `scripts/ollama-pull-models.fish` — pull documented models
- `scripts/ollama-list-models.fish` — list installed models
- `scripts/ollama-smoke-test.fish` — send a simple inference request

## Fleet summary and resource checks

- `scripts/status-all.fish` — run the full status summary
- `scripts/check-ports.fish` — inspect key listening ports
- `scripts/check-disk.fish` — inspect disk usage and media-path space
- `scripts/check-memory.fish` — inspect memory pressure
- `scripts/update-all.fish` — run the standard update flow and post-checks

## Optional remote-access integration

- `scripts/install-newt.fish` — install Pangolin Newt and configure launchd
- `scripts/check-newt.fish` — validate binary, config, launchd state, process, and logs

## Shared helper

- `scripts/lib/common.fish` — helper functions for repo scripts
