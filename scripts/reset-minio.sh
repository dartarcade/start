#!/bin/bash

# Source common utilities
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

# Check for -y flag
SKIP_CONFIRM=false
if [ "$1" = "-y" ]; then
  SKIP_CONFIRM=true
fi

echo "🪣 MINIO RESET"
echo "DANGER: This will remove all MinIO buckets and objects"
echo "All stored files and data will be permanently lost!"

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

echo "🔄 Resetting MinIO..."

echo "⏹️  Stopping MinIO services..."
docker compose stop minio minio-init

echo "🗑️  Removing MinIO containers..."
docker compose rm -f minio minio-init

echo "🗑️  Removing MinIO data volume..."
PROJECT_NAME=$(get_project_name)
docker volume rm "${PROJECT_NAME}_minio_data" 2>/dev/null || true

echo "🚀 Starting MinIO service..."
docker compose up -d minio

wait_for_service "minio"

echo "🪣 Running MinIO initialization..."
docker compose up minio-init

echo "✅ MinIO reset complete! Visit http://localhost:9001"
echo "🔑 Login: minioadmin / minioadmin" 