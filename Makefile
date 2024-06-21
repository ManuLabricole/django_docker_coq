# Makefile for Docker operations

# Variables
DOCKER_COMPOSE_DEV = docker-compose -f docker-compose.dev.yml
DOCKER_COMPOSE_PROD = docker-compose -f docker-compose.yml

# Colors
CYAN=\033[0;36m
GREEN=\033[0;32m
NO_COLOR=\033[0m

# Targets
.PHONY: help dev prod shell-dev shell-prod

help:  ## Show this help.
	@echo -e "${CYAN}Usage: make [target]${NO_COLOR}"
	@echo ""
	@echo -e "${CYAN}Targets:${NO_COLOR}"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  ${GREEN}%-20s${NO_COLOR} %s\n", $$1, $$2}'
	@$(MAKE) list-scripts

run:  ## 🚀 Launch the container (env=dev|prod)
	@$(MAKE) _run env=$(env)

_run:
	@if [ "$(env)" = "dev" ]; then \
		echo -e "🚀 ${CYAN}Starting development Docker containers...${NO_COLOR}"; \
		$(DOCKER_COMPOSE_DEV) up --build; \
	elif [ "$(env)" = "prod" ]; then \
		echo -e "🚀 ${CYAN}Starting production Docker containers...${NO_COLOR}"; \
		$(DOCKER_COMPOSE_PROD) up --build; \
	else \
		echo -e "${RED}Invalid environment specified. Use 'env=dev' or 'env=prod'.${NO_COLOR}"; \
		exit 1; \
	fi
shell:  ## 🔧 Enter the shell of the container (env=dev|prod)
	@$(MAKE) _shell env=$(env)

_shell:
	@if [ "$(env)" = "dev" ]; then \
		echo -e "🔧 ${CYAN}Entering shell of the development container...${NO_COLOR}"; \
		$(DOCKER_COMPOSE_DEV) run --rm django sh; \
	elif [ "$(env)" = "prod" ]; then \
		echo -e "🔧 ${CYAN}Entering shell of the production container...${NO_COLOR}"; \
		$(DOCKER_COMPOSE_PROD) run --rm django sh; \
	else \
		echo -e "${RED}Invalid environment specified. Use 'env=dev' or 'env=prod'.${NO_COLOR}"; \
		exit 1; \
	fi

reset:  ## 🔄 Reset the environment (env=dev|prod)
	@echo -e "🛑 ${CYAN}Stopping development containers...${NO_COLOR}"
	$(DOCKER_COMPOSE_DEV) stop
	@echo -e "🗑️  ${CYAN}Removing development containers...${NO_COLOR}"
	$(DOCKER_COMPOSE_DEV) rm -f
	@echo -e "🗑️  ${CYAN}Removing unused images and volumes...${NO_COLOR}"
	$(DOCKER_COMPOSE_DEV) down --rmi all -v --remove-orphans
	@echo -e "🚀 ${CYAN}Rebuilding development environment...${NO_COLOR}"
	$(DOCKER_COMPOSE_DEV) up --build -d