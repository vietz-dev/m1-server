#!/usr/bin/env fish
source (dirname (status --current-filename))/lib/common.fish

set repo_root (repo_root (status --current-filename))
set brewfile "$repo_root/Brewfile"

if not command -q brew
    echo "FAIL: brew not found. Run ./scripts/install-homebrew.fish first."
    exit 1
end

echo "brew path: "(command -s brew)
brew --version | head -n 1

echo
if brew bundle check --verbose --file="$brewfile"
    echo "Brewfile check: PASS"
else
    echo "Brewfile check: FAIL"
    echo "Run ./scripts/brew-bundle.fish to install missing packages."
    exit 1
end
