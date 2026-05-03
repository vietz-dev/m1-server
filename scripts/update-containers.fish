#!/usr/bin/env fish
source (dirname (status --current-filename))/lib/common.fish

set repo_root (repo_root (status --current-filename))
set compose_file "$repo_root/compose/docker-compose.yml"
set env_file "$repo_root/compose/.env"

if not command -q docker
    echo "docker not found. OrbStack/Docker must be available first." >&2
    exit 1
end

if not test -f "$env_file"
    echo "compose/.env not found. Copy compose/.env.example first." >&2
    exit 1
end

echo "Validating compose config..."
docker compose --env-file "$env_file" -f "$compose_file" config >/dev/null

echo "Pulling updated images..."
docker compose --env-file "$env_file" -f "$compose_file" pull

echo
echo "Recreating services with latest images..."
docker compose --env-file "$env_file" -f "$compose_file" up -d

echo
echo "Done. Re-run service checks to validate Open WebUI and Jellyfin."
