# Networking

## Planned identity
- Hostname: `macbook-air`
- Local DNS name: `macbook-air.local`
- Network: home LAN
- IP strategy: DHCP with router reservation

## Machine-specific values to record
- Active interface: `TODO` (`Wi-Fi` or `Ethernet`)
- Reserved LAN IP: `TODO`
- Interface MAC used for DHCP reservation: `TODO`
- Router/admin notes: `TODO`

## Required ports
- `22` – SSH
- `11434` – Ollama
- `3000` / service-defined – Open WebUI
- `8096` / service-defined – Jellyfin HTTP
- `8920` / optional – Jellyfin HTTPS
- `5900` / optional – Screen Sharing fallback

## Access expectations
- SSH should be reachable from trusted LAN clients.
- Screen Sharing is optional and should be treated as a fallback path.
- Service exposure beyond SSH should be reviewed during the security phase.

## Related runbooks
- `runbooks/enable-remote-access.md`
- `runbooks/router-static-dhcp.md`
- `runbooks/headless-operation.md`

## TODO
- Record final reserved IP address
- Record Wi-Fi vs Ethernet decision
- Record any firewall exceptions
- Confirm whether Screen Sharing will remain enabled long term
