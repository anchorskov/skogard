#!/usr/bin/env bash
# startDev.sh

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
PORT="${PORT:-4321}"
PID_FILE="$ROOT_DIR/.astro-dev.pid"
LOG_FILE="$ROOT_DIR/.astro-dev.log"

if ! command -v npm >/dev/null 2>&1; then
  echo "Error: npm is not installed."
  exit 1
fi

if ! command -v ss >/dev/null 2>&1; then
  echo "Error: ss is required to check local ports."
  exit 1
fi

if ss -ltn "( sport = :$PORT )" 2>/dev/null | grep -q ":$PORT"; then
  echo "Error: port $PORT is already in use."
  echo "Run ./stop.sh or choose another port with PORT=<port> ./startDev.sh"
  exit 1
fi

if [ -f "$PID_FILE" ]; then
  old_pid="$(cat "$PID_FILE")"
  if kill -0 "$old_pid" >/dev/null 2>&1; then
    echo "Error: dev server appears to already be running with PID $old_pid."
    echo "Run ./stop.sh first."
    exit 1
  fi
  rm -f "$PID_FILE"
fi

cd "$ROOT_DIR"
nohup npm run dev -- --host 127.0.0.1 --port "$PORT" >"$LOG_FILE" 2>&1 &
dev_pid=$!
echo "$dev_pid" >"$PID_FILE"

sleep 2

if kill -0 "$dev_pid" >/dev/null 2>&1; then
  echo "Astro dev server started."
  echo "URL: http://127.0.0.1:$PORT"
  echo "PID: $dev_pid"
  echo "Log: $LOG_FILE"
else
  echo "Error: dev server failed to start."
  echo "Check $LOG_FILE for details."
  rm -f "$PID_FILE"
  exit 1
fi
