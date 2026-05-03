#!/usr/bin/env bash
set -euo pipefail

if [[ "${EUID}" -ne 0 ]]; then
  echo "Please run with sudo." >&2
  exit 1
fi

pmset -c sleep 0
pmset -c displaysleep 10
pmset -c disksleep 0
pmset -c tcpkeepalive 1
pmset -c autorestart 1
pmset -c powernap 0

printf 'Applied power-adapter pmset profile.\n'
pmset -g custom
