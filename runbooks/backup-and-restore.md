# Runbook: Backup and Restore

## Goal
Define what must be backed up to recover this server with minimal manual reconstruction.

## What to back up
### Required
- this repo
- `compose/.env`
- `config/machine.env`
- Open WebUI data volume (`open-webui-data`)
- Jellyfin config volume (`jellyfin-config`)

### Depending on final operating model
- Jellyfin cache volume if preserving cache is useful
- list of installed Ollama models and any local model strategy notes
- media library data at the storage layer (external drive or NAS)

## What does not need to be the primary backup target
- the `jellyfin-cache` volume in most cases
- re-downloadable Homebrew packages
- easily re-pulled Ollama models if you accept restore time and bandwidth cost

## Backup checklist
1. Ensure service config files are copied:
   - `compose/.env`
   - `config/machine.env`
2. Ensure repo contents are backed up.
3. Capture current model inventory:
   ```bash
   ./scripts/ollama-list-models.sh
   ```
4. Back up named volumes for Open WebUI and Jellyfin config.
5. Back up the media source itself if it is not already protected elsewhere.

## Restore checklist
1. Restore the repo.
2. Restore `compose/.env` and `config/machine.env`.
3. Reinstall Homebrew packages and services.
4. Restore Open WebUI and Jellyfin persistent data.
5. Reconnect or restore the media source.
6. Reinstall or re-pull Ollama models as needed.
7. Run:
   ```bash
   ./scripts/status-all.sh
   ```
8. Re-test LAN access to Ollama, Open WebUI, and Jellyfin.

## Notes
- If model cache backup is skipped, document that re-pull time is part of recovery.
- Keep secrets out of git even if the repo itself is backed up.
