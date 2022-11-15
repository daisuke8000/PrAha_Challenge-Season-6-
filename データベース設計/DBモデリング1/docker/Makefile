include .env_mysql_docker
# Up on the daemon
up:
	docker-compose up -d
# up and rebuild
up-build:
	docker-compose up -d --build
# build
build:
	docker-compose build
# stop
stop:
	docker-compose stop
# down
down:
	docker-compose down

# shell
shell:
	docker-compose exec db /bin/sh -c "mysql -u ${MYSQL_USER} -p${MYSQL_PASSWORD} -h 127.0.0.1"

# prune
system-prune:
	docker system prune
container-prune:
	docker container prune
network-prune:
	docker network prune
builder-prune:
	docker builder prune
images-prune:
	docker image prune

.PHONY: up, up-build, build, stop, down, container-prune, network-prune, builder-prune, images-prune