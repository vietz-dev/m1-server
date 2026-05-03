# Runbook: Headless Operation

## Goal
Validate that the MacBook Air M1 remains usable as a headless server with its broken internal display.

## Prerequisites
- `runbooks/enable-remote-access.md` completed
- `runbooks/power-management.md` applied and validated
- dummy display plug available
- another LAN machine available for SSH testing

## Test plan

### 1. Baseline access
1. Boot the Mac normally.
2. Confirm you can SSH in from another machine:
   ```fish
   ssh justin@macbook-air.local
   ```
3. Run:
   ```fish
   ./scripts/check-remote-access.fish
   ./scripts/check-pmset.fish
   ```

### 2. Dummy display validation
1. Attach the dummy display plug.
2. Reboot if needed.
3. Confirm the Mac still reaches the desktop session after login.
4. If Screen Sharing is enabled, verify that a remote GUI session can connect.

### 3. Lid-closed validation
1. Start an SSH session from another machine.
2. Close the lid.
3. Wait long enough for normal idle sleep to occur if misconfigured.
4. Confirm the SSH session stays connected or that reconnect succeeds immediately.
5. Confirm services remain reachable after lid close.

### 4. Reboot-without-monitor validation
1. Leave the dummy display setup in the intended production state.
2. Disconnect any real external monitor.
3. Reboot the Mac.
4. Confirm:
   - auto-login occurs if enabled
   - SSH becomes reachable again
   - OrbStack or other login-dependent apps recover as expected

## Expected results
- SSH remains available for normal operations.
- The Mac does not disappear from the LAN after lid close.
- Reboot without a real monitor does not require local display intervention.

## Known risks
- lid-closed behavior can still vary with macOS updates
- some GUI apps may need a logged-in session even when SSH is available
- dummy display behavior should be re-tested after major OS or power-setting changes

## Rollback / recovery
- reopen the lid if the machine becomes unreachable
- connect a real monitor if the dummy display workflow fails
- use Screen Sharing as fallback if SSH works but GUI-only actions are needed
- if both fail, attach keyboard/monitor locally and revisit power, login, and sharing settings

## Record outcomes
Capture pass/fail notes in `docs/validation-checklist.md` or the task summary after each test cycle.
