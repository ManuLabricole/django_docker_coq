#!/bin/bash

echo "✅ Running Django makemigrations..."
# Here django is the name of the service, not the container
docker-compose -f docker-compose.dev.yml run --rm django python app_core/manage.py makemigrations

echo "✅ Running Django migrations..."
docker-compose -f docker-compose.dev.yml run --rm django python app_core/manage.py migrate

echo "✅ Django migrations ran."
