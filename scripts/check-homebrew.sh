#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
brewfile="${repo_root}/Brewfile"

if ! command -v brew >/dev/null 2>&1; then
  echo "FAIL: brew not found. Run ./scripts/install-homebrew.sh first."
  exit 1
fi

echo "brew path: $(command -v brew)"
brew --version | head -n 1

echo
if brew bundle check --verbose --file="${brewfile}"; then
  echo "Brewfile check: PASS"
else
  echo "Brewfile check: FAIL"
  echo "Run ./scripts/brew-bundle.sh to install missing packages."
  exit 1
fi
