---
title: Recovery
description: Where to look first when the machine or its services are no longer healthy.
---

# Recovery

## Recovery mindset

Always start with the least destructive step:
1. verify the host is reachable
2. run health checks
3. inspect logs
4. use the matching runbook
5. only then consider reinstall or data reset

## Core recovery runbooks

### After reboot problems
Use when services did not come back after a restart.

Primary tool:
```fish
./scripts/status-all.fish
```

### Network loss
Use when the machine disappears from the LAN or `.local` resolution stops working.

Key checks:
```fish
./scripts/check-remote-access.fish
./scripts/check-ports.fish
./scripts/check-pmset.fish
```

### OrbStack recovery
Use when Docker/containers are unavailable.

### Ollama recovery
Use when the API is not responding or the service failed.

### Jellyfin recovery
Use when the UI is down or the media mount disappeared.

## Best companion page

See also:
- [Health Checks](/operations/health-checks/)
- [Validation](/reference/validation/)
- [Runbooks](/reference/runbooks/)
