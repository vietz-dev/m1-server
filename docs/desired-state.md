# Desired State

## Machine
- Hostname: `macbook-air`
- User: `justin`
- Role: headless home server
- Hardware: MacBook Air M1, 16GB RAM, broken internal display

## Access
- SSH enabled for remote administration
- Optional Screen Sharing enabled for GUI fallback
- Auto-login enabled for the local user
- Static DHCP reservation configured in the router

## Runtime model
- **Native on macOS:** Ollama
- **OrbStack containers:** Open WebUI, Jellyfin
- **Deferred:** GitHub Actions runner

## Service goals
- Ollama listens on the LAN and uses Metal acceleration
- Open WebUI connects to native Ollama
- Jellyfin serves media from defined storage mounts
- Services recover automatically after reboot

## Source of truth
This repo contains:
- automation scripts
- manual runbooks
- configuration templates
- validation and recovery documentation
