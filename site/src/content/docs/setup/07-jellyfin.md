---
title: 7. Jellyfin
description: Deploy the media server, choose storage, and validate playback.
---

# 7. Jellyfin

## 7.1 Choose where media will live

Document this before deployment.

Preferred order for this repo:
1. external drive
2. NAS mount with stable startup behavior
3. local SSD for smaller or temporary use

## 7.2 Prepare `compose/.env`

Minimum values:
```dotenv
JELLYFIN_MEDIA_PATH=/Volumes/Media
JELLYFIN_HTTP_PORT=8096
JELLYFIN_HTTPS_PORT=8920
```

## 7.3 Deploy it

Run:
```fish
./scripts/deploy-jellyfin.fish
```

The script expects the media path to exist first.

## 7.4 Validate it

Run:
```fish
./scripts/check-jellyfin.fish
```

## 7.5 Complete initial UI setup

Open:
- local: `http://127.0.0.1:8096/web`
- LAN: `http://macbook-air.local:8096/web`

Then:
1. complete the setup wizard
2. add a library from `/media`
3. verify scan results
4. play at least one known-good file

## 7.6 Important expectation on Apple Silicon

Prefer **direct play** where possible. Do not assume a Linux-like hardware transcoding story on macOS + OrbStack.

## What comes after setup

Once Jellyfin works, move on to health checks, maintenance, backup, and recovery.
