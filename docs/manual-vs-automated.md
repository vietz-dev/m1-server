# Manual vs Automated on macOS

## Principle
Automate everything practical, but document every remaining manual step as a runbook.

## Usually automatable
- shell-based validation and status checks
- Homebrew installation and package reconciliation
- `pmset` configuration and inspection
- service checks for SSH, Ollama, OrbStack, and containers
- compose deployment and restart workflows
- file-based configuration templating

## Usually manual or partially manual
- enabling macOS features hidden behind System Settings UI
- first-launch approval flows for desktop apps such as OrbStack
- auto-login configuration
- Screen Sharing enablement if GUI confirmation is required
- router administration such as static DHCP reservations
- security/privacy prompts, login items, and accessibility approvals
- testing dummy display behavior and lid-closed operation

## Expected handling
- If a task can be scripted safely, add or update a script in `scripts/`.
- If a task requires a person, add or update a runbook in `runbooks/`.
- If a task is mixed, automate the repeatable portion and document the manual gap.
- Always add a validation step so the operator can confirm the result.

## Common examples in this repo
- SSH checks: automate with `scripts/check-remote-access.fish`
- power policy checks: automate with `scripts/check-pmset.fish`
- OrbStack first launch: document in `runbooks/orbstack-first-launch.md`
- router DHCP reservation: document in a runbook and summarize the resulting IP in `docs/networking.md`

## Non-goals
- storing secrets in git
- pretending GUI-only actions are fully automated when they are not
- relying on undocumented one-off terminal history
