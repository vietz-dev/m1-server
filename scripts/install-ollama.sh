#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
machine_env="${repo_root}/config/machine.env"
expected_host="0.0.0.0:11434"

if ! command -v brew >/dev/null 2>&1; then
  echo "brew not found. Run ./scripts/install-homebrew.sh first." >&2
  exit 1
fi

if [[ -f "$machine_env" ]]; then
  # shellcheck disable=SC1090
  source "$machine_env"
  expected_host="${OLLAMA_HOST:-$expected_host}"
fi

if brew list ollama >/dev/null 2>&1; then
  echo "ollama already installed"
else
  echo "Installing ollama via Homebrew..."
  brew install ollama
fi

echo
if command -v launchctl >/dev/null 2>&1; then
  echo "Setting launchctl environment for current user: OLLAMA_HOST=${expected_host}"
  launchctl setenv OLLAMA_HOST "$expected_host"
fi

echo
if brew services list | grep -Eq '^ollama\s'; then
  echo "Restarting ollama brew service..."
  brew services restart ollama
else
  echo "Starting ollama brew service..."
  brew services start ollama
fi

echo
echo "Ollama install/service bootstrap complete."
echo "Current intended host binding: ${expected_host}"
echo "Re-run ./scripts/check-ollama.sh to validate API reachability and listener state."
