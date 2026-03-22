#!/usr/bin/env bash
# stop.sh

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
PORT="${PORT:-4321}"
PID_FILE="$ROOT_DIR/.astro-dev.pid"
LOG_FILE="$ROOT_DIR/.astro-dev.log"

stop_pid() {
  pid="$1"
  if kill -0 "$pid" >/dev/null 2>&1; then
    kill "$pid" >/dev/null 2>&1 || true
    sleep 1
    if kill -0 "$pid" >/dev/null 2>&1; then
      kill -9 "$pid" >/dev/null 2>&1 || true
    fi
  fi
}

if [ -f "$PID_FILE" ]; then
  stop_pid "$(cat "$PID_FILE")"
  rm -f "$PID_FILE"
fi

if command -v lsof >/dev/null 2>&1; then
  while IFS= read -r pid; do
    [ -n "$pid" ] && stop_pid "$pid"
  done < <(lsof -ti tcp:"$PORT" || true)
elif command -v ss >/dev/null 2>&1; then
  while IFS= read -r pid; do
    [ -n "$pid" ] && stop_pid "$pid"
  done < <(ss -ltnp "( sport = :$PORT )" 2>/dev/null | sed -n 's/.*pid=\([0-9]\+\).*/\1/p' | sort -u)
fi

rm -f "$LOG_FILE"

if command -v lsof >/dev/null 2>&1 && lsof -ti tcp:"$PORT" >/dev/null 2>&1; then
  echo "Warning: port $PORT is still in use."
  exit 1
fi

echo "Stopped local dev processes for port $PORT."
