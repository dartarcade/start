#!/bin/bash

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Check for -y flag
SKIP_CONFIRM=false
if [ "$1" = "-y" ]; then
  SKIP_CONFIRM=true
fi

echo "💥 RESET ALL DATA SERVICES"
echo "========================================"
echo "DANGER: This will reset ALL data services:"
echo "• PostgreSQL database"
echo "• Redis cache"
echo "• MinIO object storage"
echo ""
echo "ALL DATA WILL BE PERMANENTLY LOST!"
echo "========================================"

if [ "$SKIP_CONFIRM" = false ]; then
  echo ""
  read -p "Are you absolutely sure you want to proceed? (y/N): " confirm
  if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
    echo "❌ Aborting..."
    exit 1
  fi
fi

echo ""
echo "🔄 Resetting all data services..."
echo ""

# Delegate to individual scripts with -y flag
echo "1️⃣  Running PostgreSQL reset..."
"$SCRIPT_DIR/reset-postgres.sh" -y

echo ""
echo "2️⃣  Running Redis reset..."
"$SCRIPT_DIR/reset-redis.sh" -y

echo ""
echo "3️⃣  Running MinIO reset..."  
"$SCRIPT_DIR/reset-minio.sh" -y

echo ""
echo "🎉 ALL DATA SERVICES RESET COMPLETE!"
echo ""
echo "📋 Service URLs:"
echo "• PostgreSQL: localhost:5432"
echo "• Redis: localhost:6379"
echo "• MinIO API: http://localhost:9000"
echo "• MinIO Console: http://localhost:9001"
echo ""
echo "🔑 Credentials:"
echo "• PostgreSQL: postgres/postgres"
echo "• MinIO: minioadmin/minioadmin" 