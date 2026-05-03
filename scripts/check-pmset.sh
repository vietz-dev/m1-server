#!/usr/bin/env bash
set -euo pipefail

echo "Current pmset custom profile:"
pmset -g custom

echo
current_settings="$(pmset -g custom)"

check_setting() {
  local label="$1"
  local expected="$2"

  if grep -Eq "[[:space:]]${label}[[:space:]]+${expected}([[:space:]]|$)" <<<"$current_settings"; then
    echo "${label}: PASS (expected ${expected})"
  else
    echo "${label}: WARN (expected ${expected})"
  fi
}

echo "Expected charger-profile settings for server mode:"
check_setting sleep 0
check_setting displaysleep 10
check_setting disksleep 0
check_setting tcpkeepalive 1
check_setting autorestart 1
check_setting powernap 0
