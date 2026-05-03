---
title: 1. Prepare the Repo
description: Understand the repo layout and the local files you will customize.
---

# 1. Prepare the Repo

## What the repo contains

- `scripts/` — repeatable fish scripts
- `runbooks/` — manual procedures for GUI-only or operator tasks
- `docs/` — architecture, decisions, troubleshooting, and validation docs
- `compose/` — container stack files and env template
- `config/` — machine-level env template

## Local files you will eventually create

### `config/machine.env`
Used for host-specific values such as:
- hostname
- user name
- local DNS name
- Ollama host binding
- default model list
- preferred media path references

Start from:
- `config/machine.env.example`

### `compose/.env`
Used for container-related variables such as:
- Open WebUI port
- Open WebUI secret key
- Jellyfin media path
- Jellyfin ports
- Open WebUI → Ollama base URL

Start from:
- `compose/.env.example`

## Good early habit

Read the example files before changing system state. That helps you understand what the repo expects the final machine to look like.

## Next step

Continue to:
- [2. Base macOS Setup](/setup/02-base-macos/)
