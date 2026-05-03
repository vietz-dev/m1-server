---
title: 4. OrbStack
description: Install and first-launch the container runtime used by Open WebUI and Jellyfin.
---

# 4. OrbStack

## What OrbStack is doing here

OrbStack is the Docker-compatible runtime for:
- Open WebUI
- Jellyfin

## 4.1 Install it

OrbStack is already part of the `Brewfile`, so after the package baseline you should have the app installed or ready to install.

If needed:
```fish
./scripts/brew-bundle.fish
```

## 4.2 First-launch it locally

This is a GUI step.

1. Open **OrbStack** from Applications.
2. Complete first-launch prompts.
3. Enable Docker compatibility/integration.
4. Accept any permissions needed for normal operation.

## 4.3 Validate it

Run:
```fish
./scripts/check-orbstack.fish
```

You want to see:
- Docker CLI present
- Docker daemon reachable
- compose validation working
- active context aligned with OrbStack

## 4.4 Why this still needs manual attention

A container runtime on macOS behaves like a desktop app, not a simple Linux daemon. That is why first-launch approval and reboot/login testing matter.

## Next step

Continue to:
- [5. Ollama](/setup/05-ollama/)
