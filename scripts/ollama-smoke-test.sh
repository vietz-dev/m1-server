#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
machine_env="${repo_root}/config/machine.env"
default_host="http://127.0.0.1:11434"
default_model="gemma3"
prompt="Reply with exactly: OK"

if [[ -f "$machine_env" ]]; then
  # shellcheck disable=SC1090
  source "$machine_env"
  if [[ -n "${OLLAMA_HOST:-}" ]]; then
    default_host="http://${OLLAMA_HOST}"
  fi
  if [[ -n "${OLLAMA_MODELS:-}" ]]; then
    default_model="$(tr ',' ' ' <<<"$OLLAMA_MODELS" | awk '{print $1}')"
  fi
fi

host="${OLLAMA_API_URL:-$default_host}"
model="${1:-$default_model}"

if ! command -v curl >/dev/null 2>&1; then
  echo "curl not found" >&2
  exit 1
fi

echo "Smoke testing Ollama"
echo "Host:  $host"
echo "Model: $model"

tmp_response="$(mktemp)"
trap 'rm -f "$tmp_response"' EXIT

curl -fsS "$host/api/generate" \
  -H 'Content-Type: application/json' \
  -d "{\"model\":\"$model\",\"prompt\":\"$prompt\",\"stream\":false}" \
  > "$tmp_response"

cat "$tmp_response"

echo
if grep -qi '"response"' "$tmp_response"; then
  echo "Smoke test: PASS"
else
  echo "Smoke test: FAIL"
  exit 1
fi
