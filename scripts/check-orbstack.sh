#!/usr/bin/env bash
set -euo pipefail

if [[ -d "/Applications/OrbStack.app" ]]; then
  echo "OrbStack.app is installed"
else
  echo "OrbStack.app not found in /Applications"
fi

echo
if command -v docker >/dev/null 2>&1; then
  echo "docker CLI: $(command -v docker)"
  docker version >/dev/null 2>&1 && echo "Docker CLI can talk to daemon" || echo "Docker CLI cannot reach daemon"
else
  echo "docker CLI not found"
fi
