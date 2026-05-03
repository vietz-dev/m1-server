# Open WebUI

## Deployment model
Open WebUI runs in OrbStack using the shared Compose file:
- `compose/docker-compose.yml`

It connects to native Ollama through:
- `OLLAMA_BASE_URL=http://host.docker.internal:11434`

## Port and LAN accessibility
Default port mapping:
- host `3000` -> container `8080`

This is configurable through:
- `OPEN_WEBUI_PORT` in `compose/.env`

Current intended posture:
- reachable from the local Mac
- reachable from trusted LAN clients for browser access
- not intended for public internet exposure

## Persistence
Open WebUI persistent data is stored in the named volume:
- `open-webui-data`

The UI secret/config input is managed through:
- `OPEN_WEBUI_SECRET_KEY` in `compose/.env`

## Deployment and checks
Deploy with:
```fish
./scripts/deploy-open-webui.fish
```

Validate with:
```fish
./scripts/check-open-webui.fish
```

## Backup/restore considerations
To restore Open WebUI successfully, keep:
- `compose/.env`
- the `open-webui-data` named volume contents
- the documented port and LAN access expectations

## Validation goals
- the container is running
- the web UI loads on the configured port
- login/bootstrap succeeds
- model discovery works through the Ollama API
- inference succeeds through the UI
