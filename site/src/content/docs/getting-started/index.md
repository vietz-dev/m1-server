---
title: Getting Started
description: Understand what you are building, what is manual, and what the setup flow looks like.
---

# Getting Started

This project is both:
- a **server build guide**
- and a **source-of-truth repo** for rebuilding and operating the machine later

## The setup philosophy

- automate what is safe and repeatable
- write down every GUI-only or router-only step as a runbook
- prefer scripts for checks and repeatable changes
- keep secrets out of git
- treat the repo as recovery documentation, not just install notes

## What is manual vs automated

### Usually automated
- Homebrew installation and package reconciliation
- service checks
- power policy checks
- container deployment
- health summaries

### Usually manual
- enabling Remote Login in System Settings
- enabling auto-login
- first-launching OrbStack
- router DHCP reservation
- testing headless behavior with the lid closed
- approving macOS prompts

## Recommended reading order

1. [Fresh Install Guide](/getting-started/fresh-install/)
2. [Architecture Overview](/architecture/)
3. [Base macOS Setup](/setup/02-base-macos/)
4. [Homebrew and Fish](/setup/03-homebrew-and-fish/)
5. [OrbStack](/setup/04-orbstack/)
6. [Ollama](/setup/05-ollama/)
7. [Open WebUI](/setup/06-open-webui/)
8. [Jellyfin](/setup/07-jellyfin/)
9. [Health Checks](/operations/health-checks/)
10. [Recovery](/operations/recovery/)
