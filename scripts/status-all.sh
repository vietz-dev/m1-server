#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"

run_check() {
  local title="$1"
  local script_path="$2"

  echo
  echo "===== ${title} ====="
  if [[ -x "$script_path" ]]; then
    if "$script_path"; then
      :
    else
      echo
      echo "${title}: completed with warnings or failures"
    fi
  else
    echo "Missing or non-executable: $script_path"
  fi
}

echo "m1-server status summary"
date

run_check "Remote access" "${repo_root}/scripts/check-remote-access.sh"
run_check "Power management" "${repo_root}/scripts/check-pmset.sh"
run_check "Homebrew" "${repo_root}/scripts/check-homebrew.sh"
run_check "OrbStack" "${repo_root}/scripts/check-orbstack.sh"
run_check "Ollama" "${repo_root}/scripts/check-ollama.sh"
run_check "Open WebUI" "${repo_root}/scripts/check-open-webui.sh"
run_check "Jellyfin" "${repo_root}/scripts/check-jellyfin.sh"
run_check "Ports" "${repo_root}/scripts/check-ports.sh"
run_check "Disk" "${repo_root}/scripts/check-disk.sh"
run_check "Memory" "${repo_root}/scripts/check-memory.sh"
