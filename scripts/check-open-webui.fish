#!/usr/bin/env fish
source (dirname (status --current-filename))/lib/common.fish

set repo_root (repo_root (status --current-filename))
set compose_file "$repo_root/compose/docker-compose.yml"
set env_file "$repo_root/compose/.env"
set port 3000
set ollama_base_url http://host.docker.internal:11434

if test -f "$env_file"
    load_dotenv "$env_file"
    if set -q OPEN_WEBUI_PORT
        set port $OPEN_WEBUI_PORT
    end
    if set -q OLLAMA_BASE_URL
        set ollama_base_url $OLLAMA_BASE_URL
    end
end

if not command -q docker
    echo "docker CLI: FAIL"
    exit 1
end

echo "docker CLI: PASS "(command -s docker)

echo
if docker compose -f "$compose_file" ps open-webui >/dev/null 2>&1
    echo "compose service: PASS"
    docker compose -f "$compose_file" ps open-webui
else
    echo "compose service: FAIL"
end

echo
if docker ps --format '{{.Names}}' | grep -Fxq open-webui
    echo "container state: PASS"
    docker ps --filter name='^open-webui$' --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'
else
    echo "container state: FAIL (open-webui container not running)"
end

echo
set health_file /tmp/open-webui-health.json
if curl -fsS "http://127.0.0.1:$port/health" > "$health_file" 2>/dev/null
    echo "web health: PASS (http://127.0.0.1:$port/health)"
    cat "$health_file"
else
    echo "web health: WARN (health endpoint did not respond)"
end
rm -f "$health_file"

echo
set inspect_file /tmp/open-webui-inspect.json
if docker inspect open-webui > "$inspect_file" 2>/dev/null
    if grep -q OLLAMA_BASE_URL= "$inspect_file"
        echo "ollama env wiring: PASS"
        grep -o 'OLLAMA_BASE_URL=[^",]*' "$inspect_file" | head -n 1
    else
        echo "ollama env wiring: WARN"
    end
else
    echo "ollama env wiring: WARN (unable to inspect container)"
end
rm -f "$inspect_file"

echo
set tags_file /tmp/open-webui-ollama-tags.json
if curl -fsS "$ollama_base_url/api/tags" > "$tags_file" 2>/dev/null
    echo "ollama upstream probe: PASS ($ollama_base_url/api/tags)"
else
    echo "ollama upstream probe: WARN ($ollama_base_url/api/tags not reachable from host)"
end
rm -f "$tags_file"

echo
printf '%s\n' \
    'Suggested follow-ups:' \
    "- open http://macbook-air.local:$port from another LAN device" \
    '- complete admin bootstrap in the UI' \
    '- verify model discovery and inference through the browser'
