TEST_DOCKER = "projects/todo/docker/ci_api/docker-compose.yml" 

.PHONY: test-build test

.clone-repos:
	git clone git@github.com:vlfedotov/todo_crm.git projects/todo/apps/todo_crm
	git clone git@github.com:vlfedotov/todo_todo.git projects/todo/apps/todo_todo

.checkout-branch:
	git co lalala

test-build:
	docker-compose -f ${TEST_DOCKER} build --pull

test:
	docker-compose -f ${TEST_DOCKER} run --rm todo_crm pytest

clean:
	docker-compose -f ${TEST_DOCKER} rm todo_crm
