#!/usr/bin/env fish
source (dirname (status --current-filename))/lib/common.fish

set repo_root (repo_root (status --current-filename))
set compose_file "$repo_root/compose/docker-compose.yml"
set env_file "$repo_root/compose/.env"
set example_env "$repo_root/compose/.env.example"

if not command -q docker
    echo "docker not found. OrbStack/Docker must be available first." >&2
    exit 1
end

if not test -f "$env_file"
    echo "compose/.env not found. Copy $example_env to $env_file and fill in values first." >&2
    exit 1
end

load_dotenv "$env_file"
set media_path $JELLYFIN_MEDIA_PATH

if test -z "$media_path"
    echo "JELLYFIN_MEDIA_PATH is not set in compose/.env" >&2
    exit 1
end

if not test -d "$media_path"
    echo "JELLYFIN_MEDIA_PATH does not exist: $media_path" >&2
    exit 1
end

echo "Validating compose config..."
docker compose --env-file "$env_file" -f "$compose_file" config >/dev/null

echo "Deploying jellyfin service..."
docker compose --env-file "$env_file" -f "$compose_file" up -d jellyfin

echo
echo "Deployment complete. Re-run ./scripts/check-jellyfin.fish for validation."
