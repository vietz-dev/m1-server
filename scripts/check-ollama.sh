#!/usr/bin/env bash
set -euo pipefail

if ! command -v ollama >/dev/null 2>&1; then
  echo "ollama not installed"
  exit 1
fi

echo "Binary: $(command -v ollama)"
echo

echo "brew services:"
brew services list | grep -E '^ollama\s' || echo "ollama brew service not found"
echo

echo "Version:"
ollama --version || true
echo

echo "API probe:"
curl -fsS http://127.0.0.1:11434/api/tags || echo "Ollama API not reachable on localhost:11434"
