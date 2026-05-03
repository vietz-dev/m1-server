# Maintenance

## Recommended cadence
### Weekly or after major changes
- run `./scripts/status-all.fish`
- check free disk with `./scripts/check-disk.fish`
- confirm key services are still reachable

### Monthly
- run `./scripts/update-all.fish`
- re-run `./scripts/check-homebrew.fish`
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
   ```fish
   ./scripts/update-all.fish
   ```
3. Review failures or warnings.
4. Validate the stack with:
   ```fish
   ./scripts/status-all.fish
   ```
5. If needed, follow the matching recovery runbook.

## High-risk areas
- low free disk before pulling or updating Ollama models
- missing external media paths before Jellyfin restart
- OrbStack not starting after reboot/login
- GUI-only approvals changing after app or OS updates
- third-party remote-access agents such as Newt failing after OS or launchd changes
