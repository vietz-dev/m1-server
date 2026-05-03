#!/usr/bin/env fish

function check_setting --argument-names current_settings label expected
    set -l pattern '[[:space:]]'$label'[[:space:]]+'$expected'([[:space:]]|$)'
    if printf '%s\n' "$current_settings" | grep -Eq "$pattern"
        echo "$label: PASS (expected $expected)"
    else
        echo "$label: WARN (expected $expected)"
    end
end

echo "Current pmset custom profile:"
pmset -g custom

echo
set current_settings (pmset -g custom)

echo "Expected charger-profile settings for server mode:"
check_setting "$current_settings" sleep 0
check_setting "$current_settings" displaysleep 10
check_setting "$current_settings" disksleep 0
check_setting "$current_settings" tcpkeepalive 1
check_setting "$current_settings" autorestart 1
check_setting "$current_settings" powernap 0
