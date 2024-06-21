#!/bin/bash

./scripts/dev/stop-db.sh

echo "🗑️  Removing the existing database volume..."
docker-compose -f docker-compose.dev.yml down
docker volume rm pgdata_dev
echo

./scripts/dev/start-db.sh
echo "$pwd"
