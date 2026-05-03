#!/usr/bin/env fish
source (dirname (status --current-filename))/lib/common.fish

if test (id -u) -ne 0
    echo "Please run with sudo." >&2
    exit 1
end

set repo_root (repo_root (status --current-filename))
set local_env "$repo_root/config/newt.env"
set env_dst /etc/newt/newt.env
set wrapper_src "$repo_root/launchd/newt-launch.fish"
set wrapper_dst /usr/local/libexec/newt-launch.fish
set plist_src "$repo_root/launchd/net.pangolin.newt.plist.template"
set plist_dst /Library/LaunchDaemons/net.pangolin.newt.plist

if not test -f "$local_env"
    echo "Missing $local_env. Copy config/newt.env.example to config/newt.env and fill in real values first." >&2
    exit 1
end

echo "Installing Newt via upstream installer..."
set installer_script (mktemp)
curl -fsSL https://static.pangolin.net/get-newt.sh > "$installer_script"
/bin/bash "$installer_script"
rm -f "$installer_script"

echo
mkdir -p /etc/newt
cp "$local_env" "$env_dst"
chmod 600 "$env_dst"

echo "Installing launchd wrapper..."
mkdir -p /usr/local/libexec
cp "$wrapper_src" "$wrapper_dst"
chmod 755 "$wrapper_dst"

echo "Installing launchd plist..."
cp "$plist_src" "$plist_dst"
chmod 644 "$plist_dst"

if launchctl print system/net.pangolin.newt >/dev/null 2>&1
    echo "Reloading existing Newt launch daemon..."
    launchctl bootout system "$plist_dst" >/dev/null 2>&1; or true
end

launchctl bootstrap system "$plist_dst"
launchctl enable system/net.pangolin.newt
launchctl kickstart -k system/net.pangolin.newt

echo
echo "Newt install/start complete."
echo "Re-run ./scripts/check-newt.fish for validation."
