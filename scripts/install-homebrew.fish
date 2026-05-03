#!/usr/bin/env fish

if command -q brew
    echo "Homebrew already installed: "(command -s brew)
    brew --version | head -n 1
    exit 0
end

echo "Installing Homebrew..."
set installer_script (mktemp)
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.fish > "$installer_script"
/bin/bash "$installer_script"
rm -f "$installer_script"

echo
if test -x /opt/homebrew/bin/brew
    echo "Homebrew install complete: /opt/homebrew/bin/brew"
    echo "If needed for the current shell, run:"
    echo '  eval (/opt/homebrew/bin/brew shellenv)'
else
    echo "Homebrew install completed, but brew is not yet on PATH in this shell."
    echo "Follow the post-install instructions printed above."
end
