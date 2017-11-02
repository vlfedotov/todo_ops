include .env

DOCKER_COMPOSE = "docker/${ROLE}/docker-compose.yml" 

.PHONY: login logout

login:
	docker login -u ${DOCKER_USER} -p ${DOCKER_PASSWORD} # ${DOCKER_REGISTRY} 

logout:
	docker logout ${DOCKER_REGISTRY}

.PHONY: build up start

build:
	docker-compose -f ${DOCKER_COMPOSE} build --pull

up:
	docker-compose -f ${DOCKER_COMPOSE} up

start:
	docker-compose -f ${DOCKER_COMPOSE} up -d

restart:
	docker-compose -f ${DOCKER_COMPOSE} restart

stop:
	docker-compose -f ${DOCKER_COMPOSE} down
