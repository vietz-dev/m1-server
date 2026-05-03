#!/usr/bin/env fish
source (dirname (status --current-filename))/lib/common.fish

set repo_root (repo_root (status --current-filename))

function run_check --argument-names title script_path
    echo
    echo "===== $title ====="
    if test -x "$script_path"
        if "$script_path"
        else
            echo
            echo "$title: completed with warnings or failures"
        end
    else
        echo "Missing or non-executable: $script_path"
    end
end

echo "m1-server status summary"
date

run_check "Remote access" "$repo_root/scripts/check-remote-access.fish"
run_check "Power management" "$repo_root/scripts/check-pmset.fish"
run_check "Homebrew" "$repo_root/scripts/check-homebrew.fish"
run_check "OrbStack" "$repo_root/scripts/check-orbstack.fish"
run_check "Ollama" "$repo_root/scripts/check-ollama.fish"
run_check "Open WebUI" "$repo_root/scripts/check-open-webui.fish"
run_check "Jellyfin" "$repo_root/scripts/check-jellyfin.fish"
run_check "Ports" "$repo_root/scripts/check-ports.fish"
run_check "Disk" "$repo_root/scripts/check-disk.fish"
run_check "Memory" "$repo_root/scripts/check-memory.fish"
