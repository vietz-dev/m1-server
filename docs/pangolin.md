# Pangolin / Newt on macOS

## Goal
Configure the Pangolin Newt agent on this MacBook using a macOS-native `launchd` service instead of the Linux `systemd` flow from the upstream guide.

## Important difference from the upstream guide
The official instructions use:
- `/etc/newt/newt.env`
- `systemd`
- `systemctl`

On this Mac, the equivalent design is:
- secrets/config in `/etc/newt/newt.env`
- service management with `launchd`
- daemon plist at `/Library/LaunchDaemons/net.pangolin.newt.plist`

## Local config source of truth
Create a local untracked file from:
- `config/newt.env.example`

Recommended local file:
- `config/newt.env`

Then the install script copies it to:
- `/etc/newt/newt.env`

## Install flow
Use:
```fish
sudo ./scripts/install-newt.fish
```

This will:
- run the upstream Newt installer
- copy `config/newt.env` into `/etc/newt/newt.env`
- install a `launchd` wrapper script and plist
- load and start the daemon

## Validate
Use:
```fish
./scripts/check-newt.fish
```

## Logs
Primary log file:
- `/var/log/newt.log`

Useful checks:
```fish
sudo launchctl print system/net.pangolin.newt
sudo tail -n 100 /var/log/newt.log
```

## Security notes
- do not commit real Newt secrets to git
- keep `config/newt.env` local only
- `/etc/newt/newt.env` should remain mode `600`
