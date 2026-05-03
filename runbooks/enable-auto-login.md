# Runbook: Enable Auto Login

## Goal
Allow services that depend on a logged-in desktop session to start after reboot.

## Steps
1. Open **System Settings**.
2. Go to **Users & Groups**.
3. Open the auto-login setting.
4. Enable auto-login for user `justin`.
5. Enter the account password when prompted.

## Validate
1. Reboot the Mac.
2. Confirm the desktop session logs in automatically.
3. Confirm SSH and OrbStack are reachable afterward.

## Security note
Auto-login reduces local physical security. Use only if acceptable for this home-lab device.
