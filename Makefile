IMAGE_NAME:=go-remote-debug
CONTAINER_NAME:=${IMAGE_NAME}

.PHONY: image start stop exec_shell debug

image:
	docker build -t ${IMAGE_NAME} .

start:
	docker run -d --rm --name ${CONTAINER_NAME} ${IMAGE_NAME}
	@echo Container IP:
	@docker inspect -f "{{ .NetworkSettings.IPAddress }}" go-remote-debug

stop:
	docker stop -t 0 ${CONTAINER_NAME}

watch:
	docker logs ${CONTAINER_NAME} -f
