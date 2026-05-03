---
title: Architecture Overview
description: Understand how workloads are split across native macOS and OrbStack.
---

# Architecture Overview

## Role of this machine

A standalone **Apple Silicon MacBook** running as a headless home server on the local network.

## Workload split

### Native on macOS
- Ollama
- any future helper services managed by launchd or Homebrew services

### Containerized in OrbStack
- Open WebUI
- Jellyfin

## Why this split exists

### Why Ollama is native
Ollama runs directly on macOS so it can use Apple Silicon / Metal instead of being forced through a more constrained container path.

### Why Open WebUI and Jellyfin are containers
These are app-style workloads with clear ports, persistent data, and restart behavior that fit well in a Docker-compatible environment.

## Access model

- primary admin path: SSH
- fallback GUI path: Screen Sharing
- trusted network scope: home LAN only

## Config model

Tracked examples:
- `config/machine.env.example`
- `compose/.env.example`

Local untracked files:
- `config/machine.env`
- `compose/.env`

## Persistence model

### Named volumes
- `open-webui-data`
- `jellyfin-config`
- `jellyfin-cache`

### Host bind mounts
- Jellyfin media path mounted read-only into `/media`

## Rebuild model

The repo is intended to be sufficient to:
- rebuild the machine after reinstall
- validate current state
- recover common failures
