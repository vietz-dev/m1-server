#!/usr/bin/env fish

if not command -q brew
    echo "brew not found. Run ./scripts/install-homebrew.fish first." >&2
    exit 1
end

echo "Updating Homebrew metadata..."
brew update

echo
echo "Upgrading installed Homebrew packages..."
brew upgrade

echo
echo "Cleaning up old Homebrew artifacts..."
brew cleanup

echo
echo "Done. Re-run ./scripts/check-homebrew.fish to validate the managed baseline."
