#!/usr/bin/env fish

if test (id -u) -ne 0
    echo "Please run with sudo." >&2
    exit 1
end

pmset -c sleep 0
pmset -c displaysleep 10
pmset -c disksleep 0
pmset -c tcpkeepalive 1
pmset -c autorestart 1
pmset -c powernap 0

echo "Applied power-adapter pmset profile."
pmset -g custom
