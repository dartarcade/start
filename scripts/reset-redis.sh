#!/bin/bash

# Source common utilities
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

# Check for -y flag
SKIP_CONFIRM=false
if [ "$1" = "-y" ]; then
  SKIP_CONFIRM=true
fi

echo "🗂️  REDIS RESET"
echo "DANGER: This will flush all Redis databases"
echo "All Redis data (keys, values, etc.) will be permanently lost!"

if [ "$SKIP_CONFIRM" = false ]; then
  echo ""
  read -p "Are you sure you want to proceed? (y/N): " confirm
  if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
    echo "❌ Aborting..."
    exit 1
  fi
else
  echo "⚡ Skipping confirmation (-y flag detected)"
fi

echo "🔄 Resetting Redis..."

# Wait for Redis to be ready
wait_for_service "redis"

echo "🧹 Flushing all Redis databases..."
docker compose exec redis redis-cli FLUSHALL

echo "✅ Redis data reset complete!" 