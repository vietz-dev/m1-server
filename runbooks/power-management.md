# Runbook: Power Management

## Goal
Prevent the Mac from sleeping during normal server operation while on AC power.

## Expected policy
- stay awake on power adapter
- allow network keepalive behavior where supported
- automatically restart after power loss if macOS/hardware honors it
- avoid display-only assumptions because the machine is headless

## Prerequisites
- run on the server while connected to power
- local admin access for `sudo`

## Apply
Use:
```bash
sudo ./scripts/configure-pmset.sh
```

## Validate
Use:
```bash
./scripts/check-pmset.sh
```

Then perform a manual check:
1. close the lid with the dummy display workflow you intend to use
2. verify the machine remains reachable over SSH
3. re-check after an idle period that would normally trigger sleep

## Rollback
Restore previous settings manually with `pmset` if the new policy causes unwanted behavior, then rerun:
```bash
pmset -g custom
```
and document the final chosen settings in this runbook.

## Notes
- Test with the dummy display plug installed.
- Re-check after macOS updates.
- Related docs: `runbooks/headless-operation.md`, `docs/validation-checklist.md`
