#!/usr/bin/env fish
source (dirname (status --current-filename))/lib/common.fish

set repo_root (repo_root (status --current-filename))
set machine_env "$repo_root/config/machine.env"
set default_host http://127.0.0.1:11434
set default_model gemma3
set prompt 'Reply with exactly: OK'

if test -f "$machine_env"
    load_dotenv "$machine_env"
    if set -q OLLAMA_HOST
        set default_host "http://$OLLAMA_HOST"
    end
    if set -q OLLAMA_MODELS
        set default_model (string split ' ' (string replace -a ',' ' ' -- "$OLLAMA_MODELS"))[1]
    end
end

set host $default_host
if set -q OLLAMA_API_URL
    set host $OLLAMA_API_URL
end

set model $default_model
if test (count $argv) -gt 0
    set model $argv[1]
end

if not command -q curl
    echo "curl not found" >&2
    exit 1
end

echo "Smoke testing Ollama"
echo "Host:  $host"
echo "Model: $model"

set tmp_response (mktemp)
trap "rm -f '$tmp_response'" EXIT

curl -fsS "$host/api/generate" \
    -H 'Content-Type: application/json' \
    -d "{\"model\":\"$model\",\"prompt\":\"$prompt\",\"stream\":false}" \
    > "$tmp_response"

cat "$tmp_response"
echo
if grep -qi '"response"' "$tmp_response"
    echo "Smoke test: PASS"
else
    echo "Smoke test: FAIL"
    exit 1
end
