# Architecture Decisions

Track important choices here with dates and rationale.

## Initial decisions
- Use **OrbStack** instead of Docker Desktop for Apple Silicon performance.
- Run **Ollama natively** on macOS to preserve Metal acceleration.
- Keep the Mac **standalone**, not part of the Talos cluster.
- Prioritize **LLM serving** and **Jellyfin** before GitHub Actions runner.
