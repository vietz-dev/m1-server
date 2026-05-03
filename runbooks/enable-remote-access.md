# Runbook: Enable Remote Access

## Goal
Enable reliable remote administration of the Mac before switching to headless operation.

## Prerequisites
- local admin access to the Mac
- target hostname is `macbook-air`
- target operator account is `justin`

## Steps
1. Open **System Settings**.
2. Go to **General → Sharing**.
3. Set the Mac name to `macbook-air` if it is not already correct.
4. Enable **Remote Login**.
5. Under allowed users, grant access to `justin`.
6. Optionally enable **Screen Sharing** for GUI fallback.
7. Record the final hostname and current LAN IP in `docs/networking.md`.

## Validate
Run locally:
```bash
./scripts/check-remote-access.sh
```

From another machine on the LAN:
```bash
ssh justin@macbook-air.local
```

## Rollback
- Disable **Remote Login** in **System Settings → General → Sharing**.
- Disable **Screen Sharing** if it was only enabled as a temporary fallback.

## Notes
- If `.local` name resolution fails, use the router-assigned IP.
- Keep this enabled before relying on headless recovery.
- Related docs: `runbooks/headless-operation.md`, `docs/networking.md`
