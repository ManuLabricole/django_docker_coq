# Makefile for Docker operations

# Variables
DOCKER_COMPOSE_DEV = docker-compose -f docker-compose.dev.yml
DOCKER_COMPOSE_PROD = docker-compose -f docker-compose.yml

# Colors
CYAN=\033[0;36m
GREEN=\033[0;32m
NO_COLOR=\033[0m

# Targets
.PHONY: help dev prod shell-dev shell-prod reset-db db-up makemigrations-migrate create-superuser bootstrap-database manage list-scripts

help:  ## Show this help.
	@echo -e "${CYAN}Usage: make [target]${NO_COLOR}"
	@echo ""
	@echo -e "${CYAN}Targets:${NO_COLOR}"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  ${GREEN}%-20s${NO_COLOR} %s\n", $$1, $$2}'
	@$(MAKE) list-scripts

dev:  ## 🚀 Launch the development container
	chmod +x scripts/dev/stop-db.sh
	@echo -e "🚀 ${CYAN}Preparing development environment...${NO_COLOR}"
	./scripts/dev/stop-db.sh
	@echo -e "🚀 ${CYAN}Starting Docker containers...${NO_COLOR}"
	$(DOCKER_COMPOSE_DEV) up --build

prod:  ## 🚀 Launch the production container
	$(DOCKER_COMPOSE_PROD) up --build

shell-dev:  ## 🔧 Enter the shell of the development container
	$(DOCKER_COMPOSE_DEV) run --rm web sh

shell-prod:  ## 🔧 Enter the shell of the production container
	$(DOCKER_COMPOSE_PROD) run --rm web sh

manage:  ## 🔧 Manage script to call other functions
	@$(MAKE) _manage ARGS="$(filter-out $@,$(MAKECMDGOALS))"

_manage:
	chmod +x scripts/manage.sh
	chmod +x scripts/*.sh
	chmod +x scripts/dev/*.sh
	./scripts/manage.sh $(ARGS)

list-scripts:  ## 📜 List all .sh files in scripts/ and scripts/dev/
	@echo -e "${CYAN}Here are the .sh scripts available in scripts/ and scripts/dev/:${NO_COLOR}"
	@find scripts/ scripts/dev/ -name "*.sh" | while read -r file; do echo -e "  ${GREEN}$$file${NO_COLOR} - Script file"; done

# Catch-all target to prevent Make from interpreting additional arguments as targets
%:
	@:
