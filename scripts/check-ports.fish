#!/usr/bin/env fish

set ports 22 5900 11434 3000 8096 8920

if test (count $argv) -gt 0
    set ports $argv
end

echo "Listening ports of interest:"
for port in $ports
    echo
    echo "Port $port:"
    if lsof -nP -iTCP:$port -sTCP:LISTEN >/dev/null 2>&1
        lsof -nP -iTCP:$port -sTCP:LISTEN
    else
        echo "No listener found"
    end
end
