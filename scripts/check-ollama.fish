#!/usr/bin/env fish
source (dirname (status --current-filename))/lib/common.fish

set repo_root (repo_root (status --current-filename))
set machine_env "$repo_root/config/machine.env"
set expected_host 0.0.0.0:11434
set api_probe_url http://127.0.0.1:11434/api/tags

if test -f "$machine_env"
    load_dotenv "$machine_env"
    if set -q OLLAMA_HOST
        set expected_host $OLLAMA_HOST
    end
end

if not command -q ollama
    echo "ollama binary: FAIL (not installed)"
    exit 1
end

echo "ollama binary: PASS "(command -s ollama)
ollama --version; or true

echo
if brew services list | grep -Eq '^ollama\s'
    echo "brew service: PASS"
    brew services list | grep -E '^ollama\s'
else
    echo "brew service: WARN (ollama brew service not found)"
end

echo
set launchctl_host (launchctl getenv OLLAMA_HOST 2>/dev/null)
echo "Expected OLLAMA_HOST: $expected_host"
echo "launchctl OLLAMA_HOST: "(test -n "$launchctl_host"; and echo $launchctl_host; or echo '<not set>')
if test "$launchctl_host" = "$expected_host"
    echo "listener config: PASS"
else
    echo "listener config: WARN"
end

echo
if lsof -nP -iTCP:11434 -sTCP:LISTEN >/dev/null 2>&1
    echo "port 11434 listener: PASS"
    lsof -nP -iTCP:11434 -sTCP:LISTEN
else
    echo "port 11434 listener: WARN (nothing listening on 11434)"
end

echo
set tmp_file /tmp/ollama-tags.json
if curl -fsS "$api_probe_url" > "$tmp_file" 2>/dev/null
    echo "API probe: PASS ($api_probe_url)"
    cat "$tmp_file"
else
    echo "API probe: FAIL ($api_probe_url)"
end
rm -f "$tmp_file"

echo
if command -q log
    echo "Recent Ollama log hints:"
    log show --last 10m --style compact --predicate 'process == "ollama"' 2>/dev/null | tail -n 20; or true
else
    echo "Recent Ollama log hints: unavailable"
end

echo
printf '%s\n' \
    'Suggested follow-ups:' \
    '- ./scripts/ollama-list-models.fish' \
    '- ./scripts/ollama-smoke-test.fish' \
    '- curl http://127.0.0.1:11434/api/tags'
