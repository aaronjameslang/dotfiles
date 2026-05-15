#!/bin/sh

[ -f package.json ] || exit 0
[ -d node_modules ] && exit 0

if [ -f pnpm-lock.yaml ]; then
  pnpm install
elif [ -f yarn.lock ]; then
  yarn install
elif [ -f bun.lockb ] || [ -f bun.lock ]; then
  bun install
else
  npm install
fi
