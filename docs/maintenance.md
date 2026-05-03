# Maintenance

## Recommended cadence
### Weekly or after major changes
- run `./scripts/status-all.sh`
- check free disk with `./scripts/check-disk.sh`
- confirm key services are still reachable

### Monthly
- run `./scripts/update-all.sh`
- re-run `./scripts/check-homebrew.sh`
- review installed Ollama models and disk usage
- confirm external media mounts still behave as expected after reboot/login

### After macOS updates
- re-check `pmset` behavior
- re-check headless/lid-closed behavior
- re-check OrbStack first-launch or permission assumptions if anything changed
- run the full validation checklist in `docs/validation-checklist.md`

## Standard maintenance workflow
1. Ensure you have a current backup or rollback plan.
2. Run:
   ```bash
   ./scripts/update-all.sh
   ```
3. Review failures or warnings.
4. Validate the stack with:
   ```bash
   ./scripts/status-all.sh
   ```
5. If needed, follow the matching recovery runbook.

## High-risk areas
- low free disk before pulling or updating Ollama models
- missing external media paths before Jellyfin restart
- OrbStack not starting after reboot/login
- GUI-only approvals changing after app or OS updates
