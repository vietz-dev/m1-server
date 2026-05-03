---
title: 5. Ollama
description: Install, expose, and validate the native LLM runtime.
---

# 5. Ollama

## Why it is native instead of containerized

The goal is to preserve Apple Silicon / Metal acceleration and avoid turning Ollama into just another CPU-bound container.

## 5.1 Install and start Ollama

Run:
```fish
./scripts/install-ollama.fish
```

This should:
- install Ollama via Homebrew if needed
- set `OLLAMA_HOST`
- start or restart the Homebrew-managed service

## 5.2 Validate basic service health

Run:
```fish
./scripts/check-ollama.fish
```

## 5.3 Pull a starter model

Run:
```fish
./scripts/ollama-pull-models.fish
./scripts/ollama-list-models.fish
```

Default documented starter model:
- `gemma3`

## 5.4 Smoke test inference

Run:
```fish
./scripts/ollama-smoke-test.fish
```

## 5.5 Confirm LAN reachability if intentionally exposed

From another LAN machine:
```fish
curl http://macbook-air.local:11434/api/tags
```

## 5.6 What is still a real validation task

The repo can document how to check Metal acceleration, but you still need to verify it on the actual machine by inspecting logs and real inference behavior.

## Next step

Continue to:
- [6. Open WebUI](/setup/06-open-webui/)
