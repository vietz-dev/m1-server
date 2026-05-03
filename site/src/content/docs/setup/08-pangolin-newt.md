---
title: 8. Pangolin / Newt (Optional)
description: Install the Pangolin Newt agent on macOS using launchd instead of the upstream Linux systemd workflow.
---

# 8. Pangolin / Newt (Optional)

## Why this page exists

The official Pangolin / Newt guide you supplied is Linux-oriented and assumes:
- `/etc/newt/newt.env`
- `systemd`
- `systemctl`

This repo adapts that setup for **macOS** using **launchd**.

## What the macOS version does

The repo provides:
- `config/newt.env.example`
- `scripts/install-newt.fish`
- `scripts/check-newt.fish`
- `launchd/net.pangolin.newt.plist.template`
- `launchd/newt-launch.fish`
- `runbooks/pangolin-newt.md`

## 8.1 Create local config

Copy the example and fill in real values:
```fish
cp config/newt.env.example config/newt.env
```

Example shape:
```dotenv
NEWT_ID=your-id
NEWT_SECRET=your-secret
PANGOLIN_ENDPOINT=https://pangolin.example.com
```

## 8.2 Install and start the agent

Run:
```fish
sudo ./scripts/install-newt.fish
```

This will:
- run the upstream installer
- create `/etc/newt/newt.env`
- install a launchd wrapper
- install a launch daemon plist
- bootstrap and start the daemon

## 8.3 Validate it

Run:
```fish
./scripts/check-newt.fish
```

Useful follow-up checks:
```fish
sudo launchctl print system/net.pangolin.newt
sudo tail -n 100 /var/log/newt.log
```

## 8.4 Security notes

- do not commit `config/newt.env`
- keep `/etc/newt/newt.env` protected
- treat Pangolin / Newt as separate remote-access infrastructure from SSH, Ollama, and OrbStack

## 8.5 When to use this

Use Pangolin / Newt only if you actually want this Mac reachable through your Pangolin deployment. It is optional and outside the core LAN-only baseline.
