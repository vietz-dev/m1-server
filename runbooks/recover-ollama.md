# Runbook: Recover Ollama

## Goal
Restore native Ollama service availability.

## Steps
1. Run:
   ```fish
   ./scripts/check-ollama.fish
   ```
2. If Ollama is not installed, run:
   ```fish
   ./scripts/install-ollama.fish
   ```
3. If the brew service exists but is unhealthy, restart it:
   ```fish
   brew services restart ollama
   ```
4. Re-check listener state on `11434`.
5. Run a smoke test:
   ```fish
   ./scripts/ollama-smoke-test.fish
   ```
6. If Open WebUI depends on it, re-run:
   ```fish
   ./scripts/check-open-webui.fish
   ```

## Common causes
- Homebrew service not started
- `OLLAMA_HOST` not set as expected
- service failed after reboot/login
- model/memory pressure causing poor startup behavior
