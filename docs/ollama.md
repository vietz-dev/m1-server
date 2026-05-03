# Ollama

## Goal
Run Ollama natively on macOS so the MacBook Air M1 can use Apple Metal acceleration instead of a containerized CPU-only path.

## Installation and service management
### Install and start
Use:
```bash
./scripts/install-ollama.sh
```

This script:
- installs `ollama` via Homebrew if needed
- sets `OLLAMA_HOST` in the current user's `launchctl` environment
- starts or restarts the Homebrew-managed Ollama service

### Validate
Use:
```bash
./scripts/check-ollama.sh
```

## Network exposure
The intended binding is:
- `0.0.0.0:11434`

This is stored in:
- `config/machine.env` via `OLLAMA_HOST`
- default fallback in `config/machine.env.example`

### LAN exposure decision for now
Expose Ollama to the trusted home LAN for Open WebUI and operator testing.

### Firewall/security note
This should be treated as a trusted-LAN-only assumption and revisited in Phase 9. Do not expose Ollama directly to the public internet.

### Remote validation
From another LAN machine:
```bash
curl http://macbook-air.local:11434/api/tags
```

## Model management
### Initial model choice
Default initial model set:
- `gemma3`

Override locally in `config/machine.env` if you want a different set.

### Pull models
Use:
```bash
./scripts/ollama-pull-models.sh
```

### List models
Use:
```bash
./scripts/ollama-list-models.sh
```

### Disk usage expectations
Model storage can consume several GB quickly. Re-check available disk before pulling multiple models on a 16GB RAM / laptop-SSD system.

### Upgrade/removal workflow
- pull a newer or additional model with `./scripts/ollama-pull-models.sh`
- inspect installed models with `./scripts/ollama-list-models.sh`
- remove a model manually when no longer needed:
  ```bash
  ollama rm <model>
  ```

## Performance and reliability
### Smoke test
Use:
```bash
./scripts/ollama-smoke-test.sh
```

### Metal acceleration validation
Check for:
- successful inference speed versus obvious CPU fallback behavior
- Ollama logs referencing Metal / GPU initialization when available
- absence of obvious startup or memory errors in `./scripts/check-ollama.sh`

### Memory/concurrency notes for 16GB RAM
- start with one small-to-medium model
- expect less headroom once Open WebUI and Jellyfin are also active
- keep concurrent generation expectations modest until the full stack is validated

### Known limits
- large models may pressure RAM or swap heavily
- concurrent Open WebUI and Jellyfin activity may reduce responsiveness
- host-wide sleep, reboot, or login issues can still interrupt service even when Ollama itself is healthy

## Related files
- `scripts/install-ollama.sh`
- `scripts/check-ollama.sh`
- `scripts/ollama-pull-models.sh`
- `scripts/ollama-list-models.sh`
- `scripts/ollama-smoke-test.sh`
- `config/machine.env.example`
