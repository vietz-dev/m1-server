#!/usr/bin/env bash
set -euo pipefail

ports=(22 5900 11434 3000 8096 8920)

if [[ $# -gt 0 ]]; then
  ports=("$@")
fi

echo "Listening ports of interest:"
for port in "${ports[@]}"; do
  echo
  echo "Port ${port}:"
  if lsof -nP -iTCP:"$port" -sTCP:LISTEN >/dev/null 2>&1; then
    lsof -nP -iTCP:"$port" -sTCP:LISTEN
  else
    echo "No listener found"
  fi
done
