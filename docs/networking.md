# Networking

## Planned identity
- Hostname: `macbook-air`
- Network: home LAN
- IP: assigned by DHCP reservation in router

## Required ports
- `22` – SSH
- `11434` – Ollama
- `3000` / service-defined – Open WebUI
- `8096` / service-defined – Jellyfin HTTP
- `8920` / optional – Jellyfin HTTPS

## Notes
- Reserve a static DHCP lease by MAC address in the router.
- Prefer stable hostnames and documented ports.
- Review whether all services should be exposed to the full LAN.

## TODO
- Record final IP address
- Record Wi-Fi vs Ethernet decision
- Record any firewall exceptions
