#!/bin/bash
# Deny shell commands that have dedicated Claude Code tools.
# PreToolUse hook — exit 2 to block, exit 0 to allow.

COMMAND=$(jq -r '.tool_input.command')

declare -A ALTERNATIVES=(
  [find]="Glob"
  [grep]="Grep"
  [rg]="Grep"
  [cat]="Read"
  [head]="Read"
  [tail]="Read"
  [sed]="Edit"
  [awk]="Edit"
  [echo]="Write (or output text directly)"
)

FIRST=$(echo "$COMMAND" | awk '{print $1}')
BASE=$(basename "$FIRST")
ALT="${ALTERNATIVES[$BASE]}"

if [[ -n "$ALT" ]]; then
  cat >&2 <<MSG
Do not use '$BASE' — use the $ALT tool instead.
MSG
  exit 2
fi

exit 0
