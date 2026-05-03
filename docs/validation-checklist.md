# Validation Checklist

Use this checklist after setup changes, after reboot testing, and after recovery work.

## Identity and access
- [ ] `scutil --get HostName` returns the expected hostname
- [ ] local user matches the documented operator account
- [ ] SSH is enabled and reachable from another LAN machine
- [ ] Screen Sharing fallback works if enabled

## Boot and login
- [ ] machine auto-logs in as expected after reboot
- [ ] required login-triggered apps or services start successfully
- [ ] reboot recovery behavior is documented if anything still needs manual intervention

## Power and headless behavior
- [ ] `scripts/check-pmset.sh` reports the intended settings
- [ ] machine stays awake on power as intended
- [ ] lid-closed behavior is verified with the dummy display workflow
- [ ] machine remains reachable over SSH when headless

## Package and runtime foundation
- [ ] `scripts/check-homebrew.sh` passes once added
- [ ] `scripts/check-orbstack.sh` reports healthy state
- [ ] compose stack starts without missing env vars or mount errors

## Ollama
- [ ] `scripts/check-ollama.sh` reports the service as reachable
- [ ] remote LAN access to port `11434` works if intentionally exposed
- [ ] a smoke test prompt succeeds
- [ ] logs or runtime output indicate Metal acceleration is active

## Open WebUI
- [ ] container is running
- [ ] web UI loads from another LAN device
- [ ] login/admin bootstrap is complete
- [ ] model discovery and inference through Ollama work

## Jellyfin
- [ ] container is running
- [ ] web UI loads from another LAN device
- [ ] media mounts are present and readable
- [ ] playback succeeds for at least one known-good test file

## Documentation integrity
- [ ] scripts, runbooks, and docs reflect the current setup
- [ ] machine-specific values are captured in local env files, not committed secrets
- [ ] rollback or recovery notes exist for risky changes
