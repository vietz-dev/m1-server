# Runbook: Enable Auto Login

## Goal
Allow desktop-session-dependent apps and login-triggered services to recover after reboot.

## Prerequisites
- local admin access to the Mac
- operator account `justin`
- acceptable physical-security tradeoff for this LAN-only device

## Steps
1. Open **System Settings**.
2. Go to **Users & Groups**.
3. Find the **Automatically log in as** setting.
4. Enable auto-login for user `justin`.
5. Enter the account password when prompted.
6. If FileVault blocks the option, decide whether to keep FileVault or prioritize automatic recovery; document the decision in `docs/decisions.md` if needed.

## Validate
1. Reboot the Mac.
2. Confirm the desktop session logs in automatically.
3. Confirm SSH is reachable.
4. Confirm OrbStack and other login-dependent apps recover as expected after login.

## Rollback
- Return to **System Settings → Users & Groups**.
- Disable auto-login.
- Re-test reboot behavior so you understand what now requires manual login.

## Security note
Auto-login reduces local physical security. Use only if acceptable for this home-lab device.
