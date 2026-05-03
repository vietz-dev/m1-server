#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
compose_file="${repo_root}/compose/docker-compose.yml"
env_file="${repo_root}/compose/.env"
http_port="8096"
https_port="8920"
media_path=""

if [[ -f "$env_file" ]]; then
  # shellcheck disable=SC1090
  source "$env_file"
  http_port="${JELLYFIN_HTTP_PORT:-$http_port}"
  https_port="${JELLYFIN_HTTPS_PORT:-$https_port}"
  media_path="${JELLYFIN_MEDIA_PATH:-$media_path}"
fi

if ! command -v docker >/dev/null 2>&1; then
  echo "docker CLI: FAIL"
  exit 1
fi

echo "docker CLI: PASS ($(command -v docker))"

echo
if docker compose -f "$compose_file" ps jellyfin >/dev/null 2>&1; then
  echo "compose service: PASS"
  docker compose -f "$compose_file" ps jellyfin
else
  echo "compose service: FAIL"
fi

echo
if docker ps --format '{{.Names}}' | grep -Fxq 'jellyfin'; then
  echo "container state: PASS"
  docker ps --filter name='^jellyfin$' --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'
else
  echo "container state: FAIL (jellyfin container not running)"
fi

echo
if [[ -n "$media_path" ]]; then
  if [[ -d "$media_path" ]]; then
    echo "media path: PASS ($media_path)"
  else
    echo "media path: FAIL ($media_path missing)"
  fi
else
  echo "media path: WARN (JELLYFIN_MEDIA_PATH not set from compose/.env)"
fi

echo
if curl -fsS "http://127.0.0.1:${http_port}" >/dev/null 2>&1; then
  echo "http probe: PASS (http://127.0.0.1:${http_port})"
else
  echo "http probe: WARN (http://127.0.0.1:${http_port} not reachable)"
fi

echo "https port configured: ${https_port}"
if lsof -nP -iTCP:"$http_port" -sTCP:LISTEN >/dev/null 2>&1; then
  echo "listener check: PASS"
  lsof -nP -iTCP:"$http_port" -sTCP:LISTEN
else
  echo "listener check: WARN (nothing listening on ${http_port})"
fi

echo
if docker inspect jellyfin >/tmp/jellyfin-inspect.json 2>/dev/null; then
  if grep -q '"/media"' /tmp/jellyfin-inspect.json; then
    echo "media mount wiring: PASS"
  else
    echo "media mount wiring: WARN"
  fi
else
  echo "media mount wiring: WARN (unable to inspect container)"
fi
rm -f /tmp/jellyfin-inspect.json

echo
cat <<EOF
Suggested follow-ups:
- open http://macbook-air.local:${http_port}/web from another LAN device
- complete Jellyfin setup wizard
- add a test library and verify playback
EOF
