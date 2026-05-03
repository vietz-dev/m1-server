#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
compose_file="${repo_root}/compose/docker-compose.yml"
env_file="${repo_root}/compose/.env"

if ! command -v docker >/dev/null 2>&1; then
  echo "docker not found. OrbStack/Docker must be available first." >&2
  exit 1
fi

if [[ ! -f "$env_file" ]]; then
  echo "compose/.env not found. Copy compose/.env.example first." >&2
  exit 1
fi

echo "Validating compose config..."
docker compose --env-file "$env_file" -f "$compose_file" config >/dev/null

echo "Pulling updated images..."
docker compose --env-file "$env_file" -f "$compose_file" pull

echo
echo "Recreating services with latest images..."
docker compose --env-file "$env_file" -f "$compose_file" up -d

echo
echo "Done. Re-run service checks to validate Open WebUI and Jellyfin."
