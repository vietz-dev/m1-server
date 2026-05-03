---
name: homelab-runbook-generation
description: Convert manual homelab and macOS setup work into reusable runbooks and operator checklists. Use when a task includes GUI-only steps, router changes, approvals, or other actions that cannot be fully automated.
---

# Homelab Runbook Generation

Use this skill to turn one-off manual procedures into durable repo documentation.

## When to use
- a task requires System Settings interaction
- a desktop app needs first-launch approval
- router or LAN admin steps must be performed by a human
- a recovery path needs a checklist
- an automation change leaves a manual gap

## Output location
Write runbooks in `runbooks/`.
Put supporting rationale, constraints, or comparisons in `docs/`.

## Runbook structure
A good runbook should include:
1. purpose
2. prerequisites
3. exact step-by-step actions
4. validation steps
5. rollback or recovery notes
6. links to related scripts/docs

## Repo rules
- align with `docs/pi-operator-guide.md`
- align with `docs/manual-vs-automated.md`
- reference scripts instead of duplicating shell logic
- keep machine-specific values in env templates or clearly marked placeholders

## Checklist
When generating or updating a runbook:
- describe what is manual and why
- make the steps safe for a future rebuild
- include post-change validation
- include any security tradeoffs
- update related docs if the procedure changes system behavior
