include .env

#-----------------------------------------------------------
# Docker
#-----------------------------------------------------------

# Wake up docker containers
up:
	docker-compose up -d

# Shut down docker containers
down:
	docker-compose down

# Show a status of each container
status:
	docker-compose ps

# Status alias
s: status

# Show logs of each container
logs:
	docker-compose logs

# Restart all containers
restart: down up

# Build and up docker containers
build:
	docker-compose up -d --build

# Build containers with no cache option
build-no-cache:
	docker-compose build --no-cache

# Build and up docker containers
rebuild: down build

# Run terminal of the php container
php:
	docker-compose exec -u1000 php bash


#-----------------------------------------------------------
# Logs
#-----------------------------------------------------------

# Clear file-based logs
logs-clear:
	sudo rm docker/${DOCKER_ENV}/nginx/logs/*.log

#-----------------------------------------------------------
# Dependencies
#-----------------------------------------------------------

# Install composer dependencies
composer-install:
	docker-compose exec -u1000 php composer install

# Update composer dependencies
composer-update:
	docker-compose exec -u1000 php composer update

# Show composer outdated dependencies
composer-outdated:
	docker-compose exec -u1000 npm outdated

#-----------------------------------------------------------
# Installation
#-----------------------------------------------------------

# Copy the Laravel API environment file
env:
	cp .env.example .env

# PHP composer autoload command
autoload:
	docker-compose exec -u1000 php composer dump-autoload

# Install the environment
install: build env composer-install


#-----------------------------------------------------------
# Clearing
#-----------------------------------------------------------

# Shut down and remove all volumes
remove-volumes:
	docker-compose down --volumes

# Remove all existing networks (useful if network already exists with the same attributes)
prune-networks:
	docker network prune
