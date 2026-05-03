# Runbook: Open WebUI

## Goal
Deploy Open WebUI in OrbStack and connect it to the native Ollama API.

## Prerequisites
- OrbStack is installed and validated with `./scripts/check-orbstack.sh`
- Ollama is installed and validated with `./scripts/check-ollama.sh`
- `compose/.env` exists and is based on `compose/.env.example`

## Required config
Set at minimum in `compose/.env`:
```dotenv
OLLAMA_BASE_URL=http://host.docker.internal:11434
OPEN_WEBUI_PORT=3000
OPEN_WEBUI_SECRET_KEY=<set-a-real-secret>
```

## Deploy
Run:
```bash
./scripts/deploy-open-webui.sh
```

## Admin bootstrap
1. Open the UI in a browser:
   - local: `http://127.0.0.1:3000`
   - LAN: `http://macbook-air.local:3000`
2. Complete the first-user/admin setup flow.
3. Confirm the UI can see the Ollama-backed models.

## Validate
Run:
```bash
./scripts/check-open-webui.sh
```

Then confirm manually:
1. login works from another LAN device
2. model list appears in the UI
3. a test prompt returns a response

## Backup and restore notes
Open WebUI data is stored in the named volume `open-webui-data`.
Capture at minimum:
- `compose/.env`
- the Open WebUI named volume data
- any admin/bootstrap notes needed for recovery

## Rollback
- stop or remove the service:
  ```bash
  docker compose --env-file compose/.env -f compose/docker-compose.yml stop open-webui
  docker compose --env-file compose/.env -f compose/docker-compose.yml rm -f open-webui
  ```
- if the configuration is wrong, fix `compose/.env` and redeploy
- if you need a full reset, remove the `open-webui-data` volume only if you intend to wipe application state

## Related files
- `compose/docker-compose.yml`
- `compose/.env.example`
- `scripts/deploy-open-webui.sh`
- `scripts/check-open-webui.sh`
- `docs/containers.md`
