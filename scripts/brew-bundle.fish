#!/usr/bin/env fish
source (dirname (status --current-filename))/lib/common.fish

set repo_root (repo_root (status --current-filename))
set brewfile "$repo_root/Brewfile"

require_command brew "Run ./scripts/install-homebrew.fish first."; or exit 1

echo "Applying Brewfile: $brewfile"
brew bundle --file="$brewfile"
