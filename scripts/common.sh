#!/bin/bash

# Common utilities for reset scripts

# Get the Docker Compose project name dynamically
get_project_name() {
  # Try to get project name from docker compose, fallback to directory name
  PROJECT_NAME=$(docker compose config --project-name 2>/dev/null || basename "$(pwd)")
  echo "$PROJECT_NAME"
}

# Check if a service is running
is_service_running() {
  local service_name="$1"
  docker compose ps "$service_name" 2>/dev/null | grep -q "Up"
}

# Wait for a service to be healthy
wait_for_service() {
  local service_name="$1"
  local max_attempts="${2:-30}"
  local attempt=1
  
  echo "⏳ Waiting for $service_name to be ready..."
  while [ $attempt -le $max_attempts ]; do
    if docker compose ps "$service_name" 2>/dev/null | grep -q "(healthy)"; then
      echo "✅ $service_name is ready"
      return 0
    fi
    sleep 1
    attempt=$((attempt + 1))
  done
  
  echo "⚠️  $service_name may not be fully ready yet"
  return 1
}

# Get service port mapping
get_service_port() {
  local service_name="$1"
  local internal_port="$2"
  docker compose port "$service_name" "$internal_port" 2>/dev/null | cut -d: -f2
} 