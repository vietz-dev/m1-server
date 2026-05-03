---
title: Runbooks
description: A catalog of the manual procedures documented in this repo.
---

# Runbooks

These are the manual procedures you are expected to follow when a task cannot be safely automated.

## Initial setup runbooks

- **Enable Remote Access** — enable SSH and optional Screen Sharing
- **Enable Auto Login** — decide on and configure auto-login
- **Power Management** — apply server-friendly power settings
- **Headless Operation** — validate dummy display, lid-close, and reboot behavior
- **Router Static DHCP Reservation** — reserve a stable LAN IP in your router
- **Homebrew Bootstrap** — install and validate the package baseline
- **Fish Shell** — make fish the preferred login shell
- **OrbStack First Launch** — complete the GUI onboarding and Docker integration
- **Open WebUI** — deploy and bootstrap the browser UI
- **Jellyfin** — deploy and bootstrap the media server
- **Pangolin / Newt** — install the Pangolin agent on macOS using launchd

## Recovery and operations runbooks

- **Recovery After Reboot** — diagnose services that failed to return after restart
- **Recover From Network Loss** — restore LAN access or identify why the host disappeared
- **Recover OrbStack** — restore the Docker runtime
- **Recover Ollama** — restore the native LLM runtime
- **Recover Jellyfin** — restore the media server or media mount
- **Backup and Restore** — define what gets backed up and how restore works

## How to use them well

- use the relevant `check-*` or `status-*` script first
- follow the runbook for the manual portion
- record any machine-specific final decisions in local config or notes
- rerun validation after the manual steps
