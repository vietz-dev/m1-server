---
name: headless-mac-validation
description: Validate headless Mac readiness for this server project. Use when checking lid-closed behavior, dummy display assumptions, reboot behavior without an external display, SSH reachability, and remote management readiness.
---

# Headless Mac Validation

Use this skill to verify that the MacBook Air M1 can run reliably without its internal display.

## Focus areas
- dummy display usage and assumptions
- lid-closed behavior
- SSH availability after reboot
- remote management fallback readiness
- power settings that affect sleep/wake behavior
- expected behavior with no external display attached

## Sources of truth
- `docs/desired-state.md`
- `docs/validation-checklist.md`
- `runbooks/power-management.md`
- `runbooks/headless-operation.md` when present
- `scripts/check-remote-access.fish`
- `scripts/check-pmset.fish`

## Workflow
1. Review the intended headless behavior in docs.
2. Run or add read-only checks for SSH and power settings.
3. Verify any documented dummy display workflow.
4. Note what can only be confirmed through manual physical testing.
5. Produce a pass/fail checklist with open risks.
6. If manual validation is required, create or update the runbook.

## Output expectations
- validated items
- items still needing manual confirmation
- known headless risks
- exact follow-up actions
- doc or runbook updates made

## Rules
- be explicit about what was actually tested versus inferred
- do not overstate confidence for lid-closed or reboot behavior without validation
