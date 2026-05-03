# Runbook: Homebrew Bootstrap

## Goal
Install Homebrew and reconcile the baseline package set for this server.

## Prerequisites
- local admin access to the Mac
- network access to download packages
- Xcode Command Line Tools readiness if prompted by the Homebrew installer

## Why this is partially manual
The Homebrew installer may prompt for admin approval or Xcode Command Line Tools setup.

## Steps
1. Install Homebrew:
   ```bash
   ./scripts/install-homebrew.sh
   ```
2. If the installer says `brew` is not on `PATH` yet, load it for the current shell:
   ```bash
   eval "$(/opt/homebrew/bin/brew shellenv)"
   ```
3. Apply the repo-managed package set:
   ```bash
   ./scripts/brew-bundle.sh
   ```
4. Validate the result:
   ```bash
   ./scripts/check-homebrew.sh
   ```

## Expected package set
Managed by `Brewfile`:
- core tools: `git`, `jq`, `wget`, `htop`, `ripgrep`, `tmux`
- native runtime: `ollama`
- container runtime: `orbstack`

## Rollback
- remove an installed package:
  ```bash
  brew uninstall <formula>
  ```
- remove a cask:
  ```bash
  brew uninstall --cask <name>
  ```
- if the package should not be part of the baseline, update `Brewfile` and `docs/tooling.md`

## Related files
- `Brewfile`
- `scripts/install-homebrew.sh`
- `scripts/brew-bundle.sh`
- `scripts/check-homebrew.sh`
- `docs/tooling.md`
