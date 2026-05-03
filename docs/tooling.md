# Tooling Baseline

## Included in the baseline
- `git` – repo operations and recovery work
- `jq` – JSON inspection for APIs and service checks
- `wget` – fetch and smoke-test endpoints
- `htop` – quick process visibility
- `ripgrep` – fast log and repo search
- `tmux` – resilient remote shell sessions
- `fish` – preferred interactive shell and script shell for this repo
- `ollama` – native Apple Silicon LLM runtime
- `orbstack` – container runtime for Open WebUI and Jellyfin

## Decided not to include right now
- `mas` – not needed for the current server bootstrap path
- `tailscale` – deferred until core LAN-only operation is stable
- `smartmontools` – low immediate value for this Mac baseline; revisit if external-drive monitoring becomes important

## Notes
- The baseline package set is managed in `Brewfile`.
- Optional tools can be added later if they become part of the documented operating model.
- Any change here should be reflected in `Brewfile`, related scripts, and validation steps.
