#!/bin/bash

# Load environment variables
source local/development.env

echo "👤 Creating superuser..."
echo "🔑 Using the following credentials from environment variables:"
echo "Username: ${DJANGO_SUPERUSER_USERNAME}"
echo "Email: ${DJANGO_SUPERUSER_EMAIL}"
echo "Password: ${DJANGO_SUPERUSER_PASSWORD}"

docker-compose -f docker-compose.dev.yml run --rm django python app_core/manage.py create_custom_superuser

echo "✅ Superuser created."