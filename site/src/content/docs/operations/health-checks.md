---
title: Health Checks
description: Use the repo scripts to assess host, runtime, and service health.
---

# Health Checks

## Start with the summary view

Run:
```fish
./scripts/status-all.fish
```

This aggregates checks for:
- remote access
- power management
- Homebrew
- OrbStack
- Ollama
- Open WebUI
- Jellyfin
- ports
- disk
- memory

## Useful focused checks

### Remote access
```fish
./scripts/check-remote-access.fish
```

### Power policy
```fish
./scripts/check-pmset.fish
```

### Package baseline
```fish
./scripts/check-homebrew.fish
```

### Container runtime
```fish
./scripts/check-orbstack.fish
```

### AI runtime
```fish
./scripts/check-ollama.fish
./scripts/ollama-smoke-test.fish
```

### App containers
```fish
./scripts/check-open-webui.fish
./scripts/check-jellyfin.fish
```

### Resource checks
```fish
./scripts/check-ports.fish
./scripts/check-disk.fish
./scripts/check-memory.fish
```

## When to run them

- after initial setup
- after reboots
- after macOS updates
- after changing ports, env files, or mounts
- before and after recovery work
