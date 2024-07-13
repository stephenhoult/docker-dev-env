SHELL=/bin/bash
# Local Environment Setup Scripts

# HELP
# This will output the help for each task
.PHONY: help

help: ## List of available commands.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

# TASKS
network: ## Create the network
	@echo "Creating network..."
	docker network create $(shell grep PROJECT_NAME .env | cut -d '=' -f 2)-network
	@echo "√ Network created"
start: ## Start the environment.
	docker compose up -d --build
	@sleep 5
	@echo "√ Container is up and ready"
stop: ## Stop/pause the environment.
	docker compose stop
refresh: ## Refresh the environment without loosing images nor volumes.
	docker compose down
	docker compose up -d --build
destroy: ## Destroy and clean the environment.
	docker compose down --rmi all --volumes --remove-orphans
test: ## Run all tests, unit and functional.
	docker compose exec php php vendor/bin/phpunit
migrate: ## Trigger migration fresh script
	docker compose exec php php artisan migrate
