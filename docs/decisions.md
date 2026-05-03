# Architecture Decisions

Track important choices here with dates and rationale.

## Initial decisions
- Use **OrbStack** instead of Docker Desktop for Apple Silicon performance.
- Run **Ollama natively** on macOS to preserve Metal acceleration.
- Keep the Mac **standalone**, not part of the Talos cluster.
- Prioritize **LLM serving** and **Jellyfin** before GitHub Actions runner.
- Use Homebrew as the package manager baseline for reproducible host setup.
- Include `tmux` and `fish` in the baseline ops toolset; defer `tailscale`, `mas`, and `smartmontools` for now.
- Start with a single repo-managed Compose file for OrbStack workloads and named volumes for app state.
- Run Ollama as a Homebrew-managed native service and target `0.0.0.0:11434` on the trusted home LAN.
- Start with `gemma3` as the default initial Ollama model set, with local override support in `config/machine.env`.
- Run Open WebUI in OrbStack on port `3000` by default and connect it to native Ollama via `host.docker.internal`.
- Run Jellyfin in OrbStack with bridge networking, explicit port mappings, named volumes for config/cache, and a read-only host bind mount for media.
- Prefer direct play over assuming reliable hardware transcoding on this macOS/OrbStack Apple Silicon setup.
- Treat the stack as trusted-LAN-only for now; do not expose Ollama, Open WebUI, or Jellyfin directly to the public internet.
- Use monthly `update-all` maintenance with post-update validation rather than ad-hoc host and container upgrades.
- Standardize repo shell scripts on fish for readability while keeping command examples runnable from the login shell.
- Back up repo state, local env files, Open WebUI data, Jellyfin config, and media storage separately from container runtime state.
