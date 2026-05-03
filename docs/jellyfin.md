# Jellyfin

## Deployment model
Jellyfin runs in OrbStack using the shared Compose file:
- `compose/docker-compose.yml`

## Ports and network mode
Port mappings:
- `JELLYFIN_HTTP_PORT` host -> container `8096`
- `JELLYFIN_HTTPS_PORT` host -> container `8920`

Current approach:
- bridge networking with explicit port mappings
- LAN access from trusted clients
- no special host-network mode assumptions

## Storage and mounts
Jellyfin uses:
- named volume `jellyfin-config` for application config
- named volume `jellyfin-cache` for cache/transient data
- bind mount `JELLYFIN_MEDIA_PATH` -> `/media:ro` for the library

See `docs/media-storage.md` for the storage plan.

## Apple Silicon considerations
- do not assume full hardware transcoding parity with Linux GPU setups
- prefer direct play where possible
- validate real playback behavior before depending on transcoding-heavy workflows
- OrbStack/macOS behavior may limit expectations compared with native Linux hosts

## Deployment and checks
Deploy with:
```bash
./scripts/deploy-jellyfin.sh
```

Validate with:
```bash
./scripts/check-jellyfin.sh
```

## Validation goals
- container is running
- web UI loads on the configured LAN port
- media path is mounted and readable
- at least one known-good file plays successfully
