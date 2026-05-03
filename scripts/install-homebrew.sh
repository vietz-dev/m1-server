#!/usr/bin/env bash
set -euo pipefail

if command -v brew >/dev/null 2>&1; then
  echo "Homebrew already installed: $(command -v brew)"
  brew --version | head -n 1
  exit 0
fi

echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo
if [[ -x "/opt/homebrew/bin/brew" ]]; then
  echo "Homebrew install complete: /opt/homebrew/bin/brew"
  echo "If needed for the current shell, run:"
  echo '  eval "$(/opt/homebrew/bin/brew shellenv)"'
else
  echo "Homebrew install completed, but brew is not yet on PATH in this shell."
  echo "Follow the post-install instructions printed above."
fi
