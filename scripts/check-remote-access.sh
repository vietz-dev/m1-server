#!/usr/bin/env bash
set -euo pipefail

echo "Hostname:"
scutil --get HostName 2>/dev/null || echo "HostName not set"

echo
echo "Remote Login status:"
systemsetup -getremotelogin 2>/dev/null || echo "Run with sudo for full systemsetup output"

echo
echo "SSH listener:"
if lsof -nP -iTCP:22 -sTCP:LISTEN >/dev/null 2>&1; then
  lsof -nP -iTCP:22 -sTCP:LISTEN
else
  echo "No SSH listener found on port 22"
fi
