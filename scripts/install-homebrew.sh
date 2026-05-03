#!/usr/bin/env bash
set -euo pipefail

if command -v brew >/dev/null 2>&1; then
  echo "Homebrew already installed: $(command -v brew)"
  exit 0
fi

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Homebrew install complete."
echo "If brew is not yet on PATH, follow the post-install instructions printed above."
