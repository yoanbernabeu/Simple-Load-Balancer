# Makefile for the simple load balancer project

# Variables
IMAGE_NAME := yoanbernabeu/simple-load-balancer
TAG := latest
CONTAINER_NAME := haproxy-container

# Variables for demo
DEMO_IMAGE_NAME := yoanbernabeu/simple-load-balancer-demo
DEMO_PORT1 := 8081
DEMO_PORT2 := 8082

# Build the docker image
build:
	@docker build -t $(IMAGE_NAME):$(TAG) ./LoadBalancer
	@docker build -t $(DEMO_IMAGE_NAME) ./Demo

# Push the docker image
push:
	@docker push $(IMAGE_NAME):$(TAG)
	@docker push $(DEMO_IMAGE_NAME):$(TAG)

# Pull the docker image
pull:
	@docker pull $(IMAGE_NAME):$(TAG)
	@docker pull $(DEMO_IMAGE_NAME):$(TAG)

# Run the demo (without https)
run-local:
	@make build
	@docker compose up -d

# Stop the demo
stop:
	@docker compose down

# Default target
.PHONY: build push pull run-local stop
