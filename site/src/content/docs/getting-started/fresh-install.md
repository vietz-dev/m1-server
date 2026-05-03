---
title: Fresh Install Guide
description: Step-by-step path for going from a clean macOS install to the documented headless homelab server.
---

# Fresh Install Guide

This is the best page to follow on a **newly installed MacBook**.

## Phase A — Prepare the Mac locally

Before cloning the repo, do the basics:
- complete normal macOS first-boot setup
- connect to your home network
- sign in only as much as needed for app installation
- plug in power
- update macOS if you want to start from a fully current baseline

## Phase B — Clone the repo

Once you have a terminal, clone this repository and enter it.

If `git` is not available yet, install Homebrew first or download the repo another way and continue with the guide.

Then continue with:
- [Prepare the Repo](/setup/01-prepare-repo/)

## Phase C — Make the Mac remotely manageable

This is the most important early step.

Work through:
- [Base macOS Setup](/setup/02-base-macos/)

Your goals are:
- set the hostname
- enable SSH
- optionally enable Screen Sharing
- configure power settings
- decide on auto-login
- verify headless behavior assumptions

Do **not** rush into containers or AI services before remote access is reliable.

## Phase D — Install package baseline and fish

Next, install the baseline toolchain:
- Homebrew
- fish
- tmux
- Ollama
- OrbStack
- other operator tools from the `Brewfile`

Use:
- [Homebrew and Fish](/setup/03-homebrew-and-fish/)

## Phase E — Prepare the container runtime

OrbStack requires a GUI first launch.

Use:
- [OrbStack](/setup/04-orbstack/)

Do this before relying on a fully headless workflow.

## Phase F — Bring up the actual services

In order:
1. [Ollama](/setup/05-ollama/)
2. [Open WebUI](/setup/06-open-webui/)
3. [Jellyfin](/setup/07-jellyfin/)

Why this order?
- Open WebUI depends on Ollama
- Jellyfin depends on your media-path decisions
- both app containers depend on OrbStack being healthy first

## Phase G — Validate and document your final machine state

When the stack is running:
- fill in your local config values
- record final networking details
- run the health checks
- perform LAN validation from another device
- confirm reboot recovery

Use:
- [Health Checks](/operations/health-checks/)
- [Validation Reference](/reference/validation/)
- [Recovery](/operations/recovery/)

## Beginner glossary

### Homebrew
The package manager used to install most host software reproducibly.

### fish
The shell used by this repo for interactive usage and committed scripts.

### OrbStack
A macOS desktop container runtime that provides Docker-compatible workflows.

### Ollama
The native LLM runtime running directly on macOS so Apple Silicon / Metal can be used.

### Open WebUI
A browser-based UI that talks to Ollama.

### Jellyfin
A self-hosted media server exposed on your LAN.
