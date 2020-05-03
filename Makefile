.PHONY: build

CENTOS_VERSION := latest

.PHONY: build pull all

all: pull build

build:
	docker build -t harbor.lnxsystems.com/jnvilo/docker-crontabs:latest .

pull:
	docker  pull centos:${CENTOS_VERSION}


kill:
	 docker ps | grep jnvilo/docker-crontabs | cut -d " " -f 1| xargs docker kill

debug: pull build run

shell:
	docker exec -it $(docker ps | grep jnvilo/docker-crontabs | cut -d " " -f 1) /bin/bash

push:
	docker push harbor.lnxsystems.com/jnvilo/docker-crontabs:latest
