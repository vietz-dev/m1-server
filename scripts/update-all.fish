#!/usr/bin/env fish
source (dirname (status --current-filename))/lib/common.fish

set repo_root (repo_root (status --current-filename))

function run_step --argument-names title
    echo
    echo "===== $title ====="
    $argv[2..-1]
end

run_step "Update Homebrew packages" "$repo_root/scripts/update-brew.fish"
run_step "Update container images" "$repo_root/scripts/update-containers.fish"

echo
if command -q brew; and brew services list | grep -Eq '^ollama\s'
    run_step "Restart Ollama service" brew services restart ollama
end

run_step "Post-update status summary" "$repo_root/scripts/status-all.fish"
