#!/usr/bin/env fish
source (dirname (status --current-filename))/lib/common.fish

set repo_root (repo_root (status --current-filename))
set machine_env "$repo_root/config/machine.env"
set models gemma3

if test -f "$machine_env"
    load_dotenv "$machine_env"
    if set -q OLLAMA_MODELS
        set models $OLLAMA_MODELS
    end
end

if not command -q ollama
    echo "ollama not found. Run ./scripts/install-ollama.fish first." >&2
    exit 1
end

set normalized (string replace -a ',' ' ' -- "$models")

echo "Pulling models: $normalized"
for model in $normalized
    echo
    echo ">>> ollama pull $model"
    ollama pull "$model"
end
