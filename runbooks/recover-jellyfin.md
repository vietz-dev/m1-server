# Runbook: Recover Jellyfin

## Goal
Restore Jellyfin when the UI is down or the media mount is broken.

## Steps
1. Run:
   ```bash
   ./scripts/check-jellyfin.sh
   ```
2. Confirm `JELLYFIN_MEDIA_PATH` exists and is readable.
3. If the container is absent or stopped, redeploy:
   ```bash
   ./scripts/deploy-jellyfin.sh
   ```
4. Re-check the container and listener.
5. Open the UI and confirm the library is still present.

## Common causes
- media path missing after reboot
- external drive or NAS not mounted
- OrbStack unavailable
- container not restarted after runtime recovery
