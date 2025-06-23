#!/bin/bash

# Source common utilities
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

# Check for -y flag
SKIP_CONFIRM=false
if [ "$1" = "-y" ]; then
  SKIP_CONFIRM=true
fi

TMP_DB="__tmp_reset_db__"

echo "🗄️  POSTGRES RESET"
echo "DANGER: This will drop the 'db' database and recreate it"
echo "All application data will be permanently lost!"

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

echo "🔄 Resetting PostgreSQL..."

# Wait for PostgreSQL to be ready
wait_for_service "postgres"

echo "📋 Creating temporary database for reset..."
docker compose exec postgres psql -U postgres -d postgres -c "DROP DATABASE IF EXISTS $TMP_DB WITH (FORCE);"
docker compose exec postgres psql -U postgres -d postgres -c "CREATE DATABASE $TMP_DB;"

echo "📋 Dropping 'db' database..."
# Connect to the temporary database to drop the db database
# (cannot drop the database you are connected to)
docker compose exec postgres psql -U postgres -d $TMP_DB -c "DROP DATABASE IF EXISTS db WITH (FORCE);"

echo "🆕 Creating fresh 'db' database..."
docker compose exec postgres psql -U postgres -d $TMP_DB -c "CREATE DATABASE db;"

echo "🧹 Dropping temporary database..."
docker compose exec postgres psql -U postgres -d postgres -c "DROP DATABASE IF EXISTS $TMP_DB WITH (FORCE);"

echo "✅ PostgreSQL 'db' database reset complete!" 