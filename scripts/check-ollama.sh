#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
machine_env="${repo_root}/config/machine.env"
expected_host="0.0.0.0:11434"
api_probe_url="http://127.0.0.1:11434/api/tags"

if [[ -f "$machine_env" ]]; then
  # shellcheck disable=SC1090
  source "$machine_env"
  expected_host="${OLLAMA_HOST:-$expected_host}"
fi

if ! command -v ollama >/dev/null 2>&1; then
  echo "ollama binary: FAIL (not installed)"
  exit 1
fi

echo "ollama binary: PASS ($(command -v ollama))"
ollama --version || true

echo
if brew services list | grep -Eq '^ollama\s'; then
  echo "brew service: PASS"
  brew services list | grep -E '^ollama\s'
else
  echo "brew service: WARN (ollama brew service not found)"
fi

echo
launchctl_host="$(launchctl getenv OLLAMA_HOST 2>/dev/null || true)"
echo "Expected OLLAMA_HOST: ${expected_host}"
echo "launchctl OLLAMA_HOST: ${launchctl_host:-<not set>}"
if [[ "${launchctl_host:-}" == "$expected_host" ]]; then
  echo "listener config: PASS"
else
  echo "listener config: WARN"
fi

echo
if lsof -nP -iTCP:11434 -sTCP:LISTEN >/dev/null 2>&1; then
  echo "port 11434 listener: PASS"
  lsof -nP -iTCP:11434 -sTCP:LISTEN
else
  echo "port 11434 listener: WARN (nothing listening on 11434)"
fi

echo
if curl -fsS "$api_probe_url" >/tmp/ollama-tags.json 2>/dev/null; then
  echo "API probe: PASS (${api_probe_url})"
  cat /tmp/ollama-tags.json
else
  echo "API probe: FAIL (${api_probe_url})"
fi
rm -f /tmp/ollama-tags.json

echo
if command -v log >/dev/null 2>&1; then
  echo "Recent Ollama log hints:"
  log show --last 10m --style compact --predicate 'process == "ollama"' 2>/dev/null | tail -n 20 || true
else
  echo "Recent Ollama log hints: unavailable"
fi

echo
cat <<EOF
Suggested follow-ups:
- ./scripts/ollama-list-models.sh
- ./scripts/ollama-smoke-test.sh
- curl http://127.0.0.1:11434/api/tags
EOF
