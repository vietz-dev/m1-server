#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
env_file="${repo_root}/compose/.env"
media_path=""

if [[ -f "$env_file" ]]; then
  # shellcheck disable=SC1090
  source "$env_file"
  media_path="${JELLYFIN_MEDIA_PATH:-}"
fi

echo "Disk usage:"
df -h /

echo
if command -v tmutil >/dev/null 2>&1; then
  echo "Local snapshots (if any):"
  tmutil listlocalsnapshots / 2>/dev/null || echo "No local snapshots or unavailable"
fi

if [[ -n "$media_path" ]]; then
  echo
  echo "Media path disk usage: ${media_path}"
  if [[ -d "$media_path" ]]; then
    df -h "$media_path"
    echo
    du -sh "$media_path" 2>/dev/null || echo "Unable to summarize media path size"
  else
    echo "Media path not found"
  fi
fi
