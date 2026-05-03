---
title: 3. Homebrew and Fish
description: Install the package baseline and enable fish as the preferred shell.
---

# 3. Homebrew and Fish

## Why this comes early

The rest of the repo assumes the machine can install packages reproducibly and that repo scripts are runnable from fish.

## 3.1 Install Homebrew

Run:
```fish
./scripts/install-homebrew.fish
```

If `brew` is not yet on `PATH` in the current session:
```fish
eval (/opt/homebrew/bin/brew shellenv)
```

## 3.2 Install the managed baseline

Run:
```fish
./scripts/brew-bundle.fish
./scripts/check-homebrew.fish
```

Important baseline tools include:
- `git`
- `jq`
- `wget`
- `htop`
- `ripgrep`
- `tmux`
- `fish`
- `ollama`
- `orbstack`

## 3.3 Enable fish as the login shell

Run or follow manually:
```fish
command -s fish
echo (command -s fish) | sudo tee -a /etc/shells
chsh -s (command -s fish) justin
```

Open a new terminal and confirm:
```fish
echo $SHELL
fish --version
```

## 3.4 Keep a fallback shell

Do not treat fish as irreversible. Keep `/bin/zsh` available as a fallback in case recovery requires it.

## Next step

Continue to:
- [4. OrbStack](/setup/04-orbstack/)
