# Runbook: Router Static DHCP Reservation

## Goal
Keep the server on a predictable LAN IP while still using DHCP.

## Why this is manual
Router UI and terminology vary by vendor, so this step is documented instead of automated.

## Prerequisites
- admin access to the home router
- the Mac is already connected to the intended network
- you know whether the server will use Wi-Fi or Ethernet

## Steps
1. Find the Mac's active interface MAC address from the router client list or from macOS network settings.
2. Log in to the router admin UI.
3. Find the DHCP reservation / address reservation / static lease section.
4. Create a reservation for the Mac's MAC address.
5. Assign the desired IP.
6. Save and apply the router change.
7. Renew DHCP on the Mac or reboot if needed.
8. Record the reserved IP, interface choice, and router notes in `docs/networking.md`.

## Validate
From another machine on the LAN:
```bash
ping macbook-air.local
ssh justin@macbook-air.local
```

Also confirm the reserved IP appears in the router and matches what the Mac receives.

## Rollback
- remove the reservation from the router
- renew the DHCP lease on the Mac
- update `docs/networking.md` so the repo matches reality
