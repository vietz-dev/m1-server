#!/usr/bin/env fish
source (dirname (status --current-filename))/lib/common.fish

set repo_root (repo_root (status --current-filename))
set machine_env "$repo_root/config/machine.env"
set expected_host 0.0.0.0:11434

require_command brew "Run ./scripts/install-homebrew.fish first."; or exit 1

if test -f "$machine_env"
    load_dotenv "$machine_env"
    if set -q OLLAMA_HOST
        set expected_host $OLLAMA_HOST
    end
end

if brew list ollama >/dev/null 2>&1
    echo "ollama already installed"
else
    echo "Installing ollama via Homebrew..."
    brew install ollama
end

echo
if command -q launchctl
    echo "Setting launchctl environment for current user: OLLAMA_HOST=$expected_host"
    launchctl setenv OLLAMA_HOST "$expected_host"
end

echo
if brew services list | grep -Eq '^ollama\s'
    echo "Restarting ollama brew service..."
    brew services restart ollama
else
    echo "Starting ollama brew service..."
    brew services start ollama
end

echo
echo "Ollama install/service bootstrap complete."
echo "Current intended host binding: $expected_host"
echo "Re-run ./scripts/check-ollama.fish to validate API reachability and listener state."
