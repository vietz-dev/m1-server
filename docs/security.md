# Security

## Trusted network assumption
This server is intended for a trusted home LAN only.

Current assumption:
- trusted clients are devices on the home subnet
- no direct public internet exposure for Ollama, Open WebUI, or Jellyfin
- remote administration beyond the LAN is deferred until a later decision such as Tailscale

## Service exposure review
### SSH (`22`)
- required for normal administration
- should be reachable only from trusted LAN clients

### Screen Sharing (`5900`)
- optional fallback only
- enable only if needed for GUI recovery

### Ollama (`11434`)
- exposed to the LAN for Open WebUI and operator testing
- should not be exposed beyond the trusted subnet

### Open WebUI (`3000` by default)
- exposed to trusted LAN clients for browser access
- requires an app secret in `compose/.env`

### Jellyfin (`8096` / `8920`)
- exposed to trusted LAN clients for media playback
- review whether HTTPS on `8920` is actually needed in the LAN-only setup

## Firewall posture
Preferred posture for now:
- keep macOS firewall enabled if it does not break intended LAN access
- allow only the services required for the trusted LAN operating model
- document any exceptions in `docs/networking.md`

Because app prompts and firewall approvals can be GUI-driven, final enforcement may require manual review.

## Secrets and config hygiene
- never commit real secrets to git
- store machine-specific values in local untracked files:
  - `config/machine.env`
  - `compose/.env`
- replace placeholder values such as `OPEN_WEBUI_SECRET_KEY=change-me`

## Future review points
Revisit this doc when:
- remote access beyond the LAN is added
- Tailscale or another overlay network is introduced
- GitHub Actions runner is enabled
- service exposure needs tighter segmentation
