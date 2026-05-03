#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
compose_file="${repo_root}/compose/docker-compose.yml"
env_file="${repo_root}/compose/.env"
port="3000"
ollama_base_url="http://host.docker.internal:11434"

if [[ -f "$env_file" ]]; then
  # shellcheck disable=SC1090
  source "$env_file"
  port="${OPEN_WEBUI_PORT:-$port}"
  ollama_base_url="${OLLAMA_BASE_URL:-$ollama_base_url}"
fi

if ! command -v docker >/dev/null 2>&1; then
  echo "docker CLI: FAIL"
  exit 1
fi

echo "docker CLI: PASS ($(command -v docker))"

echo
if docker compose -f "$compose_file" ps open-webui >/dev/null 2>&1; then
  echo "compose service: PASS"
  docker compose -f "$compose_file" ps open-webui
else
  echo "compose service: FAIL"
fi

echo
if docker ps --format '{{.Names}}' | grep -Fxq 'open-webui'; then
  echo "container state: PASS"
  docker ps --filter name='^open-webui$' --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'
else
  echo "container state: FAIL (open-webui container not running)"
fi

echo
if curl -fsS "http://127.0.0.1:${port}/health" >/tmp/open-webui-health.json 2>/dev/null; then
  echo "web health: PASS (http://127.0.0.1:${port}/health)"
  cat /tmp/open-webui-health.json
else
  echo "web health: WARN (health endpoint did not respond)"
fi
rm -f /tmp/open-webui-health.json

echo
if docker inspect open-webui >/tmp/open-webui-inspect.json 2>/dev/null; then
  if grep -q 'OLLAMA_BASE_URL=' /tmp/open-webui-inspect.json; then
    echo "ollama env wiring: PASS"
    grep -o 'OLLAMA_BASE_URL=[^",]*' /tmp/open-webui-inspect.json | head -n 1
  else
    echo "ollama env wiring: WARN"
  fi
else
  echo "ollama env wiring: WARN (unable to inspect container)"
fi
rm -f /tmp/open-webui-inspect.json

echo
if curl -fsS "$ollama_base_url/api/tags" >/tmp/open-webui-ollama-tags.json 2>/dev/null; then
  echo "ollama upstream probe: PASS (${ollama_base_url}/api/tags)"
else
  echo "ollama upstream probe: WARN (${ollama_base_url}/api/tags not reachable from host)"
fi
rm -f /tmp/open-webui-ollama-tags.json

echo
cat <<EOF
Suggested follow-ups:
- open http://macbook-air.local:${port} from another LAN device
- complete admin bootstrap in the UI
- verify model discovery and inference through the browser
EOF
