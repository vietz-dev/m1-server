#!/usr/bin/env fish

set total_bytes (sysctl -n hw.memsize)
set total_gb (awk -v b="$total_bytes" 'BEGIN { printf "%.1f", b/1024/1024/1024 }')

echo "Physical memory: $total_gb GiB ($total_bytes bytes)"
echo
vm_stat
echo
if command -q memory_pressure
    memory_pressure
end
