---
title: Maintenance
description: Keep the server healthy over time with updates, validation, and backups.
---

# Maintenance

## Weekly or after important changes

Run:
```fish
./scripts/status-all.fish
./scripts/check-disk.fish
```

## Monthly

Run:
```fish
./scripts/update-all.fish
./scripts/check-homebrew.fish
```

Also review:
- Ollama model disk usage
- external media mount behavior
- OrbStack startup behavior after reboot/login

## After macOS updates

Re-check:
- power settings
- headless behavior
- OrbStack assumptions
- service health summary

## Backup scope

At minimum back up:
- repo contents
- `config/machine.env`
- `compose/.env`
- Open WebUI data
- Jellyfin config
- media source data
- Ollama model inventory or re-pull strategy

## Golden rule

Do not update everything blindly without a validation pass afterward.
