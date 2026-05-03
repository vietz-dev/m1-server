#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"

run_step() {
  local title="$1"
  shift

  echo
  echo "===== ${title} ====="
  "$@"
}

run_step "Update Homebrew packages" "${repo_root}/scripts/update-brew.sh"
run_step "Update container images" "${repo_root}/scripts/update-containers.sh"

echo
if command -v brew >/dev/null 2>&1 && brew services list | grep -Eq '^ollama\s'; then
  run_step "Restart Ollama service" brew services restart ollama
fi

run_step "Post-update status summary" "${repo_root}/scripts/status-all.sh"
