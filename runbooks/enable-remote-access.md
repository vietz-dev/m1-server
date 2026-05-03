# Runbook: Enable Remote Access

## Goal
Enable reliable remote administration of the Mac.

## Steps
1. Open **System Settings**.
2. Go to **General → Sharing**.
3. Enable **Remote Login**.
4. Allow access for user `justin`.
5. Optionally enable **Screen Sharing** for GUI fallback.
6. Note the hostname shown by macOS.

## Validate
From another machine on the LAN:
```bash
ssh justin@macbook-air.local
```

## Notes
- If `.local` name resolution fails, use the router-assigned IP.
- Keep this enabled before switching to headless operation.
