# Data Reset Scripts

This folder contains scripts to reset data for your Docker Compose services.

These scripts are **template-friendly** and automatically detect your project name, so they work regardless of your directory name or custom project names.

## ⚠️ WARNING

All scripts will **permanently delete data**. Use with caution!

## Available Scripts

### Individual Service Reset

- `./reset-postgres.sh` - Reset PostgreSQL database
- `./reset-redis.sh` - Reset Redis cache data
- `./reset-minio.sh` - Reset MinIO object storage

### Comprehensive Reset

- `./reset-all-data.sh` - Reset ALL data services at once

### Utilities

- `common.sh` - Shared utilities for project name detection and service health checks

## Usage

```bash
# With confirmation prompt (default)
./scripts/reset-postgres.sh
./scripts/reset-redis.sh
./scripts/reset-minio.sh
./scripts/reset-all-data.sh

# Skip confirmation
./scripts/reset-postgres.sh -y
./scripts/reset-redis.sh -y
./scripts/reset-minio.sh -y
./scripts/reset-all-data.sh -y
```

## What Each Script Does

### PostgreSQL Reset

- Drops the existing database with FORCE
- Creates a fresh empty database
- Preserves the user and authentication

### Redis Reset

- Executes `FLUSHALL` command
- Removes all keys from all databases
- Keeps Redis server running

### MinIO Reset

- Stops MinIO service
- Removes the data volume completely
- Restarts MinIO with fresh storage
- Runs initialization to create default bucket

### All Data Reset

- Delegates to individual reset scripts with `-y` flag
- Single confirmation prompt, then runs all resets
- Shows service URLs and credentials after completion

## Safety Features

- All scripts require explicit confirmation (y/N) by default
- Use `-y` flag to skip confirmation
- Clear warnings about data loss
- Graceful error handling
- Progress indicators and completion messages
