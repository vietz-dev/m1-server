# Runbook: Power Management

## Goal
Prevent the Mac from sleeping in normal server operation.

## Expected policy
- Stay awake on power adapter
- Avoid display-only assumptions because the machine is headless
- Remain reachable over the network after lid close testing

## Apply
Use:
```bash
./scripts/configure-pmset.sh
```

## Validate
Use:
```bash
./scripts/check-pmset.sh
```

## Notes
- Test with the dummy display plug installed.
- Re-check after macOS updates.
