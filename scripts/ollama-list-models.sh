#!/usr/bin/env bash
set -euo pipefail

if ! command -v ollama >/dev/null 2>&1; then
  echo "ollama not found. Run ./scripts/install-ollama.sh first." >&2
  exit 1
fi

ollama list
