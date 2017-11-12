## Playbooks и их roles
### develop -- собрать и запустить dev-версию проекта
- clone-repos

### make-images -- собрать указанную версию проекта в докеры и запушить в registry
- clone-repos
- make-and-push-images

### deploy-and-run-images -- на сервере настроить и запустить проект
- user-present
- run-utils-present
- configure-and-run-apps
