# Runbook: Pangolin / Newt

## Goal
Install and run the Pangolin Newt agent on this macOS server using `launchd`.

## Why this differs from the upstream guide
The upstream instructions are Linux-specific and use `systemd`.
This Mac uses `launchd`, so the repo adapts the service setup accordingly.

## Prerequisites
- fish and Homebrew baseline are already installed
- local admin access with `sudo`
- real Pangolin credentials available
- a local file `config/newt.env` created from `config/newt.env.example`

## Prepare local config
Create:
- `config/newt.env`

With values like:
```dotenv
NEWT_ID=your-id
NEWT_SECRET=your-secret
PANGOLIN_ENDPOINT=https://pangolin.example.com
```

## Install and start
Run:
```fish
sudo ./scripts/install-newt.fish
```

## Validate
Run:
```fish
./scripts/check-newt.fish
```

Then inspect:
```fish
sudo tail -n 100 /var/log/newt.log
sudo launchctl print system/net.pangolin.newt
```

## Rollback
Stop and unload the daemon:
```fish
sudo launchctl bootout system /Library/LaunchDaemons/net.pangolin.newt.plist
sudo rm -f /Library/LaunchDaemons/net.pangolin.newt.plist
sudo rm -f /usr/local/libexec/newt-launch.fish
```

Optionally remove config and binary if you intend a full uninstall:
```fish
sudo rm -rf /etc/newt
sudo rm -f /usr/local/bin/newt
```

## Notes
- `config/newt.env` must stay untracked
- the daemon runs as root via `launchd`
- this service is outside the OrbStack/Ollama stack and should be treated as separate remote-access infrastructure
