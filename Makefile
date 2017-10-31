TEST_DOCKER = "docker/test/docker-compose.yml" 
DEVELOP_DOCKER = "docker/develop/docker-compose.yml" 

.PHONY: test-build test

test-build:
	docker-compose -f ${TEST_DOCKER} build --pull

test:
	docker-compose -f ${TEST_DOCKER} run --rm todo_crm pytest

clean:
	docker-compose -f ${TEST_DOCKER} rm todo_crm


.PHONY: develop-build up start status stop restart

develop-build:
	docker-compose -f ${DEVELOP_DOCKER} build --pull

up:
	docker-compose -f ${DEVELOP_DOCKER} up

start:
	docker-compose -f ${DEVELOP_DOCKER} up -d

status:
	docker-compose -f ${DEVELOP_DOCKER} ps

stop:
	docker-compose -f ${DEVELOP_DOCKER} down

restart:
	docker-compose -f ${DEVELOP_DOCKER} restart

