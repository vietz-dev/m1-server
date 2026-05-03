#!/usr/bin/env fish
source (dirname (status --current-filename))/lib/common.fish

set repo_root (repo_root (status --current-filename))
set compose_file "$repo_root/compose/docker-compose.yml"

if test -d /Applications/OrbStack.app
    echo "OrbStack app: PASS (/Applications/OrbStack.app)"
else
    echo "OrbStack app: FAIL (/Applications/OrbStack.app not found)"
end

echo
if command -q docker
    echo "docker CLI: PASS "(command -s docker)
else
    echo "docker CLI: FAIL (not found)"
    exit 1
end

echo
if docker version >/dev/null 2>&1
    echo "docker daemon: PASS"
else
    echo "docker daemon: FAIL (docker CLI cannot reach a daemon)"
end

echo
if docker compose version >/dev/null 2>&1
    echo "docker compose: PASS"
else
    echo "docker compose: FAIL"
end

echo
if docker context ls >/dev/null 2>&1
    set current_context (docker context show 2>/dev/null)
    echo "docker context: "(test -n "$current_context"; and echo $current_context; or echo '<unknown>')
    switch "$current_context"
        case orbstack
            echo "runtime target: PASS (OrbStack context active)"
        case ''
            echo "runtime target: WARN (unable to determine active Docker context)"
        case '*'
            echo "runtime target: WARN (active Docker context is not OrbStack)"
    end
else
    echo "docker context: unable to query"
end

echo
if test -f "$compose_file"
    echo "compose file: PASS ($compose_file)"
    if docker compose -f "$compose_file" config >/dev/null 2>&1
        echo "compose config: PASS"
    else
        echo "compose config: FAIL"
    end
else
    echo "compose file: FAIL ($compose_file missing)"
end

echo
if docker ps >/dev/null 2>&1
    echo "containers:"
    docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'
else
    echo "containers: unavailable because docker daemon is not reachable"
end
