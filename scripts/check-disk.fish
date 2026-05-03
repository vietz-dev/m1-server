#!/usr/bin/env fish
source (dirname (status --current-filename))/lib/common.fish

set repo_root (repo_root (status --current-filename))
set env_file "$repo_root/compose/.env"
set media_path

if test -f "$env_file"
    load_dotenv "$env_file"
    if set -q JELLYFIN_MEDIA_PATH
        set media_path $JELLYFIN_MEDIA_PATH
    end
end

echo "Disk usage:"
df -h /

echo
if command -q tmutil
    echo "Local snapshots (if any):"
    tmutil listlocalsnapshots / 2>/dev/null; or echo "No local snapshots or unavailable"
end

if test -n "$media_path"
    echo
    echo "Media path disk usage: $media_path"
    if test -d "$media_path"
        df -h "$media_path"
        echo
        du -sh "$media_path" 2>/dev/null; or echo "Unable to summarize media path size"
    else
        echo "Media path not found"
    end
end
