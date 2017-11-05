TEST_DOCKER = "projects/todo/docker/ci_api/docker-compose.yml" 

.PHONY: .clone-repos test-build test status

.clone-repos:
	git clone -b `git rev-parse --abbrev-ref HEAD` git@github.com:vlfedotov/todo_crm.git projects/todo/apps/todo_crm
	git clone -b `git rev-parse --abbrev-ref HEAD` git@github.com:vlfedotov/todo_todo.git projects/todo/apps/todo_todo

test-build: .clone-repos
	docker-compose -f ${TEST_DOCKER} build --pull

test:
	docker-compose -f ${TEST_DOCKER} up postman_test
	${CHECK} ${TEST_DOCKER} postman_test

clean:
	docker-compose -f ${TEST_DOCKER} down

status:
	docker-compose -f ${TEST_DOCKER} ps

INSPECT := $$(docker-compose -f $$1 ps -q $$2 | xargs -I ARGS docker inspect -f "{{ .State.ExitCode }}" ARGS)

CHECK := @bash -c '\
	if [[ $(INSPECT) -ne 0 ]]; \
	then exit $(INSPECT); fi' VALUE
