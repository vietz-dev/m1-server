#!/usr/bin/env bash
set -euo pipefail

if ! command -v brew >/dev/null 2>&1; then
  echo "brew not found. Run ./scripts/install-homebrew.sh first." >&2
  exit 1
fi

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
brewfile="${repo_root}/Brewfile"

echo "Applying Brewfile: ${brewfile}"
brew bundle --file="${brewfile}"
