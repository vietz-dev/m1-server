#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
compose_file="${repo_root}/compose/docker-compose.yml"
env_file="${repo_root}/compose/.env"
example_env="${repo_root}/compose/.env.example"

if ! command -v docker >/dev/null 2>&1; then
  echo "docker not found. OrbStack/Docker must be available first." >&2
  exit 1
fi

if [[ ! -f "$env_file" ]]; then
  echo "compose/.env not found. Copy ${example_env} to ${env_file} and fill in values first." >&2
  exit 1
fi

echo "Validating compose config..."
docker compose --env-file "$env_file" -f "$compose_file" config >/dev/null

echo "Deploying open-webui service..."
docker compose --env-file "$env_file" -f "$compose_file" up -d open-webui

echo
echo "Deployment complete. Re-run ./scripts/check-open-webui.sh for validation."
