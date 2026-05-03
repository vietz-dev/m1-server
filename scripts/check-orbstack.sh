#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
compose_file="${repo_root}/compose/docker-compose.yml"

if [[ -d "/Applications/OrbStack.app" ]]; then
  echo "OrbStack app: PASS (/Applications/OrbStack.app)"
else
  echo "OrbStack app: FAIL (/Applications/OrbStack.app not found)"
fi

echo
if command -v docker >/dev/null 2>&1; then
  echo "docker CLI: PASS ($(command -v docker))"
else
  echo "docker CLI: FAIL (not found)"
  exit 1
fi

echo
if docker version >/dev/null 2>&1; then
  echo "docker daemon: PASS"
else
  echo "docker daemon: FAIL (docker CLI cannot reach a daemon)"
fi

echo
if docker compose version >/dev/null 2>&1; then
  echo "docker compose: PASS"
else
  echo "docker compose: FAIL"
fi

echo
if docker context ls >/dev/null 2>&1; then
  current_context="$(docker context show 2>/dev/null || true)"
  echo "docker context: ${current_context:-<unknown>}"
  case "${current_context:-}" in
    orbstack)
      echo "runtime target: PASS (OrbStack context active)"
      ;;
    "")
      echo "runtime target: WARN (unable to determine active Docker context)"
      ;;
    *)
      echo "runtime target: WARN (active Docker context is not OrbStack)"
      ;;
  esac
else
  echo "docker context: unable to query"
fi

echo
if [[ -f "$compose_file" ]]; then
  echo "compose file: PASS (${compose_file})"
  if docker compose -f "$compose_file" config >/dev/null 2>&1; then
    echo "compose config: PASS"
  else
    echo "compose config: FAIL"
  fi
else
  echo "compose file: FAIL (${compose_file} missing)"
fi

echo
if docker ps >/dev/null 2>&1; then
  echo "containers:"
  docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'
else
  echo "containers: unavailable because docker daemon is not reachable"
fi
