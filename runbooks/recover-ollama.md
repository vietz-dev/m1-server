# Runbook: Recover Ollama

## Goal
Restore native Ollama service availability.

## Steps
1. Run:
   ```bash
   ./scripts/check-ollama.sh
   ```
2. If Ollama is not installed, run:
   ```bash
   ./scripts/install-ollama.sh
   ```
3. If the brew service exists but is unhealthy, restart it:
   ```bash
   brew services restart ollama
   ```
4. Re-check listener state on `11434`.
5. Run a smoke test:
   ```bash
   ./scripts/ollama-smoke-test.sh
   ```
6. If Open WebUI depends on it, re-run:
   ```bash
   ./scripts/check-open-webui.sh
   ```

## Common causes
- Homebrew service not started
- `OLLAMA_HOST` not set as expected
- service failed after reboot/login
- model/memory pressure causing poor startup behavior
