# Logging

## Homebrew services
List services:
```bash
brew services list
```

## launchctl
Inspect launch agents/services:
```bash
launchctl list | rg 'ollama|orbstack'
launchctl getenv OLLAMA_HOST
```

## Ollama logs
Recent logs:
```bash
log show --last 10m --style compact --predicate 'process == "ollama"'
```

## OrbStack and container logs
Container list:
```bash
docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'
```

Open WebUI logs:
```bash
docker logs --tail 100 open-webui
```

Jellyfin logs:
```bash
docker logs --tail 100 jellyfin
```

Compose view:
```bash
docker compose -f compose/docker-compose.yml ps
```

## macOS system logs
General recent system logs:
```bash
log show --last 10m --style compact
```

Power-related clues:
```bash
pmset -g log | tail -n 50
```

## Recommended workflow
1. Run `./scripts/status-all.sh`
2. Inspect the failing service's `check-*` output
3. Pull targeted logs from the relevant commands above
4. Follow the matching recovery runbook in `runbooks/`
