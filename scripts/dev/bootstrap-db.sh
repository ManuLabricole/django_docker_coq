#!/bin/bash

echo "🗑️  Resetting the database..."
docker-compose -f docker-compose.dev.yml down
docker volume rm django_docker_coq_pgdata

echo "🚀 Starting the database container..."
docker-compose -f docker-compose.dev.yml up -d db

echo "⌛ Waiting for the database to be ready..."
./scripts/wait-for-it.sh db:5432 --timeout=60 --strict -- echo "Database is ready"

echo "🚀 Running Django migrations..."
docker-compose -f docker-compose.dev.yml run --rm web python app_core/manage.py makemigrations
docker-compose -f docker-compose.dev.yml run --rm web python app_core/manage.py migrate

echo "👤 Creating superuser..."
docker-compose -f docker-compose.dev.yml run --rm web python app_core/manage.py createsuperuserfromenv

echo "✅ Database reset and superuser creation complete."
