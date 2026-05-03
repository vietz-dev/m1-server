---
title: 2. Base macOS Setup
description: Make the Mac safe to run remotely and headlessly before adding services.
---

# 2. Base macOS Setup

This phase matters more than app deployment. If remote access and power behavior are unreliable, everything else will be painful.

## Outcomes you want

- hostname set correctly
- SSH enabled
- optional Screen Sharing available
- power settings suitable for server use
- headless assumptions tested
- router reservation planned

## 2.1 Set identity and remote access

Follow the repo runbook concepts:
- target hostname: `macbook-air`
- target local DNS name: `macbook-air.local`
- operator account: `justin` by default in this repo

Then validate with:
```fish
./scripts/check-remote-access.fish
```

### Manual tasks in System Settings

1. Open **System Settings → General → Sharing**.
2. Set the Mac name if needed.
3. Enable **Remote Login**.
4. Allow the intended user.
5. Optionally enable **Screen Sharing**.

## 2.2 Decide on auto-login

Auto-login is a tradeoff.

### Pros
- login-dependent apps recover more easily after reboot
- headless recovery is simpler

### Cons
- lower physical-security posture if someone has local access to the device

Use the repo runbook for the exact workflow, then test a reboot.

## 2.3 Apply power settings

Run:
```fish
sudo ./scripts/configure-pmset.fish
./scripts/check-pmset.fish
```

The intended policy is:
- stay awake on power adapter
- keep network-friendly behavior where supported
- avoid accidental sleep during server use

## 2.4 Test headless behavior

Before trusting the Mac with a broken internal display or lid-closed operation, test:
- SSH while the lid is closed
- dummy display behavior
- reboot without a real monitor

This must be **actually tested**, not only documented.

## 2.5 Record networking decisions

Decide and document:
- Wi-Fi vs Ethernet
- DHCP reservation in the router
- final reserved IP
- whether Screen Sharing remains enabled long term

## Next step

Continue to:
- [3. Homebrew and Fish](/setup/03-homebrew-and-fish/)
