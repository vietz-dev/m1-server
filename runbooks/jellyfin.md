# Runbook: Jellyfin

## Goal
Deploy Jellyfin in OrbStack and serve media from a documented host media path.

## Prerequisites
- OrbStack is installed and validated with `./scripts/check-orbstack.sh`
- `compose/.env` exists and is based on `compose/.env.example`
- `JELLYFIN_MEDIA_PATH` points to a real readable media directory
- storage choice is documented in `docs/media-storage.md`

## Required config
Set at minimum in `compose/.env`:
```dotenv
JELLYFIN_MEDIA_PATH=/Volumes/Media
JELLYFIN_HTTP_PORT=8096
JELLYFIN_HTTPS_PORT=8920
```

## Deploy
Run:
```bash
./scripts/deploy-jellyfin.sh
```

## Initial setup
1. Open Jellyfin in a browser:
   - local: `http://127.0.0.1:8096/web`
   - LAN: `http://macbook-air.local:8096/web`
2. Complete the first-run setup wizard.
3. Add at least one library from `/media`.
4. Scan the library and verify items appear.

## Validate
Run:
```bash
./scripts/check-jellyfin.sh
```

Then confirm manually:
1. UI access works from another LAN device
2. the media library is visible
3. at least one known-good file plays successfully
4. direct play behavior is acceptable for your target clients

## Rollback
- stop or remove the service:
  ```bash
  docker compose --env-file compose/.env -f compose/docker-compose.yml stop jellyfin
  docker compose --env-file compose/.env -f compose/docker-compose.yml rm -f jellyfin
  ```
- if mounts or ports are wrong, fix `compose/.env` and redeploy
- if you need a full reset, remove Jellyfin volumes only if you intend to wipe app state

## Related files
- `compose/docker-compose.yml`
- `compose/.env.example`
- `docs/media-storage.md`
- `docs/jellyfin.md`
- `scripts/deploy-jellyfin.sh`
- `scripts/check-jellyfin.sh`
