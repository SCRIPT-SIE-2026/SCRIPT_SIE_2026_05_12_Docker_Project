IMAGE_NAME = my-app
IMAGE_TAG = latest
CONTAINER_NAME = my-app-dev

.PHONY: help build run shell stop logs clean rebuild bash

help:
	@echo "Available targets:"
	@echo "  make build    -> build the Docker image"
	@echo "  make run      -> start the container"
	@echo "  make shell    -> open a shell in the image"
	@echo "  make stop     -> stop the container"
	@echo "  make logs     -> show the logs"
	@echo "  make clean    -> remove the container"
	@echo "  make rebuild  -> rebuild the image without cache"

build:
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .

run:
	docker run --rm -d \
		--name $(CONTAINER_NAME) \
		$(IMAGE_NAME):$(IMAGE_TAG)

shell:
	docker run --rm -it \
		--name $(CONTAINER_NAME)-shell \
		$(IMAGE_NAME):$(IMAGE_TAG) \
		sh

bash:
	docker run --rm -it \
		--name $(CONTAINER_NAME)-bash \
		$(IMAGE_NAME):$(IMAGE_TAG) \
		bash

stop:
	docker stop $(CONTAINER_NAME)

logs:
	docker logs -f $(CONTAINER_NAME)

clean:
	-docker rm -f $(CONTAINER_NAME)

rebuild:
	docker build --no-cache -t $(IMAGE_NAME):$(IMAGE_TAG) .