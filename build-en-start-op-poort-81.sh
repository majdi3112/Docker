#!/bin/bash
set -e


CONTAINER_NAME="demo-container"
IMAGE_TAG="demo-site:latest"

docker build -t ${IMAGE_TAG} .

docker stop ${CONTAINER_NAME} || true
docker rm ${CONTAINER_NAME} || true


docker run -d -t -p 81:80 --name ${CONTAINER_NAME} ${IMAGE_TAG} 
