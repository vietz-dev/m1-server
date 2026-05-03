#!/usr/bin/env fish
set label net.pangolin.newt
set plist /Library/LaunchDaemons/net.pangolin.newt.plist
set env_file /etc/newt/newt.env
set wrapper /usr/local/libexec/newt-launch.fish
set binary /usr/local/bin/newt
set log_file /var/log/newt.log

if test -x "$binary"
    echo "newt binary: PASS ($binary)"
else
    echo "newt binary: FAIL ($binary missing)"
end

echo
if test -f "$env_file"
    echo "env file: PASS ($env_file)"
    stat -f 'mode: %Sp owner: %Su group: %Sg' "$env_file"
else
    echo "env file: FAIL ($env_file missing)"
end

echo
if test -f "$plist"
    echo "launchd plist: PASS ($plist)"
else
    echo "launchd plist: FAIL ($plist missing)"
end

echo
if test -x "$wrapper"
    echo "launch wrapper: PASS ($wrapper)"
else
    echo "launch wrapper: FAIL ($wrapper missing or not executable)"
end

echo
if sudo launchctl print system/$label >/tmp/newt-launchctl.out 2>/dev/null
    echo "launchd status: PASS"
    rg -n 'state =|pid =|last exit code =' /tmp/newt-launchctl.out || cat /tmp/newt-launchctl.out
else
    echo "launchd status: FAIL"
end
rm -f /tmp/newt-launchctl.out

echo
if pgrep -fl '/usr/local/bin/newt' >/dev/null 2>&1
    echo "process state: PASS"
    pgrep -fl '/usr/local/bin/newt'
else
    echo "process state: WARN (newt process not found)"
end

echo
if test -f "$log_file"
    echo "recent log output:"
    sudo tail -n 50 "$log_file"
else
    echo "recent log output: WARN ($log_file missing)"
end
