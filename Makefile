REGISTRY := ghcr.io
OWNER := giacomolanciano
NAME := devcontainer-latex
TAG := $(shell cat VERSION.txt)

.PHONY: build push info

build:
	docker build -t $(REGISTRY)/$(OWNER)/$(NAME):$(TAG) .

push:
	docker push $(REGISTRY)/$(OWNER)/$(NAME):$(TAG)

info:
	$(info Build utilities for '$(REGISTRY)/$(OWNER)/$(NAME):$(TAG)')
