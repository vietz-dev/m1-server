#!/usr/bin/env fish
source (dirname (status --current-filename))/lib/common.fish

set repo_root (repo_root (status --current-filename))
set compose_file "$repo_root/compose/docker-compose.yml"
set env_file "$repo_root/compose/.env"
set http_port 8096
set https_port 8920
set media_path

if test -f "$env_file"
    load_dotenv "$env_file"
    if set -q JELLYFIN_HTTP_PORT
        set http_port $JELLYFIN_HTTP_PORT
    end
    if set -q JELLYFIN_HTTPS_PORT
        set https_port $JELLYFIN_HTTPS_PORT
    end
    if set -q JELLYFIN_MEDIA_PATH
        set media_path $JELLYFIN_MEDIA_PATH
    end
end

if not command -q docker
    echo "docker CLI: FAIL"
    exit 1
end

echo "docker CLI: PASS "(command -s docker)

echo
if docker compose -f "$compose_file" ps jellyfin >/dev/null 2>&1
    echo "compose service: PASS"
    docker compose -f "$compose_file" ps jellyfin
else
    echo "compose service: FAIL"
end

echo
if docker ps --format '{{.Names}}' | grep -Fxq jellyfin
    echo "container state: PASS"
    docker ps --filter name='^jellyfin$' --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'
else
    echo "container state: FAIL (jellyfin container not running)"
end

echo
if test -n "$media_path"
    if test -d "$media_path"
        echo "media path: PASS ($media_path)"
    else
        echo "media path: FAIL ($media_path missing)"
    end
else
    echo "media path: WARN (JELLYFIN_MEDIA_PATH not set from compose/.env)"
end

echo
if curl -fsS "http://127.0.0.1:$http_port" >/dev/null 2>&1
    echo "http probe: PASS (http://127.0.0.1:$http_port)"
else
    echo "http probe: WARN (http://127.0.0.1:$http_port not reachable)"
end

echo "https port configured: $https_port"
if lsof -nP -iTCP:$http_port -sTCP:LISTEN >/dev/null 2>&1
    echo "listener check: PASS"
    lsof -nP -iTCP:$http_port -sTCP:LISTEN
else
    echo "listener check: WARN (nothing listening on $http_port)"
end

echo
set inspect_file /tmp/jellyfin-inspect.json
if docker inspect jellyfin > "$inspect_file" 2>/dev/null
    if grep -q '"/media"' "$inspect_file"
        echo "media mount wiring: PASS"
    else
        echo "media mount wiring: WARN"
    end
else
    echo "media mount wiring: WARN (unable to inspect container)"
end
rm -f "$inspect_file"

echo
printf '%s\n' \
    'Suggested follow-ups:' \
    "- open http://macbook-air.local:$http_port/web from another LAN device" \
    '- complete Jellyfin setup wizard' \
    '- add a test library and verify playback'
