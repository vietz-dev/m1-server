# Common Failures

## Host unreachable on the LAN
Likely causes:
- SSH disabled or not listening
- host slept unexpectedly
- DHCP lease changed or hostname resolution failed
- lid-closed/headless behavior regressed

Checks:
- `./scripts/check-remote-access.fish`
- `./scripts/check-pmset.fish`
- `./scripts/check-ports.fish`
- `runbooks/recover-from-network-loss.md`

## OrbStack/Docker unavailable
Likely causes:
- OrbStack not installed or not started
- wrong Docker context active
- first-launch or permission prompts not completed

Checks:
- `./scripts/check-orbstack.fish`
- `runbooks/recover-orbstack.md`

## Ollama API not responding
Likely causes:
- Ollama not installed
- brew service not running
- listener not bound as expected
- startup/memory issues

Checks:
- `./scripts/check-ollama.fish`
- `./scripts/ollama-smoke-test.fish`
- `runbooks/recover-ollama.md`

## Open WebUI down or cannot see models
Likely causes:
- container not running
- Open WebUI not yet deployed
- Ollama upstream not reachable
- wrong `OLLAMA_BASE_URL`

Checks:
- `./scripts/check-open-webui.fish`
- `./scripts/check-ollama.fish`
- `runbooks/open-webui.md`

## Jellyfin UI down or media missing
Likely causes:
- container not running
- media path missing after reboot
- external drive/NAS unavailable
- listener/port mapping mismatch

Checks:
- `./scripts/check-jellyfin.fish`
- `docs/media-storage.md`
- `runbooks/recover-jellyfin.md`
