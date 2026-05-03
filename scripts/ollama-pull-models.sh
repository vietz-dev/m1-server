#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
machine_env="${repo_root}/config/machine.env"
models="${OLLAMA_MODELS:-gemma3}"

if [[ -f "$machine_env" ]]; then
  # shellcheck disable=SC1090
  source "$machine_env"
  models="${OLLAMA_MODELS:-$models}"
fi

if ! command -v ollama >/dev/null 2>&1; then
  echo "ollama not found. Run ./scripts/install-ollama.sh first." >&2
  exit 1
fi

normalized="$(tr ',' ' ' <<<"$models")"

echo "Pulling models: $normalized"
for model in $normalized; do
  echo
  echo ">>> ollama pull $model"
  ollama pull "$model"
done
