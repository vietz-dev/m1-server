# pi Operator Guide

## Purpose
When working in this repo, pi should help maintain this repository as the operational source of truth for the Mac server.

## Rules
- Prefer committed scripts over one-off terminal commands.
- If a task requires human action, create or update a runbook.
- Keep documentation aligned with automation changes.
- Favor idempotent scripts where possible.
- Add validation steps after configuration changes.

## Expected deliverables for changes
- script or config change
- runbook if manual action exists
- validation instructions
- rollback notes for risky changes

## Priority order
1. Headless Mac stability
2. Remote access and recovery
3. Native Ollama
4. Open WebUI
5. Jellyfin
6. Future GitHub runner
