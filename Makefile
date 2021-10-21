.PHONY: build deploy

REMOTE_USERNAME := datenworks
APP_NAME := cp-kafka-connect

build:
	docker build -t ${REMOTE_REGISTRY}/${REMOTE_USERNAME}/${APP_NAME}:latest .

push:
	docker push ${REMOTE_USERNAME}/${APP_NAME}:latest

deploy: build push