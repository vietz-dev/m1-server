# Runbook: OrbStack First Launch

## Goal
Complete the one-time GUI activation and Docker setup required by OrbStack.

## Prerequisites
- Homebrew baseline applied with `./scripts/brew-bundle.fish`
- local GUI access or Screen Sharing fallback
- auto-login plan understood if OrbStack must recover after reboot

## Why this is manual
OrbStack requires a desktop-app first launch and may show approvals or onboarding prompts.

## Steps
1. Install OrbStack via Homebrew if it is not already installed:
   ```fish
   ./scripts/brew-bundle.fish
   ```
2. Open **OrbStack** from Applications, Spotlight, or Launchpad.
3. Complete first-launch prompts.
4. Confirm Docker compatibility/integration is enabled.
5. Wait for OrbStack to finish initialization.
6. If prompted for permissions or background behavior, approve the options needed for normal container operation.
7. Leave OrbStack configured to start the way you intend for reboot recovery, then document any non-default behavior in `docs/containers.md`.

## Validate
Run:
```fish
./scripts/check-orbstack.fish
```

Then confirm:
- `docker daemon: PASS`
- `docker compose: PASS`
- `runtime target: PASS (OrbStack context active)`
- the compose file validates successfully

## Rollback
- quit OrbStack
- uninstall if needed:
  ```fish
  brew uninstall --cask orbstack
  ```
- remove or revisit any non-default startup settings you changed during first launch

## Important
Do this before permanent headless operation unless Screen Sharing is already enabled.
