# Containers

## Runtime choice
OrbStack is the container runtime for this MacBook Air M1.

## Compose layout decision
Use a single repo-managed Compose file at:
- `compose/docker-compose.yml`

Rationale:
- keeps the initial stack simple
- makes shared defaults easier to manage
- supports a single validation path with `docker compose config`
- fits the current scope of Open WebUI + Jellyfin

If the stack grows significantly later, split files can be reconsidered.

## Persistence strategy
### Named volumes
Use named volumes for app-managed state:
- `open-webui-data` for Open WebUI application data
- `jellyfin-config` for Jellyfin application config
- `jellyfin-cache` for Jellyfin cache/transient data

Rationale:
- simpler initial setup on macOS
- avoids unnecessary host-path coupling for internal app data
- easier to recreate the stack from documented mounts and Compose config

### Bind mounts
Use bind mounts for operator-owned content that must map to a real host path:
- `JELLYFIN_MEDIA_PATH` → `/media:ro`

Rationale:
- media libraries live outside the container lifecycle
- host path stays explicit and machine-specific
- read-only mount reduces accidental writes from Jellyfin

## Startup and persistence expectations
- OrbStack must start successfully after login or reboot according to the chosen desktop-session model.
- Containers should use restart policies so they recover automatically once the runtime is available.
- Reboot validation must confirm both OrbStack availability and container recovery behavior.

## Storage and backup considerations
Back up or otherwise account for:
- repo contents
- `compose/.env`
- Open WebUI persistent data in the named volume
- Jellyfin config and cache strategy as needed
- media data at the host storage layer, not inside the container

## Validation
Use:
```bash
./scripts/check-orbstack.sh
```

Expected high-level signals:
- OrbStack app installed
- Docker daemon reachable
- active Docker context is `orbstack`
- compose file validates

And when Docker is available:
```bash
docker compose -f compose/docker-compose.yml config
```

## Related files
- `compose/docker-compose.yml`
- `compose/.env.example`
- `runbooks/orbstack-first-launch.md`
- `scripts/check-orbstack.sh`
