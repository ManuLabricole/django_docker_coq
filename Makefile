# Makefile for Docker operations

# Variables
DOCKER_COMPOSE_DEV = docker-compose -f docker-compose.dev.yml
DOCKER_COMPOSE_PROD = docker-compose -f docker-compose.yml

# Targets
.PHONY: help dev prod shell-dev shell-prod

help:  ## Show this help.
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-20s %s\n", $$1, $$2}'

prep-dev-env:  ## Prepare the development environment
	@echo "🚀 Preparing development environment..."
	chmod +x scripts/prep_dev_env.sh
	./scripts/prep_dev_env.sh
	@echo "✅ Development environment prepared."

dev:  ## Launch the development container
	@echo "🚀 Starting Docker containers..."
	$(DOCKER_COMPOSE_DEV) up --build
	@echo "✅ Docker containers started."


prod:  ## Launch the production container
	$(DOCKER_COMPOSE_PROD) up --build

shell-dev:  ## Enter the shell of the development container
	$(DOCKER_COMPOSE_DEV) run --rm web sh

shell-prod:  ## Enter the shell of the production container
	$(DOCKER_COMPOSE_PROD) run --rm web sh

reset-db:  ## Remove the existing database volume
	@echo "🗑️  Removing the existing database volume..."
	docker-compose -f docker-compose.dev.yml down
	docker volume rm django_docker_coq_pgdata
	@echo "✅ Database volume removed."

db-up:  ## Launch only the database container
	@echo "🚀 Starting the database container..."
	$(DOCKER_COMPOSE_DEV) up -d db
	@echo "✅ Database container started."

migrations-migrate:  ## Run Django migrations
	@echo "✅ Running Django migrations..."
	$(DOCKER_COMPOSE_DEV) run --rm web python app_core/manage.py makemigrations
	$(DOCKER_COMPOSE_DEV) run --rm web python app_core/manage.py migrate
	@echo "✅ Django migrations ran."
