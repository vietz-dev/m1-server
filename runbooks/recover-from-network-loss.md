# Runbook: Recover From Network Loss

## Goal
Restore access when the Mac disappears from the LAN or services stop responding remotely.

## Steps
1. Check whether the host still answers ping or SSH by IP.
2. If hostname resolution failed, use the reserved IP from `docs/networking.md`.
3. If SSH is unavailable, try Screen Sharing if enabled.
4. If you regain shell access, run:
   ```bash
   ./scripts/check-remote-access.sh
   ./scripts/check-ports.sh
   ```
5. Verify the Mac did not sleep unexpectedly:
   ```bash
   ./scripts/check-pmset.sh
   ```
6. Verify router DHCP reservation and current client lease.
7. If needed, recover locally with lid open / attached monitor and revisit headless settings.

## Likely causes
- DHCP lease/address changed
- mDNS `.local` resolution issue
- SSH disabled or not listening
- host slept or did not auto-login
- Wi-Fi or Ethernet link changed
