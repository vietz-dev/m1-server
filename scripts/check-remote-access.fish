#!/usr/bin/env fish
source (dirname (status --current-filename))/lib/common.fish

set expected_hostname macbook-air
set expected_user justin
set repo_root (repo_root (status --current-filename))
set machine_env "$repo_root/config/machine.env"

if test -f "$machine_env"
    load_dotenv "$machine_env"
    if set -q HOSTNAME
        set expected_hostname $HOSTNAME
    end
    if set -q LOCAL_USER
        set expected_user $LOCAL_USER
    end
end

set actual_hostname (scutil --get HostName 2>/dev/null)
set actual_user (id -un)

echo "Expected hostname: $expected_hostname"
echo "Actual hostname:   "(test -n "$actual_hostname"; and echo $actual_hostname; or echo '<not set>')
if test "$actual_hostname" = "$expected_hostname"
    echo "Hostname check:    PASS"
else
    echo "Hostname check:    FAIL"
end

echo
echo "Expected user: $expected_user"
echo "Actual user:   $actual_user"
if test "$actual_user" = "$expected_user"
    echo "User check:    PASS"
else
    echo "User check:    FAIL"
end

echo
echo "Remote Login status:"
systemsetup -getremotelogin 2>/dev/null; or echo "Unable to query with systemsetup (try sudo for full output)"

echo
echo "SSH listener:"
if lsof -nP -iTCP:22 -sTCP:LISTEN >/dev/null 2>&1
    lsof -nP -iTCP:22 -sTCP:LISTEN
else
    echo "No SSH listener found on port 22"
end

echo
echo "Screen Sharing listener (optional fallback):"
if lsof -nP -iTCP:5900 -sTCP:LISTEN >/dev/null 2>&1
    lsof -nP -iTCP:5900 -sTCP:LISTEN
else
    echo "No Screen Sharing listener found on port 5900"
end

echo
echo "Suggested manual validation: ssh $expected_user@$expected_hostname.local"
