---
title: 6. Open WebUI
description: Deploy the LAN-accessible browser UI that talks to native Ollama.
---

# 6. Open WebUI

## What it does

Open WebUI provides the browser interface for your Ollama models.

## 6.1 Prepare `compose/.env`

Create a local env file from the example and set real values.

Minimum values:
```dotenv
OLLAMA_BASE_URL=http://host.docker.internal:11434
OPEN_WEBUI_PORT=3000
OPEN_WEBUI_SECRET_KEY=<set-a-real-secret>
```

## 6.2 Deploy it

Run:
```fish
./scripts/deploy-open-webui.fish
```

## 6.3 Validate container and HTTP health

Run:
```fish
./scripts/check-open-webui.fish
```

## 6.4 Complete UI bootstrap

Open:
- local: `http://127.0.0.1:3000`
- LAN: `http://macbook-air.local:3000`

Then:
1. create the first user/admin
2. confirm model list visibility
3. run a test prompt

## 6.5 Common failure modes

If it comes up but cannot see models, check:
- whether Ollama is healthy
- whether `OLLAMA_BASE_URL` is correct
- whether OrbStack networking is healthy

## Next step

Continue to:
- [7. Jellyfin](/setup/07-jellyfin/)
