---
name: media-ai-stack-troubleshooting
description: Troubleshoot the repo's AI and media services on macOS. Use for issues like no GPU/Metal acceleration, container down, port conflicts, bad mounts, sleep-related outages, and service-to-service connectivity failures.
---

# Media/AI Stack Troubleshooting

Use this skill when Ollama, Open WebUI, Jellyfin, or their dependencies are broken or degraded.

## Common issue classes
- Ollama not reachable or not bound as expected
- Metal/GPU acceleration not active
- OrbStack not running
- container exited or restarting
- port conflict
- broken bind mount or missing media path
- headless sleep or login-related service outage
- Open WebUI cannot reach Ollama
- Jellyfin library path or playback issues

## Troubleshooting workflow
1. Identify the failing symptom and affected service.
2. Read related docs, scripts, and compose config first.
3. Run the relevant `check-*` scripts.
4. Confirm service state, logs, ports, and mounts.
5. Isolate whether the fault is:
   - host configuration
   - container/runtime
   - network exposure
   - storage path/permissions
   - power/headless behavior
6. Propose the smallest safe fix.
7. Capture repeatable remediation in scripts or runbooks.

## Required output
- symptom
- scope of impact
- evidence gathered
- probable root cause
- fix or next diagnostic step
- validation after the fix
- rollback notes for risky changes

## Repo expectation
If you learn something durable, update `docs/`, `runbooks/`, or `scripts/` so the issue is easier to diagnose next time.
