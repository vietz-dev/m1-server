# Logging

## Homebrew services
List services:
```fish
brew services list
```

## launchctl
Inspect launch agents/services:
```fish
launchctl list | rg 'ollama|orbstack'
launchctl getenv OLLAMA_HOST
```

## Ollama logs
Recent logs:
```fish
log show --last 10m --style compact --predicate 'process == "ollama"'
```

## OrbStack and container logs
Container list:
```fish
docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'
```

Open WebUI logs:
```fish
docker logs --tail 100 open-webui
```

Jellyfin logs:
```fish
docker logs --tail 100 jellyfin
```

Compose view:
```fish
docker compose -f compose/docker-compose.yml ps
```

## macOS system logs
General recent system logs:
```fish
log show --last 10m --style compact
```

Power-related clues:
```fish
pmset -g log | tail -n 50
```

## Pangolin / Newt logs
launchd state:
```fish
sudo launchctl print system/net.pangolin.newt
```

file log:
```fish
sudo tail -n 100 /var/log/newt.log
```

## Recommended workflow
1. Run `./scripts/status-all.fish`
2. Inspect the failing service's `check-*` output
3. Pull targeted logs from the relevant commands above
4. Follow the matching recovery runbook in `runbooks/`
