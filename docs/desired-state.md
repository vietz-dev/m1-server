# Desired State

## Machine identity
- Hostname: `macbook-air`
- Primary user: `justin`
- Role: headless home server on the local LAN
- Hardware: MacBook Air M1, 16GB RAM, broken internal display, dummy display available

## Access and operability
- SSH enabled for normal administration
- Optional Screen Sharing enabled for GUI fallback
- Auto-login enabled so GUI-dependent apps and login-triggered services can recover after reboot
- Static DHCP reservation configured in the router
- System remains reachable and manageable with the lid closed

## Runtime split
### Native on macOS
- Ollama
- launchd or brew-managed helper services as needed

### Containerized in OrbStack
- Open WebUI
- Jellyfin

### Deferred
- GitHub Actions runner

## Service outcomes
- Ollama listens on the intended LAN interface and uses Metal acceleration
- Open WebUI can reach the native Ollama API
- Jellyfin serves media from documented storage mounts
- Containers and native services recover predictably after reboot or login

## Operational expectations
- This repo is sufficient to rebuild the machine after reinstall
- Scripts are preferred for repeatable changes and checks
- Manual/macOS GUI steps are captured as runbooks
- Validation and recovery steps are documented alongside setup steps
- Machine-specific values live in tracked examples plus local untracked env files
