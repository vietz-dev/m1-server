# Architecture Decisions

Track important choices here with dates and rationale.

## Initial decisions
- Use **OrbStack** instead of Docker Desktop for Apple Silicon performance.
- Run **Ollama natively** on macOS to preserve Metal acceleration.
- Keep the Mac **standalone**, not part of the Talos cluster.
- Prioritize **LLM serving** and **Jellyfin** before GitHub Actions runner.
- Use Homebrew as the package manager baseline for reproducible host setup.
- Include `tmux` in the baseline ops toolset; defer `tailscale`, `mas`, and `smartmontools` for now.
- Start with a single repo-managed Compose file for OrbStack workloads and named volumes for app state.
