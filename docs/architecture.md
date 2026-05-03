# Architecture

## Host role
A standalone headless **MacBook Air M1** running as a home server on the local network.

## Workload split
- **Native macOS**
  - Ollama
  - future launchd-managed helper services
- **OrbStack containers**
  - Open WebUI
  - Jellyfin

## Operating model
- Remote administration primarily over SSH
- GUI-only actions documented as runbooks
- Homebrew used for package-level reproducibility
- Docker Compose used for containerized services

## Recovery model
This repository should be sufficient to:
- rebuild the machine after reinstall
- validate current state
- recover common service failures
