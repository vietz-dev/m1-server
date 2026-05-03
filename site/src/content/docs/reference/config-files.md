---
title: Config Files
description: Know which files are tracked templates and which ones are local-only machine state.
---

# Config Files

## Tracked example files

### `config/machine.env.example`
Host-level values such as:
- `HOSTNAME`
- `LOCAL_USER`
- `LOCAL_DNS_NAME`
- `LAN_IP`
- `NETWORK_INTERFACE`
- `JELLYFIN_MEDIA_PATH`
- `OLLAMA_HOST`
- `OLLAMA_MODELS`
- `OPEN_WEBUI_PORT`
- `OPEN_WEBUI_SECRET_KEY`
- `JELLYFIN_HTTP_PORT`
- `JELLYFIN_HTTPS_PORT`

### `compose/.env.example`
Container-stack values such as:
- `OLLAMA_BASE_URL`
- `OPEN_WEBUI_PORT`
- `OPEN_WEBUI_SECRET_KEY`
- `JELLYFIN_MEDIA_PATH`
- `JELLYFIN_HTTP_PORT`
- `JELLYFIN_HTTPS_PORT`

## Local untracked files

### `config/machine.env`
Your machine-specific copy.

### `compose/.env`
Your container env copy.

## Rule of thumb

- tracked examples explain the shape of the configuration
- local files hold real values
- secrets belong only in the local files
