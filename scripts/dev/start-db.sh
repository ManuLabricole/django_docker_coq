#!/bin/bash
echo "🚀 Starting the database container..."

# Start the database container
docker-compose -f docker-compose.dev.yml up -d db

echo "⌛ Waiting for the database to be ready..."
docker-compose -f docker-compose.dev.yml run --rm db ./usr/src/app/scripts/wait-for-it.sh db:5432 --timeout=60 --strict -- echo "Database is ready"
echo "✅ Database is ready."
