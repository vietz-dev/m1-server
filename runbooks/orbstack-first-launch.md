# Runbook: OrbStack First Launch

## Goal
Complete the one-time GUI activation/setup required by OrbStack.

## Steps
1. Install OrbStack via Homebrew:
```bash
./scripts/brew-bundle.sh
```
2. Open OrbStack from the Applications folder or Spotlight.
3. Complete any first-launch prompts.
4. Confirm Docker compatibility is enabled.
5. Let OrbStack finish initialization.

## Validate
Run:
```bash
./scripts/check-orbstack.sh
```

## Important
Do this before permanent headless operation unless Screen Sharing is already enabled.
