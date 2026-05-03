# Media Storage

## Current storage plan
Start with a host bind mount for Jellyfin media:
- `JELLYFIN_MEDIA_PATH` on the Mac host
- mounted into the container at `/media` as read-only

## Initial decision
Preferred order for this project:
1. external drive if available and reliable
2. NAS mount if it can be mounted predictably at boot/login
3. local SSD only for temporary testing or small libraries

## Mount and permissions strategy
- keep the source media path explicit in `compose/.env`
- mount media read-only into Jellyfin
- avoid storing irreplaceable media inside container volumes
- ensure the host user/session and OrbStack can read the source path

## Why this approach
- media libraries are operator-owned data, not app state
- host bind mounts are easier to reason about for backups and migrations
- read-only access lowers the chance of accidental media changes from the app

## Notes by storage option
### External drive
- good default for larger libraries
- verify mount path stability after reboot
- verify the drive is available before deploying Jellyfin

### NAS mount
- good when centralizing storage elsewhere
- requires stable mount behavior and startup validation
- confirm performance is acceptable for streaming and library scans

### Local SSD
- acceptable for initial smoke testing
- less desirable for larger libraries because of laptop SSD capacity pressure

## Validation
Before deploy:
```bash
ls -ld "$JELLYFIN_MEDIA_PATH"
```

After deploy:
```bash
./scripts/check-jellyfin.sh
```
