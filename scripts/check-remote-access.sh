#!/usr/bin/env bash
set -euo pipefail

EXPECTED_HOSTNAME="macbook-air"
EXPECTED_USER="justin"

if [[ -f "config/machine.env" ]]; then
  # shellcheck disable=SC1091
  source "config/machine.env"
  EXPECTED_HOSTNAME="${HOSTNAME:-$EXPECTED_HOSTNAME}"
  EXPECTED_USER="${LOCAL_USER:-$EXPECTED_USER}"
fi

actual_hostname="$(scutil --get HostName 2>/dev/null || true)"
actual_user="$(id -un)"

echo "Expected hostname: ${EXPECTED_HOSTNAME}"
echo "Actual hostname:   ${actual_hostname:-<not set>}"
if [[ "${actual_hostname:-}" == "$EXPECTED_HOSTNAME" ]]; then
  echo "Hostname check:    PASS"
else
  echo "Hostname check:    FAIL"
fi

echo
echo "Expected user: ${EXPECTED_USER}"
echo "Actual user:   ${actual_user}"
if [[ "$actual_user" == "$EXPECTED_USER" ]]; then
  echo "User check:    PASS"
else
  echo "User check:    FAIL"
fi

echo
echo "Remote Login status:"
systemsetup -getremotelogin 2>/dev/null || echo "Unable to query with systemsetup (try sudo for full output)"

echo
echo "SSH listener:"
if lsof -nP -iTCP:22 -sTCP:LISTEN >/dev/null 2>&1; then
  lsof -nP -iTCP:22 -sTCP:LISTEN
else
  echo "No SSH listener found on port 22"
fi

echo
echo "Screen Sharing listener (optional fallback):"
if lsof -nP -iTCP:5900 -sTCP:LISTEN >/dev/null 2>&1; then
  lsof -nP -iTCP:5900 -sTCP:LISTEN
else
  echo "No Screen Sharing listener found on port 5900"
fi

echo
echo "Suggested manual validation: ssh ${EXPECTED_USER}@${EXPECTED_HOSTNAME}.local"
