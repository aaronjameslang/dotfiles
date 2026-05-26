#!/usr/bin/env bash
set -euo pipefail

log_file="$HOME/.cache/claude/permission-requests.jsonl"
mkdir -p "$(dirname "$log_file")"

jq -c --arg ts "$(date -u +%Y-%m-%dT%H:%M:%SZ)" '. + {timestamp: $ts}' >> "$log_file"
