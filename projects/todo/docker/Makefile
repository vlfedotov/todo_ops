
DOCKER_COMPOSE_FILE := ./docker-compose.yml

.PHONY: login logout pull configure start stop restart

login:
	docker login -u $(DOCKER_USER) -p $(DOCKER_PASSWORD) # $(DOCKER_REGISTRY)

logout:
	docker logout $(DOCKER_REGISTRY)

pull:
	docker-compose -f $(DOCKER_COMPOSE_FILE) pull

configure:
	docker-compose -f $(DOCKER_COMPOSE_FILE) run --rm todo_crm python manage.py migrate --noinput
	docker-compose -f $(DOCKER_COMPOSE_FILE) run --rm todo_todo python manage.py migrate --noinput
	docker-compose -f $(DOCKER_COMPOSE_FILE) run --rm todo_crm python manage.py collectstatic --noinput
	docker-compose -f $(DOCKER_COMPOSE_FILE) run --rm todo_todo python manage.py collectstatic --noinput

start:
	docker-compose -f $(DOCKER_COMPOSE_FILE) up -d

stop:
	docker-compose -f $(DOCKER_COMPOSE_FILE) down

restart:
	docker-compose -f $(DOCKER_COMPOSE_FILE) restart
