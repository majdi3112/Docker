#!/bin/bash
set -e

# Container naam en image tag
CONTAINER_NAME="demo-container"
IMAGE_TAG="demo-site:latest"

# Bouw de Docker image met tag demo-site:latest
docker build -t ${IMAGE_TAG} .

# Stop een eventueel bestaande container met dezelfde naam
docker stop ${CONTAINER_NAME} || true
docker rm ${CONTAINER_NAME} || true

# Start een nieuwe container
docker run -d -t -p 81:80 --name ${CONTAINER_NAME} ${IMAGE_TAG} 