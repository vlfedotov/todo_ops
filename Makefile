TEST_DOCKER = "projects/todo/docker/ci_api/docker-compose.yml" 

.PHONY: .get-branch-name .clone-repos test-build test

.get-branch-name:
	echo "BRANCH=`git rev-parse --abbrev-ref HEAD`" > .env

.clone-repos:
	git clone git@github.com:vlfedotov/todo_crm.git@`git rev-parse --abbrev-ref HEAD` projects/todo/apps/todo_crm
	git clone git@github.com:vlfedotov/todo_todo.git@`git rev-parse --abbrev-ref HEAD` projects/todo/apps/todo_todo

test-build:
	docker-compose -f ${TEST_DOCKER} build --pull

test:
	docker-compose -f ${TEST_DOCKER} run --rm todo_crm pytest

clean:
	docker-compose -f ${TEST_DOCKER} rm todo_crm
