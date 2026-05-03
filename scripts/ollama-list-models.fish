#!/usr/bin/env fish

if not command -q ollama
    echo "ollama not found. Run ./scripts/install-ollama.fish first." >&2
    exit 1
end

ollama list
