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

dev:  ## Launch the development container
	$(DOCKER_COMPOSE_DEV) up --build

prod:  ## Launch the production container
	$(DOCKER_COMPOSE_PROD) up --build

shell-dev:  ## Enter the shell of the development container
	$(DOCKER_COMPOSE_DEV) run --rm web sh

shell-prod:  ## Enter the shell of the production container
	$(DOCKER_COMPOSE_PROD) run --rm web sh
