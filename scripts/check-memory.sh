#!/usr/bin/env bash
set -euo pipefail

total_bytes="$(sysctl -n hw.memsize)"
total_gb="$(awk -v b="$total_bytes" 'BEGIN { printf "%.1f", b/1024/1024/1024 }')"

echo "Physical memory: ${total_gb} GiB (${total_bytes} bytes)"
echo
vm_stat
echo
if command -v memory_pressure >/dev/null 2>&1; then
  memory_pressure
fi
