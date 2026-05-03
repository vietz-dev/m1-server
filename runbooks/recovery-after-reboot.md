# Runbook: Recovery After Reboot

## Goal
Recover the stack after a reboot when one or more services did not come back cleanly.

## Checklist
1. Confirm the Mac is reachable over SSH.
2. Run:
   ```bash
   ./scripts/status-all.sh
   ```
3. If OrbStack is not healthy, use `runbooks/recover-orbstack.md`.
4. If Ollama is not healthy, use `runbooks/recover-ollama.md`.
5. If Open WebUI is down but Ollama is healthy, redeploy or inspect the container.
6. If Jellyfin is down, use `runbooks/recover-jellyfin.md`.
7. Re-run `./scripts/status-all.sh` after recovery.

## Common causes
- auto-login did not happen
- OrbStack did not start
- Homebrew service did not restart cleanly
- external media path is missing
- power/login state changed after an update

## Validation
- `./scripts/check-orbstack.sh`
- `./scripts/check-ollama.sh`
- `./scripts/check-open-webui.sh`
- `./scripts/check-jellyfin.sh`
