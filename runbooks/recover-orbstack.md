# Runbook: Recover OrbStack

## Goal
Restore Docker/OrbStack when container workloads are down.

## Steps
1. Run:
   ```fish
   ./scripts/check-orbstack.fish
   ```
2. If the Docker context is not `orbstack`, switch back if appropriate.
3. If the app is installed but daemon is unavailable, launch OrbStack via GUI or Screen Sharing.
4. Once OrbStack is healthy, validate the compose file:
   ```fish
   docker compose -f compose/docker-compose.yml config
   ```
5. Restart affected services:
   ```fish
   ./scripts/deploy-open-webui.fish
   ./scripts/deploy-jellyfin.fish
   ```

## Common causes
- OrbStack never completed first launch
- OrbStack did not start after reboot/login
- another Docker context is active
- permissions/startup prompts were not accepted
