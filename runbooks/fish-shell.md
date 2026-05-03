# Runbook: Fish Shell

## Goal
Install fish shell, make it available as a login shell, and switch user `justin` to fish.

## Prerequisites
- Homebrew is installed
- local admin access to the Mac
- current operator account is `justin`

## Install
If fish is not already installed through the repo `Brewfile`, run:
```fish
./scripts/brew-bundle.fish
```

Or install it directly:
```fish
brew install fish
```

## Enable fish as a login shell
1. Confirm the fish binary path:
   ```fish
   command -s fish
   ```
2. Add that path to allowed shells if needed:
   ```fish
   echo (command -s fish) | sudo tee -a /etc/shells
   ```
3. Change the login shell for `justin`:
   ```fish
   chsh -s (command -s fish) justin
   ```
4. Open a new terminal session and confirm:
   ```fish
   echo $SHELL
   fish --version
   ```

## Notes
- The repo's executable scripts now use fish syntax directly.
- Existing commands in docs may still be shown as generic shell commands, but all repo scripts can be run from fish.
- Keep a fallback shell such as `/bin/zsh` available in case you need recovery access.

## Rollback
Switch back to zsh if needed:
```fish
chsh -s /bin/zsh justin
```
